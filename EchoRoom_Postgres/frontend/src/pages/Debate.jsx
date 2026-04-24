import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import Navbar from "../components/navbar";
import { authFetch, getAccessToken, logoutAndRedirect } from "../lib/auth";

const API_BASE = import.meta.env.VITE_API_BASE_URL || "";

function OpinionCard({ opinion, onVote, onReply, onEdit, onDelete, onReport, readOnly }) {
  const [hovered, setHovered] = useState(false);
  const [showReplyBox, setShowReplyBox] = useState(false);
  const [replyText, setReplyText] = useState("");
  const [showReplies, setShowReplies] = useState(true);
  const [isEditing, setIsEditing] = useState(false);
  const [editText, setEditText] = useState(opinion.text);
  const canInteract = !readOnly;
  const isFor = opinion.stance === "FOR";

  const sentimentEmoji = opinion.sentiment_score > 0.05 ? "🙂 Positive" : opinion.sentiment_score < -0.05 ? "😠 Critical" : "😐 Neutral";

  return (
    <div onMouseEnter={() => setHovered(true)} onMouseLeave={() => setHovered(false)}
      style={{ background: hovered ? "rgba(255,255,255,0.07)" : "rgba(255,255,255,0.03)", border: `1px solid ${hovered ? isFor ? "rgba(126,200,200,0.25)" : "rgba(244,167,185,0.25)" : "rgba(255,255,255,0.07)"}`, borderLeft: `3px solid ${isFor ? "#7EC8C8" : "#F4A7B9"}`, borderRadius: 14, padding: "20px 22px", transition: "all 0.2s", animation: "fadeSlideIn 0.4s ease both" }}>
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 14 }}>
        <div style={{ display: "flex", alignItems: "center", gap: 10 }}>
          <div style={{ width: 34, height: 34, borderRadius: "50%", background: `${opinion.avatarColor}25`, border: `1px solid ${opinion.avatarColor}50`, display: "flex", alignItems: "center", justifyContent: "center", color: opinion.avatarColor, fontWeight: 700, fontSize: 14, fontFamily: "'Space Mono',monospace" }}>{opinion.avatar}</div>
          <div>
            <div style={{ color: "#f0ecff", fontSize: 14, fontWeight: 600 }}>{opinion.author}</div>
            <div style={{ color: "rgba(240,236,255,0.3)", fontSize: 11, fontFamily: "'Space Mono',monospace" }}>{opinion.timeAgo}</div>
          </div>
        </div>
        <div style={{display: "flex", gap: "10px"}}>
            <div style={{ background: "rgba(255,255,255,0.05)", border: `1px solid rgba(255,255,255,0.1)`, color: "#aaa", borderRadius: 6, padding: "3px 12px", fontSize: 11, fontWeight: 700, letterSpacing: 1.2, fontFamily: "'Space Mono',monospace" }}>
              {sentimentEmoji}
            </div>
            <div style={{ background: isFor ? "rgba(126,200,200,0.12)" : "rgba(244,167,185,0.12)", border: `1px solid ${isFor ? "rgba(126,200,200,0.3)" : "rgba(244,167,185,0.3)"}`, color: isFor ? "#7EC8C8" : "#F4A7B9", borderRadius: 6, padding: "3px 12px", fontSize: 11, fontWeight: 700, letterSpacing: 1.2, fontFamily: "'Space Mono',monospace" }}>
              {isFor ? "✓ FOR" : "✗ AGAINST"}
            </div>
        </div>
      </div>
      <p style={{ color: "rgba(240,236,255,0.82)", fontSize: 15, lineHeight: 1.7, fontFamily: "'Space Grotesk',sans-serif", marginBottom: 16 }}>{opinion.text}</p>
      <div style={{ display: "flex", alignItems: "center", gap: 12, flexWrap: "wrap" }}>
        <button
          disabled={!canInteract}
          onClick={() => canInteract && onVote(opinion.id, "up")}
          style={{ display: "flex", alignItems: "center", gap: 6, background: opinion.userVote === "up" ? "rgba(126,200,200,0.15)" : "transparent", border: `1px solid ${opinion.userVote === "up" ? "rgba(126,200,200,0.4)" : "rgba(255,255,255,0.1)"}`, color: opinion.userVote === "up" ? "#7EC8C8" : "rgba(240,236,255,0.4)", borderRadius: 7, padding: "5px 12px", cursor: canInteract ? "pointer" : "not-allowed", fontSize: 13, fontFamily: "'Space Mono',monospace", transition: "all 0.2s" }}
        >▲ {opinion.upvotes}</button>
        <button
          disabled={!canInteract}
          onClick={() => canInteract && onVote(opinion.id, "down")}
          style={{ display: "flex", alignItems: "center", gap: 6, background: opinion.userVote === "down" ? "rgba(244,167,185,0.15)" : "transparent", border: `1px solid ${opinion.userVote === "down" ? "rgba(244,167,185,0.4)" : "rgba(255,255,255,0.1)"}`, color: opinion.userVote === "down" ? "#F4A7B9" : "rgba(240,236,255,0.4)", borderRadius: 7, padding: "5px 12px", cursor: canInteract ? "pointer" : "not-allowed", fontSize: 13, fontFamily: "'Space Mono',monospace", transition: "all 0.2s" }}
        >▼ {opinion.downvotes}</button>
        {canInteract && (
          <button onClick={() => setShowReplyBox(!showReplyBox)} style={{ background: "transparent", border: "none", color: "rgba(240,236,255,0.35)", cursor: "pointer", fontSize: 13, fontFamily: "'Space Mono',monospace" }}>
            💬 Reply
          </button>
        )}
        {canInteract && opinion.isMine && (
          <>
            <button onClick={() => setIsEditing((v) => !v)} style={{ background: "transparent", border: "none", color: "rgba(240,236,255,0.35)", cursor: "pointer", fontSize: 13, fontFamily: "'Space Mono',monospace" }}>
              ✏ Edit
            </button>
            <button onClick={() => onDelete(opinion.id)} style={{ background: "transparent", border: "none", color: "rgba(244,167,185,0.65)", cursor: "pointer", fontSize: 13, fontFamily: "'Space Mono',monospace" }}>
              Delete
            </button>
          </>
        )}
        {canInteract && !opinion.isMine && (
          <button onClick={() => onReport(opinion.id)} style={{ background: "transparent", border: "none", color: "rgba(249,199,132,0.65)", cursor: "pointer", fontSize: 13, fontFamily: "'Space Mono',monospace" }}>
            🚩 Report
          </button>
        )}
        {opinion.replies.length > 0 && <button onClick={() => setShowReplies(!showReplies)} style={{ background: "transparent", border: "none", color: "rgba(240,236,255,0.3)", cursor: "pointer", fontSize: 12, fontFamily: "'Space Mono',monospace", marginLeft: "auto" }}>{showReplies ? "▾" : "▸"} {opinion.replies.length} {opinion.replies.length === 1 ? "reply" : "replies"}</button>}
      </div>
      {isEditing && canInteract && opinion.isMine && (
        <div style={{ marginTop: 14, display: "flex", gap: 10 }}>
          <input value={editText} onChange={(e) => setEditText(e.target.value)} style={{ flex: 1, background: "rgba(255,255,255,0.05)", border: "1px solid rgba(255,255,255,0.1)", borderRadius: 8, padding: "10px 14px", color: "#f0ecff", fontSize: 13, fontFamily: "'Space Grotesk',sans-serif", outline: "none" }} />
          <button onClick={async () => { await onEdit(opinion.id, editText); setIsEditing(false); }} style={{ background: "linear-gradient(135deg,#7EC8C8,#a8dede)", border: "none", color: "#1a1625", borderRadius: 8, padding: "10px 18px", fontWeight: 700, cursor: "pointer", fontSize: 13, fontFamily: "'Space Grotesk',sans-serif" }}>Save</button>
        </div>
      )}
      {canInteract && showReplyBox && (
        <div style={{ marginTop: 14, display: "flex", gap: 10 }}>
          <input value={replyText} onChange={(e) => setReplyText(e.target.value)} placeholder="Write a reply..." style={{ flex: 1, background: "rgba(255,255,255,0.05)", border: "1px solid rgba(255,255,255,0.1)", borderRadius: 8, padding: "10px 14px", color: "#f0ecff", fontSize: 13, fontFamily: "'Space Grotesk',sans-serif", outline: "none" }} />
          <button onClick={() => { onReply(opinion.id, replyText); setReplyText(""); setShowReplyBox(false); }} style={{ background: "linear-gradient(135deg,#7EC8C8,#a8dede)", border: "none", color: "#1a1625", borderRadius: 8, padding: "10px 18px", fontWeight: 700, cursor: "pointer", fontSize: 13, fontFamily: "'Space Grotesk',sans-serif" }}>Post</button>
        </div>
      )}
      {showReplies && opinion.replies.length > 0 && (
        <div style={{ marginTop: 16, paddingLeft: 16, borderLeft: "2px solid rgba(255,255,255,0.06)" }}>
          {opinion.replies.map((reply) => (
            <div key={reply.id} style={{ display: "flex", gap: 10, marginBottom: 12, padding: "12px 14px", background: "rgba(255,255,255,0.03)", borderRadius: 10 }}>
              <div style={{ width: 28, height: 28, borderRadius: "50%", flexShrink: 0, background: `${reply.avatarColor}22`, border: `1px solid ${reply.avatarColor}44`, display: "flex", alignItems: "center", justifyContent: "center", color: reply.avatarColor, fontWeight: 700, fontSize: 12 }}>{reply.avatar}</div>
              <div>
                <div style={{ display: "flex", gap: 8, alignItems: "center", marginBottom: 4 }}>
                  <span style={{ color: "#f0ecff", fontSize: 13, fontWeight: 600 }}>{reply.author}</span>
                  <span style={{ color: "rgba(240,236,255,0.25)", fontSize: 11, fontFamily: "'Space Mono',monospace" }}>{reply.timeAgo}</span>
                </div>
                <p style={{ color: "rgba(240,236,255,0.6)", fontSize: 13, lineHeight: 1.6 }}>{reply.text}</p>
                {canInteract && reply.isMine && (
                  <button onClick={() => onDelete(reply.id)} style={{ marginTop: 6, background: "transparent", border: "none", color: "rgba(244,167,185,0.65)", cursor: "pointer", fontSize: 11, fontFamily: "'Space Mono',monospace", padding: 0 }}>
                    Delete reply
                  </button>
                )}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

export default function Debate() {
  const navigate = useNavigate();
  const { id } = useParams();
  const accessToken = getAccessToken();
  const readOnly = !accessToken;

  const [opinions, setOpinions] = useState([]);
  const [activeTab, setActiveTab] = useState("ALL");
  const [newOpinion, setNewOpinion] = useState("");
  const [selectedStance, setSelectedStance] = useState("AUTO");
  const [sortBy, setSortBy] = useState("top");

  const [aiSummary, setAiSummary] = useState("");
  const [chatOpen, setChatOpen] = useState(false);
  const [chatQuery, setChatQuery] = useState("");
  const [chatHistory, setChatHistory] = useState([]);

  const [debate, setDebate] = useState({
    id: 0,
    category: "",
    categoryColor: "#7EC8C8",
    title: "",
    description: "",
    forVotes: 0,
    againstVotes: 0,
    createdBy: "",
    timeAgo: "",
  });
  const [loading, setLoading] = useState(false);
  const [actionError, setActionError] = useState("");
  const [infoMessage, setInfoMessage] = useState("");

  const loadDebate = async () => {
    if (!id) return;
    setLoading(true);
    const headers = accessToken
      ? { Authorization: `Bearer ${accessToken}` }
      : {};
    try {
      const [topicRes, opinionsRes] = await Promise.all([
        fetch(`${API_BASE}/api/debates/topics/${id}/`, { headers }),
        fetch(`${API_BASE}/api/debates/topics/${id}/opinions/`, { headers }),
      ]);

      if (!topicRes.ok) throw new Error(`Topic fetch failed: ${topicRes.status}`);
      if (!opinionsRes.ok) throw new Error(`Opinions fetch failed: ${opinionsRes.status}`);

      const topicJson = await topicRes.json();
      const opinionsJson = await opinionsRes.json();

      setDebate({
        id: topicJson.id,
        category: topicJson.category,
        categoryColor: topicJson.categoryColor,
        title: topicJson.title,
        description: topicJson.description,
        forVotes: topicJson.forVotes,
        againstVotes: topicJson.againstVotes,
        createdBy: topicJson.createdBy,
        timeAgo: topicJson.timeAgo,
      });
      setOpinions(opinionsJson);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadDebate();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id]);

  const total = debate.forVotes + debate.againstVotes;
  const forPct = total > 0 ? Math.round((debate.forVotes / total) * 100) : 0;

  // Calculate Debate Mood
  const posCount = opinions.filter(o => o.sentiment_score > 0.05).length;
  const negCount = opinions.filter(o => o.sentiment_score < -0.05).length;
  const totalSentiments = posCount + negCount;
  const moodPosPct = totalSentiments > 0 ? Math.round((posCount / totalSentiments) * 100) : 50;

  const handleVote = async (opinionId, direction) => {
    if (readOnly) return;
    setActionError("");

    const current = opinions.find((o) => o.id === opinionId);
    const finalDirection = current?.userVote === direction ? "clear" : direction;
    const res = await authFetch(`${API_BASE}/api/debates/opinions/${opinionId}/vote/`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ direction: finalDirection }),
    });
    if (res.status === 401) return logoutAndRedirect(navigate);

    if (!res.ok) {
      const json = await res.json().catch(() => ({}));
      const detail = json?.detail || `Vote failed (${res.status})`;
      setActionError(String(detail));
      return;
    }

    await loadDebate();
  };

  const handleReply = async (opinionId, text) => {
    if (!text.trim()) return;
    if (readOnly) return;
    setActionError("");

    const trimmed = text.trim();
    const res = await authFetch(
      `${API_BASE}/api/debates/opinions/${opinionId}/replies/create/`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ content: trimmed }),
      }
    );
    if (res.status === 401) return logoutAndRedirect(navigate);

    if (!res.ok) {
      const json = await res.json().catch(() => ({}));
      const detail = json?.detail || `Reply failed (${res.status})`;
      setActionError(String(detail));
      return;
    }

    await loadDebate();
  };

  const handlePost = async () => {
    if (!newOpinion.trim() || !selectedStance) return;
    if (readOnly) return;
    setActionError("");
    setInfoMessage("Posting and analyzing sentiment...");

    const trimmed = newOpinion.trim();
    const res = await authFetch(`${API_BASE}/api/debates/topics/${id}/opinions/create/`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        stance: selectedStance,
        content: trimmed,
      }),
    });
    if (res.status === 401) return logoutAndRedirect(navigate);

    if (!res.ok) {
      const json = await res.json().catch(() => ({}));
      const detail = json?.detail || `Post failed (${res.status})`;
      setActionError(String(detail));
      setInfoMessage("");
      return;
    }

    const data = await res.json();
    setNewOpinion("");
    setSelectedStance("AUTO");
    setInfoMessage(`Posted! AI auto-detected stance as: ${data.stance}`);
    await loadDebate();
  };

  const handleEdit = async (opinionId, content) => {
    if (!content.trim()) return;
    const res = await authFetch(`${API_BASE}/api/debates/opinions/${opinionId}/`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ content: content.trim() }),
    });
    if (res.status === 401) return logoutAndRedirect(navigate);
    if (!res.ok) return;
    await loadDebate();
  };

  const handleDelete = async (opinionId) => {
    const res = await authFetch(`${API_BASE}/api/debates/opinions/${opinionId}/`, {
      method: "DELETE",
    });
    if (res.status === 401) return logoutAndRedirect(navigate);
    if (!res.ok && res.status !== 204) return;
    await loadDebate();
  };

  const handleReport = async (opinionId) => {
    const res = await authFetch(`${API_BASE}/api/debates/opinions/${opinionId}/report/`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ reason: "Reported by user" }),
    });
    if (res.status === 401) return logoutAndRedirect(navigate);
    if (!res.ok) return;
    setActionError("Opinion reported for admin review.");
  };

  // --- AI Features ---

  const handleGenerate = async () => {
    setActionError("");
    setInfoMessage("Generating argument with Bedrock AI...");
    const res = await authFetch(`${API_BASE}/api/debates/ai/generate-argument/`, {
       method: "POST", headers: {"Content-Type": "application/json"},
       body: JSON.stringify({topic_title: debate.title, stance: selectedStance === "AUTO" ? "FOR" : selectedStance})
    });
    if (res.ok) {
        const data = await res.json();
        setNewOpinion(data.argument);
        setInfoMessage("");
    } else {
        setActionError("Failed to generate argument.");
        setInfoMessage("");
    }
  };

  const handleEnhance = async () => {
    if (!newOpinion.trim()) return;
    setActionError("");
    setInfoMessage("Enhancing argument with Bedrock AI...");
    const res = await authFetch(`${API_BASE}/api/debates/ai/enhance-argument/`, {
       method: "POST", headers: {"Content-Type": "application/json"},
       body: JSON.stringify({content: newOpinion})
    });
    if (res.ok) {
        const data = await res.json();
        setNewOpinion(data.enhanced);
        setInfoMessage("");
    } else {
        setActionError("Failed to enhance argument.");
        setInfoMessage("");
    }
  };

  const handleSummarize = async () => {
    setAiSummary("Summarizing debate with Bedrock AI...");
    const res = await fetch(`${API_BASE}/api/debates/topics/${id}/summary/`, { method: "POST" });
    if (res.ok) {
        const data = await res.json();
        setAiSummary(data.summary);
    } else {
        setAiSummary("Failed to generate summary.");
    }
  };

  const handleSendChat = async () => {
    if (!chatQuery.trim()) return;
    const q = chatQuery;
    setChatQuery("");
    setChatHistory([...chatHistory, {role: 'user', text: q}]);
    
    const res = await authFetch(`${API_BASE}/api/debates/ai/chat/`, {
       method: "POST", headers: {"Content-Type": "application/json"},
       body: JSON.stringify({topic_title: debate.title, question: q})
    });
    if (res.ok) {
        const data = await res.json();
        setChatHistory(prev => [...prev, {role: 'ai', text: data.answer}]);
    } else {
        setChatHistory(prev => [...prev, {role: 'ai', text: "Error connecting to AI."}]);
    }
  };

  const filtered = opinions.filter((o) => activeTab === "ALL" || o.stance === activeTab).sort((a, b) => {
    if (sortBy === "top") return (b.upvotes - b.downvotes) - (a.upvotes - a.downvotes);
    if (sortBy === "new") return b.id - a.id;
    if (sortBy === "positive") return (b.sentiment_score || 0) - (a.sentiment_score || 0);
    if (sortBy === "critical") return (a.sentiment_score || 0) - (b.sentiment_score || 0);
    return 0;
  });

  return (
    <div style={{ minHeight: "100vh", background: "#1a1625", fontFamily: "'Space Grotesk',sans-serif", color: "#f0ecff" }}>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=Lora:wght@600;700&family=Space+Mono:wght@400;700&family=Space+Grotesk:wght@300;400;500;600;700&display=swap');
        * { box-sizing:border-box; margin:0; padding:0; }
        @keyframes fadeSlideIn { from{opacity:0;transform:translateY(14px)} to{opacity:1;transform:translateY(0)} }
        textarea::placeholder,input::placeholder{color:rgba(240,236,255,0.2)} textarea:focus,input:focus{outline:none}
        ::-webkit-scrollbar{width:4px} ::-webkit-scrollbar-thumb{background:rgba(255,255,255,0.1);border-radius:2px}
      `}</style>
      <Navbar />
      <main style={{ maxWidth: 800, margin: "0 auto", padding: "40px 24px 80px" }}>
        <button onClick={() => navigate("/")} style={{ background: "transparent", border: "none", color: "rgba(240,236,255,0.35)", cursor: "pointer", fontSize: 13, fontFamily: "'Space Mono',monospace", marginBottom: 24, padding: 0, display: "flex", alignItems: "center", gap: 6 }}>← Back to debates</button>

        {/* Header */}
        <div style={{ background: "rgba(255,255,255,0.04)", border: "1px solid rgba(255,255,255,0.08)", borderRadius: 20, padding: "32px 36px", marginBottom: 32, animation: "fadeSlideIn 0.5s ease both" }}>
          <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 14 }}>
            <span style={{ background: `${debate.categoryColor}22`, color: debate.categoryColor, border: `1px solid ${debate.categoryColor}44`, borderRadius: 6, padding: "3px 12px", fontSize: 11, fontWeight: 700, letterSpacing: 1.2, textTransform: "uppercase", fontFamily: "'Space Mono',monospace" }}>{debate.category}</span>
            <span style={{ color: "rgba(240,236,255,0.3)", fontSize: 12, fontFamily: "'Space Mono',monospace" }}>{debate.timeAgo} · by {debate.createdBy}</span>
          </div>
          <h1 style={{ fontFamily: "'Lora',serif", fontSize: "clamp(22px,3vw,30px)", fontWeight: 700, lineHeight: 1.3, marginBottom: 14, color: "#f0ecff" }}>{debate.title}</h1>
          <p style={{ color: "rgba(240,236,255,0.45)", fontSize: 14, lineHeight: 1.7, marginBottom: 28 }}>{debate.description}</p>
          
          {/* AI Summarize Button */}
          <div style={{ marginBottom: 28 }}>
            {!aiSummary ? (
                <button onClick={handleSummarize} style={{ background: "rgba(255,215,0,0.1)", border: "1px solid rgba(255,215,0,0.3)", color: "#ffd700", borderRadius: 8, padding: "8px 16px", cursor: "pointer", fontSize: 13, fontWeight: 700, fontFamily: "'Space Mono',monospace" }}>✨ AI Summarize Debate</button>
            ) : (
                <div style={{ background: "rgba(255,215,0,0.05)", border: "1px solid rgba(255,215,0,0.2)", borderRadius: 12, padding: "16px", color: "rgba(240,236,255,0.85)", fontSize: 14, lineHeight: 1.6 }}>
                    <strong style={{color: "#ffd700", display: "block", marginBottom: 8}}>🤖 Bedrock Summary:</strong>
                    {aiSummary}
                </div>
            )}
          </div>

          <div style={{ display: "flex", gap: "40px", flexWrap: "wrap" }}>
              <div style={{ flex: 1, minWidth: "200px" }}>
                <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 8 }}>
                  <div><span style={{ color: "#7EC8C8", fontFamily: "'Space Mono',monospace", fontSize: 20, fontWeight: 700 }}>{forPct}%</span><span style={{ color: "rgba(240,236,255,0.3)", fontSize: 12, marginLeft: 6 }}>FOR</span></div>
                  <div style={{ textAlign: "right" }}><span style={{ color: "#F4A7B9", fontFamily: "'Space Mono',monospace", fontSize: 20, fontWeight: 700 }}>{100 - forPct}%</span><span style={{ color: "rgba(240,236,255,0.3)", fontSize: 12, marginLeft: 6 }}>AGAINST</span></div>
                </div>
                <div style={{ height: 8, borderRadius: 4, background: "rgba(255,255,255,0.08)", overflow: "hidden", display: "flex" }}>
                  <div style={{ width: `${forPct}%`, background: "linear-gradient(90deg,#7EC8C8,#a8dede)", borderRadius: "4px 0 0 4px" }} />
                  <div style={{ width: `${100 - forPct}%`, background: "linear-gradient(90deg,#F4A7B9,#f7c5d0)", borderRadius: "0 4px 4px 0" }} />
                </div>
                <div style={{ textAlign: "center", marginTop: 10, color: "rgba(240,236,255,0.25)", fontSize: 12, fontFamily: "'Space Mono',monospace" }}>{total.toLocaleString()} total votes</div>
              </div>

              {/* Debate Mood Indicator */}
              <div style={{ flex: 1, minWidth: "200px" }}>
                <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 8 }}>
                  <div><span style={{ color: "#ffd700", fontFamily: "'Space Mono',monospace", fontSize: 20, fontWeight: 700 }}>{moodPosPct}%</span><span style={{ color: "rgba(240,236,255,0.3)", fontSize: 12, marginLeft: 6 }}>POSITIVE</span></div>
                  <div style={{ textAlign: "right" }}><span style={{ color: "#ff6b6b", fontFamily: "'Space Mono',monospace", fontSize: 20, fontWeight: 700 }}>{100 - moodPosPct}%</span><span style={{ color: "rgba(240,236,255,0.3)", fontSize: 12, marginLeft: 6 }}>CRITICAL</span></div>
                </div>
                <div style={{ height: 8, borderRadius: 4, background: "rgba(255,255,255,0.08)", overflow: "hidden", display: "flex" }}>
                  <div style={{ width: `${moodPosPct}%`, background: "linear-gradient(90deg,#ffd700,#ffea75)", borderRadius: "4px 0 0 4px" }} />
                  <div style={{ width: `${100 - moodPosPct}%`, background: "linear-gradient(90deg,#ff6b6b,#ff9e9e)", borderRadius: "0 4px 4px 0" }} />
                </div>
                <div style={{ textAlign: "center", marginTop: 10, color: "rgba(240,236,255,0.25)", fontSize: 12, fontFamily: "'Space Mono',monospace" }}>Debate Mood (AI Detected)</div>
              </div>
          </div>
        </div>

        {!readOnly && (
          <div style={{ background: "rgba(255,255,255,0.04)", border: "1px solid rgba(255,255,255,0.08)", borderRadius: 16, padding: "24px", marginBottom: 32, animation: "fadeSlideIn 0.5s ease 0.1s both" }}>
            <h3 style={{ fontSize: 15, fontWeight: 600, marginBottom: 16, color: "rgba(240,236,255,0.8)" }}>Share your opinion</h3>
            
            {actionError && (
              <div style={{ marginBottom: 12, background: "rgba(244,167,185,0.1)", border: "1px solid rgba(244,167,185,0.3)", borderRadius: 8, padding: "10px 14px", color: "#F4A7B9", fontSize: 13, fontFamily: "'Space Mono',monospace" }}>
                Warning: {actionError}
              </div>
            )}
            {infoMessage && (
              <div style={{ marginBottom: 12, background: "rgba(126,200,200,0.1)", border: "1px solid rgba(126,200,200,0.3)", borderRadius: 8, padding: "10px 14px", color: "#7EC8C8", fontSize: 13, fontFamily: "'Space Mono',monospace" }}>
                {infoMessage}
              </div>
            )}

            <div style={{ display: "flex", gap: 10, marginBottom: 14 }}>
              {["AUTO", "FOR", "AGAINST"].map((stance) => (
                <button key={stance} onClick={() => setSelectedStance(stance)} style={{ flex: 1, padding: "10px", background: selectedStance === stance ? stance === "FOR" ? "rgba(126,200,200,0.15)" : stance === "AGAINST" ? "rgba(244,167,185,0.15)" : "rgba(255,215,0,0.15)" : "rgba(255,255,255,0.03)", border: `1px solid ${selectedStance === stance ? stance === "FOR" ? "rgba(126,200,200,0.4)" : stance === "AGAINST" ? "rgba(244,167,185,0.4)" : "rgba(255,215,0,0.4)" : "rgba(255,255,255,0.1)"}`, color: selectedStance === stance ? stance === "FOR" ? "#7EC8C8" : stance === "AGAINST" ? "#F4A7B9" : "#ffd700" : "rgba(240,236,255,0.35)", borderRadius: 10, cursor: "pointer", fontSize: 13, fontWeight: 700, letterSpacing: 1, fontFamily: "'Space Mono',monospace", transition: "all 0.2s" }}>
                  {stance === "FOR" ? "✓ FOR" : stance === "AGAINST" ? "✗ AGAINST" : "🤖 Auto-Detect"}
                </button>
              ))}
            </div>
            <textarea value={newOpinion} onChange={(e) => setNewOpinion(e.target.value)} placeholder="State your argument clearly and respectfully..." rows={4}
              style={{ width: "100%", background: "rgba(255,255,255,0.05)", border: "1px solid rgba(255,255,255,0.1)", borderRadius: 10, padding: "12px 16px", color: "#f0ecff", fontSize: 14, lineHeight: 1.6, fontFamily: "'Space Grotesk',sans-serif", resize: "vertical" }} />
            
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginTop: 12 }}>
              <div style={{display: "flex", gap: "8px"}}>
                  <button onClick={handleGenerate} style={{ background: "rgba(255,215,0,0.1)", border: "1px solid rgba(255,215,0,0.3)", color: "#ffd700", borderRadius: 8, padding: "6px 12px", cursor: "pointer", fontSize: 12, fontFamily: "'Space Mono',monospace" }}>✨ Generate</button>
                  <button onClick={handleEnhance} disabled={!newOpinion.trim()} style={{ background: "rgba(255,255,255,0.1)", border: "1px solid rgba(255,255,255,0.2)", color: "#fff", borderRadius: 8, padding: "6px 12px", cursor: newOpinion.trim() ? "pointer" : "not-allowed", fontSize: 12, fontFamily: "'Space Mono',monospace" }}>🪄 Enhance</button>
              </div>
              <button onClick={handlePost} disabled={!selectedStance || !newOpinion.trim()} style={{ background: selectedStance && newOpinion.trim() ? "linear-gradient(135deg,#7EC8C8,#a8dede)" : "rgba(255,255,255,0.07)", border: "none", color: selectedStance && newOpinion.trim() ? "#1a1625" : "rgba(240,236,255,0.2)", padding: "10px 24px", borderRadius: 9, fontWeight: 700, cursor: selectedStance && newOpinion.trim() ? "pointer" : "not-allowed", fontSize: 14, fontFamily: "'Space Grotesk',sans-serif", transition: "all 0.2s" }}>Post Opinion →</button>
            </div>
          </div>
        )}

        {/* Filters */}
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 20, flexWrap: "wrap", gap: 10 }}>
          <div style={{ display: "flex", gap: 6 }}>
            {["ALL", "FOR", "AGAINST"].map((tab) => (
              <button key={tab} onClick={() => setActiveTab(tab)} style={{ background: activeTab === tab ? tab === "FOR" ? "rgba(126,200,200,0.15)" : tab === "AGAINST" ? "rgba(244,167,185,0.15)" : "rgba(255,255,255,0.1)" : "transparent", border: `1px solid ${activeTab === tab ? tab === "FOR" ? "rgba(126,200,200,0.35)" : tab === "AGAINST" ? "rgba(244,167,185,0.35)" : "rgba(255,255,255,0.2)" : "rgba(255,255,255,0.07)"}`, color: activeTab === tab ? tab === "FOR" ? "#7EC8C8" : tab === "AGAINST" ? "#F4A7B9" : "#f0ecff" : "rgba(240,236,255,0.35)", borderRadius: 8, padding: "7px 16px", cursor: "pointer", fontSize: 12, fontWeight: 700, fontFamily: "'Space Mono',monospace", letterSpacing: 0.8, transition: "all 0.2s" }}>
                {tab} {tab === "ALL" ? `(${opinions.length})` : tab === "FOR" ? `(${opinions.filter(o => o.stance === "FOR").length})` : `(${opinions.filter(o => o.stance === "AGAINST").length})`}
              </button>
            ))}
          </div>
          <div style={{ display: "flex", gap: 6, flexWrap: "wrap" }}>
            {["top", "new", "positive", "critical"].map((s) => (
              <button key={s} onClick={() => setSortBy(s)} style={{ background: sortBy === s ? "rgba(255,255,255,0.08)" : "transparent", border: "1px solid rgba(255,255,255,0.08)", color: sortBy === s ? "#f0ecff" : "rgba(240,236,255,0.3)", borderRadius: 7, padding: "6px 13px", cursor: "pointer", fontSize: 12, fontFamily: "'Space Mono',monospace", textTransform: "uppercase", letterSpacing: 0.5 }}>{s}</button>
            ))}
          </div>
        </div>

        {/* Opinions */}
        <div style={{ display: "flex", flexDirection: "column", gap: 14 }}>
          {loading ? <div style={{ color: "rgba(240,236,255,0.35)", fontSize: 13 }}>Loading debate...</div> : filtered.map((opinion) => <OpinionCard key={opinion.id} opinion={opinion} onVote={handleVote} onReply={handleReply} onEdit={handleEdit} onDelete={handleDelete} onReport={handleReport} readOnly={readOnly} />)}
        </div>
      </main>

      {/* Floating AI Chat Assistant */}
      {!readOnly && (
        <div style={{ position: "fixed", bottom: 20, right: 20, zIndex: 1000, width: chatOpen ? 320 : 60, transition: "all 0.3s" }}>
            {!chatOpen ? (
                <button onClick={() => setChatOpen(true)} style={{ width: 60, height: 60, borderRadius: 30, background: "linear-gradient(135deg,#ffd700,#ffea75)", border: "none", cursor: "pointer", fontSize: 24, boxShadow: "0 4px 15px rgba(0,0,0,0.3)" }}>🤖</button>
            ) : (
                <div style={{ background: "#252035", border: "1px solid rgba(255,255,255,0.1)", borderRadius: 16, overflow: "hidden", boxShadow: "0 10px 30px rgba(0,0,0,0.5)", display: "flex", flexDirection: "column", height: 400 }}>
                    <div style={{ background: "rgba(255,255,255,0.05)", padding: "12px 16px", display: "flex", justifyContent: "space-between", alignItems: "center", borderBottom: "1px solid rgba(255,255,255,0.1)" }}>
                        <span style={{ fontSize: 14, fontWeight: 700 }}>🤖 AI Assistant</span>
                        <button onClick={() => setChatOpen(false)} style={{ background: "transparent", border: "none", color: "#aaa", cursor: "pointer" }}>✖</button>
                    </div>
                    <div style={{ flex: 1, padding: 16, overflowY: "auto", display: "flex", flexDirection: "column", gap: 10 }}>
                        <div style={{ background: "rgba(255,255,255,0.05)", padding: "10px", borderRadius: 10, fontSize: 13, alignSelf: "flex-start", maxWidth: "85%" }}>
                            Ask me anything about the debate: {debate.title}
                        </div>
                        {chatHistory.map((msg, i) => (
                            <div key={i} style={{ padding: "10px", borderRadius: 10, fontSize: 13, maxWidth: "85%", alignSelf: msg.role === 'user' ? "flex-end" : "flex-start", background: msg.role === 'user' ? "rgba(126,200,200,0.2)" : "rgba(255,215,0,0.1)", color: msg.role === 'user' ? "#7EC8C8" : "#ffd700" }}>
                                {msg.text}
                            </div>
                        ))}
                    </div>
                    <div style={{ padding: 10, borderTop: "1px solid rgba(255,255,255,0.1)", display: "flex", gap: 8 }}>
                        <input value={chatQuery} onChange={e => setChatQuery(e.target.value)} onKeyDown={e => e.key === "Enter" && handleSendChat()} placeholder="Type a message..." style={{ flex: 1, background: "rgba(255,255,255,0.05)", border: "none", color: "#fff", borderRadius: 8, padding: "8px 12px", outline: "none", fontSize: 13 }} />
                        <button onClick={handleSendChat} style={{ background: "#ffd700", color: "#000", border: "none", borderRadius: 8, padding: "0 12px", fontWeight: "bold", cursor: "pointer" }}>→</button>
                    </div>
                </div>
            )}
        </div>
      )}

    </div>
  );
}

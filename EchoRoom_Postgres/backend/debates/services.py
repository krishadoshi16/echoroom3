import os
import json
from django.conf import settings
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer

# Initialize VADER locally just in case we need fallback
analyzer = SentimentIntensityAnalyzer()

def has_aws_credentials():
    return bool(os.getenv("AWS_ACCESS_KEY_ID")) and bool(os.getenv("AWS_SECRET_ACCESS_KEY"))

def analyze_opinion_text(text):
    """
    Analyzes text to return stance, sentiment label, sentiment score, and toxicity.
    If AWS credentials are provided, uses Bedrock (Claude 3).
    Otherwise, uses local VADER and simple rules.
    """
    if has_aws_credentials():
        try:
            import boto3
            bedrock = boto3.client('bedrock-runtime', region_name=os.getenv("AWS_REGION", "us-east-1"))
            
            prompt = f"""
            Analyze the following opinion on a debate topic. 
            Return ONLY a valid JSON object with these exact keys:
            - "stance": string, either "FOR" or "AGAINST"
            - "sentiment_label": string, either "Positive", "Negative", or "Neutral"
            - "sentiment_score": float, between -1.0 (very negative) and 1.0 (very positive)
            - "is_toxic": boolean, true if the text contains hate speech, abuse, or extreme toxicity.
            
            Opinion text:
            "{text}"
            """
            
            body = json.dumps({
                "anthropic_version": "bedrock-2023-05-31",
                "max_tokens": 200,
                "messages": [{"role": "user", "content": prompt}],
                "temperature": 0.0
            })
            
            response = bedrock.invoke_model(
                modelId="anthropic.claude-3-haiku-20240307-v1:0", 
                body=body
            )
            response_body = json.loads(response.get("body").read())
            result_text = response_body["content"][0]["text"]
            
            # Very basic JSON extraction from Claude's response
            start = result_text.find("{")
            end = result_text.rfind("}") + 1
            if start != -1 and end != -1:
                return json.loads(result_text[start:end])
                
        except Exception as e:
            print(f"Bedrock Error: {e}")
            # Fallback to local
            pass
            
    # LOCAL FALLBACK USING VADER
    vs = analyzer.polarity_scores(text)
    score = vs['compound']
    
    if score >= 0.05:
        label = "Positive"
    elif score <= -0.05:
        label = "Negative"
    else:
        label = "Neutral"
        
    toxic_words = ['stupid', 'dumb', 'idiot', 'hate', 'kill', 'shut up']
    is_toxic = any(word in text.lower() for word in toxic_words)
    
    # Guess stance (very naive fallback)
    stance = "AGAINST" if score < 0 or "no" in text.lower() or "against" in text.lower() else "FOR"
    
    return {
        "stance": stance,
        "sentiment_label": label,
        "sentiment_score": score,
        "is_toxic": is_toxic
    }


def generate_argument(topic_title, stance):
    """
    Generates a smart argument for a given topic and stance.
    """
    if has_aws_credentials():
        try:
            import boto3
            bedrock = boto3.client('bedrock-runtime', region_name=os.getenv("AWS_REGION", "us-east-1"))
            prompt = f"Write a convincing, logical 3-sentence argument {stance} the topic: '{topic_title}'."
            body = json.dumps({
                "anthropic_version": "bedrock-2023-05-31",
                "max_tokens": 150,
                "messages": [{"role": "user", "content": prompt}]
            })
            response = bedrock.invoke_model(modelId="anthropic.claude-3-haiku-20240307-v1:0", body=body)
            res_body = json.loads(response.get("body").read())
            return res_body["content"][0]["text"]
        except Exception:
            pass
            
    # FALLBACK
    return f"I firmly believe that the stance '{stance}' on '{topic_title}' is fundamentally correct because it aligns with long-term benefits and societal progress. (This is a mock AI argument - add AWS keys for real Bedrock AI)."

def enhance_argument(text):
    if has_aws_credentials():
        try:
            import boto3
            bedrock = boto3.client('bedrock-runtime', region_name=os.getenv("AWS_REGION", "us-east-1"))
            prompt = f"Improve the following argument by making it more articulate, persuasive, and professional. Keep the original meaning:\n\n{text}"
            body = json.dumps({
                "anthropic_version": "bedrock-2023-05-31",
                "max_tokens": 200,
                "messages": [{"role": "user", "content": prompt}]
            })
            response = bedrock.invoke_model(modelId="anthropic.claude-3-haiku-20240307-v1:0", body=body)
            res_body = json.loads(response.get("body").read())
            return res_body["content"][0]["text"]
        except Exception:
            pass
            
    return text + " [Enhanced by Mock AI]"

def summarize_debate(topic_title, opinions_text):
    if has_aws_credentials():
        try:
            import boto3
            bedrock = boto3.client('bedrock-runtime', region_name=os.getenv("AWS_REGION", "us-east-1"))
            prompt = f"Summarize the key points from both sides of the debate '{topic_title}'. Here are the recent opinions:\n\n{opinions_text}"
            body = json.dumps({
                "anthropic_version": "bedrock-2023-05-31",
                "max_tokens": 300,
                "messages": [{"role": "user", "content": prompt}]
            })
            response = bedrock.invoke_model(modelId="anthropic.claude-3-haiku-20240307-v1:0", body=body)
            res_body = json.loads(response.get("body").read())
            return res_body["content"][0]["text"]
        except Exception:
            pass
            
    return f"Mock Summary for {topic_title}: Both sides present valid points. The 'FOR' side argues for progress, while the 'AGAINST' side emphasizes caution."

def ai_chat(topic_title, question):
    if has_aws_credentials():
        try:
            import boto3
            bedrock = boto3.client('bedrock-runtime', region_name=os.getenv("AWS_REGION", "us-east-1"))
            prompt = f"You are an AI assisting in a debate platform. The current debate topic is: '{topic_title}'. Answer the user's question thoughtfully: {question}"
            body = json.dumps({
                "anthropic_version": "bedrock-2023-05-31",
                "max_tokens": 200,
                "messages": [{"role": "user", "content": prompt}]
            })
            response = bedrock.invoke_model(modelId="anthropic.claude-3-haiku-20240307-v1:0", body=body)
            res_body = json.loads(response.get("body").read())
            return res_body["content"][0]["text"]
        except Exception:
            pass
            
    return f"I am a mock AI assistant. You asked: '{question}'. Add AWS credentials to use Claude 3."

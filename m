Return-Path: <linux-gpio+bounces-31743-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HsAHYlVlGm8CwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31743-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:48:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDC314B8DF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE598301385A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 11:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D82335546;
	Tue, 17 Feb 2026 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otrwtLgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4dZxMZg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2B335087
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328899; cv=none; b=t0eINpnrUyUutLDRXd/3YyZkwGogulTSL5sdsGK27Q6yhV5IXz4FjVGtLBvJwuZrozRCllMPPlj24h2Z7nCdbaor6S0zaMJRYUT/PZ5WyQ6LBkfIIeUwX/YSwyXADXotAW4H32JhrQ6x8X85uNIl/VpdC8TO07cki2HnjyewP/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328899; c=relaxed/simple;
	bh=vrYq/uiAVCyz7jBM7IXFxTPKK64eUp1A3gkelnJyr6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtYa26Ecah+x95dAioYWWM1np4zLgktWw+eno4rItQHGmysfsWFgWjgU4Ab4be8wZarF3gLW2rlbg4GPeJo7fNlIdxlNTLjGoM1k9cglKh/X7zxIq0qOF1YUZLL1hXLzCVw/BRC+rGkoSfP+lO/wik8z42CHElU9ljs186a5H5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otrwtLgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4dZxMZg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8o7Vs1601138
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dvcr3dnSYivkUw1cTNa360G+
	1MU+lGFu8IiI+q7+qaQ=; b=otrwtLgsc/1PWWTcyErQcsCK6+nFapWQiLv2qbNI
	tpkJmuG2sEPsBCto9mVAf9WIVZ6+Cg9TylxCrZotSrNW1LEsCs+vhnqoEAhhBunK
	aafIIkI5ZxWkbmiWCtzIoUyNjjdYrCHdpG4Q2gFSXZQ5iMi9dvd3cU2lSy5qOCuO
	XhQSpRNxCYa7hg8cd8IsYCss65MmUpNj5GwP87gqbiVGdhGMmZSFxx34cJwhd7mt
	GoSe1m8tNGOzzlbH2PAsQLy1miYr9QW+MPLbikM7TFJsRbq3gLSFBwCx4/yo0rrh
	XHk6p36XAkKAd5u+ixFTvCym5Px6RxPECmAfCVTJw/rPzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tma3b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:48:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506b3fb32a1so564013971cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 03:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771328897; x=1771933697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dvcr3dnSYivkUw1cTNa360G+1MU+lGFu8IiI+q7+qaQ=;
        b=N4dZxMZgsgM8HT0zLCt/EChqzi9jOQqccTY0YDt1+pz8dcB/pE31ntKSpm/K+tL08+
         64W2t+PeIISTDRaEAIVdhKw8Mtb5ZvLEBjjl5bfGve130f+9e5EYdULGWP3d3NH7khJb
         BF6k3/4XjV/5NWeCPb+UxE4s8FBmv8DNI8i/dEv5+4ab6SCfKqJcWYqi3X2SzL26K9Ug
         8lsox9JYbs+WeLj2SH9N89ivYz172DZfgrVDgfsnmdqqDnNRjKK7hZnNcCSi4zbmg/Wc
         aWPishDADecyRelwQ8vhXAdOgViYZSO0PPsvjjHNh96E+sh9ZmdnDbBDWTUfvGzeShbC
         FMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771328897; x=1771933697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dvcr3dnSYivkUw1cTNa360G+1MU+lGFu8IiI+q7+qaQ=;
        b=PUYsouhRxIO9x+9g9jdSMLNCbNUpEOMk3xlUqS6KZnnh60WoCrPiOxaxQvx1La+qnN
         8lG+pa/GFHCTdStgjW1UwppU2MaoO0/mlnzrkqUKuKzRIky6Ldj8ZHAxQ0fhl2jNyadh
         xXXiyAfU31lsc88FgAUchfzXQCaG5lBwo1+2cQw9Xi3AjChDzwpaPDsHwAeHwEhqBgvC
         Syz4c/VIfQ6URfCkprVpl3RQ4aW8pGabdNi4JVhuWlPbUkHu6ESsdLf3n19wVU6X2Ou/
         mymz2HGlLMdi8/CBsqN9Hkf8tvUE177x771NrFofZjPXEa9nRmEbxbn6JqROSBhybmz9
         tj5A==
X-Forwarded-Encrypted: i=1; AJvYcCUaeImvT3qESRUYl5tAOu7E5NOurZujp42JmVurJMBAFDwOQutmlwEFu69QnSsprVYasNbZmgUgnPy/@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/fIbHP8wb1oX5t0elZgUoDqDUyUQexB6i8gnBDVW7xwKWUYU
	Ru+dKtHF7VAtZU89Iwy3JJ+DtKt/m+AOGRJDL45eDEne+C3UvBH52/S7f7tlYgSzLiTG6M0jx4A
	7wjVf4JeyxpqTYnGtLLKa+Wbz83ITOFeGOXhYRuziwjGZBh9hLrVq7k58OprmmjKC
X-Gm-Gg: AZuq6aK6CS2vt2VJC43YKnK/Y3+5kPiJUxk8It0d7bOFpIC3tRB4ZDuq5dPaQ9Vvwkc
	sXoKrA2yRBw8B+ufF2AFMNaYJ80bEsKxS9VqhnYNk4WlzudmWe935JlMnbXtXl+I80LuKCiR/4x
	fP4TcNjqq9OAmnJN7yTMpqjVnA2MGDTuFGi8LZzntq73wSmcjeqaIAFn5p/eLIO2Ye/yD+XDtXI
	Y4BSb7wOM/eZ8mUlZXSXABlHCuo90AnD9x5SbgQuZafOtQq29AzgK+u1+FdfyIMMFrgSCPARNPW
	qwfQzBOZIY352g4+NNVWPMK/VqPw6hLrZrC8VA0/VbnA8DRBOcjOS7YBIM1tbib134YmOKF/+a1
	W2QlsMEAkO4qNQkMBEHKP/AWDWJGyNMHKdOGu
X-Received: by 2002:a05:620a:2953:b0:8c6:a5bc:8a90 with SMTP id af79cd13be357-8cb4bf9708dmr1345719485a.14.1771328896646;
        Tue, 17 Feb 2026 03:48:16 -0800 (PST)
X-Received: by 2002:a05:620a:2953:b0:8c6:a5bc:8a90 with SMTP id af79cd13be357-8cb4bf9708dmr1345717785a.14.1771328896228;
        Tue, 17 Feb 2026 03:48:16 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e11f5sm531678215e9.4.2026.02.17.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:48:15 -0800 (PST)
Date: Tue, 17 Feb 2026 13:48:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 6/8] clk: qcom: Remove tcsrcc-sm8750
Message-ID: <sxjrbxwi64ky6dcntpnnbi3y5ujtssz7uno22xiwiqjdhp7rxi@b2nsnmb74vnb>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-6-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-6-cd7e6648c64f@oss.qualcomm.com>
X-Proofpoint-GUID: dXTpmDzVTvzfAHOvRTZoPdhT8eSRjX87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfX7jt+F33jTpV4
 EjtZaKDsoxSlo+13jfI9Uc30jO662mN5T1iLDhrGKEHfHBjtKP7cvmYR9L2MOyu4vBFRnJK7h6l
 Upsi7K75ITZxNGbzLK327EgV2I1pOaMVYp0kZ3kGeeRHzRK0Cbmns7xb5XfhDEZaQLwTx36p6bb
 NFP1F9cJe+dz4jgVpdk8472rvySsJcdHGaNeZenPiblaT2Wx1+u3ruw6It8pIWf8EnCKWTl8On6
 DEUNbdkEg7j7oMDtTuGKOyEc+9LT4ZauPTWDzIKMES+oH9SGFjFIvRXO/JSA71MUO9cvlY0fKuv
 Pjf9/oroyhzf8jQUXyyOFHSushcmhJKv7qlOWFinuoOOGrEN+EnRuXzG+k4WkG5tN9WYdIxWbCN
 o0g3+LC6XZa8gZOTzhxirrRN44VVyVwicJ4lmRXGFkVbwm2JbHAWcF2Z0t49PbiZ63WGZfCjWsy
 NhsL8NmPR4SSXnChRNA==
X-Proofpoint-ORIG-GUID: dXTpmDzVTvzfAHOvRTZoPdhT8eSRjX87
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69945581 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=alLqWcL6K6sXwBa7AUEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31743-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFDC314B8DF
X-Rspamd-Action: no action

On 26-02-02 15:57:38, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is now handled from within the pinctrl subsystem, since there is
> no "CC" block inside SM8750's TCSR, as the corresponding hardware is
> present within TLMM. Remove the leftovers.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

So bindings remain in then...

Anyway:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


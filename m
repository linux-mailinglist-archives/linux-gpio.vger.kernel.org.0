Return-Path: <linux-gpio+bounces-31751-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN5qL2xilGlfDQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31751-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:43:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE1D14C10F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF6B302BBBC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A963C354AC4;
	Tue, 17 Feb 2026 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEcMJIBS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeHDDvk3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540A4334690
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771332197; cv=none; b=I+SE08RMlaOxLEsFcamk3Ww4n/zPj2eGb6ZRwf9Ih8dwxGXgWMjoPJ2M40eEJToxcRLeXK3iV3cJYV7BYsL2V863yN0pLGFMI4/3sWx2rxnPRov1YXoDx9yMxrhzR90OcHc+ytfUT2nEsh2nP6w/gF6ZIc4XS/TXO8TqJOCHaVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771332197; c=relaxed/simple;
	bh=4QHlZiAg2nr+h401QmtY+/NbyzOxnSl6KaALxYS8iWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcTgxxCrgC0w2mSAl20b3yZjaMv4ainJdVDE1g6fy8hDqLxHqVKG8imouheF+4BG5y0aFLEhcV4o6XRRWAxl1/R3pUONT/Uc8c18Vmoy7j3V3k/7RqVkPoGneTBwTSDIvjdFqVyIef+4wDe1/TlLTdoSJdkCCeD9HdJ4+92+5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEcMJIBS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeHDDvk3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HC7VNg1223109
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LSGV+cDMrzNJBL7mWZtz0+eIS66GpKCa5MLYXFvWgz4=; b=HEcMJIBSybtdCLpG
	6uCve4e0Qa0ahXp2gdjODYBpeDZJ0uK+AV1sf8LbVH3lQu3cR2VDaO+/6XNVuq++
	NiwNxw8gZ+/i2D/BH03HUDE+tc7qqak+cd1ic+xhRNvj7YtPJ3G3xhvb0YTvABOS
	DhZMJ6FPV4vb4GTgCDGkIOGDx1DLd12XakNd59VAeoqNQLWj4R6Ub1KcQRk95cJF
	YuxxG4D5i7hToWEZkhZpxNLaM6aE6WFRzKTQrdtiseFkWTGqXs1hyDgueX60FTpM
	bc1pw+ZG/1tD/j0pVNYRSbOy5OIa5rI/+kDtNILt1EJC5+9ZNu9FPa7jrPfH//9g
	4VT7TQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrtb6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:43:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb45a6b860so228451485a.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 04:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771332194; x=1771936994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSGV+cDMrzNJBL7mWZtz0+eIS66GpKCa5MLYXFvWgz4=;
        b=ZeHDDvk3hUghUoVG8X7DuJY06U9+xdjxzvtGf1Ybhi4fz1wpL3P++ySVmKUgzqMCOM
         J57JQvQn6FUzfhfnTaB3YlhKMc3Y7YcZ8C23Fg52cK6s6rfASZIthhgnJZl+ffYMRC7M
         F0R4qZzzlSj8Gf72JTPRLcQ3o4lRXCax22znU/Hd+IUwtq1uSlohwvfubCfpX3/ROMAF
         Q2d2JWS2VNZFjroZtDNxQY3YpXyhMjnVI9cX37BMJNX/6FTNiXD6NeMiwalykma9pw/k
         Fmr5kwcSapj3DlMUCRd0I2tdwWnQ4+aJOCwDLVSIzZGpFP8fYFjYtvbj9p0zyKfVIk5i
         S5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771332194; x=1771936994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSGV+cDMrzNJBL7mWZtz0+eIS66GpKCa5MLYXFvWgz4=;
        b=R0vzUU0xxKFwUpbS4ckoH38d/Zak7bYDvocGYCCyBaIZau386XP3EC37eSnQzglhRz
         JpuxbEAIynRBNVexXy9UQG8O6uZOVqxxwwnSH+P/KJ7iPSPMhXlEozpVXvFljvl1r8U6
         rV0Kl9M7/YfCmqvwMfMKsFSAmLm9+ERwuLB0GJC6eZ9rNybWd8XZo1pD5AHTf1Y008rX
         Je0CDlvFoGMlcOWglfmiA1lT/lyno9b5nPczweEFNj01W69y56rVa6i2a+vnIIq7JQNr
         SdnaPLeEIo0fzxlKEPoTvSjLQVhpG1jywnudm24kdmStSedUHDVThvY7BB0KkpB85hJ4
         fKWw==
X-Forwarded-Encrypted: i=1; AJvYcCWqA7Ryf2K+Qj+10QIV0WqyAoSM++pdyLqZTTK1v7JV9OJHmOibY143OU1sf7daBQgLfYKwmdmdi1X1@vger.kernel.org
X-Gm-Message-State: AOJu0YxE7zrITakkxqfzfFeRDJT2cBcddBSxms8qUxOSlWzUkY79qo66
	2sCbaBtifgBLZCmHgI2b43bpab2O879gAIQODGZKhKHlwA9S3jtCaXJtNfmIIkoTbHUgf2ETWZ2
	Yy1I0dnSfv5ee8dKxICSAI83Ioe3/77XBAZINKoj3ZS7G3B/u+aH4qlZNtZG0MAWz
X-Gm-Gg: AZuq6aIIi+Bw2VU/rqGvN1vQxRuw2rpGIHBF6IQgkZlvrEJhUQIcE41VuA7l4xuU2Gw
	9wvKMGh0xy1fgUnAHTX7a01UgtrgOgfUqOVI02jkIRVgQLjKnFjafK6W8rnEyhk5hnoHpcD4jBX
	3Atp5iHcuPtcJjbS0ms3k+9V8cQNnaByy1S7Tzui5ivcK3sHBaDk86crMZDH9rP63ZWVCBLtZSt
	UjnrrzGMqtZAki2dk7sWdLlsJP45MjEzepCpO8ybiU7vMc5MgfPe0d9LF9xwEAxgz5Q6AiPLKoY
	wBFSP3Ebll9N1IDtD1hcvXyvUom/hbNt/k6vaUilbG7o82eoXtTGX4xlN9w4q7WZrDl1y4AKXYa
	eSvRrNq/Cq7WlmmKneokoypikLIEh0H8zIUWsurUkZo04bWpaPMuiQ2VZaKGXaynA9qVHnAmIc9
	XKdbA=
X-Received: by 2002:a05:620a:2988:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cb4080809amr1276634185a.2.1771332194600;
        Tue, 17 Feb 2026 04:43:14 -0800 (PST)
X-Received: by 2002:a05:620a:2988:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cb4080809amr1276631385a.2.1771332194210;
        Tue, 17 Feb 2026 04:43:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385d99sm333776866b.17.2026.02.17.04.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:43:13 -0800 (PST)
Message-ID: <e8eb2a60-d0d1-4522-a70a-84386e32ab1b@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:43:10 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/8] arm64: dts: qcom: Remove inexistent TCSR_CC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das
 <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        stable+noautosel@kernel.org
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-5-cd7e6648c64f@oss.qualcomm.com>
 <d81849fd-dc32-44fb-b523-2026f2c0db52@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d81849fd-dc32-44fb-b523-2026f2c0db52@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=69946263 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=HEtdb3PhFzw24E7G2eEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNSBTYWx0ZWRfX8K5wn83GJa6u
 JqzAuBemdkxVKGuqMT2GmutThgPh60AV5kLbWZBBF90OyySd5HWUqPniuYOlCJNynuRQF7tI0rb
 ja+TjQbwLr3PQIocaXnK4TbLguWPVIxZu/7W3z8nBm8/AUjE+dVqgEqDFb8oXXfn+ddMhfAtnnN
 1McXsTw/t8ckcwHt38J2ubYb1M5CLIopOXgfRnrlGbcM9skvvoJ13JIgg5GV2Ct3LujPHPFszM+
 nQoa+DO0c5uYTQepLTj1KiLegiP6levu9kpUSRFbVaDCDnp2yvugbOFoXfZqAwQ+ceoPm0dwzjs
 IU4tNoKenxY0hmRS8WHKWml/z/aEhV/Og8cCg4TE40+EjWevvXhbhruZ6wunSqeGJS/D4xt0/Za
 KjMzQ/+BUdlCt+TcEL/DVO1zMMY9RHj0ofcVH3zUSmezUgJ7VKtkR60d9brxtBqQbgPIrIq4KAj
 kGMwBuc40jm/3a9gOhA==
X-Proofpoint-ORIG-GUID: h6Fpumb6yovFXcFJZ0H3X-Wc5X5HPqDq
X-Proofpoint-GUID: h6Fpumb6yovFXcFJZ0H3X-Wc5X5HPqDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31751-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,noautosel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BE1D14C10F
X-Rspamd-Action: no action

On 2/17/26 1:39 PM, Krzysztof Kozlowski wrote:
> On 02/02/2026 15:57, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On SM8750 specifically, the block which provides various reference
>> clocks does *NOT* live inside TCSR, but rather TLMM.
>>
>> With the former now being able to properly expose them, switch over to
>> the proper source.
>>
>> Now, the TCSR still exists as a block for various tunables and
>> switches, however the prior misuse resulted in its 8750-specifc
>> compatible being already in use. With it freed up, it is now free again
>> to be described properly.
>>
>> Fixes: 068c3d3c83be ("arm64: dts: qcom: Add base SM8750 dtsi")
>> Cc: <stable+noautosel@kernel.org> # complex dependencies, no immediate gain
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 22 ++++++++--------------
> 
> 
> This will break all the users of this DTS and commit msg is silent about
> this. It's also silent on actual bug being supposedly fixed here.
> 
> So again - as explained many times to other Qualcomm engineers - you
> cannot just break the users silently and without justified reason.
> 
> That's RFC, so maybe you planned to rewrite it later, dunno. That's why
> I did not review the rest.

I assumed the explanation in the cover letter is enough, but I can
include some more context here too

Konrad


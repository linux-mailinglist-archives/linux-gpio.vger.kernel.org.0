Return-Path: <linux-gpio+bounces-39399-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ocGCG6qDR2qkZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39399-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 11:40:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5D8700BBE
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 11:40:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YN3VGnrQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="V/KjpE5a";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39399-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39399-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03F19305542F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 09:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEA23B14C9;
	Fri,  3 Jul 2026 09:31:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7CF37C0F8
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 09:30:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071060; cv=none; b=bTkrhSRaQ1gHEVnWi3sj36TF1UYfPHLZMtBo4zaDdGpg0fQ/9dFTlyezTpC7/DZGghM3QxB4Z7pNLcJqy66R7PCNQLcwFg0dCrASBpmiEoZH5m3/qN9eneoUwiKhHEEfFESWMnF4GbxJZeUevniWTKTU9OsmtNvyJvoMoCwZd4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071060; c=relaxed/simple;
	bh=PW1Gn2ZDRUx5qmvoCMyRof05YepCvm5bLOu2Pluzkug=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U15a7/j20MqI3x/t1liVj3xxIEF5mPhen32r3K/Xu/Mzgfu/keeApaFlbuRVS2sVsGrl/SJgsj0x4Ia2poe/olYMiPp+qSt4pAv65ARcooeakbzxNzSsC5YnpUn8K1BCaOY2pFNV1jM5l9OM13q+kLkweAs32RNlWDS9oCswBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YN3VGnrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/KjpE5a; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IUk43195143
	for <linux-gpio@vger.kernel.org>; Fri, 3 Jul 2026 09:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgPcbKZq7cX2hR1BeKwBwVw/MUN21wkcUNYYxdi2Loc=; b=YN3VGnrQ8VkV3le+
	NY0sCWKe3WFHuyO9eBWaJ+3D+VC1r+sfVNdalQPp4ez1Vvx1r0da+ou3RcaQQiXy
	fvIqZcZ16Ohkek53MErE5qVT+ZfZImedOfPseQvdgDJ2Onnw7Sr2n09Gdvtwucvt
	cvE9TLwGTP0G8zsgGhJPYT1hXe4SOp8LuACUJB+CZ2y1llqyv+klB2yyNB+F3DcN
	ExKdqw2UfTwiqlazNsJD8TCYaOoZ12cDXB+Q2iTfW4YRra75oZMBZI4Qmz10vYA9
	cMGAL0dw9jd1CgqWU1th75Y5hdGXKEWwKKAyPx5+HaCTQYfTms1R+78JCdrjw2kn
	zcF41w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrfsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 09:30:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so692849a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783071057; x=1783675857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GgPcbKZq7cX2hR1BeKwBwVw/MUN21wkcUNYYxdi2Loc=;
        b=V/KjpE5aK6UVdji2tuyWeRo5F8HZRd0H/mWgPKLM9zX6jqV17rEygXq20Yvvy3bbL0
         8iISGW4vmjOF9HUHsql0tKPZMCZICpo4X7xNv93k83G+xhK/eXVCdnf4hlWEb8taApzd
         QWpLwvGhVACTpyFfWuLpaifUUGDwnFYgRMr3igjLY7eyM4aIpCX21jIAKLiq5lzQqRoH
         AiczMVNJq9QhixYb81oJ2Dnmc9C6tUjuD2sioU0iUMmOoFO9rAyexRPn+1VtTLvLRy/Z
         qgG+U0XmkYczNMuDWITBlNmE2pa23jcTsP9b8b0ttC8JQuHx5aOlSHLAgyw2q7hvvL41
         DvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783071057; x=1783675857;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgPcbKZq7cX2hR1BeKwBwVw/MUN21wkcUNYYxdi2Loc=;
        b=RWwnl5U1u6GgA7msJoAlVHICXsbNHDEky5W513wSH2Fiok7jDppcx+Z+rgsMW8eZii
         u/bHeJ8u0d2FJRn0q4n2chG1Ce5djckrPi16VN/SkMfGPrn/IOQoLj7VEog1tGxnil4E
         veHfdA6eLK5P0axCwn/8cnBrqJRN/CuiHdbHh8I3/7HD/RVnmqN8sn3KdZ05AVhJb9oM
         fpBDEVDyu/bgv4GgMP5OKHsNJzRdq/lo++ipOPRb4GIqfUr60xC3jzS5SNGaUhGd9Szb
         2cV29dxPMSMLH+8Ki4cjCHQHT7QrYaSLQuzXVvrKZj7cj5UD0xtxNVYIq20YLzrU2vwM
         LmVg==
X-Forwarded-Encrypted: i=1; AFNElJ9TMbs8K6ROGxso1WPyF358owhcbH1XvICWSLPpMA9CtnI9bFiaygD6snEg0n2UPuhgpvBAJDbEBvss@vger.kernel.org
X-Gm-Message-State: AOJu0YykbTFIzmL3kgnU6GIeR/1AQtgx4EOw56h2yQn5kVaYgKSTzvPM
	1GVb9TGhMIylhLSfZhEliU+jZFM8lr68PFkp+dXDGz3nEJoe/+UfVYRTWVeOivnW93pIiJB5u3G
	Q4bOI7A9hyj77+N5+QDKQnEQ88GuywZ3LTq9ILwEnA4AqnTzzghPsow/bnw0BFGDJ
X-Gm-Gg: AfdE7cmJmlB32PyZB57m07nRlCSZg47FWngWiv+Rg6n2e5fpav5s3oCtpN0XZy3CHBL
	lTC4WQRR5aIaMlUsmZXgnrQtOOIdyIIgFlfIypfu1xlNA1F7Q5sLUx+v7YPB5h7qqatz5vUI5tH
	hCMxvgfCJkQ3YSdN2RDO5UMiAmtRqGzi2OjrPme8Zpan/2GX9bTXaxkm3fjr+H8A+Rgm2avE2Lx
	AOunjUH9GKen5faGMjDWFqAl/8LApH4RtitlLqp9kGv/sNgTHmGWY9vkxMt+bGI+A1314qngWfx
	QA1Isqd+srIDRAhlaAeaLDfKV8V/r1KfYfcWGocUeQ55pMAYUBxA2bVwc5aNKI6pVgdkiCf1hwl
	/wRZTinY4hhFvJAtvV9187mPMerGSw1BWlO55m2Ge
X-Received: by 2002:a05:6300:6701:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3bfed471dc5mr12533796637.35.1783071057531;
        Fri, 03 Jul 2026 02:30:57 -0700 (PDT)
X-Received: by 2002:a05:6300:6701:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3bfed471dc5mr12533759637.35.1783071057123;
        Fri, 03 Jul 2026 02:30:57 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e926a6e85sm2291087a12.27.2026.07.03.02.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:30:56 -0700 (PDT)
Message-ID: <20a98312-be6e-4743-b2c2-46cc084653fd@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:00:51 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Language: en-US
In-Reply-To: <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfX5uByU1Fczb24
 rSB9WA2bpY0yawALFbdlIFJvNbbanlDlojYDtZSvJfA3eb8TbtjRt0nu7TTMNZa7NUrtiAAm1sl
 9Zf6AgMo25Y5e7rxQDDNFMBQfgLHQRJxnUCSyIWhWFYmVB7JiP/Nz4F3DWgmVJVSRD46mWrEr3e
 2c2hvhCTeUeGI3ktP5nX5YamWA0IYWfrtaNGGYLn9NIh1SSm1bJKWO0RKGd56/fG/7b6IKy7+fi
 ikcXa0jTHmmITX/r/+3/4bZ/onBxSC3Sm0lYCDeB+lyNItf7JVq9aorokKNxoSoiYExlqVf6QA3
 q/tjZ9HFIP5Pa9o0YjHSinSLCNczXAXGkicJNgz8uFvaSXeFLU0m5tF7ADkLy+QwWVKupabHkrP
 JrjfT1BUZV8AGW0qU2wPfWz//b4vTvyk7RF3sXXyd2aJSzGLteq5d1XQfbHpke2sEVuKUCDHW9r
 6OcmsvVBj7aYb9eYDIA==
X-Proofpoint-GUID: Y0qu4wvaWy68unKsrBRGeyBJHh6f0tJN
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a478152 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=CzlgM8hXaGG7tx5CzA4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Y0qu4wvaWy68unKsrBRGeyBJHh6f0tJN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfXyfGD17SUtlWG
 /3ziR59tMw4Ev6VjpGGQdef8SLn8DnSVzFA9vb8uJVSvQSVEKdjVtwNpW4ZJwV78z67gn4nSho+
 DjtOW4P3WGYEUVgQ1RsozEOxZQMlx1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39399-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD5D8700BBE



On 6/29/2026 12:09 AM, Val Packett wrote:
> 
> On 6/16/26 6:25 AM, Maulik Shah wrote:
>> [..]
>> ---
>> Maulik Shah (7):
>>        irqchip/qcom-pdc: restructure version support
>>        irqchip/qcom-pdc: Move all statics to struct pdc_desc
>>        irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
>>        irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
>>        irqchip/qcom-pdc: Configure PDC to pass through mode
>>        Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
>>        arm64: dts: qcom: x1e80100: Add deepest idle state
>>
>> Stephan Gerhold (1):
>>        pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller
>>
>> [..]
> 
> Something about this series breaks the touchscreen interrupt (<&tlmm 81 IRQ_TYPE_LEVEL_LOW>) on sm7325-motorola-dubai :(
> 
> With this series, that interrupt only happens once (stuck at 1 in /proc/interrupts) so events are not reported. Something something level triggered..??
> 

Hi Val,

Thanks for reporting this. This seems likely because patch 6 of the series adding IRQCHIP_EOI_THREADED flag for gpio irqchip.
In v4, removing this flag and modifying .irq_mask/irq_unmask callback for secondary chip to have similar functionality as IRQCHIP_EOI_THREADED.

Thanks,
Maulik


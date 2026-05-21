Return-Path: <linux-gpio+bounces-37267-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kf6ACbiDmrACwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37267-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 12:44:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A65A387A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 12:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD255308DC93
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 10:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3013A71AD;
	Thu, 21 May 2026 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDxGAXEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6C4s72/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A53A6B8C
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360126; cv=none; b=PWvHhxZnUhqDnINo1vQDhMyXyVHQJNa/8+WsxZtDdtIou5d9SoSmvE/50fxrxWllUPa2otIdlh5DCvY98/nAK8skeC5RxPgVOsjs5ZGk34oVXHx1qdkMYxM7GtsNFXNp1e+t5yXw+25pue3xTW0WBKAREr/LC9QzUUARUW/ogy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360126; c=relaxed/simple;
	bh=OoG4A/nCjg1WGRfiXsW3OEJxdp06xTQX/WTx768OiUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFyMu+39izqU6KNFVcd/GwYtaBZJk2LtRBSIC6c/vx1XamdZS8l8IFNCk4vv96uad1vBOW734lIFaBcWSgV1lZGH3n8YM5OxfGeaBnvmDVP7TV6ARLu7o/yM65Lz8HctqbAvjyvh5H9EzRMh12cZOwYV7PQB+qvTvDafGe+SlMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDxGAXEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6C4s72/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nol3118963
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 10:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=; b=cDxGAXEGlCfUNI3P
	aRwNlqP+tB4kbW9UakvqPJNYMgSji/RS+EQEN1JApVu/K4ArR9yx6psHKUxY6QDE
	tihgbXOIvQgqDR+fqoMKMnqRGShIwLNxguMLXgK8b1dWBffpyY4z1EENWdVRJW0K
	sU1Z2NZVOOen1r7ZTM8e6gXHi2yrHQxFUbszz449NYFAwSPa2SMDCDmuFUbSvC/e
	PatLI1zpYDHHLs7cmVN32oecqbZ2Z8f5akQf+WHOdybc3Y6mpkKuxtcGxeIeE2Kb
	Lv2XiN9oLGC02ALr4PUE5jcKriA96rTEFw9sYjkTVRd03elxOIsnCRArN6AwmREy
	RMMllw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962176-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 10:42:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91345d517bdso125398285a.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779360120; x=1779964920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=;
        b=D6C4s72/8Ke8m9SXvpPMe3heC9naNsiWB2ef82WdIvMb/YmTJM+rTPB7QkZ4dU0cj+
         yUOAQbyu8WdjU0q/cng6/L2z9I9oMfBEHZT5SFs6CXtV3g+5JA5sqQXH41b31oX9dm6c
         RxEcTFRhbljRk6qU3hFoFgo9TFE7d7NrK30atmBPUeYbwcqklslPyw+ZcWBK5hwcs582
         UNsv29UMz5y+vslOljUOGeZR8E9VQ+0PgrqIBD/WRODE1Rm8BBjntjNbhAl58ctt39+h
         Zn9p9hUV8zbo9jvrn+oBxHT7JYIqlFuxB+L+z4W1Kd49wFiaS7wgWpn2EolYfb6W41G2
         w5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360120; x=1779964920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRweg34KvRj4taH5vYY7egOAVrFdTyCDwa/i6eW97uY=;
        b=T0q0x5BQe/IUdzIQv6RvVkjURFTKYYfwcqHYBXdCykWGF+yiWSCLFdYVVuHfIUot1c
         5PVYZf7WtZj1eGeirrVWteVBSTd58cEMlpEB7kOCY8TWJJ5J8kJCu1Fez1xrgIT1v+6U
         7lqrlHH5Tg97DU/m7WRn+5uo3t644lE6glhA1xPaZAl7Lyz+VxaBJJpQfHjoyjFBS6tf
         5tL2h/DykZ/D1oWjZTkJYtZaIUZ+w1sOLLb1KgGPMp9gz9J56qY0mfbkuFWsuF6WKVpg
         DPuUNe/EiYvD9PdWnVIRxqCH+5K8ZrDqnvt1+D3TStURrIrCf+ON2SzQHHsGcyeWnh4M
         dSuA==
X-Forwarded-Encrypted: i=1; AFNElJ/4dVkhrFBFFZAeuCYsgMp/8HjwdKeqPZBkWlphpi+3Vbbbjh05axU7ozZcT741E7NvdBb/Lj06qfvS@vger.kernel.org
X-Gm-Message-State: AOJu0YzxjFv+cyCxJ3CHxACOubnnQ3l5Sbg0RqIB1J9k0jfAxrpDxX7z
	MR/X8S0aPT6pqKASuDcHoKFt1iqaqsIYVF6TdIQ2593fwhWf2279RuXcHKVTTcv8o9A5ay6GlV/
	58QIpOkaraeEMMYgkHaL3FOQ+Mu6QidUW0SQVru0gvRf+FdPaY5zKtTKBdyTLkfpN
X-Gm-Gg: Acq92OEleEsunlOXWXGjl1aX1gG6H0CAGRMJ4EVp8u6YXtbMAvwdEE5mBH8lkKvRznq
	0+/0nP8FNiv4O4kQmB1xlrFAT/4YeuQ6mp9Uq9Z3mAbyDPHlFCUuYglY+AKoDlTf+omyrpFp+AG
	y13ZrVKRzh+w+2grmag6n4d4KUuCycZQnnL3bfhGaoR8NoebecvS/BMFLMChAz+G98DUG+ZmX8A
	YjKdSllq+IFpPv9tXO8AOOwazafdhgugbQ4IpJB6sMXbV856hriXjAGHhvMU1ckMpAGu+BPXFMu
	4JsAuNHcF3SP60gsVrO+iokQp6bWR63EcgqsOqNYKjtl6LnxLPh1AooHw98yhTG8VzbKdfkQveq
	DPxCuhckSviR5v+3udFnQSIg9+t36ndpI5qZjrY9Ei9JqXZ2r9t1Sy/3hlYtwsUvi44eeuzXQbG
	q76L/vqklzFUrfcg==
X-Received: by 2002:a05:620a:c45:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-914a2cccdd1mr195784085a.4.1779360120565;
        Thu, 21 May 2026 03:42:00 -0700 (PDT)
X-Received: by 2002:a05:620a:c45:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-914a2cccdd1mr195781785a.4.1779360120084;
        Thu, 21 May 2026 03:42:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670e02sm8737368a12.22.2026.05.21.03.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:41:58 -0700 (PDT)
Message-ID: <406514ab-bb74-4e5c-9348-64ededafa6f4@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:41:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X3WpdM3m5erH_BY2FiMQhTPJohIYNvdV
X-Proofpoint-GUID: X3WpdM3m5erH_BY2FiMQhTPJohIYNvdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwNSBTYWx0ZWRfXxEE0ADtEfk57
 nttPxcioiGe8SnEyj/MygEBMJUDMGTBBssj8OVw/8G/f2ydW9r/3IpulfVuT7ahvaFwuBloEn0W
 BlU8FX/jug49jUbqArUHfm11axgm8FOsqbcdHCZF+4UaA0EWrmbZmDONPgG4cszgx8MnGp92ON6
 l7lRFpL7Xm99rlsBsGwzjop3QhEZsv+twnaDRXcTiGA+dzAKQi0o6/3k7G43qBhM7WfyxslDMsB
 zAGH7TpNaoM3IF/NTvhXur8GhoI9KP2NJcIjb8X6lPHPXs/bO2z/p7om4dAvq7ksLGJZbrVfQsn
 8nr3NxdtNjGnZnjAq+Y0yZGfc1f3nWtxWWpKPakurVCdtJZv/EKEbcdN4jvIsABVA69sLBJaSim
 AJcXzR6m0et6QzsulzQLs+jurTw5Hzg8NPvwMADoNNKT7wfQE8vq1majV/rwROrqFYxCjI2nDd3
 dVkQMcvBcOwpvhMCgNQ==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0ee179 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3BB4LYrPl4bHvSfQcI4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37267-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,alex-min.fr:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A51A65A387A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 9:16 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


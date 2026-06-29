Return-Path: <linux-gpio+bounces-39145-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HUeuEiWGQmp19AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39145-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:50:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCC46DC482
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:50:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UWnyyYQY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PQFmAdkZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39145-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39145-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7ADCD3064EF1
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 14:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA87426690;
	Mon, 29 Jun 2026 14:44:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABEE42848D
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 14:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744269; cv=none; b=SWIqhgGiEuIe6R5V+DLeeNeYAxucSoek0zVQiq1Ezy89VoB1MdMba2Ns/tRstVnnNL2MwDXrP12aITl+SdEiMezpO6leoFhzmrvX8ojZrF3ODiR++fQGwPv7DLiZoK3nIOxxkB7POexz3Gg0LcQXzZJWHUGyCwPH+Y4UVcC7RTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744269; c=relaxed/simple;
	bh=VY4WrvcbVg3c9j4t0PvvlgL3gXNchz1NJrdvaXZQ730=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgxWG6rt1J59Q5SQclc7kjVAxPdzgvOFzKJoQafayvf1ySeHMNDjTN/rxmF3Rc055SouUKdNahIXTawBfN86d/q/R5nvT9lsTqYMozL/Agz76m/ffsq4++OdSeSjNsQ3Buur3g1+vVBRrc54tCvgBWv8JaMx4qDm7+rfCpd+rU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWnyyYQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQFmAdkZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT5UU2618919
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 14:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5FtdrK07MUFWJmkkos6+LEbmAp4CQiwNSczwv1GzzE=; b=UWnyyYQY7TtlIZbO
	6PTSnY/amyftL+fqPbu9JwET3kbTcnwZftcwKuHJ/n/mvNajjje4E9otmBfpKLrb
	00qlKSo3u5KfgcmwUIuYKIJsK0HOnrHaOtdXhsTRvDRA1CaD4D5veaeLWw97aVz8
	z0reNb2DvbkJLq26P8GVGW+m0Fv3r+HSKzNWd2x/7hMRjjLBRNcQRZZ8aM+VjcD9
	yAOZgtPhRIcuTx5Ms/IviqlNmixzJqCPS0UKc0sgXjD/AAGG1ettGxqgpa2Jeei1
	0Wgnap5DdmvScQraDT914U9fJTtNOd1GHE/Kb4rGUKxBUdLVm0P9GElB2pCeQWEk
	voYZqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdks4wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 14:44:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so94138685a.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744264; x=1783349064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5FtdrK07MUFWJmkkos6+LEbmAp4CQiwNSczwv1GzzE=;
        b=PQFmAdkZrcy/bRcxRvhUbngoZ9hk2n4b7wiZ2fcaw48RIeTCx7C4fSSJIk+FyiLk73
         hoaEypcruTr5HiZ/kFlJ7nyCh2ZQDHSWlzrIc0CP1U9pmPL19U91vQK5PV6P5W5GmqnG
         Si5JYv5qaWVCU4A6ru0OXtgKRHoUZp/ZhFgjtQ8wYhZ+7zLngo/bNUAF7fp71ztJz0A+
         DbQXiGQd1k5qtZ84mI+mBq3ytFy5SXFN/U00sJPXzyg1H1JMRnMwvZovzssuXOKEP4dG
         d2tCslp+N7ACjg5ZLP9qOYIJlLMXctYS9nKec9g6N/xBKSuW7bWGYQ86Kd/EslRBFyWY
         eTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744264; x=1783349064;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5FtdrK07MUFWJmkkos6+LEbmAp4CQiwNSczwv1GzzE=;
        b=SBJb8TQRmb1NbhnQtMGv4nfzR5ifcZUakrkwTR3vpA08IEbS7TDUWWv1Rr1DdN2VQK
         gze9JM2T7P0PClGo64Iww9oKMfx0l42Ahbrsfdtmw4G3UQVYnKBxX25gIJmvxNTMkJyj
         jeZDioRdDbagGg4LhK7A08xzlGV4MpfEQ1bGMjIt1QOlV7yxf+fe+DlvAioWudx+ynXP
         c8obCaudatxxtoODZxrPKsk9LyhV4euL/Mp22SuXwiaHuzD4AcuAFIQfqAanPPWsQANu
         SIAjI/soz8ayNhdGeVK5NPTJ20ldpVYr6V2ygyETJKJ+yZv5yibgiikbCfPEIt2f4NjH
         TvmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+k02b/S1CoqIupEBSpkHmdDG480DeWuYoQwtWlF9wwLzS6m6+5669XkOGNkg5zi/cGZe/GZec0eFKO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5uSbyWqk4IxL9JbWgXx+tR02AZm4H+cV1I0nSjxd12/eMMIIp
	hgnj45WKA4CaDG46SaePdHAoIOR5gycZrXu6YR2OaZW16OoZBoNPdgjXzFS70w7CkrXBcJ2Pi9t
	HlbCxkjbQqdle95ojXBZHI4xFGlkm8z4IfkWnCzMuv9tIFEhYlhaypshK+n3g8IcL
X-Gm-Gg: AfdE7clzQnAkI4hHvljsltQpiUkjme0kWB4WO2M1tkj7ItWAjtldqW4OWRQe855zq2z
	3yNaHSCT4PrhnWl2ZywdFcuqHSCl9aBBp9r8Lv8ujZtGbbzA5F4Svq32IKBdEyfTwx/Y4y/3FZo
	HXR9j0XTCSkLlgETMx9Oe9CuNnX+ma8UN747cx7PFaC+ivtVLcgvrn+FXAVK+j7J2JitVNzmte2
	U3LndIEcdgO9KdDckwthA3lTQbE9Z0bFEi1Fuf2hFEtXC6nKFXmCntzW6MGRTNGU56KrlZFS8CB
	UWW1I1OdxHj0fl7q8z5E4pfIAyRAs9pWo0dQ+ZQJbGwFYuABfnR9wQIo60XN5t/sh4L/mXRv0rl
	ZqwD8uBX+V3S1stQapGZXwU2EA2MoCtN2C0mZmjnU
X-Received: by 2002:a05:620a:4450:b0:915:92bf:560f with SMTP id af79cd13be357-92e5f198c33mr161354285a.36.1782744264469;
        Mon, 29 Jun 2026 07:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4450:b0:915:92bf:560f with SMTP id af79cd13be357-92e5f198c33mr161349385a.36.1782744264071;
        Mon, 29 Jun 2026 07:44:24 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c291489sm238997765e9.2.2026.06.29.07.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:44:23 -0700 (PDT)
Message-ID: <a4481b5c-e7fc-4619-8a43-ac6ffb29e2c0@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:44:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a4284c9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QemOWJxP2g11TSFizz8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -3zktPEmbEht6Ks5dLm0G9aZl3EgLwi6
X-Proofpoint-ORIG-GUID: -3zktPEmbEht6Ks5dLm0G9aZl3EgLwi6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX3/T0616Kf1zl
 /l9dWg575Tzg/gRaMN2nsgXm2l2szN5ojYYJ7Kr0IpgJYwcCBAqwd5JZeUaoYz/8wK2QFEAQAB5
 7essY5RZ3hQbnJjj98L7a4JSfIaHFqAQCwHvMbdF1ZrugfT+6Fi39Ffowze7SFJO3DYXrm9mTy9
 PIr0s1A9FY3UUPeL0dUyfnP9wlYbuR2AHpBD38O75ShIgbTu38IFvqstAzAn2+2oDR61kESZRQ/
 x2AyAgjW8xQZHqBh1WZccuUvnFNG7nY34egw5BRAaFOfc8R6l79JOzzMbkw1HBfEp3nbO9cWyJ4
 w7yO8Nk68Vmdfy+5Ksq+jaag3ilCQ7U+mLgTLYnu/D56yiL2Tez8cVyJSurw00V+S6OFJ40legj
 ytejWVe8wXupwIdbeLnw5Loxeiw9GenFPPCQvGyLhr9FshZd/j6sNA1aSA2R+x8X7WG+G24cCOm
 ZEYzuocn37pzQfSjfvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX2u7AMMgCe6i6
 aqxTqwTNbVRUro3QibI4VnLLZU44E36otMa5fObmo8l4hsXpwl71wIEKS4akJN0pQBQAtjH7c26
 M9Ofi3/boRnalPPMlNbnUQqcmvMZ0cs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39145-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBCC46DC482

On 12/06/2026 11:04, Krzysztof Kozlowski wrote:
> Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
> same as PMK8550, thus compatible with it.
> 
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v3:
> 1. Drop stale pmk7750 from main enum lisrt (the big one) - leftover of
>    previous version
> 
> Changes in v2:
> 1. Add fallback compatible.
> ---
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 151 +++++++++---------
>  1 file changed, 78 insertions(+), 73 deletions(-)


After some internal discussions, we concluded that it probably is the
same die as pmk8550, just fused differently, thus does not deserve
dedicated compatible and patch can be dropped.

Best regards,
Krzysztof


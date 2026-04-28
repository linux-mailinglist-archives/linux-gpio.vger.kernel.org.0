Return-Path: <linux-gpio+bounces-35661-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZjdVB4R68GkBUAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35661-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:14:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EDF481140
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 657FF3023B88
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18FE3D75D6;
	Tue, 28 Apr 2026 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnbT/UeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVErJX6W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF4F3C1F
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366635; cv=none; b=qY2eRy4YHOlKb6v84f8IqET004utvjS7dDdZAB+y0xySvwZJp3Yzr7N3I7vW5oSGzSrrCkB9kF9Wv5vNAnv4F1KeEO2aLH+OQDQdVPf8hP4ojNdFYkQIWBWRVuznFmS7L9q+cR4VZMO63tv03seoq7RUL7HnfijvwvO9ufQ1HAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366635; c=relaxed/simple;
	bh=6/kXOpIPrMyYeAZQVyerbvyBh4ZULLVmilh78gfeyXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8dVAOXYchuzm4My6sIEdnt36Sio6bUoWcmcVvWaaTQ6cuJ3JVQKsKn0oTnxSy/cp8K0PSqLYOvlZOTKWWH4+WAzfKTnL/NEx6CNZBoGbll2a/v4Twowmt7aKJrQsPfDZAdoPiKoahJbPBGI4B98wgxGtzZ6kvc6FKo2d5lrCaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnbT/UeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVErJX6W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3P3bS662986
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZrIv032C0RLaUKbrdVzoDDiJxw7RgWufz1Fjh7XtFuQ=; b=SnbT/UeZ9SYbGdo4
	0WzyD5jTFOmk3wtQ71JvXsSaDGkEc0WhrOO4rBTVFrbs2Yl7ChxzVnYs27d8rjla
	2TjFrPGnn5N1LoADoXEuDPOtk+9uipRVs+3UW00ztwBfY2kPIHgkz29//pU8JcQZ
	MXkwcdp+jr0K5CJWJcK6ujQRx3eIOb+2z+CSNHsgX/U+J48VsApo/HMylPnJC0G/
	AnbW5wQlEMYHWK6c2Mg2AtJrbCkMbaEPQyAI4UyBFqP7AxfpmUp52HhvcIVkr0rd
	SZg4gEsCY78pPaBtnklnmMkvBfuUcDmIxPHoWFIFPIRoKwcwB8fzQRgV6KJR6S/k
	xpV12A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n345c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:57:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb4b340f4so30233656d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777366632; x=1777971432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrIv032C0RLaUKbrdVzoDDiJxw7RgWufz1Fjh7XtFuQ=;
        b=YVErJX6WuBg9HU1KVE6h7PaxTFMPUmZOqH7WWlUcw2lv/K72mXj8S+Aj7IPG9godH6
         7RQFGNF+W/I7eW6CPMeDqg8n57jjUdFY3c5ql9KfL3jsvZbSIg39hTjsS1I+MxDUaIHQ
         iYP992ttS4iNYSqXrWpg28F2k2W66/YREZjud1BxOlgjlWjnGWTUrOyFr0g7bRDh9+60
         CmIbPKqoqLKqJ53AHzK3jPwu4nk/ZDJ5XtUhdcLODnOfxQpRYGTbKbap4akzB+t7F6NM
         lsZNN+TaTO9j2YJwYvbJPHx6854jdJoM6RYwrRnDAIIZfz3eLdxB/2n+UFh3nMzsDnBy
         91aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366632; x=1777971432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrIv032C0RLaUKbrdVzoDDiJxw7RgWufz1Fjh7XtFuQ=;
        b=AwhBWAek5mUSNngjU6WRu2nanG8n1XsCiSZR7wk0qj7boQzptVkaXIPJ6shLEQ0BQs
         0DtbGXNgCA0vPQyRh89OS2MAAXvsSkI8cLCYMtDQH55LO6ED2BkE+uJIYa4bzi/Aom3+
         7LvWRYZKhyautccd7qqiZ76FC/RgivQxNZETubAlCC5HD0sNmQdljgxjsScnt+DGPkgb
         y6+pq/qNftVGzEnZ9IfRzGpt3ZH8jRfpaHFym5+sxiTQWlSAvIxFzNe4rx11ZFT1C2CT
         xuHPFoZeB4INeAD+jpDtx3ebTWUxej65PYhFM6ckZlme5eBeshcBFo8zSYQZu9hCJi7w
         zrvg==
X-Forwarded-Encrypted: i=1; AFNElJ/YNc+MDxkEqk6SCmo2ndCYBExwe7OowMs8tK3yJI6hZ39SWlulLmoGTtJeXGMmZGVplbCRQ5Nvcw+X@vger.kernel.org
X-Gm-Message-State: AOJu0YymVVSARuxPsMOLWax2+YMlhOGsRWRAkJqsHlxU1jumbd6EG16y
	YqiuIOfJLYYpmelmLxR2UY934F/+WusUu7xSQqNLZn2/U6NNHoKlPFaFgSGnq4rmIAey5C35p03
	IDRVjJ09Z65z4fYNn72Ov7htTTJgM0OrbDe0EGGy76MJlqYrsOWD7Tm6zfuRsWXwd
X-Gm-Gg: AeBDietYD1+gLdVSnoSTqiEeHmXHF7pdQ10JgPmBL4LWolcezHLzcusLSXwDzNBT55q
	KKVGlYpbZ40bntvbDx5LrpGuwlVQCuqYFiEBXQweZRWbKqlIaiYukwtIfSOaY7/38gnz5DpdM8I
	0IX+RLZhl9GsZTSPXnX22IV92R40x/2M+OayOUOIKPl89WTsfirKwvS8CL9QhNeUtPTCD2lOUmS
	aK28ZYuSKdGN3e+87/Pyo15rg0sai3B9EiuyPSUPse5D5A+Ip6ImRYamjyE4J9pFS40uaMdTUbu
	2+avSs8F/iIShqHbx8tesxJboNlxs+ivCQTadUp0LhQP8TFsxmIKv0MEjqPVi8kr3HXJTzNnN7O
	cdWcLdN7H9iOjf/6mK1xmu2rbC4gn1ldb7+9Yk9cHN8RcNVo7MqTk+9rseBvWb1jIOjN5ShMKCM
	scvpjWE7//AiEQ0Q==
X-Received: by 2002:a05:6214:629:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8b3e2a0dfa3mr27569006d6.8.1777366632369;
        Tue, 28 Apr 2026 01:57:12 -0700 (PDT)
X-Received: by 2002:a05:6214:629:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8b3e2a0dfa3mr27568606d6.8.1777366631761;
        Tue, 28 Apr 2026 01:57:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808a35e19sm70631966b.16.2026.04.28.01.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 01:57:10 -0700 (PDT)
Message-ID: <97969bf9-8eb2-4498-90bd-9973fb2bd638@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
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
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MCBTYWx0ZWRfX+yjjhjSbCH5/
 /ncG6zkNR3sn4OrUu1TeaYZsa2VHdeIcYyFx7lDqQ62EqvJ4Pvq1OqmS+6ID+upt+1FPnBrQ0Vr
 2+XjSnClA9NV3xwYAX5w+rHUeNAYQmN3e4E4EWyKYC9dRilK9VXhnsVt7LsIjuroXD+Mvy+ydBi
 NfQyyl0X+lPWq2TtdiW8Gfj6aMHvy/qm6l7rbVqn6BRmU1wy767nm0HrMQW4puULeIjazmw841F
 hYo564P7rKhDn5ox/6J2CkE+/5j8DEaSqw+l8L10C8jmGS4XU7dYOr8W6LqPMTC+6KjMMBOjU1I
 0B4/eaWZAb5NxXaYf1oZGRryVjtyOzRlxFQ92nMo3qPcmIWcTfjAsj/5UCgAFFMVt2auH0xh7Js
 OYJRzWnfTt+EO3bimcBp1XoVqMociR1Sw3LejuyYM3VSMqUbyRd1qflOM3FUdgJYaKGkqEoTm/5
 o6bE85QsF6kR5+Lk+6A==
X-Proofpoint-GUID: jViHavkBLoTq-con5CfvNd_2pInjOmB6
X-Proofpoint-ORIG-GUID: jViHavkBLoTq-con5CfvNd_2pInjOmB6
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f07669 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=J1_VKfl4AAOAIIosoXcA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280080
X-Rspamd-Queue-Id: 20EDF481140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35661-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alex-min.fr:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 9:34 PM, Alexandre MINETTE via B4 Relay wrote:
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
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../boot/dts/qcom/qcom-apq8064-samsung-jflte.dts   | 485 +++++++++++++++++++++
>  2 files changed, 486 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 32a44b02d2fa..c23c961f79e3 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-apq8064-ifc6410.dtb \
>  	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
>  	qcom-apq8064-asus-nexus7-flo.dtb \
> +	qcom-apq8064-samsung-jflte.dtb \
>  	qcom-apq8064-lg-nexus4-mako.dtb \

'l'g < 's'amsung

[...]

> +	i2c-led {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm_pinmux 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

Have you tried setting up the I2C-GPIO busses as GSBI devices, like
I think I suggested the last time? This will potentially bring power
and latency benefits, since there's an actual bus controller
connected to these pins

Konrad


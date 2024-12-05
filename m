Return-Path: <linux-gpio+bounces-13559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E8C9E5D1E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 18:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EABBD1882A8A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 17:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C1F22577F;
	Thu,  5 Dec 2024 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmpzgA3p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8A0224AFA
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419816; cv=none; b=T76l9355UiRiKDvneWiLOd/f7GaNDR1yeT0PYc1d0/rScl9gBg/+xsjgpExDcSJr09Zpw4N8sQOSA+TAdmI1bDGLqHhmW0DgA+dJKPvqIkVyzk+VuaG1V6ZsSPJd6BIabbUC3ihOIDeFhJyeGQmAcNqyDzCIsAsjH56RPL+4AJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419816; c=relaxed/simple;
	bh=oRA1uXnvpsmjJQDCBwr+QMnYjfUCn926pHr/Oj5VxTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTDoxICBdj0ErezNlELuwfENhoiM8HUVIwjeI5j9zU9UY+zScLwGVEEmCRM/mcKIWpoXOCa/0lz8Yy+ovspKtvznEjtto4QjzuxstZ9FePJdwNem/ahXAiE+JGt3wzado9T5x9TIHlHEtHMCNRhuHChgQOQd55KigXG85V3nXP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmpzgA3p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Boa5c029231
	for <linux-gpio@vger.kernel.org>; Thu, 5 Dec 2024 17:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AaqtZOlfrn0s5WOa1v+zVEs6LfsFYydrC3W6W40E/bI=; b=LmpzgA3pcNpMy9CB
	VYfrvB4ziiUIsaFs8JBWG9lYuCr7+OwNUciD5v0+/eezBK+gojEkd3HIrm9zaKv6
	MXDnun4k4pl3frdE1wtTMNevPdyio6F0HBDykcdjGMQai96Nw6zwLG8P2nsBA1kR
	PbGZz9Xuy17upHmQHlHiuypX1fbpiS5kPPIjZOlwJO/1VH8O41pbHUwx6RkjrFcj
	j625YK4XgCUppXvS14a2dTo3Jjmwph0tBzX3n/e7Gof9FqhQ7cSugDvxEQjqgS6S
	pz9rT990eBnVrEbb/dl0FliNRMJifYdhAXbSSWe4zw34qboPVPZFOx82ZkQ9kLON
	lwZHmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj0ya7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2024 17:30:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4669114c62dso3020051cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2024 09:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419813; x=1734024613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AaqtZOlfrn0s5WOa1v+zVEs6LfsFYydrC3W6W40E/bI=;
        b=lYSlf24SQdDLZ2QnVhpbgzpHRYwMZJ/9iPB7VWjjBrQJXuI2ofa5zbZImelimO1E6O
         PleMFtPFAIKgr5S2g4pFtfCNq5co2OUAOGID3y+OYQMUtgTCG4oJqzgL+a0Lvrv4A11D
         rzR5srKmmaws4pS7F/ORgGeSkb6HolYXC9q5rsZKlDEz9R0d8GgIWUY1+BPa6KYrLNE8
         pmRYBLBe0B732h/y+iTGd8dL04fGweZdlQNvesp1KPIIKZDFel2iNYnOFgmqTz5+OauM
         lbat0cX85uuQ10k9UsZzjdUXXfsoOlqGi1qxSdTUM1e4J1bAXVXsfYSUCEb0f/iWdEvR
         x79A==
X-Forwarded-Encrypted: i=1; AJvYcCWO6TjFTwSRZaV/A63hEFMXK01azgHf6cLd5vrjiX3SimVVVo9EaCAVARv4odmfdl0lJzK2MxxXZZ++@vger.kernel.org
X-Gm-Message-State: AOJu0YyaoTR4WjznpoX2Og4SPjqonj/bpNojcl8bRkJIH3wXjYkRqpoc
	9aQ0ldG+kHqZzzpZ00HLGVseiWfCk5YsEk2PUFYJltlVhyH2o5M1zXUj2C4pShg+i3MULyx+tvv
	xTyRdheaA6ZPsrrKuOuvByaG4v7zbrctOSoJPdSe1y/MxJ1Yu8DHC3Uw33j93
X-Gm-Gg: ASbGncsfJMtfAyOcDxbipMr/Na92c2fTFuqqVLiGYjyRxoRRUOmb554G3Li63hEhrMi
	Lwf1HSrx34xtqFLfbdT8KWW2LgJKtH0Mg6xtl2WR71rTWaE/gvJBCcDtVguYcr9BY9Pq8L0MDcr
	sZubnWLXuse3Z1qU+/U0CRqTRbRyOZ2N+9ENU09G2brvq038B61nod/i1FkVEyYB211G06Dzvpm
	d9f3zzq2cjj/gpO7ss7PwUkRCNdO0hyRCb1hNGEHkk78VHUXy2+y8Ic1okK9GCptP8CcvnMfCyW
	9C8yWPm3pzv/LQ3fRLWbgQgqKp5vo7E=
X-Received: by 2002:ac8:7f07:0:b0:458:2619:45b4 with SMTP id d75a77b69052e-46734ce0fe0mr99951cf.7.1733419812737;
        Thu, 05 Dec 2024 09:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVXY2uZ+6FfU3SZe7AmGKYUL4OMFBVbnlBIZtVhOo7V9MP+Fxh/D8gWbwDaEuRWz8DmAjjtw==
X-Received: by 2002:ac8:7f07:0:b0:458:2619:45b4 with SMTP id d75a77b69052e-46734ce0fe0mr99491cf.7.1733419812145;
        Thu, 05 Dec 2024 09:30:12 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c799181sm1074740a12.70.2024.12.05.09.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:30:10 -0800 (PST)
Message-ID: <249fb0aa-5624-41cb-8a3b-c2e54dba87df@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:30:09 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: ipq5424: configure spi0 node for
 rdp466
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241122124505.1688436-1-quic_mmanikan@quicinc.com>
 <20241122124505.1688436-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122124505.1688436-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9ouNe1VMIMQ_dJcPkg8FRP65OeC2xGOT
X-Proofpoint-ORIG-GUID: 9ouNe1VMIMQ_dJcPkg8FRP65OeC2xGOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050128

On 22.11.2024 1:45 PM, Manikanta Mylavarapu wrote:
> Enable the SPI0 node and configure the associated gpio pins.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 45 +++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index d4d31026a026..6256216ca764 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -23,6 +23,36 @@ &sleep_clk {
>  };
>  
>  &tlmm {
> +	spi0_default_state: spi0-default-state {
> +		clk-pins {
> +			pins = "gpio6";
> +			function = "spi0_clk";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +
> +		cs-pins {
> +			pins = "gpio7";
> +			function = "spi0_cs";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		miso-pins {
> +			pins = "gpio8";
> +			function = "spi0_miso";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +
> +		mosi-pins {
> +			pins = "gpio9";
> +			function = "spi0_mosi";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +	};
> +
>  	sdc_default_state: sdc-default-state {
>  		clk-pins {
>  			pins = "gpio5";
> @@ -57,3 +87,18 @@ &xo_board {
>  	clock-frequency = <24000000>;
>  };
>  
> +&qupv3 {
> +	spi0: spi@1a90000 {

&spi0 {
	pinctrl-0 = <..
	...
};

KonraD


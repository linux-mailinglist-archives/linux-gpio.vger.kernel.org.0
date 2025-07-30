Return-Path: <linux-gpio+bounces-23899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 333ACB160D8
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 14:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49BBC547541
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 12:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091972989BF;
	Wed, 30 Jul 2025 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJqtUTJV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CB525D535
	for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880330; cv=none; b=BkJfeNFCMiHmutyLeHpv1eGtO0H87/vsXhgI8dKQ61CxUmz0SxU0T9pt+MJHkg7ozQLN6ujwhd97VlGbm+rd+w8eWEtThih0auRAWSbUhJg85bSmvzqIDQAFUtyS4HxjNyk/oJ2q/521b8H6q3t5DIhLkwiGBXJ+CCHqM9qVpfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880330; c=relaxed/simple;
	bh=qdoR/T1j974HV75S4tJQPO6oa6KOE5TIDMG6swHUT34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0dk2Tn2r9+nyO8ywzwx/ZE0YZrJ5Z2N9L3oivPRfehQYaduy5BOfAjDv+YerHI+byZE492Wfkv6nBitde9gZ99yVnY2vYT0/iAOoVLH0qygPnZZrjTV5DT4pGqk4TOMVFT2Gl2nAv1QhIBGK0RTa5LkUovMFY5vyHYFGGmj50w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJqtUTJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbBsU001384
	for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 12:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REl7hvnxlp9SuuNQcg8K3JJn1OMshdLROkXEqPTt0hw=; b=CJqtUTJVteGV3fk3
	UDHOk/lJylpmzDnVz73C8EOi2ZxnN8Yu1s8Aqdl7Z6Buch7wHd3l357Hg7gQ4tlg
	cTk5KsaWtiOowqWEGBb40+85BsWguXPpPef12JVGn6zMzw4pfCzvU8vTUPMJf6pi
	FCkkD9ARE+ggBj+T5DzPr0y5cZ9g+c76aIfqP8UTgMARP6z3W1XhfKv6dYCWp/eu
	HEk8MaH0eMcTMt8t+sndkbk6D4eqmb+qx7ron7c8KBBxMu+BmccryFfjMjdZQ68o
	jOlStstUnEpaE0bWou9w3BhNYUokxWSflslyoswqj9+NJyjfftLE18VqtzxmVU5p
	cIjjdA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q863yn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 12:58:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073674bc2aso3393116d6.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 05:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880326; x=1754485126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REl7hvnxlp9SuuNQcg8K3JJn1OMshdLROkXEqPTt0hw=;
        b=s4xfdQ+YSNru4CD3KVvwkx4qPik3G43xG/mGVuMO0AyReVT9igo9Lu8vZJ9v+xRsEs
         slvRu6/MloqGhCJp7rOqIlmvvpU8lkXUCIBYBUjiZohO3BVbly0ce1Fd4sUkF5bcxTAr
         hqfNLbpP+I7uJvor4nXTaiRG+RLiQ0UA13Nje8gOmC+7L1NUnJUdM4AQEOD2gDjE1s73
         HrEFirR7J83yUYlci2APauCnE5/lZIbzdGZ+hgLQD6J1d7JZyQ+uiV5cFJOFDC4j2PjP
         ODck6YBt7CIQ3m2ik8PZNoNGEw+3fFdlZHqxD29J/IUHqUVXZDTtlOZqUXv5rA0RFebL
         /udQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7i6bJg8u/NuSBA550TPsmBEp8ylkOMYSQJqSTZViqLbmvq7t5Tg6918zhaXCMLLYV6RR3gHXz8Uft@vger.kernel.org
X-Gm-Message-State: AOJu0YzSiKRjo4aESMfiiFbjFwZgg/JjnqjWad94nZ2yCRsxs/mCjkPG
	XjgxbOfsUhG/Ru24gPrR2e/o+pCn+J1H5pZ7RgaH3n9oDzLO17KWzh+Bwmn0t+asrtfjt7RoBAT
	fcH7Bdcy/IFbkuS5uNnwyGCIfVGSR7U3lKbTLned8DcBSe90c4y+5P7Qs4/baB9yW
X-Gm-Gg: ASbGncudWdgveJAig//ZCu42XWS63RSjfP1gCRmFyd/d2sNvN4s0GNWIe9me6+CuTHs
	UchMZAzAVgiO3qJeBYTbmOU/F+zeFjk3OlInLSG8LTXq6dvsuPWDCtOpau/FTKaCJcYzbcena5L
	6X744dP7eR194DustqmQqLPeuoHnWD3ybI+BBJTZ8wZjXCj6EPSo6mvrUx74TetZ8qmCydudqPY
	X/1XwOd1LGSN+ub6Cc2sjm1ewFVfFzmSpUeoEtviPNs7YahUc8ipaAYRWQuLpF952gU0SEaarVY
	CzC76f3FbEiW97SSBRV2mhRRrv5kqrUQkLpjC70mGxIaA0PSEx8OCh2uBwPKCM893fJNaazbTzn
	71dXbaarrHAhngnhQDg==
X-Received: by 2002:a05:620a:2546:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e66eec65e9mr236933785a.0.1753880326008;
        Wed, 30 Jul 2025 05:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvVN/RcoYodTnfrZL516pu8LNotIBvCtHLo8vMi2gcHequN79TtT5m4Nb7CMoeTdOjan/dqw==
X-Received: by 2002:a05:620a:2546:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e66eec65e9mr236931885a.0.1753880325583;
        Wed, 30 Jul 2025 05:58:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6154cf801fbsm3305166a12.31.2025.07.30.05.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 05:58:45 -0700 (PDT)
Message-ID: <7217ab5f-680a-41f1-9b90-3d68d4ce5e96@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:58:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
 <20250720173215.3075576-7-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720173215.3075576-7-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5MiBTYWx0ZWRfX1hRFXCqvJ4es
 0IwB3kfj5T37+wP4lcl/oZE1ZfVGhSpE73/BYrYij+EIvFeVhTox9synn7ERsyayFqcZR96XrQX
 F9WqEDCHDaiHTZoj81ELB2u4OYtQeZg7kWCiQf2LYCeA83HzKOfWKefzJtbp6bRcDBeGgr5ZTHk
 JHRjRpOcGjjPHLuUkqFRR0DqIeEk9MDwzV+123mDXElQez7aCNACUqDaofbqz3iOXV380x2pFpH
 RaUk2FzZJ07ISdAEwYwlBD3z8B9k7g9Ii5seXk1TGTVHD9dAtyN3mvsbW6hQsJ9vWGZUjb52bOI
 tGDz5/Qw5UAHzvKCO8giCGUsWEId55HIs7S0Ktaxa0dN1h15oRAVT+FjsM+mH7YSkaEB6MOFFDH
 a4G2a45BTgfVC16NF3wrr7e721xFwY0tETRFXi40CBQqJPcG3ST3xuDZSGNigRyH+xG0bNtL
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688a1707 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=_z6rx1Am3YmXwjxqEOgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rE_BMwxJhw3ffqoPMwfUCjBFvA2OeHea
X-Proofpoint-GUID: rE_BMwxJhw3ffqoPMwfUCjBFvA2OeHea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=697 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300092

On 7/20/25 7:32 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index ff5b3568c39d..fff92fd836ab 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2872,21 +2872,27 @@ lpass_tlmm: pinctrl@33c0000 {
>  			lpass_dmic01_clk: dmic01-clk-state {
>  				pins = "gpio6";
>  				function = "dmic1_clk";
> +				drive-strength = <8>;
> +				bias-disable;
>  			};
>  
>  			lpass_dmic01_data: dmic01-data-state {
>  				pins = "gpio7";
>  				function = "dmic1_data";
> +				bias-pull-down;
>  			};
>  
>  			lpass_dmic23_clk: dmic23-clk-state {
>  				pins = "gpio8";
>  				function = "dmic2_clk";
> +				drive-strength = <8>;
> +				bias-disable;
>  			};
>  
>  			lpass_dmic23_data: dmic23-data-state {
>  				pins = "gpio9";
>  				function = "dmic2_data";
> +				bias-pull-down;

If you're adding drive-strength to one, please add it to all of
the configs

Konrad


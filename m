Return-Path: <linux-gpio+bounces-28591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABFFC643A6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 13:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A0C14F2411
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 12:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF05B3328FD;
	Mon, 17 Nov 2025 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osiUHDMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQ3zusNH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA9332E153
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383465; cv=none; b=ZHIBdJiuDs3CCH+2CnmlUYe7H7GAAycWrHGdJmz91WSIT2qRpOzDPAZDh2NSpXz/70AoGoAVDi65UeOBhgdOtpAGfrzsF54OcqJ0NHLQOWQHkMGQddK9YmjiMkj9oA3ZxxcfaM9u8hNK/b3yrYvV85u/FrFSQPML7jm4BL/2Uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383465; c=relaxed/simple;
	bh=dnV1PFfch5mDdlabfhFaJhpPoXxmotqCnqwvhtEtBgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mh2Pl8cdtlH9IXjVmk7Nbo0u2tbh95DQerndBEeLK/GHSUfdr/3NXhMvjI80vwToYosORBZjg3ZR5b9MAjypvRxW/jsFZCg8gUGL74eyVvj5YZzJQEN/cHiBnyd2grtp6BBlSlXWzDqVM5kNbTuVNJ4FZfnG8a2xGoVfLv++hj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osiUHDMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQ3zusNH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHACHp33571889
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 12:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lftkT/tjklKe1rDPsuHn+wZY50mWongrOco3Ne99DQ=; b=osiUHDMo5WAbD+1K
	wm5y9p9ykN7rtVKrN6WhTDnKdruwteaLYkXwSpnnpGmH6saen51Io7MT1onrgvlK
	rUYopazMRwB1HymbrP3W2A+6VWDjgOpAnNGX2AbZDnhrqmcpwJ4WgJGy+ADuekLf
	x1ejtQ8dGhrcI5NS8zRcfSzvo9R5HOd5qoZvAVG0X0hL/G6Y7kEYi2z05GZ1ggeK
	Pv32QyWcK2rVMdfvoDxVc7baiT8wNUVXTbP8QvPACPZy4dlW65Hs2Jx/Xp5bvwqN
	ul0BbBwBtz5sxAZFQAwuFNtejrJrKZeay0cI1lidvU714ZfQtMcgrAn9pCva2WoJ
	AXBD+A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbrdmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 12:44:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed767bf637so4235021cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 04:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763383462; x=1763988262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/lftkT/tjklKe1rDPsuHn+wZY50mWongrOco3Ne99DQ=;
        b=gQ3zusNHDEy1ruzjJzIzOTTB8PIYgQ3SabSOBJym5BsgGX/r9D7FEjMsvCr7fW4LXK
         HbrDxG9h/gZxqCUcLsnmh4kTOFOENg+XHrWErFCLTreqLwC3wi3pf4Qa2MVOq67j8Fqv
         cbKXMW/r7jXAkwLU/Rhg5y4/Op5vRFtwPQlj7gt/w8n+YNhvWGTfjbQ2PQHVr72D7xht
         CJtodTWK7AHKq0bm7VDAcpcJ49Sqj3Ttr3OfhbtESTe5B4XdkqGqCszZdpGNBVta2g0C
         YxemhUSZz9OCLsxhXmOKUCIAEhq7S9gNP7FhOYZ0xJr2tKhWhf5CZC53DCfWxDQSVr1k
         /3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383462; x=1763988262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lftkT/tjklKe1rDPsuHn+wZY50mWongrOco3Ne99DQ=;
        b=qrqe5O3dnJhQ+qWABZ6rFBtpseCcz1/YatAf155pLfNVHPl7L+luWpdPCyGSqeNLZ8
         BC5oLzxGEeepX7PqVagVGHT2hwEsT5IO/RHuUvTEvZEvOEh1EuNwkS5Lm8GS+gefozN2
         B8czlgMvOYn6Je1lvxWGQvLkhFbV2Qw8uB+yMqxK2623aVfQX/DfvyEwr/ikUiEVX404
         HtVc/JZcaPLdtTrTQQ6Ov2qewBh03wpnRmdRvU3Bhsyu/rwCfEw5RN6j/mtM57Ma+Dvr
         Fu41MKeMvBIMAYy8fGpOyOLqAP//Nys5lINu9m8OKQt8ASS7RndBVjHqQAeUdUX8x8Ct
         ObsA==
X-Forwarded-Encrypted: i=1; AJvYcCUw0XaMELS94y2BpqI8i5w/j5Ch6m6n7HzKFY3uKxexGOHAv4+P73Ah70UV8OWBBK4oFCpb5/UwVNer@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2DXHicsjzsIf6/hZdqiAX7xiW/wci0KA3MT5HAih6CXqbPjbk
	/Q8UnWe5rMRzbAsH8exDZjqNNLPwwg1UvnVDOP6t3mfPj26m//k93Ejk99I65MTexwvPVjQ+Ymj
	Bx8ZPtD8kqaHLtjBmnMfNRKUiBZUWmALtVwYTGvAYa2FpYKfjFoQ/XVA5YLSKz4cG
X-Gm-Gg: ASbGncuwIbwPRf5aDNhQXQfRBhk2S2UFoT7qMF2beXCkCd+CWqMlvinr45KdQcJEdFP
	bv5yubTCeWJsXbpDoCFGbWXb1muT1m052BWq7Tq6tvO6tnFEDvsCwQr2VNhIYa3ttUDo/HX8gPU
	nwy2wqMapv1P0AmzfzSyqGG/NlrUWFTcuOOTG+h1Ad6i77d8qvcC/pvqpwwDydPh58Znfok4gXo
	CkwXkv2F7R12gD9O2EPOU+TdmS5PJjJXMYYvMWn5VDmDlfc/0CZl1CDIcR463010tDqUDaKq6k/
	NnoxwQD7bWZH1pmPDDi8HJ1bplNlzJmdLxZlR86bsP1RkPzPP1CuT0+AwCV/6WuZU4UIdtplc8B
	D/vDG/f6G8UDkerI2XQCfDGaJ277o2rosyEuI5qzK1FbOQ5wlYHScXALS
X-Received: by 2002:ac8:6f08:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee1063d7d8mr70733781cf.11.1763383461904;
        Mon, 17 Nov 2025 04:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHR33oOLsBt89AmYPqYYf6ff1bqIAYFfqdO1YyIpeWjwi0X8p/qCxou9qnDInOO3zMDw3qmA==
X-Received: by 2002:ac8:6f08:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee1063d7d8mr70733511cf.11.1763383461507;
        Mon, 17 Nov 2025 04:44:21 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad4487sm1100223266b.22.2025.11.17.04.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:44:20 -0800 (PST)
Message-ID: <8a2f9708-6f3e-4c4b-942a-8df7b4d6e127@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:44:18 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P LPASS pinctrl
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20251116171656.3105461-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116171656.3105461-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YO4pxQFcQSDi3yxLlB0D6kTWynhP4tnv
X-Proofpoint-ORIG-GUID: YO4pxQFcQSDi3yxLlB0D6kTWynhP4tnv
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b18a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=qV-wR8aR0mFXBdsaau8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNyBTYWx0ZWRfX+pFAkjtH9zZj
 C8UehjRo8Y70aBas7f7Be5IQxxkWQnmHJliaVWljCt8gQxVaAUYtLMbdke6aw5pnQSSdOctjmUT
 bOA54iyKRJpCoO+1kYz7Ia+pkxuKx8QnIXbhgHiSDvRn9nM22+MuXk0i5sdSbHllQJsoUNfubTD
 4t844qrz9oIwyKxySFstwJ90in25chUeNq208Ajr2NTue2Kof1GNuOEpaX3JdzTs7jzGA8I6kSk
 pouxt3+/mqLcmLfZJj8t9wDcLUIMF3tyR5r1QfASbsxOlKRdOvvMRAP8lR66fLME0nshDWx1dKM
 lsalNsr0VWG5DeZ9/vKbuPhFx/c9RkPecxlf5EMTY5zFkuJyeXMCHnZ5+rGGoJldXSVGI1jVTmO
 oGfULI9cbRiAWiORIPyC7bTzOiLHQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170107

On 11/16/25 6:16 PM, Mohammad Rafi Shaik wrote:
> Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
> of Qualcomm SA8775P SoC.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../qcom,sa8775p-lpass-lpi-pinctrl.yaml       | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
> new file mode 100644
> index 000000000000..01a56dbeaeff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8775P SoC LPASS LPI TLMM
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
> +  (LPASS) Low Power Island (LPI) of Qualcomm SA8775P SoC.
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8775p-lpass-lpi-pinctrl

Are the mappings the same for monaco? You can preemptively add the
compatible here too, if so

Konrad


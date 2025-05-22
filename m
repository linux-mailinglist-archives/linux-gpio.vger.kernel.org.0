Return-Path: <linux-gpio+bounces-20507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2963AC131B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 20:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A5281892473
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 18:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355731917C2;
	Thu, 22 May 2025 18:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9+C8ZOq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8682219E966
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937631; cv=none; b=c8WEbiKEPwjfna50ZjwHiBPTS/JXqMUbwZk2WBT3YozA56WSEdVC2WxrIWvKq5cs+2cdCu1T2JPrbLk2xr1ikcYo9fHllxeCC+c4FQRw09BEICL4hm72JUyAtjx0gwFZw3JJDjDz3mA3MmGlVfQkv6+msDyjjTEVPdPXlbiECmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937631; c=relaxed/simple;
	bh=91toqZEphZKmE9o/rBckXJd1FNa8ApcyPXqGQ8XvA6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3P9StouvYZYVWmhGLvjFbU69d0H0Dh90UlcYdiNE4XGgT570rS1nHVOlT00R2lf0XTyez4zaaYxyNE9EdqgjcUsasQDVpYPydeIeqGE7i9MM1GcQj2l44ezEH3ggQN7FoUV+zE1dzyF6J6eLDHi9IWJoFRPUFB4use4mzwMjUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9+C8ZOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH9evb016524
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 18:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJTXM+7S9NgTzSFFl+A5KpdMXXyd0FhjVTeFKwQdXKU=; b=m9+C8ZOq9cNDiEje
	5wxs2n8HsrWNecyEGl8XPaenZ8l/TfNUGfgDOLHH4O+ymVYY0lcn2F3CHzO33uS/
	T3WKZoKFLDhZ+Cl20uXtYL2HkeIKUNr/pWrRS0SFnpOyOOKEZa65GR2PMTPkegft
	nBSnioF31A6ywD7+UmqSuT+4+C76LNK4DU6queo2R0Lf3e4jICLhTFeiKGwehKAO
	oxqZvWmED6FJua0Bq1UwlzjHSzF9J0snSGtG3Og1o/fKcS8Fo5Qk/2nQ6Azf85+u
	yS9Mj6EJFLE6aH+2py6z1uZlugJB4zxQ5TaLNOP1bRg420ujQgcEJ+3olKFLYy4w
	pTt/0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9ya2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 18:13:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54734292aso224525585a.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 11:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937627; x=1748542427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJTXM+7S9NgTzSFFl+A5KpdMXXyd0FhjVTeFKwQdXKU=;
        b=nqY7Yk4CyE2RDRXIpLmzsFHUp7IC4sXWUVGymK397A9rMbIcKnCGXudH/S2whR5idc
         zUsH+d+CYNwKHcjgTtDA3I8auBmTyysy3rg2VNBJ58AT6EmHHe+QnakN/OZ4KRHg3KCG
         7IogNgDOkqwJdrdNg0UbYX7kSKzrVLqIhXx/6gyhTDiJlzdgUmDa6rgvqLjHEnn5ftpV
         V/zPYdTonAflKtXd4LU0iK7Dy1R4rqgbpJfnaKmUfiZ1tYx1hOKTYTJcn+0iN6TTT1b4
         TWsStjOXjuvVC5GO9H5oPEizJtV0Gw8aIUl45fYTQGtB1ibk/0JS8cgIacXFZmpIjxyg
         d8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAv3vAI5DP2ypYUg6me8W0nP1iPpL5hBWGBHIpOZL8Biz1JBkAeAQP6nzzMwhLdeKCFf8hH75tE9Ud@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8+9w6vlgw4bf+GC++lLTSL6tqeEGvBJr7gEnPl6hwNkXFnrO
	E6BSIK5I5+w+LT7TsDvWjaJVoENneWCD7aEPH/5UxO/VXw4JgNHg/8f535p5lJH4Rf0OHPMdnPv
	yCzTMUTqJ/lVimUioPCZbPXIWe7eDPHjQh2/7Au93vgR4+jEYM51EVJ1BuIbdXfH6
X-Gm-Gg: ASbGncuAKTNSG9ejf7HmBKGepIC1PCqET/mcFj9j1qktp0f6GA2AiS/6dqIVUZxVNEx
	4sIVILRdDoKBCguDjcoV7r3gzgU7SegNIQ7I/5MZE9l48kLXdJRwobUD4AwOiloYK3BvpJOY6al
	3WwqACkFyDggb1phzvmmBWkSoV0/Z+y0la45sFNB3Hob3I2YzZcKEnSl5/6CNeyCrygb+RWeSZz
	8lLHmmT5csgacAi8nF/lBmZcph26eHjtocw6gScqkVsVYNwH6DCAjyPOySSU1tgmiaPpIT6mEsq
	Sru+CefzsJW1E9dUYEn4jsCTuSFsnv55LlGY0nUwbEYGYT0JxWYfh18WwT1+L53Ibw==
X-Received: by 2002:a05:620a:6506:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7cd46779c90mr1645451085a.10.1747937626843;
        Thu, 22 May 2025 11:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG1s5LWcfdRcLuprDH7NRf4cIMqfzPMsVHaGaLchl1HpyhV9P/PLyDyxgUXuVubSzGN2Rrhg==
X-Received: by 2002:a05:620a:6506:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7cd46779c90mr1645448885a.10.1747937626412;
        Thu, 22 May 2025 11:13:46 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cdefsm1130366966b.52.2025.05.22.11.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:13:45 -0700 (PDT)
Message-ID: <c7d5dbab-0a51-4239-811e-dc68cac18887@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f695c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=75nCLt9WaoCjErCtZgIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0fflc905DvuvYCjH6Z9Bmx1kRpd89dCo
X-Proofpoint-GUID: 0fflc905DvuvYCjH6Z9Bmx1kRpd89dCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NCBTYWx0ZWRfX9VHPmmcVcOfo
 dnQoLlBYfOla2HwYqH05v2uD+5mkXTmTl2Z9YMaVAMBnbcTn2eJU5ZSCFJCTv1G1tMDOvRW+WzE
 NbBlyPKe/nXgbMNT0pQaOxbOGP6j/F+ooHkupscnkYIWIEboi7+eYkJOSxhRYA+JaT4OIAS9jLS
 mOp0mt4Su+SxjVmd1dR7deTi0n2MF7YP3iwdxf0Qe9YsU5YXn6ZMrNOSq2UYUHkUsGF00aICJ93
 zIajznhrGJzwMaiRWs8FPuT0YuXF8ushTzIFGlZf8JEMWwFjnCkurTuWL1ors2taKRwLMDIz3E4
 OYXpg4n5nxUsRzSytkQUZ+4uBNaKoSXxXJoo9eZBN5kZwtGCk9upXCBVkpvAdmcE602BOs9lHUA
 CbIkauj/nq53qGxWSPv5crKy7SccfrrZXNAqBLCPbBzfXpDFktnz39/BitnKRTPcutnzFOY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220184

On 5/22/25 7:41 PM, Alexey Klimov wrote:
> One WSA881X amplifier is connected on QRB4210 RB2 board
> hence only mono speaker is supported. This amplifier is set
> to work in analog mode only. Also add required powerdown
> pin/gpio.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108be96aad99acba21d 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -270,6 +270,24 @@ zap-shader {
>  	};
>  };
>  
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	wsa881x: amplifier@f {
> +		compatible = "qcom,wsa8815";
> +		reg = <0x0f>;
> +		pinctrl-0 = <&wsa_en_active>;
> +		pinctrl-names = "default";
> +		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
> +		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
> +		sound-name-prefix = "SpkrMono";
> +		#sound-dai-cells = <0>;
> +		#thermal-sensor-cells = <0>;
> +	};
> +};
> +
>  &i2c2_gpio {
>  	clock-frequency = <400000>;
>  	status = "okay";
> @@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
>  		drive-strength = <16>;
>  		output-high;
>  	};
> +
> +	wsa_en_active: wsa-en-active-state {
> +		pins = "gpio106";

Are there two separate enable pins? Or is the powerdown-gpio something
else?

Konrad


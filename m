Return-Path: <linux-gpio+bounces-20977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5DACD99A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 10:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 164F61893EB0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 08:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DE42040B6;
	Wed,  4 Jun 2025 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pU0ZQv6F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2C4264A90
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025229; cv=none; b=Jp7b9WFwhp6F/gy95mjuE6nyKhs5gmnr7CXYsMmgAK9TBPFNwdELajIGv5bIea/9Vi2rrZNPFB58FGrD9jZ7BW3uU8U/6Go6KWLplx8A5GVbuYgL1dMpz+C3pKImTHCc2iWSQIRaIs4SjcsJZaHDZ9QUWFbdSsGaUNnuoZuoBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025229; c=relaxed/simple;
	bh=JGb+bcQ7NdVKw0dLe5OBFj+zTR3c/g4nArMOnaZSxa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiArrJYVTXH0siGrXZAoJanKzIYUZAYuModFNrYAA5LMVYcAI26Jl6Yl/kiePyMqvcfMlsX5Fq7lflkZVTy6a2AI4WrDAb1/sDqm4fd7NzDbGoX82Hcdd8+th3K8/7Enh7yrBRRXelf5y8bjNPpZEjFQIVE1vKaVjIxnk0iV3fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pU0ZQv6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547Aj3A000678
	for <linux-gpio@vger.kernel.org>; Wed, 4 Jun 2025 08:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaRFKW90tCNGsHKMAQuGxaLk
	aZHa3/TSvu4/2YBRcCs=; b=pU0ZQv6FnO0i8aTtrrczIVeKRWlpCSRMfvG0Rcjy
	YboZDqCzyVe6UHk4mdT0OZJnREGDviF3MMx9BfKy2ef7p/hKj6hQ1Hi92z4aMs99
	icvMXuQ2Pis0SoODIQftgotDe7h0lJnTu9Cl4yuHQBGIjbPz7oQhLVICewCmCw1Q
	OF7IhwJf2O5zlruvxcwZWSlHTaClY2k74BkEY30MTslXPCj680oNRdTvRpF7JUMz
	795wNusnbdyCRVLGkymOK6IRhXZMJ6mr0cScMO72IIRFBcC4Ue4y8TIOKQoO2Kv+
	0VUAazL68NWJUHR+J2ksYmWv1DLQLvxZ+0ysMThAp5iiGA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q5ccu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:20:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fafc5092daso797556d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 01:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025226; x=1749630026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaRFKW90tCNGsHKMAQuGxaLkaZHa3/TSvu4/2YBRcCs=;
        b=n0sYsz2frE00Sic4SYk9FCo/qNh9l0F6tTHe4ejPyOpGvxRqaWpoJRXnSBpkBGDo92
         HpS7JG1RMY25tXVa3blbXhW+jZEghA3cEVjKIpcbFOC7PRUbP5mECNazm7wtFDqG4Mv6
         RaXIWd8h8LPiYk5KFMXpetmsui22eAUqklOt8vmSRXKl5KB1gLK2Rd5E4+XQBXRzxQxN
         aYaIPYSgTJRwwa0q0G7jPLYCrZ6f7VWB898ChYSdcFIRNedNw2nQFiSiLcGdHNskEs0a
         JBW2gPzx0FfCfRd5uVxniKuNJUR3hvNUZo1HS7NRrSdSXoHX5HxUyMx3Y9/qv1z3u0U9
         zbAw==
X-Forwarded-Encrypted: i=1; AJvYcCXAtUJ4/n/0bquU1NtwgSNMBXNUL+4XYBgFT60MucReKoyaJ83MlJ1PZ2LGeHhLsoeDONVoyOzHIIWk@vger.kernel.org
X-Gm-Message-State: AOJu0YwopWf6/a6vAJXh5b4r7JA1R8YuO5+gN75pVdi6E5xlyk0Xdzc2
	heGnHwNgcggg7KYP7ydwWRuzfcwK85FKqpE6pY8p53ZomW3oesfQlLOcEEJ2gIrQPqxvOQjOYJd
	aSO8gJfLWiiL10K6OWt3RhwgTOK7MTvduLIhLpTMH+gYP6yUC5N2BnYIXJg8l0DJNrh3cKm5tDA
	4=
X-Gm-Gg: ASbGncsFl0ZEdG3us8sVZEMhT42Tgnqysow5r23PKCaIWU+CZxrDdRTP8MTFU5ojgFG
	Ys+pI91QTNqq6eTGFW4Gz5OuY5MsX9GyicKzhrh9gttrncokt9FmxJ7p2wuWcDoMhwcM91E3nsm
	VUZlK/JFn9J9nQ29ljN5gntRsMJdzQoqZAr9lcr+bwLkyxaYMeIcBXHLbmSboRTeyCal974mfGN
	mmZigqdDj85csjEue8qlX6Q0Ax9Uldv1zAkvsnSH4bJPtz6nlo/DaafRS+Tn1MYCu4n1TEKyq7Z
	s+nIPHU9DStuUHt7XRzxP4cGhKVo76os1eWHCG2SOnipAmtd+u+f9sBHUhXV/g/I2i1ZPTelBwE
	=
X-Received: by 2002:ad4:5e8d:0:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6faf6a5edaemr36769346d6.1.1749025225864;
        Wed, 04 Jun 2025 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERKsmanwW4+EAKRRkksLhDnRdNukd08U7k5f/+bCH8VteShFBDGHrCAbfCdnarM2/Uk9qSpQ==
X-Received: by 2002:ad4:5e8d:0:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6faf6a5edaemr36769026d6.1.1749025225527;
        Wed, 04 Jun 2025 01:20:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bc4f55sm21266081fa.76.2025.06.04.01.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:20:24 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:20:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v4 5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
Message-ID: <wqirhpizetdi3o46grz4jrz2hyoosf3ih3qlxa6i3hqmimanjs@4oqczqllyek4>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-6-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527111227.2318021-6-quic_pkumpatl@quicinc.com>
X-Proofpoint-GUID: EpUYgfn5Xz3qBL1SA73zqzQVrlcBY2VH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2NCBTYWx0ZWRfX0tEXLeHlZZF7
 HcVkmZLlmRNIoMdxl351BperpyX7xJQex6Rjt2BmFL7+kKQwNmDERp9GrodrdlMXegQRe1Stdu6
 dxQWovi8JW5TJ0BoP6Lboakh6w/Co0JnBM3aZ7LRD5SYgiL4BS/0u2GpZkx2I2Yxjo2ewGdwgmB
 CrejL10vwa2Y9zHn2xFNMlxMzPpnIwaJ1EDPrUyFxTa7kICxmfcO+JBCAkWz3cusg+pkoFNQyd/
 sRfj0qH9FxHEcQtrRwDyMisFST13FUPvGLr7L+oGI5Po1CzSUiaM8z6Ntb38UYjB+vp1/mtFI5s
 8DCcXqlhtVFoFezUzHVCfYiLknmvBocDI6IqkamhEEa/aS/zhM9ogTM0Klsu1lOysRh/YMKnK/b
 opSZYF8qWbZatMdlJP/TT8ttE715YQfLUMQSvGWETy1wUM4/P3jPgDTgGfVwBpYuATwU2PLi
X-Proofpoint-ORIG-GUID: EpUYgfn5Xz3qBL1SA73zqzQVrlcBY2VH
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=684001ca cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=B248RJrvpR2VuhuRRl4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040064

On Tue, May 27, 2025 at 04:42:24PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 18 ++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 4111091f77b2..542a39ca72bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -11,6 +11,24 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
> +&lpass_dmic01_clk {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&lpass_dmic01_data {
> +	bias-pull-down;
> +};
> +
> +&lpass_dmic23_clk {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&lpass_dmic23_data {
> +	bias-pull-down;
> +};
> +
>  &lpass_rx_macro {
>  	/delete-property/ power-domains;
>  	/delete-property/ power-domain-names;
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 5fbcd48f2e2d..21cb392c36fa 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -19,6 +19,7 @@
>  #include "pm7325.dtsi"
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
> +#include "qcs6490-audioreach.dtsi"
>  
>  /delete-node/ &ipa_fw_mem;
>  /delete-node/ &rmtfs_mem;
> @@ -765,6 +766,14 @@ redriver_usb_con_sbu: endpoint {
>  	};
>  };
>  
> +&lpass_va_macro {

[   10.942165] va_macro 3370000.codec: qcom,dmic-sample-rate dt entry missing


> +	status = "okay";
> +};
> +
> +&lpass_wsa_macro {
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> @@ -1039,6 +1048,32 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&swr2 {
> +	status = "okay";
> +
> +	left_spkr: speaker@0,1 {
> +		compatible = "sdw10217020200";
> +		reg = <0 1>;
> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrLeft";
> +		#thermal-sensor-cells = <0>;
> +		vdd-supply = <&vreg_l18b_1p8>;
> +		qcom,port-mapping = <1 2 3 7>;
> +	};
> +
> +	right_spkr: speaker@0,2 {
> +		compatible = "sdw10217020200";
> +		reg = <0 2>;
> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrRight";
> +		#thermal-sensor-cells = <0>;
> +		vdd-supply = <&vreg_l18b_1p8>;
> +		qcom,port-mapping = <4 5 6 8>;
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


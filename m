Return-Path: <linux-gpio+bounces-25400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB56FB40820
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 16:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 822A1189A981
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858583128CD;
	Tue,  2 Sep 2025 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcFWa8vW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373342DFA26;
	Tue,  2 Sep 2025 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756824700; cv=none; b=kuVOAilCEOw3Hwf6lYtjbyp0k/lcdyxdXHtFHk4Nabi8u3wFVG2QWLvLRuwDWSU+zX4gmdgdzJVEQUYLRCRrcZi9nXs8XZnxs09tKJ3IAKDGCIMDNIg4Ey3ChvH5m/ZgNubaDEPqBBYC956BcaUUY3VAiswJ5K6o910psxAOkFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756824700; c=relaxed/simple;
	bh=b37E1Q+N23pT46YkYY9IK/lkNbzMf3Zsz7EbTF3ctUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVuSpEoiRpCSo16Ctm2yYPdT8gJrtodHnnj/dAKkehkWYwPTygiqOuxqcuAC8k5C4lOX0qk8V1oaVRm96QOu9RORapO38vimk53q5aIMkGaqUOPgz/PK3xCu6drVxt0YrnJqJ/hNOs2nfoZTkB5UOxqoNcNR37ZgTPgwXfA2M7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcFWa8vW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EABCC4CEED;
	Tue,  2 Sep 2025 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756824699;
	bh=b37E1Q+N23pT46YkYY9IK/lkNbzMf3Zsz7EbTF3ctUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KcFWa8vW9lALcC7oUDIaDCey6FU/dJsGePh6HZmfYNSbspr2ff70qozIZ2dqC7Ify
	 q0PkmZjGtCoaoERqG1sRqPe2RwKBL6COWXn6KT5gI1QZGAv2GmgpZeFSv1aQbe1opU
	 ooslCd146AS/52XtoLFC+57IEaxRk/w3gi1LbYrp09X8XVFqde3Z/DMBFMKQ6JMlpD
	 nmGNcjp93gFzTNLEXGx7BJiwYFkKixXtoXcOOYUScenFps6poenJ2ZUVRiwbk/axM5
	 PTcuXnY8xTrGTJ1DQ6Cn2qo7nyWWpXbeOAEC2hruc6ehWgWbwzoPbvigZWm4PsfwEn
	 /dPkegQhfR4UA==
Date: Tue, 2 Sep 2025 09:51:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, kernel@oss.qualcomm.com, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v8 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
Message-ID: <arjgotmhd6b3ip2cvyvl74nanapqxleeeyxg63m6ike7osrjw7@gqp44che72gn>
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
 <20250821044914.710044-7-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821044914.710044-7-quic_pkumpatl@quicinc.com>

On Thu, Aug 21, 2025 at 10:19:11AM +0530, Prasad Kumpatla wrote:
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
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  6 ++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  8 +++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 6d3a9e171066..078936237e20 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -58,6 +58,12 @@ &lpass_va_macro {
>  	clock-names = "mclk",
>  		      "macro",
>  		      "dcodec";
> +
> +	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
> +		    <&lpass_dmic23_clk>, <&lpass_dmic23_data>;

Does all QCS6490 boards with AudioReach have these two (4?) DMICs? Is
this board-specific or generic?

> +	pinctrl-names = "default";
> +
> +	qcom,dmic-sample-rate = <4800000>;
>  };
>  
>  &lpass_wsa_macro {
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 7509c27bd3f8..09e2cb9053a6 100644
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
> +		reset-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
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
> +		reset-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
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
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index c51c38cf147a..d472de18296b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3001,21 +3001,29 @@ lpass_tlmm: pinctrl@33c0000 {
>  			lpass_dmic01_clk: dmic01-clk-state {
>  				pins = "gpio6";
>  				function = "dmic1_clk";
> +				drive-strength = <8>;
> +				bias-disable;

Does these settings belong in the SoC description? Are they fixed for
all targets of sc7280, or are there any board-specific variations? Any
variations based on which audio solution the board implements?

Regards,
Bjorn

>  			};
>  
>  			lpass_dmic01_data: dmic01-data-state {
>  				pins = "gpio7";
>  				function = "dmic1_data";
> +				drive-strength = <8>;
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
> +				drive-strength = <8>;
> +				bias-pull-down;
>  			};
>  
>  			lpass_rx_swr_clk: rx-swr-clk-state {
> -- 
> 2.34.1
> 


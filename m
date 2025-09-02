Return-Path: <linux-gpio+bounces-25399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14AB40790
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 16:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55D831885D19
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7429F2E0407;
	Tue,  2 Sep 2025 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvFR6Jxf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EED84414;
	Tue,  2 Sep 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756824476; cv=none; b=QR7Q+nwgmF27RP5r5KIyd3pCCHCoBAC7szH5F56VYycVlBccu99A8Sj5lIEQxqFFG3MupF4ODxLSkyhb3bAJk/SyL16kXAaVTLaLJ6YI8YpAQmaxUUM90Tp/VO3Pm2w/gFJmVWTvEbj8miy3LGhmEhCfdW+mIJlN9o5WpN8pM40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756824476; c=relaxed/simple;
	bh=1/NqJEzfCoxj8NArs4pfMLC+ZS6/N/BXOUx2E94UzTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dL1HKrN+vwRVCaaNRYfBu3OVeKKBoJR16cRfu3u5m9+O/0GYgX/nunrkeE13Dg4iXDQfot9TJ5c9p2JAneP8lWNbKHcSWCv9Ztl+zHIIjDM7eXFnLfy/ldaQBW7YqUvZ9DcMOBlqFVxxAD+84oFn3BtKtVtqeA50IGF1ta7iF+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvFR6Jxf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5F6C4CEF5;
	Tue,  2 Sep 2025 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756824475;
	bh=1/NqJEzfCoxj8NArs4pfMLC+ZS6/N/BXOUx2E94UzTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvFR6JxftzO8TgWPnGeuO7iiMxXCA7/nFkI0cpgLdHtSfKbxCBeUNHQ+J9iK+yX1Z
	 IiC3PGmM4Rke4+vBwJmOmlaJ3W3G9tapUWnO8940j0n7jVrrQmjS8fD2/NpZFxlI/0
	 q0wJFu5K9vFR9ObEFiUCH9DbBjryeV8sLKJASzgFI7JfBvg1aKYof/SgU52AbOhFTn
	 aI0WcJt1T2x/+nnHSnd6komGBsMEmhzVN4yUUR34kVT5KQQk/lkubK7p4O8zVrk4Z9
	 EdtWXghdx85Lw9oUQCAuRohQlWK3QPPkDBXfL62ocxgbM/ABuNXUfjVALHmbVEbSn8
	 jWcPbHsgH498g==
Date: Tue, 2 Sep 2025 09:47:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, kernel@oss.qualcomm.com, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 5/9] arm64: dts: qcom: qcs6490-audioreach: Modify
 LPASS macros clock settings for audioreach
Message-ID: <fcdjq6mevt2d2oz2o43ityogugv5ahrwedkweyqe6qoxqmrfnv@y56wqkllssqu>
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
 <20250821044914.710044-6-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821044914.710044-6-quic_pkumpatl@quicinc.com>

On Thu, Aug 21, 2025 at 10:19:10AM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
> through the q6prm clock driver.
> 
> For qcs6490 RX drives clk from TX CORE which is mandated from DSP side,
> Unlike dedicated core clocks. Core TX clk is used for both RX and
> WSA as per DSP recommendations.
> 

This differs from all other platforms, so please make sure the commit
message explains why.

As with patch 1, is this specific to qcs6490?

Regards,
Bjorn

> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 282938c042f7..6d3a9e171066 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -12,6 +12,67 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
> +&lpass_rx_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&lpass_va_macro>;
> +	clock-names = "mclk",
> +		      "npl",
> +		      "macro",
> +		      "dcodec",
> +		      "fsgen";
> +};
> +
> +&lpass_tlmm {
> +	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +	clock-names = "core",
> +		      "audio";
> +};
> +
> +&lpass_tx_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&lpass_va_macro>;
> +	clock-names = "mclk",
> +		      "npl",
> +		      "macro",
> +		      "dcodec",
> +		      "fsgen";
> +};
> +
> +&lpass_va_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
> +	clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +	clock-names = "mclk",
> +		      "macro",
> +		      "dcodec";
> +};
> +
> +&lpass_wsa_macro {
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&lpass_va_macro>;
> +	clock-names = "mclk",
> +		      "npl",
> +		      "macro",
> +		      "dcodec",
> +		      "fsgen";
> +};
> +
>  &remoteproc_adsp_glink {
>  	/delete-node/ apr;
>  
> -- 
> 2.34.1
> 


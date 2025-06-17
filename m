Return-Path: <linux-gpio+bounces-21713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A8DADDD64
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 22:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEBC94A0828
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 20:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2433125485A;
	Tue, 17 Jun 2025 20:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7TPalyN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44B42EFDB8;
	Tue, 17 Jun 2025 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193152; cv=none; b=MgEAofEYdRXlOBVLTI4/2XjudriQgxEgzZmEHjBwIWhWWznuzud0fy3wjqooJBebQqakOArRFuJhJXvXDwpIxpJu00b+ymBxsOp5XY4Lh3HeWLF5RSXwltitHQKD3j73tfIm2zcjBDvMUVWUVj04jjtxJOBQqkXhlGbuCiR+Wh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193152; c=relaxed/simple;
	bh=Tx8+d2nD4wLUvww1aSh8rXSe19KajEylICAhrQR2kpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ae1yCijF/RQeOx9C1ip4W3k8TWB81gvemJNo7zfoGklKUicZwSLnx2hSu1WKmdjmB6KzN2+tIIs+VIq8aCMMRkKJKjNCdwkZyC4bWuaWdZCEXpPGO/Ya3iPO8nsxNVPcGsWcwbrWA10xrJE//Mz0eXGnzzjZKI9ZC01//h9wMTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7TPalyN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC74AC4CEE3;
	Tue, 17 Jun 2025 20:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750193152;
	bh=Tx8+d2nD4wLUvww1aSh8rXSe19KajEylICAhrQR2kpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7TPalyNaweNsA7yHTQHpg3+Lba52Ul2KBIUw8QFnISPSlkn21pcWoGlJTM44m0wX
	 7vgh53i0mA7KwApa78gy0U7DTLlgxw8nkPPq+kQ8+iOnKm0MnDeXoje0yvE6tANqCF
	 gMdHzMD5UO9QXaKFgPP5W06oy01V+P4Kp+0jg53Z1GtAP3JkkumuYwzgSbJu0WRnNg
	 NXlYoqjsZX61VNgNPe0kBWrbdfow4GP/rKrIwKnWHgFJext7qAVi1OQMqdSrgKsT9u
	 F7igQi6yqvltWa+JLsvdXvbCu7yFuroPEKCLEgKTm4O9o09tVS4IMRX6NwyMvH6mHu
	 t3FP74ai9hG/Q==
Date: Tue, 17 Jun 2025 15:45:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, kernel@oss.qualcomm.com, 
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/8] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
Message-ID: <q6rbvbvejugioon6l23nmmzeue7l4bgtlaf44o3a4krj3lytjp@p3y6opl7vs25>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-2-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527111227.2318021-2-quic_pkumpatl@quicinc.com>

On Tue, May 27, 2025 at 04:42:20PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 

This should talk about the choice of adding a new "-audioreach.dtsi"
file, and should cover why it wouldn't make more sense to add the
opposite of this change in sc7180-trogdor.dtsi.

> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 53 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
>  2 files changed, 54 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> new file mode 100644
> index 000000000000..29d4a6a2db26
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0-only

We can be more permissive than that, please use BSD-3-Clause.

> +/*
> + * qcs6490 device tree source for Audioreach Solution.
> + * This file will handle the common audio device tree nodes.

"Common audio device tree nodes", but not those audio device tree nodes
that are already specified in sc7180.dtsi...

> + *
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/clock/qcom,lpass-sc7280.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +&remoteproc_adsp_glink {
> +	/delete-node/ apr;
> +
> +	gpr {

Glink only consider available (status = "okay") nodes, so if there's a
even spread across AudioReach and not, we could even move this to
sc7180.dtsi and mark both status = "disabled", and have the appropriate
one enabled for each board.

Regards,
Bjorn

> +		compatible = "qcom,gpr";
> +		qcom,glink-channels = "adsp_apps";
> +		qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +		qcom,intents = <512 20>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		q6apm: service@1 {
> +			compatible = "qcom,q6apm";
> +			reg = <GPR_APM_MODULE_IID>;
> +			#sound-dai-cells = <0>;
> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +
> +			q6apmdai: dais {
> +				compatible = "qcom,q6apm-dais";
> +				iommus = <&apps_smmu 0x1801 0x0>;
> +			};
> +
> +			q6apmbedai: bedais {
> +				compatible = "qcom,q6apm-lpass-dais";
> +				#sound-dai-cells = <1>;
> +			};
> +		};
> +
> +		q6prm: service@2 {
> +			compatible = "qcom,q6prm";
> +			reg = <GPR_PRM_MODULE_IID>;
> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +
> +			q6prmcc: clock-controller {
> +				compatible = "qcom,q6prm-lpass-clocks";
> +				#clock-cells = <2>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index b1cc3bc1aec8..708df3f08984 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3814,7 +3814,7 @@ remoteproc_adsp: remoteproc@3700000 {
>  
>  			status = "disabled";
>  
> -			glink-edge {
> +			remoteproc_adsp_glink: glink-edge {
>  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
>  							     IPCC_MPROC_SIGNAL_GLINK_QMP
>  							     IRQ_TYPE_EDGE_RISING>;
> -- 
> 2.34.1
> 


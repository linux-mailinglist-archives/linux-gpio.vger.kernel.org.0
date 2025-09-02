Return-Path: <linux-gpio+bounces-25397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 103FBB40776
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 16:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51E333BD0FD
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51C9320A0A;
	Tue,  2 Sep 2025 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GG4F4Zrv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9414131E0FD;
	Tue,  2 Sep 2025 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756824240; cv=none; b=gkFdQYR2XP1kaLWjvHDAIzXr9YRCFh4Mf9hA56iIiTtZq8jsxSj0Wf9IwEFusaZz/PaXSaWMCIV0zZkphAC7LxCHpN2Vdlxe9FKEUvVZIAzTpGcDxoNx4WYwLwtEMpMa/pblxcf7zsf5LqarpW2XyKQh+qkq4HUUYxPWqrbmXlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756824240; c=relaxed/simple;
	bh=TvLmx2t15DCYplk5aWh9TQgIG8CqvqbsaQU4DvFndfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ol8YmDTJJwk4TgfeXQF9WmkeCxtHaaoi7HRzWMhn/ly7HOqxutfdnRXUurtMXSi2cJIEHQsk7j3LdUAda7FrQtza1C+7oUg0ghKyIwhUYdCOxRW9Ue6meRgB4yS5qnMHBA56V0cSOACO366MVNc+YbDDtVnwjmdha4Hn1PkmbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GG4F4Zrv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE6FC4CEF5;
	Tue,  2 Sep 2025 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756824240;
	bh=TvLmx2t15DCYplk5aWh9TQgIG8CqvqbsaQU4DvFndfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GG4F4ZrvjgPWwH6BLpgtnVdKDAqbl7kDKWLTVwpGTe230qpgrspewf0Gf+Vw0048p
	 Wj2BwLZRP4N7DZE3BmzFeUo61XquTiwr8Js5rdVb3KFCsxL//8RfkAc0CtfbNrFfgr
	 OrxQZXZrcqHD/oyloG3SYjRF/bDdNkrRmIJUnkVaIb6PV+htv8XOK+bCITNw0XXrIJ
	 VkAbfzT0tUK18d30I4aN2FHfEzYfOPLEcF8yvUGgzvOMWIW46fjuPvmte6EAqF/r80
	 mVrPv0rGG1sOMbQ0LwdZLxMK2KluhLIz3xhvK2Cmh0h4P6WMSs/m1ijFmCyL9oanqt
	 MWcinHnDbCTXA==
Date: Tue, 2 Sep 2025 09:43:57 -0500
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
Subject: Re: [PATCH v8 1/9] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
Message-ID: <4yo7v7whxffebzhoxkbpm226vsj2twc56xuf7etwwcyfrf2lzh@x2udmlhvdiwu>
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
 <20250821044914.710044-2-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821044914.710044-2-quic_pkumpatl@quicinc.com>

On Thu, Aug 21, 2025 at 10:19:06AM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Subject says "add gpr node", that sounds insignificant, but the patch
actually introduces the structure for how to model audioreach - and will
set a precedence that others will follow.

It must be clear from the commit message why this is a separate file, so
that others will understand, now and in the future.

> 
> Add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
says to start your commit message with a problem statement, that makes
the reviewer understand which problem you're trying to solve. "Adding
GPR node" is not the problem, that is part of the solution, it should
come last.

> 
> A new qcs6490-audioreach.dtsi file has been added to
> update AudioReach specific device tree configurations.

"Has been added"? When?

> The existing audio nodes in sc7280.dtsi, which were designed
> for the ADSP Bypass solution.

Please complete this sentence.

> The audio nodes now being updated
> in qcs6490-audioreach.dtsi to support the ADSP-based AudioReach
> architecture.

No, you're not updating qcs6490-audioreach.dtsi, you're adding that
file.

Please start your commit message with a description of what exists
today and why that doesn't fit your need, explain why we need a separate
file to carry these things. Make it clear why the bypass solution should
be kept in sc7280.dtsi (isn't that design only used in
sc7280-herobrine?).

Also, is qcs6490 the only variant of this SoC that comes with
AudioReach, what about QCM6490 and SM7325 devices?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 54 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
>  2 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> new file mode 100644
> index 000000000000..282938c042f7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * qcs6490 device tree source for Audioreach Solution.

That's pretty much what the file name says as well. It might make sense
to leave a comment here, but if so make it useful.

> + * This file will configure and manage nodes from sc7280.dtsi to
> + * support the AudioReach solution.

So far it's only adding things, not configuring and managing (which
isn't something DT does anyways).

Also "This file will" implies that in the future something will be added
here to deliver something. We don't communicate intent like this, and
once you add that thing you intend to add in the future this comment
won't be useful.

Something like this would be better:
"Common definitions for SC7280-based boards with AudioReach"

But I think that too can be derived from the file name. So, let's make
sure the commit message for the change that introduces the file has a
good explanation.

> + *
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.

I think this would look better above the comment. But please use the
right copyright statement.

Regards,
Bjorn

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
> index 0dd6a5c91d10..18e959806a13 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3944,7 +3944,7 @@ remoteproc_adsp: remoteproc@3700000 {
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


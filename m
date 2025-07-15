Return-Path: <linux-gpio+bounces-23331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B36E7B0695F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 00:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4ADD1AA773A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 22:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D1E2D028A;
	Tue, 15 Jul 2025 22:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttLO7oF4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C4C341AA;
	Tue, 15 Jul 2025 22:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752619345; cv=none; b=nfD4nvAA0vYmPR2K06gXdQvzac95UjesZf4ksUL5lNMRbnankBveGr0M/3FSm9hv1x2t5YjX84qU2F9XYj8ZNXYfBFCTwneL030rSvNGKIS7XMrdKmdxVI5IYb+48m2i8anXUVaT97te/ANsc6FErKTIRhZNFJl67Wx0KuOMWXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752619345; c=relaxed/simple;
	bh=6PGhNoSSpzU436t1MgShajILLt63m4NUhYSkK6S2+w4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nMjSDKwuJFWgmEvPiRVlXHevGgY6fTWMbWIPn6OFk+n+QB1Y+jipcsf0Z1sUc2/VA7WPC+Yc0dI0qx4sOi10fH5M2ppOw8ZxyWoDPhwZe2jsQ1vu40wNbzOroq4NsVIxz747qjWBUgY1lLahbiQ0fmOzSrxnZAwbkgme0HPRG9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttLO7oF4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A6DC4CEE3;
	Tue, 15 Jul 2025 22:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752619345;
	bh=6PGhNoSSpzU436t1MgShajILLt63m4NUhYSkK6S2+w4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ttLO7oF47PNe7eCzr73bXOcFgHKbu2LrK15Kcx+3pYex6kHgQBQ9OR8KcBW4AkT41
	 xQWHGfpGqantSGukFDF0T6AsUY3OBoDre63mkj7waauVcdXRZxYU02NHK0EA8/L+i6
	 E3zT+wOVMdozL2FJfpufRe1F9z+GVgZvfEmqXBWjxK5VSiK9pYV+aW5+M9XSIT8Zx5
	 xpwIIaPp9aPdY7HLVYi9+3SeIbzzVRnmLhAHJigPGugh+uepEDMF+3RRZbG+DO4MQk
	 2G2JNHe5ZvwgTsr4Hgdrh4WYdOeGnItwaoCesxmlNyPtDFG61VegftYW5K5vYC0AzF
	 S2oTHaOz+6Zmg==
Date: Tue, 15 Jul 2025 17:42:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Mark Brown <broonie@kernel.org>, kernel@oss.qualcomm.com, 
 Bjorn Andersson <andersson@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
Message-Id: <175261922788.2276498.1826325869057758315.robh@kernel.org>
Subject: Re: [PATCH v6 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards


On Tue, 15 Jul 2025 23:30:41 +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
> The updates include adding the necessary audio device tree support and the required
> dependencies.
> 
> Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC
> platform. Therefore, the audio support changes are included in a single patch
> set for consistency and ease of maintenance.
> 
> ---
> This patch series depends on patch series:
> https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/
> ---
> 
> changes in [v6]:
> 	- Addressed the review commnets in dt-binding patches from Krzysztof Kozlowski
> 	- Link to V5: https://lore.kernel.org/linux-arm-msm/20250625082927.31038-1-quic_pkumpatl@quicinc.com/
> 
> changes in [v5]:
> 	- Added separate patch for QCS6490 pinctrl bindings.
> 	- Updated commit message with more description.
> 	- Addressed the review commnets.
> 	- Link to V4: https://lore.kernel.org/linux-arm-msm/20250527111227.2318021-1-quic_pkumpatl@quicinc.com/
> 
> Changes in [v4]:
> 	- Fix DT binding errors by adding dt-binding clock changes for ADSP base platform.
> 	- Link to V3 : https://lore.kernel.org/linux-arm-msm/20250520062618.2765109-1-quic_pkumpatl@quicinc.com/
> 
> Changes in [v3]:
> 	- Added protection-domain in gpr services.
> 	- Addressed the review commnets from Konrad Dybcio.
> 	- Fix DT binding errors reported by Rob Herring.
> 	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250429092430.21477-1-quic_pkumpatl@quicinc.com/
> 
> Changes in [v2]:
> 	- Created dtsi file to handle common audio nodes to support Audioreach.
> 	- Addressed the review comments.
> 	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250317054151.6095-2-quic_pkumpatl@quicinc.com/
> 
> Mohammad Rafi Shaik (9):
>   arm64: dts: qcom: qcs6490-audioreach: Add gpr node
>   dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the
>     clock property
>   ASoC: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to
>     support ADSP
>   arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
>   arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
>     settings for audioreach
>   arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
>   arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
>   arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
>     headset codec
>   arm64: dts: qcom: qcm6490-idp: Add sound card
> 
>  .../qcom,sc7280-lpass-lpi-pinctrl.yaml        |  16 ++
>  .../bindings/sound/qcom,lpass-va-macro.yaml   |  29 ++-
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 207 ++++++++++++++++++
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 121 ++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  80 +++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  97 +++++++-
>  6 files changed, 543 insertions(+), 7 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> 
> 
> base-commit: a62b7a37e6fcf4a675b1548e7c168b96ec836442
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit a62b7a37e6fcf4a675b1548e7c168b96ec836442

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250715180050.3920019-1-quic_pkumpatl@quicinc.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: speaker@0,1 (sdw10217020200): 'powerdown-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: speaker@0,1 (sdw10217020200): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: speaker@0,2 (sdw10217020200): 'powerdown-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: speaker@0,2 (sdw10217020200): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa883x.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[363, 364]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[363, 364]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#







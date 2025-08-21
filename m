Return-Path: <linux-gpio+bounces-24769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1FAB300E6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 19:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED6318937E5
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 17:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84F73054C2;
	Thu, 21 Aug 2025 17:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZ/s+UCx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AC71F3B8A;
	Thu, 21 Aug 2025 17:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755796785; cv=none; b=OLznfaSzQryqTE6sQGDuRHw8b5ZKvmZWXKx1DXMMr44M6byZkDJA314Fvaeqy9UaEnoxWl2yaOk3GbT/6AjU920sA4jCrxjbDtsoGGn2ozF8zPE3kJO+lIJg4zw3qd/t5cUYDg9MNPwvvmTGZC9SUn6lBjb+kgoHZNs59mcGwRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755796785; c=relaxed/simple;
	bh=IHK0B0vbjFIm7tiUW5zNchHrSbYpWhq6dFSoqlxbP+E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=W93W6qL09PzGEu2aa77/JOndTRwXj6iOJm+MOqEHJeOUuEIIMsf3nRQSXtlmhBJeIxQuZ4AdlRx5SSgHK2Wwm2kvTzslCnMZDSfUGrTFjEL0M2vzPlgeApoZkwFj/PDUutQA5/vTCJJJKhjinU14S5sNG/SSU/7oqfHwTSbVkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZ/s+UCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5177C4CEEB;
	Thu, 21 Aug 2025 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755796785;
	bh=IHK0B0vbjFIm7tiUW5zNchHrSbYpWhq6dFSoqlxbP+E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qZ/s+UCx9zJ7A6OILHKr08EaK+Kqn0vd34RzrnT+C2XPIVpzlGGCAHIdg3LTC7glu
	 hXHfQEBAslXaywDV7aVUSS8a8e2T4E7Td2VON9C8I8ZPeXtKyfyRzm8736MXLocYN9
	 U2p+s4GUInwmuHNP+wAHqU3QNHIojNw3TnGnaMmD8k+2Hr89XvNWHa1vTJI7gKmeoG
	 hFd0MdKk1P6QhJ1E+NACKAR66V8si2F60z+bIpYqusaV+KLrXKpOtrquXayG8Ji3S5
	 6W0NYoglLQegO+BnuGolIFcNfp2s5FqeGFsRxQHsEXmwbM+WNzxH5xGya2/Ef9xEvN
	 uIh0i/bhYRtOw==
Date: Thu, 21 Aug 2025 12:19:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, linux-gpio@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, kernel@oss.qualcomm.com, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
Message-Id: <175579643373.37269.13580204801598375110.robh@kernel.org>
Subject: Re: [PATCH v8 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards


On Thu, 21 Aug 2025 10:19:05 +0530, Prasad Kumpatla wrote:
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
> changes in [v8]:
> 	- Added drive strength for all lpass_dmic pinctrl nodes reported by Konrad Dybcio.
> 	- Rebased changes on top of the latest kernel tree.
> 	- Link to V7: https://lore.kernel.org/all/20250720173215.3075576-1-quic_pkumpatl@quicinc.com/
> 
> changes in [v7]:
> 	- Addressed the review commnets in dt-binding patches from Krzysztof Kozlowski
> 	- Rebased changes on top of dependent patches
> 	- Link to V6: https://lore.kernel.org/linux-sound/20250715180050.3920019-1-quic_pkumpatl@quicinc.com/
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
>  .../bindings/sound/qcom,lpass-va-macro.yaml   |  23 +-
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 207 ++++++++++++++++++
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 121 ++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  80 +++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  99 ++++++++-
>  6 files changed, 540 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> 
> 
> base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
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
 Base: using specified base-commit 5303936d609e09665deda94eaedf26a0e5c3a087

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250821044914.710044-1-quic_pkumpatl@quicinc.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[366, 367]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[366, 367]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#







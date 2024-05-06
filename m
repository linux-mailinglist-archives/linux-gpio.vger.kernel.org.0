Return-Path: <linux-gpio+bounces-6173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B368BD664
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 22:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3198282D0E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 20:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A0615DBC0;
	Mon,  6 May 2024 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLrY7MlZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B03115DBAB;
	Mon,  6 May 2024 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715028034; cv=none; b=n8HITDT6bUfcecLBzGsal0pfNpMBpt2iJHZZ7CnfsTzboyEgWvejbX0ym6kzj9Hrx3DVRPwf0K6fcsC2v+Ml7f1yjOe8pINt+w2rSuwJ3AXlmkzi2n4cLZpYdavNZ/FwttCmOhx0YQ7BSZpbGFwt7AYzWW/pu7ZN1i+G4jekbEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715028034; c=relaxed/simple;
	bh=CfAo+6bSBP0Uw6FpjwefB2GfRfaG8G24UWDS/ujqHIM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=St/Dx7Il2UMZmRmCOgWk8sqm0s1+3DgUm6UEf5ip5Jlpfl7UCZnujMe5VppyV5OJYhRlSUX91QMMuhrcRvxitcdWZRCzAzTTxX3qlEdIEBDsr6klxHUtrfmLgP062RBzqF+4L5tjI83EJPVvkRWn9DuDWptTgjAA8RFOxYqg8+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLrY7MlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0E5C116B1;
	Mon,  6 May 2024 20:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715028034;
	bh=CfAo+6bSBP0Uw6FpjwefB2GfRfaG8G24UWDS/ujqHIM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gLrY7MlZaCdE8jWVRmlzS5QzN5ause/KkMr25cR/zW9egF6cw16xCNZXp15ExLL1i
	 0LHzzw/dJegLCy1RkKeTK9r1yWlPEKZZ5lRLbZX2ED9vIs9O5loalczFC+s8PmEhfD
	 00pbU9IiMcE1KwODCUABk0+On7pE4Y7HKEa/2RNBshvRYCcMevqVZ5fObPPbE34lnE
	 J6Awg3dTEdMhizR54t9EI5n0sZrs91ZxiY8yZ2n7aZsnbb08dWoml+r2/bHOrrNp3n
	 kN/LMOdFuKGjUrgfALD+vySsxPMCGjpjLju3K41ifsM4H2rGLU5eXm33P4BKLsOjpH
	 +iyyixxX27X4g==
Date: Mon, 06 May 2024 15:40:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Satya Priya <quic_c_skakit@quicinc.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Stephen Boyd <swboyd@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20240506150830.23709-1-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
Message-Id: <171502764588.89686.5159158035724685961.robh@kernel.org>
Subject: Re: [PATCH 00/13] arm64: dts: qcom: sc8280xp-x13s: enable pm8008
 camera pmic


On Mon, 06 May 2024 17:08:17 +0200, Johan Hovold wrote:
> The Qualcomm PM8008 PMIC is a so called QPNP PMIC with seven LDO
> regulators, a temperature alarm block and two GPIO pins (which are also
> used for interrupt signalling and reset).
> 
> Unlike previous QPNP PMICs it uses an I2C rather than SPMI interface,
> which has implications for how interrupts are handled.
> 
> A previous attempt by Qualcomm to upstream support for PM8008 stalled
> two years ago at version 15 after a lot of back and forth discussion on
> how best to describe this device in the devicetree. [1]
> 
> After reviewing the backstory on this and surveying the current SPMI
> PMIC bindings and implementation, I opted for a new approach that does
> not describe internal details like register offsets and interrupts in
> the devicetree.
> 
> The original decision to include registers offsets and internal
> interrupts for SPMI PMICs has led to a number of PMIC dtsi being created
> to avoid copying lots of boiler plate declarations. This in turn causes
> trouble when the PMIC USID address is configurable as the address is
> included in every interrupt specifier.
> 
> The current SPMI bindings still do not describe the devices fully and
> additional data is therefore already provided by drivers (e.g.
> additional register blocks, supplies, additional interrupt specifiers).
> 
> The fact that PMICs which use two USIDs (addresses) are modelled as two
> separate devices causes trouble, for example, when there are
> dependencies between subfunctions. [2]
> 
> Subfunctions also do not necessarily map neatly onto the 256-register
> block partitioning of the SPMI register space, something which has lead
> to unresolved inconsistencies in how functions like PWM are described.
> [3]
> 
> In short, it's a bit of a mess.
> 
> With the new style of bindings, by contrast, only essential information
> that actually differs between machines would be included in the
> devicetree. The bindings would also be mostly decoupled from the
> implementation, which has started to leak out into the binding (e.g. how
> the QPNP interrupts are handled). This also allows for extending the
> implementation without having to update the binding, which is especially
> important as Qualcomm does not publish any documentation (e.g. to later
> enable regulator over-current protection).
> 
> Some PMICs support both I2C and SPMI interfaces (e.g. PM8010) and we
> want to be able to reuse the same bindings regardless of the interface.
> 
> As a proof concept I have written a new pmc8280 driver for one of the
> SPMI PMICs in the Lenovo ThinkPad X13s that uses the new style of
> bindings and I've been using that one to control backlight and
> peripheral regulators for a while now. Specifically, the gpio and
> temperature-alarm blocks can be used with some minor updates to the
> current drivers.
> 
> That work still needs a bit of polish before posting, but my working PoC
> means that I'm confident enough that the new model will work and that we
> can go ahead and merge regulator support for the PM8008.
> 
> This series is specifically needed for the camera sensors in the X13s,
> for which camera subsystem (camss) support has now been merged for 6.10.
> 
> The first seven patches are preparatory and can possibly be merged
> separately from the rest of the series. The next two patches drops the
> broken GPIO support for PM8008 which had already been upstreamed. The
> last four patches rework the binding and MFD driver, add support for the
> regulators and enable the camera PMIC on the X13s.
> 
> Johan
> 
> [1] https://lore.kernel.org/all/1655200111-18357-1-git-send-email-quic_c_skakit@quicinc.com
> [2] https://lore.kernel.org/lkml/20231003152927.15000-3-johan+linaro@kernel.org
> [3] https://lore.kernel.org/r/20220828132648.3624126-3-bryan.odonoghue@linaro.org
> 
> 
> Johan Hovold (12):
>   dt-bindings: mfd: pm8008: add reset gpio
>   mfd: pm8008: fix regmap irq chip initialisation
>   mfd: pm8008: deassert reset on probe
>   mfd: pm8008: mark regmap structures as const
>   mfd: pm8008: use lower case hex notation
>   mfd: pm8008: rename irq chip
>   mfd: pm8008: drop unused driver data
>   dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008
>   pinctrl: qcom: spmi-gpio: drop broken pm8008 support
>   dt-bindings: mfd: pm8008: rework binding
>   mfd: pm8008: rework driver
>   arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic
> 
> Satya Priya (1):
>   regulator: add pm8008 pmic regulator driver
> 
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml  | 158 ++++++++-----
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      |   3 -
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 123 ++++++++++
>  drivers/mfd/Kconfig                           |   1 +
>  drivers/mfd/qcom-pm8008.c                     | 163 ++++++++-----
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   1 -
>  drivers/regulator/Kconfig                     |   7 +
>  drivers/regulator/Makefile                    |   1 +
>  drivers/regulator/qcom-pm8008-regulator.c     | 215 ++++++++++++++++++
>  include/dt-bindings/mfd/qcom-pm8008.h         |  19 --
>  10 files changed, 554 insertions(+), 137 deletions(-)
>  create mode 100644 drivers/regulator/qcom-pm8008-regulator.c
>  delete mode 100644 include/dt-bindings/mfd/qcom-pm8008.h
> 
> --
> 2.43.2
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


New warnings running 'make CHECK_DTBS=y qcom/sc8280xp-lenovo-thinkpad-x13s.dtb' for 20240506150830.23709-1-johan+linaro@kernel.org:

arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a4f8800: interrupts-extended: [[1, 0, 130, 4], [1, 0, 135, 4], [1, 0, 857, 4], [1, 0, 856, 4], [1, 0, 131, 4], [1, 0, 136, 4], [1, 0, 860, 4], [1, 0, 859, 4], [136, 127, 3], [136, 126, 3], [136, 129, 3], [136, 128, 3], [136, 131, 3], [136, 130, 3], [136, 133, 3], [136, 132, 3], [136, 16, 4], [136, 17, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#







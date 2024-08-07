Return-Path: <linux-gpio+bounces-8658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7C694ACB8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 17:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE04E2828CE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 15:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFA9139D0B;
	Wed,  7 Aug 2024 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJh1EBTW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E11386BF;
	Wed,  7 Aug 2024 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723044033; cv=none; b=Ue9DL0skDW5O87VhxYqrjd2h28zdskKEtmjbVEbVQ0NywuCtC3+wigR3SSSUvJ/S0AaCjJ00b1JxO2/ndUCo+StyI7saSF7mjcUi1E5xkjXou5I3jIM0caUtVDdvrQoGGYbjVVvLgPkMmRn74ZyggjEJPQEXYJAqpNtHMSGYHO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723044033; c=relaxed/simple;
	bh=YlpQmJrhyECWPsq0lnBnTlqDrRPIPgf4q9XConLogmU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=mCq1ofPwsJxTE6fLTbf4yqD2jWoFUF8g/lP/ouhN9kVQ3PSVK7Fbdj5aG46cRyV45LMEwnWlwErJeZdcA304tHG83U4W0lecvU8KzVurHRgydWgkHNUj+dgSwYKdMV1dhZfvDwI5DI+rRIBbd8PeLNqqG4y5rlkljqXh3TT1xIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJh1EBTW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FCBC32781;
	Wed,  7 Aug 2024 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723044030;
	bh=YlpQmJrhyECWPsq0lnBnTlqDrRPIPgf4q9XConLogmU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=dJh1EBTWR1/j4GE727DyeNk0zlpojwDLkRuKfcgQBeA7u1KbhwlFp11PkKoX+Zmh9
	 YWlB3joHo4B/IwI24kE4v3ofvQQ9SIP0kOX1gr/5tDsKxuK/Mp4mtjQmP9zVzTJ7ol
	 Viq3zgtDy5ZVXsQkmTs8YRwu27diSg5r8YQwH3wef/YmrFvkFB31c+VHrIvAerEHeb
	 dBkjVBcihcukYJ1KIO04wcAXC6GRIxq0dVnCZ8VKJoOE2G0SEjfhtM8Fr+19CCSbrI
	 VaRkGft6pQzvxNe4qVnOy3i82rdWz5Nq4KP7dKiUGA5m6miqwk+bxFowRLHzRUi/YD
	 jH6iBwM+yyZ9A==
Date: Wed, 07 Aug 2024 09:20:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <172304385992.2508266.17941443539158891783.robh@kernel.org>
Subject: Re: [PATCH v2 00/10] Add minimal Exynos8895 SoC and SM-G950F
 support


On Wed, 07 Aug 2024 12:08:48 +0300, Ivaylo Ivanov wrote:
> Hi folks,
> 
> This series adds initial SoC support for the Exynos 8895 SoC and also
> initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
> dreamlte.
> 
> When sending out the V1 series it turned out that I had sendemail.from
> enabled for some reason. I'm really sorry for the inconvenience caused by
> that.
> 
> The Exynos 8895 SoC is also used in S8 Plus (dream2lte), Note 8 (greatlte)
> and Meizu 15 Plus (m1891). Currently DT is added for the Exynos 8895 SoC
> and dreamlte, but it should be really easy to adapt for the other devices
> with the same SoC.
> 
> The support added in this series consists of:
> * cpus
> * pinctrl
> * gpio
> * simple-framebuffer
> * pstore
> 
> This is enough to reach a minimal initramfs shell using an upstream kernel.
> More platform support will be added in the future.
> 
> The preferred way to boot this device is by using a small shim bl called
> uniLoader [1], which packages the mainline kernel and DT and jumps to
> the kernel. This is done in order to work around some issues caused by
> the stock, and non-replacable Samsung S-Boot bootloader. For example,
> S-Boot leaves the decon trigger control unset, which causes the framebuffer
> to not refresh.
> 
> [1] https://github.com/ivoszbg/uniLoader
> 
> Changes in v2:
> - No patch changes were made, only fixed the issues with my git send-email
> 
> Kind regards,
> 
> Ivaylo.
> 
> Ivaylo Ivanov (10):
>   dt-bindings: arm: cpus: Add Samsung Mongoose M2
>   dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
>   soc: samsung: exynos-chipid: add exynos8895 SoC support
>   dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
>   pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
>   dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
>   dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
>   arm64: dts: exynos: Add initial support for exynos8895 SoC
>   dt-bindings: arm: samsung: Document dreamlte board binding
>   arm64: dts: exynos: Add initial support for Samsung Galaxy S8
> 
>  .../devicetree/bindings/arm/cpus.yaml         |    1 +
>  .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
>  .../hwinfo/samsung,exynos-chipid.yaml         |    1 +
>  .../samsung,pinctrl-wakeup-interrupt.yaml     |    1 +
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |    1 +
>  .../bindings/soc/samsung/exynos-pmu.yaml      |    1 +
>  arch/arm64/boot/dts/exynos/Makefile           |    1 +
>  .../boot/dts/exynos/exynos8895-dreamlte.dts   |  126 ++
>  .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1378 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  253 +++
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  137 ++
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   10 +
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
>  drivers/soc/samsung/exynos-chipid.c           |    1 +
>  15 files changed, 1920 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi
> 
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


New warnings running 'make CHECK_DTBS=y exynos/exynos8895-dreamlte.dtb' for 20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com:

arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@164b0000: 'bt-hostwake', 'gpa0', 'gpa1', 'gpa2', 'gpa3', 'gpa4', 'key-power', 'key-voldown', 'key-volup', 'key-wink', 'pcie_wake', 'uart1-btsleep', 'uart1-bus', 'uart1-default', 'wlan_host_wake' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@13e60000: 'gph0', 'gph1', 'gph3' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@14080000: 'gph2' does not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@11050000: 'gpi0', 'gpi1', 'ufs-refclk-out', 'ufs-rst-n' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@11430000: 'bt-btwake', 'bt-en', 'cfg-wlanen', 'gpj0', 'gpj1', 'pcie0_clkreq', 'pcie0_clkreq_output', 'pcie0_perst', 'pcie1_clkreq', 'pcie1_clkreq_output', 'pcie1_perst', 'sd2-bus-width1', 'sd2-bus-width4', 'sd2-clk', 'sd2-clk_fast_slew_rate_1x', 'sd2-clk_fast_slew_rate_2x', 'sd2-clk_fast_slew_rate_3x', 'sd2-clk_fast_slew_rate_4x', 'sd2-cmd' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@15a30000: 'gpb2', 'hsi2c0-bus', 'speedy-bus' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@104d0000: 'gpb1', 'gpd0', 'gpd1', 'gpd2', 'gpd3', 'gpe7', 'gpf1', 'hs-i2c14-bus', 'hsi2c10-bus', 'hsi2c11-bus', 'hsi2c12-bus', 'hsi2c5-bus', 'hsi2c6-bus', 'hsi2c7-bus', 'hsi2c8-bus', 'hsi2c9-bus', 'motor_mode', 'motor_rst_n', 'pwm-tout1', 'spi2-bus', 'spi2-cs', 'spi2-cs-func', 'spi3-bus', 'spi3-cs', 'spi3-cs-func', 'spi4-bus', 'spi4-cs', 'spi4-cs-func', 'spi5-bus', 'spi5-cs', 'spi5-cs-func', 'uart0-bus', 'uart2-bus-dual', 'uart2-bus-single', 'uart3-bus-dual', 'uart3-bus-single', 'uart4-bus-dual', 'uart4-bus-single', 'uart5-bus-dual', 'uart5-bus-single' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@10980000: 'decon_f_te_off', 'decon_f_te_on', 'gpb0', 'gpc0', 'gpc1', 'gpc2', 'gpc3', 'gpe1', 'gpe2', 'gpe3', 'gpe4', 'gpe5', 'gpe6', 'gpf0', 'gpg0', 'gpk0', 'hrm-irq', 'hrm-irqidle', 'hrm-irqsleep', 'hsi2c1-bus', 'hsi2c1-bus-in', 'hsi2c13-bus', 'hsi2c14-bus', 'hsi2c15-bus', 'hsi2c16-bus', 'hsi2c17-bus', 'hsi2c18-bus', 'hsi2c19-bus', 'hsi2c2-bus', 'hsi2c2-bus-in', 'hsi2c20-bus', 'hsi2c21-bus', 'hsi2c22-bus', 'hsi2c23-bus', 'hsi2c24-bus', 'hsi2c25-bus', 'hsi2c26-bus', 'hsi2c27-bus', 'hsi2c27-bus-in', 'hsi2c28-bus', 'hsi2c28-bus-in', 'hsi2c29-bus', 'hsi2c3-bus', 'hsi2c3-bus-in', 'hsi2c30-bus', 'hsi2c31-bus', 'hsi2c32-bus', 'hsi2c4-bus', 'hsi2c4-bus-in', 'spi0-bus', 'spi0-cs', 'spi0-cs-func', 'spi1-bus', 'spi1-cs', 'spi1-cs-func', 'spi10-bus', 'spi10-cs', 'spi10-cs-func', 'spi11-bus', 'spi11-cs', 'spi11-cs-func', 'spi12-bus', 'spi12-cs', 'spi12-cs-func', 'spi13-bus', 'spi13-cs', 'spi13-cs-func', 'spi14-bus', 'spi14-cs', 'spi14-c
 s-func', 'spi15-bus', 'spi15-cs', 'spi15-cs-func', 'spi6-bus', 'spi6-cs', 'spi6-cs-func', 'spi7-bus', 'spi7-cs', 'spi7-cs-func', 'spi8-bus', 'spi8-bus-suspend', 'spi8-cs', 'spi8-cs-func', 'spi8-cs-func-suspend', 'spi9-bus', 'spi9-cs', 'spi9-cs-func', 'spi9-idle', 'uart10-bus-dual', 'uart10-bus-single', 'uart11-bus-dual', 'uart11-bus-single', 'uart12-bus-dual', 'uart12-bus-single', 'uart13-bus-dual', 'uart13-bus-single', 'uart14-bus-dual', 'uart14-bus-single', 'uart15-bus-dual', 'uart15-bus-single', 'uart6-bus-dual', 'uart6-bus-single', 'uart7-bus-dual', 'uart7-bus-single', 'uart8-bus-dual', 'uart8-bus-single', 'uart9-bus-dual', 'uart9-bus-single' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#







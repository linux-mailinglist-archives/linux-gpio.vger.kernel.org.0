Return-Path: <linux-gpio+bounces-12565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D208A9BCD90
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 14:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 013E61C21936
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 13:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB451D63E5;
	Tue,  5 Nov 2024 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swMixeWM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1781D63D7;
	Tue,  5 Nov 2024 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812312; cv=none; b=qOI0jF1Kk6PnrfbQgpKaLfAMRa6jJU+YdMgXtoRloTf/K0yO4bwm7coDjp7S/ZEcj+dL2+OJDocZMLNx9Nvh8wJXNyGxsxwrwnKHl2DrFsm59aQyiTm3Vyx1xp0JZOvy7xBCa74+Nc3dC4neE2suYXGm3Dij+lq3jDmaNEz1IKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812312; c=relaxed/simple;
	bh=RYg+9qoXpk0RokLOPEoCGkpTdaXIFEcqm0AEAZENBdQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=nwQsTkrVzPeNcmqgl3ycvf0xFInk/a+TPGdxy+tNE0igGb+TeqYb00bkfshLG07R78FpTLFQWchVQND7H8a6TVJN/NqUQuf/oc2WUWye/gsYZKvRXfTVWPPLikn3pBoTd/er85dMhZuOaCay674x2zuQJdRzBw5DEQMQe6VX1Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swMixeWM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7003BC4CECF;
	Tue,  5 Nov 2024 13:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730812311;
	bh=RYg+9qoXpk0RokLOPEoCGkpTdaXIFEcqm0AEAZENBdQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=swMixeWMT1ATI82pRRWTfM3zNiWmq7gl/GYDRojGy9pBeGOWk1PdIHp0O1OrmNUIz
	 dQBMgRGLU0hOnG7dHTiL8Sa+t5zORsYCwOtDcNdG8JVqtbuZ85DcM7xnZfjnotDA2W
	 dtTBEauhULhtAiUMHzM6p4YfC4UDCXBhXeMF8PizeK6maCe+QQF9bExxjrCEZz91G4
	 KtA4ZYe8+RkPewLTEBB1aweoPQLo8AHp2kdWjBLNdhbmkNQzGLfxRR50W9N4bOzRJl
	 n9wG0OeOZMpT2HnB0wN82rZopMqr4AFlarYKjcBgeZ24ZxT2ibpff1y8Jz5n22DJjq
	 q+SVhtMffhLHA==
Date: Tue, 05 Nov 2024 07:11:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Schocher <hs@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Mathieu Othacehe <m.othacehe@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Hiago De Franco <hiago.franco@toradex.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 Shawn Guo <shawnguo2@yeah.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
 Max Merchel <Max.Merchel@ew.tq-group.com>, imx@lists.linux.dev, 
 Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org, 
 Michael Walle <mwalle@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org
In-Reply-To: <20241105064206.43626-1-hs@denx.de>
References: <20241105064206.43626-1-hs@denx.de>
Message-Id: <173081219627.3053080.8796298549026571114.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: imx8mp: add support for the ABB SoM
 and carrier


On Tue, 05 Nov 2024 07:42:03 +0100, Heiko Schocher wrote:
> The board uses an ABB specific SoM from ADLink, based on NXP
> i.MX8MP SoC. The SoM is used on 3 different carrier boards,
> with small differences.
> 
> series is based on:
> 819837584309 - (tag: v6.12-rc5, origin/master, origin/HEAD) Linux 6.12-rc5
> 
> patches are now checked with
> 
> make W=1 dt_binding_check
> make W=1 dtbs_check
> make W=1 CHECK_DTBS=y {for each dtb introduced in this series)
> 
> as Krzysztof suggested.
> 
> Changes in v3:
> added Reviewed-by from Krzysztof
> - worked in comments from Krzysztof
>   gpio-line-names should match the actual number of
>   gpios of the device.
> - added comments from Shawn Guo
>   removed unneeded new lines
>   sort nodes, properties alphabetical
>   rename pcie0-refclk -> clock-xxx
>   used GPIO_ACTIVE_HIGH instead of 0
> - added comments from Fabio Estevam
>   instead of settting each brightness-level in
>   brightness-levels add num-interpolated-steps
> - changes from me
>   fix gpio-line-names for semtech gpio controller
>   in imx8mp-aristainetos3-proton2s.dts as patch
>   "dt-bindings: pinctrl: sx150xq: allow gpio line naming"
>   of this series adds the dtb checks for them and 17 entries
>   needed now.
> 
> Changes in v2:
> reworked the compatible strings for ABB imx8mp based boards
> called dtb checks, no errors for this patch
> patch dt-bindings: pinctrl: sx150xq: allow gpio line naming new in v2
> - worked in comments from Krzysztof
>   - removed unneeded dtbos and build now dtbs for each
>     carrierboard.
>   - removed user spidev entries, as I do not know the
>     real spi devices connected to...
>   - call dtb check targets as described in cover letter
>     and fixed warnings except warnings see below:
> not fixed dtb check warnings
> - pci (warning pops up for each new dtb from this patch, but
>   also for a lot of other boards, which are already in tree)
> imx8mp-aristainetos3-adpismarc.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
>         from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
> imx8mp-aristainetos3-adpismarc.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
>         from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
> - proton2s dtb specific:
>   - rs485
>     imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:0: 0 is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
>     imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:1: 0 is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
>     imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: Unevaluated properties are not allowed ('linux,rs485-enabled-at-boot-time', 'rs485-rts-active-low', 'rs485-rts-delay' were unexpected)
>         from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
>     do not see, what I am doing wrong, also rs485 works fine
>   - led driver
>     imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
>     I use the comaptible entry used in drivers/leds/leds-tlc591xx.c
>     Ah, may because file
>     Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
>     is not converted to yaml?
>   - pinctrl driver
>     adding 'gpio-line-names' leads in a warning as this property
>     is not checked yet (and so a warning is dropped).
>     add this check in new patch
>     dt-bindings: pinctrl: sx150xq: allow gpio line naming
>     in v2
> 
> Heiko Schocher (3):
>   dt-bindings: arm: fsl: Add ABB SoM and carrier
>   dt-bindings: pinctrl: sx150xq: allow gpio line naming
>   arm64: dts: imx8mp: add aristainetos3 board support
> 
>  .../devicetree/bindings/arm/fsl.yaml          |    9 +
>  .../bindings/pinctrl/semtech,sx1501q.yaml     |   43 +
>  arch/arm64/boot/dts/freescale/Makefile        |    5 +
>  .../imx8mp-aristainetos3-adpismarc.dts        |   37 +
>  .../imx8mp-aristainetos3-helios-lvds.dtso     |  113 ++
>  .../freescale/imx8mp-aristainetos3-helios.dts |   98 ++
>  .../imx8mp-aristainetos3-proton2s.dts         |  161 +++
>  .../imx8mp-aristainetos3a-som-v1.dtsi         | 1107 +++++++++++++++++
>  8 files changed, 1573 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
> 
> --
> 2.20.1
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


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-aristainetos3-adpismarc.dtb freescale/imx8mp-aristainetos3-helios.dtb freescale/imx8mp-aristainetos3-proton2s.dtb' for 20241105064206.43626-1-hs@denx.de:

arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']







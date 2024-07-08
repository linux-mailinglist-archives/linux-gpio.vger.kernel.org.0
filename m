Return-Path: <linux-gpio+bounces-8101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE7392A4CD
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 16:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D16701C211D0
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 14:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D9813E042;
	Mon,  8 Jul 2024 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GX1WBYmB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A313DDCA;
	Mon,  8 Jul 2024 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720449284; cv=none; b=CEf0FCydVHbZn0k8zj+OJbZNd2xLfHnu+nRcP7XpX0H3ig8uYgtAGad9ow7giNJ7avYGh2DTFJfvK2ShQCwyqDE2m9mQv/1Xl/5JK2UKEgX+r3UGM5Uy7j9l58tYHQGoJFkDYWvDD1bK7gRbpYYq4LiyWdN+6wSsTEiI/RvEi/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720449284; c=relaxed/simple;
	bh=s6M5nbZ68G8/iy6k6aEBsfDMDF5Vn95v0Ca9+I2QOc8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=YmURIobfDUNszgYsfZ42DFpTinLKhBVdVH7fvaHGJA0s8lvaq+wihoZZB7/RsNkFHD2ew49fCuABjEj29AyS9l2MzvWOOCHAn4pmpwsxuAupFentOkal5hc0gNzP6gL8C3TPAALTF2Yqn3JRQLjgm+aqvsSbE8nOM/L2IR4xGeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GX1WBYmB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7E2C4AF11;
	Mon,  8 Jul 2024 14:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720449284;
	bh=s6M5nbZ68G8/iy6k6aEBsfDMDF5Vn95v0Ca9+I2QOc8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=GX1WBYmB87KtyQYfL/zkSXTc46d8R4QfTs51tMzD6UrTsbRHupKHoss7UcbnjrriA
	 FrfQ5FCFndwES9UaUQIspNwuwgxrcK7IiztP3HhDaxaWUx08TwqGXEhQbN4xM0dKJZ
	 cgUHnFhYcevQ+honH7gopOD8mJ6OcAP8zqQS2hvHqa0KPVXnnl8bBKpTIg70Exibch
	 pSfiEel5fIHzNQOtjayOiakEpnpTIP1dqH2uQPz4kJ6Zof08hr1cLotZXjrkxx3haL
	 YxiaECtSbU6zZwi8kSTxAqv8ccKKYfEnuUH4j1eRr7cuc7fNMna8nxJLylAPI6vmrz
	 Z1M7+0zraY9sw==
Date: Mon, 08 Jul 2024 08:34:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Stefan Agner <stefan@agner.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
 Bo Liu <liubo03@inspur.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 linux-kernel@vger.kernel.org, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Hiago De Franco <hiago.franco@toradex.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joy Zou <joy.zou@nxp.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Robin Gong <yibin.gong@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Mathieu Othacehe <m.othacehe@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20240708084107.38986-1-frieder@fris.de>
References: <20240708084107.38986-1-frieder@fris.de>
Message-Id: <172044909550.3146333.2379422584888739611.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] Add support for Kontron OSM-S i.MX93 SoM and
 carrier board


On Mon, 08 Jul 2024 10:40:30 +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Patch 1-2: small DT binding fixups
> Patch 3: board DT bindings
> Patch 4: support PMIC driver without IRQ
> Patch 5: add devicetrees
> 
> Changes for v2:
> * remove applied patches 1 and 2
> * add tags
> * improvements suggested by Krzysztof (thanks!)
> * add missing Makefile entry for DT
> 
> Frieder Schrempf (5):
>   dt-bindings: gpio: vf610: Allow gpio-line-names to be set
>   dt-bindings: regulator: pca9450: Make interrupt optional
>   dt-bindings: arm: fsl: Add Kontron i.MX93 OSM-S based boards
>   regulator: pca9450: Make IRQ optional
>   arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier
>     board
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  .../devicetree/bindings/gpio/gpio-vf610.yaml  |   4 +
>  .../regulator/nxp,pca9450-regulator.yaml      |   1 -
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx93-kontron-bl-osm-s.dts  | 165 ++++++
>  .../dts/freescale/imx93-kontron-osm-s.dtsi    | 547 ++++++++++++++++++
>  drivers/regulator/pca9450-regulator.c         |  41 +-
>  7 files changed, 742 insertions(+), 23 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y freescale/imx93-kontron-bl-osm-s.dtb' for 20240708084107.38986-1-frieder@fris.de:

arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: eeprom@50: compatible: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: eeprom@50: compatible: 'oneOf' conditional failed, one must be fixed:
		'onnn,n24s64b' does not match 'c00$'
		'onnn,n24s64b' does not match 'c01$'
		'onnn,n24s64b' does not match 'cs01$'
		'onnn,n24s64b' does not match 'c02$'
		'onnn,n24s64b' does not match 'cs02$'
		'onnn,n24s64b' does not match 'mac402$'
		'onnn,n24s64b' does not match 'mac602$'
		'onnn,n24s64b' does not match 'c04$'
		'onnn,n24s64b' does not match 'cs04$'
		'onnn,n24s64b' does not match 'c08$'
		'onnn,n24s64b' does not match 'cs08$'
		'onnn,n24s64b' does not match 'c16$'
		'onnn,n24s64b' does not match 'cs16$'
		'onnn,n24s64b' does not match 'c32$'
		'onnn,n24s64b' does not match 'cs32$'
		'onnn,n24s64b' does not match 'c64$'
		'onnn,n24s64b' does not match 'cs64$'
		'onnn,n24s64b' does not match 'c128$'
		'onnn,n24s64b' does not match 'cs128$'
		'onnn,n24s64b' does not match 'c256$'
		'onnn,n24s64b' does not match 'cs256$'
		'onnn,n24s64b' does not match 'c512$'
		'onnn,n24s64b' does not match 'cs512$'
		'onnn,n24s64b' does not match 'c1024$'
		'onnn,n24s64b' does not match 'cs1024$'
		'onnn,n24s64b' does not match 'c1025$'
		'onnn,n24s64b' does not match 'cs1025$'
		'onnn,n24s64b' does not match 'c2048$'
		'onnn,n24s64b' does not match 'cs2048$'
		'onnn,n24s64b' does not match 'spd$'
		'atmel,24c64' does not match 'c00$'
		'atmel,24c64' does not match 'c01$'
		'atmel,24c64' does not match 'cs01$'
		'atmel,24c64' does not match 'c02$'
		'atmel,24c64' does not match 'cs02$'
		'atmel,24c64' does not match 'mac402$'
		'atmel,24c64' does not match 'mac602$'
		'atmel,24c64' does not match 'c04$'
		'atmel,24c64' does not match 'cs04$'
		'atmel,24c64' does not match 'c08$'
		'atmel,24c64' does not match 'cs08$'
		'atmel,24c64' does not match 'c16$'
		'atmel,24c64' does not match 'cs16$'
		'atmel,24c64' does not match 'c32$'
		'atmel,24c64' does not match 'cs32$'
		'atmel,24c64' does not match 'cs64$'
		'atmel,24c64' does not match 'c128$'
		'atmel,24c64' does not match 'cs128$'
		'atmel,24c64' does not match 'c256$'
		'atmel,24c64' does not match 'cs256$'
		'atmel,24c64' does not match 'c512$'
		'atmel,24c64' does not match 'cs512$'
		'atmel,24c64' does not match 'c1024$'
		'atmel,24c64' does not match 'cs1024$'
		'atmel,24c64' does not match 'c1025$'
		'atmel,24c64' does not match 'cs1025$'
		'atmel,24c64' does not match 'c2048$'
		'atmel,24c64' does not match 'cs2048$'
		'atmel,24c64' does not match 'spd$'
	['onnn,n24s64b', 'atmel,24c64'] is too long
	'onnn,n24s64b' does not match '^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$'
	'belling,bl24c16a' was expected
	'onnn,n24s64b' is not one of ['rohm,br24g01', 'rohm,br24t01']
	'onnn,n24s64b' is not one of ['nxp,se97b', 'renesas,r1ex24002']
	'onnn,n24s64b' is not one of ['onnn,cat24c04', 'onnn,cat24c05', 'rohm,br24g04']
	'renesas,r1ex24016' was expected
	'giantec,gt24c32a' was expected
	'onnn,n24s64b' is not one of ['renesas,r1ex24128', 'samsung,s524ad0xd1']
	'onnn,n24s64b' does not match '^atmel,24c(32|64)d-wl$'
	'atmel,24c16' was expected
	'atmel,24c01' was expected
	'atmel,24c02' was expected
	'atmel,24c04' was expected
	'atmel,24c32' was expected
	'atmel,24c128' was expected
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: eeprom@50: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: /soc@0/bus@44000000/i2c@44340000/eeprom@50: failed to match any schema with compatible: ['onnn,n24s64b', 'atmel,24c64']







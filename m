Return-Path: <linux-gpio+bounces-11565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317099A28CF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 18:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2686DB27C9B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 16:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA171DF963;
	Thu, 17 Oct 2024 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkOyGRqn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168191DF753;
	Thu, 17 Oct 2024 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729182377; cv=none; b=XHqg7SpCYPkDrOYxoNCp9lTPBDum77mST/HdsH+zmkf5+X9eG0hfnBv7yDaj9c5NlxI0XW80kp/II8n4R0v4amWOQf6PzjLGXxgeTj9otXPQZa6djYFqqZD72S40192eh7xptZ1vj8vCOfL3pwmpM2gH+BcNqC6ke91ydZBpfbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729182377; c=relaxed/simple;
	bh=LJxym/IX46Idqi5/awjEuZbkCGhp1zKVDK4mPBJUVG8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=XARCG4m+dWAXEaHWluBkyzKofrdnuKlbVYQ4LYoNUK5J5iazIch9tiJ8p7qpDbYtvSW6xjrwpR1Q18J/LobJj29/lGKFCmcwnwcH2H6IZo1LstRHQV612CB0DfZB/UCUKo6HwEKzBXLVn45ddPFZ+WdJnrhXve1b+6EUWSNwe50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkOyGRqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84112C4CECD;
	Thu, 17 Oct 2024 16:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182376;
	bh=LJxym/IX46Idqi5/awjEuZbkCGhp1zKVDK4mPBJUVG8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=CkOyGRqnng7F3eIIiCuSiZ1PNY1mLhpS+GIq+QCuCnPNF6JDTIFpwW1lc8F6OWGNl
	 S2xmMYGnJm+8uAKYsqNhVNwx+YEJfuKsp9IZ4mszxEaIM2KoFlSaAqh/tRwAxtpxeq
	 BX7Wc/axAM8Ra07DHuMTJ8CHbHjEmlsoFuzT9nBoLbBbbT5SsstRbyC0tXRinvOaua
	 NZteQ0wYOcpBA+KNRGqf0bBnuzvuHyfKkb0z9vsGFiCzDrUgHCX5L8PR9BJ0C+3sSe
	 kk6IeQPGf3H1wHBPyNujpLgGRuaKmO/pSAbWEaTCAV0hML1cpd9nWF8J254l4v/8Cy
	 bENxMxRbS3beQ==
Date: Thu, 17 Oct 2024 11:26:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 kernel@dh-electronics.com, Conor Dooley <conor+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev
In-Reply-To: <20241017000801.149276-1-marex@denx.de>
References: <20241017000801.149276-1-marex@denx.de>
Message-Id: <172917871107.3590077.2079873873330727395.robh@kernel.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML


On Thu, 17 Oct 2024 02:06:47 +0200, Marek Vasut wrote:
> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs,
> except for the configuration bits which differ across SoCs. Rename the
> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
> strings for the other SoCs and fill in the various bits into desciption.
> This way, i.MX35/5x/6 series SoCs can all be converted to DT schema.
> Remove the old text DT bindings description.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> ---
> V2: - Use DT schema to refer to the fsl,imx35-pinctrl.yaml file
>     - Special-case the iMX50 compatible string
> ---
>  .../bindings/pinctrl/fsl,imx35-pinctrl.txt    | 33 -------
>  ...ul-pinctrl.yaml => fsl,imx35-pinctrl.yaml} | 88 ++++++++++++++++---
>  .../bindings/pinctrl/fsl,imx50-pinctrl.txt    | 32 -------
>  .../bindings/pinctrl/fsl,imx51-pinctrl.txt    | 32 -------
>  .../bindings/pinctrl/fsl,imx53-pinctrl.txt    | 32 -------
>  .../bindings/pinctrl/fsl,imx6dl-pinctrl.txt   | 38 --------
>  .../bindings/pinctrl/fsl,imx6q-pinctrl.txt    | 38 --------
>  .../bindings/pinctrl/fsl,imx6sl-pinctrl.txt   | 39 --------
>  .../bindings/pinctrl/fsl,imx6sll-pinctrl.txt  | 40 ---------
>  .../bindings/pinctrl/fsl,imx6sx-pinctrl.txt   | 36 --------
>  10 files changed, 78 insertions(+), 330 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt
>  rename Documentation/devicetree/bindings/pinctrl/{fsl,imx6ul-pinctrl.yaml => fsl,imx35-pinctrl.yaml} (50%)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx51-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx53-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6dl-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sl-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sx-pinctrl.txt
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


New warnings running 'make CHECK_DTBS=y nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb nxp/imx/imx35-pdk.dtb nxp/imx/imx50-evk.dtb nxp/imx/imx51-apf51.dtb nxp/imx/imx51-apf51dev.dtb nxp/imx/imx51-babbage.dtb nxp/imx/imx51-digi-connectcore-jsk.dtb nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dtb nxp/imx/imx53-ard.dtb nxp/imx/imx53-kp-ddc.dtb nxp/imx/imx53-m53evk.dtb nxp/imx/imx53-m53menlo.dtb nxp/imx/imx53-qsrb.dtb nxp/imx/imx53-smd.dtb nxp/imx/imx53-tx53-x03x.dtb nxp/imx/imx53-tx53-x13x.dtb nxp/imx/imx53-voipac-bsb.dtb nxp/imx/imx6dl-colibri-aster.dtb nxp/imx/imx6dl-eckelmann-ci4x10.dtb nxp/imx/imx6dl-prtmvt.dtb nxp/imx/imx6dl-prtrvt.dtb nxp/imx/imx6dl-prtvt7.dtb nxp/imx/imx6dl-riotboard.dtb nxp/imx/imx6q-dmo-edmqmx6.dtb nxp/imx/imx6q-gk802.dtb nxp/imx/imx6q-h100.dtb nxp/imx/imx6q-logicpd.dtb nxp/imx/imx6q-novena.dtb nxp/imx/imx6q-prti6q.dtb nxp/imx/imx6q-prtwd2.dtb nxp/imx/imx6q-sbc6x.dtb nxp/imx/imx6q-utilite-pro.dtb nxp/imx/imx6qp-prtwd3.dtb nxp/imx/imx6qp-sabreauto.dtb nxp/imx/imx6qp-s
 abresd.dtb nxp/imx/imx6sl-evk.dtb nxp/imx/imx6sl-tolino-shine2hd.dtb nxp/imx/imx6sl-tolino-shine3.dtb nxp/imx/imx6sll-evk.dtb nxp/imx/imx6sll-kobo-clarahd.dtb nxp/imx/imx6sx-sabreauto.dtb nxp/imx/imx6sx-softing-vining-2000.dtb' for 20241017000801.149276-1-marex@denx.de:

arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: iomuxc@43fac000: $nodename:0: 'iomuxc@43fac000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: iomuxc@43fac000: 'imx35-eukrea', 'reg-lcd-3v3' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx50-evk.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-kp-ddc.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-kp-ddc.dtb: iomuxc@53fa8000: 'imx53-kp-common', 'imx53-tqma53' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: iomuxc@73fa8000: $nodename:0: 'iomuxc@73fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx51-babbage.dtb: iomuxc@73fa8000: $nodename:0: 'iomuxc@73fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx51-apf51.dtb: iomuxc@73fa8000: $nodename:0: 'iomuxc@73fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-jsk.dtb: iomuxc@73fa8000: $nodename:0: 'iomuxc@73fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-jsk.dtb: iomuxc@73fa8000: 'imx51-digi-connectcore-som' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-ard.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dtb: iomuxc@73fa8000: $nodename:0: 'iomuxc@73fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dtb: iomuxc@73fa8000: 'backlightgrp-1', 'esdhc1_cd', 'gpiokeysgrp-1', 'gpioledgrp-1', 'imx51-eukrea', 'reg_lcd_3v3' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: iomuxc@43fac000: $nodename:0: 'iomuxc@43fac000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dtb: iomuxc@53fa8000: 'imx53-m53evk' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-m53evk.dtb: iomuxc@53fa8000: 'imx53-m53evk', 'led_gpio' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-qsrb.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-qsrb.dtb: iomuxc@53fa8000: 'led_gpio7_7' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dtb: iomuxc@53fa8000: 'edt-ft5x06grp-1', 'imx53-tx53', 'rgb24-vgagrp1' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dtb: iomuxc@53fa8000: 'imx53-tx53' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: iomuxc@53fa8000: $nodename:0: 'iomuxc@53fa8000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: iomuxc@53fa8000: 'kppgrp-1', 'led_gpio' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx6sl-evk.dtb: pinctrl@20e0000: 'fecgrp-sleep' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dtb: pinctrl@20e0000: 'i2c1grp-sleep', 'i2c2grp-sleep', 'usdhc2grp-sleep', 'usdhc3grp-sleep' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dtb: pinctrl@20e0000: 'i2c1grp-sleep', 'i2c2grp-sleep', 'usdhc2grp-sleep', 'usdhc3grp-sleep' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dtb: pinctrl@20e0000: 'i2c1grp-sleep', 'i2c2grp-sleep', 'usdhc2grp-sleep', 'usdhc3grp-sleep' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#







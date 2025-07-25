Return-Path: <linux-gpio+bounces-23828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6DB12535
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 22:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E059D567BD4
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 20:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDB7258CF8;
	Fri, 25 Jul 2025 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="No1tfu5l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D390F244691;
	Fri, 25 Jul 2025 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753474660; cv=none; b=Kgki+dAiz8RKGrCiuKSIW1ncNUCRxIzljQxTrb5FgeB7FWQTQR/AhncrXWP1n97slF5ha2yAXZWqFF1xMcMZEhFhoCMODN1zPHH2TZPXyVJD/0Xo8FIF0T7dw/mPFCHSD9KyyEgQnpw+l1NbTzCTFl/dX6KU9eH5aI8v5WXR5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753474660; c=relaxed/simple;
	bh=4q+06f8cylW8rH3fxRvSafOleQcceRS31FgGbp4I+ug=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WqO0OvcB/FKpqGfsZlAvSvfjfjZ9DMoUdnWdHJOhdw29mM5E6QTYf4alFG8Qb0GgY/l2rga8tJa0j27iP06w9gi6Egh2murzZDdrzPYyRTip2Zd6uTQwmNTQNCflVgAG1M+O5wgUb7IVDf0iHyQuHTX8cwmEQ861K8PEFVj6wwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=No1tfu5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D7AC4CEE7;
	Fri, 25 Jul 2025 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753474658;
	bh=4q+06f8cylW8rH3fxRvSafOleQcceRS31FgGbp4I+ug=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=No1tfu5lRYYw8/dUL0Oq6mhhxkkkSda4ybob4JDAYJjKPPH6TETXOofyQMs9cM+EN
	 0WhUutjlEhqJvt2fgEsvVp22m0qAORNtxcUnjCBkmNolu4TOHdR0kZ0+DMYHsJJw0a
	 tEfz3ElFzttHtk5E+Fw9omxOm9zOlFZw2YGzqfdUUg1dAIbkV2eyV7ogOaOyRCqqtJ
	 NdacH8S9w5OVgI2F9HgJ7C8jKtwJwN12iK/8FN8BZbu8GaYMMWz+aUD0bGsH1TaWO9
	 Td+An7KaQKtdUpWRJkTsUibsFrLuBfSetr8fAXi9LuuOBQ3vEdFBsBYjga4DLUmE6O
	 6EzI8CCgIl9Kw==
Date: Fri, 25 Jul 2025 15:17:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Phil Edworthy <phil.edworthy@renesas.com>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Serge Semin <fancer.lancer@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20250725152618.32886-1-herve.codina@bootlin.com>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
Message-Id: <175347460968.1818600.10181737500574754533.robh@kernel.org>
Subject: Re: [PATCH 0/6] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC


On Fri, 25 Jul 2025 17:26:09 +0200, Herve Codina wrote:
> Hi,
> 
> This series adds support for GPIO and GPIO IRQ mux available in the
> RZ/N1 SoCs.
> 
> The first two patches of the series add support for GPIO (binding update
> and device-tree description).
> 
> Other patches are related to GPIO interrupts and GPIO IRQ multiplexer.
> 
> In the RZ/N1 SoCs, GPIO interrupts are wired to a GPIO IRQ multiplexer.
> 
> This multiplexer does nothing but select 8 GPIO IRQ lines out of the 96
> available to wire them to the GIC input lines.
> 
> One upstreaming attempt have been done previously by Phil Edworthy [1]
> but the series has never been applied.
> 
> Based on my understanding, I have fully reworked the driver proposed by
> Phil and removed the IRQ domain. Indeed, the device doesn't handle
> interrupts. It just routes signals.
> 
> Also, as an interrupt-map property is used, the driver cannot be
> involved as an interrupt controller itself. It is a nexus node.
> 
> With that in mind, patch 3 is related to the binding, patch 4 introduces
> an helper to parse the interrupt-map property. This parsing is needed by
> the driver. Indeed, the lines routing is defined by the interrupt-map
> property and the driver needs to set registers to apply this routing.
> 
> The last two patches are the driver itself and the RZ/N1 device-tree
> description update to have the support for the GPIO interrupts.
> 
> [1] https://lore.kernel.org/all/20190219155511.28507-1-phil.edworthy@renesas.com/
> 
> Best regards,
> Hervé
> 
> Herve Codina (6):
>   dt-bindings: gpio: snps,dw-apb: Add support for Renesas RZ/N1
>   ARM: dts: r9a06g032: Add GPIO controllers
>   dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt
>     Multiplexer
>   of/irq: Introduce of_irq_foreach_imap
>   soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
>   ARM: dts: r9a06g032: Add support for GPIO interrupts
> 
>  .../bindings/gpio/snps,dw-apb-gpio.yaml       |   8 +-
>  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  |  99 ++++++++++
>  arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 172 ++++++++++++++++++
>  drivers/of/irq.c                              |  70 +++++++
>  drivers/soc/renesas/Kconfig                   |   4 +
>  drivers/soc/renesas/Makefile                  |   1 +
>  drivers/soc/renesas/rzn1_irqmux.c             | 169 +++++++++++++++++
>  include/linux/of_irq.h                        |  11 ++
>  8 files changed, 533 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
>  create mode 100644 drivers/soc/renesas/rzn1_irqmux.c
> 
> --
> 2.50.1
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
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc3-23-g03a28dc39838 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/renesas/' for 20250725152618.32886-1-herve.codina@bootlin.com:

arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: gpio@5000b000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: gpio@5000c000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: gpio@5000d000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: gpio@5000b000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: gpio@5000c000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: gpio@5000d000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#







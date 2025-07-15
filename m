Return-Path: <linux-gpio+bounces-23332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE256B06962
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 00:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6A2C4E00CE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 22:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0615C2D1931;
	Tue, 15 Jul 2025 22:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlxxHbfO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74292D0C9F;
	Tue, 15 Jul 2025 22:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752619346; cv=none; b=iRinIYQ1U1AlrD1X3LHzq6FRzZJkFrUZ94c58ed3F1Q0EdqpbsXmBpbbeyfia3GEOuxUzUmJegoxycs/g5eeVmxgBeEH+iZ04zyewO2gD/RzhvSDTpI9YFn7SSXSq1wCgYBVrlUPyctbDFeUFwFvrEn2TU/KO8MCTnFE60hYGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752619346; c=relaxed/simple;
	bh=uPLCZFptHGBrGaD5olKdkLpAzrHsgExeeA73sr1kvkY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=a5tkW+CfVNWwQK1/53cpD0BhSl+IujwR+Iy6nMYWg70YMAANoC4lABl/Qpw3WGVyw+xOuZvERFOgvb2QJEMPxa7nlrmm12d3Bq0/kcT22hLkyQZfLYmsreOCoTrUx73qV2SfYTmEZ1GPdAiZXD0wEIh/RmfjTBbob3AvAOKJ4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlxxHbfO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1284CC4CEE3;
	Tue, 15 Jul 2025 22:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752619346;
	bh=uPLCZFptHGBrGaD5olKdkLpAzrHsgExeeA73sr1kvkY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RlxxHbfOQVhLg3s0e0bsjqjd4UyebRvvv0nuaWtkQAf1OGK+NIchMywhD2wgXQomd
	 Q5lwBKC+iqEIesZZuBnI6s0Ol1+4s9UZfyEKdv2mEx0CDZUCNWOTFUEoheowsV0i3K
	 0V/QpYkvMwyj72vs70IdRGqRdHuhka+VcvIhKkhu5gfb2++GC7jjYmHus3Qh7jeAxE
	 pL4FRB/i0TfUNWu50yDYhwU9c2WEE9nhBKdb9iujjFS5dMExl0sAyOYUkx2n0dPwjS
	 gXh6P0I7B4olAMA2W0s9UU+fCNc3/s/r+r2jQu4L8ugRAgTJ/4gFyqLMXOCMaUnITd
	 gthjscbSRyb7g==
Date: Tue, 15 Jul 2025 17:42:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linus.walleij@linaro.org, mbrugger@suse.com, linux-gpio@vger.kernel.org, 
 florian.fainelli@broadcom.com, devicetree@vger.kernel.org, 
 Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, conor+dt@kernel.org, 
 wahrenst@gmx.net
To: Andrea della Porta <andrea.porta@suse.com>
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
Message-Id: <175261922842.2276518.8350061053461411045.robh@kernel.org>
Subject: Re: [PATCH 0/7] Add pin control driver for BCM2712 SoC


On Tue, 15 Jul 2025 20:31:37 +0200, Andrea della Porta wrote:
> Hi,
> 
> The following patches add a pin control driver for the BCM2712 SoC and few
> pin/gpio Devicetree nodes for Raspberry Pi 5.
> 
> Device driver is follow up version on what Andrea posted in April [1].
> 
> It is based on sources from here [2]. I just made few cosmetic changes
> and addressed review comments from earlier submission. I don't have
> documentation for this controller.
> 
> Patch 4 wire up power button on RPi5.
> 
> Patch 5 adds WiFi Devicetree node for RPi5.
> 
> Patch 6 adds Bluetooth Devicetree node for RPi5.
> 
> All this have been tested as kernel was directly booted RPi5 via
> kernel= config.txt option and cmdline.txt file with following content
> (Note I am using Tumbleweed RPi raw images)
> 
> # cat /boot/efi/cmdline.txt
> root=/dev/mmcblk0p3 rootwait rw systemd.show_status=1 console=tty ignore_loglevel earlycon console=ttyAMA10,115200
> 
> With all these patches Bluetooth and Wifi are working fine (tm) with
> firmware files provided by openSUSE Tumbleweed.
> 
> All comments and suggestions are welcome!
> 
> Happy hacking!
> Ivan and Andrea
> 
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> [2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/pinctrl/bcm/pinctrl-bcm2712.c
> [3] https://lore.kernel.org/lkml/20240605120712.3523290-1-florian.fainelli@broadcom.com/#t
> [4] https://lore.kernel.org/all/bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net/
> 
> 
> CHANGES in V2: (all patchset is based upon linux-next/master)
> 
> --- PINCTRL DRIVER ---
> 
> - dropped bcm2712_c0_aon_sgpio_pin_funcs[] and bcm2712_d0_aon_sgpio_pin_funcs[]
>   struct array definitions since they are not used anywhere.
> 
> - dropped 'arg' variable in brcmstb_pinconf_set() as it's not used.
> 
> - updated copyright info at the top.
> 
> - several changes in the declared macros. Renaming the macro name and the
>   macro parameters to better reflect the semantic.
> 
> - reworked MUX_BIT() macro to be more streamlined and easy to
>   understand.
> 
> - added PAD_BIT() macro to avoid code duplication.
> 
> - renamed 'lock' variable to 'fsel_lock'.
> 
> - added some comments about non-existent pins on D0 silicon revision pin
>   declarations.
> 
> - brcmstb_pinctrl_fsel_set(), brcmstb_pull_config_set()  and
>   brcmstb_pinconf_set() (and functions that call them) can now return -EINVAL
>   as error.
> 
> - added myself as MODULE_AUTHOR.
> 
> - dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
>   compatibles are permitted now.
> 
> 
> --- DTS ---
> 
> - moved 'clock-frequency' property from (uarta) board dts node to SoC dtsi node.
> 
> - added 'brcm,sdhci-brcmstb' compatible and 'clock-names' property to mmc node
>   to avoid dt_binding_check errors.
> 
> - added 'brcm,bcm7445-gpio' compatible to gpio node to avoid dt_binding_check
>   errors.
> 
> - renamed all pinctrl pin nodes as per yaml schema (*-state and *-pins).
> 
> - changed 'brcm,bcm2712-*pinctrl' to 'brcm,bcm2712c0-*pinctrl' since the
>   former was more of a fallback and does not reflect a real silicon revision.
> 
> - moved status="okay" to the last entry in 'uarta' node.
> 
> - removed 'local-*-address' property from everywhere.
> 
> - dropped 'skip-init' property in 'uarta' node since it does not apply to
>   linux kernel.
> 
> - renamed 'pwr-button' node to 'gpio-keys' and 'pwr_key' node to
>   'power_button'.
> 
> - dropped an userspace related 'brcm,gpio-direct' property from gpio node.
> 
> 
> 
> --- DT BINDINGS ---
> 
> - binding schema file renamed to 'brcm,bcm2712c0-pinctrl.yaml' to reflect the
>   compatible name.
> 
> - dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
>   compatibles are permitted now.
> 
> - added example section.
> 
> - moved allOf: block at the beginning of the schema.
> 
> - dropped some unnecessary new lines.
> 
> - replaced current layout to describe the pin subnodes with patternProperties
>   (nodes now end with -state and -pins).
> 
> - expanded the schema description to give some context about STB family of pin
>   controller and added some details about C0 and D0 silicon variants. This is
>   also reflected in the commit message.
> 
> 
> --- MISC ---
> 
> - enabled CONFIG_PINCTRL_BRCMSTB in arm64 defconfig.
> 
> 
> Andrea della Porta (1):
>   arm64: defconfig: Enable BCM2712 on-chip pin controller driver
> 
> Ivan T. Ivanov (6):
>   dt-bindings: pinctrl: Add support for Broadcom STB pin controller
>   pinctrl: bcm: Add STB family pin controller driver
>   arm64: dts: broadcom: bcm2712: Add pin controller nodes
>   arm64: dts: broadcom: bcm2712: Add one more GPIO node
>   arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
>   arm64: dts: broadcom: bcm2712: Add UARTA controller node
> 
>  .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       |  123 ++
>  .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  134 ++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |   48 +
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/pinctrl/bcm/Kconfig                   |   13 +
>  drivers/pinctrl/bcm/Makefile                  |    1 +
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 1195 +++++++++++++++++
>  7 files changed, 1515 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
> 
> --
> 2.35.3
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
 Base: tags/next-20250715 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/broadcom/' for cover.1752584387.git.andrea.porta@suse.com:

arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: pinctrl@7d504100 (brcm,bcm2712c0-pinctrl): emmc-sd-default-state: 'oneOf' conditional failed, one must be fixed:
	'function' is a required property
	'bias-pull-up', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: pinctrl@7d504100 (brcm,bcm2712c0-pinctrl): emmc-sd-default-state: 'oneOf' conditional failed, one must be fixed:
	'function' is a required property
	'bias-pull-up', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: serial@7d50c000 (brcm,bcm7271-uart): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: serial@7d50c000 (brcm,bcm7271-uart): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: serial@7d50c000 (brcm,bcm7271-uart): 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: serial@7d50c000 (brcm,bcm7271-uart): Unevaluated properties are not allowed ('auto-flow-control', 'clock-frequency', 'reg-io-width', 'reg-shift' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: mmc@1100000 (brcm,bcm2712-sdhci): Unevaluated properties are not allowed ('sdhci-caps', 'sdhci-caps-mask' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/brcm,sdhci-brcmstb.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: serial@7d50c000 (brcm,bcm7271-uart): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: serial@7d50c000 (brcm,bcm7271-uart): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: serial@7d50c000 (brcm,bcm7271-uart): 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: serial@7d50c000 (brcm,bcm7271-uart): Unevaluated properties are not allowed ('auto-flow-control', 'clock-frequency', 'reg-io-width', 'reg-shift' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: mmc@1100000 (brcm,bcm2712-sdhci): Unevaluated properties are not allowed ('sdhci-caps', 'sdhci-caps-mask' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/brcm,sdhci-brcmstb.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pinctrl@7d504100 (brcm,bcm2712c0-pinctrl): emmc-sd-default-state: 'oneOf' conditional failed, one must be fixed:
	'function' is a required property
	'bias-pull-up', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: serial@7d50c000 (brcm,bcm7271-uart): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: serial@7d50c000 (brcm,bcm7271-uart): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: serial@7d50c000 (brcm,bcm7271-uart): 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: serial@7d50c000 (brcm,bcm7271-uart): Unevaluated properties are not allowed ('auto-flow-control', 'clock-frequency', 'reg-io-width', 'reg-shift' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[27, 4], [27, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: mmc@1100000 (brcm,bcm2712-sdhci): Unevaluated properties are not allowed ('sdhci-caps', 'sdhci-caps-mask' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/brcm,sdhci-brcmstb.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[27, 4], [27, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[27, 4], [27, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#







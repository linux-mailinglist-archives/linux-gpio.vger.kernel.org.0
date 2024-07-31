Return-Path: <linux-gpio+bounces-8488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C6943201
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 16:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E19EA1C243DF
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 14:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09571BA889;
	Wed, 31 Jul 2024 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9YDVoVA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6671BA87E;
	Wed, 31 Jul 2024 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435944; cv=none; b=hti/KvEhK8bex85y0IUsrsotr95qgQLBH0TLLMe2LDkX1mpTtb1BfekrdM4VyGmedOP1DwpVeWjW2pDYsaCxw/Rgq9QoyrNKZz6zvgKM5M7jzs1eTnA49PA0uDR9+4JdLRmkbnCxqKDhdZLSqQN2gjbmBJMEu6REG71NvRxX9C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435944; c=relaxed/simple;
	bh=nFrpTEL72ncMiEVg5MV9Nz+lBTH5NVX5OD0iZeNpyeU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=kbi5A1cEuWQHWZp00ZS5a+B+GHgRCQjbj4sgukjWd80kiXVeUd5sD3kh4rTzVWVH7iuP9MqgZpMnX4d0Btwf8AwyOEBgC/zPE7iFJP+m7sU0LM9V6C4FBqrh+hrgvY2SasCDdwuofqb3ZHtltSNUt4pwkTYmhAcTmYaM3TGr/Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9YDVoVA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA43CC116B1;
	Wed, 31 Jul 2024 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722435944;
	bh=nFrpTEL72ncMiEVg5MV9Nz+lBTH5NVX5OD0iZeNpyeU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=r9YDVoVA7qtB6NcQdETFq1n/dfAOcEQ8dx7N7ML/Gafy35jGg9aslRRlc2xf5XOvQ
	 /F6wh2TawekzopDISnehOA8tcEQjDg32yO7lUzT7MR5Sdb3nuF5MBSnXy0tklQo8VZ
	 KlxEuPm1DrEjOJAS+8OiNNUQVabfy0xVPVAt6LelLPKro4RA7UEHM4vUzEmYYSruc5
	 Uyz7fRuElmCSM2tzwOrtwWlel3xqsKYg80uEfu0pkr642vPx4vAcq+UsBkcBf9F+28
	 3Mju46PwxTMhsACVTkEYodGGtcfL/fdrR+n2Ob+HKe36ElySGEzxplzTq8pDD5zBKp
	 BGz/z1314XxTQ==
Date: Wed, 31 Jul 2024 08:25:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Ivan T. Ivanov" <iivanov@suse.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, andrea.porta@suse.com, 
 florian.fainelli@broadcom.com, linux-gpio@vger.kernel.org, 
 krzk+dt@kernel.org, wahrenst@gmx.net, linux-arm-kernel@lists.infradead.org, 
 linus.walleij@linaro.org
In-Reply-To: <20240731062814.215833-1-iivanov@suse.de>
References: <20240731062814.215833-1-iivanov@suse.de>
Message-Id: <172243537599.718775.994017602551237055.robh@kernel.org>
Subject: Re: [PATCH 0/7] Add pin control driver for BCM2712 SoC


On Wed, 31 Jul 2024 09:28:07 +0300, Ivan T. Ivanov wrote:
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
> Patch 3 was already posted by Andrea and it is in Broadcom integration tree[3].
> Unfortunately it is still not in the Linus tree[4]. So I added it here as base
> for my changes and to easy building and testing.
> 
> Patch 5 wire up power button on RPi5
> 
> Patch 6 adds WiFi Devicetree node for RPi5
> 
> Patch 7 adds Bluetooth Devicetree node for RPi5
> 
> They are few complaints from checkpatch.pl. Like few lines over 100 columns,
> which I keep that way for better readability or usage of EOPNOTSUPP,
> but it is according pin control API document.
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
> Ivan
> 
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> [2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/pinctrl/bcm/pinctrl-bcm2712.c
> [3] https://lore.kernel.org/lkml/20240605120712.3523290-1-florian.fainelli@broadcom.com/#t
> [4] https://lore.kernel.org/all/bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net/
> 
> 
> Andrea della Porta (1):
>   arm64: dts: broadcom: Add support for BCM2712
> 
> Ivan T. Ivanov (6):
>   dt-bindings: pinctrl: Add support for Broadcom STB pin controller
>   pinctrl: bcm: Add STB family pin controller driver
>   arm64: dts: broadcom: bcm2712: Add pin controller nodes
>   arm64: dts: broadcom: bcm2712: Add one more GPIO node
>   arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
>   arm64: dts: broadcom: bcm2712: Add UARTA controller node.
> 
>  .../pinctrl/brcm,brcmstb-pinctrl.yaml         |   73 +
>  arch/arm64/boot/dts/broadcom/Makefile         |    1 +
>  .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  203 +++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  357 +++++
>  drivers/pinctrl/bcm/Kconfig                   |   13 +
>  drivers/pinctrl/bcm/Makefile                  |    1 +
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 1217 +++++++++++++++++
>  7 files changed, 1865 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
>  create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
>  create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>  create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
> 
> 
> base-commit: dc1c8034e31b14a2e5e212104ec508aec44ce1b9
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y broadcom/bcm2712-rpi-5-b.dtb' for 20240731062814.215833-1-iivanov@suse.de:

arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: mmc@1001100000: compatible: 'oneOf' conditional failed, one must be fixed:
	['brcm,bcm2712-sdhci'] is too short
	'brcm,bcm2712-sdhci' is not one of ['brcm,bcm7216-sdhci']
	from schema $id: http://devicetree.org/schemas/mmc/brcm,sdhci-brcmstb.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: mmc@1001100000: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/brcm,sdhci-brcmstb.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: mmc@1001100000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/brcm,sdhci-brcmstb.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: mmc@1001100000: Unevaluated properties are not allowed ('compatible', 'sdhci-caps', 'sdhci-caps-mask' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/brcm,sdhci-brcmstb.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: wifi@1: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/timer@7c003000: failed to match any schema with compatible: ['brcm,bcm2835-system-timer']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/local-intc@7cd00000: failed to match any schema with compatible: ['brcm,bcm2836-l1-intc']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: intc@7d508400: $nodename:0: 'intc@7d508400' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: gpio@7d508500: compatible:0: 'brcm,brcmstb-gpio' is not one of ['brcm,bcm7445-gpio']
	from schema $id: http://devicetree.org/schemas/gpio/brcm,brcmstb-gpio.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: gpio@7d508500: compatible: ['brcm,brcmstb-gpio'] is too short
	from schema $id: http://devicetree.org/schemas/gpio/brcm,brcmstb-gpio.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: gpio@7d508500: 'brcm,gpio-direct' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/brcm,brcmstb-gpio.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: serial@7d50c000: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: serial@7d50c000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: serial@7d50c000: 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: serial@7d50c000: Unevaluated properties are not allowed ('auto-flow-control', 'clock-frequency', 'reg-io-width', 'reg-shift', 'skip-init' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/brcm,bcm7271-uart.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: bluetooth: 'local-bd-address' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/broadcom-bluetooth.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pwr-button: 'pwr' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#







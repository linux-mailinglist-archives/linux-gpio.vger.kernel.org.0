Return-Path: <linux-gpio+bounces-25160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44166B3ABAE
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 22:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EFAF1BA2090
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 20:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FB4286D49;
	Thu, 28 Aug 2025 20:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4mAE+wl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A34930CD84;
	Thu, 28 Aug 2025 20:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413122; cv=none; b=iJj1bR79QAkmYYhIR9+xwkda6S/1SQ1N4ecnh0HkI04c7RYLjG1nexzKJCFXBHzJKthZmkdAP4voYiOJ3N/uMGS0+wO3yUHI7WjqJ33Qcb+g/g3vQHmaFRazrCtnYpMHpwZ+tj8STD3csnou2rLv2W2b3yjdIpqlPQAte875jKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413122; c=relaxed/simple;
	bh=chUn1trC5oap78AGczBtZJXhoPTABqNbnbAgK9/1vKE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bjCWhew1iXADaq54Z8T+8fEsUN5UFzgfQs2R/EjAX2P5BXLZUUBwZ5wKmfr0pahkWSxB/LGUzK5IDZ5BnYw21XumnSzxudIHT6c3t9rfVsn3SBrx1/Moal+4vg6bV1a+thEEDrMciT7ob7xb/MfzgSeiaBqjBSbdzinfdOebwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4mAE+wl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A97C4CEEB;
	Thu, 28 Aug 2025 20:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756413120;
	bh=chUn1trC5oap78AGczBtZJXhoPTABqNbnbAgK9/1vKE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=F4mAE+wlzG6ckj5Bggxfixgyh/Nqc6XfCZLnWK5mygT4nR1rH/eBWoXh4NpF5bJW5
	 sOGyF2MqffaXUYQIKmcT5r+Q3u+u69KtmrkfTqcsWWAvN29uvH2psbyDsVBtPBdfLH
	 uwiLN+vY6jpuuoSHLdXr4GM2XXNujl4Wjt91qmu4cEIIXlEt0m2VYapmXYf5f9MF8j
	 4oiA0PbS1zaFvN4ka7oUPogW16o74kFxQYVbForFSfo8whiogVBamurFcualvFyWGq
	 bf2Pqda6GGBeBcoU0D44ogsfCbKVyh13SyVHjtE1WYcr08YCuG35dZXeSznMNHKrmE
	 lBsJsMSRNIKuQ==
Date: Thu, 28 Aug 2025 15:31:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, florian.fainelli@broadcom.com, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-gpio@vger.kernel.org, 
 Jonathan Bell <jonathan@raspberrypi.com>, svarbanov@suse.de, 
 linus.walleij@linaro.org, devicetree@vger.kernel.org, 
 linux-serial@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 conor+dt@kernel.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Jiri Slaby <jirislaby@kernel.org>, krzk+dt@kernel.org, 
 Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org, 
 wahrenst@gmx.net, iivanov@suse.de, mbrugger@suse.com, 
 Will Deacon <will@kernel.org>, Phil Elwell <phil@raspberrypi.com>
To: Andrea della Porta <andrea.porta@suse.com>
In-Reply-To: <cover.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com>
Message-Id: <175641306018.2175061.15558471823903740794.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] Add peripheral nodes to RaspberryPi 5 DT


On Thu, 28 Aug 2025 15:17:09 +0200, Andrea della Porta wrote:
> Hi,
> 
> The following patches add a few peripheral DT nodes and related pin/gpio
> nodes for Raspberry Pi 5.
> 
> - Patch 1: Amend the bindings to avoid DT compiler warnings.
> 
> - Patch 2: Adds core pinctrl nodes and defines SD pins as a first appliance
>   for the pinctrl.
> 
> - Patch 3: Wires the gpio-key for power button and related gpio controller.
> 
> - Patch 4: Adds DT node for WiFi.
> 
> - Patch 5: Adds Bluetooth DT node.
> 
> All comments and suggestions are welcome!
> 
> Happy hacking!
> Ivan and Andrea
> 
> 
> CHANGES in V2:
> 
> --- DTS ---
> 
> - bcm2712.dtsi: added a proper clocks node to the uarta serial
>   in order to replace the legacy clock-frequency property. As
>   a result, the following patch from the previous patchset
>   has been dropped since it's now useless:
> 
>   "dt-bindings: serial: Add clock-frequency property as an alternative to clocks"
> 
> 
> Andrea della Porta (1):
>   dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI
>     controller
> 
> Ivan T. Ivanov (4):
>   arm64: dts: broadcom: bcm2712: Add pin controller nodes
>   arm64: dts: broadcom: bcm2712: Add one more GPIO node
>   arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
>   arm64: dts: broadcom: bcm2712: Add UARTA controller node
> 
>  .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +-
>  .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 ++++++++++++++++++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  55 ++++++++
>  3 files changed, 189 insertions(+), 1 deletion(-)
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
 Base: tags/next-20250828 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/broadcom/' for cover.1756386531.git.andrea.porta@suse.com:

arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#







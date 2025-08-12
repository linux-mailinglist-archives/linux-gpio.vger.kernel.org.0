Return-Path: <linux-gpio+bounces-24285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB90B2266D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE48C3AFD99
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47F72EFDA5;
	Tue, 12 Aug 2025 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxiTIAI1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D83A2EFD9A;
	Tue, 12 Aug 2025 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000734; cv=none; b=YLBdu+HTBuvgAmMZvam6oyDf/6Mf/oA6rrndLWEdX0Bz5iq765iRJxeP0ZjYSIfEI8szze2KL/0RjMrB6dkVxrcz4Q+bEoGcvTuAHuQbI5VoQEYsDLD6jfPVHbNt+ZyVtHR0FV82YEbz7Z2FCAvYoeOIS1tjoSkHIx/jBQjbLo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000734; c=relaxed/simple;
	bh=F0jl31lJlrxf9bEufJTtyVHDr4swwK0MIuhlvBZ02rI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=on3Zj3vYFOjaoZYtYR7TXPeH1zbL20ORWkSsEbkGRl5J1juAgW1FK9NJ6Jy3ijbTBafcJhIzjXLdYdm+6Gus4WuyKDt7r+cU664eeGS97LwApsT8d4srP0U9ueuvYIwnjAjUVyuzuqSFESydrbzwIHT/sejayfcwzQ2i/5Tq7ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxiTIAI1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E86C4CEF0;
	Tue, 12 Aug 2025 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755000734;
	bh=F0jl31lJlrxf9bEufJTtyVHDr4swwK0MIuhlvBZ02rI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NxiTIAI1ZsZXXFMENyUYwQ71XKs/s3vuE6fp+I1hYPgB6PXVv15ewjRQUqM4Umlx+
	 0jQWgC15JhMbNemnEMb0QmnEDXlqCRm1uzFY6hV+WXAqAlcm/SPhnj9UiDqLv3cxQ8
	 GmxH1xpVpqnr5oD83WeZPoPnJCpK1v4IQUZCc3lvwQkNxDz16Ozeis9EcG5/6YrBZH
	 mPUtqQMPvVubq6awHo4z7K4fzHL6D3G9LRrwowAnxf/hiM/eNl3zbRFjb7lHLElLae
	 EJfHX08hmRv7ohiz7GPtf/CQF4ctBHvjt57rDpFYdU96BVJBArwwAch0XQgHviEjq6
	 idPVAE4mb51yg==
Date: Tue, 12 Aug 2025 07:12:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: iivanov@suse.de, florian.fainelli@broadcom.com, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-mmc@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, linus.walleij@linaro.org, 
 Jonathan Bell <jonathan@raspberrypi.com>, linux-serial@vger.kernel.org, 
 conor+dt@kernel.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, svarbanov@suse.de, 
 Phil Elwell <phil@raspberrypi.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, 
 mbrugger@suse.com, wahrenst@gmx.net, Al Cooper <alcooperx@gmail.com>
To: Andrea della Porta <andrea.porta@suse.com>
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
Message-Id: <175500063439.2957253.9707220864929081392.robh@kernel.org>
Subject: Re: [PATCH 0/6] Add peripheral nodes to RaspberryPi 5 DT


On Mon, 11 Aug 2025 17:19:44 +0200, Andrea della Porta wrote:
> Hi,
> 
> The following patches add a few peripheral DT nodes and related pin/gpio
> nodes for Raspberry Pi 5.
> 
> This brand new patchset (hence it's a V1) is the second part of the split-up
> of the patchset [1]. It tooks patches 3 to 6 from there and adds a couple
> of new patches that amend the DT bindings.
> As a result, patchset [2] is a prerequisite for this patchset.
> 
> - Patch 1 and 2: Amend the bindings to avoid DT compiler warnings.
> 
> - Patch 3: Adds core pinctrl nodes and defines SD pins as a first appliance
>   for the pinctrl.
> 
> - Patch 4: Wires the gpio-key for power button and related gpio controller.
> 
> - Patch 5: Adds DT node for WiFi.
> 
> - Patch 6: Adds Bluetooth DT node.
> 
> All comments and suggestions are welcome!
> 
> Happy hacking!
> Ivan and Andrea
> 
> Links:
> [1] - https://lore.kernel.org/all/cover.1752584387.git.andrea.porta@suse.com/
> [2] - https://lore.kernel.org/all/cover.1754922935.git.andrea.porta@suse.com/
> 
> 
> CHANGES since [1]:
> 
> --- PATCHES ---
> 
> - Add two new patches (1 and 2) that amend the DT bindings.
> 
> 
> --- DTS ---
> 
> - bcm2712.dtsi: Added 'interrupt-names' and dropped 'reg-shift' and
>   'reg-io-width' properties in uarta DT node. The latter two are
>   just overridden by driver code so setting them in DT is useless.
> 
> - bcm2712-rpi-5-b-ovl-rp1.dts: dropped 'auto-flow-control' property
>   since it's not parsed in driver code.
> 
> 
> --- DT BINDINGS ---
> 
> - brcm,sdhci-brcmstb.yaml: added SDHCI capabilities by including
>   sdhci-common.yaml.
> 
> - serial/brcm,bcm7271-uart.yaml: let clock-frequency be an alternative way
>   to specify the clock speed instead of clocks/clock-names.
> 
> 
> Andrea della Porta (2):
>   dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI
>     controller
>   dt-bindings: serial: Add clock-frequency property as an alternative to
>     clocks
> 
> Ivan T. Ivanov (4):
>   arm64: dts: broadcom: bcm2712: Add pin controller nodes
>   arm64: dts: broadcom: bcm2712: Add one more GPIO node
>   arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
>   arm64: dts: broadcom: bcm2712: Add UARTA controller node
> 
>  .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +-
>  .../bindings/serial/brcm,bcm7271-uart.yaml    |  19 ++-
>  .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 ++++++++++++++++++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  47 +++++++
>  4 files changed, 198 insertions(+), 3 deletions(-)
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
 Base: tags/next-20250808 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/broadcom/' for cover.1754924348.git.andrea.porta@suse.com:

arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[27, 4], [27, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[27, 4], [27, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[27, 4], [27, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#







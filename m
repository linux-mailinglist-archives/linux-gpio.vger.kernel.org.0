Return-Path: <linux-gpio+bounces-18028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A21A71EE2
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 20:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8041895BD6
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 19:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC714255254;
	Wed, 26 Mar 2025 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGQQ9Zom"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85216254855;
	Wed, 26 Mar 2025 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743016300; cv=none; b=tPKAXO0CttZp05fJQEvPUed2y5yib6VjxC9+6mROqGy8ZjupgEeF64l2GFWaNCbW4znD5KY2k/NVuMX+yvtq1S4xFLT2Ku5dMbYN5rZtu3H7qATlb90Jdmafm4+KHLxniEITz6+BzWOkt1qqwARVy1LLgbibu2rdTXq63JIJBD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743016300; c=relaxed/simple;
	bh=p6PSDcM/+zJCZa2wx8tmkawqFwv4c4wkJ/mcRtrEBxI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=q5BZqHlF/nO19LfLsv2XMENX2OJB46Gs1igpUTRuq9wBrS9TZHF/XqQRo1refHXqmEZYql1bcHkx9PsUkXkcfholXuyhkCvc93w2iOZppUOq9AIEQd8forkdV1gY80E411Gdnbap2SzayAkg7JEcmcXXoqi0L00V1rjHcIOVOlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGQQ9Zom; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F24C4CEE9;
	Wed, 26 Mar 2025 19:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743016300;
	bh=p6PSDcM/+zJCZa2wx8tmkawqFwv4c4wkJ/mcRtrEBxI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JGQQ9ZomZKQogiTpjeGHckH5smUSR+7wFLv4N79DIZm07XHJYBpXvSVZbaLkNOIrH
	 DQ7S9g80Ura84vXqY5ONaTulbDruyvFFO2znj/Cpoa8jqaDBFgr8wGhwX/rrYOE1bu
	 x45OJfdbx9RAGgK6Qu6hry8DnhwcnWyOpWIvdjHJyKrQgcupegZ3D8VOUECsAj2It/
	 Si1tDFBtFHBWFKbnVVT33KYLSWtpx/WE8CbziQW7MjpAHzyMH2ou+k0+tnNtAZKrwZ
	 yL7GhFeRqKYBFamcQzf74VImcnIYSV7RAW+xzja2OJgojUtt7yKhBbo1Vx2NVg0wkL
	 iTdzl4aMQfwKQ==
Date: Wed, 26 Mar 2025 14:11:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-renesas-soc@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <174301523991.2716417.14351851624098585706.robh@kernel.org>
Subject: Re: [PATCH 00/15] Add support for Renesas RZ/V2N SoC and EVK


On Wed, 26 Mar 2025 14:39:30 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> This patch series adds initial support for the Renesas RZ/V2N (R9A09G056)
> SoC and its evaluation board (EVK). The Renesas RZ/V2N is a vision AI
> microprocessor (MPU) designed for power-efficient AI inference and
> real-time vision processing. It features Renesas' proprietary AI
> accelerator (DRP-AI3), delivering up to 15 TOPS AI performance, making
> it ideal for applications such as Driver Monitoring Systems (DMS),
> industrial monitoring cameras, and mobile robots.
> 
> Key features of the RZ/V2N SoC:
>   Processing Power:
>     - Quad Arm Cortex-A55 cores at 1.8GHz for high-performance computing
>     - Single Arm Cortex-M33 core at 200MHz for real-time processing
>     - 1.5MB on-chip SRAM for fast data access
>     - LPDDR4/LPDDR4X memory interface for high-speed RAM access
> 
>   AI and Vision Processing:
>     - DRP-AI3 accelerator for low-power, high-efficiency AI inference
>     - Arm Mali-C55 ISP (optional) for image signal processing
>     - Dual MIPI CSI-2 camera interfaces for multi-camera support
> 
>   High-Speed Interfaces:
>     - PCIe Gen3 (2-lane) 1ch for external device expansion
>     - USB 3.2 (Gen2) 1ch (Host-only) for high-speed data transfer
>     - USB 2.0 (Host/Function) 1ch for legacy connectivity
>     - Gigabit Ethernet (2 channels) for network communication
> 
>   Industrial and Automotive Features:
>     - 6x CAN FD channels for automotive and industrial networking
>     - 24-channel ADC for sensor data acquisition
> 
> LINK: https://tinyurl.com/renesas-rz-v2n-soc
> 
> The series introduces:
> - Device tree bindings for various subsystems (SYS, SCIF, SDHI, CPG, pinctrl).
> - RZ/V2N SoC identification support.
> - Clock and pinctrl driver updates for RZ/V2N.
> - Initial DTSI and device tree for the RZ/V2N SoC and EVK.
> - Enabling RZ/V2N SoC support in `arm64 defconfig`.
> 
> These patches have been tested on the RZ/V2N EVK with v6.14,
> logs can be found here https://pastebin.com/8i3jgVby
> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (15):
>   dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants
>   dt-bindings: soc: renesas: Document RZ/V2N EVK board
>   soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
>   dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
>   soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
>   dt-bindings: serial: renesas: Document RZ/V2N SCIF
>   dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
>   dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
>   clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part number
>   clk: renesas: rzv2h: Add support for RZ/V2N SoC
>   dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
>   pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
>   arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
>   arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
>   arm64: defconfig: Enable Renesas RZ/V2N SoC
> 
>  .../bindings/clock/renesas,rzv2h-cpg.yaml     |   5 +-
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml |   4 +-
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
>  .../bindings/serial/renesas,scif.yaml         |   1 +
>  .../soc/renesas/renesas,r9a09g057-sys.yaml    |   1 +
>  .../bindings/soc/renesas/renesas.yaml         |  15 +
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 264 ++++++++++++++++++
>  .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 115 ++++++++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/clk/renesas/Kconfig                   |   5 +
>  drivers/clk/renesas/Makefile                  |   1 +
>  drivers/clk/renesas/r9a09g056-cpg.c           | 152 ++++++++++
>  drivers/clk/renesas/rzv2h-cpg.c               |  18 +-
>  drivers/clk/renesas/rzv2h-cpg.h               |   1 +
>  drivers/pinctrl/renesas/Kconfig               |   1 +
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  36 ++-
>  drivers/soc/renesas/Kconfig                   |  10 +
>  drivers/soc/renesas/Makefile                  |   1 +
>  drivers/soc/renesas/r9a09g056-sys.c           | 107 +++++++
>  drivers/soc/renesas/rz-sysc.c                 |   3 +
>  drivers/soc/renesas/rz-sysc.h                 |   1 +
>  .../dt-bindings/clock/renesas,r9a09g056-cpg.h |  24 ++
>  .../pinctrl/renesas,r9a09g056-pinctrl.h       |  30 ++
>  24 files changed, 790 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
>  create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c
>  create mode 100644 drivers/soc/renesas/r9a09g056-sys.c
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h
>  create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h
> 
> --
> 2.49.0
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
 Base: tags/next-20250326 (best guess, 15/18 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com:

arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000: 'interrupt-controller' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000: '#interrupt-cells' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#







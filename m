Return-Path: <linux-gpio+bounces-18006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A6A718BF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BFA63B8FB5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A941F3D49;
	Wed, 26 Mar 2025 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3RLpIUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B11F12F3;
	Wed, 26 Mar 2025 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000001; cv=none; b=AzEJwdV/xk4Qngwgi2+XspNCNBu7VfxMPR9rNtU1B/2HYnjHgMNnSTqFl0OiIllUnUa2CufQQrPNqoFhN7YpGWbaQelxwnWONHiu2ldB2EYf2MbEALrbUdOFMBC/g+AXkR8tHSt0PkoyZhdNUQlo5/6opGhtmcAtlPcBaIztkVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000001; c=relaxed/simple;
	bh=xNcdD4MukR9BXxT1Xn891EkJMtOzk3jHRuQfj1K76Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ii74MNxIaXNcpR6S6rn1vrDwXRPtfXHM2gFn1pohmbPie6eJzBDWApHKkGRXThNDltE/bbJ7DTwnt2YsFq8VASdfoEgRutam61nn7mEFZfaOo4vJtCzM+UQAX4+Hv6VAORCFO0mkzMUgIQ5Qf4eLlJAjb16nLmznn6Vbajj2RFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3RLpIUo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso72316845e9.3;
        Wed, 26 Mar 2025 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742999997; x=1743604797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2escYwrmWHZI04j1+ZmCi0mw73OS6dWdYk3lX1suGw=;
        b=l3RLpIUoeSSvH5lPp35TN8OcBk90zM8ekDOqtaRQdUXhY7WXU2shMOiqwOv85OPJvG
         RdN+7Pz9U3X0PkNfXiSDJeMLpAYlkPOLLuUGEeWdosa4BbV5wQaK9nlZadzXj8ifAEMo
         aSyeq8hgsXLYx3mpR5Vgk6NdNpX1sZ6WE1+gvDbQPoqqI9z7iBywKQbra0TbRAukVhr6
         cNBsO8a5IwcVPb4oeCWAHTwr1LNweFl6fEtCHyMiC3ScNAm/j4vPavQIqWWAsqiiqVE/
         NuEyqaYSCN2pd89+3XlAH1fvl1Ecbklj2ZM4TNGx0YBKkP4AVlPYghbMaK8N9ua5Nlg/
         KUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999997; x=1743604797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2escYwrmWHZI04j1+ZmCi0mw73OS6dWdYk3lX1suGw=;
        b=Tf8hE0FyQR55SpSQygxX6sO7bTAa9wjktbkwdn1Y9T+kJvfMJs4Sxn7atX+lj/NkN6
         cEGWh44Ep1Y8AtqG7wifUoQHWOpMxEf990pYErakq0NI+tsp9u08qNHJusLe57+Aq5Ya
         N1g0tMs4IO4xnMNSr0X4zW5iR55dqHF/lDLdvyrX5S4OJ91Ioiw/qmt3NC06hmxuYcOa
         kOl2gVp/6azx/HSKxBOdDSWnc4zZXTe4gTMUvPCR6uVrmd6KMlrTINgaXC8MIBIe1k6S
         KHng5ClZI0jxRoY8rUEXNq35OIsaiV8TFchU0b9GCOQJw9AJ2OFhgpz9N/Luq/2eN7rp
         5SDQ==
X-Forwarded-Encrypted: i=1; AJvYcCURIdwhox0gTHP/6O2SMigIXJMCQX2xfH3olvUTawz1mc1kecFubOLskBie9dCwn9np1QY7onbN/+gdnA==@vger.kernel.org, AJvYcCV6MdFCwiNolvMTg3h1HE7uCWWOVy9RCGIlBEWHqAxBbcoGQHk+R2iBd4w7TqoVjgesjVQ2k3Jq9nKK@vger.kernel.org, AJvYcCVFmGNJFs41Gb9vCVVv7rvLsOJFiDHfUFI/qgQyNcFLbhG0l7RfZmkJjZy52WLSbbZxKmbJi9B4n3+Kxq8s@vger.kernel.org, AJvYcCWOBRIf9jae2MGzwjzLnMLVPgmP9eDMx0Ub6UJKr7gUnulQxEF5s7ZLV8oCh9YemnSLkotC44ehUyOp@vger.kernel.org, AJvYcCWXQErbeXn0RNvSfVnSsFFzBMubjocVc1AH05ckr7XwhXwF+I9a5DLOA19Hnr9SeCXIac4cwkAdH2kZ@vger.kernel.org, AJvYcCWa4v2SvDTqDxPZiq1yjvqWTv4Tj41K+up2mip7+aEuWcVzVmf0JRrCj5Swnr8uynuOi3k+ZlwdDWJn8D53@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjph1bPHEz+4if0cGSOqvCfmsvHtYOLV9KqVdcC3YpdeE1qNdv
	vOZsGah/u6Y/usnlIQfpLWEyO0+8FuDUDRpl4Ya+Y+Ly0uSmSMOc
X-Gm-Gg: ASbGnctf0268BbGPMdsr6prkngpc78lwNmPBVsyx6bVdRCoCAfboqTKuiJBbRMzJZzp
	zdhMSG/VLxm+SwQzRnFu2sC114lS600AXB2gKWLmdR7FnyQ4j6n/gWSD00dhc3BPeldM43PNT/g
	8o05hHsEGrVb3fAmguLz1rlYZp0x05ooVm1AklWBZiAWjOvNlZFi36RUGbofC3dqB5RtuZLJQaq
	nvFRYnVavB9PCdR3CKnAyCkn87CcrM2DamjvcmvSFuwN4nObwL/w4vDAnSTltVEsUQK/HoVOw4w
	Ug4gphfNrFgaHeqxFMe4xOrKLgDjNJV/EYoEWIfFQNQSBHcFdvwZkM6DfuaZJSpYJMTD
X-Google-Smtp-Source: AGHT+IGdl4gZEs10PQlzsN+VIaU/DUCwY0IWNIT2HC33rcyjm98sYqp/GuDO9Lr86yE82SREs/oVZQ==
X-Received: by 2002:a05:600c:5849:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43d52a2068emr136915965e9.8.1742999997100;
        Wed, 26 Mar 2025 07:39:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:39:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/15] Add support for Renesas RZ/V2N SoC and EVK
Date: Wed, 26 Mar 2025 14:39:30 +0000
Message-ID: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch series adds initial support for the Renesas RZ/V2N (R9A09G056)
SoC and its evaluation board (EVK). The Renesas RZ/V2N is a vision AI
microprocessor (MPU) designed for power-efficient AI inference and
real-time vision processing. It features Renesas' proprietary AI
accelerator (DRP-AI3), delivering up to 15 TOPS AI performance, making
it ideal for applications such as Driver Monitoring Systems (DMS),
industrial monitoring cameras, and mobile robots.

Key features of the RZ/V2N SoC:
  Processing Power:
    - Quad Arm Cortex-A55 cores at 1.8GHz for high-performance computing
    - Single Arm Cortex-M33 core at 200MHz for real-time processing
    - 1.5MB on-chip SRAM for fast data access
    - LPDDR4/LPDDR4X memory interface for high-speed RAM access

  AI and Vision Processing:
    - DRP-AI3 accelerator for low-power, high-efficiency AI inference
    - Arm Mali-C55 ISP (optional) for image signal processing
    - Dual MIPI CSI-2 camera interfaces for multi-camera support

  High-Speed Interfaces:
    - PCIe Gen3 (2-lane) 1ch for external device expansion
    - USB 3.2 (Gen2) 1ch (Host-only) for high-speed data transfer
    - USB 2.0 (Host/Function) 1ch for legacy connectivity
    - Gigabit Ethernet (2 channels) for network communication

  Industrial and Automotive Features:
    - 6x CAN FD channels for automotive and industrial networking
    - 24-channel ADC for sensor data acquisition

LINK: https://tinyurl.com/renesas-rz-v2n-soc

The series introduces:
- Device tree bindings for various subsystems (SYS, SCIF, SDHI, CPG, pinctrl).
- RZ/V2N SoC identification support.
- Clock and pinctrl driver updates for RZ/V2N.
- Initial DTSI and device tree for the RZ/V2N SoC and EVK.
- Enabling RZ/V2N SoC support in `arm64 defconfig`.

These patches have been tested on the RZ/V2N EVK with v6.14,
logs can be found here https://pastebin.com/8i3jgVby 

Cheers,
Prabhakar

Lad Prabhakar (15):
  dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants
  dt-bindings: soc: renesas: Document RZ/V2N EVK board
  soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
  dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
  soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
  dt-bindings: serial: renesas: Document RZ/V2N SCIF
  dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
  dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
  clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part number
  clk: renesas: rzv2h: Add support for RZ/V2N SoC
  dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
  pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
  arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
  arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
  arm64: defconfig: Enable Renesas RZ/V2N SoC

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |   5 +-
 .../devicetree/bindings/mmc/renesas,sdhi.yaml |   4 +-
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
 .../bindings/serial/renesas,scif.yaml         |   1 +
 .../soc/renesas/renesas,r9a09g057-sys.yaml    |   1 +
 .../bindings/soc/renesas/renesas.yaml         |  15 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 264 ++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 115 ++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g056-cpg.c           | 152 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               |  18 +-
 drivers/clk/renesas/rzv2h-cpg.h               |   1 +
 drivers/pinctrl/renesas/Kconfig               |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  36 ++-
 drivers/soc/renesas/Kconfig                   |  10 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/r9a09g056-sys.c           | 107 +++++++
 drivers/soc/renesas/rz-sysc.c                 |   3 +
 drivers/soc/renesas/rz-sysc.h                 |   1 +
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h |  24 ++
 .../pinctrl/renesas,r9a09g056-pinctrl.h       |  30 ++
 24 files changed, 790 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
 create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c
 create mode 100644 drivers/soc/renesas/r9a09g056-sys.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h

-- 
2.49.0



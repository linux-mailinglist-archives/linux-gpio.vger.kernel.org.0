Return-Path: <linux-gpio+bounces-18384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40793A7ED17
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62565446C6D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5565224880;
	Mon,  7 Apr 2025 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UabcJY/K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BD1226173;
	Mon,  7 Apr 2025 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053405; cv=none; b=jWTXDOwt6TuABobxi7VONjkzw0co6S39iGy6AxJBW14KI9v026I3SAtj7qsCNlDDj4tT5t/tnGJW+gsYg0RbAFSwy1tY7IMmsycD2eUGjplhYEUDEhRTtQzk6UsP5yUELy1NxBMVrzKfHgvcTdmks664HMM41ZaaWcPwnsZ32v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053405; c=relaxed/simple;
	bh=wy+h0a+H+VpKIQInNbe+GcEnZeTdmx9EMTU/NVlEmd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcupwPLzn6b9CkRdK6oSbmztUGNYXIcmhqeej+afNY26FPlw8g4Jj58O/BKXeNRp9ZedoB9ZNcpkYxq3nQs7vZUluBUmuBmrRi4SgVoSLMRBz2gQoeEEUEszLJXChzbPBYy0euFeWyhVREmaCRv/60YVNvCUmDPL73C7yxx7fQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UabcJY/K; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so2819226f8f.0;
        Mon, 07 Apr 2025 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053402; x=1744658202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=adVwaU4CxLF+L5ri5pNuXghDjJip/+EsuiNLLzn9PNM=;
        b=UabcJY/K0SQgCS6ASUFIg4MkMlLEOj496WMBVRs7ds2SYd1xmld2B6qsmbEkKTyXCP
         SCgQ8rwg3yZYkB0VwTCTYEgteAbqBZhFgeBq8l/MTh02L9KxLpMekd5cjYSGy+8kYzuU
         Iou0+N47DhR2hV3wDnYtWpJi8ceerFipfqwoR1eagsWtbIMXcCiQDffETxse/U7e9uOj
         Rf++8j7fflQeZFUvjCqIfTWPeXDVao5wxoZmu0PAfLsBFVu+2JF39kg4mUyWcSOtk+xu
         LuMgUZHHbrkS4Ut1hBfVoV4a1gYesG0EPP8qjufUEim6wvYmMsenUTYDG/5iGoeXz6eo
         5b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053402; x=1744658202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adVwaU4CxLF+L5ri5pNuXghDjJip/+EsuiNLLzn9PNM=;
        b=a567AUcXZvgNA6kpP2nZ6oHi5VB6dwkAOXL5jztPjbhgV48Vzz1IBhxyiC36z4S4PW
         fPqeajKOTQNrckcQtEYy+hImvRZYl4fLOJkPhJN+pJC4j5X7pu/1PlZjqRG4pvpIYl7o
         aErIwsXPSYZ9I4fNGvXgQxxeJcd/wkhmYiY3qB0fVLt/o/y5eZXf4aT1QjjW3GA8YnRT
         gggCJSX2hUkAGCIDyp8jAinWVT4/i+bDbls+snX+/+eXaUWI0n+znvuGgqJrS0KhkyJP
         8nDW3ZGXKXyRi0hraZuUKvBtAE7NpG2gM/Gvbu/KALsI9CIhtGepA6ANX5BwQnoF9aIE
         /lbA==
X-Forwarded-Encrypted: i=1; AJvYcCUBoPX/8/NSpmflYpog7zfsaaFgwb2vbpyYQjNHuwQiPZBCh9R2oVTeP1KdrLb0RZ8uN/JXU+Uq8Jugdgqo@vger.kernel.org, AJvYcCUdCrs+FDgE24371IlYuLeL9JeoSRDzpYqXxtspNpzcmOhmyUUdZ/f5VbXszYmQ9Vf9t4nS4wBfjfOR@vger.kernel.org, AJvYcCUxi/J/AZzGKvt2/QGvR5OvY2H26PJCpGYWJg7TNGoiMHqdKdInNAPEoflP5Ad1HYD4cySbqfTX2/bl8w==@vger.kernel.org, AJvYcCVHUm2ZrNn9j8+RBjiG27fTenjpMKHoUkjvdR/wtOHEaqaJ1ylCJUsgBRxfzWiNF/lSRM2XWVnnqOod@vger.kernel.org, AJvYcCWcDs3lBAyEJRHEUm7O0uyhDG/ZmEAx0tWr52So97tHGq89OME4v+tlxnKSfC3dUSIDlPGNvCrZrSy0U5l0@vger.kernel.org
X-Gm-Message-State: AOJu0YxbLnMvBSSD0uz+JdhxuaJ4W/rijEzKeTBF5mK1Bgz//0hpHRs7
	DSIqXB/C9wfye9lcu1zK7o6k1fP+yyfr8U7nX/vVTdUXGXydAfyZ
X-Gm-Gg: ASbGnct0LL2Hv01MsR85aa1SAef2b2sckUysy+NpilmetEwDwF/x1mT/bajrDZVBNNA
	+zO9UhF7GAEHEqbru0ufqHUcTaR580QySzEtzI8r1J7ho6dCmncKlamdQA2RYbWUzp54Au+YCsX
	EgC5eOXZIwdYIRwTX+LfRK559hWAZ2WU2AuWNhi2cLrB0+pnQ4M1lkqWN0Yr+zKa0iHISqzyUVU
	lNNvFmVG/ANZMQAeNsSU71ncf8IXp0vIy6xW5unakW0ImP+PA0lVhpu4Ff2GYWuA+TnyJ4MzA61
	iESdLM5SHL+uGMHkRJUVa39/295LGnALNMzXjfNpYMQgTEd2z02vRxNrWcqUnF4ND2UtFm2/ZQn
	4YURd
X-Google-Smtp-Source: AGHT+IFWXyGSMvNF31BB2shJm+vyiFG4uhUepWHLhcfM/I8zkwk/P1CyhSk7XUpIpcbgdDxGfm90hg==
X-Received: by 2002:a05:6000:2512:b0:391:253b:405d with SMTP id ffacd0b85a97d-39d0de62927mr10917222f8f.41.1744053401522;
        Mon, 07 Apr 2025 12:16:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/12] Add support for Renesas RZ/V2N SoC and EVK
Date: Mon,  7 Apr 2025 20:16:16 +0100
Message-ID: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

These patches have been tested on the RZ/V2N EVK with v6.15-rc1 kernel,
logs can be found here:
https://gist.github.com/prabhakarlad/aa3da7558d007aab8a288550005565d3

@Geert, Ive rebased the patches on top of v6.15-rc1 + renesas-dts-for-v6.16
+ renesas-clk-for-v6.16 branches. Also these patches apply on top of the below
series [1] and [2]. I had to sort the order in Makefile for patch [3] to
avoid conflicts.
[1] https://lore.kernel.org/all/20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com/#t
[3] https://lore.kernel.org/all/20250403212919.1137670-13-thierry.bultel.yh@bp.renesas.com/

Note, dtbs_check will generate the below warnings this is due to missing
ICU support as part of initial series. I will be sending a follow-up patch
series to add ICU support which will fix these warnings.
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#

v1->v2:
- Added acks from Rob.
- Squashed the RZ/V2N EVK and SoC variant documentation into a single
  commit.
- Updated the commit messages.
- Added RZV2N_Px, RZV2N_PORT_PINMUX, and RZV2N_GPIO macros in
  SoC DTSI as we are re-using renesas,r9a09g057-pinctrl.h
  in pictrl driver hence to keep the consistency with the
  RZ/V2H(P) SoC these macros are added.
- Dropped `renesas,r9a09g056-pinctrl.h` header file.
- Followed DTS coding style guidelines
- Dropped defconfig changes from the series.
- Dropped SDHI dt-binding patch as its already applied to mmc -next tree.

Cheers,
Prabhakar

Lad Prabhakar (12):
  dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and
    EVK
  soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
  dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
  soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
  dt-bindings: serial: renesas: Document RZ/V2N SCIF
  dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
  clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part number
  clk: renesas: rzv2h: Add support for RZ/V2N SoC
  dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
  pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
  arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
  arm64: dts: renesas: Add initial device tree for RZ/V2N EVK

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |   5 +-
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
 .../bindings/serial/renesas,scif.yaml         |   1 +
 .../soc/renesas/renesas,r9a09g057-sys.yaml    |   1 +
 .../bindings/soc/renesas/renesas.yaml         |  15 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 282 ++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 114 +++++++
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g056-cpg.c           | 152 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               |  18 +-
 drivers/clk/renesas/rzv2h-cpg.h               |   1 +
 drivers/pinctrl/renesas/Kconfig               |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  36 ++-
 drivers/soc/renesas/Kconfig                   |  11 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/r9a09g056-sys.c           | 107 +++++++
 drivers/soc/renesas/rz-sysc.c                 |   3 +
 drivers/soc/renesas/rz-sysc.h                 |   1 +
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h |  24 ++
 21 files changed, 774 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
 create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c
 create mode 100644 drivers/soc/renesas/r9a09g056-sys.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h

-- 
2.49.0



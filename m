Return-Path: <linux-gpio+bounces-10581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF78A98A7F6
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 16:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A9031C22E8A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 14:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A05192B99;
	Mon, 30 Sep 2024 14:58:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0141925A3;
	Mon, 30 Sep 2024 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708303; cv=none; b=c4lgWcnjxiOHZCqMWADdSMM5INOW6kQrZVfTsZg+8mBHPy0SLSEzmffQcaeWY9XtoGQzAlCDDJM/wm5T4M2CRE2MoEX5SJXlJ9qfMrMZNTUNM+Ah9kG9smMasbMlKjIYMz8xN+1pxW7wSI56d3Jl2ght62pzVKhrIjC84vluY6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708303; c=relaxed/simple;
	bh=7RX6RwRNa67Vv/ld0q+wViNY36r0TS+nBtx/sUS5LYk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E8HcQCS1AiGHQ4wj4JBzUkskDc3NHmymF5nzGlzuXVX2gxeNUQHrehFP+6fA1O/JSVLX8uDJ9xvOGI+W0PA3K9gGUDfzol9Rgae36fM+/WkKFfU1TM1RAiXTanZmnau1zDeANdh5Awp1SticUlXJkKsdavEqpbrhWq/gXwi2FyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="220366597"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Sep 2024 23:53:12 +0900
Received: from mulinux.home (unknown [10.226.92.226])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3763A4204B8B;
	Mon, 30 Sep 2024 23:52:54 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] Add support for the RZ/V2H Interrupt Control Unit
Date: Mon, 30 Sep 2024 15:52:39 +0100
Message-Id: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear All,

This series adds whatever is required for supporting NMI, IRQ, and
TINT interrupts to the Renesas RZ/V2H SoC.

v1->v2:
* Dropped patch "dt-bindings: pinctrl: renesas: rzg2l-pinctrl: Add interrupt-parent".
* Patch "dt-bindings: interrupt-controller: Add Renesas RZ/V2H(P) Interrupt Controller"
  amended as per Rob's comments.
* Patch "irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver"
  fixed missing put_device.

Thanks,
Fab

Fabrizio Castro (5):
  pinctrl: renesas: rzg2l: Remove RZG2L_TINT_IRQ_START_INDEX
  dt-bindings: interrupt-controller: Add Renesas RZ/V2H(P) Interrupt
    Controller
  clk: renesas: r9a09g057: Add clock and reset entries for ICU
  irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver
  arm64: dts: renesas: r9a09g057: Add ICU node

 .../renesas,rzv2h-icu.yaml                    | 276 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  88 +++
 drivers/clk/renesas/r9a09g057-cpg.c           |   2 +
 drivers/irqchip/Kconfig                       |   7 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzv2h.c           | 527 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |   8 +-
 drivers/soc/renesas/Kconfig                   |   1 +
 8 files changed, 908 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzv2h.c

-- 
2.34.1



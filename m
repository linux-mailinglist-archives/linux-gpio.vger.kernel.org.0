Return-Path: <linux-gpio+bounces-10226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482A97B3AD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 19:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D11A1F24818
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 17:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEAF18858E;
	Tue, 17 Sep 2024 17:38:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A40185E6E;
	Tue, 17 Sep 2024 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726594694; cv=none; b=XXEdLTOixrHRlj172d4nXSzV7Iap7JLdP8EvAzadH6ymPaRVXrw3ig/I05SzRrSzRBnqyG7MhhZtMmF9WxiXQYEpScYpXDB8L0pIosrz7lYmxIPNn3dne2x14F1m48l9jXv1S2ld+/DWNuG8j3dHPZdKnJ8SZPyA5G54yhMSNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726594694; c=relaxed/simple;
	bh=+rM0ld0Q3iZ12G+o9sup0LaePc8MDJ2kpjxmQ9OAK7k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fsgK2E6So7ctWY+Rjz68ke2l6o5YrpsI8e7fckAOvKUH9yIk2a7uw4UFZJv9EuEWAlY7t5R4wzPSRksb7FjsWVw0566yMCmqFVDkcTiC3FRtqCSXRAeOCPqO59adBP36K97n5PoceiQ7naJpKI5sTbFOnKBdZ2tu8gYlcAGLyGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.10,235,1719846000"; 
   d="scan'208";a="222945881"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Sep 2024 02:33:03 +0900
Received: from mulinux.example.org (unknown [10.226.92.130])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7776C4007F25;
	Wed, 18 Sep 2024 02:32:57 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 0/6] Add support for the RZ/V2H Interrupt Control Unit
Date: Tue, 17 Sep 2024 18:32:43 +0100
Message-Id: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
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

Thanks,
Fab

Fabrizio Castro (6):
  dt-bindings: pinctrl: renesas: rzg2l-pinctrl: Add interrupt-parent
  pinctrl: renesas: rzg2l: Remove RZG2L_TINT_IRQ_START_INDEX
  dt-bindings: interrupt-controller: Add Renesas RZ/V2H(P) Interrupt
    Controller
  clk: renesas: r9a09g057: Add clock and reset entries for ICU
  irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver
  arm64: dts: renesas: r9a09g057: Add ICU node

 .../renesas,rzv2h-icu.yaml                    | 278 ++++++++++
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   4 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  88 +++
 drivers/clk/renesas/r9a09g057-cpg.c           |   2 +
 drivers/irqchip/Kconfig                       |   7 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzv2h.c           | 517 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |   8 +-
 drivers/soc/renesas/Kconfig                   |   1 +
 .../interrupt-controller/icu-rzv2h.h          |  48 ++
 10 files changed, 952 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzv2h.c
 create mode 100644 include/dt-bindings/interrupt-controller/icu-rzv2h.h

-- 
2.34.1



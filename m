Return-Path: <linux-gpio+bounces-27285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A0DBEFCCF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACFDB4EF2A9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1695C2E265A;
	Mon, 20 Oct 2025 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JUV55o5d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32A2E8B98;
	Mon, 20 Oct 2025 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947646; cv=none; b=TdY3L1eoAnsDmswUM1casNNjLQS55Oryck/8ZdXmxamBxspHv+Lo6nE3B1HLs/dpeQEI8uZUt56aH2VOqOC2GsbivbK7k/XBDLHgw98iHgUURElY42TiXe87Wwfmav7kIP5uP/amEHpClIBCInBQX80gz1xy/sCx1pPTgF6gQZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947646; c=relaxed/simple;
	bh=Z8TrGDjtxuVKWBbMQe2yXke+3wWiA1grOPoJmL2bKxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yu4dF61diw6nlva3M9GNXfKN7rAoX+vdZZEiCcg0KMoPKxjjtrX0YZLSNCDYtc9UruJWJj9Jl7wq6I1VgCB+v39cArHhXQb6sGPKemtdMU5560y+p4Gr64hSTmwVm+aOHcEDwj6Jkc8r6gnGqRhjXeLT5snrhLpTrXykcaGW/Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JUV55o5d; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1CF9C4E411EE;
	Mon, 20 Oct 2025 08:07:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E50C1606D5;
	Mon, 20 Oct 2025 08:07:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A86A6102F239F;
	Mon, 20 Oct 2025 10:07:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760947632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=mZ2z2ab/AIMDP/gldx+0s2i1xu6QiHzpOt0ECf2bXLg=;
	b=JUV55o5dPcwC5mnECRLJdGWye2xTN7BaFN1dCQ+Q4HhcDn3HI7TtYuOHoagRqFi02/yEx7
	HSUGbdXrX/nO8OLAUi7wps8G2iT64S7awOnnCHwmISrQUOjzOgB6xoPxs9FPMUHy9ktBu8
	7pzTtfwfVF+wDXfk3SMa9AVG3+aho51TvcuVNNZT/Ge8AahEAkELXR4yZFE8qfGtyME/j/
	bVqFofDPBuFiX+oAvexmIGunpazO8hNta1QYzQpGusiZ+4jZhAiomk8iwdhhJ7uZHyWDFp
	ebT1ELvwS/a4EHRIfZkDRl89TeFyVehh8oMNYZRXkyeFEwhlrEZeGY4EUl2KWQ==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 0/8] gpio: renesas: Add support for GPIO and related interrupts in RZ/N1 SoC
Date: Mon, 20 Oct 2025 10:06:36 +0200
Message-ID: <20251020080648.13452-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series adds support for GPIO and GPIO IRQ mux available in the
RZ/N1 SoCs.

The first patches in this series are related to a new helper introduced
to parse an interrupt-map property.
  - patch 1: Introduce the helper (for_each_of_imap_item)
  - patch 2: Add a unittest for the new helper
  - patch 3 and 4: convert existing drivers to use this new helper

Patch 5 adds support for GPIO (device-tree description)

The last patches (6, 7 and 8) of the series are related to GPIO
interrupts and GPIO IRQ multiplexer.

In the RZ/N1 SoCs, GPIO interrupts are wired to a GPIO IRQ multiplexer.

This multiplexer does nothing but select 8 GPIO IRQ lines out of the 96
available to wire them to the GIC input lines.

One upstreaming attempt have been done previously by Phil Edworthy [1]
but the series has never been applied.

Based on my understanding, I have fully reworked the driver proposed by
Phil and removed the IRQ domain. Indeed, the device doesn't handle
interrupts. It just routes signals.

Also, as an interrupt-map property is used, the driver cannot be
involved as an interrupt controller itself. It is a nexus node.

With that in mind,
  - Patch 6 is related to the irq-mux binding.

  - Patch 7 introduces the irq-mux driver.
    This driver uses the 'for_each_of_imap_item' helper introduced
    previously. Indeed, the lines routing is defined by the
    interrupt-map property and the driver needs to set registers to
    apply this routing.

  - Patch 8 is the RZ/N1 device-tree description update to have the
    support for the GPIO interrupts.

[1] https://lore.kernel.org/all/20190219155511.28507-1-phil.edworthy@renesas.com/

Best regards,
Hervé

Changes v4 -> v5
  v4: https://lore.kernel.org/lkml/20250922152640.154092-1-herve.codina@bootlin.com/

  Rebase on top of v6.18-rc1

  Patches 1 to 3:
    No changes

  Patch 4:
    Fix conflict.
    Add 'Tested-by: Wolfram Sang'.

  Patch 5:
    Add 'Reviewed-by: Bartosz Golaszewski'.

  Patch 6:
    Add 'Reviewed-by: Wolfram Sang'.

  Patch 7:
    Add a missing 'const' qualifier.
    Remove an unneeded dev_err_probe() call.
    Add a check to avoid setting the same output line multiple times.

  Patch 8:
    Update comment
    Add 'Reviewed-by: Bartosz Golaszewski'

Changes v3 -> v4
  v3: https://lore.kernel.org/lkml/20250918104009.94754-1-herve.codina@bootlin.com/

  Patch 1:
    - Add 'Tested-by: Wolfram Sang'

  Patch 2..5:
    - No changes

  Patch 6:
    - Add minItems and maxItems
    - Update the 'interrup-map' description

  Patch 7:
    - Use rzn1_irqmux prefix instead of irqmux.
    - Introduce rzn1_irqmux_output_lines[] to give the mapping between
      the interrupt output line index and the GIC controller interrupt
      number.
    - Remove of_irq_count() call and related checks

  Patch 8:
    - Describe the irq mux node using a reduced (one item) interrupt-map
      property.

Changes v2 -> v3
  v2: https://lore.kernel.org/lkml/20250909120041.154459-1-herve.codina@bootlin.com/

  Reordered patches as suggested by Thomas Gleixner.

  Patch 1: (3 in v2)
    - Replace a wrong 'extern' by 'static inline' in of_irq.h  (detected
      by test robots)

  Patch 2: (4 in v2)
  Patch 3: (5 in v2)
  Patch 4: (6 in v2)
    - No changes

  Patch 5: (1 in v2)
    - Add 'Reviewed-by: Wolfram Sang'
    - Add 'Tested-by: Wolfram Sang'

  Patch 6: (2 in v2)
    - Add '#address-cells = <0>;' in the interrupt-controller node
      present in the example.

  Patch 7:
  Patch 8:
    - No changes

Changes v1 -> v2
  v1: https://lore.kernel.org/lkml/20250725152618.32886-1-herve.codina@bootlin.com/

  Rebase on top of v6.17-rc5

  Patch 1 in v1
    - Removed in v2 (no need for RZ/N1 compatible strings).

  Patch 1 (2 in v1)
    - Fix node names (issue reported by Rob's bot)
    - Fix compatible RZ/N1 compatible strings
    - Removed undocumented and unused 'bank-name' properties

  Patch 2 (3 in v1)
   - Remove 'interrupts' property
   - Update 'interrupt-map' description

  Patch 3 (4 in v1)
   - Rework of_irq_foreach_imap() to provide the for_each_of_imap_item
     iterator (similar to for_each_of_range)

  Patch 4 (new in v2)
   - Add a unittest for for_each_of_imap_item

  Patch 5 (new in v2)
   - Convert irqchip/ls-extirq to use for_each_of_imap_item

  Patch 6 (new in v2)
   - Convert irqchip/renesas-rza1 to use for_each_of_imap_item

  Patch 7 (5 in v1)
   - Use for_each_of_imap_item
   - Remove 'interrupts' property usage

  Patch 8 (6 in v1)
   - Remove 'interrupts' property

Herve Codina (Schneider Electric) (8):
  of/irq: Introduce for_each_of_imap_item
  of: unittest: Add a test case for for_each_of_imap_item iterator
  irqchip/ls-extirq: Use for_each_of_imap_item iterator
  irqchip/renesas-rza1: Use for_each_of_imap_item iterator
  ARM: dts: r9a06g032: Add GPIO controllers
  dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt
    Multiplexer
  soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
  ARM: dts: r9a06g032: Add support for GPIO interrupts

 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  |  87 ++++++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 162 ++++++++++++++++++
 drivers/irqchip/irq-ls-extirq.c               |  47 ++---
 drivers/irqchip/irq-renesas-rza1.c            |  43 ++---
 drivers/of/irq.c                              |  70 ++++++++
 .../of/unittest-data/tests-interrupts.dtsi    |   9 +
 drivers/of/unittest.c                         | 116 +++++++++++++
 drivers/soc/renesas/Kconfig                   |   4 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rzn1_irqmux.c             | 150 ++++++++++++++++
 include/linux/of_irq.h                        |  41 ++++-
 11 files changed, 672 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

-- 
2.51.0



Return-Path: <linux-gpio+bounces-25815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BACBFB4AD1E
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 14:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297E4346BCA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 12:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613AD32CF74;
	Tue,  9 Sep 2025 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e2CJhsNz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D75132C336;
	Tue,  9 Sep 2025 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419283; cv=none; b=i4HPftjSVKCGau02ASnYsmiUDiL7R68LeVRVDCV797uYcg1QHzj7QaBdCczAbsoXVl18nWuim3kljL9byyY5gMmBUJg8DSGC5xfQ+3AubtxBfx0ZFbEbhh00B63/CWh5dXJBVcXpU2vkAuUxL4mr4AhzCVCVtHHDoH/wdsO5tpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419283; c=relaxed/simple;
	bh=trPPrVp0MBpbv+/a5QKtQczXBiWNYPmQ4BKD78E4yL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sespjbBZbeJ/OR9v83uuA/DDayh9vOg+wk6pMYt4qJVmL6hmMSYUiuOtjqG9lCd6amhoKz4qHSW/rFTw/ASrRg9z1bft2eYIiOQDlzPsFE6XUlFZmroHmi4C1GF+hm/8J7mmFTOk5nmQs0BMe6DuJLRQYfx6zdEP8Hcej4GpGAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e2CJhsNz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F6C91A0E11;
	Tue,  9 Sep 2025 12:01:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B4A660630;
	Tue,  9 Sep 2025 12:01:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37599102F1D0F;
	Tue,  9 Sep 2025 14:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757419277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xEwiB1csNg7eu3rtOYHEcxWLHZ2E6O/7GAhuAFGH3Xk=;
	b=e2CJhsNzP3zLuVPu7pa4yxwXonDi+Di/Hj3VtpeyxyNukyUQbjCt06vbDLJ4ZsFiEHSRzh
	kT6p9vKw92DymRiTlvpuJD9kdh77V3acF/8Z/fl12k5xkrzo0b3heKB6ihNPgQ1ON4G3dh
	ACJf7A0Oh3v20m1e54HVxvTOTf/fUDLSJquLY64shLXMgCJsMYXhexPVmj/SYcL1ozQ9B2
	pDvGbT5e9DwRDF+JxFx/gnndiKGA3GAISTpuA2PaPd8Qwd/1vDmjcq4rWC3/DTBNac3joz
	kj+39YmOUEPTw7L9uT7VpM4Kp009MroYyJ5ZsUSWIGGDpc6iW/L13IrY4/fd5A==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH v2 0/8] gpio: renesas: Add support for GPIO and related interrupts in RZ/N1 SoC
Date: Tue,  9 Sep 2025 14:00:31 +0200
Message-ID: <20250909120041.154459-1-herve.codina@bootlin.com>
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

The first patch of the series add support for GPIO (device-tree
description).

Other patches are related to GPIO interrupts and GPIO IRQ multiplexer.

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

With that in mind, patch 2 is related to the binding, patch 3 introduces
an helper (for_each_of_imap_item) to parse the interrupt-map property.
This parsing is needed by the driver. Indeed, the lines routing is
defined by the interrupt-map property and the driver needs to set
registers to apply this routing.

Patch 4 adds a unittest for the new parsing helper. Patches 5 and 6
convert existing driver to use this helper.

The last two patches (patches 7 and 8) are the IRQ multiplexer driver
itself and the RZ/N1 device-tree description update to have the support
for the GPIO interrupts.

[1] https://lore.kernel.org/all/20190219155511.28507-1-phil.edworthy@renesas.com/

Best regards,
Hervé

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
  ARM: dts: r9a06g032: Add GPIO controllers
  dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt
    Multiplexer
  of/irq: Introduce for_each_of_imap_item
  of: unittest: Add a test case for for_each_of_imap_item iterator
  irqchip/ls-extirq: Use for_each_of_imap_item iterator
  irqchip/renesas-rza1: Use for_each_of_imap_item iterator
  soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
  ARM: dts: r9a06g032: Add support for GPIO interrupts

 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  |  86 +++++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 170 ++++++++++++++++++
 drivers/irqchip/irq-ls-extirq.c               |  47 ++---
 drivers/irqchip/irq-renesas-rza1.c            |  43 ++---
 drivers/of/irq.c                              |  70 ++++++++
 .../of/unittest-data/tests-interrupts.dtsi    |   9 +
 drivers/of/unittest.c                         | 116 ++++++++++++
 drivers/soc/renesas/Kconfig                   |   4 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rzn1_irqmux.c             | 110 ++++++++++++
 include/linux/of_irq.h                        |  41 ++++-
 11 files changed, 639 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

-- 
2.51.0



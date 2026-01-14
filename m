Return-Path: <linux-gpio+bounces-30518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91563D1DA5B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A759D303789C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 09:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FC7389452;
	Wed, 14 Jan 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Dr6X19Pm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B7635E544;
	Wed, 14 Jan 2026 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383640; cv=none; b=CmC9vuV+YD1SUyj4Sp0USmY2DnndELxYycmrVGsIFFUZtJlUWhOgtl1y7Fxkm8ZyjjvqmhgHAyJcyfGwFEBJCerV+RNr3Da2wpim+7stdmnKo608GHpCk9m5IGrr6ayAHWTBU/F8OAl3Y8kHl5kyc8oagTggjVlolRv8E53qjO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383640; c=relaxed/simple;
	bh=HHGswl8v8utssXScS0C1Q1e8yPAx6kp/n3FGPq1s9Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jrun30DlpEQczROcQ0y0E0kaBGrZ+WMSieFc4L6PC/XrvxHgKTwXNSVz0XiId8Er7Jy/AwprkdVPqD7nFH7FEKvyz15VIzcqn7n8F80Ghq8/q1he3fxnf55OQ1W/9qKfFQwGDDB8oLXo79HNF/UHSpFsE15K48BLmodLCDsSmKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Dr6X19Pm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD9971A2863;
	Wed, 14 Jan 2026 09:40:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F5F16074A;
	Wed, 14 Jan 2026 09:40:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 483C2103C80C0;
	Wed, 14 Jan 2026 10:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768383635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wNlTq5+sXEV5vuUlibQqX7wALBw1mFwogSXLZfKoJY4=;
	b=Dr6X19PmNYwCx+E/PYA3wm674g23DBUKN0cbMSWAeyhsQLUIDK0C2/SGwNhz0Y+VQUgNmc
	o5w+9ZVasr4zVw4qJUWSmYeiRPKB93tlbsbSYmGQsCp9KTtX9BAHPapj/L8fqtFDwwGT0i
	hX+WRq0Gpe97mzNLwVzYXCG9KubKd8qyAIYnHHbJlXo1jvoAHqKHCRLgOU1dPeWjP04H4P
	nYSh/6+YGULyUHTVizhbVJn3rWD3rUvMT6zJoxqs1EKXIXW5zIlBZaqd+ms4PNN+QHguX6
	8fUZmmV9SmeDOH5JXTHHmwO0EEz2YmTaC9cfIrkH+kRNtQ3DSsogj1VbWP9+7w==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v8 0/8] gpio: renesas: Add support for GPIO and related interrupts in RZ/N1 SoC
Date: Wed, 14 Jan 2026 10:39:29 +0100
Message-ID: <20260114093938.1089936-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
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

The series was already ready in its v7 iteration. This v8 iteration just
add the 'Tested-by' tag sent by Wolfram on v7.

Even if the series touches several subsystems, the whole series could be
merged through the renesas-devel tree as suggested in the v7 iteration
[2].

Rob, Thomas, this series is blocked waiting for your feedback and your
acks if you are okay.

[1] https://lore.kernel.org/all/20190219155511.28507-1-phil.edworthy@renesas.com/
[2] https://lore.kernel.org/all/aV6wcIE0D7ozKeQn@ninjato/

Best regards,
Hervé

Changes v7 -> v8
  v7: https://lore.kernel.org/all/20251215142836.167101-1-herve.codina@bootlin.com/

  Patches 1 to 7:
   - No changes

  Patch 8:
   - Add 'Tested-by: Wolfram Sang'.

Changes v6 -> v7
  v6: https://lore.kernel.org/all/20251027123601.77216-1-herve.codina@bootlin.com/

  Rebase on top of v6.19-rc1.

  Patches 1 to 4 :
   - Add 'Reviewed-by: Linus Walleij'.

  Patch 5:
   - Fix a typo (Synopsys) in commit log.
   - GPIO controllers enabled by default.
   - Move "reg" just below "compatible".
   - Add 'Reviewed-by: Linus Walleij'.
   - Add 'Reviewed-by: Geert Uytterhoeven'.

  Patch 6:
   - Add 'Reviewed-by: Linus Walleij'.
   - Add 'Reviewed-by: Geert Uytterhoeven'.

  Patch 7:
   - Enable RZN1_IRQMUX only if GPIO_DWAPB is enabled.
   - Move a 'if' condition to a single line.
   - Print the output line index in the 'already defined' error message.
   - Move rzn1_irqmux_setup() code directly into rzn1_irqmux_probe().
   - Add 'Reviewed-by: Linus Walleij'.
   - Add 'Tested-by: Wolfram Sang'.
   - Add 'Reviewed-by: Wolfram Sang'.
   - Add 'Reviewed-by: Geert Uytterhoeven'.

  Patch 8:
   - Remove unneeded spaces.
   - Add 'Reviewed-by: Linus Walleij'
   - Add 'Reviewed-by: Wolfram Sang'
   - Add 'Reviewed-by: Geert Uytterhoeven'

Changes v5 -> v6
  v5: https://lore.kernel.org/lkml/20251020080648.13452-1-herve.codina@bootlin.com/

  Patches 1 and 2:
    Add 'Reviewed-by: Rob Herring'

  Patches 3, and 5:
    No changes

  Patch 6:
    Add 'Reviewed-by: Rob Herring'

  Patch 7:
    Remove an unneeded TAB in Makefile.
    Use RZN1_IRQMUX_GIC_SPI_BASE and RZN1_IRQMUX_NUM_OUTPUTS to replace
    the irq/output mapping table.
    Use DECLARE_BITMAP().

  Patch 8:
    No changes

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
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 159 ++++++++++++++++++
 drivers/irqchip/irq-ls-extirq.c               |  47 ++----
 drivers/irqchip/irq-renesas-rza1.c            |  43 ++---
 drivers/of/irq.c                              |  70 ++++++++
 .../of/unittest-data/tests-interrupts.dtsi    |   9 +
 drivers/of/unittest.c                         | 116 +++++++++++++
 drivers/soc/renesas/Kconfig                   |   4 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rzn1_irqmux.c             | 127 ++++++++++++++
 include/linux/of_irq.h                        |  41 ++++-
 11 files changed, 646 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

-- 
2.52.0



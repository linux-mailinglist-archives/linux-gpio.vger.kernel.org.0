Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1D344CD36
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 23:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbhKJXBH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 18:01:07 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:15510 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233848AbhKJXBH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 18:01:07 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="100143735"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 07:58:18 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 019F24006CC7;
        Thu, 11 Nov 2021 07:58:14 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v3 0/7] Renesas RZ/G2L IRQC support
Date:   Wed, 10 Nov 2021 22:58:01 +0000
Message-Id: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

The RZ/G2L Interrupt Controller is a front-end for the GIC found on
Renesas RZ/G2L SoC's with below pins:
- IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts
- GPIO pins used as external interrupt input pins out of GPIOINT0-122 a
  maximum of only 32 can be mapped to 32 GIC SPI interrupts,
- NMI edge select.

                                                                _____________
                                                                |    GIC     |
                                                                |  ________  |
                                         ____________           | |        | |
NMI ------------------------------------>|          |  SPI0-479 | | GIC-600| |
                _______                  |          |------------>|        | |
                |      |                 |          |  PPI16-31 | |        | |
                |      | IRQ0-IRQ8       |   IRQC   |------------>|        | |
P0_P48_4 ------>| GPIO |---------------->|          |           | |________| |
                |      |GPIOINT0-122     |          |           |            |
                |      |---------------->| TINT0-31 |           |            |
                |______|                 |__________|           |____________|

The proposed RFC patches, add the IRQ domains in GPIO (pinctrl driver) and the
IRQC driver. The IRQC domain handles the actual SPI interrupt and upon reception
of the interrupt it propagates to the GPIO IRQ domain to handle virq.
Out of GPIOINT0-122 only 32 can be mapped to GIC SPI, this mapping is handled by
the IRQC driver.

Cheers,
Prabhakar

Changes for v3:
-> Re-structured the driver as a hierarchical irq domain instead of chained
-> made use of IRQCHIP_* macros
-> dropped locking
-> Added support for IRQ0-7 interrupts
-> Introduced 2 new patches for GPIOLIB
-> Switched to using GPIOLIB for irqdomains in pinctrl

RFC v2: https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
RFC v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Lad Prabhakar (7):
  dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt
    Controller
  irqchip: Add RZ/G2L IA55 Interrupt Controller driver
  soc: renesas: Enable IRQC driver for RZ/G2L
  gpio: gpiolib: Allow free() callback to be overridden
  gpio: gpiolib: Add ngirq member to struct gpio_irq_chip
  pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to handle GPIO
    interrupt
  arm64: dts: renesas: r9a07g044: Add IRQC node to SoC DTSI

 .../renesas,rzg2l-irqc.yaml                   | 137 ++++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  60 +++
 drivers/gpio/gpiolib.c                        |  13 +-
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzg2l.c           | 465 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 197 ++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 include/linux/gpio/driver.h                   |   8 +
 9 files changed, 885 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c

-- 
2.17.1


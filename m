Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E925E3DF41B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 19:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238382AbhHCRvg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 13:51:36 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:40647 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238316AbhHCRvg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 13:51:36 -0400
X-IronPort-AV: E=Sophos;i="5.84,292,1620658800"; 
   d="scan'208";a="89707983"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Aug 2021 02:51:23 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5C7FA40BF58E;
        Wed,  4 Aug 2021 02:51:21 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 0/4] Renesas RZ/G2L IRQC support
Date:   Tue,  3 Aug 2021 18:51:05 +0100
Message-Id: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

GPIO interrupts TINT0-T31 support rising/falling/high/low trigger, support for
both falling/rising edges is handled by the SW by toggling the RISING/FALLING
(we might loose interrupts, I have done limited testing for SD card detection
where interrupt is requested for both rising and falling edge).

Please share your valuable comments on the above implementation.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt
    Controller
  irqchip: Add RZ/G2L IA55 Interrupt Controller driver
  pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to handle GPIO
    interrupt
  arm64: dts: renesas: r9a07g044: Add IRQC node to SoC DTSI

 .../renesas,rzg2l-irqc.yaml                   | 129 ++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  58 ++
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzg2l.c           | 557 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 205 +++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 7 files changed, 959 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c

-- 
2.17.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA89452C384
	for <lists+linux-gpio@lfdr.de>; Wed, 18 May 2022 21:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241829AbiERT3s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 May 2022 15:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241821AbiERT3s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 May 2022 15:29:48 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA2805EDE6;
        Wed, 18 May 2022 12:29:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,235,1647270000"; 
   d="scan'208";a="121408998"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 May 2022 04:29:45 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CE7764004CF5;
        Thu, 19 May 2022 04:29:37 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/7] Renesas RZ/G2L IRQC support
Date:   Wed, 18 May 2022 20:29:17 +0100
Message-Id: <20220518192924.20948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

The RZ/G2L Interrupt Controller is a front-end for the GIC found on
Renesas RZ/G2L SoC's with below pins:
- IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI
  interrupts
- GPIO pins used as external interrupt input pins out of GPIOINT0-122 a
  maximum of only 32 can be mapped to 32 GIC SPI interrupts,
- NMI edge select.

                                                             _____________
                                                             |    GIC     |
                                                             |  ________  |
                                      ____________           | |        | |
NMI --------------------------------->|          |  SPI0-479 | | GIC-600| |
             _______                  |          |------------>|        | |
             |      |                 |          |  PPI16-31 | |        | |
             |      | IRQ0-IRQ7       |   IRQC   |------------>|        | |
P0_P48_4 --->| GPIO |---------------->|          |           | |________| |
             |      |GPIOINT0-122     |          |           |            |
             |      |---------------->| TINT0-31 |           |            |
             |______|                 |__________|           |____________|

The proposed patches add hierarchical IRQ domain, one in IRQC driver and
another in pinctrl driver. Upon interrupt requests map the interrupt to
GIC. Out of GPIOINT0-122 only 32 can be mapped to GIC SPI, this mapping is
handled by the pinctrl and IRQC driver.

Cheers,
Prabhakar

Changes for v3->v4:
* Updated description for interrupts-cells property in patch #1
* Dropped the patch which overriding free callback in gpiolib
* Used devm helpers in patch#2
* Patch #4, #5 and #6 are newly added
* In patch #7 dropped using gpio offset as hwirq
* Implemented immutable GPIO in patch #7
* Implemented child_offset_to_irq() callback in patch #7

Changes for v2->v3:
* Updated description for interrupts-cells property in patch #1
* Included RB tag from Geert for binding patch
* Fixed review comments pointed by Geert, Biju and Sergei.

Changes for v1->v2:
* Included RB tag from Rob
* Fixed review comments pointed by Geert
* included GPIO driver changes

Changes for RFCV4 -> V1:
* Used unevaluatedProperties.
* Altered the sequence of reg property
* Set the parent type
* Used raw_spin_lock() instead of raw_spin_lock_irqsave()
* Simplified parsing IRQ map.
* Will send the GPIO and pinctrl changes as part of separate series

Changes for RFC v4:
* Used locking while RMW
* Now using interrupts property instead of interrupt-map
* Patch series depends on [0]
* Updated binding doc
* Fixed comments pointed by Andy

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/
20220316200633.28974-1-prabhakar.mahadev-lad.rj@xxxxxxxxxxxxxx/

Changes for RFC v3:
-> Re-structured the driver as a hierarchical irq domain instead of chained
-> made use of IRQCHIP_* macros
-> dropped locking
-> Added support for IRQ0-7 interrupts
-> Introduced 2 new patches for GPIOLIB
-> Switched to using GPIOLIB for irqdomains in pinctrl

RFC v2: https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20210921193028.13099-1-prabhakar.mahadev-lad.rj@xxxxxxxxxxxxxx/

RFC v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20210803175109.1729-1-prabhakar.mahadev-lad.rj@xxxxxxxxxxxxxx/

Lad Prabhakar (7):
  dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt
    Controller
  irqchip: Add RZ/G2L IA55 Interrupt Controller driver
  gpio: gpiolib: Add ngirq member to struct gpio_irq_chip
  gpio: gpiolib: Dont assume child_offset_to_irq callback always
    succeeds
  gpio: gpiolib: Add a check to validate GPIO hwirq
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the properties
    to handle GPIO IRQ
  pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to handle GPIO
    interrupt

 .../renesas,rzg2l-irqc.yaml                   | 133 ++++++
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  16 +
 drivers/gpio/gpio-tegra186.c                  |  14 +-
 drivers/gpio/gpiolib.c                        |  38 +-
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzg2l.c           | 425 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   7 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       |   7 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c      |   7 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c       |   7 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 221 +++++++++
 include/linux/gpio/driver.h                   |  17 +-
 13 files changed, 880 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c

-- 
2.25.1


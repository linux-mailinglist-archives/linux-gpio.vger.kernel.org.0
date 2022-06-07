Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F174531C53
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 22:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241417AbiEWR67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 13:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243758AbiEWR5P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 13:57:15 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9CA57C03BB;
        Mon, 23 May 2022 10:43:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,246,1647270000"; 
   d="scan'208";a="121975201"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 May 2022 02:42:48 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 79987400E8FD;
        Tue, 24 May 2022 02:42:42 +0900 (JST)
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
Subject: [PATCH v5 0/5] Renesas RZ/G2L IRQC support
Date:   Mon, 23 May 2022 18:42:33 +0100
Message-Id: <20220523174238.28942-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Changes for v4->v5:
* Updated commit message for patch 3/5
* Dropped interrupt-parent from and included RB tag from Geert for patch 4/5
* Implemented init_valid_mask() callback
* Dropped ngirq patch from previous series
* Dropped patches 4/7 and 5/7 from previous patch series will handle it separately.

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

Lad Prabhakar (5):
  dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt
    Controller
  irqchip: Add RZ/G2L IA55 Interrupt Controller driver
  gpio: gpiolib: Allow free() callback to be overridden
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the properties
    to handle GPIO IRQ
  pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to handle GPIO
    interrupt

 .../renesas,rzg2l-irqc.yaml                   | 133 ++++++
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  15 +
 drivers/gpio/gpiolib.c                        |   9 +-
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzg2l.c           | 425 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 236 ++++++++++
 7 files changed, 824 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c

-- 
2.25.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E26EB58500C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jul 2022 14:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbiG2MY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jul 2022 08:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiG2MY6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jul 2022 08:24:58 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8223C61D84;
        Fri, 29 Jul 2022 05:24:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,201,1654527600"; 
   d="scan'208";a="127811483"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Jul 2022 21:24:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.113])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F29B8432833F;
        Fri, 29 Jul 2022 21:24:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add RZ/G2L POEG support
Date:   Fri, 29 Jul 2022 13:24:46 +0100
Message-Id: <20220729122448.498690-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The output pins of the general PWM timer (GPT) can be disabled by using the port
output enabling function for the GPT (POEG). Specifically, either of the
following ways can be used.

  * Input level detection of the GTETRGA to GTETRGD pins.
  * Output-disable request from the GPT.
  * Register setting(ie, by setting POEGGn.SSF to 1)

This patch series add support for controlling output disable function using sysfs.

For output disable operation, POEG group needs to be linked with GPT.
Plan to send a follow up patch with renesas,poeg-group as numeric
property in pwm bindings for linking both GPT and POEG devices.

v1->v2:
 * Updated binding description.
 * Renamed the file poeg-rzg2l->rzg2l-poeg
 * Removed the macro POEGG as there is only single register and
   updated rzg2l_poeg_write() and rzg2l_poeg_read()
 * Updated error handling in probe()
REF->v1:
 * Modelled as pincontrol as most of its configuration is intended to be
   static and moved driver files from soc to pincontrol directory.
 * Updated reg size in dt binding example.
 * Updated Kconfig

REF:
https://lore.kernel.org/linux-renesas-soc/20220510151112.16249-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: pinctrl: renesas: Add RZ/G2L POEG binding
  drivers: pinctrl: renesas: Add RZ/G2L POEG driver support

 .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  |  68 ++++++++
 drivers/pinctrl/renesas/Kconfig               |   2 +
 drivers/pinctrl/renesas/Makefile              |   2 +
 drivers/pinctrl/renesas/poeg/Kconfig          |  12 ++
 drivers/pinctrl/renesas/poeg/Makefile         |   2 +
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c     | 147 ++++++++++++++++++
 6 files changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
 create mode 100644 drivers/pinctrl/renesas/poeg/Kconfig
 create mode 100644 drivers/pinctrl/renesas/poeg/Makefile
 create mode 100644 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c

-- 
2.25.1


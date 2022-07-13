Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB63573810
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 15:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbiGMNzk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 09:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiGMNzj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 09:55:39 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D461E2CDF7;
        Wed, 13 Jul 2022 06:55:35 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,267,1650898800"; 
   d="scan'208";a="127722008"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jul 2022 22:55:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 044B743AFF62;
        Wed, 13 Jul 2022 22:55:30 +0900 (JST)
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
Subject: [PATCH 0/2] Add RZ/G2L POEG support
Date:   Wed, 13 Jul 2022 14:55:26 +0100
Message-Id: <20220713135528.1386594-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
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
  * Register settings.

This patch series add support for controlling output disable function using sysfs.

For output disable operation, POEG group needs to be linked with GPT.
Plan to send a follow up patch with renesas,poeg-group as numeric
property in pwm bindings for linking both GPT and POEG devices.


REF->v1:
 * Modelled as pincontrol as most of its configuration is intended to be
   static and moved driver files from soc to pincontrol directory.
 * Updated reg size in dt binding example.
 * Updated Kconfig

REF:
https://lore.kernel.org/linux-renesas-soc/20220510151112.16249-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: pinctrl: renesas: Add RZ/G2L POEG binding
  drivers: pinctrl: renesas: Add POEG driver support

 .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  |  65 ++++++++
 drivers/pinctrl/renesas/Kconfig               |   2 +
 drivers/pinctrl/renesas/Makefile              |   2 +
 drivers/pinctrl/renesas/poeg/Kconfig          |  12 ++
 drivers/pinctrl/renesas/poeg/Makefile         |   2 +
 drivers/pinctrl/renesas/poeg/poeg-rzg2l.c     | 147 ++++++++++++++++++
 6 files changed, 230 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
 create mode 100644 drivers/pinctrl/renesas/poeg/Kconfig
 create mode 100644 drivers/pinctrl/renesas/poeg/Makefile
 create mode 100644 drivers/pinctrl/renesas/poeg/poeg-rzg2l.c

-- 
2.25.1


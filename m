Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 097EE626235
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 20:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbiKKTlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 14:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234245AbiKKTlH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 14:41:07 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F92B7BE77;
        Fri, 11 Nov 2022 11:41:06 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,157,1665414000"; 
   d="scan'208";a="139760414"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Nov 2022 04:41:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.47])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E073340E8D2B;
        Sat, 12 Nov 2022 04:41:01 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/2] Add RZ/G2L POEG support
Date:   Fri, 11 Nov 2022 19:40:57 +0000
Message-Id: <20221111194059.718154-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

v3->v4:
 * Replaced companion->renesas,gpt for the phandle to gpt instance
 * Replaced renesas,id->renesas,poeg-id
 * Removed default from renesas,poeg-id as default for a required
   property doesn't make much sense.
 * Updated the example and required properties with above changes
v2->v3:
 * Removed Rb tag from Rob as there are some changes introduced.
 * Added companion property, so that poeg can link with gpt device
 * Documented renesas,id, as identifier for POEGG{A,B,C,D}.
 * Updated the binding example.
 * Added sysfs documentation for output_disable
 * PWM_RZG2L_GPT implies ARCH_RZG2L. So removed ARCH_RZG2L dependency
 * Used dev_get_drvdata to get device data
 * Replaced sprintf->sysfs_emit in show().
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

 .../ABI/testing/sysfs-platform-rzg2l-poeg     |  18 ++
 .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  |  86 ++++++++++
 drivers/pinctrl/renesas/Kconfig               |   2 +
 drivers/pinctrl/renesas/Makefile              |   2 +
 drivers/pinctrl/renesas/poeg/Kconfig          |  11 ++
 drivers/pinctrl/renesas/poeg/Makefile         |   2 +
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c     | 157 ++++++++++++++++++
 7 files changed, 278 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-rzg2l-poeg
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
 create mode 100644 drivers/pinctrl/renesas/poeg/Kconfig
 create mode 100644 drivers/pinctrl/renesas/poeg/Makefile
 create mode 100644 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c

-- 
2.25.1


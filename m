Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC74B64E31D
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 22:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiLOVcP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 16:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiLOVcO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 16:32:14 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0C90D1C437;
        Thu, 15 Dec 2022 13:32:12 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,248,1665414000"; 
   d="scan'208";a="143493754"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Dec 2022 06:32:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4717C40071FC;
        Fri, 16 Dec 2022 06:32:08 +0900 (JST)
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
Subject: [PATCH v5 0/9] Add RZ/G2L POEG support
Date:   Thu, 15 Dec 2022 21:31:57 +0000
Message-Id: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
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

Patch #3 to patch #9 are new and just for testing only(GPT Output-disable
request to POEG)

When dead time error occurs or the GTIOCA pin output value is
the same as the GTIOCB pin output value, output protection is
required. GPT detects this condition and generates output disable
requests to POEG based on the settings in the output disable request
permission bits, such as GTINTAD.GRPDTE, GTINTAD.GRPABH,
GTINTAD.GRPABL. After the POEG receives output disable requests from
each channel and calculates external input using an OR operation, the
POEG generates output disable requests to GPT.

POEG handles output disable request and send an event to userspace.
Userspace clears the fault condition and request poeg to cancel
the output disable request.

Logs:
root@smarc-rzg2l:~# /poeg_app &
[1] 182
root@smarc-rzg2l:~# [POEG]open

root@smarc-rzg2l:~# /poeg.sh
16
pwmchip0
Test case 1 user POEG control
 72:          0          0     GICv3 354 Level     10048800.poeg
 73:          0          0     GICv3 355 Level     10048c00.poeg
 74:          0          0     GICv3 356 Level     10049000.poeg
 76:          0          0     GICv3 357 Level     10049400.poeg
Read at address  0x10048434 (0xffff8d92b434): 0x0200031B
Read at address  0x10048438 (0xffff9884e438): 0x03000000
Read at address  0x10049400 (0xffffbd7b9400): 0x00000030
Test case 2 user GPT control both high
Read at address  0x10048434 (0xffff96dcf434): 0x021B031B
Read at address  0x10048438 (0xffff9ddfc438): 0x23000000
Read at address  0x10049400 (0xffff9a206400): 0x00000030
gpt ch:3, irq=2
gpt ch:3, irq=2
Read at address  0x10048434 (0xffff97fb2434): 0x021B031B
Read at address  0x10048438 (0xffff817a1438): 0x03000000
Read at address  0x10049400 (0xffffb8f5e400): 0x00000030
gpt ch:3, irq=2
 72:          0          0     GICv3 354 Level     10048800.poeg
 73:          0          0     GICv3 355 Level     10048c00.poeg
 74:          0          0     GICv3 356 Level     10049000.poeg
 76:          6          0     GICv3 357 Level     10049400.poeg
Test case 3 user GPT control both low
Read at address  0x10048434 (0xffff897d8434): 0x031B031B
Read at address  0x10048438 (0xffffa981a438): 0x43000000
Read at address  0x10049400 (0xffff90eba400): 0x00000030
gpt ch:3, irq=4
gpt ch:3, irq=4
Read at address  0x10048434 (0xffff959d7434): 0x021B031B
Read at address  0x10048438 (0xffff92b6d438): 0x03000000
Read at address  0x10049400 (0xffffb60b3400): 0x00000030
gpt ch:3, irq=4
 72:          0          0     GICv3 354 Level     10048800.poeg
 73:          0          0     GICv3 355 Level     10048c00.poeg
 74:          0          0     GICv3 356 Level     10049000.poeg
 76:         12          0     GICv3 357 Level     10049400.poeg
root@smarc-rzg2l:~#

v4->v5:
 * Added Rb tag from Rob.
 * Updated kernel version in sysfs doc.
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


Biju Das (9):
  dt-bindings: pinctrl: renesas: Add RZ/G2L POEG binding
  drivers: pinctrl: renesas: Add RZ/G2L POEG driver support
  pwm: rzg2l-gpt: Add support for output disable request from gpt
  pinctrl: renesas: rzg2l-poeg: Add support for GPT Output-Disable
    Request
  pwm: rzg2l-gpt: Add support for output disable when both output low
  pinctrl: renesas: rzg2l-poeg: output-disable request from GPT when
    both outputs are low.
  pwm: rzg2l-gpt: Add support for output disable on dead time error
  pinctrl: renesas: rzg2l-poeg: output-disable request from GPT on dead
    time error
  tools/poeg: Add test app for poeg

 .../ABI/testing/sysfs-platform-rzg2l-poeg     |  87 ++++
 .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  |  86 ++++
 drivers/pinctrl/renesas/Kconfig               |   2 +
 drivers/pinctrl/renesas/Makefile              |   2 +
 drivers/pinctrl/renesas/poeg/Kconfig          |  11 +
 drivers/pinctrl/renesas/poeg/Makefile         |   2 +
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c     | 476 ++++++++++++++++++
 drivers/pwm/pwm-rzg2l-gpt.c                   | 129 +++++
 include/linux/soc/renesas/rzg2l-gpt.h         |  44 ++
 include/linux/soc/renesas/rzg2l-poeg.h        |  16 +
 tools/poeg/Build                              |   1 +
 tools/poeg/Makefile                           |  53 ++
 tools/poeg/poeg_app.c                         |  60 +++
 13 files changed, 969 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-rzg2l-poeg
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
 create mode 100644 drivers/pinctrl/renesas/poeg/Kconfig
 create mode 100644 drivers/pinctrl/renesas/poeg/Makefile
 create mode 100644 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
 create mode 100644 include/linux/soc/renesas/rzg2l-gpt.h
 create mode 100644 include/linux/soc/renesas/rzg2l-poeg.h
 create mode 100644 tools/poeg/Build
 create mode 100644 tools/poeg/Makefile
 create mode 100644 tools/poeg/poeg_app.c

-- 
2.25.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC6B6CBC29
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 12:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbjC1KLI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 06:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbjC1KKz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 06:10:55 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BFC707EF3;
        Tue, 28 Mar 2023 03:10:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,297,1673881200"; 
   d="scan'208";a="154048930"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Mar 2023 19:10:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C602040071EC;
        Tue, 28 Mar 2023 19:10:13 +0900 (JST)
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
Subject: [PATCH v7 00/10] Add RZ/G2L POEG support
Date:   Tue, 28 Mar 2023 11:10:01 +0100
Message-Id: <20230328101011.185594-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.5 required=5.0 tests=AC_FROM_MANY_DOTS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The output pins of the general PWM timer (GPT) can be disabled by using
the port output enabling function for the GPT (POEG). Specifically, either
of the following ways can be used.

  * Input level detection of the GTETRGA to GTETRGD pins.
  * Output-disable request from the GPT.
  * Register setting(ie, by setting POEGGn.SSF to 1)

This patch series adds support for configuring output disable function using
DT and  handling of user control and events are handled by char device.

Patch #3 to patch #10 are just for testing only.

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

REF:
https://lore.kernel.org/linux-renesas-soc/20220510151112.16249-1-biju.das.jz@bp.renesas.com/
https://lore.kernel.org/linux-renesas-soc/20230306090014.128732-1-biju.das.jz@bp.renesas.com/T/#t

logs:
 root@smarc-rzg2l:~# /poeg.sh
Test case 1 user POEG control with renesas,poeg-config = <1>;
[POEG]open
[POEG] user control pin output disable enabled
Read at address  0x10048434 (0xffff97de1434): 0x031B031B
Read at address  0x10048438 (0xffff8353f438): 0x03000000
Read at address  0x10049400 (0xffff99960400): 0x00000008
[POEG] user control pin output disable disabled
[POEG]close
 73:          0          0     GICv3 357 Level     10049400.poeg
Read at address  0x10048434 (0xffffb8252434): 0x031B031B
Read at address  0x10048438 (0xffffbb61a438): 0x03000000
Read at address  0x10049400 (0xffff88783400): 0x00000000
root@smarc-rzg2l:~#

      
root@smarc-rzg2l:~# /poeg.sh
Test case 2 GPT control with renesas,poeg-config = <2>;
[POEG]open
[POEG] GPT control configure IRQ
Read at address  0x10048434 (0xffffa60a2434): 0x031B031B
Read at address  0x10048438 (0xffffa8c2c438): 0x23000000
Read at address  0x10049400 (0xffffbc09f400): 0x00000020
gpt ch:3, irq=2
gpt ch:3, irq=2
gpt ch:3, irq=2
gpt ch:3, irq=2
Read at address  0x10048434 (0xffff82111434): 0x021B031B
Read at address  0x10048438 (0xffff9abfa438): 0x23000000
Read at address  0x10049400 (0xffff872ea400): 0x00000020
 73:          5          0     GICv3 357 Level     10049400.poeg
root@smarc-rzg2l:~# gpt ch:3, irq=2

root@smarc-rzg2l:~# /poeg.sh
Test case 2 GPT control with renesas,poeg-config = <4>;
[POEG]open
[POEG] GPT control configure IRQ
Read at address  0x10048434 (0xffff9bbea434): 0x031B031B
Read at address  0x10048438 (0xffffa33fd438): 0x43000000
Read at address  0x10049400 (0xffffa4bdc400): 0x00000020
gpt ch:3, irq=4
gpt ch:3, irq=4
gpt ch:3, irq=4
gpt ch:3, irq=4
Read at address  0x10048434 (0xffff8e05e434): 0x021B031B
Read at address  0x10048438 (0xffffbc765438): 0x43000000
Read at address  0x10049400 (0xffffa1ed1400): 0x00000020
 73:          5          0     GICv3 357 Level     10049400.poeg
root@smarc-rzg2l:~# gpt ch:3, irq=4

v6->v7:
 * Documented renesas,poeg-config optional property for configuring the
   system for pin output disable.
 * Used DT to handle the system configuration
 * Added poeg char device for user control support to enable/disable
   output from GPT
 * Replaced iowrite32/ioread32-> writel/readl
 * Dropped of_match_ptr from .of_match_table
v5->v6:
 * Dropped binding patch as it is accepted for 6.4.
 * Added sysfs support for configuring pin output disable 
   function in a generic way.
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


Biju Das (10):
  dt-bindings: pinctrl: rzg2l-poeg: Document renesas,poeg-config
    property
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
  pinctrl: renesas: rzg2l-poeg: output-disable request by external pin
  tools/poeg: Add test app for poeg

 .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  |  16 +
 drivers/pinctrl/renesas/Kconfig               |   2 +
 drivers/pinctrl/renesas/Makefile              |   2 +
 drivers/pinctrl/renesas/poeg/Kconfig          |  11 +
 drivers/pinctrl/renesas/poeg/Makefile         |   2 +
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c     | 500 ++++++++++++++++++
 drivers/pwm/pwm-rzg2l-gpt.c                   | 129 +++++
 include/linux/pinctrl/rzg2l-poeg.h            |  28 +
 include/linux/pwm/rzg2l-gpt.h                 |  44 ++
 tools/poeg/Build                              |   1 +
 tools/poeg/Makefile                           |  53 ++
 tools/poeg/poeg_app.c                         | 102 ++++
 12 files changed, 890 insertions(+)
 create mode 100644 drivers/pinctrl/renesas/poeg/Kconfig
 create mode 100644 drivers/pinctrl/renesas/poeg/Makefile
 create mode 100644 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
 create mode 100644 include/linux/pinctrl/rzg2l-poeg.h
 create mode 100644 include/linux/pwm/rzg2l-gpt.h
 create mode 100644 tools/poeg/Build
 create mode 100644 tools/poeg/Makefile
 create mode 100644 tools/poeg/poeg_app.c

-- 
2.25.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 708356AB907
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCFJAc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:00:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjCFJA3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:00:29 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 92E4B10AB5;
        Mon,  6 Mar 2023 01:00:25 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.98,236,1673881200"; 
   d="scan'208";a="154992500"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2023 18:00:24 +0900
Received: from localhost.localdomain (unknown [10.226.93.39])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AF00341C704C;
        Mon,  6 Mar 2023 18:00:20 +0900 (JST)
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
Subject: [PATCH v6 00/13] Add pinctrl sysfs and RZ/G2L POEG support
Date:   Mon,  6 Mar 2023 09:00:01 +0000
Message-Id: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
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

This patch series adds support for controlling output disable function using
sysfs in a generic way as described below.

|    A     |    |     B      |    |     C     |    |     D        |  | E |
|user space|--->|pinctrl core|<-->|SoC pinctrl|<-->|Output disable|--|PWM|
|          |    |            |    |           |    |              |  |   |

A executes command to configure a pin group for pin output disable operation
  echo "fname gname conf conf_val" > configure

B parses the command and identifies the binding device associated with that
  pin group

C matches the binding device against the device registered by D for
  configuration operation

D matches the pin group and configure the pins for Output disable operation

Both D and E are linked together by dt(i.e. PWM channel linked with Output
 disable Port)

eg: echo "gpt4-pins gpt4-pins 0 1" > configure ,will activate output 
    disable by the user.

As part of this added a simple sysfs interface to the generic pinctrl
framework.

  /sys/class/pinctrl/
  `-- output-disable/
      |-- configure         (w/o) ask the kernel to configure a pin group
				  for output disable operation.

Patch #1 to #5 crate a framework for registering pin output disable
device to pincontroller.

Patch #7 to patch #13 are just for testing only(GPT Output-disable
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
root@smarc-rzg2l:~# /poeg-generic.sh
[POEG]open
16
pwmchip0
Test case 1 user POEG control
 74:          0          0     GICv3 357 Level     10049400.poeg
Read at address  0x10048434 (0xffffb00b0434): 0x0200031B
Read at address  0x10048438 (0xffff911ef438): 0x03000000
Read at address  0x10049400 (0xffffa8dff400): 0x00000030
Test case 2 user GPT control both high
Read at address  0x10048434 (0xffff8537e434): 0x021B031B
Read at address  0x10048438 (0xffffbb73c438): 0x23000000
Read at address  0x10049400 (0xffffa5742400): 0x00000030
gpt ch:3, irq=2
gpt ch:3, irq=2
Read at address  0x10048434 (0xffffb0193434): 0x021B031B
Read at address  0x10048438 (0xffffae0b4438): 0x03000000
Read at address  0x10049400 (0xffff873f5400): 0x00000030
gpt ch:3, irq=2
 74:          6          0     GICv3 357 Level     10049400.poeg
Test case 3 user GPT control both low
Read at address  0x10048434 (0xffffbadb1434): 0x021B031B
Read at address  0x10048438 (0xffff88720438): 0x43000000
Read at address  0x10049400 (0xffff9d7a9400): 0x00000030
gpt ch:3, irq=4
gpt ch:3, irq=4
Read at address  0x10048434 (0xffff95d68434): 0x021B031B
Read at address  0x10048438 (0xffff82428438): 0x03000000
Read at address  0x10049400 (0xffff92716400): 0x00000030
gpt ch:3, irq=4
 74:         12          0     GICv3 357 Level     10049400.poeg
root@smarc-rzg2l:~#

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

REF:
https://lore.kernel.org/linux-renesas-soc/20220510151112.16249-1-biju.das.jz@bp.renesas.com/

Biju Das (13):
  pinctrl: core: Add pinctrl_get_device()
  pinctrl: Add poutdisops variable to struct pinctrl_desc
  pinctrl: Add sysfs support
  pinctrl: renesas: rzg2l: Add pin output disable support
  soc: renesas: Kconfig: Enable pin output disable for RZ/G2L SoC
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

 Documentation/ABI/testing/sysfs-class-pinctrl |  32 ++
 drivers/pinctrl/Kconfig                       |   4 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/core.c                        |  52 ++
 drivers/pinctrl/output-disable.c              | 148 ++++++
 drivers/pinctrl/output-disable.h              |  32 ++
 drivers/pinctrl/renesas/Kconfig               |   2 +
 drivers/pinctrl/renesas/Makefile              |   2 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  44 ++
 drivers/pinctrl/renesas/poeg/Kconfig          |  11 +
 drivers/pinctrl/renesas/poeg/Makefile         |   2 +
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c     | 486 ++++++++++++++++++
 drivers/pwm/pwm-rzg2l-gpt.c                   | 129 +++++
 drivers/soc/renesas/Kconfig                   |   1 +
 include/linux/pinctrl/consumer.h              |   9 +
 include/linux/pinctrl/output-disable.h        |  42 ++
 include/linux/pinctrl/pinctrl-rzg2l.h         |  35 ++
 include/linux/pinctrl/pinctrl.h               |   4 +
 include/linux/pwm/rzg2l-gpt.h                 |  44 ++
 tools/poeg/Build                              |   1 +
 tools/poeg/Makefile                           |  53 ++
 tools/poeg/poeg_app.c                         |  60 +++
 22 files changed, 1194 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-pinctrl
 create mode 100644 drivers/pinctrl/output-disable.c
 create mode 100644 drivers/pinctrl/output-disable.h
 create mode 100644 drivers/pinctrl/renesas/poeg/Kconfig
 create mode 100644 drivers/pinctrl/renesas/poeg/Makefile
 create mode 100644 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
 create mode 100644 include/linux/pinctrl/output-disable.h
 create mode 100644 include/linux/pinctrl/pinctrl-rzg2l.h
 create mode 100644 include/linux/pwm/rzg2l-gpt.h
 create mode 100644 tools/poeg/Build
 create mode 100644 tools/poeg/Makefile
 create mode 100644 tools/poeg/poeg_app.c

-- 
2.25.1


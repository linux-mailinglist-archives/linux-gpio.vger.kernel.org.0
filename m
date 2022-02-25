Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEB3F4C46CB
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 14:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbiBYNmO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 08:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240038AbiBYNmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 08:42:13 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C6C13FBD
        for <linux-gpio@vger.kernel.org>; Fri, 25 Feb 2022 05:41:38 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7d31:13ed:51c6:c7cc])
        by michel.telenet-ops.be with bizsmtp
        id zRhd2600A0mlTBr06RhdYG; Fri, 25 Feb 2022 14:41:37 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNaqm-00224v-Oz; Fri, 25 Feb 2022 14:41:36 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNaqm-00E3G9-Ar; Fri, 25 Feb 2022 14:41:36 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.18 (take two)
Date:   Fri, 25 Feb 2022 14:41:35 +0100
Message-Id: <cover.1645796337.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 2e08ab0427fe3e33a92a37cfe3b6db340ab7397f:

  pinctrl: renesas: rzg2l: Improve rzg2l_gpio_register() (2022-02-08 09:54:44 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.18-tag2

for you to fetch changes up to babe298e9caaa3d723f9721647eeac22309941d8:

  pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions (2022-02-25 13:45:49 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.18 (take two)

  - Share more pin group data, to reduce kernel size and ease review,
  - Improve the pin control table validator,
  - Add support for the new R-Car S4-8 SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (84):
      pinctrl: renesas: r8a7794: Add range checking to .pin_to_pocctrl()
      pinctrl: renesas: r8a77470: Reduce size for narrow VIN1 channel
      pinctrl: renesas: Rename sh_pfc_soc_operations instances
      pinctrl: renesas: Reformat macros defining struct initializers
      pinctrl: renesas: Rename SH_PFC_PIN_GROUP{,_ALIAS} args
      pinctrl: renesas: Add generic support for pin group subsets
      pinctrl: renesas: Add generic support for resizable buses
      pinctrl: renesas: r8a7740: Share BSC pin group data
      pinctrl: renesas: emev2: Share CF pin group data
      pinctrl: renesas: r8a7791: Share HSCIF1 pin group data
      pinctrl: renesas: sh73a0: Share KEYIN pin group data
      pinctrl: renesas: r8a7740: Share LCD pin group data
      pinctrl: renesas: sh73a0: Share LCD pin group data
      pinctrl: renesas: r8a73a4: Share MMC pin group data
      pinctrl: renesas: r8a7740: Share MMC pin group data
      pinctrl: renesas: r8a77470: Share MMC pin group data
      pinctrl: renesas: r8a7778: Share MMC pin group data
      pinctrl: renesas: r8a7779: Share MMC pin group data
      pinctrl: renesas: r8a7790: Share MMC pin group data
      pinctrl: renesas: r8a7791: Share MMC pin group data
      pinctrl: renesas: r8a7794: Share MMC pin group data
      pinctrl: renesas: r8a77970: Share MMC pin group data
      pinctrl: renesas: r8a77980: Share MMC pin group data
      pinctrl: renesas: r8a77995: Share MMC pin group data
      pinctrl: renesas: r8a779a0: Share MMC pin group data
      pinctrl: renesas: sh73a0: Share MMC pin group data
      pinctrl: renesas: r8a77470: Share QSPI pin group data
      pinctrl: renesas: r8a7790: Share QSPI pin group data
      pinctrl: renesas: r8a7791: Share QSPI pin group data
      pinctrl: renesas: r8a7792: Share QSPI pin group data
      pinctrl: renesas: r8a7794: Share QSPI pin group data
      pinctrl: renesas: r8a77950: Share QSPI pin group data
      pinctrl: renesas: r8a77951: Share QSPI pin group data
      pinctrl: renesas: r8a77965: Share QSPI pin group data
      pinctrl: renesas: r8a7796: Share QSPI pin group data
      pinctrl: renesas: r8a77990: Share QSPI pin group data
      pinctrl: renesas: r8a779a0: Share QSPI pin group data
      pinctrl: renesas: r8a77970: Share RPC pin group data
      pinctrl: renesas: r8a77980: Share RPC pin group data
      pinctrl: renesas: r8a73a4: Share SDHI pin group data
      pinctrl: renesas: r8a7740: Share SDHI pin group data
      pinctrl: renesas: r8a77470: Share SDHI pin group data
      pinctrl: renesas: r8a7778: Share SDHI pin group data
      pinctrl: renesas: r8a7779: Share SDHI pin group data
      pinctrl: renesas: r8a7790: Share SDHI pin group data
      pinctrl: renesas: r8a7791: Share SDHI pin group data
      pinctrl: renesas: r8a7792: Share SDHI pin group data
      pinctrl: renesas: r8a7794: Share SDHI pin group data
      pinctrl: renesas: r8a77950: Share SDHI pin group data
      pinctrl: renesas: r8a77951: Share SDHI pin group data
      pinctrl: renesas: r8a77965: Share SDHI pin group data
      pinctrl: renesas: r8a7796: Share SDHI pin group data
      pinctrl: renesas: r8a77990: Share SDHI pin group data
      pinctrl: renesas: sh73a0: Share SDHI pin group data
      pinctrl: renesas: emev2: Share SDI pin group data
      pinctrl: renesas: r8a7790: Share USB1 pin group data
      pinctrl: renesas: r8a7790: Share more VIN pin group data
      pinctrl: renesas: r8a77951: Share more VIN pin group data
      pinctrl: renesas: r8a7796: Share more VIN pin group data
      pinctrl: renesas: r8a77965: Share more VIN pin group data
      pinctrl: renesas: r8a77990: Share more VIN pin group data
      pinctrl: renesas: Remove unused pfc parameter from .pin_to_pocctrl()
      pinctrl: renesas: Factor out .pin_to_portcr() address handling
      pinctrl: renesas: Pass sh_pfc_soc_info to rcar_pin_to_bias_reg()
      pinctrl: renesas: checker: Simplify same_name()
      pinctrl: renesas: checker: Add pin group sharing checks
      pinctrl: renesas: checker: Validate bias configs consistency
      pinctrl: renesas: checker: Validate drive strength configs consistency
      pinctrl: renesas: checker: Validate I/O voltage configs consistency
      pinctrl: renesas: checker: Check bias pin conflicts
      pinctrl: renesas: checker: Check drive pin conflicts
      pinctrl: renesas: checker: Fix miscalculation of number of states
      pinctrl: renesas: Remove unneeded #include <linux/gpio.h>
      pinctrl: renesas: Add PORT_GP_CFG_19 macros
      pinctrl: renesas: Initial R8A779F0 PFC support
      pinctrl: renesas: r8a779f0: Add SCIF pins, groups, and functions
      pinctrl: renesas: r8a779f0: Add I2C pins, groups, and functions
      pinctrl: renesas: r8a779f0: Add HSCIF pins, groups, and functions
      pinctrl: renesas: r8a779f0: Add INTC-EX pins, groups, and function
      pinctrl: renesas: r8a779f0: Add MMC pins, groups, and function
      pinctrl: renesas: r8a779f0: Add MSIOF pins, groups, and functions
      pinctrl: renesas: r8a779f0: Add PCIe pins, groups, and function
      pinctrl: renesas: r8a779f0: Add QSPI pins, groups, and functions
      pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions

LUU HOAI (1):
      dt-bindings: pinctrl: renesas,pfc: Document r8a779f0 support

 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   |    1 +
 drivers/pinctrl/renesas/Kconfig                    |    5 +
 drivers/pinctrl/renesas/Makefile                   |    1 +
 drivers/pinctrl/renesas/core.c                     |  219 +-
 drivers/pinctrl/renesas/pfc-emev2.c                |   71 +-
 drivers/pinctrl/renesas/pfc-r8a73a4.c              |   97 +-
 drivers/pinctrl/renesas/pfc-r8a7740.c              |  282 +--
 drivers/pinctrl/renesas/pfc-r8a77470.c             |  240 +--
 drivers/pinctrl/renesas/pfc-r8a7778.c              |   69 +-
 drivers/pinctrl/renesas/pfc-r8a7779.c              |  110 +-
 drivers/pinctrl/renesas/pfc-r8a7790.c              |  485 ++---
 drivers/pinctrl/renesas/pfc-r8a7791.c              |  287 +--
 drivers/pinctrl/renesas/pfc-r8a7792.c              |  446 ++--
 drivers/pinctrl/renesas/pfc-r8a7794.c              |  214 +-
 drivers/pinctrl/renesas/pfc-r8a77950.c             |  119 +-
 drivers/pinctrl/renesas/pfc-r8a77951.c             |  313 +--
 drivers/pinctrl/renesas/pfc-r8a7796.c              |  315 +--
 drivers/pinctrl/renesas/pfc-r8a77965.c             |  333 +--
 drivers/pinctrl/renesas/pfc-r8a77970.c             |  165 +-
 drivers/pinctrl/renesas/pfc-r8a77980.c             |  193 +-
 drivers/pinctrl/renesas/pfc-r8a77990.c             |  311 +--
 drivers/pinctrl/renesas/pfc-r8a77995.c             |  102 +-
 drivers/pinctrl/renesas/pfc-r8a779a0.c             |   63 +-
 drivers/pinctrl/renesas/pfc-r8a779f0.c             | 2126 ++++++++++++++++++++
 drivers/pinctrl/renesas/pfc-sh7203.c               |    1 -
 drivers/pinctrl/renesas/pfc-sh7264.c               |    1 -
 drivers/pinctrl/renesas/pfc-sh7269.c               |    1 -
 drivers/pinctrl/renesas/pfc-sh73a0.c               |  269 +--
 drivers/pinctrl/renesas/pfc-sh7720.c               |    1 -
 drivers/pinctrl/renesas/pfc-sh7722.c               |    1 -
 drivers/pinctrl/renesas/pinctrl.c                  |   24 +-
 drivers/pinctrl/renesas/sh_pfc.h                   |  176 +-
 32 files changed, 3915 insertions(+), 3126 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779f0.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

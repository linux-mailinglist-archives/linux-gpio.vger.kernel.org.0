Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE2D96C9EDA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 11:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjC0JEr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 05:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232457AbjC0JEF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 05:04:05 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074054EC7
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 02:03:09 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by albert.telenet-ops.be with bizsmtp
        id dM38290061C8whw06M38lL; Mon, 27 Mar 2023 11:03:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgikC-00ExaS-FJ;
        Mon, 27 Mar 2023 11:03:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgiku-002sdq-0D;
        Mon, 27 Mar 2023 11:03:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.4
Date:   Mon, 27 Mar 2023 11:03:07 +0200
Message-Id: <cover.1679907618.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.4-tag1

for you to fetch changes up to 9d7558ed8372c51cbed011cb1dc3eb1beee212cf:

  pinctrl: renesas: Drop support for Renesas-specific properties (2023-03-16 16:55:27 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.4

  - Add pin groups for audio on R-Car V4H,
  - Drop support for the obsolete R-Car H3 ES1.* (R8A77950) SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (4):
      pinctrl: renesas: r8a779g0: Fix Group 4/5 pin functions
      pinctrl: renesas: r8a779g0: Fix Group 6/7 pin functions
      pinctrl: renesas: r8a779g0: Fix ERROROUTC function names
      pinctrl: renesas: Drop support for Renesas-specific properties

Hai Pham (1):
      pinctrl: renesas: r8a779a0: Remove incorrect AVB[01] pinmux configuration

Linh Phung (2):
      pinctrl: renesas: r8a779g0: Add Audio Clock pins, groups, and functions
      pinctrl: renesas: r8a779g0: Add Audio SSI pins, groups, and functions

Phong Hoang (1):
      pinctrl: renesas: r8a779f0: Fix tsn1_avtp_pps pin group

Wolfram Sang (1):
      pinctrl: renesas: Remove R-Car H3 ES1.* handling

 drivers/pinctrl/renesas/Kconfig        |    5 -
 drivers/pinctrl/renesas/Makefile       |    1 -
 drivers/pinctrl/renesas/core.c         |   41 +-
 drivers/pinctrl/renesas/pfc-r8a77950.c | 5947 --------------------------------
 drivers/pinctrl/renesas/pfc-r8a779a0.c |    8 -
 drivers/pinctrl/renesas/pfc-r8a779f0.c |    2 +-
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 1042 +++---
 drivers/pinctrl/renesas/pinctrl.c      |   31 +-
 drivers/pinctrl/renesas/sh_pfc.h       |    1 -
 9 files changed, 565 insertions(+), 6513 deletions(-)
 delete mode 100644 drivers/pinctrl/renesas/pfc-r8a77950.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B2F6DC425
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Apr 2023 10:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjDJIBl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Apr 2023 04:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjDJIBk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Apr 2023 04:01:40 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2DC359A
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 01:01:38 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by laurent.telenet-ops.be with bizsmtp
        id iw1e290061C8whw01w1ezM; Mon, 10 Apr 2023 10:01:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmSF-00GRud-FM;
        Mon, 10 Apr 2023 10:01:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmT4-0092Re-1k;
        Mon, 10 Apr 2023 10:01:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.4 (take two)
Date:   Mon, 10 Apr 2023 10:01:36 +0200
Message-Id: <cover.1681113471.git.geert+renesas@glider.be>
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

The following changes since commit 9d7558ed8372c51cbed011cb1dc3eb1beee212cf:

  pinctrl: renesas: Drop support for Renesas-specific properties (2023-03-16 16:55:27 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.4-tag2

for you to fetch changes up to 45e6cc8ef1cd8576707506a4eeffef858e4a1a83:

  pinctrl: renesas: core: Drop unneeded #ifdef CONFIG_OF (2023-03-30 15:41:14 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.4 (take two)

  - Retain POCCTRL0 register across s2ram on R-Car D3,
  - Add support for Ethernet power-sources on R-Car V3M, V3H, E3, D3,
    and V4H,
  - Annotate sentinels in tables,
  - Add bias pinconf support and PWM pin groups on R-Car H1,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (12):
      pinctrl: renesas: r8a77995: Retain POCCTRL0 register across suspend/resume
      pinctrl: renesas: rcar: Phase out old SH_PFC_PIN_CFG_IO_VOLTAGE flag
      pinctrl: renesas: Add support for 1.8V/2.5V I/O voltage levels
      pinctrl: renesas: r8a77970: Add support for AVB power-source
      pinctrl: renesas: r8a77980: Add support for AVB/GE power-sources
      pinctrl: renesas: r8a77990: Add support for AVB power-source
      pinctrl: renesas: r8a77995: Add support for AVB power-source
      pinctrl: renesas: r8a779g0: Add support for AVB/TSN power-sources
      pinctrl: renesas: Annotate sentinels in tables
      pinctrl: renesas: r8a7779: Add bias pinconf support
      pinctrl: renesas: r8a7779: Add PWM pins, groups, and functions
      pinctrl: renesas: core: Drop unneeded #ifdef CONFIG_OF

 drivers/pinctrl/renesas/core.c         |  10 +-
 drivers/pinctrl/renesas/pfc-emev2.c    |   2 +-
 drivers/pinctrl/renesas/pfc-r8a73a4.c  |   4 +-
 drivers/pinctrl/renesas/pfc-r8a7740.c  |   4 +-
 drivers/pinctrl/renesas/pfc-r8a77470.c |  46 ++--
 drivers/pinctrl/renesas/pfc-r8a7778.c  |   4 +-
 drivers/pinctrl/renesas/pfc-r8a7779.c  | 446 ++++++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7790.c  |   4 +-
 drivers/pinctrl/renesas/pfc-r8a7791.c  |   6 +-
 drivers/pinctrl/renesas/pfc-r8a7792.c  |   2 +-
 drivers/pinctrl/renesas/pfc-r8a7794.c  |  50 ++--
 drivers/pinctrl/renesas/pfc-r8a77951.c |  12 +-
 drivers/pinctrl/renesas/pfc-r8a7796.c  |  12 +-
 drivers/pinctrl/renesas/pfc-r8a77965.c |  12 +-
 drivers/pinctrl/renesas/pfc-r8a77970.c |  38 ++-
 drivers/pinctrl/renesas/pfc-r8a77980.c |  49 ++--
 drivers/pinctrl/renesas/pfc-r8a77990.c |  41 +--
 drivers/pinctrl/renesas/pfc-r8a77995.c |  46 ++--
 drivers/pinctrl/renesas/pfc-r8a779a0.c |   8 +-
 drivers/pinctrl/renesas/pfc-r8a779f0.c |   8 +-
 drivers/pinctrl/renesas/pfc-r8a779g0.c |  53 +++-
 drivers/pinctrl/renesas/pfc-sh7203.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7264.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7269.c   |   6 +-
 drivers/pinctrl/renesas/pfc-sh73a0.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7720.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7722.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7723.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7724.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7734.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7757.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7785.c   |   4 +-
 drivers/pinctrl/renesas/pfc-sh7786.c   |   4 +-
 drivers/pinctrl/renesas/pfc-shx3.c     |   4 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c |   2 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c |   2 +-
 drivers/pinctrl/renesas/pinctrl.c      |  22 +-
 drivers/pinctrl/renesas/sh_pfc.h       |  13 +-
 38 files changed, 725 insertions(+), 225 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6598E384E8
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 09:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfFGHYl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 03:24:41 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56266 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfFGHYk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 03:24:40 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id MjQd2000L3XaVaC01jQdWU; Fri, 07 Jun 2019 09:24:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZ9Er-0003jc-N0; Fri, 07 Jun 2019 09:24:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZ9Er-0004V1-Lf; Fri, 07 Jun 2019 09:24:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v5.3
Date:   Fri,  7 Jun 2019 09:24:33 +0200
Message-Id: <20190607072433.17253-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.3-tag1

for you to fetch changes up to 992968d78626031a264d847e25f8f9810b9a1b50:

  pinctrl: sh-pfc: Remove obsolete SH_PFC_PIN_NAMED*() macros (2019-06-04 11:19:25 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.3

  - Add more checks for pinctrl table validation,
  - Add TPU (Timer Pulse Unit / PWM) pin groups on R-Car H3, M3-W, and
    M3-N,
  - Rework description of pins without GPIO functionality,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (25):
      pinctrl: sh-pfc: Correct printk level of group reference warning
      pinctrl: sh-pfc: Mark run-time debug code __init
      pinctrl: sh-pfc: Add check for empty pinmux groups/functions
      pinctrl: sh-pfc: Validate pin tables at runtime
      pinctrl: sh-pfc: Rename 2-parameter CPU_ALL_PORT() variant
      pinctrl: sh-pfc: Add SH_PFC_PIN_CFG_PULL_UP_DOWN shorthand
      pinctrl: sh-pfc: Move PIN_NONE to shared header file
      pinctrl: sh-pfc: r8a77970: Remove MMC_{CD,WP}
      pinctrl: sh-pfc: r8a7795-es1: Add TPU pins, groups and functions
      pinctrl: sh-pfc: r8a7795: Add TPU pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add TPU pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add TPU pins, groups and functions
      pinctrl: sh-pfc: Add PORT_GP_27 helper macro
      pinctrl: sh-pfc: r8a7778: Use common PORT_GP_CFG_27() macro
      pinctrl: sh-pfc: Add new non-GPIO helper macros
      pinctrl: sh-pfc: emev2: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7778: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7790: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7795-es1: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7795: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a7796: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a77965: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: r8a77990: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: sh73a0: Use new macros for non-GPIO pins
      pinctrl: sh-pfc: Remove obsolete SH_PFC_PIN_NAMED*() macros

 drivers/pinctrl/sh-pfc/core.c            |  60 ++++-
 drivers/pinctrl/sh-pfc/pfc-emev2.c       |  70 +++--
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c     |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c     |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c    |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c     | 125 ++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c     |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c     |  36 +--
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c     |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c     |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c     |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 434 +++++++++++++++++--------------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 414 +++++++++++++++--------------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 414 +++++++++++++++--------------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 410 ++++++++++++++++-------------
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    |  26 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 181 +++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    |   2 +-
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c      |  21 +-
 drivers/pinctrl/sh-pfc/pfc-sh7734.c      |   2 +-
 drivers/pinctrl/sh-pfc/pinctrl.c         |   3 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  90 +++++--
 23 files changed, 1245 insertions(+), 1059 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

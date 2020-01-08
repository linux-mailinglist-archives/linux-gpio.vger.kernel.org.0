Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47BE3134E33
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 21:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgAHU6g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 15:58:36 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:40230 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgAHU6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 15:58:36 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id nwyZ2100K5USYZQ01wyZAn; Wed, 08 Jan 2020 21:58:34 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipIPR-0001fS-Pv; Wed, 08 Jan 2020 21:58:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipIPR-0005Zu-Ns; Wed, 08 Jan 2020 21:58:33 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.6
Date:   Wed,  8 Jan 2020 21:58:30 +0100
Message-Id: <20200108205830.21401-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.6-tag1

for you to fetch changes up to f2bc07562748c23609743ded0630ec965f9e4fec:

  pinctrl: sh-pfc: Split R-Car H3 support in two independent drivers (2020-01-08 09:56:28 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.5

  - Split R-Car H3 support in two independent drivers,
  - Miscellaneous fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Chris Brandt (1):
      pinctrl: rza1: Reduce printed messages

Geert Uytterhoeven (10):
      pinctrl: sh-pfc: Make legacy function GPIO handling less fragile
      pinctrl: sh-pfc: Remove use of ARCH_R8A7796
      pinctrl: sh-pfc: r8a77965: Fix DU_DOTCLKIN3 drive/bias control
      pinctrl: sh-pfc: r8a7778: Fix duplicate SDSELF_B and SD1_CLK_B
      pinctrl: sh-pfc: sh7264: Fix Port K I/O Register 0 definition
      pinctrl: sh-pfc: sh7264: Fix CAN function GPIOs
      pinctrl: sh-pfc: sh7269: Fix CAN function GPIOs
      sh: sh7264: Remove bogus SSU GPIO function definitions
      sh: sh7269: Remove bogus SSU GPIO function definitions
      pinctrl: sh-pfc: Split R-Car H3 support in two independent drivers

 arch/sh/include/cpu-sh2a/cpu/sh7264.h              |  6 ---
 arch/sh/include/cpu-sh2a/cpu/sh7269.h              | 17 ++++---
 drivers/pinctrl/pinctrl-rza1.c                     |  4 +-
 drivers/pinctrl/sh-pfc/Kconfig                     | 12 +++--
 drivers/pinctrl/sh-pfc/Makefile                    |  4 +-
 drivers/pinctrl/sh-pfc/core.c                      | 57 +++++++++++++++++-----
 drivers/pinctrl/sh-pfc/gpio.c                      | 11 ++---
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  4 +-
 .../sh-pfc/{pfc-r8a7795-es1.c => pfc-r8a77950.c}   | 26 +++++-----
 .../sh-pfc/{pfc-r8a7795.c => pfc-r8a77951.c}       | 39 +++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              |  6 +--
 drivers/pinctrl/sh-pfc/pfc-sh7264.c                | 33 ++++++-------
 drivers/pinctrl/sh-pfc/pfc-sh7269.c                | 39 ++++++++++-----
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  4 +-
 14 files changed, 146 insertions(+), 116 deletions(-)
 rename drivers/pinctrl/sh-pfc/{pfc-r8a7795-es1.c => pfc-r8a77950.c} (99%)
 rename drivers/pinctrl/sh-pfc/{pfc-r8a7795.c => pfc-r8a77951.c} (99%)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

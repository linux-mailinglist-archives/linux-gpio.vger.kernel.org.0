Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC8D2B1E6F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 16:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgKMPSP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 10:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgKMPSO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 10:18:14 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7ACBC0617A6
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 07:18:13 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id rrJA2300E4C55Sk01rJAMu; Fri, 13 Nov 2020 16:18:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdaq2-0028KQ-6w; Fri, 13 Nov 2020 16:18:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdaq1-00GSzA-GZ; Fri, 13 Nov 2020 16:18:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.11
Date:   Fri, 13 Nov 2020 16:18:07 +0100
Message-Id: <20201113151807.3924625-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.11-tag1

for you to fetch changes up to d4aac7d439c2d9307cb5137fc285464a36978107:

  pinctrl: renesas: Constify sh73a0_vccq_mc0_ops (2020-11-13 15:37:41 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.11

  - Add remaining video-in (VIN) pin groups on R-Car H2 and RZ/G1H,
  - Image size optimizations and code consolidations,
  - Minor fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (6):
      pinctrl: renesas: r8a77951: Optimize pinctrl image size for R8A774E1
      pinctrl: renesas: r8a7796: Optimize pinctrl image size for R8A774A1
      pinctrl: renesas: r8a77965: Optimize pinctrl image size for R8A774B1
      pinctrl: renesas: r8a77990: Optimize pinctrl image size for R8A774C0
      pinctrl: renesas: r8a7790: Optimize pinctrl image size for R8A7742
      pinctrl: renesas: r8a7791: Optimize pinctrl image size for R8A774[34]

Geert Uytterhoeven (8):
      pinctrl: renesas: Remove superfluous goto in sh_pfc_gpio_set_direction()
      pinctrl: renesas: Singular/plural grammar fixes
      pinctrl: renesas: Reorder struct sh_pfc_pin to remove hole
      pinctrl: renesas: Optimize sh_pfc_pin_config
      pinctrl: renesas: Factor out common R-Car Gen3 bias handling
      pinctrl: renesas: r8a7778: Use physical addresses for PUPR regs
      pinctrl: renesas: r8a7778: Use common R-Car bias handling
      pinctrl: renesas: Protect GPIO leftovers by CONFIG_PINCTRL_SH_FUNC_GPIO

Lad Prabhakar (1):
      pinctrl: renesas: r8a7790: Add VIN1-B and VIN2-G pins, groups and functions

Rikard Falkeborn (1):
      pinctrl: renesas: Constify sh73a0_vccq_mc0_ops

 drivers/pinctrl/renesas/core.c         |   2 +
 drivers/pinctrl/renesas/core.h         |   4 +
 drivers/pinctrl/renesas/gpio.c         |   2 +-
 drivers/pinctrl/renesas/pfc-r8a7778.c  |  55 ++-----------
 drivers/pinctrl/renesas/pfc-r8a7790.c  | 146 ++++++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7791.c  |  18 ++++
 drivers/pinctrl/renesas/pfc-r8a77950.c |  45 +---------
 drivers/pinctrl/renesas/pfc-r8a77951.c |  59 ++++---------
 drivers/pinctrl/renesas/pfc-r8a7796.c  |  57 ++++---------
 drivers/pinctrl/renesas/pfc-r8a77965.c |  57 ++++---------
 drivers/pinctrl/renesas/pfc-r8a77990.c |  57 ++++---------
 drivers/pinctrl/renesas/pfc-sh73a0.c   |   2 +-
 drivers/pinctrl/renesas/pinctrl.c      |  68 +++++++++++----
 drivers/pinctrl/renesas/sh_pfc.h       |  12 +--
 14 files changed, 298 insertions(+), 286 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

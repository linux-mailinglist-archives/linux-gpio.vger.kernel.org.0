Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2221352A58
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 13:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbhDBLq0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 07:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhDBLq0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Apr 2021 07:46:26 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1634FC061788
        for <linux-gpio@vger.kernel.org>; Fri,  2 Apr 2021 04:46:24 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by andre.telenet-ops.be with bizsmtp
        id nnmP240034A7w6i01nmPNi; Fri, 02 Apr 2021 13:46:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lSIFq-00CRbQ-Mr; Fri, 02 Apr 2021 13:46:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lSIFq-004Cfe-2N; Fri, 02 Apr 2021 13:46:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.13 (take two)
Date:   Fri,  2 Apr 2021 13:46:19 +0200
Message-Id: <cover.1617363828.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit f7adcca27edf05fc1f061a9e5de059fe179f0e1c:

  pinctrl: renesas: r8a77965: Add vin4_g8 and vin5_high8 pins (2021-03-10 10:50:26 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.13-tag2

for you to fetch changes up to 61232cd6efca6e4d2705993850d014343ba604c4:

  pinctrl: renesas: r8a7791: Add bias pinconf support (2021-03-24 10:38:29 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.13 (take two)

  - Add bias support for the R-Car M2-W and M2-N, and RZ/G1M and RZ/G1N
    SoCs,
  - Miscellaneous cleanups and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (6):
      pinctrl: renesas: Make sh_pfc_pin_to_bias_reg() static
      pinctrl: renesas: Move R-Car bias helpers to sh_pfc.h
      pinctrl: renesas: Factor out common R-Mobile bias handling
      pinctrl: renesas: Add PORT_GP_CFG_7 macros
      pinctrl: renesas: Add support for R-Car SoCs with pull-down only pins
      pinctrl: renesas: r8a7791: Add bias pinconf support

 drivers/pinctrl/renesas/core.c         |  20 --
 drivers/pinctrl/renesas/core.h         |   8 -
 drivers/pinctrl/renesas/pfc-r8a73a4.c  |  48 +---
 drivers/pinctrl/renesas/pfc-r8a7740.c  |  46 +---
 drivers/pinctrl/renesas/pfc-r8a7778.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 387 +++++++++++++++++++++++++++++++--
 drivers/pinctrl/renesas/pfc-r8a7792.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a77950.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77951.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a7796.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a77965.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77970.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77980.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77990.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77995.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a779a0.c |   1 -
 drivers/pinctrl/renesas/pfc-sh73a0.c   |  46 +---
 drivers/pinctrl/renesas/pinctrl.c      | 109 ++++++++--
 drivers/pinctrl/renesas/sh_pfc.h       |  24 +-
 19 files changed, 497 insertions(+), 202 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

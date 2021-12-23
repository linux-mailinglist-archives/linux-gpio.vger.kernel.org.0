Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8186E47E52E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243929AbhLWO4f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239907AbhLWO4c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:32 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58514C06179B
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id ZqwV2600c4C55Sk01qwVZM; Thu, 23 Dec 2021 15:56:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW9-006aMA-8X; Thu, 23 Dec 2021 15:56:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW7-003rwS-Tl; Thu, 23 Dec 2021 15:56:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/10] pinctrl: renesas: checker: Miscellaneous improvements
Date:   Thu, 23 Dec 2021 15:56:16 +0100
Message-Id: <cover.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

This patch series improves the Renesas pin control table validator
(enabled when DEBUG is defined, e.g. with CONFIG_DEBUG_PINCTRL=y), by:
  1. Suggesting which pin groups can share pins,
  2. Adding more checks to catch common errors.

If you enable the checker, you may be disappointed by the (lack of)
output.  Indeed, it is much easier to fix detected issues, than to get
the checker code in a state that is suitable for upstream submission
;-)
Hence most issues detected have been fixed already for quite some time,
or never arrived upstream in the first place. Recent fixes are [1] and
[2].

If accepted, I intend to queue this in renesas-pinctrl for v5.18.
Thanks for your comments!

[1] "[PATCH 00/60] pinctrl: renesas: Share more pin group data"
    https://lore.kernel.org/r/cover.1640269757.git.geert+renesas@glider.be/
[2] "[PATCH] pinctrl: renesas: r8a7794: Add range checking to
     .pin_to_pocctrl()"
    https://lore.kernel.org/r/d23767ad7152327654192d7191f4b8ae19493966.1640269510.git.geert+renesas@glider.be/

Geert Uytterhoeven (10):
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

 drivers/pinctrl/renesas/core.c         | 208 ++++++++++++++++++++++---
 drivers/pinctrl/renesas/pfc-r8a73a4.c  |   4 +-
 drivers/pinctrl/renesas/pfc-r8a7740.c  |   6 +-
 drivers/pinctrl/renesas/pfc-r8a77470.c |   3 +-
 drivers/pinctrl/renesas/pfc-r8a7790.c  |   2 +-
 drivers/pinctrl/renesas/pfc-r8a7791.c  |   2 +-
 drivers/pinctrl/renesas/pfc-r8a7794.c  |   2 +-
 drivers/pinctrl/renesas/pfc-r8a77950.c |   3 +-
 drivers/pinctrl/renesas/pfc-r8a77951.c |   3 +-
 drivers/pinctrl/renesas/pfc-r8a7796.c  |   3 +-
 drivers/pinctrl/renesas/pfc-r8a77965.c |   3 +-
 drivers/pinctrl/renesas/pfc-r8a77970.c |   3 +-
 drivers/pinctrl/renesas/pfc-r8a77980.c |   3 +-
 drivers/pinctrl/renesas/pfc-r8a77990.c |   3 +-
 drivers/pinctrl/renesas/pfc-r8a77995.c |   4 +-
 drivers/pinctrl/renesas/pfc-r8a779a0.c |   3 +-
 drivers/pinctrl/renesas/pfc-sh73a0.c   |   4 +-
 drivers/pinctrl/renesas/pinctrl.c      |  24 +--
 drivers/pinctrl/renesas/sh_pfc.h       |   6 +-
 19 files changed, 227 insertions(+), 62 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

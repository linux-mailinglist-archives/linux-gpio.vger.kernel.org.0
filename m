Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF5429DAE3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390525AbgJ1Xgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:36:55 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:54848 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390547AbgJ1XfT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:35:19 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4CLsc864FyzMwkh4
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:16:40 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id lTGf230124C55Sk01TGflB; Wed, 28 Oct 2020 16:16:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-000pDY-JL; Wed, 28 Oct 2020 16:16:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-007H8j-44; Wed, 28 Oct 2020 16:16:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/8] pinctrl: renesas: Cleanups and improvements
Date:   Wed, 28 Oct 2020 16:16:29 +0100
Message-Id: <20201028151637.1734130-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

This patch series contains several cleanups and improvements for the
Renesas pin control drivers.

I plan to queue these in renesas-pinctrl for v5.11.

Thanks for your comments!

Geert Uytterhoeven (8):
  pinctrl: renesas: Remove superfluous goto in
    sh_pfc_gpio_set_direction()
  pinctrl: renesas: Singular/plural grammar fixes
  pinctrl: renesas: Reorder struct sh_pfc_pin to remove hole
  pinctrl: renesas: Optimize sh_pfc_pin_config
  pinctrl: renesas: Factor out common R-Car Gen3 bias handling
  pinctrl: renesas: r8a7778: Use physical addresses for PUPR regs
  pinctrl: renesas: r8a7778: Use common R-Car bias handling
  pinctrl: renesas: Protect GPIO leftovers by
    CONFIG_PINCTRL_SH_FUNC_GPIO

 drivers/pinctrl/renesas/core.c         |  2 +
 drivers/pinctrl/renesas/core.h         |  4 ++
 drivers/pinctrl/renesas/gpio.c         |  2 +-
 drivers/pinctrl/renesas/pfc-r8a7778.c  | 55 +++------------------
 drivers/pinctrl/renesas/pfc-r8a77950.c | 45 +----------------
 drivers/pinctrl/renesas/pfc-r8a77951.c | 45 +----------------
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 45 +----------------
 drivers/pinctrl/renesas/pfc-r8a77965.c | 45 +----------------
 drivers/pinctrl/renesas/pfc-r8a77990.c | 45 +----------------
 drivers/pinctrl/renesas/pinctrl.c      | 68 ++++++++++++++++++++------
 drivers/pinctrl/renesas/sh_pfc.h       | 12 +++--
 11 files changed, 86 insertions(+), 282 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

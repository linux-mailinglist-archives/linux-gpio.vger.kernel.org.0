Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718C22631ED
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 18:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731058AbgIIQaW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 12:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731118AbgIIQ13 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 12:27:29 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553B8C0617A0
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 09:26:57 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id RsSr230084C55Sk01sSrm6; Wed, 09 Sep 2020 18:26:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kG2vr-0000Qv-0z; Wed, 09 Sep 2020 18:26:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kFzwm-0003Mo-Ki; Wed, 09 Sep 2020 15:15:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pinctrl: renesas: More-consolidation
Date:   Wed,  9 Sep 2020 15:15:31 +0200
Message-Id: <20200909131534.12897-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

This patch series continues the work to consolidate all pin control
drivers for Renesas SoCs, as started by Morimoto-san.

I intend to queue this in the (new) pinctrl-renesas-for-v5.10 branch.

Thanks for your comments!

Geert Uytterhoeven (3):
  pinctrl: rzn1: Do not select GENERIC_PIN{CTRL_GROUPS,MUX_FUNCTIONS}
  pinctrl: Rename sh-pfc to renesas
  pinctrl: renesas: Reintroduce SH_PFC for common sh-pfc code

 MAINTAINERS                                   |  5 +-
 drivers/pinctrl/Kconfig                       |  2 +-
 drivers/pinctrl/Makefile                      |  2 +-
 drivers/pinctrl/{sh-pfc => renesas}/Kconfig   | 54 ++++++++++++++-----
 drivers/pinctrl/{sh-pfc => renesas}/Makefile  |  4 +-
 drivers/pinctrl/{sh-pfc => renesas}/core.c    |  0
 drivers/pinctrl/{sh-pfc => renesas}/core.h    |  0
 drivers/pinctrl/{sh-pfc => renesas}/gpio.c    |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-emev2.c   |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-r8a73a4.c |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-r8a7740.c |  0
 .../{sh-pfc => renesas}/pfc-r8a77470.c        |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-r8a7778.c |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-r8a7779.c |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-r8a7790.c |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-r8a7791.c |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-r8a7792.c |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-r8a7794.c |  0
 .../{sh-pfc => renesas}/pfc-r8a77950.c        |  0
 .../{sh-pfc => renesas}/pfc-r8a77951.c        |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-r8a7796.c |  2 +-
 .../{sh-pfc => renesas}/pfc-r8a77965.c        |  2 +-
 .../{sh-pfc => renesas}/pfc-r8a77970.c        |  2 +-
 .../{sh-pfc => renesas}/pfc-r8a77980.c        |  2 +-
 .../{sh-pfc => renesas}/pfc-r8a77990.c        |  2 +-
 .../{sh-pfc => renesas}/pfc-r8a77995.c        |  2 +-
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7203.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7264.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7269.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh73a0.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7720.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7722.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7723.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7724.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7734.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7757.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7785.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-sh7786.c  |  0
 .../pinctrl/{sh-pfc => renesas}/pfc-shx3.c    |  0
 .../{sh-pfc => renesas}/pinctrl-rza1.c        |  0
 .../{sh-pfc => renesas}/pinctrl-rza2.c        |  0
 .../{sh-pfc => renesas}/pinctrl-rzn1.c        |  0
 drivers/pinctrl/{sh-pfc => renesas}/pinctrl.c |  0
 drivers/pinctrl/{sh-pfc => renesas}/sh_pfc.h  |  0
 44 files changed, 55 insertions(+), 24 deletions(-)
 rename drivers/pinctrl/{sh-pfc => renesas}/Kconfig (90%)
 rename drivers/pinctrl/{sh-pfc => renesas}/Makefile (96%)
 rename drivers/pinctrl/{sh-pfc => renesas}/core.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/core.h (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/gpio.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-emev2.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a73a4.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7740.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77470.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7778.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7779.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7790.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7791.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7792.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7794.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77950.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77951.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7796.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77965.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77970.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77980.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77990.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77995.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7203.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7264.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7269.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh73a0.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7720.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7722.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7723.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7724.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7734.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7757.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7785.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7786.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-shx3.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pinctrl-rza1.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pinctrl-rza2.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pinctrl-rzn1.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pinctrl.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/sh_pfc.h (100%)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

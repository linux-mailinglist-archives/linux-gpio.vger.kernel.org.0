Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79B636FA34
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbhD3McJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhD3McG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:06 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA14C061343
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by andre.telenet-ops.be with bizsmtp
        id z0XF2400M4p6Y38010XFUc; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-001ecC-Fj; Fri, 30 Apr 2021 14:31:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSIc-00BduX-VR; Fri, 30 Apr 2021 14:31:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/12] pinctrl: renesas: Add more bias pinconf support
Date:   Fri, 30 Apr 2021 14:30:59 +0200
Message-Id: <cover.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

This patch series add bias pinconf support to the R-Car Gen2, R-Car
Gen3, RZ/G1, and RZ/G2 SoCs that do not have it yet, preceded by a two
fixes and three cleanups.

This has not been formally tested in the field, but did pass my
work-in-progress bias registers checks in the Renesas pinctrl checker,
which I hope to post soon.

I hope to queue this in renesas-pinctrl for v5.14.

Thanks for your comments!

Geert Uytterhoeven (12):
  pinctrl: renesas: r8a7796: Add missing bias for PRESET# pin
  pinctrl: renesas: r8a77990: JTAG pins do not have pull-down
    capabilities
  pinctrl: renesas: r8a77990: Drop bogus PUEN_ prefixes in comments
  pinctrl: renesas: r8a7778: Remove unused PORT_GP_PUP_1() macro
  pinctrl: renesas: r8a779{51,6,65}: Reduce non-functional differences
  pinctrl: renesas: r8a77470: Add bias pinconf support
  pinctrl: renesas: r8a7790: Add bias pinconf support
  pinctrl: renesas: r8a7792: Add bias pinconf support
  pinctrl: renesas: r8a7794: Add bias pinconf support
  pinctrl: renesas: r8a77970: Add bias pinconf support
  pinctrl: renesas: r8a77980: Add bias pinconf support
  pinctrl: renesas: r8a77995: Add bias pinconf support

 drivers/pinctrl/renesas/pfc-r8a77470.c | 346 ++++++++++++++--
 drivers/pinctrl/renesas/pfc-r8a7778.c  |   3 -
 drivers/pinctrl/renesas/pfc-r8a7790.c  | 301 +++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7792.c  | 533 ++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7794.c  | 360 ++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77951.c |   4 +-
 drivers/pinctrl/renesas/pfc-r8a7796.c  |  10 +-
 drivers/pinctrl/renesas/pfc-r8a77965.c |  79 ++--
 drivers/pinctrl/renesas/pfc-r8a77970.c | 175 +++++++-
 drivers/pinctrl/renesas/pfc-r8a77980.c | 209 +++++++++-
 drivers/pinctrl/renesas/pfc-r8a77990.c |  16 +-
 drivers/pinctrl/renesas/pfc-r8a77995.c | 246 +++++++++++-
 12 files changed, 2138 insertions(+), 144 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

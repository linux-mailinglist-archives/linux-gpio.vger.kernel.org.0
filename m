Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571373A3F77
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 11:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhFKJtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 05:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhFKJts (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 05:49:48 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4919DC0617AF
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 02:47:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
        by xavier.telenet-ops.be with bizsmtp
        id Flnq2500d25eH3q01lnqRw; Fri, 11 Jun 2021 11:47:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrdlW-00FcRo-EA; Fri, 11 Jun 2021 11:47:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrdlV-00CZvE-VS; Fri, 11 Jun 2021 11:47:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.14 (take two)
Date:   Fri, 11 Jun 2021 11:47:48 +0200
Message-Id: <cover.1623404609.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 904ec4bebc1df908a943bf3178f6c633672ce47b:

  pinctrl: renesas: r8a779{51,6,65}: Reduce non-functional differences (2021-05-11 10:04:42 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.14-tag2

for you to fetch changes up to c3975a73ca9410519cf62531f640b68d69b0d798:

  pinctrl: renesas: r8a77980: Add bias pinconf support (2021-05-31 10:50:29 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.14 (take two)

  - Add bias support for the R-Car H2, V2H, E2, V3M, and V3H, and
    RZ/G1C, RZ/G1H, and RZ/G1E SoCs.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (6):
      pinctrl: renesas: r8a77470: Add bias pinconf support
      pinctrl: renesas: r8a7790: Add bias pinconf support
      pinctrl: renesas: r8a7792: Add bias pinconf support
      pinctrl: renesas: r8a7794: Add bias pinconf support
      pinctrl: renesas: r8a77970: Add bias pinconf support
      pinctrl: renesas: r8a77980: Add bias pinconf support

 drivers/pinctrl/renesas/pfc-r8a77470.c | 346 ++++++++++++++++++---
 drivers/pinctrl/renesas/pfc-r8a7790.c  | 301 ++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7792.c  | 533 ++++++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7794.c  | 360 +++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77970.c | 175 ++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77980.c | 209 ++++++++++++-
 6 files changed, 1844 insertions(+), 80 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

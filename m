Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8201DB5E1
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 16:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgETOEe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 May 2020 10:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbgETOEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 10:04:34 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC31EC061A0F
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2020 07:04:33 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:884f:d4db:d672:7145])
        by albert.telenet-ops.be with bizsmtp
        id h24Y2200C4QqYJb0624YmM; Wed, 20 May 2020 16:04:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jbPKi-0000ED-3o; Wed, 20 May 2020 16:04:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jbPKi-0003dS-1G; Wed, 20 May 2020 16:04:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.8 (take two+)
Date:   Wed, 20 May 2020 16:04:30 +0200
Message-Id: <20200520140430.13933-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

[ This time with a correct SoC name in the description, thanks Sergei! ]

The following changes since commit 41fe32ecc7aff4527a4ee477870d9b1164be95a4:

  MAINTAINERS: Add DT Bindings for Renesas Pin Function Controllers (2020-04-20 13:14:05 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.8-tag2

for you to fetch changes up to dfae0422de12265ae7c9bf57b34990200dea0c83:

  MAINTAINERS: Renesas Pin Controllers are supported (2020-05-20 14:02:00 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.8 (take two)

  - Add support for the new RZ/G1H (r8a7742) SoC,
  - Minor fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (2):
      pinctrl: rza1: Fix flag name in comment
      MAINTAINERS: Renesas Pin Controllers are supported

Lad Prabhakar (2):
      dt-bindings: pinctrl: sh-pfc: Document r8a7742 PFC support
      pinctrl: sh-pfc: r8a7790: Add r8a7742 PFC support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
 MAINTAINERS                                        |   2 +-
 drivers/pinctrl/pinctrl-rza1.c                     |   2 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |   4 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               | 744 +++++++++++----------
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   1 +
 8 files changed, 407 insertions(+), 354 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

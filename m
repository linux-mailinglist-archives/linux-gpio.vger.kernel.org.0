Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360692139DF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2020 14:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgGCMRl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jul 2020 08:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGCMRl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jul 2020 08:17:41 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E868C08C5C1
        for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2020 05:17:40 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:e8cd:dde5:943b:dfd3])
        by xavier.telenet-ops.be with bizsmtp
        id ycHc2200a1UkkT801cHdfe; Fri, 03 Jul 2020 14:17:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKdM-0004hc-RH; Fri, 03 Jul 2020 14:17:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKdM-0001lR-PI; Fri, 03 Jul 2020 14:17:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.9
Date:   Fri,  3 Jul 2020 14:17:35 +0200
Message-Id: <20200703121735.6738-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.9-tag1

for you to fetch changes up to b2fc9b4eb1d79c03fd78e50b810c2ea27178e1e3:

  pinctrl: sh-pfc: r8a77970: Add RPC pins, groups, and functions (2020-06-22 16:58:23 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.9

  - Add RPC (HyperFlash and Octal-SPI Flash) pin groups on R-Car V3H and
    V3M.

Thanks for pulling!
----------------------------------------------------------------
Sergei Shtylyov (2):
      pinctrl: sh-pfc: r8a77980: Add RPC pins, groups, and functions
      pinctrl: sh-pfc: r8a77970: Add RPC pins, groups, and functions

 drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 76 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 76 +++++++++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

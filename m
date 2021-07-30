Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1FA3DB994
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 15:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhG3Nru (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 09:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbhG3Nrt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 09:47:49 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE100C0613C1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 06:47:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:69f0:c617:e432:6919])
        by xavier.telenet-ops.be with bizsmtp
        id bRnj2500C2oLRg901RnjBN; Fri, 30 Jul 2021 15:47:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9SrW-002GwG-V9; Fri, 30 Jul 2021 15:47:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9SrW-00HKHz-9Z; Fri, 30 Jul 2021 15:47:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.15
Date:   Fri, 30 Jul 2021 15:47:40 +0200
Message-Id: <cover.1627652747.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.15-tag1

for you to fetch changes up to 91d1be9fb7d667ae136f05cc645276eb2c9fa40e:

  pinctrl: renesas: Fix pin control matching on R-Car H3e-2G (2021-07-27 09:29:02 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.15

  - Add bias support for the R-Car D3 SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      pinctrl: renesas: rcar: Avoid changing PUDn when disabling bias
      pinctrl: renesas: r8a77995: Add bias pinconf support
      pinctrl: renesas: Fix pin control matching on R-Car H3e-2G

 drivers/pinctrl/renesas/core.c         |  29 ++-
 drivers/pinctrl/renesas/pfc-r8a77995.c | 320 ++++++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pinctrl.c      |  16 +-
 drivers/pinctrl/renesas/sh_pfc.h       |   7 +-
 4 files changed, 337 insertions(+), 35 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

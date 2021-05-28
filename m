Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E622394103
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 12:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236473AbhE1Khb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 06:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbhE1Kha (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 06:37:30 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EB5C06138B
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 03:35:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
        by baptiste.telenet-ops.be with bizsmtp
        id AAbs2500P20MPSF01AbsAb; Fri, 28 May 2021 12:35:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmZqK-00AD9W-B3; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmYG8-007Gbk-Nt; Fri, 28 May 2021 10:54:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.14
Date:   Fri, 28 May 2021 10:54:23 +0200
Message-Id: <cover.1622191662.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.14-tag1

for you to fetch changes up to 904ec4bebc1df908a943bf3178f6c633672ce47b:

  pinctrl: renesas: r8a779{51,6,65}: Reduce non-functional differences (2021-05-11 10:04:42 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.14

  - Minor fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (5):
      pinctrl: renesas: r8a7796: Add missing bias for PRESET# pin
      pinctrl: renesas: r8a77990: JTAG pins do not have pull-down capabilities
      pinctrl: renesas: r8a77990: Drop bogus PUEN_ prefixes in comments
      pinctrl: renesas: r8a7778: Remove unused PORT_GP_PUP_1() macro
      pinctrl: renesas: r8a779{51,6,65}: Reduce non-functional differences

 drivers/pinctrl/renesas/pfc-r8a7778.c  |  3 --
 drivers/pinctrl/renesas/pfc-r8a77951.c |  4 +-
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 10 +++--
 drivers/pinctrl/renesas/pfc-r8a77965.c | 79 +++++++++++++++++-----------------
 drivers/pinctrl/renesas/pfc-r8a77990.c | 16 +++----
 5 files changed, 56 insertions(+), 56 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

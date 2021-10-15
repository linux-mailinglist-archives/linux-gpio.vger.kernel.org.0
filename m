Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6200042F01B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 13:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238641AbhJOMBn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 08:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238637AbhJOMBm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 08:01:42 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8033AC061570
        for <linux-gpio@vger.kernel.org>; Fri, 15 Oct 2021 04:59:36 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ad48:4534:27c0:db4b])
        by andre.telenet-ops.be with bizsmtp
        id 6Bza2600C0SQF6f01BzaSA; Fri, 15 Oct 2021 13:59:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mbLs6-0053nA-KV; Fri, 15 Oct 2021 13:59:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mbLs6-004hzu-49; Fri, 15 Oct 2021 13:59:34 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.16 (take two)
Date:   Fri, 15 Oct 2021 13:59:32 +0200
Message-Id: <cover.1634298539.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit fcfb63148c241adad54ed99fc318167176d7254b:

  pinctrl: renesas: rzg2l: Fix missing port register 21h (2021-09-24 15:14:49 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.16-tag2

for you to fetch changes up to f4e260bffcf367523b77f936fe0dbd278581305e:

  pinctrl: renesas: checker: Prefix common checker output (2021-10-15 09:48:00 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.16 (take two)

  - Add MediaLB pins on R-Car H3, M3-W/W+, and M3-N.
  - Miscellaneous fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Andrey Gusakov (1):
      pinctrl: renesas: r8a779[56]x: Add MediaLB pins

Geert Uytterhoeven (5):
      pinctrl: renesas: Fix save/restore on SoCs with pull-down only pins
      pinctrl: renesas: checker: Fix off-by-one bug in drive register check
      pinctrl: renesas: checker: Move overlapping field check
      pinctrl: renesas: checker: Fix bias checks on SoCs with pull-down only pins
      pinctrl: renesas: checker: Prefix common checker output

 drivers/pinctrl/renesas/core.c         | 73 +++++++++++++++++++++-------------
 drivers/pinctrl/renesas/pfc-r8a77950.c | 14 +++++++
 drivers/pinctrl/renesas/pfc-r8a77951.c | 22 +++++++++-
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 22 +++++++++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 22 +++++++++-
 5 files changed, 119 insertions(+), 34 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

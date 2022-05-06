Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE6251D4B8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 May 2022 11:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355385AbiEFJhP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 May 2022 05:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390662AbiEFJhC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 May 2022 05:37:02 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2192654
        for <linux-gpio@vger.kernel.org>; Fri,  6 May 2022 02:32:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
        by michel.telenet-ops.be with bizsmtp
        id TMYg2700f1UVucw06MYgqh; Fri, 06 May 2022 11:32:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuKG-0038YQ-7O; Fri, 06 May 2022 11:32:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuKF-00AenP-HH; Fri, 06 May 2022 11:32:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.19 (take two)
Date:   Fri,  6 May 2022 11:32:38 +0200
Message-Id: <cover.1651829249.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit f7bc5f52d2354b41d5a111942be7ee01e5560c78:

  pinctrl: renesas: rzg2l: Restore pin config order (2022-04-20 11:53:47 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.19-tag2

for you to fetch changes up to fc883ed5a43e5f94894216896d74190ecf1356ff:

  pinctrl: renesas: checker: Add reserved field checks (2022-05-05 12:02:28 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.19 (take two)

  - Reserved field optimizations,
  - Miscellaneous fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (52):
      pinctrl: renesas: r8a779a0: Fix GPIO function on I2C-capable pins
      pinctrl: renesas: r8a779f0: Fix GPIO function on I2C-capable pins
      pinctrl: renesas: r8a77470: Use fixed-width description for IPSR regs
      pinctrl: renesas: Add shorthand for reserved register fields
      pinctrl: renesas: rmobile: Mark unused PORTCR bits reserved
      pinctrl: renesas: emev2: Use shorthands for reserved fields
      pinctrl: renesas: r8a77470: Use shorthands for reserved fields
      pinctrl: renesas: r8a7778: Use shorthands for reserved fields
      pinctrl: renesas: r8a7779: Use shorthands for reserved fields
      pinctrl: renesas: r8a7790: Use shorthands for reserved fields
      pinctrl: renesas: r8a7791: Use shorthands for reserved fields
      pinctrl: renesas: r8a7792: Use shorthands for reserved fields
      pinctrl: renesas: r8a7794: Use shorthands for reserved fields
      pinctrl: renesas: r8a77950: Use shorthands for reserved fields
      pinctrl: renesas: r8a77951: Use shorthands for reserved fields
      pinctrl: renesas: r8a7796: Use shorthands for reserved fields
      pinctrl: renesas: r8a77965: Use shorthands for reserved fields
      pinctrl: renesas: r8a77970: Use shorthands for reserved fields
      pinctrl: renesas: r8a77980: Use shorthands for reserved fields
      pinctrl: renesas: r8a77990: Use shorthands for reserved fields
      pinctrl: renesas: r8a77995: Use shorthands for reserved fields
      pinctrl: renesas: r8a779a0: Use shorthands for reserved fields
      pinctrl: renesas: r8a779f0: Use shorthands for reserved fields
      pinctrl: renesas: sh7734: Use shorthands for reserved fields
      pinctrl: renesas: r8a73a4: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a7740: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a77470: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a7779: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a7792: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a77950: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a77951: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a77965: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a7796: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a77970: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a77980: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a77990: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a77995: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a779a0: Optimize fixed-width reserved fields
      pinctrl: renesas: r8a779f0: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7203: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7264: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7269: Optimize fixed-width reserved fields
      pinctrl: renesas: sh73a0: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7720: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7722: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7723: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7724: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7734: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7757: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7785: Optimize fixed-width reserved fields
      pinctrl: renesas: sh7786: Optimize fixed-width reserved fields
      pinctrl: renesas: checker: Add reserved field checks

Yang Yingliang (2):
      pinctrl: renesas: core: Fix possible null-ptr-deref in sh_pfc_map_resources()
      pinctrl: renesas: rzn1: Fix possible null-ptr-deref in sh_pfc_map_resources()

 drivers/pinctrl/renesas/core.c         |  50 ++++---
 drivers/pinctrl/renesas/pfc-emev2.c    |  59 ++------
 drivers/pinctrl/renesas/pfc-r8a73a4.c  |  58 +++-----
 drivers/pinctrl/renesas/pfc-r8a7740.c  |  74 +++++-----
 drivers/pinctrl/renesas/pfc-r8a77470.c | 176 ++++++-----------------
 drivers/pinctrl/renesas/pfc-r8a7778.c  |  98 ++++---------
 drivers/pinctrl/renesas/pfc-r8a7779.c  |  82 ++++-------
 drivers/pinctrl/renesas/pfc-r8a7790.c  | 110 +++++----------
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 111 +++++----------
 drivers/pinctrl/renesas/pfc-r8a7792.c  | 231 +++++++------------------------
 drivers/pinctrl/renesas/pfc-r8a7794.c  |  97 +++----------
 drivers/pinctrl/renesas/pfc-r8a77950.c | 170 +++++------------------
 drivers/pinctrl/renesas/pfc-r8a77951.c | 169 ++++++----------------
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 166 ++++++----------------
 drivers/pinctrl/renesas/pfc-r8a77965.c | 166 ++++++----------------
 drivers/pinctrl/renesas/pfc-r8a77970.c | 136 +++++-------------
 drivers/pinctrl/renesas/pfc-r8a77980.c | 107 +++++---------
 drivers/pinctrl/renesas/pfc-r8a77990.c | 132 +++++-------------
 drivers/pinctrl/renesas/pfc-r8a77995.c | 131 ++++--------------
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 246 ++++++++++++++-------------------
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 121 +++++++---------
 drivers/pinctrl/renesas/pfc-sh7203.c   |  53 +++----
 drivers/pinctrl/renesas/pfc-sh7264.c   | 104 +++++++-------
 drivers/pinctrl/renesas/pfc-sh7269.c   |  82 +++++------
 drivers/pinctrl/renesas/pfc-sh73a0.c   |  87 ++++--------
 drivers/pinctrl/renesas/pfc-sh7720.c   |  57 ++++----
 drivers/pinctrl/renesas/pfc-sh7722.c   | 202 +++++++++++----------------
 drivers/pinctrl/renesas/pfc-sh7723.c   |  70 +++++-----
 drivers/pinctrl/renesas/pfc-sh7724.c   |   7 +-
 drivers/pinctrl/renesas/pfc-sh7734.c   | 115 +++++----------
 drivers/pinctrl/renesas/pfc-sh7757.c   |  95 +++++--------
 drivers/pinctrl/renesas/pfc-sh7785.c   |  60 ++++----
 drivers/pinctrl/renesas/pfc-sh7786.c   |  21 ++-
 drivers/pinctrl/renesas/pinctrl-rzn1.c |  10 +-
 drivers/pinctrl/renesas/sh_pfc.h       |  17 ++-
 35 files changed, 1173 insertions(+), 2497 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

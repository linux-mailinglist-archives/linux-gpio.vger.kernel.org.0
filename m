Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF7E67EAE6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 17:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbjA0Q2y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 11:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbjA0Q2x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 11:28:53 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0668721A11
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 08:28:52 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a160:4e65:21d4:30bf])
        by albert.telenet-ops.be with bizsmtp
        id DsUr2900E2rBNjs06sUrZF; Fri, 27 Jan 2023 17:28:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRah-007ZlB-JQ;
        Fri, 27 Jan 2023 17:28:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRat-005Tc6-C7;
        Fri, 27 Jan 2023 17:28:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.3
Date:   Fri, 27 Jan 2023 17:28:50 +0100
Message-Id: <cover.1674815692.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.3-tag1

for you to fetch changes up to 698485cd875be1109b2130e0ff6c927010a6b56b:

  pinctrl: renesas: r8a77950: Add VIN[45] pins, groups, and functions (2023-01-26 16:45:49 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.3

  - Add pin groups for Video-In channels 4 and 5 on R-Car H3 ES1.x,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (2):
      pinctrl: renesas: r8a779g0: Fix alignment in GPSR[678]_* macros
      pinctrl: renesas: r8a77950: Add VIN[45] pins, groups, and functions

Lad Prabhakar (2):
      pinctrl: renesas: rzg2l: Fix configuring the GPIO pins as interrupts
      pinctrl: renesas: rzg2l: Add BUILD_BUG_ON() checks

 drivers/pinctrl/renesas/pfc-r8a77950.c  | 244 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/renesas/pfc-r8a779g0.c  | 112 +++++++--------
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |  25 ++--
 3 files changed, 317 insertions(+), 64 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E91DC780AE8
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Aug 2023 13:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243969AbjHRLSK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Aug 2023 07:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376564AbjHRLR4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2023 07:17:56 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FB7359F
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 04:17:52 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6084:9231:6a:a447])
        by albert.telenet-ops.be with bizsmtp
        id azHp2A00W3wxJeQ06zHphk; Fri, 18 Aug 2023 13:17:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWxU5-0017wq-T6;
        Fri, 18 Aug 2023 13:17:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWxUD-007byX-AQ;
        Fri, 18 Aug 2023 13:17:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Fixes for v6.5 (take two)
Date:   Fri, 18 Aug 2023 13:17:46 +0200
Message-Id: <cover.1692357172.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit bfc374a145ae133613e05b9b89be561f169cb58d:

  pinctrl: renesas: rzg2l: Handle non-unique subnode names (2023-07-10 10:00:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-fixes-for-v6.5-tag2

for you to fetch changes up to 8fcc1c40b747069644db6102c1d84c942c9d4d86:

  pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function} (2023-08-18 13:01:41 +0200)

----------------------------------------------------------------
pinctrl: renesas: Fixes for v6.5 (take two)

  - Fix race conditions in pinctrl group and function creation/remove
    calls on the RZ/G2L, RZ/V2M, and RZ/A2 SoC families.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (3):
      pinctrl: renesas: rzg2l: Fix NULL pointer dereference in rzg2l_dt_subnode_to_map()
      pinctrl: renesas: rzv2m: Fix NULL pointer dereference in rzv2m_dt_subnode_to_map()
      pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function}

 drivers/pinctrl/renesas/pinctrl-rza2.c  | 17 +++++++++++++++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 15 ++++++++++++---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 13 +++++++++++--
 3 files changed, 38 insertions(+), 7 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

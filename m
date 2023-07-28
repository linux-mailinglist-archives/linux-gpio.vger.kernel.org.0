Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0E74766C72
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jul 2023 14:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbjG1MDR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jul 2023 08:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233788AbjG1MCt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2023 08:02:49 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB6B4C31
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 05:01:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by andre.telenet-ops.be with bizsmtp
        id Sc1s2A00k0d1nm801c1tVy; Fri, 28 Jul 2023 14:01:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPMA7-002mJB-Mr;
        Fri, 28 Jul 2023 14:01:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPMAK-00AqR6-S4;
        Fri, 28 Jul 2023 14:01:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.6
Date:   Fri, 28 Jul 2023 14:01:51 +0200
Message-Id: <cover.1690545605.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

The following changes since commit bfc374a145ae133613e05b9b89be561f169cb58d:

  pinctrl: renesas: rzg2l: Handle non-unique subnode names (2023-07-10 10:00:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.6-tag1

for you to fetch changes up to 95eb19869401850f069723b296170b8b3bd5be9e:

  pinctrl: renesas: rzg2l: Use devm_clk_get_enabled() helper (2023-07-25 12:28:45 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.6

  - Use the new devm_clk_get_enabled() helper.

Thanks for pulling!

----------------------------------------------------------------
Christophe JAILLET (1):
      pinctrl: renesas: rzg2l: Use devm_clk_get_enabled() helper

Geert Uytterhoeven (1):
      pinctrl: renesas: rzv2m: Use devm_clk_get_enabled() helper

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 32 +++++---------------------------
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 32 +++++---------------------------
 2 files changed, 10 insertions(+), 54 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

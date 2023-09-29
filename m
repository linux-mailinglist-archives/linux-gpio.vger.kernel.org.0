Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A297B3125
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 13:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbjI2LSx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 07:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjI2LSx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 07:18:53 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733E9BF
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 04:18:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c2e7:1eb0:4c87:ebc6])
        by albert.telenet-ops.be with bizsmtp
        id rnJp2A00H1EgHdD06nJp3G; Fri, 29 Sep 2023 13:18:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBVo-004qOT-LU;
        Fri, 29 Sep 2023 13:18:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBWD-001fy0-KN;
        Fri, 29 Sep 2023 13:18:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.7
Date:   Fri, 29 Sep 2023 13:18:48 +0200
Message-Id: <cover.1695986064.git.geert+renesas@glider.be>
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

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.7-tag1

for you to fetch changes up to c385256611b1af79d180e35c07992b43e1be5067:

  pinctrl: renesas: rzg2l: Rename rzg2l_gpio_configs[] (2023-09-26 09:44:51 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.7

  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      pinctrl: renesas: rzg2l: Make reverse order of enable() for disable()

Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Make struct rzg2l_pinctrl_data::dedicated_pins constant

Geert Uytterhoeven (2):
      pinctrl: renesas: r8a7779: s/LSBC/LBSC/
      pinctrl: renesas: rzg2l: Rename rzg2l_gpio_configs[]

 drivers/pinctrl/renesas/pfc-r8a7779.c   |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 17 +++++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

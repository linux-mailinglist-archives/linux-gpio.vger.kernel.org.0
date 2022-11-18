Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEB262FADB
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 17:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242334AbiKRQy1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 11:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235444AbiKRQy0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 11:54:26 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3F86B237
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 08:54:25 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
        by baptiste.telenet-ops.be with bizsmtp
        id lsuH2800529fmst01suHXY; Fri, 18 Nov 2022 17:54:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4d6-000pGI-QZ; Fri, 18 Nov 2022 17:54:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4d6-00Frpy-C4; Fri, 18 Nov 2022 17:54:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.2
Date:   Fri, 18 Nov 2022 17:54:15 +0100
Message-Id: <cover.1668790226.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.2-tag1

for you to fetch changes up to 80d34260f36c6c55f03c3c33be4a11ec06202e98:

  pinctrl: renesas: gpio: Use dynamic GPIO base if no function GPIOs (2022-11-17 20:34:51 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.2

  - Use dynamic GPIO base on combined pincctrl/gpio controllers on
    SH/R-Mobile SoCs,
  - Miscellaneous improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      pinctrl: renesas: rzv2m: remove unnecessary check from rzv2m_dt_node_to_map()
      pinctrl: renesas: rzg2l: remove unnecessary check from rzg2l_dt_node_to_map()

Geert Uytterhoeven (1):
      pinctrl: renesas: gpio: Use dynamic GPIO base if no function GPIOs

 drivers/pinctrl/renesas/gpio.c          | 10 +++++-----
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |  3 +--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c |  3 +--
 3 files changed, 7 insertions(+), 9 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

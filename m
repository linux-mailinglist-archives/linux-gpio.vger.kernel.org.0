Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 390974B295F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 16:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349478AbiBKPsm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Feb 2022 10:48:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349442AbiBKPsl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Feb 2022 10:48:41 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10131A8
        for <linux-gpio@vger.kernel.org>; Fri, 11 Feb 2022 07:48:39 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d5d:ef67:a872:c0be])
        by xavier.telenet-ops.be with bizsmtp
        id troe260043ZSXJh01roemk; Fri, 11 Feb 2022 16:48:38 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIYA1-000MOb-R4; Fri, 11 Feb 2022 16:48:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIYA1-00GiJ7-5d; Fri, 11 Feb 2022 16:48:37 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.18
Date:   Fri, 11 Feb 2022 16:48:35 +0100
Message-Id: <cover.1644594347.git.geert+renesas@glider.be>
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

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.18-tag1

for you to fetch changes up to 2e08ab0427fe3e33a92a37cfe3b6db340ab7397f:

  pinctrl: renesas: rzg2l: Improve rzg2l_gpio_register() (2022-02-08 09:54:44 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.18

  - Add MOST (MediaLB I/F) pins on R-Car E3 and D3,
  - Add support for the new RZ/V2L SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (3):
      dt-bindings: pinctrl: renesas: Document RZ/V2L pinctrl
      pinctrl: renesas: Kconfig: Select PINCTRL_RZG2L if RZ/V2L SoC is enabled
      pinctrl: renesas: rzg2l: Improve rzg2l_gpio_register()

Geert Uytterhoeven (6):
      pinctrl: renesas: r8a7790: Remove INTC_IRQx_N
      pinctrl: renesas: r8a7791: Remove INTC_IRQx_N
      pinctrl: renesas: r8a779a0: Rename MOD_SEL2_* definitions
      pinctrl: renesas: r8a7779: Restore pin function sort order
      pinctrl: renesas: r8a7790: Restore pin function sort order
      pinctrl: renesas: r8a77995: Restore pin group sort order

Lad Prabhakar (1):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add description for power-source property

Nikita Yushchenko (1):
      pinctrl: renesas: r8a7799[05]: Add MediaLB pins

Wolfram Sang (1):
      pinctrl: renesas: rcar: Do not enforce GPIO if already muxed

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  16 +++-
 drivers/pinctrl/renesas/Kconfig                    |   6 +-
 drivers/pinctrl/renesas/pfc-r8a7779.c              |   8 +-
 drivers/pinctrl/renesas/pfc-r8a7790.c              |  45 ++++------
 drivers/pinctrl/renesas/pfc-r8a7791.c              |  35 ++++----
 drivers/pinctrl/renesas/pfc-r8a77990.c             |  22 ++++-
 drivers/pinctrl/renesas/pfc-r8a77995.c             | 100 ++++++++++++---------
 drivers/pinctrl/renesas/pfc-r8a779a0.c             |  42 ++++-----
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |   4 +-
 drivers/pinctrl/renesas/pinctrl.c                  |   2 +-
 10 files changed, 155 insertions(+), 125 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

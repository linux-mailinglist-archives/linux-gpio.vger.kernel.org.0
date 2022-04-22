Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 959D650BADB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Apr 2022 16:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448723AbiDVO6L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 10:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449023AbiDVO6J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 10:58:09 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A6E1FCFA
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 07:55:14 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
        by baptiste.telenet-ops.be with bizsmtp
        id MqvE2700G2Ah9RF01qvEWf; Fri, 22 Apr 2022 16:55:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugk-001cRE-0T; Fri, 22 Apr 2022 16:55:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugj-00COoY-BL; Fri, 22 Apr 2022 16:55:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.19
Date:   Fri, 22 Apr 2022 16:55:12 +0200
Message-Id: <cover.1650638951.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.19-tag1

for you to fetch changes up to f7bc5f52d2354b41d5a111942be7ee01e5560c78:

  pinctrl: renesas: rzg2l: Restore pin config order (2022-04-20 11:53:47 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.19

  - Add support for the new RZ/G2UL SoC,
  - Add drive-strength support for R-Car E3,
  - Add RPC/QSPI pin groups on R-Car E3 and E3,
  - Miscellaneous fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (2):
      dt-bindings: pinctrl: renesas: Document RZ/G2UL pinctrl
      pinctrl: renesas: rzg2l: Add RZ/G2UL support

Geert Uytterhoeven (6):
      pinctrl: renesas: Simplify multiplication/shift logic
      pinctrl: renesas: checker: Rework drive and bias pin iteration
      pinctrl: renesas: r8a77990: Add RPC pins, groups, and functions
      pinctrl: renesas: r8a77995: Add QSPI and RPC pins, groups, and functions
      pinctrl: renesas: Remove unneeded #include <linux/init.h>
      pinctrl: renesas: rzg2l: Restore pin config order

Lad Prabhakar (1):
      pinctrl: renesas: Select PINCTRL_RZG2L if ARCH_RZG2L is enabled

Wolfram Sang (2):
      pinctrl: renesas: Allow up to 10 fields for drive_regs
      pinctrl: renesas: r8a77990: Add drive-strength

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   5 +-
 drivers/pinctrl/renesas/Kconfig                    |   7 +-
 drivers/pinctrl/renesas/core.c                     |  67 +++----
 drivers/pinctrl/renesas/gpio.c                     |   1 -
 drivers/pinctrl/renesas/pfc-emev2.c                |   1 -
 drivers/pinctrl/renesas/pfc-r8a77990.c             | 120 ++++++++++---
 drivers/pinctrl/renesas/pfc-r8a77995.c             |  98 ++++++++++
 drivers/pinctrl/renesas/pfc-sh7722.c               |   1 -
 drivers/pinctrl/renesas/pfc-sh7723.c               |   1 -
 drivers/pinctrl/renesas/pfc-sh7724.c               |   1 -
 drivers/pinctrl/renesas/pfc-sh7734.c               |   1 -
 drivers/pinctrl/renesas/pfc-sh7757.c               |   1 -
 drivers/pinctrl/renesas/pfc-sh7785.c               |   1 -
 drivers/pinctrl/renesas/pfc-sh7786.c               |   1 -
 drivers/pinctrl/renesas/pfc-shx3.c                 |   1 -
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 200 +++++++++++++--------
 drivers/pinctrl/renesas/pinctrl.c                  |   1 -
 drivers/pinctrl/renesas/sh_pfc.h                   |   7 +-
 18 files changed, 362 insertions(+), 153 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

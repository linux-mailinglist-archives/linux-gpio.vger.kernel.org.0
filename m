Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2488756B884
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 13:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237827AbiGHL1O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 07:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237847AbiGHL1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 07:27:11 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FCC904DD
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 04:27:10 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id sbTA270014C55Sk06bTAd6; Fri, 08 Jul 2022 13:27:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o9m8b-002bbK-Ke; Fri, 08 Jul 2022 13:27:09 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o9m8b-00BLZ4-9G; Fri, 08 Jul 2022 13:27:09 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.20 (take two)
Date:   Fri,  8 Jul 2022 13:27:08 +0200
Message-Id: <cover.1657279527.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 5223c511eb4f919e6b423b2f66e02674e97e77e3:

  pinctrl: renesas: rzg2l: Return -EINVAL for pins which have input disabled (2022-06-06 11:12:22 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.20-tag2

for you to fetch changes up to 36611d28f5130d8bb9aa36ec64d4ebcd736e8dba:

  pinctrl: renesas: r8a779g0: Add missing MODSELx for AVBx (2022-07-05 09:12:37 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.20 (take two)

  - Add support for the RZ/V2M and R-Car V4H SoCs,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (2):
      dt-bindings: pinctrl: renesas: Remove spaces before #define
      pinctrl: renesas: r8a779f0: Remove unused POC2

Kuninori Morimoto (21):
      dt-bindings: pinctrl: renesas,pfc: Document r8a779g0 support
      pinctrl: renesas: Add PORT_GP_CFG_13 macros
      pinctrl: renesas: r8a779g0: Fixup MODSEL8
      pinctrl: renesas: r8a779g0: Remove unused NOGP definitions
      pinctrl: renesas: r8a779g0: Remove unused IPxSRx definitions
      pinctrl: renesas: r8a779g0: Remove unused MOD_SELx definitions
      pinctrl: renesas: r8a779g0: Tidy up ioctrl_regs
      pinctrl: renesas: r8a779g0: Tidyup POC1 voltage
      pinctrl: renesas: r8a779g0: Add missing TCLKx_A/TCLKx_B/TCLKx_X
      pinctrl: renesas: r8a779g0: Add missing IRQx_A/IRQx_B
      pinctrl: renesas: r8a779g0: Add missing HSCIF3_A
      pinctrl: renesas: r8a779g0: Add missing HSCIF1_X
      pinctrl: renesas: r8a779g0: Add missing SCIF3
      pinctrl: renesas: r8a779g0: Add missing SCIF1_X
      pinctrl: renesas: r8a779g0: Add missing CANFD5_B
      pinctrl: renesas: r8a779g0: Add missing TPU0TOx_A
      pinctrl: renesas: r8a779g0: Add missing FlexRay
      pinctrl: renesas: r8a779g0: Add missing PWM
      pinctrl: renesas: r8a779g0: Add missing ERROROUTC_A
      pinctrl: renesas: r8a779g0: Add missing MODSELx for TSN0
      pinctrl: renesas: r8a779g0: Add missing MODSELx for AVBx

LUU HOAI (1):
      pinctrl: renesas: Initial R8A779G0 (R-Car V4H) PFC support

Phil Edworthy (2):
      dt-bindings: pinctrl: Add DT bindings for Renesas RZ/V2M pinctrl
      pinctrl: renesas: Add RZ/V2M pin and gpio controller driver

Phong Hoang (1):
      pinctrl: renesas: r8a779g0: Add pins, groups and functions

 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   |    1 +
 .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml    |  170 +
 drivers/pinctrl/renesas/Kconfig                    |   18 +
 drivers/pinctrl/renesas/Makefile                   |    2 +
 drivers/pinctrl/renesas/core.c                     |    6 +
 drivers/pinctrl/renesas/pfc-r8a779f0.c             |    2 -
 drivers/pinctrl/renesas/pfc-r8a779g0.c             | 4262 ++++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            | 1119 +++++
 drivers/pinctrl/renesas/sh_pfc.h                   |    9 +-
 include/dt-bindings/pinctrl/r7s9210-pinctrl.h      |    2 +-
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h        |    2 +-
 include/dt-bindings/pinctrl/rzv2m-pinctrl.h        |   23 +
 12 files changed, 5610 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779g0.c
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzv2m.c
 create mode 100644 include/dt-bindings/pinctrl/rzv2m-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

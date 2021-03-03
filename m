Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE2532C7A2
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355582AbhCDAcX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380274AbhCCN3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:29:09 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B7CC06121E
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:26:28 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cd47:42a6:c822:e50b])
        by michel.telenet-ops.be with bizsmtp
        id bpSR2400M4huzR806pSRho; Wed, 03 Mar 2021 14:26:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWD-004Ps0-EN; Wed, 03 Mar 2021 14:26:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWC-00GWV3-Lp; Wed, 03 Mar 2021 14:26:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] pinctrl: renesas: Bias improvements and r8a7791 support
Date:   Wed,  3 Mar 2021 14:26:13 +0100
Message-Id: <20210303132619.3938128-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

This patch series improves the existing bias support in the Renesas Pin
Function Controller driver, and adds pull-up and pull-down support for
the R-Car M2-W and M2-N, and RZ/G1M and RZ/G1N SoCs.

The latter has been tested on the Koelsch development board by measuring
the voltages on the GP5_[0-3] pins when the software switches (SW2) are
closed:
  - With internal bias disabled, the 2kΩ external pull-down resistors
    pull the GPIO lines all the way to GND,
  - With internal pull-up enabled, the internal pull-up resistors and the
    external pull-down resistors form a voltage divider, showing the
    internal pull-up resistors have a value of ca. 45kΩ.

To be queued in renesas-pinctrl-for-v5.13.

Thanks for your comments!

Geert Uytterhoeven (6):
  pinctrl: renesas: Make sh_pfc_pin_to_bias_reg() static
  pinctrl: renesas: Move R-Car bias helpers to sh_pfc.h
  pinctrl: renesas: Factor out common R-Mobile bias handling
  pinctrl: renesas: Add PORT_GP_CFG_7 macros
  pinctrl: renesas: Add support for R-Car SoCs with pull-down only pins
  pinctrl: renesas: r8a7791: Add bias pinconf support

 drivers/pinctrl/renesas/core.c         |  20 --
 drivers/pinctrl/renesas/core.h         |   8 -
 drivers/pinctrl/renesas/pfc-r8a73a4.c  |  48 +--
 drivers/pinctrl/renesas/pfc-r8a7740.c  |  46 +--
 drivers/pinctrl/renesas/pfc-r8a7778.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 387 ++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7792.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a77950.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77951.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a7796.c  |   1 -
 drivers/pinctrl/renesas/pfc-r8a77965.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77970.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77980.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77990.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a77995.c |   1 -
 drivers/pinctrl/renesas/pfc-r8a779a0.c |   1 -
 drivers/pinctrl/renesas/pfc-sh73a0.c   |  46 +--
 drivers/pinctrl/renesas/pinctrl.c      | 109 +++++--
 drivers/pinctrl/renesas/sh_pfc.h       |  24 +-
 19 files changed, 497 insertions(+), 202 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

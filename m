Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5D46B0862
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjCHNTe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:19:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjCHNSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:18:44 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786C1D1625
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:15:34 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by baptiste.telenet-ops.be with bizsmtp
        id VpFM2900U3mNwr401pFMCM; Wed, 08 Mar 2023 14:15:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZtd1-00BF1f-6m;
        Wed, 08 Mar 2023 14:15:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZrFu-00FUev-14;
        Wed, 08 Mar 2023 11:42:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/8] pinctrl: renesas: rcar: power-source improvements
Date:   Wed,  8 Mar 2023 11:42:36 +0100
Message-Id: <cover.1678271030.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

This patch series contains various improvements related to power-source
handling in the Renesas R-Car pin control drivers:
  - Retain I/O voltage level configuration across s2ram on R-Car D3,
  - Add support for 1.8V/2.5V I/O voltage levels,
  - Add support for I/O voltage level configuration for the EtherAVB,
    Gigabit Ethernet, and Ethernet TSN I/O pins on R-Car V3M, V3H, E3,
    D3, and V4H.

As I/O voltage level configuration is not something you want to change
without consideration, I tested this by verifying that adding e.g.

    {
	pins = "PIN_VDDQ_AVB0";
	power-source = <2500>;
    };

to the PFC node in DT triggers the right code paths.

As usual, I plan to queue these in renesas-pinctrl-for-v6.4.
Thanks for your comments!

Geert Uytterhoeven (8):
  pinctrl: renesas: r8a77995: Retain POCCTRL0 register across
    suspend/resume
  pinctrl: renesas: rcar: Phase out old SH_PFC_PIN_CFG_IO_VOLTAGE flag
  pinctrl: renesas: Add support for 1.8V/2.5V I/O voltage levels
  pinctrl: renesas: r8a77970: Add support for AVB power-source
  pinctrl: renesas: r8a77980: Add support for AVB/GE power-sources
  pinctrl: renesas: r8a77990: Add support for AVB power-source
  pinctrl: renesas: r8a77995: Add support for AVB power-source
  pinctrl: renesas: r8a779g0: Add support for AVB/TSN power-sources

 drivers/pinctrl/renesas/core.c         |  4 +--
 drivers/pinctrl/renesas/pfc-r8a77470.c | 44 +++++++++++------------
 drivers/pinctrl/renesas/pfc-r8a7790.c  |  2 +-
 drivers/pinctrl/renesas/pfc-r8a7791.c  |  2 +-
 drivers/pinctrl/renesas/pfc-r8a7794.c  | 48 +++++++++++++-------------
 drivers/pinctrl/renesas/pfc-r8a77951.c |  4 +--
 drivers/pinctrl/renesas/pfc-r8a7796.c  |  4 +--
 drivers/pinctrl/renesas/pfc-r8a77965.c |  4 +--
 drivers/pinctrl/renesas/pfc-r8a77970.c | 34 ++++++++++++------
 drivers/pinctrl/renesas/pfc-r8a77980.c | 45 ++++++++++++++++--------
 drivers/pinctrl/renesas/pfc-r8a77990.c | 33 +++++++++++-------
 drivers/pinctrl/renesas/pfc-r8a77995.c | 44 ++++++++++++++---------
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 45 +++++++++++++++++++-----
 drivers/pinctrl/renesas/pinctrl.c      | 22 ++++++------
 drivers/pinctrl/renesas/sh_pfc.h       | 13 +++----
 15 files changed, 211 insertions(+), 137 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

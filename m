Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C9747E49B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348864AbhLWOmP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243905AbhLWOmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:15 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4199DC061756
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:14 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by albert.telenet-ops.be with bizsmtp
        id ZqiC2600L1rdBcm06qiCq1; Thu, 23 Dec 2021 15:42:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a8t-99; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIJ-003rYG-NY; Thu, 23 Dec 2021 15:42:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/60] pinctrl: renesas: Share more pin group data
Date:   Thu, 23 Dec 2021 15:41:10 +0100
Message-Id: <cover.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

It is fairly common for the pins in a pin group to be a subset of the
pins in another pin group, e.g. in case of resizable buses.  Currently
we have support for sharing pin data for VIN (video-in), where the
number of data lanes used can be varied.

This patch series, after a few customary cleanups, adds the
infastructure for defining pin groups that share pin data with another
group, either as an arbitrary subset, or as a resizable bus, and
converts lots of existing pin groups to make use of this.  This not only
saves memory, but also makes it easier to review future support for new
SoCs and for new pin groups on existing SoCs.

This reduces kernel size for a kernel including all Renesas pin control
drivers by ca. 5 KiB.

If accepted, I intend to queue this in renesas-pinctrl for v5.18.
Thanks for your comments!

Geert Uytterhoeven (60):
  pinctrl: renesas: r8a77470: Reduce size for narrow VIN1 channel
  pinctrl: renesas: Rename sh_pfc_soc_operations instances
  pinctrl: renesas: Reformat macros defining struct initializers
  pinctrl: renesas: Rename SH_PFC_PIN_GROUP{,_ALIAS} args
  pinctrl: renesas: Add generic support for pin group subsets
  pinctrl: renesas: Add generic support for resizable buses
  pinctrl: renesas: r8a7740: Share BSC pin group data
  pinctrl: renesas: emev2: Share CF pin group data
  pinctrl: renesas: r8a7791: Share HSCIF1 pin group data
  pinctrl: renesas: sh73a0: Share KEYIN pin group data
  pinctrl: renesas: r8a7740: Share LCD pin group data
  pinctrl: renesas: sh73a0: Share LCD pin group data
  pinctrl: renesas: r8a73a4: Share MMC pin group data
  pinctrl: renesas: r8a7740: Share MMC pin group data
  pinctrl: renesas: r8a77470: Share MMC pin group data
  pinctrl: renesas: r8a7778: Share MMC pin group data
  pinctrl: renesas: r8a7779: Share MMC pin group data
  pinctrl: renesas: r8a7790: Share MMC pin group data
  pinctrl: renesas: r8a7791: Share MMC pin group data
  pinctrl: renesas: r8a7794: Share MMC pin group data
  pinctrl: renesas: r8a77970: Share MMC pin group data
  pinctrl: renesas: r8a77980: Share MMC pin group data
  pinctrl: renesas: r8a77995: Share MMC pin group data
  pinctrl: renesas: r8a779a0: Share MMC pin group data
  pinctrl: renesas: sh73a0: Share MMC pin group data
  pinctrl: renesas: r8a77470: Share QSPI pin group data
  pinctrl: renesas: r8a7790: Share QSPI pin group data
  pinctrl: renesas: r8a7791: Share QSPI pin group data
  pinctrl: renesas: r8a7792: Share QSPI pin group data
  pinctrl: renesas: r8a7794: Share QSPI pin group data
  pinctrl: renesas: r8a77950: Share QSPI pin group data
  pinctrl: renesas: r8a77951: Share QSPI pin group data
  pinctrl: renesas: r8a77965: Share QSPI pin group data
  pinctrl: renesas: r8a7796: Share QSPI pin group data
  pinctrl: renesas: r8a77990: Share QSPI pin group data
  pinctrl: renesas: r8a779a0: Share QSPI pin group data
  pinctrl: renesas: r8a77970: Share RPC pin group data
  pinctrl: renesas: r8a77980: Share RPC pin group data
  pinctrl: renesas: r8a73a4: Share SDHI pin group data
  pinctrl: renesas: r8a7740: Share SDHI pin group data
  pinctrl: renesas: r8a77470: Share SDHI pin group data
  pinctrl: renesas: r8a7778: Share SDHI pin group data
  pinctrl: renesas: r8a7779: Share SDHI pin group data
  pinctrl: renesas: r8a7790: Share SDHI pin group data
  pinctrl: renesas: r8a7791: Share SDHI pin group data
  pinctrl: renesas: r8a7792: Share SDHI pin group data
  pinctrl: renesas: r8a7794: Share SDHI pin group data
  pinctrl: renesas: r8a77950: Share SDHI pin group data
  pinctrl: renesas: r8a77951: Share SDHI pin group data
  pinctrl: renesas: r8a77965: Share SDHI pin group data
  pinctrl: renesas: r8a7796: Share SDHI pin group data
  pinctrl: renesas: r8a77990: Share SDHI pin group data
  pinctrl: renesas: sh73a0: Share SDHI pin group data
  pinctrl: renesas: emev2: Share SDI pin group data
  pinctrl: renesas: r8a7790: Share USB1 pin group data
  pinctrl: renesas: r8a7790: Share more VIN pin group data
  pinctrl: renesas: r8a77951: Share more VIN pin group data
  pinctrl: renesas: r8a7796: Share more VIN pin group data
  pinctrl: renesas: r8a77965: Share more VIN pin group data
  pinctrl: renesas: r8a77990: Share more VIN pin group data

 drivers/pinctrl/renesas/pfc-emev2.c    |  71 +---
 drivers/pinctrl/renesas/pfc-r8a73a4.c  |  93 ++---
 drivers/pinctrl/renesas/pfc-r8a7740.c  | 276 +++-----------
 drivers/pinctrl/renesas/pfc-r8a77470.c | 237 +++++-------
 drivers/pinctrl/renesas/pfc-r8a7778.c  |  69 ++--
 drivers/pinctrl/renesas/pfc-r8a7779.c  | 110 ++----
 drivers/pinctrl/renesas/pfc-r8a7790.c  | 483 ++++++++++---------------
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 285 ++++++---------
 drivers/pinctrl/renesas/pfc-r8a7792.c  | 446 +++++++++++------------
 drivers/pinctrl/renesas/pfc-r8a7794.c  | 209 ++++-------
 drivers/pinctrl/renesas/pfc-r8a77950.c | 116 ++----
 drivers/pinctrl/renesas/pfc-r8a77951.c | 310 ++++++----------
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 312 ++++++----------
 drivers/pinctrl/renesas/pfc-r8a77965.c | 330 ++++++-----------
 drivers/pinctrl/renesas/pfc-r8a77970.c | 162 +++------
 drivers/pinctrl/renesas/pfc-r8a77980.c | 190 ++++------
 drivers/pinctrl/renesas/pfc-r8a77990.c | 308 ++++++----------
 drivers/pinctrl/renesas/pfc-r8a77995.c |  98 ++---
 drivers/pinctrl/renesas/pfc-r8a779a0.c |  60 +--
 drivers/pinctrl/renesas/pfc-sh73a0.c   | 265 +++-----------
 drivers/pinctrl/renesas/sh_pfc.h       | 161 ++++-----
 21 files changed, 1536 insertions(+), 3055 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

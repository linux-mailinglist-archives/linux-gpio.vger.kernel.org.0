Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B683B8564
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 16:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235715AbhF3OxS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 10:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235621AbhF3OxS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 10:53:18 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3D3C061767
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jun 2021 07:50:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7d95:f75f:5ece:4663])
        by xavier.telenet-ops.be with bizsmtp
        id PSql250034F6zkK01SqlE1; Wed, 30 Jun 2021 16:50:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lybY4-0059dJ-Rw; Wed, 30 Jun 2021 16:50:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lybY4-005c5x-9t; Wed, 30 Jun 2021 16:50:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] pinctrl: renesas: Add r8a77995 bias pinconf support
Date:   Wed, 30 Jun 2021 16:50:41 +0200
Message-Id: <cover.1625064076.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

This patch series adds a small optimization to R-Car pin bias handling,
and adds bias pinconf support for the R-Car D3 SoC.

Changes compared to v1[1]:
  - Drop all accepted patches,
  - Add [PATCH v2 1/2],
  - Add Reviewed-by,
  - Fix NFRE# and NFWE# handling, now we received confirmation that the
    documentation is correct.

The first patch has been tested on Koelsch and Salvator-XS.
The second patch has been tested on a remote Draak development board by
specifying one of the "bias-{pull-{down,enable},disable}" properties for
the "GP_3_0" and "GP_3_1" pins from DT, and inspecting the impact on the
PUEN2 and PUD2 registers.  Due to the remote setup, actual voltage
levels could not be measured.  Note that enabling pull-down for "GP_3_0"
breaks eMMC operation, as this pin is used as the eMMC's "CMD" signal.

I plan to queue this in renesas-pinctrl for v5.15.

Thanks for your comments!

[1] [PATCH 00/12] pinctrl: renesas: Add more bias pinconf support
    https://lore.kernel.org/linux-renesas-soc/cover.1619785375.git.geert+renesas@glider.be/

Geert Uytterhoeven (2):
  pinctrl: renesas: rcar: Avoid changing PUDn when disabling bias
  pinctrl: renesas: r8a77995: Add bias pinconf support

 drivers/pinctrl/renesas/pfc-r8a77995.c | 320 ++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pinctrl.c      |  16 +-
 drivers/pinctrl/renesas/sh_pfc.h       |   3 +
 3 files changed, 323 insertions(+), 16 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

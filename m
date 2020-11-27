Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BC32C6716
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Nov 2020 14:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729888AbgK0NnJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Nov 2020 08:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729592AbgK0NnI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2020 08:43:08 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D47C0613D1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2020 05:43:08 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id xRj62300Z4C55Sk06Rj6Bw; Fri, 27 Nov 2020 14:43:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kie1i-0065Xo-Hf; Fri, 27 Nov 2020 14:43:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kie1i-000Kd1-0K; Fri, 27 Nov 2020 14:43:06 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.11 (take two)
Date:   Fri, 27 Nov 2020 14:43:04 +0100
Message-Id: <20201127134304.79252-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit d4aac7d439c2d9307cb5137fc285464a36978107:

  pinctrl: renesas: Constify sh73a0_vccq_mc0_ops (2020-11-13 15:37:41 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.11-tag2

for you to fetch changes up to 7ba4a9591a8ac058bf976485975f78128c273800:

  pinctrl: renesas: Fix fall-through warnings for Clang (2020-11-23 09:47:28 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.11 (take two)

  - Add QSPI pin groups on R-Car E3, H3, M3-W/W+, and M3-N,
  - A small fix for a Clang warning.

Thanks for pulling!
----------------------------------------------------------------
Gustavo A. R. Silva (1):
      pinctrl: renesas: Fix fall-through warnings for Clang

Lad Prabhakar (4):
      pinctrl: renesas: r8a77990: Add QSPI[01] pins, groups and functions
      pinctrl: renesas: r8a77951: Add QSPI[01] pins, groups and functions
      pinctrl: renesas: r8a7796: Add QSPI[01] pins, groups and functions
      pinctrl: renesas: r8a77965: Add QSPI[01] pins, groups and functions

 drivers/pinctrl/renesas/pfc-r8a77951.c | 75 +++++++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 75 +++++++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 75 +++++++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77990.c | 75 +++++++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pinctrl-rza1.c |  1 +
 5 files changed, 293 insertions(+), 8 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46D73417F7
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 10:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhCSJIU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 05:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhCSJH6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 05:07:58 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E9CC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 19 Mar 2021 02:07:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
        by baptiste.telenet-ops.be with bizsmtp
        id i97w2400A3CXdgx0197waY; Fri, 19 Mar 2021 10:07:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNB6p-008kqc-RX; Fri, 19 Mar 2021 10:07:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNB6p-00BNGn-B6; Fri, 19 Mar 2021 10:07:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.13
Date:   Fri, 19 Mar 2021 10:07:49 +0100
Message-Id: <20210319090749.2711012-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.13-tag1

for you to fetch changes up to f7adcca27edf05fc1f061a9e5de059fe179f0e1c:

  pinctrl: renesas: r8a77965: Add vin4_g8 and vin5_high8 pins (2021-03-10 10:50:26 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.13

  - Add pin groups for the green and high8 subsets of the Video IN (VIN)
    pins on R-Car H3 ES2.0+, R-Car M3-W/M3-W+, R-Car M3-N, and R-Car E3.

Thanks for pulling!

----------------------------------------------------------------
Niklas Söderlund (4):
      pinctrl: renesas: r8a77951: Add vin4_g8 and vin5_high8 pins
      pinctrl: renesas: r8a7796: Add vin4_g8 and vin5_high8 pins
      pinctrl: renesas: r8a77990: Add vin4_g8 and vin5_high8 pins
      pinctrl: renesas: r8a77965: Add vin4_g8 and vin5_high8 pins

 drivers/pinctrl/renesas/pfc-r8a77951.c | 30 +++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 30 +++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 34 +++++++++++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77990.c | 34 +++++++++++++++++++++++++++++++++-
 4 files changed, 124 insertions(+), 4 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

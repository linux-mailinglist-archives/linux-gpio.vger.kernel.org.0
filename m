Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04F229D89E
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387997AbgJ1Wep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:34:45 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:46460 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387992AbgJ1Wb5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:31:57 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CLrFD3yJszMv9Sb
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:15:12 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id lSFC2300F4C55Sk01SFCF2; Wed, 28 Oct 2020 15:15:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEJ-000oZ4-Qx; Wed, 28 Oct 2020 15:15:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEJ-007FpR-Aw; Wed, 28 Oct 2020 15:15:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] gpio: rcar: Cleanups and improvements
Date:   Wed, 28 Oct 2020 15:15:00 +0100
Message-Id: <20201028141504.1729093-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus, Bartosz,

This patch series contains a few cleanups and improvements for the R-Car
GPIO driver.  All four patches are independent.

The gpio_chip.get_multiple() implementation has been tested on R-Car
Gen2 and Gen3.

Thanks for your comments!

Geert Uytterhoeven (4):
  gpio: rcar: Cache gpiochip_get_data() return value
  gpio: rcar: Align register offsets
  gpio: rcar: Rework hardware features handling
  gpio: rcar: Implement gpio_chip.get_multiple()

 drivers/gpio/gpio-rcar.c | 87 ++++++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 29 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

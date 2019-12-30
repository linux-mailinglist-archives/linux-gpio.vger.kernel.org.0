Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C731512D060
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 14:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbfL3Ni7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 08:38:59 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:36652 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727465AbfL3Ni7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Dec 2019 08:38:59 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id kDeu210095USYZQ01Deuat; Mon, 30 Dec 2019 14:38:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilvG2-0001h2-IO; Mon, 30 Dec 2019 14:38:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilvG2-0001Xo-Fu; Mon, 30 Dec 2019 14:38:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs
Date:   Mon, 30 Dec 2019 14:38:50 +0100
Message-Id: <20191230133852.5890-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

As GPIO hogs are configured at GPIO controller initialization time,
adding/removing GPIO hogs in Device Tree overlays currently does not
work.  Hence this patch series adds support for that, by registering an
of_reconfig notifier, as is already done for platform, i2c, and SPI
devices.

Perhaps this would be better served through a pinctrl-gpio driver?
Pinctrl is already working fine with DT overlays, as the pinctrl-*
properties are part of the slave device node, and thus looked up at
slave device node attachment time, not at pin controller initialization
time.

In my particular use case (talking to SPI devices connected to a PMOD
connector on the RSK+RZA1 development board), the GPIO performs board
level muxing of a.o. the SPI MOSI/MISO/SCK signals.  Hence the hog
really needs to be active only while talking to the SPI device, so the
muxing could (in theory) be done upon demand.
But how to describe that in DT, and implement it (using Runtime PM?)?

Thanks for your comments!

Geert Uytterhoeven (2):
  gpio: of: Extract of_gpiochip_add_hog()
  gpio: of: Add DT overlay support for GPIO hogs

 drivers/gpio/gpiolib-of.c | 133 +++++++++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib-of.h |   2 +
 drivers/gpio/gpiolib.c    |  14 +++-
 drivers/gpio/gpiolib.h    |   3 +
 4 files changed, 133 insertions(+), 19 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E217DAB43D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 10:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391675AbfIFIpp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 04:45:45 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:33692 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391690AbfIFIpp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 04:45:45 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id y8lg2000x05gfCL018lhml; Fri, 06 Sep 2019 10:45:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i69sC-0003Mz-T2; Fri, 06 Sep 2019 10:45:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i69sC-0005h1-QK; Fri, 06 Sep 2019 10:45:40 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] gpio: API boundary cleanups
Date:   Fri,  6 Sep 2019 10:45:35 +0200
Message-Id: <20190906084539.21838-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus, Bartosz,

This patch series contains various API boundary cleanups for gpiolib:
  - The first two patches make two functions private,
  - The last two patches switch the remaining gpiolib exported functions
    from EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL().

After this there is only a single GPIO driver function exported with
EXPORT_SYMBOL();

    drivers/gpio/gpio-htc-egpio.c:EXPORT_SYMBOL(htc_egpio_get_wakeup_irq);

I believe this symbol was never used upstream, and may be a relic of the
original out-of-tree code the htc-egpio was based on.  I don't know if
there (still) exist out-of-tree users of the symbol.

Thanks for your comments!

Geert Uytterhoeven (4):
  gpio: of: Make of_get_named_gpiod_flags() private
  gpio: of: Make of_gpio_simple_xlate() private
  gpio: of: Switch to EXPORT_SYMBOL_GPL()
  gpio: devres: Switch to EXPORT_SYMBOL_GPL()

 drivers/gpio/gpiolib-devres.c | 28 ++++++++++++++--------------
 drivers/gpio/gpiolib-of.c     | 16 ++++++++--------
 drivers/gpio/gpiolib-of.h     |  7 -------
 include/linux/of_gpio.h       | 11 -----------
 4 files changed, 22 insertions(+), 40 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

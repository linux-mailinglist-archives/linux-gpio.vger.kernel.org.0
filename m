Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEB5210A79
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 13:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730453AbgGALmW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jul 2020 07:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730347AbgGALmV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jul 2020 07:42:21 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D951DC03E979
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2020 04:42:20 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:503c:ab8:1424:9638])
        by michel.telenet-ops.be with bizsmtp
        id xniJ2200z49uj5306niJUo; Wed, 01 Jul 2020 13:42:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqb84-0006Pq-6w; Wed, 01 Jul 2020 13:42:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqb84-0002EB-4V; Wed, 01 Jul 2020 13:42:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] gpio: aggregator: Misc parsing improvements
Date:   Wed,  1 Jul 2020 13:42:10 +0200
Message-Id: <20200701114212.8520-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus, Bartosz, Andy,

This patch series contains two improvements for the parsing code in the
GPIO Aggregator.

The second one converts the driver to use bitmap_parselist() for parsing
GPIO offsets and/or ranges, as suggested by Andy[1].  This should have
no impact on the format of the configuration parameters written to the
"new_device" virtual file in sysfs.

Changes compared to v1:
  - Rename mask to bitmap,
  - Allocate bitmap dynamically.

Thanks for your comments!

[1] https://lore.kernel.org/r/20200520121420.GA1867563@smile.fi.intel.com

Geert Uytterhoeven (2):
  gpio: aggregator: Drop pre-initialization in get_arg()
  gpio: aggregator: Use bitmap_parselist() for parsing GPIO offsets

 drivers/gpio/gpio-aggregator.c | 63 +++++++++++++++-------------------
 1 file changed, 28 insertions(+), 35 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 460D9165E0C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 14:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgBTNCA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 08:02:00 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:34966 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbgBTNCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 08:02:00 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 511u220045USYZQ0611udL; Thu, 20 Feb 2020 14:01:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j4lSj-000563-VA; Thu, 20 Feb 2020 14:01:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j4lSj-0007LK-Ss; Thu, 20 Feb 2020 14:01:53 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] gpio: of: Add DT overlay support for GPIO hogs
Date:   Thu, 20 Feb 2020 14:01:47 +0100
Message-Id: <20200220130149.26283-1-geert+renesas@glider.be>
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

Changes compared to v1[1]:
  - Drop RFC state,
  - Document that modifying existing gpio-hog nodes is not supported.

After I posted v1, Frank created a unittest[2] to demonstrate the
problem, and to verify to my series fixes it (thanks a lot!).

Thanks!

[1] "[PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs"
    https://lore.kernel.org/r/20191230133852.5890-1-geert+renesas@glider.be/
[2] "[RFC PATCH 0/2] of: unittest: add overlay gpio test to catch gpio hog
     problem"
    https://lore.kernel.org/r/1579070828-18221-1-git-send-email-frowand.list@gmail.com/

Geert Uytterhoeven (2):
  gpio: of: Extract of_gpiochip_add_hog()
  gpio: of: Add DT overlay support for GPIO hogs

 drivers/gpio/gpiolib-of.c | 139 +++++++++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib-of.h |   2 +
 drivers/gpio/gpiolib.c    |  14 +++-
 drivers/gpio/gpiolib.h    |   3 +
 4 files changed, 139 insertions(+), 19 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

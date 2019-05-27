Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A78852B584
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 14:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfE0Mky (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 08:40:54 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:50612 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbfE0Mky (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 May 2019 08:40:54 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id HQgs2000C3XaVaC06Qgs0t; Mon, 27 May 2019 14:40:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvs-0001Wq-7s; Mon, 27 May 2019 14:40:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvs-0001za-4u; Mon, 27 May 2019 14:40:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] gpio: em: Miscellaneous probe cleanups
Date:   Mon, 27 May 2019 14:40:49 +0200
Message-Id: <20190527124051.7615-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus, Bartosz,

This small series contains two cleanups for the GPIO driver for the
venerable Renesas EMMA Mobile EV2 SoC.

These are compile-tested only, due to lack of hardware.

Thanks!

Geert Uytterhoeven (2):
  gpio: em: Remove error messages on out-of-memory conditions
  gpio: em: Return early on error in em_gio_probe()

 drivers/gpio/gpio-em.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A1E192508
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 11:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbgCYKEp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 06:04:45 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:59652 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbgCYKEp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 06:04:45 -0400
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Ja4k220025USYZQ01a4kxS; Wed, 25 Mar 2020 11:04:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jH2tw-00033t-12; Wed, 25 Mar 2020 11:04:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jH2tw-0003ed-01; Wed, 25 Mar 2020 11:04:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] gpiolib: gpio_set_config() cleanups
Date:   Wed, 25 Mar 2020 11:04:37 +0100
Message-Id: <20200325100439.14000-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus, Bartosz,

This patch sets reworks the parameters for gpio_set_config() and
gpio_set_bias(), which simplifies callers, and slightly reduces the
number of lines of code.

Thanks for your comments!

Geert Uytterhoeven (2):
  gpiolib: Pass gpio_desc to gpio_set_config()
  gpiolib: Remove unused gpio_chip parameter from gpio_set_bias()

 drivers/gpio/gpiolib.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

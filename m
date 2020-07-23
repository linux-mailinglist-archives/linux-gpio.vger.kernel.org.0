Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA81222ABFB
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 11:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgGWJ6f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 05:58:35 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:38606 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgGWJ6e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 05:58:34 -0400
Date:   Thu, 23 Jul 2020 09:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595498312;
        bh=6/9OfX8oo7tier4F9ccI5S6tGS46aEe5mHV1Yh3/wKw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=tzd4jMuUKXL9PxB3ubqC7OU8FdjRyt1oaj1GZcBDO54d2f+Ba0ldP5EDvHkVLvUfW
         /Z/fRn45OFM2ENG3WcIpz6jtBzOgywqlhqBj011XHtZ5HhCwbNtAgvKda700Mvp6lv
         +J3J4kkhQlSllDxRGvKDwg6njS/1zY0rTxcsglQU=
To:     linus.walleij@linaro.org
From:   Colton Lewis <colton.w.lewis@protonmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Colton Lewis <colton.w.lewis@protonmail.com>
Reply-To: Colton Lewis <colton.w.lewis@protonmail.com>
Subject: [PATCH v2] gpio: Correct kernel-doc inconsistency
Message-ID: <20200723095658.234668-1-colton.w.lewis@protonmail.com>
In-Reply-To: <CACRpkdbGzKbnj3ocEO5wTO1edB9ov_1BRh=hh6wC8EYyZd1arw@mail.gmail.com>
References: <20200719210926.152305-1-colton.w.lewis@protonmail.com> <CACRpkdbGzKbnj3ocEO5wTO1edB9ov_1BRh=hh6wC8EYyZd1arw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix kernel-doc comment to match parameter name change "chip" to "gc"
in gpiochip_add_data function.

Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
---
 include/linux/gpio/driver.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index db82451776fc..6e9f1826ecd7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -497,25 +497,25 @@ extern int gpiochip_add_data_with_key(struct gpio_chi=
p *gc, void *data,
=20
 /**
  * gpiochip_add_data() - register a gpio_chip
- * @gc: the chip to register, with chip->base initialized
+ * @gc: the chip to register, with gc->base initialized
  * @data: driver-private data associated with this chip
  *
  * Context: potentially before irqs will work
  *
  * When gpiochip_add_data() is called very early during boot, so that GPIO=
s
- * can be freely used, the chip->parent device must be registered before
+ * can be freely used, the gc->parent device must be registered before
  * the gpio framework's arch_initcall().  Otherwise sysfs initialization
  * for GPIOs will fail rudely.
  *
  * gpiochip_add_data() must only be called after gpiolib initialization,
  * ie after core_initcall().
  *
- * If chip->base is negative, this requests dynamic assignment of
+ * If gc->base is negative, this requests dynamic assignment of
  * a range of valid GPIOs.
  *
  * Returns:
  * A negative errno if the chip can't be registered, such as because the
- * chip->base is invalid or already associated with a different chip.
+ * gc->base is invalid or already associated with a different chip.
  * Otherwise it returns zero as a success code.
  */
 #ifdef CONFIG_LOCKDEP
--=20
2.26.2



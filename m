Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDB9716414C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 11:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgBSKRM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 05:17:12 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45111 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgBSKRM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 05:17:12 -0500
Received: by mail-ot1-f66.google.com with SMTP id 59so22599722otp.12;
        Wed, 19 Feb 2020 02:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GJAqVwXdCZXPTne0AiTX4Fk1uxObKIcjDphAbJJ660k=;
        b=q2Gzjl9HuMen1wCAAI9CmaFnjtFH+hhjKyFKWC1FHFAG2fuRnJWJ3dc36IiZGTliii
         Qr5swYw5AAwaJR/VoF6Ib9ahaWgnWDW27pc5C4WrE8CZTW3EwORywr/6rMK5/r1bamnz
         hfxVSh4nWn6MACSaO3MKLLedDWhsNKUiwObN0L+ePjA3th5X8MAQp5IuSAIupNTNgA5x
         r50XSXQjL/Pe+kVnj+F61TClq5HLlfv+uIFmcxAGI3hOWzWVCHzBFQQVEMA2essz/HC/
         fG9sEjVUjl0ilb2w93Du2sxLt+H0iBgjt7XUIZY+HlYD4uuisrGdYqZ9Yo/wF3Z6O7px
         SqmQ==
X-Gm-Message-State: APjAAAV8nxCB3RI1PNqrBtwTDHirbqBY9vaE2CzT3aylLYZNF61rFm26
        zYWCkPTQ+wBmCwipf20hAPLEG7UtWRbety8E8es=
X-Google-Smtp-Source: APXvYqzZrdQJH/Cfn4il9kL1X9oAi45ce4JPx5PKjIVPqq1ze44X+v1H30gqpKR+Zhq1zOgAfO3sVmnLElkeTuTigJI=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr4220978otk.145.1582107430981;
 Wed, 19 Feb 2020 02:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be> <20200218151812.7816-3-geert+renesas@glider.be>
In-Reply-To: <20200218151812.7816-3-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Feb 2020 11:17:00 +0100
Message-ID: <CAMuHMdVzkN5c1P3=xD5BzC=R-O8fWJfMRdDtWxcTLO0TUy5n1Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] gpiolib: Add support for GPIO line table lookup
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 4:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Currently GPIOs can only be referred to by GPIO controller and offset in
> GPIO lookup tables.
>
> Add support for looking them up by line name.
> Rename gpiod_lookup.chip_label to gpiod_lookup.key, to make it clear
> that this field can have two meanings, and update the kerneldoc and
> GPIO_LOOKUP*() macros.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

> --- a/include/linux/gpio/machine.h
> +++ b/include/linux/gpio/machine.h
> @@ -20,8 +20,9 @@ enum gpio_lookup_flags {
>
>  /**
>   * struct gpiod_lookup - lookup table
> - * @chip_label: name of the chip the GPIO belongs to
> - * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
> + * @key: either the name of the chip the GPIO belongs to, or the GPIO line name
> + * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO, or
> + *              U16_MAX to indicate that @key is a GPIO line name
>   * @con_id: name of the GPIO from the device's point of view
>   * @idx: index of the GPIO in case several GPIOs share the same name
>   * @flags: bitmask of gpio_lookup_flags GPIO_* values
> @@ -30,7 +31,7 @@ enum gpio_lookup_flags {
>   * functions using platform data.
>   */
>  struct gpiod_lookup {
> -       const char *chip_label;
> +       const char *key;
>         u16 chip_hwnum;
>         const char *con_id;
>         unsigned int idx;

This needs an update in the documentation:

--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -113,13 +113,15 @@ files that desire to do so need to include the
following header::
 GPIOs are mapped by the means of tables of lookups, containing instances of the
 gpiod_lookup structure. Two macros are defined to help declaring such
mappings::

-       GPIO_LOOKUP(chip_label, chip_hwnum, con_id, flags)
-       GPIO_LOOKUP_IDX(chip_label, chip_hwnum, con_id, idx, flags)
+       GPIO_LOOKUP(key, chip_hwnum, con_id, flags)
+       GPIO_LOOKUP_IDX(key, chip_hwnum, con_id, idx, flags)

 where

-  - chip_label is the label of the gpiod_chip instance providing the GPIO
-  - chip_hwnum is the hardware number of the GPIO within the chip
+  - key is either the label of the gpiod_chip instance providing the GPIO, or
+    the GPIO line name
+  - chip_hwnum is the hardware number of the GPIO within the chip, or U16_MAX
+    to indicate that key is a GPIO line name
   - con_id is the name of the GPIO function from the device point of view. It
        can be NULL, in which case it will match any function.
   - idx is the index of the GPIO within the function.


Furthermore, a few drivers populate the gpiod_lookup members directly,
instead of using the convenience macros:

    arch/arm/mach-integrator/impd1.c
    drivers/i2c/busses/i2c-i801.c
    drivers/mfd/sm501.c

Either they have to be updated s/chip_label/key/, or start using the macros,
e.g.

--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1444,9 +1444,9 @@ static int i801_add_mux(struct i801_priv *priv)
                return -ENOMEM;
        lookup->dev_id = "i2c-mux-gpio";
        for (i = 0; i < mux_config->n_gpios; i++) {
-               lookup->table[i].chip_label = mux_config->gpio_chip;
-               lookup->table[i].chip_hwnum = mux_config->gpios[i];
-               lookup->table[i].con_id = "mux";
+               lookup->table[i] = (struct gpiod_lookup)
+                       GPIO_LOOKUP(mux_config->gpio_chip,
+                                   mux_config->gpios[i], "mux", 0);
        }
        gpiod_add_lookup_table(lookup);
        priv->lookup = lookup;

Do you have any preference?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

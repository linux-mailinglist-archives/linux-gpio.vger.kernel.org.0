Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED457386CB9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 00:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245228AbhEQWCR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 18:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbhEQWCQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 18:02:16 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EBEC061573;
        Mon, 17 May 2021 15:00:58 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t193so5588434pgb.4;
        Mon, 17 May 2021 15:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b4AFArD+ZVIfd8U0Xl9mLYPnItc1+fvBlzBikRR9v5o=;
        b=Rg2Zt0RSwWC1n0F6AFMKJ2UwvYt29MAJhECFo3VpwS/hpx3cnEwowsfJY91VSkCgTj
         y5K6yrBT7jPikTQB6st41/izTwa9zgmxVoCCht6uYls7L9WBNT+iqVI0hcDGWh/pUwr9
         u54MeXU9BYxeU+43oSpv+pqHb1cpFDmKrsw7lP7uEfii64lp5zXrdkxjETqN4MtiySRg
         6usdL1+9AFbc4UI/qsmXHABMJrIgJqBhy/1Uj5FvjCgeyTlsCDY6NE4aT10QDydRF9pn
         VtlBWGPiuzsgykqq8PRCCFc2uvp7tl4K+6aDqcJzCKo13/HR4O0Qfydsyz6NZNAz47iH
         k8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b4AFArD+ZVIfd8U0Xl9mLYPnItc1+fvBlzBikRR9v5o=;
        b=PWWAun935ERlWcBz+x2+xoPpTl9xoyG06noiqkzdSXx0erYv9jSkD5vEt+QXXUofhO
         3OmDFhANWN8NJ3drbS8v+GhIZ6JIiC8hSKRbkwdhFEsAFUN4l128rI4bTr0kiGHgWMEy
         4e82lA2szrvg/9zavb89L+4KIJ0S/MyPUT5rKzYSsq2kmIZRsWDEjOe39vr2LZl/eM5t
         ucTy0m7coatbDVMQQX2Tp79fJ7sdwbXmlNNpyYmqoC2F2715ZjsngANKPqffhuB47cKp
         yD4c7emFzU2gfRAyX/w4mugjsXlbKJ1gGFIcNNGb+IsAJI6deOqsu0cUpv8kh+WyKCF+
         c8iw==
X-Gm-Message-State: AOAM531mH9d7VyrOHN+YpricymiLUmppdK+G0XTlLy96MeXgl1al7lt2
        IHC+s6pyeMlTHUDrcj6BYirUA0q7V1Bqk1iu02c=
X-Google-Smtp-Source: ABdhPJz2lnkyKtU9B7z1UaAxHDbAyWMM5/Yric3H8b+7q21ZGStMNRMRH9LDNJ5YnsgLWxDuvZpD6CCiO2GARQ4mjGU=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr1625739pgg.74.1621288858005;
 Mon, 17 May 2021 15:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621279162.git.sander@svanheule.net> <752444cff2a7ec5da38dba368c64a5ed7dd87279.1621279162.git.sander@svanheule.net>
In-Reply-To: <752444cff2a7ec5da38dba368c64a5ed7dd87279.1621279162.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 May 2021 01:00:41 +0300
Message-ID: <CAHp75VdRZQXt25mNA+6fY3_iNV4JOE9h+QoFzbtb1_nAdWYFLA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] leds: Add support for RTL8231 LED scan matrix
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> Both single and bi-color scanning modes are supported. The driver will
> verify that the addresses are valid for the current mode, before
> registering the LEDs. LEDs can be turned on, off, or toggled at one of
> six predefined rates from 40ms to 1280ms.
>
> Implements a platform device for use as child device with RTL8231 MFD,

as a child

> and uses the parent regmap to access the required registers.

...

> +         When built as a module, this module will be named rtl8231_leds.

Again, what it's written here is not what is in Makefile.

> +obj-$(CONFIG_LEDS_RTL8231)             += leds-rtl8231.o

...

> +/**
> + * struct led_toggle_rate - description of an LED blinking mode
> + * @interval:  LED toggle rate in ms
> + * @mode:      Register field value used to active this mode

activate

> + *
> + * For LED hardware accelerated blinking, with equal on and off delay.
> + * Both delays are given by @interval, so the interval at which the LED blinks
> + * (i.e. turn on and off once) is double this value.
> + */

...

> +static unsigned int rtl8231_led_current_interval(struct rtl8231_led *pled)
> +{
> +       unsigned int mode;

> +       unsigned int i = 0;

This...

> +       if (regmap_field_read(pled->reg_field, &mode))
> +               return 0;
> +
> +       while (i < pled->modes->num_toggle_rates && mode != pled->modes->toggle_rates[i].mode)
> +               i++;

...and this will be better as a for-loop.

> +       if (i < pled->modes->num_toggle_rates)
> +               return pled->modes->toggle_rates[i].interval;

> +       else

Redundant.

> +               return 0;
> +}

...

> +       unsigned int i = 0;

As per above.

...

> +               interval = 500;

interval_ms

> +               /*
> +                * If the current mode is blinking, choose the delay that (likely) changed.
> +                * Otherwise, choose the interval that would have the same total delay.
> +                */
> +               interval = rtl8231_led_current_interval(pled);

> +

Redundant blank line.

> +               if (interval > 0 && interval == *delay_off)
> +                       interval = *delay_on;
> +               else if (interval > 0 && interval == *delay_on)
> +                       interval = *delay_off;
> +               else
> +                       interval = (*delay_on + *delay_off) / 2;
> +       }

...

> +       u32 addr[2];
> +       int err;
> +

> +       if (!fwnode_property_count_u32(fwnode, "reg"))

err = fwnode_property_count_u32(...);
if (err < 0)
  return err;
if (err == 0)
  return -ENODEV;

> +               return -ENODEV;
> +
> +       err = fwnode_property_read_u32_array(fwnode, "reg", addr, ARRAY_SIZE(addr));

If count returns 1? What's the point of counting if you always want two?

> +       if (err)
> +               return err;
> +
> +       *addr_port = addr[0];
> +       *addr_led = addr[1];
> +
> +       return 0;
> +}

...

> +       pled = devm_kzalloc(dev, sizeof(*pled), GFP_KERNEL);
> +       if (IS_ERR(pled))

Wrong.

> +               return PTR_ERR(pled);

...

> +       err = rtl8231_led_read_address(fwnode, &port_index, &led_index);
> +

Redundant blank line.

> +       if (err) {
> +               dev_err(dev, "LED address invalid\n");
> +               return err;

> +       } else if (led_index >= RTL8231_NUM_LEDS || port_index >= port_counts[led_index]) {

Redundant 'else'

> +               dev_err(dev, "LED address (%d.%d) invalid\n", port_index, led_index);
> +               return -ENODEV;
> +       }

...

> +       map = dev_get_regmap(dev->parent, NULL);
> +       if (IS_ERR_OR_NULL(map)) {

Split it into two conditionals.

> +               dev_err(dev, "failed to retrieve regmap\n");
> +               if (!map)
> +                       return -ENODEV;
> +               else
> +                       return PTR_ERR(map);
> +       }

...

> +       if (!device_property_match_string(dev, "realtek,led-scan-mode", "single-color")) {

It seems that device_property_match_string() and accompanying
functions have wrong description of returned codes, i.e. it returns
the index of the matched string. It's possible that some APIs are
broken (but I believe that the former is the case).

That said, I think the proper comparison should be >= 0.

> +               port_counts = rtl8231_led_port_counts_single;
> +               regmap_update_bits(map, RTL8231_REG_FUNC0,
> +                       RTL8231_FUNC0_SCAN_MODE, RTL8231_FUNC0_SCAN_SINGLE);
> +       } else if (!device_property_match_string(dev, "realtek,led-scan-mode", "bi-color")) {

Ditto.

> +               port_counts = rtl8231_led_port_counts_bicolor;
> +               regmap_update_bits(map, RTL8231_REG_FUNC0,
> +                       RTL8231_FUNC0_SCAN_MODE, RTL8231_FUNC0_SCAN_BICOLOR);
> +       } else {
> +               dev_err(dev, "scan mode missing or invalid\n");
> +               return -EINVAL;
> +       }

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB2A209B9D
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 10:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403813AbgFYI7Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 04:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403809AbgFYI7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 04:59:24 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DBFC061573;
        Thu, 25 Jun 2020 01:59:24 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w2so2206213pgg.10;
        Thu, 25 Jun 2020 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UbkWKILV8DbeaX+ajZbJrzumA5rN03uAMmnvew5Vefw=;
        b=G99d9dBQY3u9qOyOOtpu6EJVdCv3J6zsXCyTCpWnDRnwv9CrruXbivhinNSP6EbubQ
         13dVaF31bzYAHhaduXgGsrSJG4e7SiJMC0s9F0RwH45gUfjP46nQTHuEB6jS4Sjh7UOG
         L5v7X8oo9MhRs+dWGEraSsMWgW1mlyPJ6OYNZ8uWWmN8CVW8lIjND6L5LzA6ldfhnqj5
         kQt3EzGt6LHo+fKd5laWwtybEDiItx5szOmOhTAIfXicNIGWrmdv9dnFKf8k5IXYu6w5
         PNkOU+bJxO4fMUPz2dbfQnjghp1T4d+hwCw7vDdQFlGIlnzKKBRkphiIkNQLJoP/iAgJ
         gofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UbkWKILV8DbeaX+ajZbJrzumA5rN03uAMmnvew5Vefw=;
        b=V9ODufQPorFRBfjKLYzEDxhZgSuFGedhkBIxVW/4hHyJJ1GvGxvjby9s/httE7wS+P
         jdFCMABn2QGp892vSW8e96W/TDAAFK79InGaBg7VbNa0NqhDSFb8EQvrU1LuyxWjo0u8
         Ed6/Kiift2FIN4Y0P/BsYK2R8EPgBIGBJzhbjc6yycUlR0fCWNsa5KLIwYBN/XnRw/rU
         jRBBkHiHlQZxt82LZl0N1TEK0+hW6DoVRApHoFNXUGnCTqjHJKpzYXkU9SOouQDty4Fi
         493kRHKOTC3aeMVj+1gI+EXWs27uiys4lsDDNCxPhAYS8w8dZPWl8CaGdXPz2hg+wySB
         c3BQ==
X-Gm-Message-State: AOAM531L6UvzwwV+FdEUyXQW/EU5C+lPfru3qxll1TH7RvWQX+xHxwKl
        GG57xqkVQ8JXinduTFnv2+o9FnlTSBjSUdF2Klw=
X-Google-Smtp-Source: ABdhPJzzyGaA8R8B7RZRko8g2lrtdG3+8e2ZATvPqLOxZ6CDTunPL4flb9RrlqdkzeoVRFcy2d6p4cNTeEWNvIWEKoc=
X-Received: by 2002:a63:924b:: with SMTP id s11mr24600380pgn.74.1593075563878;
 Thu, 25 Jun 2020 01:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200625075805.363918-1-mans0n@gorani.run>
In-Reply-To: <20200625075805.363918-1-mans0n@gorani.run>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Jun 2020 11:59:11 +0300
Message-ID: <CAHp75VeeqvR=0caAmYW5fhMP0p25Xn2hmhhDLU9dZopwQ69HXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 10:59 AM Sungbo Eo <mans0n@gorani.run> wrote:
>
> NXP PCA9570 is 4-bit I2C GPO expander without interrupt functionality.
> Its ports are controlled only by a data byte without register address.
>
> As there is no other driver similar enough to be adapted for it, a new
> driver is introduced here.

Thanks for an update. I'll look at them later, so please defer the
next version a bit (perhaps for one week).
My comments below.

...

> +static void pca9570_set_mask_bits(struct gpio_chip *chip, u8 mask, u8 bits)
> +{
> +       struct pca9570 *gpio = gpiochip_get_data(chip);
> +       u8 buffer;
> +       int err;
> +
> +       mutex_lock(&gpio->lock);

> +       buffer = gpio->buffer & ~mask;
> +       buffer |= (mask & bits);

Usual pattern is to put this on one line

       buffer = (gpio->buffer & ~mask) | (bits & mask);

> +       err = i2c_smbus_write_byte(gpio->client, buffer);

> +       if (!err)
> +               gpio->buffer = buffer;

I'm not sure I understand why this is under lock.

> +
> +       mutex_unlock(&gpio->lock);

Can't you simple do it here like

if (err)
  return;

... = buffer;

?

> +}

...

> +static int pca9570_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)

Can't you use ->probe_new() instead?

> +{
> +       struct pca9570 *gpio;
> +       int ret;
> +
> +       gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
> +       if (!gpio)
> +               return -ENOMEM;
> +

> +       i2c_set_clientdata(client, gpio);

Either move this before return 0; or...

> +       gpio->chip = template_chip;
> +       gpio->chip.parent = &client->dev;
> +
> +       gpio->client = client;
> +
> +       mutex_init(&gpio->lock);
> +
> +       ret = devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);

> +       if (ret < 0) {

(What is the meaning of ' < 0' ?

> +               dev_err(&client->dev, "Unable to register gpiochip\n");
> +               return ret;
> +       }
> +
> +       return 0;

...simple return devm_...(...);

> +}

-- 
With Best Regards,
Andy Shevchenko

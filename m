Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2FFA6601E8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jan 2023 15:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbjAFORX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Jan 2023 09:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjAFORW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jan 2023 09:17:22 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5FD112E
        for <linux-gpio@vger.kernel.org>; Fri,  6 Jan 2023 06:17:20 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id m129so1547837vsc.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jan 2023 06:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qsGgsxxf0u8qil37HdW7PX5dBosNKn6VWJmSfcQG1eo=;
        b=prif6Q2DuSOk4SqgaaeIxRodS4xfILkK6Ub5mhUGljawAGI0c4wgXOFlmI3ngCk3c8
         i5DDCj/I9NrhqUBQ2hFbKA6GjIDQdwhQWUd+hNkos1N6O8bZa6jo7Hi4Q8Yx/nPEs6v7
         kv6v8PaeGruNbJSpY1SztBwHWCpg1ddvQybtfINi6i1W34FuEo/NV4Qh7Hias0GqhXug
         DsmoSYgkEX0+rCKkc703Ay1+I/APTMHhN3DieYv60UgMfMwnSFPutwqPXYpuuhFmnUXE
         FN90x2aAjhV4IOevrbsTemNvI211G5+6M7eMxFZc1sjbDEg+WRu+sxcmNMw74BQfGlaW
         8m3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsGgsxxf0u8qil37HdW7PX5dBosNKn6VWJmSfcQG1eo=;
        b=jprdZaIPKk0Nb2lb5UbgHe6G3sAHy7qa+pBBH3PNeM9kqqsTDtyTd0mAq4vc2wF3M7
         iCLxvBhHDhIIKaYFNgCKl9DDfyOh50QYROvFg7TISZWQvQx7g6eq4CqzMH7x7+B4jGDr
         1J/7nqaZHwHDUGEYhZB8yoLpuJSzjN2RxaM0r6qm7fvIG9E0TFvESwEEKjR5KD2mKwJX
         0vn/h2ozh6+XrE8SamVE5TQMh+5noL6oj5Ik4tfuDHFkn7gvrkuDm5FBEhHVHnJQCp70
         7kw3BYeJVrSje3oYfgYxjvn1D3rCZz7UhWkNZzjuRaaoG6959yknFGzVNKmxBeQ2vety
         lXwA==
X-Gm-Message-State: AFqh2kqC1lhfmAB6qoVbyQn4JS0MK4UfSDlarzOokwt/tAntwmOyTW+7
        GXW3sXUkbCqdpAD2/iYXZe78SfFXWewapcxkzv3kpARwvJxBRw==
X-Google-Smtp-Source: AMrXdXs1lQDnKFY4DlQj+0gyF1ysKmsOSKwp/Xz6YQVoEbTrd6Ai7lPYLAZvwB49SFfo96M9s+ndIhT+bXm1zOKPdPs=
X-Received: by 2002:a67:df09:0:b0:3ce:88b3:d7da with SMTP id
 s9-20020a67df09000000b003ce88b3d7damr2534112vsk.62.1673014639223; Fri, 06 Jan
 2023 06:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20230104012013.831820-1-radu.rendec@gmail.com>
In-Reply-To: <20230104012013.831820-1-radu.rendec@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Jan 2023 15:17:08 +0100
Message-ID: <CAMRc=Me4grbDW+_-+YWrwngrnUySw31+MUFVY+7pStoY0vA3Gw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pcf857x: Implement get_multiple/set_multiple methods
To:     Radu Rendec <radu.rendec@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 4, 2023 at 2:20 AM Radu Rendec <radu.rendec@gmail.com> wrote:
>
> This change allows the GPIO core to read/change multiple pins in a
> single driver call and subsequent I2C transfer. It helps a lot with
> PCF857x devices, since their I2C protocol always reads/changes all
> existing pins anyway. Therefore, when the GPIO client code does a bulk
> operation on multiple pins, the driver makes a single I2C transfer.
>
> Signed-off-by: Radu Rendec <radu.rendec@gmail.com>
> ---
>  drivers/gpio/gpio-pcf857x.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> index cec2f2c78255..8a8ffeaa8b22 100644
> --- a/drivers/gpio/gpio-pcf857x.c
> +++ b/drivers/gpio/gpio-pcf857x.c
> @@ -141,6 +141,21 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
>         return (value < 0) ? value : !!(value & (1 << offset));
>  }
>
> +static int pcf857x_get_multiple(struct gpio_chip *chip, unsigned long *mask,
> +                               unsigned long *bits)
> +{
> +       struct pcf857x  *gpio = gpiochip_get_data(chip);
> +       int             value = gpio->read(gpio->client);

Ugh, this whitespacing is awful but I get it that you only tried to
stay consistent with the rest of the code. Could you add a patch
before this one that removes those tabs from local variables? IMO This
makes the code less readable, not more. While at it: you can also
change all instances of 'unsigned' to 'unsigned int' as per the
checkpatch rule.

Otherwise it looks good!

Bart

> +
> +       if (value < 0)
> +               return value;
> +
> +       *bits &= ~*mask;
> +       *bits |= value & *mask;
> +
> +       return 0;
> +}
> +
>  static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
>  {
>         struct pcf857x  *gpio = gpiochip_get_data(chip);
> @@ -163,6 +178,18 @@ static void pcf857x_set(struct gpio_chip *chip, unsigned offset, int value)
>         pcf857x_output(chip, offset, value);
>  }
>
> +static void pcf857x_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> +                                unsigned long *bits)
> +{
> +       struct pcf857x *gpio = gpiochip_get_data(chip);
> +
> +       mutex_lock(&gpio->lock);
> +       gpio->out &= ~*mask;
> +       gpio->out |= *bits & *mask;
> +       gpio->write(gpio->client, gpio->out);
> +       mutex_unlock(&gpio->lock);
> +}
> +
>  /*-------------------------------------------------------------------------*/
>
>  static irqreturn_t pcf857x_irq(int irq, void *data)
> @@ -275,7 +302,9 @@ static int pcf857x_probe(struct i2c_client *client)
>         gpio->chip.parent               = &client->dev;
>         gpio->chip.owner                = THIS_MODULE;
>         gpio->chip.get                  = pcf857x_get;
> +       gpio->chip.get_multiple         = pcf857x_get_multiple;
>         gpio->chip.set                  = pcf857x_set;
> +       gpio->chip.set_multiple         = pcf857x_set_multiple;
>         gpio->chip.direction_input      = pcf857x_input;
>         gpio->chip.direction_output     = pcf857x_output;
>         gpio->chip.ngpio                = id->driver_data;
> --
> 2.39.0
>

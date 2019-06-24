Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B9B50462
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 10:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbfFXIVK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 04:21:10 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45845 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727632AbfFXIVJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 04:21:09 -0400
Received: by mail-oi1-f193.google.com with SMTP id m206so9094087oib.12
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2019 01:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=blOJAi5NdpzMEZcKKVqyJLkzFqMTkMHyKPgcUhbY3dc=;
        b=TJNotvcFEqAi0h+bgPiOliR09SToCyrPbNWa4Na9NfDj5yMdAZv34DdyDVuRU4etbY
         vkm99sydiCiQRGMbOoKh9c9V4UmS6wdVPj8IsL0fC6wBNIB/BhaVffwbVeBINd5V4Bp9
         XJP3TA9lQo0uBNEpAwIrth8HFz1Lt9OKT72YqmasA/jyCOAC0oOSNLJW/AAJZGfgJ8XX
         5M7sKTffXKribfOKim37iFJnvSN4Vx1lOmUydqCHDVDr76H2m9yAatzbw+kc1NYChmPI
         O2ovXK7sP0PXp3S+lJ7Jhk4OUdWonDm5dnynt3DQQBPNw0hlSk7uVUPMLKvRYoI2X9ZQ
         TmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=blOJAi5NdpzMEZcKKVqyJLkzFqMTkMHyKPgcUhbY3dc=;
        b=Zs3CmvB4EOyqS1zHmwBw/3qNCsQO+F+P22rMqkdZ/U6IGt62XqJapS4JFJ21qJVnNU
         K3ZMp7k2uI51tv5bRJxPUazfCB0S6lIcO/O+vp0jqpN26cIC66TOzSNjtoSaWRJwOzqM
         KNHvo38XsDZMboklA2wEhhjAs7fZlGiqranmKED1eujWh0IwGgGiKjjsarDPT0svbenk
         /aVKT6itc2RvtAiG9DOiui2Ajk+zfs5Mgaod3m7ksBqi9OUqfOe2eKwAyOupMTguhBLo
         aWIPqpu7SAOqRg7IsRJFXO83T6E6OI/19DeVUm2y06wxtOs4UsIZFUBotSNGjePlGypI
         LmLw==
X-Gm-Message-State: APjAAAW++6Jq1B84fGt2HSsImxciKhittpBsMwoxFZqett5T3w3M+706
        7oNL+n/awnq1/E5Y1+lqpn9jq0pIZuXPqbbUBopmocQGY/s=
X-Google-Smtp-Source: APXvYqwcJGi8NB9qRZhvBlqehUrgv6ATC0nyP88orxazs/qsaNtWaaTztc1j91aKBLpve4ZqmUtOHk8V3P6f8GIORRo=
X-Received: by 2002:aca:450:: with SMTP id 77mr10260172oie.114.1561364468573;
 Mon, 24 Jun 2019 01:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190618155047.16894-1-gregkh@linuxfoundation.org>
 <20190618155047.16894-3-gregkh@linuxfoundation.org> <20190620072519.GA21046@kroah.com>
In-Reply-To: <20190620072519.GA21046@kroah.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 24 Jun 2019 10:20:57 +0200
Message-ID: <CAMpxmJV=xTwE76RZ-oxucHaT8fwjPdpziQ0ObTqz39aNE8qDkw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mockup: no need to check return value of
 debugfs_create functions
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     bamv2005@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 20 cze 2019 o 09:25 Greg Kroah-Hartman
<gregkh@linuxfoundation.org> napisa=C5=82(a):
>
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
>
> Cc: Bamvor Jian Zhang <bamv2005@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: fix build warning found by kbuild
>     fix build error found by kbuild.  Did I even build this thing
>     myself???
>
>  drivers/gpio/gpio-mockup.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index b6a4efce7c92..135dac099d1e 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -315,7 +315,6 @@ static void gpio_mockup_debugfs_setup(struct device *=
dev,
>                                       struct gpio_mockup_chip *chip)
>  {
>         struct gpio_mockup_dbgfs_private *priv;
> -       struct dentry *evfile;
>         struct gpio_chip *gc;
>         const char *devname;
>         char *name;
> @@ -325,32 +324,25 @@ static void gpio_mockup_debugfs_setup(struct device=
 *dev,
>         devname =3D dev_name(&gc->gpiodev->dev);
>
>         chip->dbg_dir =3D debugfs_create_dir(devname, gpio_mockup_dbg_dir=
);
> -       if (IS_ERR_OR_NULL(chip->dbg_dir))
> -               goto err;
>
>         for (i =3D 0; i < gc->ngpio; i++) {
>                 name =3D devm_kasprintf(dev, GFP_KERNEL, "%d", i);
>                 if (!name)
> -                       goto err;
> +                       return;
>
>                 priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>                 if (!priv)
> -                       goto err;
> +                       return;
>
>                 priv->chip =3D chip;
>                 priv->offset =3D i;
>                 priv->desc =3D &gc->gpiodev->descs[i];
>
> -               evfile =3D debugfs_create_file(name, 0200, chip->dbg_dir,=
 priv,
> -                                            &gpio_mockup_debugfs_ops);
> -               if (IS_ERR_OR_NULL(evfile))
> -                       goto err;
> +               debugfs_create_file(name, 0200, chip->dbg_dir, priv,
> +                                   &gpio_mockup_debugfs_ops);
>         }
>
>         return;
> -
> -err:
> -       dev_err(dev, "error creating debugfs files\n");
>  }
>
>  static int gpio_mockup_name_lines(struct device *dev,
> @@ -501,8 +493,6 @@ static int __init gpio_mockup_init(void)
>         }
>
>         gpio_mockup_dbg_dir =3D debugfs_create_dir("gpio-mockup", NULL);
> -       if (IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
> -               gpio_mockup_err("error creating debugfs directory\n");
>
>         err =3D platform_driver_register(&gpio_mockup_driver);
>         if (err) {
> --
> 2.22.0
>

Shouldn't this patch also make the driver unconditionally call
gpio_mockup_debugfs_setup() at line 450?

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974DD6B04F6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 11:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjCHKuL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 05:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbjCHKuG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 05:50:06 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28C096C1F
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 02:50:04 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id x40so10900382uaf.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678272604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrGIwfDssNWvgzWTQQZESgCFLHmI+nsI3umT2NNZtyo=;
        b=gmU8TnnwcMy/VmNMFKyoUSE6E5hYFH6W9+NwHx3mxV8Y8Q6a2C4SBnV/YWerk064Bc
         ShqJDSFRWB8S4gXwj/aLASxo+hZqHI41sJ9pZBjmOSr5wUHg6Nds37wbCCvbLfoqdZI+
         bv0E1NNUOej+DMPCiECAKHGpHIsrQDYK6mI/SabqB7MLxOprW+wbJQ6sS7CctO4WFLVa
         ueFxnOsP2MBcnRfcDjCWQa8HIT5nt2DQjxFfvAvNCTOa6xscTtEmDFi/oEXuGxu+ZwIn
         /rtzOK7g7mSRX7a0FuC4zxn/CNko6XwcTHu+RXBO90AlZmHuPxCYx94XsXvyFsxVLcrx
         dCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678272604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrGIwfDssNWvgzWTQQZESgCFLHmI+nsI3umT2NNZtyo=;
        b=N8SITiATe76KsqQUyiLK/cHoBHTfuIBpiESqQ8UA74QpYEpB993EoRJpZsyFrsZA/R
         Ufl6nDd1TuQdFiYaSe5SvMGBJBzowU1Ud6uNPpq21mHJrg41WyV6ZBpBZLP0BpGNNi2d
         MM+0fMK5wbmnOnqZf0zHGnGVrazKbkC3qpgUkoPDzdSAw6yQZ2g9vfcusav6uQ0EToxO
         ZudxAR3GR5pdURBKr0as+XMctWoOw8u6S4KsB1BKwcbt868QbIZrq0ycVux5cy6x/k7X
         vSQl27RRsTU7zlsXNek91GQNmjj86zaDFc4O5lormtBucCdxeIqdRjiwf2rsGsW8eEIl
         UGYw==
X-Gm-Message-State: AO0yUKW8Ie5RfZ/lOuXn2tjBPng/v0hG/P5xWtREK8MteP4JHThoYy/Z
        5kY3WGqAAjiAjpfW0p6cIzwDPltr4e3pypdnlfsmwW8F/2c9sWO6
X-Google-Smtp-Source: AK7set+ifNLECN4OlPKqnL8mM/CEXMyPvqKG5gN0dT9ZYnEn2OCiuShZimfQYKMhIwtKr1ZFaE6blzpMWPy78Zc/dl0=
X-Received: by 2002:a9f:3104:0:b0:687:afc8:ffb9 with SMTP id
 m4-20020a9f3104000000b00687afc8ffb9mr11804487uab.2.1678272603770; Wed, 08 Mar
 2023 02:50:03 -0800 (PST)
MIME-Version: 1.0
References: <20230307182557.42215-1-andriy.shevchenko@linux.intel.com> <20230307182557.42215-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230307182557.42215-4-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Mar 2023 11:49:53 +0100
Message-ID: <CAMRc=MdW7JjWvJUtvwJDwWLB5ygPiCRWLNM8E0iyRoD=HbzfVw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpiolib: Move gpiodevice_*() to gpiodev namespace
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2023 at 7:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The functions that operates on the same device object would
> have the same namespace for better code understanding and
> maintenance.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a44a1b0f2766..45f79aee451a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -573,7 +573,7 @@ bool gpiochip_line_is_valid(const struct gpio_chip *g=
c,
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
>
> -static void gpiodevice_release(struct device *dev)
> +static void gpiodev_release(struct device *dev)
>  {
>         struct gpio_device *gdev =3D to_gpio_device(dev);
>         unsigned long flags;
> @@ -617,7 +617,7 @@ static int gpiochip_setup_dev(struct gpio_device *gde=
v)
>                 return ret;
>
>         /* From this point, the .release() function cleans up gpio_device=
 */
> -       gdev->dev.release =3D gpiodevice_release;
> +       gdev->dev.release =3D gpiodev_release;
>
>         ret =3D gpiochip_sysfs_register(gdev);
>         if (ret)
> --
> 2.39.1
>

But the only other function that's in the gpiodev_ namespace operates
on struct gpio_device so that change doesn't make much sense to me.

Bart

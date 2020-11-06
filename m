Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC042A928D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 10:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgKFJ17 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 04:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFJ17 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 04:27:59 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF184C0613CF
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 01:27:58 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id e18so561845edy.6
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 01:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nnv5uGNlg6ZV7/2v1XUlOT90CUj1EOsp7HGgDBUIcEI=;
        b=c2/zYJR0d8ePpqOhAzLT9bTxaaOv+fFGRz37Tphnemf9O9wx6+jyrUVFB6ObBa504g
         6h4c4valuAu4rf2hmEpbeOCbsiOppTg8n0DFfabimD8yHr0CJvOBgTczpFj+0VpCY34u
         CsZN8HV+WHe3jlIREDjrkVJL33u8qcR7Y0eorCSopnn5joWKla0VQuguuEjrLi2JIt/m
         2KEVQnWBoIx9Quh+xgye3Ecnn6MoCQamS2+EOyj4Dn3lVPgy0ghcJLoyxaAbfwF4Xo7l
         otg9bt66qGKeyJTdEWeU61kGD38Z5IPiPibCVB5B112/Sz6jpVtlAEABQd6nKbPlaaYu
         tAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nnv5uGNlg6ZV7/2v1XUlOT90CUj1EOsp7HGgDBUIcEI=;
        b=lKBKIoOBbrJ2b1MGHqpAjFJ2pRmsvmlwvM0SYGb/hTlXEFW2vRzWPVQx8pHkendWOg
         xKLIdlNux+z6r3XHOhq0bywS5EESV72Z76UlMJgUaMbWD8Tt5s3qgrAxYd/o5j2xTMjX
         d9+/U13ZNcgESgDdzgBwqSdOEb7KtXoJUg4iut5aq9PS0uB6HYaHda+Kjwin/JzISZ8l
         /zQ2GdnezP+KluO4ErZtbBbtbX+FECARNiIH8Xaz5XKTGpyzHstgAP57WO0nsOkV/2bm
         4Akd/eNkKOgpJnuVeMsJyTRkdJOMejLSSta63r0Q/I8i5WEU+KZ66OOIbrLltxGRkPvr
         Zi+g==
X-Gm-Message-State: AOAM532g1PhH2WELGgHfDbsBmIBwibS4waMGEeBgpx/0SGv6VLQXQNtV
        xT5S4jTxOzaKzxnInGtKQXBfnBBE2BfTG2WlQBH3Tw6Skgc=
X-Google-Smtp-Source: ABdhPJwfYyOOtwoxCKqdG/kXaE7KBAFoS5HzygCOsjp/EZE0PlgK+Yifipy9k5IHKQMSmWj5oCenu8uXTy8w2N+fvyg=
X-Received: by 2002:a50:99c3:: with SMTP id n3mr1067260edb.213.1604654877688;
 Fri, 06 Nov 2020 01:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20201104115348.51930-1-damien.lemoal@wdc.com>
In-Reply-To: <20201104115348.51930-1-damien.lemoal@wdc.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 6 Nov 2020 10:27:46 +0100
Message-ID: <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio export/unexport
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 12:53 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> If a user tries to export or unexport an invalid gpio (e.g. gpio number
> >= ARCH_NR_GPIOS), gpio_to_desc() will trigger a register dump through a
> WARN() call. Avoid this rather scary error message by first checking the
> validity of the gpio number before calling gpio_to_desc() in
> export_store() and unexport_store(). The user gets a normal error
> message to signal his/her error without any possible confusion with a
> kernel bug.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 728f6c687182..b6fd0d82757a 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -3,6 +3,7 @@
>  #include <linux/mutex.h>
>  #include <linux/device.h>
>  #include <linux/sysfs.h>
> +#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/interrupt.h>
> @@ -456,14 +457,15 @@ static ssize_t export_store(struct class *class,
>                                 const char *buf, size_t len)
>  {
>         long                    gpio;
> -       struct gpio_desc        *desc;
> +       struct gpio_desc        *desc = NULL;
>         int                     status;
>
>         status = kstrtol(buf, 0, &gpio);
>         if (status < 0)
>                 goto done;
>
> -       desc = gpio_to_desc(gpio);
> +       if (gpio_is_valid(gpio))
> +               desc = gpio_to_desc(gpio);
>         /* reject invalid GPIOs */
>         if (!desc) {
>                 pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
> @@ -503,14 +505,15 @@ static ssize_t unexport_store(struct class *class,
>                                 const char *buf, size_t len)
>  {
>         long                    gpio;
> -       struct gpio_desc        *desc;
> +       struct gpio_desc        *desc = NULL;
>         int                     status;
>
>         status = kstrtol(buf, 0, &gpio);
>         if (status < 0)
>                 goto done;
>
> -       desc = gpio_to_desc(gpio);
> +       if (gpio_is_valid(gpio))
> +               desc = gpio_to_desc(gpio);
>         /* reject bogus commands (gpio_unexport ignores them) */
>         if (!desc) {
>                 pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
> --
> 2.28.0
>

How about we change that to an unconditional WARN() everytime the user
tries to export a GPIO over sysfs so that people switch over to the
character device?

I'm joking a bit but I think it's time to start discouraging people
from using sysfs and a warning may be a good start.

Bartosz

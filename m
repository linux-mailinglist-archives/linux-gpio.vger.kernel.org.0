Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1732077BDB4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 18:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjHNQOG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 12:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbjHNQN6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 12:13:58 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F048120
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 09:13:56 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4478ea3ac05so1746083137.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692029635; x=1692634435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wobTCP4mDcNRbtaclHipsq07yTZIrInXGgJ6gzY66Ww=;
        b=ypjeUMTXTWp/swT5vJKJEWntgM7woXZr85Zklcq7eZe6owlQGhsZNSPE2J0X0CbTs2
         6ZFzuEZvl1RZhtBCK3LKrnYRXDDIS/o99i22pkqQxYNJNTX/nm5+Z7oZwEYQBIbuiPZv
         sULc2MlJBocMOPwr8EZ0pTK0e6iPjjP5kjmEx6miAcjIV4/aUMPuZYSeynji95jXARa4
         usIt9eMnkqJ3WK61m5vuQuAP//FT9IHICQ2kzfrkZYAgZV5WrnrzlOnqAgxypP1nteiT
         WhaIZuMzjQrAShrKhRdTPCZ+sx6Y4bp8EdiQVK5vkrx+2FFRrxEa9kDkNlIqlmmh3Ecq
         /O6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692029635; x=1692634435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wobTCP4mDcNRbtaclHipsq07yTZIrInXGgJ6gzY66Ww=;
        b=hNWy7eF41Ebc9Knuqoea+0JHsPoBghTemlauJLUfa8FsYPCy/IvJG/n6/7s0vFUUxQ
         mu7xmNWeQamIjP+IC3bfXC3FhFbevPvrnDaLgHZmVegQTts5+yGvLf7oX/ejTtVWHCF+
         ptjwlIH9m8nD3V9SUruRLwtSLJdb4+LP19pEsWif3kHdebqbaso3csyhQqGx5Pqz2fif
         7Pp07reN/6aOOoAqkpAHthlqkXavs6ASdx+k/DlcD/fYjxdJo3InDF+RyERoVTpBIReE
         DYpS5YeLcHxufqqct2NUZrwA5xwQe9SRo/oQx8xISgiweUq1r+qWzypcX3/OyQr4J6eL
         IYYw==
X-Gm-Message-State: AOJu0YzKSEu4WfzTW7gk1xEGe8L0oCUid0TV1cpO7KjruTuA9noQD/zN
        G6b/t381OLGJ2LiqFKx7JQtt8IYGgQoKoef5qZIzLg==
X-Google-Smtp-Source: AGHT+IFtRUCzdTXPrBCH2nMD8vl1QgR+QxO9dyXsZbvfAfj0HNlPGqLe2vyydMXzRuK11vrCzIkaqfNNc/y21oe5kyA=
X-Received: by 2002:a67:f9cd:0:b0:447:7dc0:e15 with SMTP id
 c13-20020a67f9cd000000b004477dc00e15mr10161281vsq.28.1692029635516; Mon, 14
 Aug 2023 09:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230814112615.42448-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230814112615.42448-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Aug 2023 18:13:44 +0200
Message-ID: <CAMRc=MfhoeMfC7gAcKioKpkCA1jykyqGSH4vg7Hpu9bb=yeGaA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: sysfs: Do unexport GPIO when user asks
 for it
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 14, 2023 at 1:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It seems that sysfs interface implicitly relied on the gpiod_free()
> to unexport the line. This is not good and prone to regressions.
> Fix it by explicitly calling gpiod_unexport().
>

I wouldn't say it's prone to regressions, it's literally just that
gpiod_free() should not deal with sysfs.

How about that for commit message (I can change it when applying):

It seems that sysfs interface implicitly relied on the gpiod_free()
to unexport the line. This is logically incorrect as core gpiolib should
not deal with sysfs so instead of restoring it, let's call gpiod_unexport()
from sysfs code.

Bart

> Fixes: b0ce9ce408b6 ("gpiolib: Do not unexport GPIO on freeing")
> Reported-by: Marek Beh=C3=BAn <kabel@kernel.org>
> Closes: https://lore.kernel.org/r/20230808102828.4a9eac09@dellmb
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 530dfd19d7b5..50503a4525eb 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -515,8 +515,9 @@ static ssize_t unexport_store(const struct class *cla=
ss,
>          * they may be undone on its behalf too.
>          */
>         if (test_and_clear_bit(FLAG_SYSFS, &desc->flags)) {
> +               gpiod_unexport(desc);
> +               gpiod_free(desc);
>                 status =3D 0;
> -               gpiod_free(desc);
>         }
>  done:
>         if (status)
> @@ -781,8 +782,10 @@ void gpiochip_sysfs_unregister(struct gpio_device *g=
dev)
>         mutex_unlock(&sysfs_lock);
>
>         /* unregister gpiod class devices owned by sysfs */
> -       for_each_gpio_desc_with_flag(chip, desc, FLAG_SYSFS)
> +       for_each_gpio_desc_with_flag(chip, desc, FLAG_SYSFS) {
> +               gpiod_unexport(desc);
>                 gpiod_free(desc);
> +       }
>  }
>
>  static int __init gpiolib_sysfs_init(void)
> --
> 2.40.0.1.gaa8946217a0b
>

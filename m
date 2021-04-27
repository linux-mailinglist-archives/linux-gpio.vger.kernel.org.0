Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416EE36C5D9
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 14:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235516AbhD0MM4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 08:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235410AbhD0MM4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 08:12:56 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D793C061574;
        Tue, 27 Apr 2021 05:12:13 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id b17so5174903pgh.7;
        Tue, 27 Apr 2021 05:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gtxfnCE0QB9Perajd4AHYu0QLVv0yXPd0ZkZWcVU9UY=;
        b=Uo7o1Rism3BXnTjuhVg/Hhi8CFeeCVqGRpKmE3+Xjhb8hvVD7mJMvjR2+Q9y7BwftO
         yGk6G0Qsv392sHufj4bpRKYofXihWmmJGRUYFu9jpaSgQFcClbAo2BUvuH5L7uQ+hXPS
         01xiBkh02OQIJk3ZJyMAcFLWmNE6czbZOzXN1uKWOSJgJy5s9zdjID78pPRYWCT//p9m
         +jLY+0f3u5kR28DSy5bFsP1LQ5YcmU/g0j7YngTH0TA1UuQ+iR/7D9PWpyd1voqw3QUF
         Fx6zq/qaQ6DvRZMiv9dUsI/m1L4FsHCUNXt2sxPrNSuRU+SBWAHW4xG9M7BKIz9i/eY9
         s2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gtxfnCE0QB9Perajd4AHYu0QLVv0yXPd0ZkZWcVU9UY=;
        b=DpiT3h/4xqrDaC5T+QL+1atkO8Luff1bLEsgcg/Inz7ysicgBJOeaNpboT71NIp04f
         9kepBo7q/05axzELnLuxbBq2q1XrW+HqDp7EAyzEzlI90ep9yGXQir9vjQK8NfbxvT4u
         psua73pVRO9oAVqzW3DHpqDBzGQsMk4+CmXBPPHBfhg0DRRLvDHzGwT5blkF9pK4fgW9
         lqZUl8rmKUmBPOVRuhh8ujrbyYLfBZ1+D4Y+R2Nxx8J9MaEFI8VDezz1gkARTtNdGOhr
         oPfiJZW2i9Hr2SQ2qF6HFYedajk4JL+qcNmYjunq1bVAQSebZ2OYnQGp5Xrt4bHoQhqb
         gXhA==
X-Gm-Message-State: AOAM531KKdNEO7OOq9jrW0aC6z2wsN+u7Y7W74VlD5VBIkNn/6zHk3lw
        NkSy5sOUpKOLBUNRKq3RUAcD2iBXyB1CKKNSJPBDCdeyHGw=
X-Google-Smtp-Source: ABdhPJwB0KFp3aPcr9ubVL4K7W7pZVG44ylohvnpZsNXTA956q7/R/lVe92blxdHi0UbNm6GZsuss9s8maJ0/McZJOQ=
X-Received: by 2002:a62:5c6:0:b029:24d:e97f:1b1d with SMTP id
 189-20020a6205c60000b029024de97f1b1dmr23090847pff.40.1619525532759; Tue, 27
 Apr 2021 05:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210427114950.12739-1-colin.king@canonical.com>
In-Reply-To: <20210427114950.12739-1-colin.king@canonical.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Apr 2021 15:11:56 +0300
Message-ID: <CAHp75VeFmgOM_APt=pStkU03mP02VgCw0q31bpY7dFnJhKLn8w@mail.gmail.com>
Subject: Re: [PATCH][next][V2] gpio: sim: Fix dereference of free'd pointer config
To:     Colin King <colin.king@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 27, 2021 at 2:49 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The error return of config->id dereferences the kfree'd object config.
> Fix this by using a temporary variable for the id to avoid this issue.

Thanks!
I'm wondering how I missed this... Nevertheless

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Addresses-Coverity: ("Read from pointer aftyer free")

after

> Fixes: a49d14276ac4 ("gpio: sim: allocate IDA numbers earlier")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> V2: Don't make id local to the if statement to improve coding style.
>     Thanks to Bartosz Golaszewski for this improvement suggestion.
> ---
>  drivers/gpio/gpio-sim.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 2e2e6399e453..b21541c0b700 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -744,20 +744,22 @@ static struct config_item *
>  gpio_sim_config_make_item(struct config_group *group, const char *name)
>  {
>         struct gpio_sim_chip_config *config;
> +       int id;
>
>         config = kzalloc(sizeof(*config), GFP_KERNEL);
>         if (!config)
>                 return ERR_PTR(-ENOMEM);
>
> -       config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> -       if (config->id < 0) {
> +       id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> +       if (id < 0) {
>                 kfree(config);
> -               return ERR_PTR(config->id);
> +               return ERR_PTR(id);
>         }
>
>         config_item_init_type_name(&config->item, name,
>                                    &gpio_sim_chip_config_type);
>         config->num_lines = 1;
> +       config->id = id;
>         mutex_init(&config->lock);
>
>         return &config->item;
> --
> 2.30.2
>


-- 
With Best Regards,
Andy Shevchenko

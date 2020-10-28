Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057A029DB69
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390081AbgJ1XyA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389984AbgJ1XxH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:53:07 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D20EC0613CF;
        Wed, 28 Oct 2020 16:53:07 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id r1so530668vsi.12;
        Wed, 28 Oct 2020 16:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PYN4K1+Qo5CXy2dTkM2vzEcbUyt+oPx5TIK4442R5VA=;
        b=OTy/e460iUjfhoI9aAffakKahhhxsFyOhcX7Pe8XatpgZgW4p2r22kefU9VUgmlNSX
         KDszoNmWQKwSNCLYHwqqijzuit3JOvrkyMMyQXIb1HaAnxs90CHkW2cEoXJ12lTI+C3s
         5Azit7cOIHaZvipRq0dWbvoHHoCE8qMBAmmfYc+3u0+swrtLuueJnwJO1UFQpupjpDmY
         poV01fVvB9ipTBaS9KFW38ECjgEyw/AOSpJwQszvEa/ojLAznDklj2JhfzIlzk/j8ppX
         AjaTQxHOpyaBoCvAX+zcB9jMsPpukP2XOHv2yGmFvn9sw92jh124DlIlGHp203Ve3ZzP
         nQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PYN4K1+Qo5CXy2dTkM2vzEcbUyt+oPx5TIK4442R5VA=;
        b=K713OENW9vYjrj+IVpqxbS9WOZY9hxQ1cW+0pa9U4t8KZ3SttnraP5qG7GA9vOwWg7
         53++CZBwKItPfGQkOD/a8DQerhC0xaTOWlykWM0vFB1UvTibctEFE0W+YmzZ37K6F/J2
         nJTKtAZS6rVty36TrJo+fliwbDLUGgCJweJ8FEF5iG20u4KqoEnQz4nyPSsVVgwMOsGo
         t8VxIOk8O4L4lb+dVn3WgOCOBWqfFi5+jVs3EALrusxWBnfTu2FTG0t4THi3me//lu+v
         ZZsafP5swQBtCEr+cBIIPUI1ujimrl8PnSI/Bj5XN2k5L7NO/dT+Uzgt/zx1UuaN+3DQ
         5ZDg==
X-Gm-Message-State: AOAM531ODNCIGe2FhZnBhk3/o2Vl94tU6FCcofRWMsmW8/z7Loyd+jmn
        kGRRyrI0FKdyzpDbVRq4iGNohiWMKCl1kc8gsSAAIJOZSE8=
X-Google-Smtp-Source: ABdhPJzbN6AZnSn8xnNQv9pn7KISq95/FDkNcUJaHWTCbZwD5tEAj00jhZ0o9cYB3yT6BKajRQoJVz5rlVnjh+xNoj4=
X-Received: by 2002:a17:902:bc4a:b029:d6:7ef9:689c with SMTP id
 t10-20020a170902bc4ab02900d67ef9689cmr288408plz.21.1603885245482; Wed, 28 Oct
 2020 04:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201028103921.22486-1-zhe.he@windriver.com>
In-Reply-To: <20201028103921.22486-1-zhe.he@windriver.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Oct 2020 13:41:34 +0200
Message-ID: <CAHp75VckpCLKeFLbf3RJ+eti5SX6a-ygvR7FM6M2-txp_kmMLQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: Add missing #ifdef CONFIG_GPIOLIB
To:     He Zhe <zhe.he@windriver.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <drew@beagleboard.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 12:40 PM He Zhe <zhe.he@windriver.com> wrote:
>
> To fix the following build warnings when CONFIG_GPIOLIB=n.
>
> drivers/pinctrl/core.c:1607:20: warning: unused variable 'chip' [-Wunused-variable]
>  1608 |  struct gpio_chip *chip;
>       |                    ^~~~
> drivers/pinctrl/core.c:1606:15: warning: unused variable 'gpio_num' [-Wunused-variable]
>  1607 |  unsigned int gpio_num;
>       |               ^~~~~~~~
> drivers/pinctrl/core.c:1605:29: warning: unused variable 'range' [-Wunused-variable]
>  1606 |  struct pinctrl_gpio_range *range;
>       |                             ^~~~~

Makes sense.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  drivers/pinctrl/core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 3663d87f51a0..9fc4433fece4 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1602,9 +1602,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>         struct pinctrl_dev *pctldev = s->private;
>         const struct pinctrl_ops *ops = pctldev->desc->pctlops;
>         unsigned i, pin;
> +#ifdef CONFIG_GPIOLIB
>         struct pinctrl_gpio_range *range;
>         unsigned int gpio_num;
>         struct gpio_chip *chip;
> +#endif
>
>         seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko

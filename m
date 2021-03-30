Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419CB34E5DB
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhC3Kz7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbhC3Kzg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:55:36 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DE3C061574;
        Tue, 30 Mar 2021 03:55:36 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id f3so2237020pgv.0;
        Tue, 30 Mar 2021 03:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O0YD9xf83jFGgqYS1T0c6p91ad9dPXXOQ3N3xh5E1ak=;
        b=mbFTEhvz+vHmmp4K3JDx1Xi7lifD4tZiIorBU2FpgGZ5OZbQpyefDCeQK8Z/Tx+3IF
         b74t2vH7xeJfLvKTuiL/1BzcRdjLXxmmFzt2bDny1IUQLsRcv6hH0FCioICT67TeKrCf
         /Wn6hzB5a7REUMntEko6Zn+K7rD+0Mcvm8PyWlDwS4pYxzjmlTqKnDSMLhibBFLI+S6v
         vd/TUzCzMn0oYbBVj3mKTxp8Ic9+4lI0ah0qGN+FShMK+81XUtVskHU+TZ7NPzAxDKXv
         2ZUv3eyWV/fyZwVV/lMqdfYyjnAtvhbQEFHleW0I3res5Zuv5rN1/b1BrqStJCnPLBGZ
         z9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O0YD9xf83jFGgqYS1T0c6p91ad9dPXXOQ3N3xh5E1ak=;
        b=K52m5R3hdsYB78OZNzP8mZuxCpb4Uw55yZTmrNWHIRwPRmo1gO0jHBj9HmM7aqqHra
         IfsXI2Vy2TpYoj1ukTpk0IGvNYIbXLVGJIkA04YbGDp/TcLkw9y+1BKjapn0Q9q7DTNQ
         dUtYcXpD7BRDmT/c9CoDkmYz+wt4Tjkd7lnxSnZ4ofTTAx6nplWMxKxMq3lZsT6TznWY
         bqzJuabIKyZVo06IbImh4so2/WvHrR8p63atEWJhme70d6hJqxLPpbwH21wKCylc4j6u
         /6wpF4kYOycrPZ0oY4TfwTJt5d/7ZmgcqcgtDDp+2/9Er5nH7eWqA/oyGEkJpsSGw0Gv
         FGpw==
X-Gm-Message-State: AOAM532+oP7Q638FUj4CyGO2ZMejTcKc0TYknwvF/mYys7FfMbvqMWbV
        q9FoR4iK6dcR0w/ij0B4II+tJr2P5BWUKyDtflg=
X-Google-Smtp-Source: ABdhPJyYVOtJwGeqioL7Y0RCNhwClzK47F9hp/08LJ4eUXuTrXRump61CTb6aqcu3ECVHG26ujOfB3ylvoqBLHqEwvc=
X-Received: by 2002:a62:7c43:0:b029:1ef:20ce:ba36 with SMTP id
 x64-20020a627c430000b02901ef20ceba36mr29793664pfc.40.1617101735610; Tue, 30
 Mar 2021 03:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210330103225.3949-1-noltari@gmail.com>
In-Reply-To: <20210330103225.3949-1-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 13:55:18 +0300
Message-ID: <CAHp75VdCLuS-0YL6+_vz5GqJC9N0AOiuYazkB1VNvbsPD78NAA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm: bcm6362: fix warning
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 1:33 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> The current implementation of bcm6362_set_gpio() produces the following
> warning on x86_64:
> drivers/pinctrl/bcm/pinctrl-bcm6362.c: In function 'bcm6362_set_gpio':
> drivers/pinctrl/bcm/pinctrl-bcm6362.c:503:8: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
>   503 |        (uint32_t) desc->drv_data, 0);
>       |        ^
>
> Modify the code to make it similar to bcm63268_set_gpio() in order to fix
> the warning.

Seems good to me, thanks!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: 705791e23ecd ("pinctrl: add a pincontrol driver for BCM6362")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---

Missed changelog here.

>  drivers/pinctrl/bcm/pinctrl-bcm6362.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6362.c b/drivers/pinctrl/bcm/=
pinctrl-bcm6362.c
> index eb7ec80353e9..40ef495b6301 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm6362.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
> @@ -496,11 +496,11 @@ static int bcm6362_pinctrl_get_groups(struct pinctr=
l_dev *pctldev,
>  static void bcm6362_set_gpio(struct bcm63xx_pinctrl *pc, unsigned pin)
>  {
>         const struct pinctrl_pin_desc *desc =3D &bcm6362_pins[pin];
> +       unsigned int basemode =3D (uintptr_t)desc->drv_data;
>         unsigned int mask =3D bcm63xx_bank_pin(pin);
>
> -       if (desc->drv_data)
> -               regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG,
> -                                  (uint32_t) desc->drv_data, 0);
> +       if (basemode)
> +               regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG, basemo=
de, 0);
>
>         if (pin < BCM63XX_BANK_GPIOS) {
>                 /* base mode 0 =3D> gpio 1 =3D> mux function */
> --
> 2.20.1
>


--=20
With Best Regards,
Andy Shevchenko

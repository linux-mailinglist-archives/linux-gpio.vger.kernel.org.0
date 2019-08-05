Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A18812F2
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 09:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbfHEHSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 03:18:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40123 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbfHEHSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 03:18:34 -0400
Received: by mail-wr1-f68.google.com with SMTP id r1so83215077wrl.7;
        Mon, 05 Aug 2019 00:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7z7TxdT8LM5WCT5rFLppn3f5eATMhBkkA5pGtwYiQRk=;
        b=L/CU2KyhkgICxLau3rE+r3r+v4HcP2cmxBNeKqJqTE1mBMyzzS2Vkgxqx3I7+z9unA
         7i3gebW/XEzrm8e/6cenvmJOyhGaLW4gc8eL9+Y+fFLuwuxg+WJt05TBmrUttDwZcPoo
         aLHUARO5oqsmoQySrhwr47dbi+3bRGSjPUXLpKhVc4s1IRHq9bu64bPWp9xrYYY4wy+H
         fp2K+OsJJhp+DjQhBLmyQgI5MN0ZD9DdjfFVxmYOUDO8cdKOra9eyTNXpazGVVxFA7/P
         dAuy9UsFnZ7R+UfpG8x1O/XQdq8eolek5V5UKNtLAPPqOoHOg0EVMT0UqUjqN7e8u+lp
         /gmA==
X-Gm-Message-State: APjAAAXpzjsEiLNGYiTh/3mbWGW3Pd401LtzUMybHN7RL8OoVRJydEwR
        GzO1DNNu82ktJ2A9OfFO0ngXLD6wTgqMHn++IH4=
X-Google-Smtp-Source: APXvYqzrP4AePN9rc8s5m6cROt7iPLUC8FyQXF+ULNhFoyftI7RhZ3WzSqW9P+zefGbahYWpJN+sHyUyMAySC2w56Ig=
X-Received: by 2002:adf:ab51:: with SMTP id r17mr134648052wrc.95.1564989511601;
 Mon, 05 Aug 2019 00:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190804154029.2749-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190804154029.2749-1-nishkadg.linux@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 09:18:19 +0200
Message-ID: <CAMuHMdX5FFuHFtj3PmaXC1PFHAHKPoOs_ZLrzhCoyRVOM+ugOA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rzn1: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CC Phil

On Sun, Aug 4, 2019 at 5:40 PM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> three places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.4.

> ---
>  drivers/pinctrl/pinctrl-rzn1.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
> index cc0e5aa9128a..0f6f8a10a53a 100644
> --- a/drivers/pinctrl/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/pinctrl-rzn1.c
> @@ -412,8 +412,10 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>         for_each_child_of_node(np, child) {
>                 ret = rzn1_dt_node_to_map_one(pctldev, child, map, num_maps);
> -               if (ret < 0)
> +               if (ret < 0) {
> +                       of_node_put(child);
>                         return ret;
> +               }
>         }
>
>         return 0;
> @@ -792,8 +794,10 @@ static int rzn1_pinctrl_parse_functions(struct device_node *np,
>                 grp = &ipctl->groups[ipctl->ngroups];
>                 grp->func = func->name;
>                 ret = rzn1_pinctrl_parse_groups(child, grp, ipctl);
> -               if (ret < 0)
> +               if (ret < 0) {
> +                       of_node_put(child);
>                         return ret;
> +               }
>                 i++;
>                 ipctl->ngroups++;
>         }
> @@ -838,8 +842,10 @@ static int rzn1_pinctrl_probe_dt(struct platform_device *pdev,
>
>         for_each_child_of_node(np, child) {
>                 ret = rzn1_pinctrl_parse_functions(child, ipctl, i++);
> -               if (ret < 0)
> +               if (ret < 0) {
> +                       of_node_put(child);
>                         return ret;
> +               }
>         }
>
>         return 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

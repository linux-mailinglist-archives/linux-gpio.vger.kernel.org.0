Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD1E214B39
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2020 10:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgGEI63 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Jul 2020 04:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgGEI63 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jul 2020 04:58:29 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC922C08C5DF
        for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2020 01:58:28 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q15so36021582wmj.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2020 01:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fO8Sm7jhXe4mHOe8pjHRrbIqykTXXZPDSkAJJtQ0flQ=;
        b=UHqRHBrk/E0Nro7ziXuOaa2fcSqwoDgSjmxgLh47J+/bouQPDuI25LLgGRkyN8CPlE
         4HOBi7C6Iw5v8emKfPYbZGNGcECP0l6o68V5ju4IonzXU4QEzWHoi80mgtc3+R4gqhSN
         Y8mawndVwaQhVVTaiEBHwZiyZx7D+nhQuJHcJpe9084zirgn13roo0hlOdEzO85QZJdG
         WnbQahnJ/c0d2yVGP0tUV0+9QYXnB1Kul8CAZPxFqAxY8IvJ/zKot/73RedRcTcwwgXL
         GY/gWb1okutR4wDE3YeocsKJh//JH7pfgjRDtFgz4nj6DHgIMml7B8+VSAO3/JJ7Fvbr
         IC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fO8Sm7jhXe4mHOe8pjHRrbIqykTXXZPDSkAJJtQ0flQ=;
        b=gjZ5qG1z/V1nK5WBVzF99RYY4OtLzDAbTZqWaU3wfw+D41YLUDIYsQAM6jhf67Nvbl
         Ls1mN+huXna5DrSzl6HntlIxhZfjEMRLyuU2eUk0n4AHZCNhEhtR/si8yiDUNi3NzpMd
         0f3Ww+mFpoyKlB+7csiOAgU6qscK4z37tfLbuVfOzYa/T3O4/UPh4jyqiseNaGwOVX7U
         jcx5SMgj4xg+AtWyWt8wV+NXkUF/DCG4fvO1of+NDORXHBAvgjk9O27LfseLswLUnR3X
         Y6LpJULbmWxIYjFYbzmk/q/VnHfX9STzpCpFOF+7gMOG7EvP8yIPXGTg95VQq76CY1gM
         GbcA==
X-Gm-Message-State: AOAM532dpWS5nKOwf/ueQ5uWBq3yKCC5FgQbr+Qdf4feEvFV8ZB6xUGy
        9Frp6ISDQNPX+eR9n7DgppCdIZogVvF6A3yclQKMnA==
X-Google-Smtp-Source: ABdhPJxoXIiB/oovpbebj6RLBt4a0fIvvJskTiQi8g73R7Bb8eF1bsgPg6qJgADyzLpCZDir/JK2rDmBmjxOaavedyc=
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr43204822wmq.3.1593939507310;
 Sun, 05 Jul 2020 01:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200608125143.GA2789203@x1>
In-Reply-To: <20200608125143.GA2789203@x1>
From:   Haojian Zhuang <haojian.zhuang@linaro.org>
Date:   Sun, 5 Jul 2020 16:58:16 +0800
Message-ID: <CAD6h2NR3C0UPMR93jx3Hoo270ebfwXe8bx9WG9Edkf7nr2CQ9Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl-single: fix pcs_parse_pinconf() return value
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 8 Jun 2020 at 20:51, Drew Fustini <drew@beagleboard.org> wrote:
>
> This patch causes pcs_parse_pinconf() to return -ENOTSUPP when no
> pinctrl_map is added.  The current behavior is to return 0 when
> !PCS_HAS_PINCONF or !nconfs.  Thus pcs_parse_one_pinctrl_entry()
> incorrectly assumes that a map was added and sets num_maps = 2.
>
> Analysis:
> =========
> The function pcs_parse_one_pinctrl_entry() calls pcs_parse_pinconf()
> if PCS_HAS_PINCONF is enabled.  The function pcs_parse_pinconf()
> returns 0 to indicate there was no error and num_maps is then set to 2:
>
>  980 static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
>  981                                                 struct device_node *np,
>  982                                                 struct pinctrl_map **map,
>  983                                                 unsigned *num_maps,
>  984                                                 const char **pgnames)
>  985 {
> <snip>
> 1053         (*map)->type = PIN_MAP_TYPE_MUX_GROUP;
> 1054         (*map)->data.mux.group = np->name;
> 1055         (*map)->data.mux.function = np->name;
> 1056
> 1057         if (PCS_HAS_PINCONF && function) {
> 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> 1059                 if (res)
> 1060                         goto free_pingroups;
> 1061                 *num_maps = 2;
> 1062         } else {
> 1063                 *num_maps = 1;
> 1064         }
>
> However, pcs_parse_pinconf() will also return 0 if !PCS_HAS_PINCONF or
> !nconfs.  I believe these conditions should indicate that no map was
> added by returning -ENOTSUPP. Otherwise pcs_parse_one_pinctrl_entry()
> will set num_maps = 2 even though no maps were successfully added, as
> it does not reach "m++" on line 940:
>
>  895 static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
>  896                              struct pcs_function *func,
>  897                              struct pinctrl_map **map)
>  898
>  899 {
>  900         struct pinctrl_map *m = *map;
> <snip>
>  917         /* If pinconf isn't supported, don't parse properties in below. */
>  918         if (!PCS_HAS_PINCONF)
>  919                 return 0;
>  920
>  921         /* cacluate how much properties are supported in current node */
>  922         for (i = 0; i < ARRAY_SIZE(prop2); i++) {
>  923                 if (of_find_property(np, prop2[i].name, NULL))
>  924                         nconfs++;
>  925         }
>  926         for (i = 0; i < ARRAY_SIZE(prop4); i++) {
>  927                 if (of_find_property(np, prop4[i].name, NULL))
>  928                         nconfs++;
>  929         }
>  930         if (!nconfs)
>  919                 return 0;
>  932
>  933         func->conf = devm_kcalloc(pcs->dev,
>  934                                   nconfs, sizeof(struct pcs_conf_vals),
>  935                                   GFP_KERNEL);
>  936         if (!func->conf)
>  937                 return -ENOMEM;
>  938         func->nconfs = nconfs;
>  939         conf = &(func->conf[0]);
>  940         m++;
>
> This situtation will cause a boot failure [0] on the BeagleBone Black
> (AM3358) when am33xx_pinmux node in arch/arm/boot/dts/am33xx-l4.dtsi
> has compatible = "pinconf-single" instead of "pinctrl-single".
>
> The patch fixes this issue by returning -ENOSUPP when !PCS_HAS_PINCONF
> or !nconfs, so that pcs_parse_one_pinctrl_entry() will know that no
> map was added.
>
> Logic is also added to pcs_parse_one_pinctrl_entry() to distinguish
> between -ENOSUPP and other errors.  In the case of -ENOSUPP, num_maps
> is set to 1 as it is valid for pinconf to be enabled and a given pin
> group to not any pinconf properties.
>
> [0] https://lore.kernel.org/linux-omap/20200529175544.GA3766151@x1/
>
> Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> changes from V1 [0]:
> - if pcs_parse_pinconf() returns -ENOSUPP, then set num_maps to 1 and
>   proceed normally as it is valid for group to have no pinconf props
> - added Fixes: tag thanks to Gustavo A. R. Silva
>
> [0] https://lore.kernel.org/linux-omap/20200531204147.GA664833@x1/
>
>  drivers/pinctrl/pinctrl-single.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index 1e0614daee9b..a9d511982780 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -916,7 +916,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
>
>         /* If pinconf isn't supported, don't parse properties in below. */
>         if (!PCS_HAS_PINCONF)
> -               return 0;
> +               return -ENOTSUPP;
>
>         /* cacluate how much properties are supported in current node */
>         for (i = 0; i < ARRAY_SIZE(prop2); i++) {
> @@ -928,7 +928,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
>                         nconfs++;
>         }
>         if (!nconfs)
> -               return 0;
> +               return -ENOTSUPP;
>
>         func->conf = devm_kcalloc(pcs->dev,
>                                   nconfs, sizeof(struct pcs_conf_vals),
> @@ -1056,9 +1056,12 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
>
>         if (PCS_HAS_PINCONF && function) {
>                 res = pcs_parse_pinconf(pcs, np, function, map);
> -               if (res)
> +               if (res == 0)
> +                       *num_maps = 2;
> +               else if (res == -ENOTSUPP)
> +                       *num_maps = 1;
> +               else
>                         goto free_pingroups;
> -               *num_maps = 2;
>         } else {
>                 *num_maps = 1;
>         }
> --
> 2.25.1


Tested-by: Haojian Zhuang <haojian.zhuang@linaro.org>

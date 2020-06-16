Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4BB1FAB45
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 10:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgFPIcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 04:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgFPIcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 04:32:07 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8171C03E96A
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:32:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i3so17931299ljg.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sQ4U7wvoNlcpjuMW/4KAQuHPsQCChERlSO2SrjCLc4A=;
        b=yzgs82TyqjiolbSZa0hACzF4gN7GCdrUZ3PkJIwNsxrwGymEWug+COKC95YBk6TI0K
         2Y0WbWcE0rB11ecpIHasmBOEfu2LHU1jVxms4CkS6c1YBhHphAVGDqxKnQPW4PBBc7hb
         LMdJwAntiTOBJmW2XA6P3lnRabzZ3UT3E9uy8o/U1SwZ5oitYwRLHc5WSAN8DB/8WxGH
         VrB15nm/FvXI/F5bPdrN/KsIQp6inbymvEpyLN7rdC7zEFqzsH+Jxw7zBeSbaDF9hj4Z
         jaXPYaexNoE0Z92Ldpp3NqRRd9Su8ihOkFK3xJAvMTKv498p1DzKxsLxehhJydEQaZ+i
         fWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sQ4U7wvoNlcpjuMW/4KAQuHPsQCChERlSO2SrjCLc4A=;
        b=FDzrOFBYnF4jiv3U3kcJK8DSN0qeoLackkZiDOyz8bOIqrUGy7KI8PKZ//kWHgu2iC
         2qGLSr+5z5CloYl+iddAt1PGxzHZ/u9JTLu1hUpx1a/UTTW5B0QW6Ru32NCZUbEOyf/m
         01QPiar2bfwkL8xk3BqAObxgJkoMRENW3XuUo5yzLFX+nH6g4cBA5vDXEGfAuhG9UiOo
         bF8eZLWDOTkYbN/BJUSlg4iZR3P2i4ME1hl2jkY10Z9tqaVSOsqfN5/RCsh7qluNXPEk
         vDMM4HYvxa2jZ+DEnhwwMqo67/UIHvzz8zg4FEVmdgEQyQJQgD7i5SjcFjUUZ6r1yU07
         p8rg==
X-Gm-Message-State: AOAM533vwwwvwgVNTom78NsdZ8WsWO2mzz8p1NCu7f0WKdZTFET1pkXS
        Xt1EqI/mia3EXAKObfKBxg71C7nE1Zb7go406a/JvQ==
X-Google-Smtp-Source: ABdhPJzDjr7Vp4IVSdnf58s8G/HEW2ciu0txbLcKtPfjhvTLWtyM16wHBxujqgvNRbb533tvY8VqBYbmo4AT2CdyIOc=
X-Received: by 2002:a2e:350a:: with SMTP id z10mr837916ljz.104.1592296325111;
 Tue, 16 Jun 2020 01:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200608125143.GA2789203@x1>
In-Reply-To: <20200608125143.GA2789203@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Jun 2020 10:31:54 +0200
Message-ID: <CACRpkdZupnetd29aehw4HF3isGgRHbqxWZuTkPBusm_EmvjZ4g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl-single: fix pcs_parse_pinconf() return value
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 8, 2020 at 2:51 PM Drew Fustini <drew@beagleboard.org> wrote:

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

Patch applied as non-critical (for-next) fix.

If there is no hurry let's merge it this way with lots of testing
along the way.

Yours,
Linus Walleij

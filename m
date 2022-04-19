Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A801507957
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 20:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353671AbiDSSrA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 14:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353993AbiDSSq7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 14:46:59 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FE03E5F0;
        Tue, 19 Apr 2022 11:44:15 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id bb21so4034906qtb.3;
        Tue, 19 Apr 2022 11:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ci/7IqIwUm6bsFwKUgyhvCmAUTg6oVfUdrqG5mxHzkM=;
        b=QicDOzC56DQx1Ko5ZW3EYB0Nd1O/btrWXme/YC2ROJp8DpRY83nryVlJ38sVy7xOcA
         S2DzWepSJiM/8/b0uD/7cEt/qH18qCTwX68T0TxDFjg1gPkWxH/Y+BV/mlv3EjUTaFFB
         SR/AWOZmq/RJcWB3j713ln7+/KwX0UlqlnJRalMMSSpzfBFohXoo6lL8HsJOLKVsed16
         Vk45lJ+G3uxDfzAzqOoTr3nwhM7p6M7bw3vYra2JQHmfB+ETLBaQ80Vt287S0OiOKwfY
         q2UaT7+jWscYOTdFBlCWhYrH5apexflqxouCkIBtgEB+CJAUxYUgwqFslTXlrJzfBeC2
         V5OQ==
X-Gm-Message-State: AOAM531XmWko2CTIFVs3QIVgtnWyLmyZyJeMMuE+o+8skvUCv+z51r6v
        U9qkb3+HcTgbvSL5aIJsIDiWi934yKgz3A==
X-Google-Smtp-Source: ABdhPJwdnvh7m6Kqi8ArY0YWoGZsuYnQIhNhwHCAzpeMLMs4rfWyu8+RGN6F6ThO5cyfh+KHqMVPxQ==
X-Received: by 2002:a05:622a:1649:b0:2f2:418:8627 with SMTP id y9-20020a05622a164900b002f204188627mr5949958qtj.688.1650393853887;
        Tue, 19 Apr 2022 11:44:13 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id bl14-20020a05620a1a8e00b0069e622e593esm402445qkb.95.2022.04.19.11.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 11:44:13 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id d19so4284602ybc.5;
        Tue, 19 Apr 2022 11:44:13 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr16404838ybq.342.1650393853241; Tue, 19
 Apr 2022 11:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <5051ae56a1388ccf2d283dfc9624de2991cce914.1650355619.git.geert+renesas@glider.be>
In-Reply-To: <5051ae56a1388ccf2d283dfc9624de2991cce914.1650355619.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Apr 2022 20:44:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUt8iB3dQEppAjSkKpCxLUofbfH+=teJB1E0arKz2WkOA@mail.gmail.com>
Message-ID: <CAMuHMdUt8iB3dQEppAjSkKpCxLUofbfH+=teJB1E0arKz2WkOA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: renesas: checker: Rework drive and bias pin iteration
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 19, 2022 at 10:08 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The checker code to iterate over all drive strength and bias register
> description items is cumbersome, due to the repeated calculation of
> indices, and the use of hardcoded array sizes.  The latter was done
> under the assumption they would never need to be changed, which turned
> out to be false.
>
> Increase readability by introducing helper macros to access drive
> strength and bias register description items.
> Increase maintainability by replacing hardcoded numbers by array sizes
> calculated at compile-time.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Add and use drive_ofs() and bias_ofs() helpers, as suggested by
>     Wolfram,

> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -1007,7 +1007,18 @@ static void __init sh_pfc_compare_groups(const char *drvname,
>  static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
>  {
>         const struct pinmux_drive_reg *drive_regs = info->drive_regs;
> +#define drive_nfields  ARRAY_SIZE(drive_regs->fields)
> +#define drive_ofs(i)   drive_regs[(i) / drive_nfields]
> +#define drive_reg(i)   drive_ofs(i).reg
> +#define drive_bit(i)   ((i) % drive_nfields)
> +#define drive_field(i) drive_ofs(i).fields[drive_bit(i)]
>         const struct pinmux_bias_reg *bias_regs = info->bias_regs;
> +#define bias_npins     ARRAY_SIZE(bias_regs->pins)
> +#define bias_ofs(i)    bias_regs[(i) / bias_npins]
> +#define bias_puen(i)   bias_ofs(i).puen
> +#define bias_pud(i)    bias_ofs(i).pud
> +#define bias_bit(i)    ((i) % bias_npins)
> +#define bias_pin(i)    bias_ofs(i).pins[bias_bit(i)]
>         const char *drvname = info->name;
>         unsigned int *refcnts;
>         unsigned int i, j, k;

> @@ -1164,20 +1175,17 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
>         for (i = 0; drive_regs && drive_regs[i].reg; i++)
>                 sh_pfc_check_drive_reg(info, &drive_regs[i]);
>
> -       for (i = 0; drive_regs && drive_regs[i / 8].reg; i++) {
> -               if (!drive_regs[i / 8].fields[i % 8].pin &&
> -                   !drive_regs[i / 8].fields[i % 8].offset &&
> -                   !drive_regs[i / 8].fields[i % 8].size)
> +       for (i = 0; drive_regs && drive_reg(i); i++) {
> +               if (!drive_field(i).pin && !drive_field(i).offset &&
> +                   !drive_field(i).size)
>                         continue;
>
>                 for (j = 0; j < i; j++) {
> -                       if (drive_regs[i / 8].fields[i % 8].pin ==
> -                           drive_regs[j / 8].fields[j % 8].pin &&
> -                           drive_regs[j / 8].fields[j % 8].offset &&
> -                           drive_regs[j / 8].fields[j % 8].size) {
> +                       if (drive_field(i).pin == drive_field(j).pin &&
> +                           drive_field(j).offset && drive_field(j).size) {
>                                 sh_pfc_err("drive_reg 0x%x:%u/0x%x:%u: pin conflict\n",
                                                             ^^      ^^
> -                                          drive_regs[i / 8].reg, i % 8,
> -                                          drive_regs[j / 8].reg, j % 8);
> +                                          drive_reg(i), drive_bit(i),
> +                                          drive_reg(j), drive_bit(j));

Whoops, as reported by kernel test robot for 64-bit builds, drive_bit()
is no longer unsigned int, but size_t[*], hence "%zu" should be used
for printing.  The same is true for bias_bit().

Will fix up tomorrow...

[*] A bit counter-intuitive from the mathematical point of view,
    but as "size_t" is either "unsigned int" or "unsigned long",
    "unsigned int % size_t" is ... "size_t"!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

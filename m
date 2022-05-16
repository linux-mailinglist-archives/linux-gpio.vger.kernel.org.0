Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266975291B8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 May 2022 22:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343537AbiEPUcy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 May 2022 16:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349454AbiEPUcZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 May 2022 16:32:25 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33AF4133B
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 13:17:07 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ch13so30715897ejb.12
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 13:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxd7eLnFBnZ/Rq34pqmtOhmXz09WYv3YBBHEc2lj9Cc=;
        b=JMAEbqpjk2GQB8cxV89W/ZM7dJMlTCtwY6E8HYMyIGRyYIL01pLt3i7so9JkSPyzaI
         EfSAJ/toEX9h4fKY/xLsm2rFoFdurG4NBR8f0+FBa698CG60POD/yrpjoyKN8sy6AAOp
         c5TL8c++fd+dYS7I3gIMTb0xaaogtLh/EtL7hEKgAlvuWx8LTqGI46Y2vdePIkvXyWAp
         LOCy+yeSIUf7QK3bm7JSoDfwupR5+MSzSJXnNGDfZbI48Vb38Ac0HybcmpGss8U67w95
         DvAgQwd2Vlmlv9opRGgvhTGtlSUgvE2kSp9ajlyo7p36FCl+CQf7c4TPZQDVOpsg36mg
         Xj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxd7eLnFBnZ/Rq34pqmtOhmXz09WYv3YBBHEc2lj9Cc=;
        b=Q02MfDB/h3KBhH/kEk7z9nk+wPV7OjM99z01emFsiyltNqOMtI8j2O67txiaBgV7+z
         K7JdWI1Vy5VemB6v8KdnJ3r24MLEItMibY0bR73gDKRxaZq7Shc8UUTgH1Er4bGE7ZzX
         cvIF9H4A7IL5dZMKKUwYJoAvAsa5iknBYnBYGNyNTVfI/2RZJpFKQFovwbLMRYpgP2bM
         6AqS6j7I37soH2xoJ2kIiVtU4GF/AjBAL/e3wgBNRLuZ7XQ12Ug3uHyfarRQpbxo9xeJ
         BtcgXHkQKiVqe3+5C5zK4GiQoVACJ8TSaE2H4Wy2b/13mqxxzbvHeYYxODTXEMn7m/Do
         NfDA==
X-Gm-Message-State: AOAM532qJ9w2tJW8Co518FNGlCuJ3xudkLwFYtFpkMnAUpRT2RET7RI/
        Am4TPq+7UqcUIO9POp8C5bsl32LRLzRcvcgsd/Rfgg==
X-Google-Smtp-Source: ABdhPJzP5ce030z+5h5VghXXiAdcgk0nyBWSumzV3QjWG71lZk5KvuFJWcG18hpwsCUWBG/uZ8NZQaPTEL/fET8ndDI=
X-Received: by 2002:a17:907:3e28:b0:6f4:3900:78f8 with SMTP id
 hp40-20020a1709073e2800b006f4390078f8mr17439106ejc.736.1652732223724; Mon, 16
 May 2022 13:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220516085000.9861-1-wanjiabing@vivo.com>
In-Reply-To: <20220516085000.9861-1-wanjiabing@vivo.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 May 2022 22:16:53 +0200
Message-ID: <CAMRc=McM4X5--dUFUmGricbC_DYubpVk+CMD3odQLCkjxwFzWg@mail.gmail.com>
Subject: Re: [PATCH] gpio: ftgpio: Remove unneeded ERROR check before clk_disable_unprepare
To:     Wan Jiabing <wanjiabing@vivo.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 16, 2022 at 10:50 AM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> clk_disable_unprepare() already checks ERROR by using IS_ERR_OR_NULL.
> Remove unneeded ERROR check for g->clk.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/gpio/gpio-ftgpio010.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
> index b90a45c939a4..f422c3e129a0 100644
> --- a/drivers/gpio/gpio-ftgpio010.c
> +++ b/drivers/gpio/gpio-ftgpio010.c
> @@ -315,8 +315,8 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
>         return 0;
>
>  dis_clk:
> -       if (!IS_ERR(g->clk))
> -               clk_disable_unprepare(g->clk);
> +       clk_disable_unprepare(g->clk);
> +
>         return ret;
>  }
>
> @@ -324,8 +324,8 @@ static int ftgpio_gpio_remove(struct platform_device *pdev)
>  {
>         struct ftgpio_gpio *g = platform_get_drvdata(pdev);
>
> -       if (!IS_ERR(g->clk))
> -               clk_disable_unprepare(g->clk);
> +       clk_disable_unprepare(g->clk);
> +
>         return 0;
>  }
>
> --
> 2.36.1
>

Applied, thanks!

Bart

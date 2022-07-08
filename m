Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B89D56BD96
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 18:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238332AbiGHPwi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238403AbiGHPwf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:52:35 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F3E74357
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 08:52:33 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id r6so15934513edd.7
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bdWdYayU9uTcudfFu7FvdwJK73I7yqzxqoweVLabB2o=;
        b=YhIaZu3Np+DVQsSUF8kAuNaGeDulKvHg3AZWW1+FFISYVVpZPZAmfv+tXxGQGAjOQ5
         Fn4H7ArIZQB/iZkY6bybgL5iUVI4y1r4LO4X8SzbnibhArbFd93A3/EKywtcTUd7EL1n
         44V+TljmedTs4jlAQyJ7E2lt7kkxcpVPfWVtlo64E6VPEgzTXpIeXRtp19CMS9HOMVNg
         kba6H4hpG/rk1c3OAjeknTm39M+rCmXbr4of1XHWSggtkyfNCJQrBZ80IHIbBJ/8yUOT
         3KNO/HlDswsvNkg6BB2sBNtO7VkFlZS6KhPYZnXO/oFvvXIv1JiRCVzka+aVFJyj3rdG
         Xtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bdWdYayU9uTcudfFu7FvdwJK73I7yqzxqoweVLabB2o=;
        b=fU4PR/98NfMxkjvW0mdgbMybYD0V1pR0UPX7v6K6YuTeoOmgIcgSUR4/VEa4lbCxUa
         q9nBE/GteChOFHC0aMDHkiROoImWaZlKzyjHX2W+pMH5GGJE6XApMlrHPtggOiIviT2V
         cca2euV9DkzwpJOHRkTSOVU0A/yFwD6xmyMwDuNwfQj6xsgu8JjRK/zyQW0jgGxjyegi
         VU8ZsDDQICibvxe+D24v1FOOy5+KoMdPxAhyBJmTP/CX2QZaTZLZVZ4KyrM8YdORbeD4
         scC5D7q3A8D74DRVZj/Y4CUWjjsHpfprwOgihkQIsiXqB0mJqobH6rsXRZJaVi86DpM6
         cueg==
X-Gm-Message-State: AJIora9okM4CjxWw525NUFnhquJvSEz4EqkbLQ7lw49BkhAH+w0Mtstn
        DI7WHqGpQgPH58n7XtNFa/yXFnOGgjWNzA3Q9CqAIw==
X-Google-Smtp-Source: AGRyM1uLMvjXfvEpGYBaMFejjQenN3mbzGVcUcaILvjndi/dBVYImV0w2OETrCJO2TR8Si/5kOjqOyLisgy1w7YJa/Y=
X-Received: by 2002:a05:6402:2786:b0:435:da07:14cb with SMTP id
 b6-20020a056402278600b00435da0714cbmr5751720ede.408.1657295551537; Fri, 08
 Jul 2022 08:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220707182314.66610-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220707182314.66610-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220707182314.66610-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Jul 2022 17:52:21 +0200
Message-ID: <CAMRc=MdJDwMSHjWd1dUjVp72fRU+_MGKcr=F-HCOzr8KaUoWDw@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] gpio: gpiolib: Allow free() callback to be overridden
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 7, 2022 at 8:24 PM <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Allow free() callback to be overridden from irq_domain_ops for
> hierarchical chips.
>
> This allows drivers to free up resources which are allocated during
> child_to_parent_hwirq()/populate_parent_alloc_arg() callbacks.
>
> On Renesas RZ/G2L platform a bitmap is maintained for TINT slots, a slot
> is allocated in child_to_parent_hwirq() callback which is freed up in free
> callback hence this override.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpio/gpiolib.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index bfde94243752..68d9f95d7799 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1181,15 +1181,18 @@ static void gpiochip_hierarchy_setup_domain_ops(struct irq_domain_ops *ops)
>         ops->activate = gpiochip_irq_domain_activate;
>         ops->deactivate = gpiochip_irq_domain_deactivate;
>         ops->alloc = gpiochip_hierarchy_irq_domain_alloc;
> -       ops->free = irq_domain_free_irqs_common;
>
>         /*
> -        * We only allow overriding the translate() function for
> +        * We only allow overriding the translate() and free() functions for
>          * hierarchical chips, and this should only be done if the user
> -        * really need something other than 1:1 translation.
> +        * really need something other than 1:1 translation for translate()
> +        * callback and free if user wants to free up any resources which
> +        * were allocated during callbacks, for example populate_parent_alloc_arg.
>          */
>         if (!ops->translate)
>                 ops->translate = gpiochip_hierarchy_irq_domain_translate;
> +       if (!ops->free)
> +               ops->free = irq_domain_free_irqs_common;
>  }
>
>  static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
> --
> 2.25.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

Which tree is this targetting?

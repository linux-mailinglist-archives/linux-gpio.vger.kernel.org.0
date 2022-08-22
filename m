Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A86559C4B4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 19:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbiHVRJV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 13:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237201AbiHVRI4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 13:08:56 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07783DF04
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 10:08:26 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id q2so12663940edb.6
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 10:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VcHeHOgMzpHFjV9q0iYLqwua0z0eWivxKKVLx5wZcKM=;
        b=WRztOXCrfpLU9YhqRcSBJs6ojbRwUnW8Jgwi+Bh+2RpMIphjvZ3+Ks7dz5wPOPyhPG
         FzwZ51FO6Uuwg50qmlVCdPfBet6nlujjKOG8f+4sY/VamdMJ9dpU5ZvhjwxhUisKAPu8
         LNlv3wCuVSY8peVYoT00k0u40xLQGE31PHgpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VcHeHOgMzpHFjV9q0iYLqwua0z0eWivxKKVLx5wZcKM=;
        b=rQTdvTLvvR0GfYQrgvqKnUM7xVtel4p3weiGKLnVpQ9LXbyyyvL7e3vIJm8guFZkd7
         qlXnAda/kauP53kDAhy/sBqc/5eKa0WpERukC1x84ywaSQVLJwxo7KCErjf3yG+SYKhC
         oWui2spL3x3SVpkXtlIKOrGov24IaOTAjgh3TUrAkwtU5G251wCYrS1pIFUbhqSg0I6o
         p80tEWayPxGHy6BAJsyvusJXR7YjaGwuP11wi5aFFstkD2BF746xL3zFVMWna7orWSSW
         kfaIRs2AZnp+8BFMNjL8kmNIUWqJv529K6kww1qTRVnkciTBE7GYcxAQ1pSSrQ+8LwpE
         BI6A==
X-Gm-Message-State: ACgBeo2SJAJNnDIc7JVjyLzqJYuQul+7ZJueG3jTfAIlZRrpTQaxfwYj
        dGRST0I7SdEVJUK5+9r9oGZxepzSlPiWKE6I
X-Google-Smtp-Source: AA6agR4roKkBXewbl3awR5/faVE3uihfNIXuj20lLzhsoNcP4wU1rcFw4nzOhca787JE/C4aMs3ZuA==
X-Received: by 2002:a05:6402:448b:b0:43b:5ec6:8863 with SMTP id er11-20020a056402448b00b0043b5ec68863mr100317edb.377.1661188105027;
        Mon, 22 Aug 2022 10:08:25 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906200200b0072aa009aa68sm6474332ejo.36.2022.08.22.10.08.23
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:08:23 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso8184835wmc.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 10:08:23 -0700 (PDT)
X-Received: by 2002:a05:600c:5114:b0:3a6:1ab9:5b3d with SMTP id
 o20-20020a05600c511400b003a61ab95b3dmr12466472wms.93.1661188102603; Mon, 22
 Aug 2022 10:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220820095933.20234-1-jeffy.chen@rock-chips.com> <20220820095933.20234-2-jeffy.chen@rock-chips.com>
In-Reply-To: <20220820095933.20234-2-jeffy.chen@rock-chips.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Aug 2022 10:08:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0qJ2OC1SrAmhSQ5YeKEwvsSCbfVGPh457YYEuPCbRtg@mail.gmail.com>
Message-ID: <CAD=FV=X0qJ2OC1SrAmhSQ5YeKEwvsSCbfVGPh457YYEuPCbRtg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio/rockchip: Toggle edge trigger mode after acking
To:     Jeffy Chen <jeffy.chen@rock-chips.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Sat, Aug 20, 2022 at 3:07 AM Jeffy Chen <jeffy.chen@rock-chips.com> wrote:
>
> Otherwise the trigger mode might be out-of-sync when a level change
> occurred in between.
>
> Fixes: 53b1bfc76df2 ("pinctrl: rockchip: Avoid losing interrupts when supporting both edges")
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> ---
>
>  drivers/gpio/gpio-rockchip.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index a98351cd6821..736b4d90f1ca 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -338,7 +338,7 @@ static void rockchip_irq_demux(struct irq_desc *desc)
>                 irq = __ffs(pend);
>                 pend &= ~BIT(irq);
>
> -               dev_dbg(bank->dev, "handling irq %d\n", irq);
> +               generic_handle_domain_irq(bank->domain, irq);
>
>                 /*
>                  * Triggering IRQ on both rising and falling edge
> @@ -370,8 +370,6 @@ static void rockchip_irq_demux(struct irq_desc *desc)
>                                                      bank->gpio_regs->ext_port);
>                         } while ((data & BIT(irq)) != (data_old & BIT(irq)));
>                 }
> -
> -               generic_handle_domain_irq(bank->domain, irq);

I'm happy to let others say for sure, but from my point of view I'm
not convinced. It feels like with your new code you could lose edges.

The abstraction I always assume for edge triggered interrupts is that
multiple edges are coalesced into one IRQ but that if an edge comes in
after the first line of the IRQ handler starts executing then the IRQ
handler will run again. In other words:

- edge A
- edge B
- IRQ handler starts running (once for A/B)
- IRQ handler finishes running
- <idle>
- edge C
- IRQ handler starts running (for C)
- edge D
- edge E
- IRQ handler finishes running
- IRQ handler starts running (for D/E)
- IRQ handler finishes running
- <idle>

For your new code I don't think that will necessarily be the case. I
think this can happen with your new code:

- rising edge
- IRQ handler starts running for rising edge
- IRQ handler finishes running for rising edge
- falling edge (not latched since we're looking for rising edges)
- notice that level is low
- keep it configured for rising edge

...in other words an edge happened _after_ the IRQ handler ran but we
didn't call the IRQ handler again. I don't think this is right.


What problem are you trying to solve?

-Doug

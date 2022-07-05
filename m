Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2285672D4
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 17:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbiGEPk0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 11:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiGEPk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 11:40:26 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FA8101A
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 08:40:24 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y4so2438553edc.4
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jul 2022 08:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mUAPPwRP9/XIOIP2jsSLrVL5MQN3urSMDTbIJ4BDoYo=;
        b=jSHIKd+bFQa+hywvURsDB45NPGNTQayCvYijgjlLfjKtF7yNNBpcvV4Nphokt/nz0N
         gtukNvg4Rob4FENwXNDvzKsAI0iTQzQMpDVsOD5jQGv4W0xIHPggmQP0h7orS3S2h67H
         Ug2dJfnEiaKalZSATkkAvnP8W2grL1o/6GrfLK7p1X2OBGCLW7PEM0ravJ4udzFthGwX
         4FJImY1W5VkuBYqjDcAXjqdCMXCpAgub65f5dQPR7xKbw7lV9ZY7gMOY4PFYPBEP4m3S
         V9WeZ3ZyWh46fLQR33Pc8rPW/69u2g930btbvHT2Dz4XTLDv35I+ATrGGrcXH3/MegGU
         QFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mUAPPwRP9/XIOIP2jsSLrVL5MQN3urSMDTbIJ4BDoYo=;
        b=iuBLp4vULABMhWKqHsbDytZCGiZNc939xaTZcOtnRegcwza91fsquch53iOrbcNXL3
         lY+1oHAeudbsKkLbCmvYcBK/ryo9ClsrImAWYa5vpZ9XtUU8HJh5PCKo0gGCKd/i65pU
         7QNcyKItnSwqmCUcFW+C0L1RYyFAYvj/ceNpTenN6Ic78dOLzRwWHzJ4jTo+VvDi7RXd
         iLZK3zwgM3c0n1Mk12hc7aNS/jeRo4eADWqCWzUca/K3t+Xfh/e6KYTyzRnjQUJWAfIY
         M/CjlHHLbY9xP+GqNsNDcRvQW/OQ6MKmsXfYIOeAMQHU2s9NioRjXy8CwmJRjTsNqCZi
         ODdg==
X-Gm-Message-State: AJIora80EjEOn69L2rUCDlKmYe3xHnylzTd//6KTWNAKSOsAhFemwDUt
        urC11qnwP1e340FVWB+lUQaNO6cv7S2UbBhwfKLlRQ==
X-Google-Smtp-Source: AGRyM1u0Xc3DAA+JkK/4cfkMVrwft+Gf70g4xUpzXQKqIuP3Q+DexFp088yGlFXbKBNPFVk8RhSKEstkHLouhLByssk=
X-Received: by 2002:a05:6402:4518:b0:43a:3b90:7457 with SMTP id
 ez24-20020a056402451800b0043a3b907457mr17883089edb.422.1657035622614; Tue, 05
 Jul 2022 08:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220704091313.277567-1-windhl@126.com>
In-Reply-To: <20220704091313.277567-1-windhl@126.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Jul 2022 17:40:12 +0200
Message-ID: <CAMRc=MdGR4BdH4FfiRjzHY2uS7=13qRKzQZj9jcw5PnghYT2Gg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
To:     Liang He <windhl@126.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 4, 2022 at 11:13 AM Liang He <windhl@126.com> wrote:
>
> We should use of_node_get() when a new reference of device_node
> is created. It is noted that the old reference stored in
> 'mm_gc->gc.of_node' should also be decreased.
>
> Fixes: f141ed65f256 ("gpio: Move DT support code into drivers/gpio")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/gpio/gpiolib-of.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 3d6c3ffd5576..de100b0217da 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -860,7 +860,8 @@ int of_mm_gpiochip_add_data(struct device_node *np,
>         if (mm_gc->save_regs)
>                 mm_gc->save_regs(mm_gc);
>
> -       mm_gc->gc.of_node = np;
> +       of_node_put(mm_gc->gc.of_node);
> +       mm_gc->gc.of_node = of_node_get(np);
>
>         ret = gpiochip_add_data(gc, data);
>         if (ret)
> @@ -868,6 +869,7 @@ int of_mm_gpiochip_add_data(struct device_node *np,
>
>         return 0;
>  err2:
> +       of_node_put(np);
>         iounmap(mm_gc->regs);
>  err1:
>         kfree(gc->label);
> --
> 2.25.1
>

Have you noticed any issue with reference counting that made you post
this patch? We typically "borrow" the reference to the platform
device's of_node in GPIO drivers (and everywhere I can think of too).

Bart

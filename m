Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C1452BE47
	for <lists+linux-gpio@lfdr.de>; Wed, 18 May 2022 17:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238962AbiERO7o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 May 2022 10:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238888AbiERO7k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 May 2022 10:59:40 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D1A19FB3A;
        Wed, 18 May 2022 07:59:39 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id n10so4378840ejk.5;
        Wed, 18 May 2022 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ghJb9MXOvPjVbNP2O+VvilLUlkkCEx3WunS6BB5Uc4=;
        b=XB1PCP63p5IcPuRby4NOXLPeQmPAAJR/xJ32cC19iUtkhwaH25uzpPFyNyxYM6+XZD
         lWullQw1lRNhWje4m6l2MRtHI8axUnC2D7NmtYBqJlrrZjhP0Q7UP1TkwmPWICZsxsJ2
         HrqhOotv2Ii7WFFSWAag0MZumtWlvz07eg+f6wt0YpDEVkwRJsW65UMpMYixTVKn4Ntu
         wlkUvPcRlEsTk308h123bQ/NEmTOR1nPP/a9A2HKDsfcsN2TS+kr2DgKR8OB2Bnar7xN
         QOETZjEwc+qPIByBOVWovJmyidy5MMBwyMLnUr/HlBJznDh6oF2K3n/gw+Kc05cRuOya
         i+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ghJb9MXOvPjVbNP2O+VvilLUlkkCEx3WunS6BB5Uc4=;
        b=kTHllVGGFfjmOlNqjWJw4w87wD+fCMuC3q/hPDUdUcVJcyWxbkqnBKy3a1vSew+HTh
         coe25l27+Wm9o2YteIoJfIrH+zKeVa6ueiJOOhUW8kAMIM6iNSRQ37BJ+nltsEohtJ+L
         5ykamR1ldt/cOGvxwVdmjrli+dJ6ciHa/oy/F1dq+skc50dNK1eipiWSIeBm8CATKV46
         zueHBTXj3VYu6OGp33sgqgnGQwyxS5lGKSoIf27MYAwtbwTmJBQGxpJUK9AsY+mXYj74
         gyDtyvMqWJFgSrfdYAULvzEkTlOa13cyZH5/Q7dbBldM6iL//KktqPMfPKuqCffQ5IAF
         aSRg==
X-Gm-Message-State: AOAM532t82MnFFUaX7mUTB/PtNkRftcXUQWk9bO2rnpl/Yy2mnWrVd0K
        z7dvC8OO5OoPeQGSIS+3lczSYxKYQ2HmVo5iTOTy9cOtBUp/Gg==
X-Google-Smtp-Source: ABdhPJxh9Dl/E85FkZ/QleUoSSfmHcZ+WPUZf4Hmz9IBTvfJF0iRVB3rdAjQu7bZCo3MCTYA15vyGZpm0auz11BdxoQ=
X-Received: by 2002:a17:907:6d8a:b0:6fe:1b36:dfcc with SMTP id
 sb10-20020a1709076d8a00b006fe1b36dfccmr19051240ejc.579.1652885977469; Wed, 18
 May 2022 07:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <6dc8b18570f63d9841c11441c8d203ee655007c7.1652879174.git.geert+renesas@glider.be>
In-Reply-To: <6dc8b18570f63d9841c11441c8d203ee655007c7.1652879174.git.geert+renesas@glider.be>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 18 May 2022 16:59:00 +0200
Message-ID: <CAHp75Vf4i7SMzfNhszCxpbbGo-ffDTnHeLatDDAdB33LxTKkHg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Make the irqchip immutable
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 18, 2022 at 3:08 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

Thanks for your patches!

> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the pca953x driver:
>
>     gpio gpiochip7: (0-0020): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the pca953x driver immutable.

I have two fixes against documentation [1] and here is exactly the
point to do it better.
Please, update all your patches accordingly.

[1]: In one of the recent Linux Nexts:
e9fdcc2d8376 Documentation: gpio: Advertise irqd_to_hwirq() helper in
the examples
bdb6528ec550 Documentation: gpio: Fix IRQ mask and unmask examples

...

>         irq_hw_number_t hwirq = irqd_to_hwirq(d);
>
> +       gpiochip_enable_irq(gc, d->hwirq);

We have already hwirq.

-- 
With Best Regards,
Andy Shevchenko

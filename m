Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F2667E0B3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 10:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjA0Jt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 04:49:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232864AbjA0Jtr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 04:49:47 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A80484B6B
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 01:49:32 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id y8so4802739vsq.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 01:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AUUuJl2q8AkfVHgAZQy3gHxuDCBbky9Zp51W1JV0Lc8=;
        b=ZWM/8gt75YsDeoGxqxJnos5Xs+fmdlPx6IBlEcPTl4KOImVEW6O+cm02bWXrKWTLJm
         Vb29Yp1EXuFLgBGixVysC5Ru9XpNuspBxG2sQd5G1KrJhZ2oCYV9YufJZhUdEx9Di7HZ
         VlhUe7cQXXl2I/+7ODcagTbmkOIxnRGBqQKYZ0JH7fUSpnKABJHhX3MxXx30biHtZVnm
         bXSLKinXrtT7kEkGnej3ketiwSffbZmFBtpMBFjoHYwsu/bRIM1Cy0sMEJGseOh0eMcS
         YB+0u/esz6RAOE4AIYdeSTrLQBOVAsGZ1/tvwjSxhmUzb+PXQdKgfZW3zXiVzgD5EDQO
         Ue4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUUuJl2q8AkfVHgAZQy3gHxuDCBbky9Zp51W1JV0Lc8=;
        b=zLHNBd7KzBtSF8yH55HaYmQt7ZW7gf+qCFyoHUJV/XDA/dyrcaAp0WVW/iOqLfTIlY
         osVUJ5vSKapTR0DQvDnZkWZoUGIdedkcsVcnu3NoTbC9DcfvqPx/j6bZ/Z7On4pbNbn6
         eu+deuIeZB56yMq+489h0JpJBKZvQVJV7PLwaU47hZmWgVKqHU49cXmZLIfNTRu1H7AL
         07/zXPyZpZwObhBkQMzLy+pSrLJcgbhbbvFDbGwucnwkxOCvwHfVaQn37cNEd6HbpFU/
         NktLUk4/LcOcbAm4i96M95J372krEkH50IafwwswFtPfUNBE3HpaTagB+lFZtjmseqRr
         Fd2Q==
X-Gm-Message-State: AO0yUKVoI6g46R+ml59SQGMlroBh59G6Vme4jF2k1trPY9uUvSg1f1H5
        kR874tL4ViUrHfR6seJQVKeWdLJmIyI4ZwOzBF1UlA==
X-Google-Smtp-Source: AK7set8e57IW3jqMWXQ1ISBBBnd8nI5ckI+rL02/4amoAMdB+UV6e7EAwUtAWeI0j08v8hYp6L+m73QXxeTsBQChqwE=
X-Received: by 2002:a67:c384:0:b0:3e8:d5a8:3fbe with SMTP id
 s4-20020a67c384000000b003e8d5a83fbemr1268164vsj.9.1674812971733; Fri, 27 Jan
 2023 01:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20230127093512.2066158-1-arnd@kernel.org>
In-Reply-To: <20230127093512.2066158-1-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 27 Jan 2023 10:49:20 +0100
Message-ID: <CAMRc=MfFA=z4haxgBrRP89EPUDKuzEva4grtpRxmZPh5wXXpAA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ep93xx: remove unused variable
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 27, 2023 at 10:35 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This one was left behind by a previous cleanup patch:
>
> drivers/gpio/gpio-ep93xx.c: In function 'ep93xx_gpio_add_bank':
> drivers/gpio/gpio-ep93xx.c:366:34: error: unused variable 'ic' [-Werror=unused-variable]
>
> Fixes: 216f37366e86 ("gpio: ep93xx: Make irqchip immutable")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpio/gpio-ep93xx.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 192be99b1392..6cedf46efec6 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -363,8 +363,6 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
>
>         girq = &gc->irq;
>         if (bank->has_irq || bank->has_hierarchical_irq) {
> -               struct irq_chip *ic;
> -
>                 gc->set_config = ep93xx_gpio_set_config;
>                 egc->eic = devm_kcalloc(dev, 1,
>                                         sizeof(*egc->eic),
> --
> 2.39.0
>

Applied, thanks!

Bart

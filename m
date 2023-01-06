Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EECF9660100
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jan 2023 14:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjAFNOk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Jan 2023 08:14:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjAFNOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jan 2023 08:14:39 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EBE71FF7
        for <linux-gpio@vger.kernel.org>; Fri,  6 Jan 2023 05:14:38 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id x65so1379356vsb.13
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jan 2023 05:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kRSichjsSpl7nn5VML7hlKwtWCxMGkZW9sF0ceCpu7Y=;
        b=7nOV/pGUMtVuAg1wKzMZoJfLp+ifawDysT1k1gSKBnWNmZxkNlDd+a9s4ja2CzEzdJ
         ewZnZ2O3WCbXCqHy6TZO/py3dGt2C+U7slBz7sP6qeoaOzc39Uuz5nGDLtwc3m099+Ba
         8Z9AHA/Cb6lncQEDvS6LzH3vDS3i79asj/1VypjVxg7qQuTGxAaWiuKvNl+4D6R1wmoK
         OHQYm1kXGZLLPW4mskl74LpBC2/eb1aYTC7BRu+SGUu/B84EQC58uVxczdDUNbnVT+ic
         QyYkKm88vf1vmOk4xMsEfWHHXrDXOXxha6SDlhxu4IBkwSrD7qs2X0/OdJai0afC9zxV
         Zs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRSichjsSpl7nn5VML7hlKwtWCxMGkZW9sF0ceCpu7Y=;
        b=381BWTPyPEvfebcJ6IhRzalEqPAFWVI1PKGK8cbq0n2UrUTNiUs5MXGvBdCGinTV7C
         JVh66Qn69Jo9ysl7UShg23SZlT5kE0nOy/bZsAQSL5S75Zx6ZtfSzomNXFBMcd93F+8Z
         APpiJGxe6JQB9R+cAA8+ptEAm1OVLPfBMLes61hgvXecYzKQX+ZpCWzvZSD8VkoM7c6J
         HZeRboe9frOuLsvchT0rny4W5u7kGbTrU55ZuVmuxPjbF1HW7E2oaBE38Eby27WDAwcF
         48fcm7oN1wneGHZUMbr6F/yikHc9NW+T6CnBxPrPSuBw8ceTOZncssar80uMuuEawPF5
         JCow==
X-Gm-Message-State: AFqh2ko63uzv8lxxRxIwYmWg2OTRwd4IT6V23MdIaKIbljbKmwWxpshy
        nn1wOiEZoIHW9r9Dauq2J8uDjgaI4WDiNaoLj2yEDw==
X-Google-Smtp-Source: AMrXdXu7UBvoVaA3py91tPW1+5NfFOXh7jkcGj9+qlFVxuoA0psBokCY/DlLkdH01j7W9wipaLbbX/zr3ecBEiacoO4=
X-Received: by 2002:a67:f642:0:b0:3c4:ec4b:b943 with SMTP id
 u2-20020a67f642000000b003c4ec4bb943mr6737873vso.17.1673010877549; Fri, 06 Jan
 2023 05:14:37 -0800 (PST)
MIME-Version: 1.0
References: <20230105150603.2810510-1-michael@walle.cc>
In-Reply-To: <20230105150603.2810510-1-michael@walle.cc>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Jan 2023 14:14:26 +0100
Message-ID: <CAMRc=McEin9uXOFEeB1=oDKmUTu+hvKoaUGjCx-7Prc7RXubJw@mail.gmail.com>
Subject: Re: [PATCH RESEND] gpio: regmap: use new regmap_might_sleep()
To:     Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 5, 2023 at 4:06 PM Michael Walle <michael@walle.cc> wrote:
>
> Now that the regmap can be queried whether it might sleep, we can get
> rid of the conservative setting "can_sleep = true". New drivers which
> want to use gpio-regmap and can access the registers memory-mapped won't
> have the restriction that their consumers have to use the
> gpiod_*cansleep() variants anymore.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/gpio/gpio-regmap.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index f907c9c19fce..fca17d478984 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -254,15 +254,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
>         chip->ngpio = config->ngpio;
>         chip->names = config->names;
>         chip->label = config->label ?: dev_name(config->parent);
> -
> -       /*
> -        * If our regmap is fast_io we should probably set can_sleep to false.
> -        * Right now, the regmap doesn't save this property, nor is there any
> -        * access function for it.
> -        * The only regmap type which uses fast_io is regmap-mmio. For now,
> -        * assume a safe default of true here.
> -        */
> -       chip->can_sleep = true;
> +       chip->can_sleep = regmap_might_sleep(config->regmap);
>
>         chip->get = gpio_regmap_get;
>         if (gpio->reg_set_base && gpio->reg_clr_base)
> --
> 2.30.2
>

Applied, thanks!

Bart

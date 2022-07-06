Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3F595688EA
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 15:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbiGFNEJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 09:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233608AbiGFNEI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 09:04:08 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CD017A9D
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 06:04:05 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-31cb2c649f7so64699697b3.11
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7dwjfoOIIU+TiCLmYdJFLXODCEUtQo0VuuQY6yzOk9E=;
        b=gNMc/KykZnyGtljpActfBSnyhcr2S1YPsD28zxenAeY4JSRR379T9umBDRbiMyAvaI
         GbLhlmj3q7GVhHO24j4HnQHv96E/eAKm7Q5vD1QPIUDtFADD8hz1bOrRsIb5phM4EAXc
         HR3A8qMUT6YTJ8XerqAU+bUmkG41KoB0hOGyYILNz8kK+g8+ze3UUj1MYL1trgKHbAHl
         LYfnwE+C95x9eZ8DbBSebL+wAsTo55Ul3Qi4fp0jgNvc3oDjlZZm4aRusO6i+ZCWpGED
         RjRwPR3YBkS5f9tMM6x0qvAFjDXkflhcWnebV/STYUfobdRkzn0G/TemI7+/wMN1EaFn
         sVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7dwjfoOIIU+TiCLmYdJFLXODCEUtQo0VuuQY6yzOk9E=;
        b=f1OVXIh/41lFy9fNQ2g3za3twoaobCFrUUlAn8glS1qQ6qtDxsYLK9SZjOpIj4rAt0
         vVpJiLIvzdJP9ZgJJN8AxYyM+2uYuhJ+xWZmniKWTBOM9DIvgkvH8+psMga0LrMROiQ6
         lhyxRqJ7AW7AwCBXz5QG28LJl/M6alEiE8DPi+1qsMKIOtP8x2/KZ18Hi/pMhrvM2ms0
         MIIZTzX9G6oBoKgogEAeSmVlTeX1r/zW+tEjzRhnx6ptBARkyiGRa75HwtuLxEcHxrr0
         la4AiNkmyecOvhsPHdV+oTj+sPvw5MsvisuuEnt3LsIVUky2G9AddWyOJVHjzSv5OY1U
         7cng==
X-Gm-Message-State: AJIora+Jk1phvXXVuFMkRG+1CS3nN8c3/5RzNMmLTjTqa+UgQdVbb2+z
        LhflqX2dVg6/MJiSS7lK8jjntxeNDi5qEsaJWWk=
X-Google-Smtp-Source: AGRyM1u90COtnPWMnAy6VT8rLiolD83cw8+gRTpu5VY4OCJapD5LvjGP9bHkUFQ0X9p4J4bHekbfEbtMD/inYuVSadA=
X-Received: by 2002:a81:8397:0:b0:31c:8a02:3f6d with SMTP id
 t145-20020a818397000000b0031c8a023f6dmr21255811ywf.486.1657112644428; Wed, 06
 Jul 2022 06:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220706060222.302051-1-windhl@126.com> <CAHp75VdWBx2hMyu6902exeist24cm5NnO3z9aKjhV=H5tb8y9g@mail.gmail.com>
 <10b8f377.75ee.181d390dfe0.Coremail.windhl@126.com>
In-Reply-To: <10b8f377.75ee.181d390dfe0.Coremail.windhl@126.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 6 Jul 2022 15:03:27 +0200
Message-ID: <CAHp75VdXkbkqMje6B+Q7DvWsapTbRtASGuW4SwFhBN_85_OxfA@mail.gmail.com>
Subject: Re: Re: [PATCH] gpio: rockchip: Fix missing of_node_put() in
 rockchip_gpio_probe() and rockchip_gpiolib_register()
To:     Liang He <windhl@126.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

On Wed, Jul 6, 2022 at 2:51 PM Liang He <windhl@126.com> wrote:
> At 2022-07-06 20:27:41, "Andy Shevchenko" <andy.shevchenko@gmail.com> wrote:
> >On Wed, Jul 6, 2022 at 8:29 AM Liang He <windhl@126.com> wrote:
> >>
> >> We should call of_node_put() for the reference returned by
> >> of_get_parent() which will increase the refcount.
> >
> >Is it suggested by the so-called Hulk Robot? If so, it's not the first
> >time I see that people don't think about, and just repeat as robots
> >do. Have you read the code? Have you tried to understand what may
> >happen when you put an OF node? What would be possible consequences to
> >the rest of the code?
> >
> >The above sentence is correct, implementation is not thought through.
> >It might be a correct fix, but the commit message doesn't show that
> >you really spent time on the change.
> >
> >P.S> I would personally put all those Hulk Robot bla-bla-bla with
> >lowest priority to consider, too many broken submissions...

> Thanks very much for you to review my another patch code.

You're welcome!

> First of all, all of my commits are not from Hulk Robot and I am sorry that you have spent lots of time
> for those broken submissions.
>
> Second, for this bug, while the of_get_parent() is only 3-4 lines above the adding of_node_put(),
> it is my fault to write so short commit log.

The problem is not in the length of the commit message, but in the
semantics of it.

The *put() methods that drop reference counting are part of the
garbage collector. If reference goes to 0 (or other defined threshold
for that purpose) the resource may be very well gone. Now, you should
check who and how is using that resource in the code. Depending on
that the patch may be good in its current form, or should be
completely rewritten.

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11E3F568759
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 13:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbiGFLxX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 07:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232381AbiGFLxX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 07:53:23 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEAB20A
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 04:53:21 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id e80so19647989ybb.4
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 04:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tamutw++ki8NxpW4uw8kFKmdzs9hVeff/hucLq3i3tI=;
        b=V03HV6v+DXdDhFG7gj7Ic4HEbY4z+0gozFuKaXVdvzcmlXfLaVpIqxfvGJYiMKzNmH
         4tvS3caw8so5Wkbi8xTRtVgzgTHSktvT55mg54bdOeGn44IzaRdsiXQZl9woUS17MWtm
         s1TYRaVId2rb25EbJzASOUfgwdlK076nCATt+ahNQoENaixJ0fQySpt0UAuiq7K9h3J6
         7R8BsOKe4kMMFbS4rxxs+zYc2/vgLaTJsLzaofuC0hwm9JbMr9Phi+xwDuO3jucD0M0Q
         xn/OwJ6NXb5g6YXxWAwEiNBgt4sElU+Eb7wqWjSHpXaFWLYLAa75qf92XmZ8bkdbGNCE
         aq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tamutw++ki8NxpW4uw8kFKmdzs9hVeff/hucLq3i3tI=;
        b=hWhDmXRmdUFJyilw+urjBdMTJhOojSCvnFEWRE39eJsFv+H8/F5d9OspRmkIYxfevj
         McA0mjP5k+r5l3HQDNJLh3FzHou5jLeI6LH05D3h375mmPL3kCH3KY89I4h2JWlL6u1d
         Rx/xiivw9I+uk2UZI/r7os9+WMlN9aR46GzMM9MuIlCB5kC+8ws3tpo+Makzx+q/NW6L
         i/e974LjbbcNIesAk8ezzFXIIGTqdo6kzFD3eC0Sd9at8YY8syCAtSdn7u8YBvDWk294
         aJGR6nxSFgIRbA0MfreiWRujsjy+T4HuBNeEjFLaAU251xZPTtq4zH9MZNMMr4gzaqvN
         4VCw==
X-Gm-Message-State: AJIora+9HuNXy9pisGWDCr1kToAruYdF26p07S0jbDMFhiWghRyCLLT9
        slqphLlihp1AUfxCcncf8dfo8czj1LlNhGCPYD0=
X-Google-Smtp-Source: AGRyM1sR/oW240XR2Jsyauszom1aHDQeWI0MGHQBgTcCsIrp5kVAk4Eq6NG+m9NGVVVzaMQf2qPeoBUhCDt99vfQUz0=
X-Received: by 2002:a25:cbcf:0:b0:66e:8893:a02c with SMTP id
 b198-20020a25cbcf000000b0066e8893a02cmr6775209ybg.460.1657108400820; Wed, 06
 Jul 2022 04:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220704091313.277567-1-windhl@126.com> <CAMRc=MdGR4BdH4FfiRjzHY2uS7=13qRKzQZj9jcw5PnghYT2Gg@mail.gmail.com>
 <16c361ba.606.181d110bde1.Coremail.windhl@126.com>
In-Reply-To: <16c361ba.606.181d110bde1.Coremail.windhl@126.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 6 Jul 2022 13:52:44 +0200
Message-ID: <CAHp75VdY=PD+kPOgXf-rjj2zMLF6uDrXk3-jVRB_MRiLdu=TKg@mail.gmail.com>
Subject: Re: Re: [PATCH] gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
To:     Liang He <windhl@126.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Wed, Jul 6, 2022 at 3:49 AM Liang He <windhl@126.com> wrote:
> At 2022-07-05 23:40:12, "Bartosz Golaszewski" <brgl@bgdev.pl> wrote:
> >On Mon, Jul 4, 2022 at 11:13 AM Liang He <windhl@126.com> wrote:

...

> This patch is based on the fact that there is a call site in function 'qe_add_gpiochips()'
> of src file 'drivers\soc\fsl\qe\gpio.c'.
>
> In that function, of_mm_gpiochip_add_data() is contained in a iteration of for_each_compatible_node(),
> which will automatically increase and decrease the refcount.

"and decrease"


> As there is a new reference escaped into the mm_gc->gc.of_node, we should increase the
> refcount, otherwise, there may be a premature free as we do not know the existence of
> the reference in 'mm_gc->gc.of_node'.
>
> If my understanding is wrong, please correct me.

Yes, see above.

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4464A582431
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 12:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbiG0KZb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 06:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiG0KZa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 06:25:30 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A483B3B
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:25:29 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id a82so23928056ybb.12
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GPD+Ci6Ma1QK4XmSWyDvbbLRPm2ZkgAtYZLC4K0ha74=;
        b=amMqy2LA8vy4OE70pDsfTuFFofVdLHHvg3lT4GdpYtkbAcKd+Pff79VQCh9vhL5a/r
         nexWg8FO8ocgBMEEH3AN2yRJ2SbAzj7cdyBGvL0G4RrBZNMJCHTu/KEoiFLsf1s5MTgw
         NgDqALl4o1n+BQnJNO0cubqJDGi6xjihZ4ia/1Uz6eTzRQhhYhM3SSmTfCpPcksIGT9S
         GCaUblM2alULCm8IgaXXhDQ/r8PdlZlRqdl+hcQhAZq6ctWRJBR4wcbUfyuiSbFanW2e
         T/IWnYVjsgw/ikRhQYSYhG/5VMwDa+KIeu73TUHgUJD2B00Al7QmCjtYEtN+2CbYTQsy
         ZgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GPD+Ci6Ma1QK4XmSWyDvbbLRPm2ZkgAtYZLC4K0ha74=;
        b=hJ/WREHv68XcYK9XCexWFQNGxZsMGNUz78uUjW7bB5Duq/HV/T1f64iRvUt9ih+Lep
         nelmmsUAXoYoijUL6dJXCVO6t/D/T0MEM/v1buVhrw+oZkKTVc5HYLfxbSupU1RhU1Fn
         O2sg8p4+MfjysUYtShW4rbPJziiu6JqJAIS/PiOLJpJmqI7LIVmL5wxkEisaiCNLA5yo
         f4IkvOtg/M1c/ulOJ0OcX3TjRfDrRYifgU+HU1/EFiXV1bWyUYWrcx+s1wBkYzISwx3V
         jsD6uFyTv6yjBuyH0UJ/ec/fTXTFG4doZh9n+PajWBRq9PJOwLPr8NsQIkGDlRmHaNQi
         wUlQ==
X-Gm-Message-State: AJIora8tmg99tCJheHRxCnmJtcx6tlDB2RUBTQYrBaR+Joou1m6mZGbg
        zjbRF4rIYyeSQAKoi5UqK3ptCXCrOnzoTDdCGsmx6sx5
X-Google-Smtp-Source: AGRyM1swN4+uyaWU3V1djHWBM/hPItwtKJSMLHeyArKWxibelO5qj2VE0WwacCxGv0gHjme8usbvoovSOE5IUCpamUM=
X-Received: by 2002:a25:b686:0:b0:670:ae47:72f1 with SMTP id
 s6-20020a25b686000000b00670ae4772f1mr17026871ybj.255.1658917528742; Wed, 27
 Jul 2022 03:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAEBpM+ZPZNpJNJAU=2iji8+dCnLEcordRLwH3-mKhYqWS_zr6Q@mail.gmail.com>
 <CACRpkdbVRm7SdCPm-RP7pD2v7ce+i+kSh05wdFsmMmBbDk+1YA@mail.gmail.com>
 <CAEBpM+ZDiCD7Y5au9ng4iaptbQEHMXwUFLY370_uVBKCjsR+EA@mail.gmail.com>
 <CACRpkdZ139Dhonh82Zs_DGewb3KkocpU7yE5wuhukm=TfZBkOw@mail.gmail.com> <CAHp75VcTu5+Jb1La+Db=SM_Ec=cq9q4xn-p3KrM7HQF-k5u5Gg@mail.gmail.com>
In-Reply-To: <CAHp75VcTu5+Jb1La+Db=SM_Ec=cq9q4xn-p3KrM7HQF-k5u5Gg@mail.gmail.com>
From:   Meena M <scientistartist@gmail.com>
Date:   Wed, 27 Jul 2022 15:55:17 +0530
Message-ID: <CAEBpM+a4hxNas60M=E3gNfvB4f62Kw-i90NsT+nS71vR6AJwSQ@mail.gmail.com>
Subject: Re: To write Java binding for libgpiod - need help with looking for references
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thank you Linus and Andy, and sorry for the late reply.

Will check the resources shared and make use of them.

Regards,
Meena


On Tue, Jul 26, 2022 at 1:04 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Jul 22, 2022 at 3:00 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Wed, Jul 20, 2022 at 11:37 AM Meena M <scientistartist@gmail.com> wrote:
> >
> > > If I get to know more about JNA will share it, but going by what I have found online,
> > > JNA is slower than JNI. I am very new to this too.
> >
> > Good way to learn!
> >
> > > At present I am going through JNI programmer's guide which was recommended in
> > > a resource(a youtube video) which by itself is old(2017), the programmer guide even older.
> >
> > It's annoying. I would check the opensource Java git to check what is going on
> > over at Oracle.
> > https://github.com/openjdk/jdk/blob/master/src/java.base/share/native/include/jni.h
> >
> > > I am getting a failure delivery message for linux-gpio@vger.kernel.org, how do
> > >  I get to mail everyone in the list?
> >
> > The email address is correct.
> > Maybe it is because you're using HTML in your mailer?
> > The list servers will reject any HTML-formatted mail.
> > Make sure gmail is configured to use plaintext when sending mails.
> >
> > Yours,
> > Linus Walleij
>
> Have you spoken to the authors of recent (to some extent) active projects on GH?
>
> https://github.com/sgjava/java-periphery
> https://github.com/helins/linux-gpio.java
> https://github.com/NickZhang1024/java-periphery
>
> (Dunno if first and third have any relations, GH shows none)
>
>
> --
> With Best Regards,
> Andy Shevchenko

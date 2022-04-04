Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 589704F12F2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Apr 2022 12:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356788AbiDDKTo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Apr 2022 06:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356847AbiDDKTo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2022 06:19:44 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1D23C717
        for <linux-gpio@vger.kernel.org>; Mon,  4 Apr 2022 03:17:46 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bq8so18789951ejb.10
        for <linux-gpio@vger.kernel.org>; Mon, 04 Apr 2022 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QGXVTY0pIhU9zIY0EgjRbIoSDHId5uN/nqKqsXeyBP0=;
        b=EsEOLR5RqedEzhnjwBgFZArAza7hXTOzGf4SWLYn/DM8qPhtdvaUtCxb48+T5a4WG1
         wUv9dBusiJLqwKPwlKlvBzStjtViR6yL1s5DzFlXQ3hBiDr6PCGOtjggWDZMmQ9ekJbG
         itr7f+bQ5YoK5iCcqTyhEW2OO9dRBpC2IAsD+bsMQB9IgB42e2aMzba3HkB8OgbPlqFm
         lpRK3XfCpU0u5zSnYj0g2VMTgV0edj3EbahLaLuYHugk8FWPHJUbYydn+Q6QFAZrVEui
         pQ5ggM9SsC7KOJpi8Cs0ikP/fBY0OODoQuFNOPGyDXQe7jYljYhYuJ++9w4RjOunISzH
         b7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QGXVTY0pIhU9zIY0EgjRbIoSDHId5uN/nqKqsXeyBP0=;
        b=bizQolLHJjomU45nCBVpn197Jx+IuN4bjYEEyo1UW9dawFz45W4RJoLIGvrCc8I7CP
         weAwcrX5Jr1b7kLNCC4OpxnBtecpScDJEiDDZRTMsOVL7LCw2qqX+P6YHoLeWt4SKkNp
         u0IRRBHR5u2C/47ZSNCm5ruQak6OTR3ZFdBRe5Ix/hQ2BGBJLuB41JllYSIja44deRXV
         B9jiAwzxSKEfGEXgZ+he7FDJZ2i/Rqa/gC+QvXeo9FA6BMG/ts1L/kvOYsQHIg6iUS+h
         5TD6eViFtfB3wmztM+8BHVspCZgaXdaE2cxsXMIMe/iiBdRO5acNj+Rt9npGVEPNhF6m
         YE6A==
X-Gm-Message-State: AOAM533jU/T9pLSpzeZClKPuzVqzgKvZXCmrAdaJI/KU2H3IzAEaqAf9
        J9ad9gRwQkkYpTyMJITaIAa0IxdOyUJoobvqaME=
X-Google-Smtp-Source: ABdhPJyqcFzH7a97PjpcdWjeMkHnqH9qN+dhS52sVbNrXh/dFKU5NHNmZ7d0uLJatgaHIslqXR8IZNtCPBQCtDoB1C0=
X-Received: by 2002:a17:907:9703:b0:6da:6412:508a with SMTP id
 jg3-20020a170907970300b006da6412508amr10103256ejc.77.1649067465005; Mon, 04
 Apr 2022 03:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220331025203.GA53907@sol> <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol> <49e5857d-1438-cd5d-b4f2-b374f01e2596@redhat.com>
 <20220402014510.GA7939@sol> <90f7d9eb-935b-3803-1531-65bd20418bc3@redhat.com>
 <CAHp75VcuM2qZjZCkcZ01u=KSqyudMJTB8meORpZ0hxA4_PFg8A@mail.gmail.com> <20220404100602.GC24083@sol>
In-Reply-To: <20220404100602.GC24083@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 4 Apr 2022 13:16:41 +0300
Message-ID: <CAHp75VdYp5FZyEd_DxvY8wU8nzf6OWRrKwd6-1t-tZh+zc8eJg@mail.gmail.com>
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
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

On Mon, Apr 4, 2022 at 1:06 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Mon, Apr 04, 2022 at 12:23:18PM +0300, Andy Shevchenko wrote:
> > On Sun, Apr 3, 2022 at 6:34 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > On 4/2/22 03:45, Kent Gibson wrote:
> > > > On Fri, Apr 01, 2022 at 12:36:57PM +0200, Hans de Goede wrote:

...

> > > > Probably best to extend the uAPI to add a strict mode and leave
> > > > existing usage unchanged.
> > >
> > > Agreed, adding a strict mode to the uAPI seems best.
> > >
> > > And if you do it this way, you should probably also make
> > > the kernel log (using a ratelimited log function) why (e.g.
> > > bias setting not supported)  the call is failing since errno is
> > > not going to tell the user enough here I think.
> >
> > ...which reminds me this one: https://lwn.net/Articles/657341/
> >
>
> In this case I'd be more inclined to return a sanitised config along
> with the error code.  So the user gets "the config you requested isn't
> doable, but this one is". They could even repeat the request with the
> sanitised config, though I'm not sure if that would provide any benefit
> compared to just not requesting strict in the first place.

Yeah, being "too smart" sometimes becomes an evil result.

-- 
With Best Regards,
Andy Shevchenko

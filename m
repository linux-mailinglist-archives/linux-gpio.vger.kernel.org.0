Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5A03B9FD1
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 13:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhGBLdo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 07:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhGBLdn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 07:33:43 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6F9C061762;
        Fri,  2 Jul 2021 04:31:11 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id k20so3689374uao.8;
        Fri, 02 Jul 2021 04:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iIW9xe4x4aQCMwRqXHQYOt3TdbEaNx2e5qmhKdjxb0k=;
        b=bMrlH+A0Df3/BP+pEo2wMZOGYvjGBmxhg+UBpuVxxXO/iywgkM0xoRAzkw9hU7XG/2
         Hur45NL770bDU4iJmMtVUAsyDcBACKQ17v1nAhX5SvZBzH4e15g3s+P9sLjqGapkXQgW
         tR8/0wAERaU2WGMI2Js6XV957+Ootc8RHNZcm3tqR4//YQ3HfrFerOtXuEo3ZEAhlzzx
         dMrn03BSZtqZTIk5IsYy/uzYOu0Cvtdhne22tW3dEOlgaA/BWYYbrGNkieL+NQnZw6Om
         I5NNjn3nKYgLQw8a0jHt5gfr8fnSmnzP9WD2qV0CeWEsmdJQmQb1t0uD7XBn97hlvpy+
         +mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iIW9xe4x4aQCMwRqXHQYOt3TdbEaNx2e5qmhKdjxb0k=;
        b=rb4OrzOG+ac+MQS2a+pXR79EndlqMexgkoBQixZqLDzl14VVEMWm+oDu0g4OF25T5P
         WN0s8F3eqJuNHzcstAHi1KWB34yKL7fV5EbpuIVGkGIp0VLnFPjyqajiQO9S0AzeubbC
         LeYKjaoArtXuQaR382bV4/rTMZjj5kFoSDbGRLeP7kHojTx7d0/inrw+dXCu+Hv7xYPC
         5STp7bnG6pqad7HjVNp+kI+16400EyVQ8goO/fMq67kkac+GikAK39QD7dWtSHLglBP6
         U4bzC4iN6k6pAfo35Od4km6xrMZwtbM+2Pc/Xyzd19FBjrZWvPhtuLmiST2SedOpidew
         mMAw==
X-Gm-Message-State: AOAM530yToeGcDwdKmD5kpEFJXNAGFScwii9uRUlZv0jYAMObuv6BIFH
        dVsC1VIi0F+nYLcHXgmEqGa6fa6ipo0MeB2ylHY=
X-Google-Smtp-Source: ABdhPJyfWe5AMecsny/AVQCOHm59lClSpVQmp7xocThRuYfdb2k+AbFHhC8BQle3zBoLnknAfbQOiJ+/pchEztMYoEg=
X-Received: by 2002:ab0:77d0:: with SMTP id y16mr6023131uar.46.1625225470962;
 Fri, 02 Jul 2021 04:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
 <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
 <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
 <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
 <CAMhs-H9gw63j98vVo3y0ymW4_6rFNL8u5cYNM2hzyrmkPB3h3w@mail.gmail.com>
 <CAHp75VccSCWa=EH8i01_b_HLZRumUZ48oRjeuaV5Dp1BQAoz2w@mail.gmail.com>
 <CAMhs-H_Ne4W79Awbmo6w_68X+h0-ybjvzNsbh=XuHMPJJ8-hDQ@mail.gmail.com> <CACRpkdaqSoyDUn3dVuVgzRK_7AabdY=1FzAnhHZzPs3qS+GfsA@mail.gmail.com>
In-Reply-To: <CACRpkdaqSoyDUn3dVuVgzRK_7AabdY=1FzAnhHZzPs3qS+GfsA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 2 Jul 2021 13:30:59 +0200
Message-ID: <CAMhs-H_pomsvKXuerkVsNQva+B+tPr2xRZAU2R7oyjZ+GaQpqQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Jul 2, 2021 at 12:18 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jul 2, 2021 at 11:40 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > On Fri, Jul 2, 2021 at 11:27 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
>
> > > > There are no child nodes, all the stuff is in the same parent node
> > > > and, as I said, belongs to the same device but internally uses three
> > > > gpiochips.
> > >
> > > And it can't be split into three children in the overlay?
> >
> > Original code before this being mainlined was using three children and
> > I was told in the review that three children were not allowed:
> >
> > See https://patchwork.ozlabs.org/project/linux-gpio/patch/1527924610-13135-3-git-send-email-sergio.paracuellos@gmail.com/#1932827
>
> Yeah this is one of those unfortunate cases where the DT representation
> (or ACPI for that matter) of the device and the Linux internal representation
> differs.
>
> > > Let's assume it can't, then the GPIO library function should be
> > > refactored in a way that it takes parameters like base index for the
> > > names and tries to satisfy the caller.
> >
> > Bartosz, Linus, any thoughts on this?
>
> This would be ideal, is there a reasonably simple way to get to this helper?
>
> In gpiolib.c devprop_gpiochip_set_names() need to be refactored to
> take a base number, devprop_gpiochip_set_names_base() that
> function exposed in <linux/gpio/driver.h> and then the old function
> devprop_gpiochip_set_names() wrapped in the new
> one so all old users continue to work without modification.
> Sprinkle some kerneldoc on top so we do not make mistakes
> in the future.
>
> This should work I think.
>
> Any similar drivers (several gpio_chip per FW node) that want to
> set line names need to do the same thing.

Thanks for the advices. I'll try to make a bit of time to try to
handle this in the way you are pointing out here.

Best regards,
    Sergio Paracuellos

>
> Sorry that you ran into this, I hate it when I'm first at hairy stuff
> like this.
>
> Yours,
> Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C2C24533F
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Aug 2020 23:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbgHOV7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Aug 2020 17:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728855AbgHOVvl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Aug 2020 17:51:41 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D55C061A02
        for <linux-gpio@vger.kernel.org>; Sat, 15 Aug 2020 00:21:34 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id h21so8639941qtp.11
        for <linux-gpio@vger.kernel.org>; Sat, 15 Aug 2020 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fwXSXLqjHtnWSytqv0hQ9g9SOxtFMoK5KM1pc94nWWg=;
        b=PjtuBqGRj/3IVl7itQUeq2V6N4AEWUAhHgzWW/JM+hKGh8ej0WDEPmKA4qZY6RX4/P
         Zp4hTtZAvlQVnnBnc/w3VAKHcgYoa08oTD757pn8g3YM0qmKY15c4yB/FI/0VUqHVYyu
         ZMnERb2M4TdlaXmH+p+LuPrbTZ6ixrVVeMWVW3MezLrK+QlaIzvyRfyFJ22MX1X6Ie14
         QPriOVf6waYwccMMTdOcR0lgtox9KLBDR49NuTlFgk1VibSe5JgZQnPeFHgnmLK2o/eK
         OQz+QLpvcNFiLW5Pu61RW1qPxxG/TEkDsGgjHd82mVWG2moOtToCAGD0GPNQSviumSNV
         d0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fwXSXLqjHtnWSytqv0hQ9g9SOxtFMoK5KM1pc94nWWg=;
        b=lBfhzeuzZBykEVs1b8rkWXTO/BErkSVoNVi0J2y7NYhdAdJXNZtOyhvfyt0HymzbCM
         6ymg9w0cs+2bZRJ8SDuuAeVeoQUvJvShevrCP8yS+nnegqE0CticPan+pmyEHDgZVYt6
         7piT0dXNty9yfqDhqPXJwMJJMMJmQoK0+BC4QQc1jIS20Sse2tTd39Q4E7fOdfoHTcQD
         4dnaZu4iaBKFOMg/ch1nVNVdSgFljOEx75qx/+u/i8q3dkJWVkspUH8Dp5j8Q5gu3pXn
         f/5002RsODTnIeP9AMzl11fnfFMaRdo7q9ekHT0c+VR5uw8+FE6GYKNdg4jFeAdN0P+o
         QL2Q==
X-Gm-Message-State: AOAM532EkYkULwW26Y+CdRnnUfyYWj7s1mRFa1r3tGkr9mINmFLfnvFo
        dwn6oUjfu0VATN34P5f7SRYyHaZsQTUBuW+D/cfGzA==
X-Google-Smtp-Source: ABdhPJx/F85IamzzlCd90sFXidWCnMoV2Dh28+Fj6HyaJ0wlGej4deoGRtD/NNkORoV9jBFXALvelRK/HtI0KY+N21I=
X-Received: by 2002:ac8:4e39:: with SMTP id d25mr5180769qtw.208.1597476093134;
 Sat, 15 Aug 2020 00:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200814030257.135463-1-warthog618@gmail.com> <20200814030257.135463-8-warthog618@gmail.com>
 <CAMpxmJXdGUnnomfWNRmpi979jLPMj17JuA=0K2Nq-oVS_-oQ3A@mail.gmail.com> <20200815065309.GA13905@sol>
In-Reply-To: <20200815065309.GA13905@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sat, 15 Aug 2020 09:21:22 +0200
Message-ID: <CAMpxmJVMJYJ71z59Mu-mCTQPNqV9N9sXJXNBjYazGo0tmXthfg@mail.gmail.com>
Subject: Re: [PATCH v4 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 15, 2020 at 8:53 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Aug 14, 2020 at 09:31:29PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Aug 14, 2020 at 5:04 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> >
> > Hi Kent,
> >
> > not many comments here, just a couple minor details below.
> >
>
> [snip]
>
> > > +
> > > +/**
> > > + * struct line - contains the state of a userspace line request
> > > + * @gdev: the GPIO device the line request pertains to
> > > + * @label: consumer label used to tag descriptors
> > > + * @num_descs: the number of descriptors held in the descs array
> > > + * @descs: the GPIO descriptors held by this line request, with @num_descs
> > > + * elements.
> > > + */
> > > +struct line {
> >
> > How about line_request, line_request_data or line_req_ctx? Something
> > more intuitive than struct line that doesn't even refer to a single
> > line. Same for relevant functions below.
> >
>
> As I've mentioned previously, I'm not a fan of names that include _data,
> _ctx, _state, or similar that don't really add anything.
>

I certainly disagree with you on this. I think it's useful to discern
the object itself from data associated with it. Let's consider struct
irq_data and let's imagine it would be called struct irq instead. The
latter would be misleading - as this struct contains a lot additional
fields that form the context for the irq but aren't logically part of
the "irq object". And then you have irq_common_data which is even more
disconnected from the irq. This also would make using the name "irq"
for the variables containing the global irq number confusing.

I think the same happens here: we may want to use the name "line" for
local variables and then having "struct line_data" (or similar) would
make it easier to read.

I'll listen to other's suggestions/voices but personally I think that
_ctx, _data etc. suffixes actually make sense.

> I did consider line_request, but that was too close to the
> gpio_v2_line_request in gpio.d, not just the struct but also the
> resulting local variables, particularly in line_create() where they
> co-exist.
>
> Given the ioctl names, GPIO_V2_GET_LINE_IOCTL and
> GPIO_V2_LINE_GET/SET_xxx, that all create or operate on this struct, and
> that this is within the scope of gpiolib-cdev, the name 'line' seemed the
> best fit.
>

And that's why line_data or line_request_data do make sense IMO.

> And how does it not refer to a single line - what are the descs??
>

I meant the fact that it can refer to multiple lines while being
called "struct line". I do find this misleading.

Bart

> No problems with your other comments.
>
> Cheers,
> Kent.
>

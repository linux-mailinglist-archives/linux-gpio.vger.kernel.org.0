Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3498E2784B1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 12:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgIYKGV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 06:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgIYKGV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 06:06:21 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B27C0613CE;
        Fri, 25 Sep 2020 03:06:21 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id y14so2117135pgf.12;
        Fri, 25 Sep 2020 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lj9oeRjf3zqHOI1lrAhS50c7ExJjW+ZIVM2Q3CpvRlc=;
        b=iL13dvMMELfX/+oazQ9ItLSLB5TFGSR4kWK+CASxfk9BH9kj4f3GA1+7/lLGdW1zQH
         6Zv/AjUGCHZALk6DgQ8cr4p3q2bOed1x0/P6kyR0sQdX7VROkDeiyT0FUosGRJ0RkRrf
         W906uBqoX2VeY3UKo+MsSSEnXAGHlL3o1xKJsI+kJre4wqa/mW6YmuFUIW+bUIrrEPyo
         6Tqv32Sx5oyqaIFGxutkBEgtSKHnLPc5p7zAzKMonWNdgpEdtQ4HzXRXH4DswvvpRbme
         XLQbAmWis0yWJbOVl05C1dmajpqvQ10oCx+GV09luFKin+FSEdA5/TBgfTJSjMIYrxYF
         kOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lj9oeRjf3zqHOI1lrAhS50c7ExJjW+ZIVM2Q3CpvRlc=;
        b=QNAgT1vZIChqbiQwjKkosDC+4URhSbcqMuD/rCO5ZsyY5QGkbywU+30vgA8mZjjNXD
         S9qP7bkefTQRi2XELRmhfikUspFVycHvHFbNzRbmqkZZj7Cg00XtwwYfVjh/uiZn9sUK
         l52b1wRapEj90priimiGK9HThWnJLtX9Z+pzWd1+ZWhsWabnLgrHKR2TFfuPz0GaCrVh
         gjW7GBEZtCMZfHVBL20hTp+wtDasbV8n9PWTaJAh4nu5nIFWnKe+UlNf+XdXtPlvTpsv
         VjAgNmNuueV5TYlSO6tUEw9rCdBpI9BTfG0ltO8O9S6ErSGeLW2Uuu9OhLR4WlB6KJA+
         +GEA==
X-Gm-Message-State: AOAM531xivCyN/mMJethhOdp/0Z+PeGLiRZFx4nChpJ3eWRaZzTXx+Jt
        pXcv/c+dPG3v/hC6lMQRZn3LLYsuXVYRCIxUUIs=
X-Google-Smtp-Source: ABdhPJz3WqficnkMwXiecJ6ACoMQlFnCKY/THVTm9XTVmNFABc4oi3g7POUSuWzHOlgAg/4P4NTnJ0OGBq0pHwnb4uo=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr3435059pfn.73.1601028380525; Fri, 25
 Sep 2020 03:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-8-warthog618@gmail.com>
 <CAHp75VdQUbDnjQEr5X5q6WdU6rD=uBNznNn5=Vy=pvdwVj_hEA@mail.gmail.com> <20200924080921.GE17562@sol>
In-Reply-To: <20200924080921.GE17562@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Sep 2020 13:06:02 +0300
Message-ID: <CAHp75VehvUTt19sBxgPTZszUmxDGZwqGAV7bgW5jVM8Mf63UJA@mail.gmail.com>
Subject: Re: [PATCH v9 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 11:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Sep 23, 2020 at 02:11:54PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> > > +       assign_bit(FLAG_ACTIVE_LOW, flagsp,
> > > +                  flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
> >
> > What I meant is to attach also this to the other assign_bit():s below.
> > And just in case a question: why not __asign_bit() do we really need atomicity?
> >
>
> These are initialized as per their order in the flags so it is easier to
> tell if any are missing.
>
> The atomicity is not required here, but it is elsewhere so you are
> oblidged to use it for all accesses, no?

I'm not sure. I think if you are using non-atomic in one place, it
means that all automatically drop the atomicity guarantee. So, it's
all or none for atomicity, for non-atomicity it's rather none or at
least one. That said, code should be carefully checked before doing
such.

> > > +       if (flags & GPIO_V2_LINE_FLAG_OUTPUT)
> > > +               set_bit(FLAG_IS_OUT, flagsp);
> > > +       else if (flags & GPIO_V2_LINE_FLAG_INPUT)
> > > +               clear_bit(FLAG_IS_OUT, flagsp);
> > > +
> > > +       assign_bit(FLAG_OPEN_DRAIN, flagsp,
> > > +                  flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
> > > +       assign_bit(FLAG_OPEN_SOURCE, flagsp,
> > > +                  flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
> > > +       assign_bit(FLAG_PULL_UP, flagsp,
> > > +                  flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
> > > +       assign_bit(FLAG_PULL_DOWN, flagsp,
> > > +                  flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
> > > +       assign_bit(FLAG_BIAS_DISABLE, flagsp,
> > > +                  flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);

...

> > > +       /* Make sure this is terminated */
> > > +       ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
> > > +       if (strlen(ulr.consumer)) {
> > > +               lr->label = kstrdup(ulr.consumer, GFP_KERNEL);
> > > +               if (!lr->label) {
> > > +                       ret = -ENOMEM;
> > > +                       goto out_free_linereq;
> > > +               }
> > > +       }
> >
> > Still don't get why we can\t use kstrndup() here...
> >
>
> I know ;-).
>
> Another one directly from v1, and the behaviour there is to leave
> lr->label nulled if consumer is empty.
> It just avoids a pointless malloc for the null terminator.

Again, similar as for bitmap API usage, if it makes code cleaner and
increases readability, I will go for it.
Also don't forget the army of janitors that won't understand the case
and simply convert everything that can be converted.

-- 
With Best Regards,
Andy Shevchenko

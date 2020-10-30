Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C3D2A0802
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 15:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgJ3OgG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 10:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3OgF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 10:36:05 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9001BC0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:25:28 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id g12so5337553pgm.8
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tbLMOS4w2z7+diBmniK2iFWW5tNhOOVR29pHT87SxRk=;
        b=Ls7xYxuBI4iaj9ZJYLF8ijI4XWAAV/FCttHKds0PJFANPx05ApJmfc5iefrNIoIJNT
         hIMROmLj/vkDplNaaavj4Asgb6uJdXxUPJNci0NWS1Qw8r7IKJjt0dMACVScpA3pmNsR
         iSl1FQHLTs2JGtX3ltYdz5xb8q1Kq3YloLQ0Mw24bcjJdOddBWrDk5FmgbXEY5USQ3Kf
         4179hxQdfGTOcnadDCh6zxPnULJ/Vf+Km+/vVXv6zLn7aYLJFsmY+UtS4nN7Jtql3/v4
         a9D2mPfsfHf2aMg9H1ZAVDtdJDrRB7eSG/H+Z3cuA8YM7LO+G2hBt72ZM1AXki+tGtQ0
         N4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tbLMOS4w2z7+diBmniK2iFWW5tNhOOVR29pHT87SxRk=;
        b=c3TjcR4eSTD74mIJi9+iku9iSeD6/ClqoGC7IOiUJxgogB+MPof43KJXB6VE+s+Ar9
         rtkpIsTIhO+yyGI/muNjXsQS6vHon4s5T1SsyORDgun0Rz4r9koRNCZkHkrpmd3oB7kr
         QEBWz8q3pkiGKVSArIiy8CAzcyKATN4qWJQBAnHhKAqFhWRY2CAmxyt93QzQ4qwRHKFx
         gGwsmJcFjRKMBz6F7zlyPqIPyqvNaS4fdfWqw0nsCc3XJALX4SpoQL9rzsa5+U4k3WPo
         WLf1dcIYCe5YUbKHwsu97Xiv+VADtvCY15BhkZdbLki3a2unW9wL3EamvJjIlte2ftMK
         Divw==
X-Gm-Message-State: AOAM531x7od39+RXVKU3Bo6OKMjBk419SIit//7gbr791Z91O9JLefW1
        OczF+PZcUmM9IBPIaL7SfQ9o8bpz9nf85PFvk0Q=
X-Google-Smtp-Source: ABdhPJzRP5m9NTy1/zbZ0ovNIAN3V/JzrUHC1ItLHtZ+CIiwUIicbJ3mkqES/ej5PCgMb0uktUCy/iNXtvIrOwuJeh0=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr3325976pjb.228.1604067927986;
 Fri, 30 Oct 2020 07:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
 <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
 <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com>
 <CACRpkdYjHERoO-rzoXa77VCjDrF0N+3q+q_MXOstMEkk3Y2CnA@mail.gmail.com> <CAAVeFuLRWsxeZW=0jWyXb7N=o1n53F6n1Wwd0t=dUSppk9-xrQ@mail.gmail.com>
In-Reply-To: <CAAVeFuLRWsxeZW=0jWyXb7N=o1n53F6n1Wwd0t=dUSppk9-xrQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Oct 2020 16:26:16 +0200
Message-ID: <CAHp75Ve=_2Ye7K6rY8sLhpYh7DF9fqVbS7c2OVSWDZi3XYBbzw@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 30, 2020 at 4:16 PM Alexandre Courbot <gnurou@gmail.com> wrote:
>
> Hi! Sorry for the delayed reply.
>
> On Thu, Oct 29, 2020 at 10:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Wed, Oct 28, 2020 at 9:29 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >
> > > The section titled "Interacting With the Legacy GPIO Subsystem"
> > > describes as far as I got it the interaction of gpio_to_desc() and
> > > desc_to_gpio() with new / legacy APIs along with their scope. But is
> > > that description correct after the above mentioned commit, i.e.
> > > 14e85c0e69d5 ("gpio: remove gpio_descs global array") when we lose the
> > > always-present data structure (if I'm not mistaken)?
> >
> > Yes I think it needs to be updated...
>
> Although there is no global array anymore, gpio_to_desc() should still
> perform as expected after 14e85c0e69d5 ("gpio: remove gpio_descs
> global array"), since it parses all the registered gpio chips and
> looks for the one which range includes the requested number.
>
> desc_to_gpio() is a bit simpler, as it simply returns the GPIO number
> corresponding to a valid descriptor. The descriptor must remain
> acquired as long as the GPIO is in use through its number. I think the
> misleading sentence is
>
> "The GPIO number returned by desc_to_gpio() can be safely used as long
> as the GPIO descriptor has not been freed."
>
> This has been written a long time ago, so maybe I am mistaken, but I
> suspect the intent was to say something along the lines of "... as the
> GPIO descriptor has not been *released* (using gpiod_put()).
>
> For gpio_to_desc(), the intent of "a GPIO number passed to
> gpio_to_desc() must have been properly acquired", is to say "...
> properly acquired using gpio_request()".
>
> As for "and usage of the returned GPIO descriptor is only possible
> after the GPIO number has been released", I am a bit puzzled. My
> understanding is that the descriptor is only guaranteed to be valid
> between calls to gpio_request() and gpio_free(), so that's probably a
> mistake here?

Funny thing is that it is you who is the author of fd8e198cfcaa
("Documentation: gpiolib: document new interface"). Or am I mistaken?

Perhaps you can send a follow up to amend that chapter?

-- 
With Best Regards,
Andy Shevchenko

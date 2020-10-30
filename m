Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FA42A0804
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 15:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgJ3Ogn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 10:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbgJ3Ogn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 10:36:43 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B2AC0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:36:42 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 2so7083248ljj.13
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gVEFiIBwk6SfSbCc0DiTZBVLBVfXA2YxXqN2adldthc=;
        b=SHh7JIfKPrPcMmJtmYqc9FEDC0Lub3AuWo3VozS0fjDaFt32VOqDGWxJrDYLViEksj
         AVQCUNXLn27k86x5UdjL0K/MgZiIJbsBdjwze+jfkypmJIlykGlTTEYUbtHj06htsIlH
         adv0jks2TImy1j3fJuw/gRlZtC31D0nXLjEa9YnLObgPLtG6pzXzKafCMvoqxaNjRNqf
         T4dumjBiRVjW8UWZjfr+OA9H+ZxdAGIP6AabIICSsberrcDyiUCNVTggXJZ+3i0C8Ndn
         LBeWCDiWKLfm5H1rQZONLc7H+8F+4bQxOY0Ccj/q3NF9+DancSVqQRxwtBAbQXHy5jwe
         MOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gVEFiIBwk6SfSbCc0DiTZBVLBVfXA2YxXqN2adldthc=;
        b=ed7HvZDCYOlPggC/PtCZ0DuijJzVaLOgN7+RPExq14FUaVicTpFjBGpGXjbUf7emvM
         0J8/KgfKkz6DWXAtwalBEbg15WZy386hBtCWxPkKAhYj9M1F+dC1tt2i2zDmdmHf0Nh6
         XLRjg2B2LQ2NDGH4DxqMI+pEMYzYe4wnlfFB25i3+S3PsFR1JwUn6pZZ68ukGnXO71aq
         VCq+Wpioc0izR1QtJa4GPg+IBxvbFptg18imC/i8n6Tb9pdBX4OU8wP+XkT/Vfdc+vSA
         IHyCKoLIL0dJt+oYLnGCLMQbHgm1uSWLVVwiM2+PiPt2G+BEaiuyLeyS9cDovZWpAXAF
         o0sg==
X-Gm-Message-State: AOAM533ary6mp5qEdpv8MjhcD/25JkxpQKKNeWoOubEEVDTqNnq0W30L
        xqlfBiBZEJjuKvd8h/Yj1ICfnCA4G8LO/upKnls=
X-Google-Smtp-Source: ABdhPJzY2OPnRW7Zo5tEx7suHYgEMsP9aJluLlBOl9wG18SjJAQGyOjgce0DcFRSqYvYU+smEcOo4ZUxN3dPOrk7oJY=
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr1340700ljj.240.1604068601156;
 Fri, 30 Oct 2020 07:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
 <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
 <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com>
 <CACRpkdYjHERoO-rzoXa77VCjDrF0N+3q+q_MXOstMEkk3Y2CnA@mail.gmail.com>
 <CAAVeFuLRWsxeZW=0jWyXb7N=o1n53F6n1Wwd0t=dUSppk9-xrQ@mail.gmail.com>
 <CAHp75Ve=_2Ye7K6rY8sLhpYh7DF9fqVbS7c2OVSWDZi3XYBbzw@mail.gmail.com> <CAHp75VdnNi-wWeRnOCLYi+K-x0sKz4s2=OqtHdkZJWQw4-d8wQ@mail.gmail.com>
In-Reply-To: <CAHp75VdnNi-wWeRnOCLYi+K-x0sKz4s2=OqtHdkZJWQw4-d8wQ@mail.gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Fri, 30 Oct 2020 23:36:29 +0900
Message-ID: <CAAVeFu+YtiZ69btLyiZvPwXJYo+KW6T9SyhrJvd_4L=qJqJhpA@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 30, 2020 at 11:29 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Oct 30, 2020 at 4:26 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 30, 2020 at 4:16 PM Alexandre Courbot <gnurou@gmail.com> wrote:
> > > On Thu, Oct 29, 2020 at 10:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> ...
>
> > > As for "and usage of the returned GPIO descriptor is only possible
> > > after the GPIO number has been released", I am a bit puzzled.
>
> So does the OP of [1].
> Have you had a chance to read that?
>
> > My
> > > understanding is that the descriptor is only guaranteed to be valid
> > > between calls to gpio_request() and gpio_free(), so that's probably a
> > > mistake here?
>
> Sounds like this and my investigation tells me that this mistake is a
> result of the global array removal w/o updating documentation part.

I have written a reply to the SO post:
https://stackoverflow.com/a/64610316/251248

The important thing here is that gpio_acquire() and gpio_free() call
gpiod_request() and gpiod_free() under the hood. So all the lifetimes
are ultimately managed through GPIO descriptors. This means that when
gpio_acquire() is called, the descriptor's refcount is increased by
one, and thus it is safe to use it until the refcount is decreased by
the corresponding call to gpio_free() (which will call gpiod_free()).

For the opposite operation, desc_to_gpio(), the same logic applies:
the descriptor has been acquired using gpiod_get(), and so legacy
gpio_*() functions, which ultimately use that descriptor, can be
called safely as long as you know the magic number and until
gpiod_put() is called on the descriptor.

So yeah the documentation (which I have written as far as I can
remember) looks a bit clumsy at best and I probably should amend it a
bit. Now I don't want to give the impression that these functions
should be used as they absolutely should not. :)

>
> > Funny thing is that it is you who is the author of fd8e198cfcaa
> > ("Documentation: gpiolib: document new interface"). Or am I mistaken?
> >
> > Perhaps you can send a follow up to amend that chapter?
>
> [1]: https://stackoverflow.com/q/64455505/2511795
>
> --
> With Best Regards,
> Andy Shevchenko

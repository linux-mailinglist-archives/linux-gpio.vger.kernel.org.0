Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87751563014
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 11:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235799AbiGAJ3B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 05:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235542AbiGAJ2d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 05:28:33 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF495C9DD
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 02:28:31 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id o25so3000994ejm.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9e/KoAgL/PqpxzkezFoDSVHVQ2Kkgozw5r8rpMjSlFM=;
        b=GdzQET0tzdGUacAka/EPYszbwBJLcWElOybTWqha/YrY3RmPWd8Y1C2+ugwrd+Zugi
         aJcksc+2wnFB+acsOKKGDlVzo1FdYiR2f7XfTRtdbrJE1XLRy18EPM00eictIzEQNZAq
         wHFSlET/+z7H0nVOgBUbMaOPEnCUyYI4CHQ03F5bbZ90y404nEPH53ts0x3XuIw9uFtO
         NHfQMqc6IP86QFdWLbZe4Q8Kg/jawrhj1XSIISY9iFp0aYyEmFU97cC0swBVhITVug/R
         TSmjKbh1W9UopeHFJjSHOY+W4pLbH9FRL8mIs049F+hW/tgdpuZ8u48MOHJ5eZBua0YH
         +Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9e/KoAgL/PqpxzkezFoDSVHVQ2Kkgozw5r8rpMjSlFM=;
        b=4Nd03Xi8FXKEmGvXNuZU7qFz7uJh90o4eZDDH2OnXK/LallkY+tw1lWy0xN3DQRb4G
         sFUIIhwLwaNcY3AqAP7TllrDVLd2g5ym9QAUX5zJzN5/3uDbAOf3jD7BEni0IeabApin
         rgHYbQBWw8rSBiKjazhoO69g5uX/5e/v07j42IdtAnjYxPc4ZcCYjMdWsXU837EpQfW0
         JtYrX/j3AfNZUyzdqW6d9xZBC3Nb94fX0VVrUgPhSVFJvCnOaTU6xYfx+ZtInWH7JWN8
         Ptr0klyFucp1uOsSO3tECGh2uI+JpwzYp0F1peujzVokLxAUSo2x3N6EmL693qKzoLjI
         vQNw==
X-Gm-Message-State: AJIora9Z7CPlcvYSFlbv9sgYFqMMhk6g/W3YZnUPPRYXT7/eFw9O337d
        LUndwxbGvgBfPykgbVI8vbFTLccsWokYErYxl79II3Qab1E=
X-Google-Smtp-Source: AGRyM1tSwcA8SwypPqBdwufRAuS6DHAnoypLzaIV4WL9EZ5pvq3hO/bWWx67kb8uUMXAGBjrE5uSDDPIJgfQs0r/qCA=
X-Received: by 2002:a17:907:8a25:b0:726:c9f2:2f5e with SMTP id
 sc37-20020a1709078a2500b00726c9f22f5emr13071828ejc.286.1656667710400; Fri, 01
 Jul 2022 02:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220630081450.GB23652@sol> <20220630083851.GA24642@sol>
 <20220701060736.GA28431@sol> <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com>
 <20220701072655.GA31738@sol> <CAMRc=McwhnjovSB7RuZQTnZ9tKww=WDvk813Wbmt5PYaK95cPA@mail.gmail.com>
 <20220701073338.GA33559@sol> <20220701080252.GB33559@sol> <CAMRc=Md7vzozjWLBMp8-fJX7Za9wKj9_uzYd9fgz5wE8gSk2AA@mail.gmail.com>
 <CAMRc=MdMSwbikyZZDVayd_HZ3B=nAA2ZFXhMh5v0quT5nsYoHQ@mail.gmail.com> <20220701085215.GA35727@sol>
In-Reply-To: <20220701085215.GA35727@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 11:28:19 +0200
Message-ID: <CAMRc=MdAXu=Lb9xxjETiALX9SwPrtsOrWFonCvSwA_FtPEsGtQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 1, 2022 at 10:52 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Jul 01, 2022 at 10:32:30AM +0200, Bartosz Golaszewski wrote:
> > On Fri, Jul 1, 2022 at 10:18 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
>
> ....
>
> > > > > >
> > > > > > Timedelta constructor is much more explicit than a float IMO. How
> > > > > > about a compromise and taking both (mutually exclusive)?
> > > > > > timeout=datettime.timedelta(seconds=1) == timeout_sec=float(1.0)?
> > > > > >
> > > > >
> > > > > Maybe, but float seconds seems to be the way they do it.
> > > > > If you insist on both then just the one timeout parameter and work the
> > > > > type out on the fly. (it's Python, so dynamic typing...)
> > > > >
> > > >
> > > > Same issue for chip.wait_info_event(), btw.
> > > > Still working through a full review - but it'll probably take a while.
> > > >
> > > > Wrt the wait, does the C API have a blocking wait, or do you have to
> > > > poll() the fd?
> > > >
> > >
> > > Blocking wait is simply reading the event without checking if an event
> > > is there to be read. select() (the system call) waits indefinitely if
> > > the timeval struct is NULL, ppoll() behaves the same for a NULL
> > > timespec, poll() does the same for a negative timeout (which is an
> > > int). We take an uint64_t so we can't do it. Either we need to switch
> > > to int64_t and interpret a negative value as indefinite wait or just
> > > not do it at all and tell users to just call the (blocking)
> > > read_edge_event().
> > >
> > > Bart
> > >
> >
> > I'm still on the fence about using timespec. It seems that the more
> > recent linux interfaces avoid timespec and timeval altogether due to
> > the year 2038 problem and the subsequent change in the struct layout.
> > On the other hand the timeouts are unlikely to be set to years. :)
> >
> > What do you think?
> >
>
> I prefer not using timespecs.  I prefer the int64 microseconds/nanoseconds
> or float seconds approaches.
> Especially for the time scales we are concerned with.
> I only use timespecs where existing APIs such as ppoll() require it.
>
> For the C API I'd go with int64 nsec, for Python float secs.
> (though as already covered - with Python you could accept float
> secs, int nsec, or a timedelta all in the one parameter)
>

Makes sense, I'll prepare a patch.

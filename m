Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6868A75AB22
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 11:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjGTJmr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 05:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjGTJmc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 05:42:32 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346982704
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 02:38:31 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-481389cd087so196251e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689845910; x=1690450710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjD8ZO9KLUZ4jxHoHqjY2q9PR3xBUTnLDI8cWYAWJDQ=;
        b=QnRafdf1HyjnurPj4FwSvzMhWTtDe0/THtRt77hF8IkbHE8QyMviSVBunMfuWT5FIN
         YKjj0uHJKa9tQp7r+6Mn4T144o/FK6Jy5F9YCngvc9iN74OdjCgKua9/A3CmH/X4g2UQ
         z4vhtYl5syg30ULAeHQr3XPnpfRy0OJ1l2DPCTZWHchoxE9KbeQVQ/B/s/sohug12ZZ8
         /PsCoZxf4cefx2ilO0WWftwvvzLCMQ+/8YWNcQR+gY3tLaMmhfPoopO59YFOSXOYBwDu
         jAd1tjBcm+vg5ssWdGMpFt5WpbLHmNCgy7TGSH+eKs1l73mQKPrwoYbUw5Q3xGwGYtHd
         jaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689845910; x=1690450710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjD8ZO9KLUZ4jxHoHqjY2q9PR3xBUTnLDI8cWYAWJDQ=;
        b=K+NrMbyN0n6LDYBnJUVn12iVrudNUsFIQQAQ2USQucslfkoX6tuMCxIbMochm6UNUm
         RdraPe8fmihoYNa8rHaSrRwhWPeo/vfoI+DI50YguP+nZbBklWYfzoJCiwB4/94vgK5n
         wktDPPQ2roUaEYvdGVNsu5poonpQZAOVngtb6ibV1VdixmIK0x3wYvCdXNlqFxQGHzPH
         6ConRouRSakDJLrwgHpKggMtP+QUJUVwYFNmbp9zDKQuNCpPGCvmLZp895xe0925vOFc
         iddbihb/mhiI6xdwQEK4MEe/tZB9xAYdj5OzpfSZmtIj85tpILonPjLKFPMxXFdkysqI
         LJ7g==
X-Gm-Message-State: ABy/qLbaJoGPkEZEnM3Y3EhywOqtrfA7bRTcaacTeza/Anry4Bq13ynC
        pDe4Ck4yWXv4KX9Xcxhwu/xGKfic4HaUQUqBV/ewXg==
X-Google-Smtp-Source: APBJJlFRW9ebL8xcNu3GGrxX7m6OiGc2BmdTKrukI3uyJsGv6d+cs7dD/bd9Sodym6uYdikV8eiQ4Qem8loOCsKlFoM=
X-Received: by 2002:a1f:43cb:0:b0:481:388e:b903 with SMTP id
 q194-20020a1f43cb000000b00481388eb903mr2299888vka.10.1689845910237; Thu, 20
 Jul 2023 02:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230719192057.172560-1-brgl@bgdev.pl> <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
 <ZLjqtVcTCcStYac4@sol> <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
 <ZLjyscgZM50A/PLb@sol> <CAMRc=MfGYoTmcV2DXiQtBRPu2K3J9H_CDoLXCcfu2dOjA0cEDg@mail.gmail.com>
 <ZLj7an9hR7qy3foM@sol>
In-Reply-To: <ZLj7an9hR7qy3foM@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 11:38:19 +0200
Message-ID: <CAMRc=MfCPieOH-zYyvtoqzjQYt3zW7cL2waWOQbjB0k0wXm0Jw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 11:16=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Thu, Jul 20, 2023 at 10:49:46AM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jul 20, 2023 at 10:39=E2=80=AFAM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > > On Thu, Jul 20, 2023 at 10:25:14AM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Jul 20, 2023 at 10:05=E2=80=AFAM Kent Gibson <warthog618@gm=
ail.com> wrote:
> > > > >
> > > > > On Thu, Jul 20, 2023 at 09:59:00AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Thu, Jul 20, 2023 at 5:27=E2=80=AFAM Kent Gibson <warthog618=
@gmail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golaszewski=
 wrote:
> > > > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > > > >
> > > > > > > > While working on the DBus API, it occurred to me that while=
 we can obtain
> > > > > > > > the list of requested offsets from a line request, this inf=
ormation lacks
> > > > > > > > context if we cannot get any information about the parent c=
hip on which
> > > > > > > > the request was made.
> > > > > > > >
> > > > > > > > We cannot reference the chip in any way as its lifetime is =
disconnected
> > > > > > > > from the request but we can at least provide the path to th=
e character
> > > > > > > > device used to open it as a way of providing some context f=
or the offsets.
> > > > > > > >
> > > > > > >
> > > > > > > No problem with this conceptually, the only question I have i=
s which
> > > > > > > one of these should be stored:
> > > > > > >  - requested path e.g. 'a_symlink_to_my_favorite_chip'
> > > > > > >  - canonicalised path e.g. '/dev/gpiochip0'
> > > > > > >  - chip name e.g. 'gpiochip0'
> > > > > > >  - chip number e.g. 0
> > > > > > >
> > > > > > > In this patch we get the requested path, right?
> > > > > > >
> > > > > >
> > > > > > Yes, I think we should just use whatever filesystem path was us=
ed to
> > > > > > create the chip as it would be the one allowing the caller to r=
eopen
> > > > > > the same chip.
> > > > > >
> > > > >
> > > > > So there are instances where those four don't map to the same thi=
ng?
> > > > >
> > > >
> > > > Not in a typical situation, it can happen if the chip was removed a=
nd
> > > > another one took its place which is very unlikely.
> > > >
> > >
> > > And a symlink could get changed as well.
> > >
> > > > I just think that we cannot have any "hard data" as in: a programma=
tic
> > > > reference to the chip in the request (their lifetimes are not
> > > > connected), so the next best thing is the filesystem path.
> > > >
> > >
> > > Indeed - the chip fd used to request the line is out of scope.
> > >
> > > But the number of possible requested paths is many, whereas the other
> > > three options produce a unique and comparable identifier, in a search=
ing
> > > sense.
> > >
> >
> > So which one do you suggest?
> >
>
> Any of the latter three are equivlent, so you can use whichever is most
> convenient.  I've used canonical path in my Rust library, and chip name
> in my Go library.  IIRC in Rust I had the canonical path handy and it
> was easier to keep it as is than to break it down to name or number.
> Why I went with name in the Go is lost in the mists of time.
> I do recall toying with going with number but I wasn't sure if gpiochips
> were guaranteed to be named 'gpiochipN'.
>
> Given what you have below for DBus, name looks the most natural to me.
>
> > > On a related point, does the DBus API allow a client to access lines
> > > requested by another client?  And if so, how can they be sure they ha=
ve
> > > the right line?
> > >
> >
> > Sure they can but various user permissions as configured in the
> > relevant .conf file may apply.
> >
>
> So setting up the dbus-daemon security policy for the objects?
>

Not per-object unfortunately, I don't think this is possible with the
standard dbus-daemon or dbus-broker. May be possible in the daemon
itself if we can get the UID of the peer (we can get credentials of
peers in pure DBus but I'm not sure if we can do it when passing
through a bus daemon).

> > So what I've got so far in dbus (and feel free to check out the WiP[1])=
 is this:
> >
>
> I have had a quick look at it, but so far only a quick look and I'm not
> familiar with DBus so there is a lot of background to fill in.
>
> > There's an /io/gpiod1/gpiochipX object per chip implementing the
> > io.gpiod1.Chip interface. For each line there's a separate object as
> > well:
> >
> > /io/gpiod1/gpiochip0
> > /io/gpiod1/gpiochip0/0
> > /io/gpiod1/gpiochip0/1
> > /io/gpiod1/gpiochip0/2
> > /io/gpiod1/gpiochip0/3
> >
> > Line objects implement the io.gpiod1.Line interface and the daemon
> > emits a PropertiesChanged signal for any status changes.
> >
>
> Can the client select which of those signals it sees?
>

They can listen for PropertiesChanged on a single line but will get an
event on any change and will have to filter out the unwanted
themselves.

> > You can call io.gpiod1.Chip.RequestLines() method on a chip object
> > which will return the object path to the new request.
> >
> > /io/gpiod1/gpiochip0
> > /io/gpiod1/gpiochip0/0
> > /io/gpiod1/gpiochip0/1
> > /io/gpiod1/gpiochip0/2
> > /io/gpiod1/gpiochip0/3
> > /io/gpiod1/request0
> >
> > The request will reference the chip object from which it was created
> > as well as the lines it controls.
> >
>
> What about the reverse mapping?
>

As in: line-to-request? Not sure this is needed? I want the
io.gpiod1.Line interface to expose GetValue/SetValue methods and let
the daemon figure out the mapping logic internally. These methods
would fail if the line is not part of any request controlled by the
daemon.

>
> Where do edge events fit in there?
>

It's a signal exposed by the io.gpiod1.Line interface.

Bart

> Cheers,
> Kent.

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D419675AE6F
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 14:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjGTMbh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 08:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjGTMbg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 08:31:36 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F47272A
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 05:31:05 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-48138949fb4so297838e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689856256; x=1690461056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRQdb1GVtxJtTvWEZPxqWrTLLvCEpknFWrJQerceNIk=;
        b=eZ845IC/EWsxa4j06gg5N8hWsE9VmhsM7fF3cyjbEBg1+x7VUKtEiAxNHyJEbABoOS
         LnSoe3FPr/V+K9930ulD3w3k/0THkrWqSUijfYGmnzyt2OddHv8dFZu7cfrjUAEMHJ0X
         CV/Zx0bdD+Hhnt+JvaVVJqbhzFWgYQtszdClV25eackit1dickonLWpzmh616VUD+JiE
         1voRsQ4FXFH2/RWRpnAkmBNn2XJUjL+368e6xYs4IVH/+CmlJmYUor90p6EVge5rhR4U
         18ZeD8SZdgEXwe/wuLWx0diDKM9Ou6Y0CXFvMIIpUXl6tB92Oy5YO3r/Uf8c2BBT/fC/
         T1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689856256; x=1690461056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRQdb1GVtxJtTvWEZPxqWrTLLvCEpknFWrJQerceNIk=;
        b=Ram3mXV01K+1r4Bb6ZF8rHi98lbGgNQFBMiQRrTSJKspTY9XXSLy5/V9uMs6uTWWAy
         veLoL3C5y5zxFPYosIpaVoCIxifSqLlP6TbSz5yxLZrqDsW+IwLNp8GM+Szh0B9eKYxb
         KCvdeaCp3ERqmKde46YXyR3eCFtlGW94gdWEGNDO+ghBy8W61mYUvdNpWc9XhodmL0p7
         MBo/jbVeGWLy8cBHWKbs3RpYHwzsl4ShLBdfQb2ZvpniEIzGlvOv7xMKnv4hKK3EukLO
         KelojqgEAdtuxZZo+caH8d44w0pg+zQf9t3nk/jeT6uGSUyFO1oaSSaMashdqMn7e5zU
         iIeQ==
X-Gm-Message-State: ABy/qLayV1/cAmrNGSrybqC+fyyICjg6ZuMW4f56K0p0VZwrLOAn1rI1
        whlcZoBN7RnTsJjDhWLREMjOYbbuFxv0pnIkqkimNQ==
X-Google-Smtp-Source: APBJJlGIPA0mWYNgfx/OEwIrtobBuvU01attEEp1H4AJ0gWTlcc9OtObd88vGxKP7hSVuD25FR9ditkSeK0clp9tqn4=
X-Received: by 2002:a1f:5e4f:0:b0:471:1785:e838 with SMTP id
 s76-20020a1f5e4f000000b004711785e838mr1711837vkb.2.1689856256227; Thu, 20 Jul
 2023 05:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230719192057.172560-1-brgl@bgdev.pl> <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
 <ZLjqtVcTCcStYac4@sol> <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
 <ZLjyscgZM50A/PLb@sol> <CAMRc=MfGYoTmcV2DXiQtBRPu2K3J9H_CDoLXCcfu2dOjA0cEDg@mail.gmail.com>
 <ZLj7an9hR7qy3foM@sol> <CAMRc=MfCPieOH-zYyvtoqzjQYt3zW7cL2waWOQbjB0k0wXm0Jw@mail.gmail.com>
 <ZLkD6zFp2kLsO4fA@sol>
In-Reply-To: <ZLkD6zFp2kLsO4fA@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 14:30:45 +0200
Message-ID: <CAMRc=Md34kYQ4B8NQo2c+seJTN_24he7J5bwRD8sPy-xJyqkXw@mail.gmail.com>
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

On Thu, Jul 20, 2023 at 11:52=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Thu, Jul 20, 2023 at 11:38:19AM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jul 20, 2023 at 11:16=E2=80=AFAM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > > On Thu, Jul 20, 2023 at 10:49:46AM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Jul 20, 2023 at 10:39=E2=80=AFAM Kent Gibson <warthog618@gm=
ail.com> wrote:
> > > > >
> > > > > On Thu, Jul 20, 2023 at 10:25:14AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Thu, Jul 20, 2023 at 10:05=E2=80=AFAM Kent Gibson <warthog61=
8@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jul 20, 2023 at 09:59:00AM +0200, Bartosz Golaszewski=
 wrote:
> > > > > > > > On Thu, Jul 20, 2023 at 5:27=E2=80=AFAM Kent Gibson <wartho=
g618@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golasze=
wski wrote:
> > > > > > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.o=
rg>
> > > > > > > > > >
> > > > > > > > > > While working on the DBus API, it occurred to me that w=
hile we can obtain
> > > > > > > > > > the list of requested offsets from a line request, this=
 information lacks
> > > > > > > > > > context if we cannot get any information about the pare=
nt chip on which
> > > > > > > > > > the request was made.
> > > > > > > > > >
> > > > > > > > > > We cannot reference the chip in any way as its lifetime=
 is disconnected
> > > > > > > > > > from the request but we can at least provide the path t=
o the character
> > > > > > > > > > device used to open it as a way of providing some conte=
xt for the offsets.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > No problem with this conceptually, the only question I ha=
ve is which
> > > > > > > > > one of these should be stored:
> > > > > > > > >  - requested path e.g. 'a_symlink_to_my_favorite_chip'
> > > > > > > > >  - canonicalised path e.g. '/dev/gpiochip0'
> > > > > > > > >  - chip name e.g. 'gpiochip0'
> > > > > > > > >  - chip number e.g. 0
> > > > > > > > >
> > > > > > > > > In this patch we get the requested path, right?
> > > > > > > > >
> > > > > > > >
> > > > > > > > Yes, I think we should just use whatever filesystem path wa=
s used to
> > > > > > > > create the chip as it would be the one allowing the caller =
to reopen
> > > > > > > > the same chip.
> > > > > > > >
> > > > > > >
> > > > > > > So there are instances where those four don't map to the same=
 thing?
> > > > > > >
> > > > > >
> > > > > > Not in a typical situation, it can happen if the chip was remov=
ed and
> > > > > > another one took its place which is very unlikely.
> > > > > >
> > > > >
> > > > > And a symlink could get changed as well.
> > > > >
> > > > > > I just think that we cannot have any "hard data" as in: a progr=
ammatic
> > > > > > reference to the chip in the request (their lifetimes are not
> > > > > > connected), so the next best thing is the filesystem path.
> > > > > >
> > > > >
> > > > > Indeed - the chip fd used to request the line is out of scope.
> > > > >
> > > > > But the number of possible requested paths is many, whereas the o=
ther
> > > > > three options produce a unique and comparable identifier, in a se=
arching
> > > > > sense.
> > > > >
> > > >
> > > > So which one do you suggest?
> > > >
> > >
> > > Any of the latter three are equivlent, so you can use whichever is mo=
st
> > > convenient.  I've used canonical path in my Rust library, and chip na=
me
> > > in my Go library.  IIRC in Rust I had the canonical path handy and it
> > > was easier to keep it as is than to break it down to name or number.
> > > Why I went with name in the Go is lost in the mists of time.
> > > I do recall toying with going with number but I wasn't sure if gpioch=
ips
> > > were guaranteed to be named 'gpiochipN'.
> > >
> > > Given what you have below for DBus, name looks the most natural to me=
.
> > >
> > > > > On a related point, does the DBus API allow a client to access li=
nes
> > > > > requested by another client?  And if so, how can they be sure the=
y have
> > > > > the right line?
> > > > >
> > > >
> > > > Sure they can but various user permissions as configured in the
> > > > relevant .conf file may apply.
> > > >
> > >
> > > So setting up the dbus-daemon security policy for the objects?
> > >
> >
> > Not per-object unfortunately, I don't think this is possible with the
> > standard dbus-daemon or dbus-broker. May be possible in the daemon
> > itself if we can get the UID of the peer (we can get credentials of
> > peers in pure DBus but I'm not sure if we can do it when passing
> > through a bus daemon).
> >
> > > > So what I've got so far in dbus (and feel free to check out the WiP=
[1]) is this:
> > > >
> > >
> > > I have had a quick look at it, but so far only a quick look and I'm n=
ot
> > > familiar with DBus so there is a lot of background to fill in.
> > >
> > > > There's an /io/gpiod1/gpiochipX object per chip implementing the
> > > > io.gpiod1.Chip interface. For each line there's a separate object a=
s
> > > > well:
> > > >
> > > > /io/gpiod1/gpiochip0
> > > > /io/gpiod1/gpiochip0/0
> > > > /io/gpiod1/gpiochip0/1
> > > > /io/gpiod1/gpiochip0/2
> > > > /io/gpiod1/gpiochip0/3
> > > >
> > > > Line objects implement the io.gpiod1.Line interface and the daemon
> > > > emits a PropertiesChanged signal for any status changes.
> > > >
> > >
> > > Can the client select which of those signals it sees?
> > >
> >
> > They can listen for PropertiesChanged on a single line but will get an
> > event on any change and will have to filter out the unwanted
> > themselves.
> >
> > > > You can call io.gpiod1.Chip.RequestLines() method on a chip object
> > > > which will return the object path to the new request.
> > > >
> > > > /io/gpiod1/gpiochip0
> > > > /io/gpiod1/gpiochip0/0
> > > > /io/gpiod1/gpiochip0/1
> > > > /io/gpiod1/gpiochip0/2
> > > > /io/gpiod1/gpiochip0/3
> > > > /io/gpiod1/request0
> > > >
> > > > The request will reference the chip object from which it was create=
d
> > > > as well as the lines it controls.
> > > >
> > >
> > > What about the reverse mapping?
> > >
> >
> > As in: line-to-request? Not sure this is needed? I want the
> > io.gpiod1.Line interface to expose GetValue/SetValue methods and let
> > the daemon figure out the mapping logic internally. These methods
> > would fail if the line is not part of any request controlled by the
> > daemon.
> >
>
> The case I was thinking of was wanting to release a line, and if you
> don't know which request you will have to walk the request objects.
>

You cannot release a single line if it's part of a wider request though.

> And what of lines that are requested directly by apps other than the
> gpio-manager?
>

You can tell they're used but cannot request them just like with any
other user of the cdev.

> > >
> > > Where do edge events fit in there?
> > >
> >
> > It's a signal exposed by the io.gpiod1.Line interface.
>
> But separate from the PropertiesChanged?
>

Yes. PropertiesChanged is emitted on changes in properties (direction,
edge, all reported by gpionotify) while EdgeEvent is for edges
exclusively.

>
> I am also wondering if the tools can be extended with the option to
> perform their ops using the gpio-manager, particularly get/set/mon that
> currently require exclusive access.
>

There's a client app already functional in my WiP branch. Think nmcli
for NetworkManager. It doesn't link against libgpiod - only uses the
DBus API.

You can do something like this (not all of this is implemented yet):

$ # Wait for a chip with a particular label to appear
$ gpiocli wait --chip=3D"foobar" --timeout=3D10s
$ # Request a line for edge events
$ gpiocli request --input --rising-edge --falling-edge foo
request0
$ # List available requests
$ gpiocli requests
request0 (gpiochip0) offsets: [4]
$ # Wait for edge events:
$ gpiocli monitor foo
Offset: 4 RISING EDGE Timestamp: 3425234234
$ # Release the request
$ gpiocli release request0

This way the user can easily use bash scripts, command line or even
any DBus library out there while we still use the character device in
the daemon and ditch sysfs.

Bart

> Cheers,
> Kent.
>

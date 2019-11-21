Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F013F105556
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 16:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfKUPWk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 10:22:40 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41261 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfKUPWk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 10:22:40 -0500
Received: by mail-oi1-f195.google.com with SMTP id e9so3490834oif.8
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 07:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F6KSsZle9TX1HEkjBEP9zBOtVUeXK0uaXODQYurVMg8=;
        b=c0CeuN+h7YfBqrZdNzcA/v7eAlEr083eVDs6/Hh2hRCNJTgErhoXs+A6HcRnowZAmj
         Th6sE55e4WbtApVsBswTf619hXjhEq3imCqao8Y33YdJ/t2WVXJZBgWlmPjHRHv+/PKh
         g3RwVyH5nSpqjl4I0+MnzMMx40yTY3Jv3unSttjPWimpjokuJLI15MnIlJVAn6z1D53d
         M7SSc/L+FLlHVHWomBBCovXOwwlyGbeZUoFu0qPJuJEANWv4pGDelYrbr1wN6YBghKNq
         YPO01L5KaqwduHx9E9ZPz8d1A9B7d6D4iOIOSoBwCHaws+QPKUELxxCrvWKXArSMYL9g
         9nMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F6KSsZle9TX1HEkjBEP9zBOtVUeXK0uaXODQYurVMg8=;
        b=IWYjyE5wUjwuBSZfMtjbODSbphZEhn40Q2SIyCBfz7lamrOA8A27DBTU1SJRI06LjJ
         FHyNAeY6MmTGY1D++EDwOadDs6rlYU7weQFnr9MfN7LjsvbbYujuGcO+QBH7xB++Llnl
         dPrB5fpG9p7gojbWKPhXgMK79xUvS8iryuN1Vqf4mUT1REBIbOkpFBRNpZxXvyYXUO7F
         t6RZ+bHsd/sBGKN+Lr3cz8a+Nmu3Jzhvke4Dmg8kK7Ljj6HrUiVUj8nvM3hKg7/14yXt
         S3iYW+6C5zs/QTtjVvjnpelf3TjoF/+oEwNlOaZ7Eg4NTndZC8s6X/wYVuauXAshN8CX
         YrjA==
X-Gm-Message-State: APjAAAV7Y4UjAtwk8cagjIGKVZBDivQEw7CBc0f0zhdC9XWRQgKX3TV2
        urLie8KHD+Z0AqDb+23rmWAKEgqvXRpiKKSojk9Cz6ig
X-Google-Smtp-Source: APXvYqzooHxidwgSUYInLCD3x5zRPL83J1oHetgE5Ss/ALNSQYjAVvIIcILzGTzgjePr2ir9KXtSFVXqk68isE2RItI=
X-Received: by 2002:aca:d904:: with SMTP id q4mr8187397oig.21.1574349758104;
 Thu, 21 Nov 2019 07:22:38 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol> <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
 <20191121074621.GA17026@sol> <CAMRc=MeOAsOU4PVuUd1CPVLhcTWaj_e7AzQSi4u-m3Gf9m3xqQ@mail.gmail.com>
 <20191121093030.GA19142@sol> <CAMRc=Mcy2yNCZOvX5GN-yped1ZXo13bvvk04S-EyfARpGBcRMQ@mail.gmail.com>
 <20191121101808.GA20627@sol> <CAMRc=Mct7O2eA7peQ+teei5L2mma-XTsn8Pj-yRk7NCGX_dfxw@mail.gmail.com>
 <CAMpxmJVKS=JcSOvBU9ZDkWVdgNZ9LVxZ3tvn_Da6a_8JMYBRUw@mail.gmail.com> <20191121110727.GA23018@sol>
In-Reply-To: <20191121110727.GA23018@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 21 Nov 2019 16:22:27 +0100
Message-ID: <CAMpxmJX9Yip6OCiPRa9L8w7PziqRRFr-TqcP6Bi1=JiLggnjHQ@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 21 lis 2019 o 12:07 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Thu, Nov 21, 2019 at 11:31:52AM +0100, Bartosz Golaszewski wrote:
> > czw., 21 lis 2019 o 11:27 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
> > >
> > > czw., 21 lis 2019 o 11:18 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > > >
> > > > On Thu, Nov 21, 2019 at 11:03:32AM +0100, Bartosz Golaszewski wrote=
:
> > > > > czw., 21 lis 2019 o 10:30 Kent Gibson <warthog618@gmail.com> napi=
sa=C5=82(a):
> > > > > >
> > > > > > On Thu, Nov 21, 2019 at 09:46:07AM +0100, Bartosz Golaszewski w=
rote:
> > > > > > > czw., 21 lis 2019 o 08:46 Kent Gibson <warthog618@gmail.com> =
napisa=C5=82(a):
> > > > > > > >
> > > > > > > > On Thu, Nov 21, 2019 at 08:13:42AM +0100, Bartosz Golaszews=
ki wrote:
> > > > > > > > > czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.c=
om> napisa=C5=82(a):
> > > > > > > > > >
> > > > > > > > > > On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golas=
zewski wrote:
> > > > > > > > > > > =C5=9Br., 20 lis 2019 o 15:36 Kent Gibson <warthog618=
@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > >
> > > > > > > > > > > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz G=
olaszewski wrote:
> > > > > > > > > > > > > =C5=9Br., 20 lis 2019 o 15:13 Kent Gibson <wartho=
g618@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Barto=
sz Golaszewski wrote:
> > > > > > > > > > > > > > > =C5=9Br., 20 lis 2019 o 14:59 Kent Gibson <wa=
rthog618@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, B=
artosz Golaszewski wrote:
> > > > > > > > > > > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <war=
thog618@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +080=
0, Kent Gibson wrote:
> > > > > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0=
100, Bartosz Golaszewski
> > > > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > > > +int gpiod_line_set_flags_bulk(st=
ruct gpiod_line_bulk *bulk, int flags)
> > > > > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > > > > > > > > > > +       int values[GPIOD_LINE_BUL=
K_MAX_LINES];
> > > > > > > > > > > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > > > +       line =3D gpiod_line_bulk_=
get_line(bulk, 0);
> > > > > > > > > > > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > Can you explain the purpose of this=
 as_is field? I'm not sure this is
> > > > > > > > > > > > > > > > > > > > really needed.
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > It is there for gpiod_set_flags, whic=
h has to populate the direction
> > > > > > > > > > > > > > > > > > > flags in the SET_CONFIG ioctl. The ex=
isting line->direction is
> > > > > > > > > > > > > > > > > > > either input or output.  It is drawn =
from GPIOLINE_FLAG_IS_OUT, so
> > > > > > > > > > > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > > > > > > > > > > I didn't want to change the existing =
line->direction, and adding the
> > > > > > > > > > > > > > > > > > > as-is seemed clearer than adding anot=
her flavour of direction that
> > > > > > > > > > > > > > > > > > > contained all three.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Hmmm, I think I see what you were getti=
ng at - the line->direction is the
> > > > > > > > > > > > > > > > > > direction from the kernel, so it doesn'=
t hurt to use that value to set the
> > > > > > > > > > > > > > > > > > corresponding request flags - even if t=
he original request was as-is??
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > If that is the case then the line->as_i=
s can be dropped throughout.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Yes, this is what I was thinking. Just ne=
ed to make sure the value
> > > > > > > > > > > > > > > > > from the kernel is up-to-date.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > So fail if needs_update?
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I'd say: do an implicit update before setting=
 config.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So gpiod_line_update if needs_update, and fail =
if that fails?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Without the if - needs_update is only set if an i=
mplicit update fails
> > > > > > > > > > > > > in line_maybe_update(). But in this case we need =
to be sure, so do it
> > > > > > > > > > > > > unconditionally.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Given that line_maybe_update is called at the end o=
f request creation, and
> > > > > > > > > > > > whenever set_config is called, how can line->direct=
ion be inconsistent
> > > > > > > > > > > > with the kernel state - as long as needs_update is =
false?
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > I don't think we should call line_maybe_update() on s=
et_config() - in
> > > > > > > > > > > this case we should call gpiod_line_update() and fail=
 in set_config()
> > > > > > > > > > > if it fails.
> > > > > > > > > > >
> > > > > > > > > > > I hope that's clearer.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Not really.  I was already shaky on the needs_update an=
d I'm getting more
> > > > > > > > > > confused about the overall needs_update handling policy=
 by the minute.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Yeah it's not optimal. If you have better ideas on how to=
 handle the
> > > > > > > > > fact that the kernel can't really notify us about the cha=
nges in
> > > > > > > > > line's flags introduced by other processes - I'll be more=
 than glad to
> > > > > > > > > give them a try. At some point I was thinking about anoth=
er ioctl()
> > > > > > > > > that - for a requested line - would return a file descrip=
tor which
> > > > > > > > > would emit events when a line changes - for instance, it'=
s requested
> > > > > > > > > by someone else or its direction is changed etc.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I didn't realise it was possible for a requested line's fla=
gs to be
> > > > > > > > changed by other processes.  Quite the opposite - I thought=
 that was one
> > > > > > > > of the reasons for GPIOD was to allow the userspace to prev=
ent other from
> > > > > > > > processes messing with requested lines.
> > > > > > > >
> > > > > > >
> > > > > > > Ugh, sorry, was writing it before coffee. I was thinking abou=
t a
> > > > > > > non-requested line. Something like lineinfo ioctl() but retur=
ning an
> > > > > > > fd notifying about changes. Maybe we could even consider havi=
ng
> > > > > > > lineinfo2 ioctl() which would be extended with this functiona=
lity -
> > > > > > > not only would it fill the relevant structure but also pass a=
 new fd
> > > > > > > for notification about changes.
> > > > > > >
> > > > > >
> > > > > > Whew - that makes more sense. Had me worried there.
> > > > > >
> > > > > > Not sure how useful an async info ioctl would be.  Couldn't you=
 build
> > > > > > something equivalent in userspace with the existing API - as lo=
ng as you
> > > > > > don't mind the daemon holding the line, and so having to contro=
l the
> > > > > > line via the daemon.  You want to be able to monitor without re=
questing
> > > > > > the line?
> > > > > >
> > > > >
> > > > > I'm not sure if I was expressing myself clearly enough: a hypothe=
tical
> > > > > daemon calls LINEINFO ioctl(). Now a different program or kernel
> > > > > driver requests this line. The daemon is not up-to-date on its st=
ate
> > > > > unless it polls the line all the time. If a user now asks the dae=
mon
> > > > > about this line's state - it will be given outdated info. Listeni=
ng on
> > > > > this fd would allow us to be informed about such changes immediat=
ely.
> > > > >
> > > >
> > > > I think I understand you - but you might not be getting my meaning.=
..
> > > > I was thinking the daemon would request the lines it wanted to moni=
tor
> > > > - which is why you would then have to control the line via the daem=
on.
> > >
> > > No, I don't think requesting the line should be obligatory. In my WiP
> > > dbus daemon, I expose line info for all lines in the system by readin=
g
> > > LINEINFO for each one. Then - for unrequested lines - every time the
> > > client asks for any line info again - I call gpiod_line_update()
> > > before responding. This could be optimized by this lineinfo fd
> > > feature.
> > >
> > > I don't want to force the user-space to choose between using a single
> > > central daemon or dealing with lines separately.
> > >
> > > > The daemon then always knows the state of the line.
> > > > That obviously isn't the case if you want to monitor a line without
> > > > requesting it, hence the "You want to be able to monitor without re=
questing
> > > > the line?" question.
> > > >
> > >
> > > In other words: yes.
> > >
> >
> > Just to be clear: I mean line info - not values or events. By
> > monitoring I mean: be notified about changes to the line properties
> > without requesting it.
> >
> > As for implementation: I imagine an ioctl() called LINEINFO_FD that
> > would return an open file descriptor on which read events would arrive
> > when the line properties change and then we could call regular line
> > info ioctl() to actually re-read it. Does that make sense? I can try
> > to prepare an example implementation.
> >
>
> Ah, ok.  So you might want to send a dbus message when someone requests
> a line, or changes direction or whatever, but not have the monitoring
> daemon involved in the line control.  And not have the daemon polling
> the LINEINFO ioctl.
>
> Sounds reasonable.
>

That would be great, yes.

> Now, how did we get here?? ;-).
>

I'm actually happy you're doing this. You're making me think about
issues I never noticed. It's always great to have someone go through
your code. Thanks!

Bart

> Kent.
>
> > Bart
> >
> > > >
> > > > > > I'm still puzzled as to when the existing info ioctl could fail=
 on a
> > > > > > requested line - which is when needs_update gets set in
> > > > > > line_maybe_update().  Hardware being unplugged?
> > > > > >
> > > > >
> > > > > If the ioctl() can fail, then we're obligated to check the return
> > > > > value. As you say: unplugging the device is a good example - it m=
ay be
> > > > > a GPIO expander on an HID device (e.g. Silicon Labs CP2112) that =
can
> > > > > be easily disconnected from USB.
> > > > >
> > > >
> > > > Fair enough. But for failures of that scale shouldn't the line requ=
est
> > > > fail - rather than just setting needs_update?  Or are there less
> > > > catastrohpic failure modes?
> > > >
> > >
> > > What if the disconnect happens after the request but before the
> > > update? It's super unlikely, but again: the lineinfo ioctl() can fail=
,
> > > so we need to check the return value. We also can't update line info
> > > before requesting the line as it's racy - someone can change the stat=
e
> > > between the update and the request.
> > >
> > > (I hope I'm getting this right :))
> > >
> > > Bart
> > >
> > > > Kent.

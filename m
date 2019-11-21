Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937A410507A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 11:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUK1X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 05:27:23 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:36530 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUK1X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 05:27:23 -0500
Received: by mail-il1-f194.google.com with SMTP id s75so2772288ilc.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 02:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wvlLPjfZCUgHO6v1NPcNAowuAcJaXMvjqr2kGRyLa0g=;
        b=kf5qnygRqLBir/wNZLmhqfpKnWmqb9crJJuY14w720CLm1jJBqCSSlTO9gmWDDfRcI
         RceVBzCfyuUuF0jFDAgU1+hl99etX69JDrvLYZ7i5WxhKmHzIf6atP8xT1x/w/dC60Oi
         iKlRZUKtekvx+pDHF71wLydAZI3hrwPufYW5hlG1jv+o8LC65+xcLG/PEDadyL25SmeW
         pp31mk+oG8AAsekf/dkPNSYm6Bm5T4vZV0uXwpTPGKFj2GHq6LXy+u2AZRkHt5F5HOCR
         Faa56IONirsu44PXGrCzDAvhas6yIctLhn3xqwxA83vIGy8JtsqDuwSQ95JD2a/n9KoG
         OB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wvlLPjfZCUgHO6v1NPcNAowuAcJaXMvjqr2kGRyLa0g=;
        b=D2Ny07MXP+Z/YD0GH6X9SCOkgQHwkeVCprrgCj1jCBAIKLLt2L97tsA7wtJbp2gRlr
         xyzeJ3HisQAMUB/DzsSyvQuC14HCtYn7NsGcYLEkWprBbWRXVvqkKXVA1DPTGWZ733ON
         p0GSWoCv21SS1Ie9j1VYidnF3mVmJBc/qW6hEfwYzAckXbDr3P+xHRDF8VxaknQAIxGy
         WErXVsjqE4cndhyprmW5xv4r5UAlgwl9OCJFLBWbYN+qZVMRmWQ0UTWOsydH6L2Ul2ud
         mRKqSbXZYdUrFcsh2YTjCdkIGJ7Zwnmpvpe61e148qnU/b72KN2MwjvyI+0JgXNe6b6V
         d96g==
X-Gm-Message-State: APjAAAUH3WJXkv8QrZMysbndEJzMz1oHe/k8NBevVGxPao7kTw2IYjTm
        0OTNCU9cYAUFgdVy0TPKXEteuFtDsAOet60ADm/tYg==
X-Google-Smtp-Source: APXvYqzoWNqsuT72EoZYbqviOwMKCiWbnUGMSgWvvB2aBVi/QpNACsewQGI/Pgcndsq0KyA809Md4HlHDEcEi9BWwUM=
X-Received: by 2002:a92:104a:: with SMTP id y71mr9056889ill.220.1574332041262;
 Thu, 21 Nov 2019 02:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20191120141353.GA5154@sol> <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
 <20191120143644.GA5865@sol> <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol> <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
 <20191121074621.GA17026@sol> <CAMRc=MeOAsOU4PVuUd1CPVLhcTWaj_e7AzQSi4u-m3Gf9m3xqQ@mail.gmail.com>
 <20191121093030.GA19142@sol> <CAMRc=Mcy2yNCZOvX5GN-yped1ZXo13bvvk04S-EyfARpGBcRMQ@mail.gmail.com>
 <20191121101808.GA20627@sol>
In-Reply-To: <20191121101808.GA20627@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 21 Nov 2019 11:27:10 +0100
Message-ID: <CAMRc=Mct7O2eA7peQ+teei5L2mma-XTsn8Pj-yRk7NCGX_dfxw@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 21 lis 2019 o 11:18 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Thu, Nov 21, 2019 at 11:03:32AM +0100, Bartosz Golaszewski wrote:
> > czw., 21 lis 2019 o 10:30 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > On Thu, Nov 21, 2019 at 09:46:07AM +0100, Bartosz Golaszewski wrote:
> > > > czw., 21 lis 2019 o 08:46 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > > > >
> > > > > On Thu, Nov 21, 2019 at 08:13:42AM +0100, Bartosz Golaszewski wro=
te:
> > > > > > czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.com> na=
pisa=C5=82(a):
> > > > > > >
> > > > > > > On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golaszewski=
 wrote:
> > > > > > > > =C5=9Br., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gmail=
.com> napisa=C5=82(a):
> > > > > > > > >
> > > > > > > > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golasze=
wski wrote:
> > > > > > > > > > =C5=9Br., 20 lis 2019 o 15:13 Kent Gibson <warthog618@g=
mail.com> napisa=C5=82(a):
> > > > > > > > > > >
> > > > > > > > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Gol=
aszewski wrote:
> > > > > > > > > > > > =C5=9Br., 20 lis 2019 o 14:59 Kent Gibson <warthog6=
18@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz=
 Golaszewski wrote:
> > > > > > > > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog61=
8@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Ken=
t Gibson wrote:
> > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, B=
artosz Golaszewski
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +int gpiod_line_set_flags_bulk(struct g=
piod_line_bulk *bulk, int flags)
> > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_=
LINES];
> > > > > > > > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > +       line =3D gpiod_line_bulk_get_li=
ne(bulk, 0);
> > > > > > > > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Can you explain the purpose of this as_is=
 field? I'm not sure this is
> > > > > > > > > > > > > > > > > really needed.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > It is there for gpiod_set_flags, which has =
to populate the direction
> > > > > > > > > > > > > > > > flags in the SET_CONFIG ioctl. The existing=
 line->direction is
> > > > > > > > > > > > > > > > either input or output.  It is drawn from G=
PIOLINE_FLAG_IS_OUT, so
> > > > > > > > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > > > > > > > I didn't want to change the existing line->=
direction, and adding the
> > > > > > > > > > > > > > > > as-is seemed clearer than adding another fl=
avour of direction that
> > > > > > > > > > > > > > > > contained all three.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Hmmm, I think I see what you were getting at =
- the line->direction is the
> > > > > > > > > > > > > > > direction from the kernel, so it doesn't hurt=
 to use that value to set the
> > > > > > > > > > > > > > > corresponding request flags - even if the ori=
ginal request was as-is??
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > If that is the case then the line->as_is can =
be dropped throughout.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Yes, this is what I was thinking. Just need to =
make sure the value
> > > > > > > > > > > > > > from the kernel is up-to-date.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > So fail if needs_update?
> > > > > > > > > > > > >
> > > > > > > > > > > > > Kent.
> > > > > > > > > > > >
> > > > > > > > > > > > I'd say: do an implicit update before setting confi=
g.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > So gpiod_line_update if needs_update, and fail if tha=
t fails?
> > > > > > > > > > >
> > > > > > > > > > > Kent.
> > > > > > > > > >
> > > > > > > > > > Without the if - needs_update is only set if an implici=
t update fails
> > > > > > > > > > in line_maybe_update(). But in this case we need to be =
sure, so do it
> > > > > > > > > > unconditionally.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Given that line_maybe_update is called at the end of requ=
est creation, and
> > > > > > > > > whenever set_config is called, how can line->direction be=
 inconsistent
> > > > > > > > > with the kernel state - as long as needs_update is false?
> > > > > > > > >
> > > > > > > >
> > > > > > > > I don't think we should call line_maybe_update() on set_con=
fig() - in
> > > > > > > > this case we should call gpiod_line_update() and fail in se=
t_config()
> > > > > > > > if it fails.
> > > > > > > >
> > > > > > > > I hope that's clearer.
> > > > > > > >
> > > > > > >
> > > > > > > Not really.  I was already shaky on the needs_update and I'm =
getting more
> > > > > > > confused about the overall needs_update handling policy by th=
e minute.
> > > > > > >
> > > > > >
> > > > > > Yeah it's not optimal. If you have better ideas on how to handl=
e the
> > > > > > fact that the kernel can't really notify us about the changes i=
n
> > > > > > line's flags introduced by other processes - I'll be more than =
glad to
> > > > > > give them a try. At some point I was thinking about another ioc=
tl()
> > > > > > that - for a requested line - would return a file descriptor wh=
ich
> > > > > > would emit events when a line changes - for instance, it's requ=
ested
> > > > > > by someone else or its direction is changed etc.
> > > > > >
> > > > >
> > > > > I didn't realise it was possible for a requested line's flags to =
be
> > > > > changed by other processes.  Quite the opposite - I thought that =
was one
> > > > > of the reasons for GPIOD was to allow the userspace to prevent ot=
her from
> > > > > processes messing with requested lines.
> > > > >
> > > >
> > > > Ugh, sorry, was writing it before coffee. I was thinking about a
> > > > non-requested line. Something like lineinfo ioctl() but returning a=
n
> > > > fd notifying about changes. Maybe we could even consider having
> > > > lineinfo2 ioctl() which would be extended with this functionality -
> > > > not only would it fill the relevant structure but also pass a new f=
d
> > > > for notification about changes.
> > > >
> > >
> > > Whew - that makes more sense. Had me worried there.
> > >
> > > Not sure how useful an async info ioctl would be.  Couldn't you build
> > > something equivalent in userspace with the existing API - as long as =
you
> > > don't mind the daemon holding the line, and so having to control the
> > > line via the daemon.  You want to be able to monitor without requesti=
ng
> > > the line?
> > >
> >
> > I'm not sure if I was expressing myself clearly enough: a hypothetical
> > daemon calls LINEINFO ioctl(). Now a different program or kernel
> > driver requests this line. The daemon is not up-to-date on its state
> > unless it polls the line all the time. If a user now asks the daemon
> > about this line's state - it will be given outdated info. Listening on
> > this fd would allow us to be informed about such changes immediately.
> >
>
> I think I understand you - but you might not be getting my meaning...
> I was thinking the daemon would request the lines it wanted to monitor
> - which is why you would then have to control the line via the daemon.

No, I don't think requesting the line should be obligatory. In my WiP
dbus daemon, I expose line info for all lines in the system by reading
LINEINFO for each one. Then - for unrequested lines - every time the
client asks for any line info again - I call gpiod_line_update()
before responding. This could be optimized by this lineinfo fd
feature.

I don't want to force the user-space to choose between using a single
central daemon or dealing with lines separately.

> The daemon then always knows the state of the line.
> That obviously isn't the case if you want to monitor a line without
> requesting it, hence the "You want to be able to monitor without requesti=
ng
> the line?" question.
>

In other words: yes.

>
> > > I'm still puzzled as to when the existing info ioctl could fail on a
> > > requested line - which is when needs_update gets set in
> > > line_maybe_update().  Hardware being unplugged?
> > >
> >
> > If the ioctl() can fail, then we're obligated to check the return
> > value. As you say: unplugging the device is a good example - it may be
> > a GPIO expander on an HID device (e.g. Silicon Labs CP2112) that can
> > be easily disconnected from USB.
> >
>
> Fair enough. But for failures of that scale shouldn't the line request
> fail - rather than just setting needs_update?  Or are there less
> catastrohpic failure modes?
>

What if the disconnect happens after the request but before the
update? It's super unlikely, but again: the lineinfo ioctl() can fail,
so we need to check the return value. We also can't update line info
before requesting the line as it's racy - someone can change the state
between the update and the request.

(I hope I'm getting this right :))

Bart

> Kent.

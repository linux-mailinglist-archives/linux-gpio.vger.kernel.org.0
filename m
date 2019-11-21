Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABF6105544
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 16:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbfKUPVJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 10:21:09 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34077 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfKUPVJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 10:21:09 -0500
Received: by mail-oi1-f194.google.com with SMTP id l202so3534957oig.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iIHgf++BMSB9VDaBRUyc2M71pFRcjs8R8onkZvtpv9I=;
        b=ZptR5LV8oXR7ZeJbuJDnei5P4ODl5MYLSPlTmxiNUh22a8ifdDR6q748WpToogWzqE
         B2r6TKjiC087Y4ru9egHkIm/uvqVtq2xa3a8agBuQgaNRS46xFVKY0ytselY3sPMRHf3
         kF0O1vGuhwlrPPjuHC3cXznNrF9iNFDGypNFQZ5sT/345Zyg5WtxpYti68ZD5+epgq3d
         9z9hOuz+DKPx4ImvmeA9aXmU/oWUPAHobQ6691d5PHVKhThG8bRTZemMNYfOgvfZGTlv
         gcwhnPHZjVal6iSM+DiUyfug5czuqi0KUSdu0P0AAS7ExOXdFjzA0ze0KhAjin33GoWD
         fFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iIHgf++BMSB9VDaBRUyc2M71pFRcjs8R8onkZvtpv9I=;
        b=hXVq6a2wTw+zP26wQmetb8t2lgMABabuJa2M8IUG59v2FVEpi3iRMp83HPdV32SBMg
         bk8IRVxBTHQyX1+HYO4Bis3QzbhVmEmYTc0vOCcFGDl9NDfRvtrtokhdholpKneTUPc6
         sXfN6wLSpYg9KrlrPbr+k6a5vv2MHKKu2gADYiawoG4vzDqEXVx+tl6rGnNtm3sygzf+
         //PK9BeE+dK1zd26CVWE6xbs5Jm5Dq5JISi6W19OwBrL/uCfiGeiZvK57Rd1/sNqsa0X
         j6P+pD51WzLh+kv1cSW/rd1KQmbmvqJpon5/ShDJZM5rYxiKIQQwNlbqjSoJbghXQyMe
         51fg==
X-Gm-Message-State: APjAAAW6C8BeVNwxtkymaqIbida7JTWX92fz4qwIWbAN47XqGX48pWl/
        i9fKs9tOv+hrs0KUqSQHeO1zpRvctXHx7LFkfUmOpK+9
X-Google-Smtp-Source: APXvYqwaXBG6Hr+eoiYu4a19sl4gxorIqPlHZbz1agno/asCQ6Udi7nCwlM+5/tGex3rR3qpA+s92NDxa/QF8iMXX9Q=
X-Received: by 2002:aca:451:: with SMTP id 78mr8313255oie.170.1574349667610;
 Thu, 21 Nov 2019 07:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20191120143644.GA5865@sol> <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol> <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
 <20191121074621.GA17026@sol> <CAMRc=MeOAsOU4PVuUd1CPVLhcTWaj_e7AzQSi4u-m3Gf9m3xqQ@mail.gmail.com>
 <20191121093030.GA19142@sol> <CAMRc=Mcy2yNCZOvX5GN-yped1ZXo13bvvk04S-EyfARpGBcRMQ@mail.gmail.com>
 <20191121101808.GA20627@sol> <CAMRc=Mct7O2eA7peQ+teei5L2mma-XTsn8Pj-yRk7NCGX_dfxw@mail.gmail.com>
 <20191121105911.GA21160@sol>
In-Reply-To: <20191121105911.GA21160@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 21 Nov 2019 16:20:56 +0100
Message-ID: <CAMpxmJXcMq9wvZhyoc3DpcXSN6OHUfbA3apGEx8sBsZgakyK5w@mail.gmail.com>
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

czw., 21 lis 2019 o 11:59 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Thu, Nov 21, 2019 at 11:27:10AM +0100, Bartosz Golaszewski wrote:
> > czw., 21 lis 2019 o 11:18 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > On Thu, Nov 21, 2019 at 11:03:32AM +0100, Bartosz Golaszewski wrote:
> > > > czw., 21 lis 2019 o 10:30 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > > > >
> > > > > On Thu, Nov 21, 2019 at 09:46:07AM +0100, Bartosz Golaszewski wro=
te:
> > > > > > czw., 21 lis 2019 o 08:46 Kent Gibson <warthog618@gmail.com> na=
pisa=C5=82(a):
> > > > > > >
> > > > > > > On Thu, Nov 21, 2019 at 08:13:42AM +0100, Bartosz Golaszewski=
 wrote:
> > > > > > > > czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.com=
> napisa=C5=82(a):
> > > > > > > > >
> > > > > > > > > On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golasze=
wski wrote:
> > > > > > > > > > =C5=9Br., 20 lis 2019 o 15:36 Kent Gibson <warthog618@g=
mail.com> napisa=C5=82(a):
> > > > > > > > > > >
> > > > > > > > > > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Gol=
aszewski wrote:
> > > > > > > > > > > > =C5=9Br., 20 lis 2019 o 15:13 Kent Gibson <warthog6=
18@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz=
 Golaszewski wrote:
> > > > > > > > > > > > > > =C5=9Br., 20 lis 2019 o 14:59 Kent Gibson <wart=
hog618@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bar=
tosz Golaszewski wrote:
> > > > > > > > > > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warth=
og618@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800,=
 Kent Gibson wrote:
> > > > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +010=
0, Bartosz Golaszewski
> > > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > > +int gpiod_line_set_flags_bulk(stru=
ct gpiod_line_bulk *bulk, int flags)
> > > > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > > > > > > > > > +       int values[GPIOD_LINE_BULK_=
MAX_LINES];
> > > > > > > > > > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > > +       line =3D gpiod_line_bulk_ge=
t_line(bulk, 0);
> > > > > > > > > > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > Can you explain the purpose of this a=
s_is field? I'm not sure this is
> > > > > > > > > > > > > > > > > > > really needed.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > It is there for gpiod_set_flags, which =
has to populate the direction
> > > > > > > > > > > > > > > > > > flags in the SET_CONFIG ioctl. The exis=
ting line->direction is
> > > > > > > > > > > > > > > > > > either input or output.  It is drawn fr=
om GPIOLINE_FLAG_IS_OUT, so
> > > > > > > > > > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > > > > > > > > > I didn't want to change the existing li=
ne->direction, and adding the
> > > > > > > > > > > > > > > > > > as-is seemed clearer than adding anothe=
r flavour of direction that
> > > > > > > > > > > > > > > > > > contained all three.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Hmmm, I think I see what you were getting=
 at - the line->direction is the
> > > > > > > > > > > > > > > > > direction from the kernel, so it doesn't =
hurt to use that value to set the
> > > > > > > > > > > > > > > > > corresponding request flags - even if the=
 original request was as-is??
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > If that is the case then the line->as_is =
can be dropped throughout.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Yes, this is what I was thinking. Just need=
 to make sure the value
> > > > > > > > > > > > > > > > from the kernel is up-to-date.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > So fail if needs_update?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I'd say: do an implicit update before setting c=
onfig.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > So gpiod_line_update if needs_update, and fail if=
 that fails?
> > > > > > > > > > > > >
> > > > > > > > > > > > > Kent.
> > > > > > > > > > > >
> > > > > > > > > > > > Without the if - needs_update is only set if an imp=
licit update fails
> > > > > > > > > > > > in line_maybe_update(). But in this case we need to=
 be sure, so do it
> > > > > > > > > > > > unconditionally.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Given that line_maybe_update is called at the end of =
request creation, and
> > > > > > > > > > > whenever set_config is called, how can line->directio=
n be inconsistent
> > > > > > > > > > > with the kernel state - as long as needs_update is fa=
lse?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I don't think we should call line_maybe_update() on set=
_config() - in
> > > > > > > > > > this case we should call gpiod_line_update() and fail i=
n set_config()
> > > > > > > > > > if it fails.
> > > > > > > > > >
> > > > > > > > > > I hope that's clearer.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Not really.  I was already shaky on the needs_update and =
I'm getting more
> > > > > > > > > confused about the overall needs_update handling policy b=
y the minute.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Yeah it's not optimal. If you have better ideas on how to h=
andle the
> > > > > > > > fact that the kernel can't really notify us about the chang=
es in
> > > > > > > > line's flags introduced by other processes - I'll be more t=
han glad to
> > > > > > > > give them a try. At some point I was thinking about another=
 ioctl()
> > > > > > > > that - for a requested line - would return a file descripto=
r which
> > > > > > > > would emit events when a line changes - for instance, it's =
requested
> > > > > > > > by someone else or its direction is changed etc.
> > > > > > > >
> > > > > > >
> > > > > > > I didn't realise it was possible for a requested line's flags=
 to be
> > > > > > > changed by other processes.  Quite the opposite - I thought t=
hat was one
> > > > > > > of the reasons for GPIOD was to allow the userspace to preven=
t other from
> > > > > > > processes messing with requested lines.
> > > > > > >
> > > > > >
> > > > > > Ugh, sorry, was writing it before coffee. I was thinking about =
a
> > > > > > non-requested line. Something like lineinfo ioctl() but returni=
ng an
> > > > > > fd notifying about changes. Maybe we could even consider having
> > > > > > lineinfo2 ioctl() which would be extended with this functionali=
ty -
> > > > > > not only would it fill the relevant structure but also pass a n=
ew fd
> > > > > > for notification about changes.
> > > > > >
> > > > >
> > > > > Whew - that makes more sense. Had me worried there.
> > > > >
> > > > > Not sure how useful an async info ioctl would be.  Couldn't you b=
uild
> > > > > something equivalent in userspace with the existing API - as long=
 as you
> > > > > don't mind the daemon holding the line, and so having to control =
the
> > > > > line via the daemon.  You want to be able to monitor without requ=
esting
> > > > > the line?
> > > > >
> > > >
> > > > I'm not sure if I was expressing myself clearly enough: a hypotheti=
cal
> > > > daemon calls LINEINFO ioctl(). Now a different program or kernel
> > > > driver requests this line. The daemon is not up-to-date on its stat=
e
> > > > unless it polls the line all the time. If a user now asks the daemo=
n
> > > > about this line's state - it will be given outdated info. Listening=
 on
> > > > this fd would allow us to be informed about such changes immediatel=
y.
> > > >
> > >
> > > I think I understand you - but you might not be getting my meaning...
> > > I was thinking the daemon would request the lines it wanted to monito=
r
> > > - which is why you would then have to control the line via the daemon=
.
> >
> > No, I don't think requesting the line should be obligatory. In my WiP
> > dbus daemon, I expose line info for all lines in the system by reading
> > LINEINFO for each one. Then - for unrequested lines - every time the
> > client asks for any line info again - I call gpiod_line_update()
> > before responding. This could be optimized by this lineinfo fd
> > feature.
> >
> > I don't want to force the user-space to choose between using a single
> > central daemon or dealing with lines separately.
> >
> > > The daemon then always knows the state of the line.
> > > That obviously isn't the case if you want to monitor a line without
> > > requesting it, hence the "You want to be able to monitor without requ=
esting
> > > the line?" question.
> > >
> >
> > In other words: yes.
> >
> > >
> > > > > I'm still puzzled as to when the existing info ioctl could fail o=
n a
> > > > > requested line - which is when needs_update gets set in
> > > > > line_maybe_update().  Hardware being unplugged?
> > > > >
> > > >
> > > > If the ioctl() can fail, then we're obligated to check the return
> > > > value. As you say: unplugging the device is a good example - it may=
 be
> > > > a GPIO expander on an HID device (e.g. Silicon Labs CP2112) that ca=
n
> > > > be easily disconnected from USB.
> > > >
> > >
> > > Fair enough. But for failures of that scale shouldn't the line reques=
t
> > > fail - rather than just setting needs_update?  Or are there less
> > > catastrohpic failure modes?
> > >
> >
> > What if the disconnect happens after the request but before the
> > update? It's super unlikely, but again: the lineinfo ioctl() can fail,
> > so we need to check the return value. We also can't update line info
> > before requesting the line as it's racy - someone can change the state
> > between the update and the request.
> >
> > (I hope I'm getting this right :))
> >
>
> I understand that the disconnect can occur between the request ioctl and
> the info ioctl, but both of those are called within
> line_request_values(), which implements the core of
> gpiod_line_request_bulk(), so the opportunity exists to propagate the inf=
o
> failure back as part of the request, but instead the error is absorbed
> and needs_update is set.  This puts the onus on the caller to always
> check gpiod_line_needs_update() between requesting a line and calling
> any of the state accessors - else they may be returning garbage.
>
> Similarly the event case in line_request_event_single().
>
> I was wondering what the reasoning was for this approach?
>

So I've been thinking about why I decided to go with this - and while
I can't remember any more (I didn't comment on it...) I think there
must have been *some* reason to do this. Now it actually seems to me
as if we could make the request function release all lines and return
an error if updating fails (we'd also need to make
gpiod_line_needs_update() deprecated and always return false for
compatibility). I need to think about it some more...

Bart

> Kent.

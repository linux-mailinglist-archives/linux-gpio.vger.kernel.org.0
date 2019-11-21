Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196771050EF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 11:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfKUK7S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 05:59:18 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:38052 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUK7S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 05:59:18 -0500
Received: by mail-pj1-f67.google.com with SMTP id f7so1305721pjw.5
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 02:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=sJLCmqtRhrMyD7pL9RVxN0bfOj7BjqIDlFAU/TjQNQs=;
        b=HUbHskhjJNc57eo1SY+VlvEEgcjO+exNwWF/M5SRcP0KvsjYFp9beJ7NdSb2qEUyGM
         bBzGrMDxF2688epPjjouLk/Q/9ykZddISUMai4xuiR1sjprpVLvy1iy2nvw8ukoJTz7X
         8qBPAuoeaO8IYc69CXrR/HVNtowY1og91Zxsd7cKoeRETUJuYokbBGT4vj3aESXURjIA
         8+enzos7LKzPDLeNC7RM9bKSMuevVBnYsvOZt6/wWyxBSQwlS4QMPnhYNDBr+sX8VcbS
         ogmdxUCesRfbSLLWjqRVa38TV3q+VpI9hWyS/1Qw/A32vGRKaoOg5lJdqGsKlQwBwv3V
         Yl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=sJLCmqtRhrMyD7pL9RVxN0bfOj7BjqIDlFAU/TjQNQs=;
        b=MsRZhdfLq7ZbcN0RjWxIGuz7TcPKnCk2FbQSWkz3NbCzzDVJy+hskNt75yHS/l6mkX
         bHHxaupwzSps8PivvJ4d1qddbhstEOkfWf7fFPhntvjV+/4rEsQuSqeMc6dx8wxySCbR
         ntoeieiHzk85WFa+DcVK6g/24zQ9gsD6X+LaDQHAqhh585aOVUx0rODXaGHyPAsqlrHI
         KZ+vl06Rc2Cjm5xdjf882ZmeMuHcm+nP1p+Zt7HyfYwZly7Ktew2/NG6zLc5BK0va9uJ
         SscGp91SWgtj5uA4kJDJVTLR1wnhiMoDoSSqEviiGp/yAawC8UUr1rjW6zhV+jetBigC
         pYxw==
X-Gm-Message-State: APjAAAWpe39VyPfhGiheaEPlsos8hvJT+YEMn4fekCA4/zu5rGEfY59o
        WN4D7ZGocfLUl2X9GBwte2tX2uIsj0s=
X-Google-Smtp-Source: APXvYqz+sFYR8QCE1T/nVLDK2qFLvt1I2F/Lc2N1/Y2t5fuR6wI1YO8tuWeYy3mZLycjks58gOXAng==
X-Received: by 2002:a17:90a:610:: with SMTP id j16mr10703524pjj.85.1574333956924;
        Thu, 21 Nov 2019 02:59:16 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id p7sm2909170pfn.14.2019.11.21.02.59.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 02:59:16 -0800 (PST)
Date:   Thu, 21 Nov 2019 18:59:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191121105911.GA21160@sol>
References: <20191120143644.GA5865@sol>
 <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol>
 <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
 <20191121074621.GA17026@sol>
 <CAMRc=MeOAsOU4PVuUd1CPVLhcTWaj_e7AzQSi4u-m3Gf9m3xqQ@mail.gmail.com>
 <20191121093030.GA19142@sol>
 <CAMRc=Mcy2yNCZOvX5GN-yped1ZXo13bvvk04S-EyfARpGBcRMQ@mail.gmail.com>
 <20191121101808.GA20627@sol>
 <CAMRc=Mct7O2eA7peQ+teei5L2mma-XTsn8Pj-yRk7NCGX_dfxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mct7O2eA7peQ+teei5L2mma-XTsn8Pj-yRk7NCGX_dfxw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 21, 2019 at 11:27:10AM +0100, Bartosz Golaszewski wrote:
> czw., 21 lis 2019 o 11:18 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Thu, Nov 21, 2019 at 11:03:32AM +0100, Bartosz Golaszewski wrote:
> > > czw., 21 lis 2019 o 10:30 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Thu, Nov 21, 2019 at 09:46:07AM +0100, Bartosz Golaszewski wrote:
> > > > > czw., 21 lis 2019 o 08:46 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > >
> > > > > > On Thu, Nov 21, 2019 at 08:13:42AM +0100, Bartosz Golaszewski wrote:
> > > > > > > czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > >
> > > > > > > > On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > śr., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > >
> > > > > > > > > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > > > śr., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > > > >
> > > > > > > > > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > > > > > śr., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > > > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Can you explain the purpose of this as_is field? I'm not sure this is
> > > > > > > > > > > > > > > > > > really needed.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > It is there for gpiod_set_flags, which has to populate the direction
> > > > > > > > > > > > > > > > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > > > > > > > > > > > > > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > > > > > > > > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > > > > > > > > I didn't want to change the existing line->direction, and adding the
> > > > > > > > > > > > > > > > > as-is seemed clearer than adding another flavour of direction that
> > > > > > > > > > > > > > > > > contained all three.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Hmmm, I think I see what you were getting at - the line->direction is the
> > > > > > > > > > > > > > > > direction from the kernel, so it doesn't hurt to use that value to set the
> > > > > > > > > > > > > > > > corresponding request flags - even if the original request was as-is??
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > If that is the case then the line->as_is can be dropped throughout.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Yes, this is what I was thinking. Just need to make sure the value
> > > > > > > > > > > > > > > from the kernel is up-to-date.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So fail if needs_update?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I'd say: do an implicit update before setting config.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > So gpiod_line_update if needs_update, and fail if that fails?
> > > > > > > > > > > >
> > > > > > > > > > > > Kent.
> > > > > > > > > > >
> > > > > > > > > > > Without the if - needs_update is only set if an implicit update fails
> > > > > > > > > > > in line_maybe_update(). But in this case we need to be sure, so do it
> > > > > > > > > > > unconditionally.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Given that line_maybe_update is called at the end of request creation, and
> > > > > > > > > > whenever set_config is called, how can line->direction be inconsistent
> > > > > > > > > > with the kernel state - as long as needs_update is false?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I don't think we should call line_maybe_update() on set_config() - in
> > > > > > > > > this case we should call gpiod_line_update() and fail in set_config()
> > > > > > > > > if it fails.
> > > > > > > > >
> > > > > > > > > I hope that's clearer.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Not really.  I was already shaky on the needs_update and I'm getting more
> > > > > > > > confused about the overall needs_update handling policy by the minute.
> > > > > > > >
> > > > > > >
> > > > > > > Yeah it's not optimal. If you have better ideas on how to handle the
> > > > > > > fact that the kernel can't really notify us about the changes in
> > > > > > > line's flags introduced by other processes - I'll be more than glad to
> > > > > > > give them a try. At some point I was thinking about another ioctl()
> > > > > > > that - for a requested line - would return a file descriptor which
> > > > > > > would emit events when a line changes - for instance, it's requested
> > > > > > > by someone else or its direction is changed etc.
> > > > > > >
> > > > > >
> > > > > > I didn't realise it was possible for a requested line's flags to be
> > > > > > changed by other processes.  Quite the opposite - I thought that was one
> > > > > > of the reasons for GPIOD was to allow the userspace to prevent other from
> > > > > > processes messing with requested lines.
> > > > > >
> > > > >
> > > > > Ugh, sorry, was writing it before coffee. I was thinking about a
> > > > > non-requested line. Something like lineinfo ioctl() but returning an
> > > > > fd notifying about changes. Maybe we could even consider having
> > > > > lineinfo2 ioctl() which would be extended with this functionality -
> > > > > not only would it fill the relevant structure but also pass a new fd
> > > > > for notification about changes.
> > > > >
> > > >
> > > > Whew - that makes more sense. Had me worried there.
> > > >
> > > > Not sure how useful an async info ioctl would be.  Couldn't you build
> > > > something equivalent in userspace with the existing API - as long as you
> > > > don't mind the daemon holding the line, and so having to control the
> > > > line via the daemon.  You want to be able to monitor without requesting
> > > > the line?
> > > >
> > >
> > > I'm not sure if I was expressing myself clearly enough: a hypothetical
> > > daemon calls LINEINFO ioctl(). Now a different program or kernel
> > > driver requests this line. The daemon is not up-to-date on its state
> > > unless it polls the line all the time. If a user now asks the daemon
> > > about this line's state - it will be given outdated info. Listening on
> > > this fd would allow us to be informed about such changes immediately.
> > >
> >
> > I think I understand you - but you might not be getting my meaning...
> > I was thinking the daemon would request the lines it wanted to monitor
> > - which is why you would then have to control the line via the daemon.
> 
> No, I don't think requesting the line should be obligatory. In my WiP
> dbus daemon, I expose line info for all lines in the system by reading
> LINEINFO for each one. Then - for unrequested lines - every time the
> client asks for any line info again - I call gpiod_line_update()
> before responding. This could be optimized by this lineinfo fd
> feature.
> 
> I don't want to force the user-space to choose between using a single
> central daemon or dealing with lines separately.
> 
> > The daemon then always knows the state of the line.
> > That obviously isn't the case if you want to monitor a line without
> > requesting it, hence the "You want to be able to monitor without requesting
> > the line?" question.
> >
> 
> In other words: yes.
> 
> >
> > > > I'm still puzzled as to when the existing info ioctl could fail on a
> > > > requested line - which is when needs_update gets set in
> > > > line_maybe_update().  Hardware being unplugged?
> > > >
> > >
> > > If the ioctl() can fail, then we're obligated to check the return
> > > value. As you say: unplugging the device is a good example - it may be
> > > a GPIO expander on an HID device (e.g. Silicon Labs CP2112) that can
> > > be easily disconnected from USB.
> > >
> >
> > Fair enough. But for failures of that scale shouldn't the line request
> > fail - rather than just setting needs_update?  Or are there less
> > catastrohpic failure modes?
> >
> 
> What if the disconnect happens after the request but before the
> update? It's super unlikely, but again: the lineinfo ioctl() can fail,
> so we need to check the return value. We also can't update line info
> before requesting the line as it's racy - someone can change the state
> between the update and the request.
> 
> (I hope I'm getting this right :))
> 

I understand that the disconnect can occur between the request ioctl and
the info ioctl, but both of those are called within
line_request_values(), which implements the core of
gpiod_line_request_bulk(), so the opportunity exists to propagate the info
failure back as part of the request, but instead the error is absorbed
and needs_update is set.  This puts the onus on the caller to always
check gpiod_line_needs_update() between requesting a line and calling
any of the state accessors - else they may be returning garbage.

Similarly the event case in line_request_event_single().

I was wondering what the reasoning was for this approach?

Kent.

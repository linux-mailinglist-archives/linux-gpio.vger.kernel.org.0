Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF932105114
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 12:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfKULHe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 06:07:34 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33315 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfKULHe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 06:07:34 -0500
Received: by mail-pl1-f196.google.com with SMTP id ay6so1436172plb.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 03:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=yuJ32jCbXWvRTBKPLdr1i1PWtAG84v/CTsAKhC/0S1U=;
        b=iCihMiaMmJKpaHwUnoUih41ykdVe8Sg70GnnXjMeaF+uNd1VK144EKnkfb0dmXefLe
         Ze8Fpl8pOQpHMTwBoiyY8P3Jg5BeR5R5pivGDWcX52noutf+PPqnuIg4YOksSdHL6nJW
         C05ykbdS0ddIJVJ4D2r0AdUldhSKQTHNLhjhL8JroFtmJLzQ2xj5G5C+pX8g6dBLWDm2
         Gqb6MjwT9NEvE63gQTEQvN9/OqHDOkB1ER8E4R96fuxzy7l8Oz6gNgEvPvUU9kMaouCq
         bVG7Kc/KMWy2D0XGgKt3ozuK1YamMOmJpKZPssBCCOWEasDECdu6d1YI9hJpeLIe4UEJ
         f48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=yuJ32jCbXWvRTBKPLdr1i1PWtAG84v/CTsAKhC/0S1U=;
        b=Csw3RT2HfN6pRi8FjljnE+h2LGTZDitIfSP9Vv20PvbGprHzBdcj79Eeb7ZPzs0mbp
         5xMqaDsjor+gJTa0lUoy9t4mLlkq30hUHW5p16p0ovNYGVplrl9ENWN4l61pOb3SJJz0
         rxWLAqvMR4tpoMYQI3ipj0Th5n/nEHx5fKIAZeUAXCxLzEZ9EDLTFoXjyS8YZYwQdCKt
         O0U864x3vPbF7ahPQWDVO8j0TrGtqxvJAi2UmVSs0RI5OLoS3CR2Emn04MXePbSwRLrr
         R0EudJdNM5kXBz25T+AbuQya8gJElVZgSazfqoUdD3XmJ9rzgdYbtzHqJI4Hkg+ZWWwZ
         aj/g==
X-Gm-Message-State: APjAAAUtx3JhVD+qmL2p/mzBkDH/DxO0yeKIJb8dZgZn2NttP+LR62LV
        R62ChXnJ2kHnbWIuRBlrRtM=
X-Google-Smtp-Source: APXvYqyiadKQrIXc6ZkuX0ZdWx7NXto4LXtnbdGFRQ1Gjwn9z7iKx7Mx6FAzIVF5YSJFi3dWSV/+/Q==
X-Received: by 2002:a17:902:ff07:: with SMTP id f7mr8263523plj.216.1574334453145;
        Thu, 21 Nov 2019 03:07:33 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b9sm3165096pfp.77.2019.11.21.03.07.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 03:07:32 -0800 (PST)
Date:   Thu, 21 Nov 2019 19:07:27 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191121110727.GA23018@sol>
References: <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol>
 <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
 <20191121074621.GA17026@sol>
 <CAMRc=MeOAsOU4PVuUd1CPVLhcTWaj_e7AzQSi4u-m3Gf9m3xqQ@mail.gmail.com>
 <20191121093030.GA19142@sol>
 <CAMRc=Mcy2yNCZOvX5GN-yped1ZXo13bvvk04S-EyfARpGBcRMQ@mail.gmail.com>
 <20191121101808.GA20627@sol>
 <CAMRc=Mct7O2eA7peQ+teei5L2mma-XTsn8Pj-yRk7NCGX_dfxw@mail.gmail.com>
 <CAMpxmJVKS=JcSOvBU9ZDkWVdgNZ9LVxZ3tvn_Da6a_8JMYBRUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVKS=JcSOvBU9ZDkWVdgNZ9LVxZ3tvn_Da6a_8JMYBRUw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 21, 2019 at 11:31:52AM +0100, Bartosz Golaszewski wrote:
> czw., 21 lis 2019 o 11:27 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> >
> > czw., 21 lis 2019 o 11:18 Kent Gibson <warthog618@gmail.com> napisał(a):
> > >
> > > On Thu, Nov 21, 2019 at 11:03:32AM +0100, Bartosz Golaszewski wrote:
> > > > czw., 21 lis 2019 o 10:30 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > >
> > > > > On Thu, Nov 21, 2019 at 09:46:07AM +0100, Bartosz Golaszewski wrote:
> > > > > > czw., 21 lis 2019 o 08:46 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > >
> > > > > > > On Thu, Nov 21, 2019 at 08:13:42AM +0100, Bartosz Golaszewski wrote:
> > > > > > > > czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > >
> > > > > > > > > On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > > śr., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > > >
> > > > > > > > > > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > > > > śr., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > > > > > > śr., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > > > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > > > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > > > > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > Can you explain the purpose of this as_is field? I'm not sure this is
> > > > > > > > > > > > > > > > > > > really needed.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > It is there for gpiod_set_flags, which has to populate the direction
> > > > > > > > > > > > > > > > > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > > > > > > > > > > > > > > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > > > > > > > > > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > > > > > > > > > I didn't want to change the existing line->direction, and adding the
> > > > > > > > > > > > > > > > > > as-is seemed clearer than adding another flavour of direction that
> > > > > > > > > > > > > > > > > > contained all three.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Hmmm, I think I see what you were getting at - the line->direction is the
> > > > > > > > > > > > > > > > > direction from the kernel, so it doesn't hurt to use that value to set the
> > > > > > > > > > > > > > > > > corresponding request flags - even if the original request was as-is??
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > If that is the case then the line->as_is can be dropped throughout.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Yes, this is what I was thinking. Just need to make sure the value
> > > > > > > > > > > > > > > > from the kernel is up-to-date.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > So fail if needs_update?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I'd say: do an implicit update before setting config.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > So gpiod_line_update if needs_update, and fail if that fails?
> > > > > > > > > > > > >
> > > > > > > > > > > > > Kent.
> > > > > > > > > > > >
> > > > > > > > > > > > Without the if - needs_update is only set if an implicit update fails
> > > > > > > > > > > > in line_maybe_update(). But in this case we need to be sure, so do it
> > > > > > > > > > > > unconditionally.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Given that line_maybe_update is called at the end of request creation, and
> > > > > > > > > > > whenever set_config is called, how can line->direction be inconsistent
> > > > > > > > > > > with the kernel state - as long as needs_update is false?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I don't think we should call line_maybe_update() on set_config() - in
> > > > > > > > > > this case we should call gpiod_line_update() and fail in set_config()
> > > > > > > > > > if it fails.
> > > > > > > > > >
> > > > > > > > > > I hope that's clearer.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Not really.  I was already shaky on the needs_update and I'm getting more
> > > > > > > > > confused about the overall needs_update handling policy by the minute.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Yeah it's not optimal. If you have better ideas on how to handle the
> > > > > > > > fact that the kernel can't really notify us about the changes in
> > > > > > > > line's flags introduced by other processes - I'll be more than glad to
> > > > > > > > give them a try. At some point I was thinking about another ioctl()
> > > > > > > > that - for a requested line - would return a file descriptor which
> > > > > > > > would emit events when a line changes - for instance, it's requested
> > > > > > > > by someone else or its direction is changed etc.
> > > > > > > >
> > > > > > >
> > > > > > > I didn't realise it was possible for a requested line's flags to be
> > > > > > > changed by other processes.  Quite the opposite - I thought that was one
> > > > > > > of the reasons for GPIOD was to allow the userspace to prevent other from
> > > > > > > processes messing with requested lines.
> > > > > > >
> > > > > >
> > > > > > Ugh, sorry, was writing it before coffee. I was thinking about a
> > > > > > non-requested line. Something like lineinfo ioctl() but returning an
> > > > > > fd notifying about changes. Maybe we could even consider having
> > > > > > lineinfo2 ioctl() which would be extended with this functionality -
> > > > > > not only would it fill the relevant structure but also pass a new fd
> > > > > > for notification about changes.
> > > > > >
> > > > >
> > > > > Whew - that makes more sense. Had me worried there.
> > > > >
> > > > > Not sure how useful an async info ioctl would be.  Couldn't you build
> > > > > something equivalent in userspace with the existing API - as long as you
> > > > > don't mind the daemon holding the line, and so having to control the
> > > > > line via the daemon.  You want to be able to monitor without requesting
> > > > > the line?
> > > > >
> > > >
> > > > I'm not sure if I was expressing myself clearly enough: a hypothetical
> > > > daemon calls LINEINFO ioctl(). Now a different program or kernel
> > > > driver requests this line. The daemon is not up-to-date on its state
> > > > unless it polls the line all the time. If a user now asks the daemon
> > > > about this line's state - it will be given outdated info. Listening on
> > > > this fd would allow us to be informed about such changes immediately.
> > > >
> > >
> > > I think I understand you - but you might not be getting my meaning...
> > > I was thinking the daemon would request the lines it wanted to monitor
> > > - which is why you would then have to control the line via the daemon.
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
> > > requesting it, hence the "You want to be able to monitor without requesting
> > > the line?" question.
> > >
> >
> > In other words: yes.
> >
> 
> Just to be clear: I mean line info - not values or events. By
> monitoring I mean: be notified about changes to the line properties
> without requesting it.
> 
> As for implementation: I imagine an ioctl() called LINEINFO_FD that
> would return an open file descriptor on which read events would arrive
> when the line properties change and then we could call regular line
> info ioctl() to actually re-read it. Does that make sense? I can try
> to prepare an example implementation.
> 

Ah, ok.  So you might want to send a dbus message when someone requests
a line, or changes direction or whatever, but not have the monitoring
daemon involved in the line control.  And not have the daemon polling
the LINEINFO ioctl.

Sounds reasonable.

Now, how did we get here?? ;-).

Kent.

> Bart
> 
> > >
> > > > > I'm still puzzled as to when the existing info ioctl could fail on a
> > > > > requested line - which is when needs_update gets set in
> > > > > line_maybe_update().  Hardware being unplugged?
> > > > >
> > > >
> > > > If the ioctl() can fail, then we're obligated to check the return
> > > > value. As you say: unplugging the device is a good example - it may be
> > > > a GPIO expander on an HID device (e.g. Silicon Labs CP2112) that can
> > > > be easily disconnected from USB.
> > > >
> > >
> > > Fair enough. But for failures of that scale shouldn't the line request
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
> > Bart
> >
> > > Kent.

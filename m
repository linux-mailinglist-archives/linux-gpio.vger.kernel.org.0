Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B50310F4CE
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 03:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfLCCJ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 21:09:29 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44641 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfLCCJ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 21:09:29 -0500
Received: by mail-pg1-f193.google.com with SMTP id x7so821293pgl.11;
        Mon, 02 Dec 2019 18:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Xe9IJkX82hr3CFWVtYT5KfCW7BSXtUq9zhuGMmcDS24=;
        b=LlSvCQGGriIxrQJn9PhmXjE5saKv8Toa7LqKttEIXWqwFU8/+tdn1oePjJHbaKBz9B
         2uE6/zpo8tHC68ky113GQmVmyRSCoJ+PBSbO41Ma7pDu0SuTCoNaoUCCw+YYrz+vwF+s
         o40RwpGPCy3eIJuRRdY7/+UWjIhdEQTKigowdPzUOTRcLbNKcecvmiCHZZwvphdGdgLE
         Pz2nFbaMsUifKfr7Yj9i6oBZ7t3dxNTr40cTJE+F/CR6XOnTv3accbLSw8y8yup/WBjA
         OiWY5G8vrA7t5dYtjrQvCituShNepLYcdGnkUTfmTUMNDf4BVfAn/b7zSUePiSydqqBZ
         +dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Xe9IJkX82hr3CFWVtYT5KfCW7BSXtUq9zhuGMmcDS24=;
        b=GdtPE6DaLaod+TU4l3EjF73i3N7/n3NYR0CM63Cjne/ucMP+eyrewFxLOjIah1i224
         2/XdFxxEqtq2WaxyIumltoRvKWDYXSLpmtX+Oc5w0GX5t6vQfzwNAk0eVNtp8tN5fjwz
         31+DVV6sZggbBDCmlmIOypEp9CzOEqpSYO0zwBfbwo869Nb4KpX4vf3NVgjAy0lsjOzS
         oAkAsIgNIlorl0OD2Iu7NWSkm2OMO7cbGypQPSI9cFvu4ygy++2Zev4MprW+xxfozEEq
         B0pENmrggFKS3Xlsj1VKtDY+XqU/QeTTpbZa5xOIHW9+VrytDWC8tkfgcbqkngMBWWjr
         IZpA==
X-Gm-Message-State: APjAAAWBzUeCuSm+WF3aq8xReIWZAODrpb+rZMdlvYNDjnzoz8bfN9c+
        V3mw3V1DrXpGUKHN1ayIWyQ=
X-Google-Smtp-Source: APXvYqyLUPNvoW/1522v3CBoFEpopVYcSXN224HltWgLxpNIYww9I2VQcBdURBB2QPZn5N6Pu/RpMA==
X-Received: by 2002:a63:4f59:: with SMTP id p25mr2705844pgl.230.1575338968346;
        Mon, 02 Dec 2019 18:09:28 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id d65sm838841pfa.159.2019.12.02.18.09.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 18:09:27 -0800 (PST)
Date:   Tue, 3 Dec 2019 10:09:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] gpiolib: add new ioctl() for monitoring changes in
 line info
Message-ID: <20191203020921.GA7900@sol>
References: <20191127232330.GA3761@sol>
 <CAMRc=Me5kNUuPQCTM_H=2QjUL=7R-ii+uRvdNvAz3SqL_sPzcQ@mail.gmail.com>
 <20191128141028.GA15454@sol>
 <CAMRc=MeZzjuU25L_-qjP9n3O6Z3ucYUZkUoCA3sX0Z0yaXtgMw@mail.gmail.com>
 <20191128150200.GA16492@sol>
 <CAMRc=Md6aQobSoDVnAiLFQyZ1dKq8j4Wwm-_Zv9vrYReJvoCgA@mail.gmail.com>
 <20191129134907.GA24580@sol>
 <CAMpxmJUCjsWgZ0NHD2Uz-uG0F61J=BZe0G83=i=fewYYpWhrjQ@mail.gmail.com>
 <20191201234318.GA6832@sol>
 <CAMRc=MeVNWo-weCT=ROQz0mVc-2Lh4JnBrDSf=3rBAPPCYL5Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeVNWo-weCT=ROQz0mVc-2Lh4JnBrDSf=3rBAPPCYL5Bw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 02, 2019 at 06:11:06PM +0100, Bartosz Golaszewski wrote:
> pon., 2 gru 2019 o 00:43 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> 
> [snip!]
> 
> > > > >
> > > > > How about reusing the already existing file descriptor associated with
> > > > > the chip itself? We currently only implement the ioctl() operation on
> > > > > it - the poll() and read() callbacks are empty.
> > > > >
> > > > > We'd need to add two new ioctls(): GPIOLINE_WATCH_IOCTL and
> > > > > GPIOLINE_UNWATCH_IOCTL. The structures for both would look like this:
> > > > >
> > > > > struct gpioline_watch_request {
> > > > >     __u32 lineoffset
> > > > >     struct gpioline_info info;
> > > > > };
> > > > >
> > > > > struct gpioline_unwatch_request {
> > > > >     __u32 lineoffset;
> > > > > };
> > > > >
> > > > > When GPIOLINE_WATCH_IOCTL is called, we'd setup a watch for given
> > > > > line: the embedded gpioline_info structure would be filled with
> > > > > initial info and we can now poll the gpiochip descriptor for events
> > > > > and read them. The event structure would looks like this:
> > > > >
> > > > > struct gpioline_changed {
> > > > >     __u32 event_type;
> > > > >     __u64 timestamp;
> > > > >     struct gpioline_info info;
> > > > > };
> > > > >
> > > > > Calling GPIOLINE_UNWATCH_IOCTL would of course make the kernel stop
> > > > > emitting events for given line.
> > > > >
> > > > > Does it make sense?
> > > > >
> > > >
> > > > That makes sense.  But it doesn't really address the underlying problem
> > > > that you have identified - it just makes it less likely that you will
> > > > fill the kfifo.
> > > >
> > > > Correct me if I'm wrong, but a pathological process or processes could
> > > > still swamp your kfifo with events, particularly if they are operating
> > > > on bulks.
> > >
> > > Don't get me wrong - the assumption is that a process knows what it's
> > > doing. We expect that if it watches lines for events, then it will
> > > actually read them as soon as they arrive on the other end of the
> > > FIFO. If not - then this won't affect others, it will fill up the FIFO
> > > associated with this process' file descriptor and we'll just drop new
> > > events until it consumes old ones. In other words: I'm not worried
> > > about pathological processes.
> > >
> >
> > The reader can't guarantee that it can read faster than changes can occur,
> > no matter how well intentioned it is.
> >
> > I am a bit worried if you just drop events, as there is no indication to
> > userspace that that has occured.
> 
> This is what happens now with line events anyway. I added a patch to
> the v2 of this series that adds a ratelimited debug message when the
> kfifo is full. At least that will leave a trace in the kernel log.
> Unfortunately there's no other way than limiting the FIFO's size -
> otherwise a malicious process could hog all the memory by not reading
> events.
> 
> >
> > > The problem here is that the file descriptor is created and there are
> > > already several (up to 64) events waiting to be read. This just
> > > doesn't feel right. If the process doesn't manage to consume all
> > > initial events in time, we'll drop new ones. The alternative is to
> > > allocate a larger FIFO but I just have a feeling that this whole
> > > approach is wrong. I'm not sure any other subsystem does something
> > > like this.
> > >
> > > >
> > > > I'd be happier with a solution that addresses what happens when the
> > > > kfifo is full, or even better prevents it from filling, and then see
> > > > how that feeds back to the startup case.
> > > >
> > >
> > > You can't really prevent it from overflowing as you can't
> > > update/modify elements in the middle.
> > >
> >
> > You can if you let go of the idea of adding something to the fifo for
> > every change.  If you know the change you want to signal is already in
> > the fifo then you don't need to add it again.
> >
> > The idea I'm suggesting now is for the fifo to contain "your info on
> > line X is stale" messages.  If that hasn't been ACKed by userspace then
> > there is no point adding another for that line.  So worst case you have
> > num_lines messages in the fifo at any time.
> 
> I see. But in this case I'm not sure a file descriptor is the right
> interface. When POLLIN events are detected by poll() called on an fd -
> it means there's data to read on the file descriptor: there's data
> already in the FIFO waiting to be consumed by the user-space.
> 

Agree with file descriptors not being ideal for this, but what other
options are there?

> Let's imagine the following situation: we detect one of the conditions
> for emitting the event in the kernel, we set the "needs_update" flag,
> we then wake up the polling process, but it calls the LINE_INFO
> ioctl() on the changed line without ever reading the event from the
> fd. What would happen now? Does the unread event disappear from the fd
> because the user "acked" the event? What about ordering of events when
> line X gets updated, then line Y, then X again but the process didn't
> read the first event?
> 

The unread event can't disappear from the fifo. The fifo is write only
from the kernel side, right?

You are right that things don't go well if userspace doesn't strictly
follow the read from fd then LINEINFO ioctl ordering.

So probably best to keep things simple.

And we should accept that overflows may occur.  As that would leave
userspace with stale info, userspace should poll the LINEINFO ioctl
occassionally to check that it is still in sync.

> IIRC the way the line events are handled in sysfs (polling
> 'gpioXYZ/value', while 'gpioXYZ/value' doesn't work as a FIFO) was
> criticized for its unreliability and was one of the reasons for
> developing the chardev.
> 

Tarring it with the sysfs brush is a bit harsh!
You are comparing apples and oranges.
In the sysfs case the problem was losing events.
In this case losing events is not critical.

> I would be much happier with your previous proposal: getting line_info
> when setting the watch and then getting it all again every time the
> status changes. We also get the "history" of changes that way.
> 

I believe the previous proposal was yours - adding watch and unwatch
ioctls to the chip fd.

Kent.

</snip>

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7994610FA4E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 09:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbfLCI67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 03:58:59 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:41781 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfLCI64 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 03:58:56 -0500
Received: by mail-io1-f65.google.com with SMTP id z26so2805754iot.8
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2019 00:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OkrBqSbGQQqKvPBRe7/T56fzqMDR8HSG0Yl2TDPSNZ4=;
        b=oVc/5gHSlenQ9kt2RH18hXenCkeBc2T/Z4fkTNAWnH7jKd1HlexTxZwIIz1NNuTIDt
         R9TcF8nEfpPPo4epu70Wy0oAQaFzbyGZMWFvU9xOKU8YZJ83hp2IwyN9YzvZ2pj1dxdw
         ficDhOs0TSKGEnOp8uga8mCwrsu/UcJy8NvtMpky1runYfsunwKSOe6DW3cUALWKavUp
         V5Y6Ttq9xasqmw3aX82kN1fdPSKaZjgDzYccu47bOpgHzSNSR40GXX/+wAxL0w1PvaiE
         HrK4MTuW2Lq9y4ayO4CXodpEGAYXOnVMn21OBmS8w1SIvTAIAA0SUNVN7ePbSZdisUdf
         LwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OkrBqSbGQQqKvPBRe7/T56fzqMDR8HSG0Yl2TDPSNZ4=;
        b=g/Zep+pjSPAnjii4IX+xNOIdbEt44/rY3nXOFcFn6+qKBTJD+2gaZNMpFnlJ+6634k
         PkB9C3lKPbhHnFI2w62z0Of5tiNbEj9x0oy+EQY4vFtF7osxpvyw3Av6oOywafTDKvVR
         mOUfFd+ekvcVrEAMaHFx+6Q54vmKyQTqP/+UhWJ1dkKj7b7ezpWNyu6QKYNmUMMpFeWj
         mh3tSoiJ1xmpNYOhuQDMawFUKjhx5/umQfTYGkNaawcydCBNSDssMcDdbJJxS1d2sG7i
         wfmaHEqq2QsLoTjjAQ+i1eU+5say9QiaQ52uYJcsfecoq9zNUfR89L79PihlkoP1bKh3
         8vBg==
X-Gm-Message-State: APjAAAUBxeuAbGr+oO2UL5pOcH5KpJxKfO+L1raA+42EHDQ2l03OBWZE
        yy47wYK1pwh6/7gTlPg46cCxy5KLBUBeQ4Au+Cs8Lg==
X-Google-Smtp-Source: APXvYqxy1Cm4zHs/Qqzhe21YjsHxxFD3dtLLC75jWk1WTguSKossIwjFUEWn4+SxjqK9Fz8RXjc8OU0gRPjaQnuNNqQ=
X-Received: by 2002:a05:6602:2352:: with SMTP id r18mr1416917iot.220.1575363535419;
 Tue, 03 Dec 2019 00:58:55 -0800 (PST)
MIME-Version: 1.0
References: <20191127232330.GA3761@sol> <CAMRc=Me5kNUuPQCTM_H=2QjUL=7R-ii+uRvdNvAz3SqL_sPzcQ@mail.gmail.com>
 <20191128141028.GA15454@sol> <CAMRc=MeZzjuU25L_-qjP9n3O6Z3ucYUZkUoCA3sX0Z0yaXtgMw@mail.gmail.com>
 <20191128150200.GA16492@sol> <CAMRc=Md6aQobSoDVnAiLFQyZ1dKq8j4Wwm-_Zv9vrYReJvoCgA@mail.gmail.com>
 <20191129134907.GA24580@sol> <CAMpxmJUCjsWgZ0NHD2Uz-uG0F61J=BZe0G83=i=fewYYpWhrjQ@mail.gmail.com>
 <20191201234318.GA6832@sol> <CAMRc=MeVNWo-weCT=ROQz0mVc-2Lh4JnBrDSf=3rBAPPCYL5Bw@mail.gmail.com>
 <20191203020921.GA7900@sol>
In-Reply-To: <20191203020921.GA7900@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 3 Dec 2019 09:58:44 +0100
Message-ID: <CAMRc=McpHbGvCgKUcV40bUZ1mxe9YzaBmTiS0+afoe-V0CN4VQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpiolib: add new ioctl() for monitoring changes in
 line info
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 3 gru 2019 o 03:09 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a):
>
> On Mon, Dec 02, 2019 at 06:11:06PM +0100, Bartosz Golaszewski wrote:
> > pon., 2 gru 2019 o 00:43 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> >
> > [snip!]
> >
> > > > > >
> > > > > > How about reusing the already existing file descriptor associat=
ed with
> > > > > > the chip itself? We currently only implement the ioctl() operat=
ion on
> > > > > > it - the poll() and read() callbacks are empty.
> > > > > >
> > > > > > We'd need to add two new ioctls(): GPIOLINE_WATCH_IOCTL and
> > > > > > GPIOLINE_UNWATCH_IOCTL. The structures for both would look like=
 this:
> > > > > >
> > > > > > struct gpioline_watch_request {
> > > > > >     __u32 lineoffset
> > > > > >     struct gpioline_info info;
> > > > > > };
> > > > > >
> > > > > > struct gpioline_unwatch_request {
> > > > > >     __u32 lineoffset;
> > > > > > };
> > > > > >
> > > > > > When GPIOLINE_WATCH_IOCTL is called, we'd setup a watch for giv=
en
> > > > > > line: the embedded gpioline_info structure would be filled with
> > > > > > initial info and we can now poll the gpiochip descriptor for ev=
ents
> > > > > > and read them. The event structure would looks like this:
> > > > > >
> > > > > > struct gpioline_changed {
> > > > > >     __u32 event_type;
> > > > > >     __u64 timestamp;
> > > > > >     struct gpioline_info info;
> > > > > > };
> > > > > >
> > > > > > Calling GPIOLINE_UNWATCH_IOCTL would of course make the kernel =
stop
> > > > > > emitting events for given line.
> > > > > >
> > > > > > Does it make sense?
> > > > > >
> > > > >
> > > > > That makes sense.  But it doesn't really address the underlying p=
roblem
> > > > > that you have identified - it just makes it less likely that you =
will
> > > > > fill the kfifo.
> > > > >
> > > > > Correct me if I'm wrong, but a pathological process or processes =
could
> > > > > still swamp your kfifo with events, particularly if they are oper=
ating
> > > > > on bulks.
> > > >
> > > > Don't get me wrong - the assumption is that a process knows what it=
's
> > > > doing. We expect that if it watches lines for events, then it will
> > > > actually read them as soon as they arrive on the other end of the
> > > > FIFO. If not - then this won't affect others, it will fill up the F=
IFO
> > > > associated with this process' file descriptor and we'll just drop n=
ew
> > > > events until it consumes old ones. In other words: I'm not worried
> > > > about pathological processes.
> > > >
> > >
> > > The reader can't guarantee that it can read faster than changes can o=
ccur,
> > > no matter how well intentioned it is.
> > >
> > > I am a bit worried if you just drop events, as there is no indication=
 to
> > > userspace that that has occured.
> >
> > This is what happens now with line events anyway. I added a patch to
> > the v2 of this series that adds a ratelimited debug message when the
> > kfifo is full. At least that will leave a trace in the kernel log.
> > Unfortunately there's no other way than limiting the FIFO's size -
> > otherwise a malicious process could hog all the memory by not reading
> > events.
> >
> > >
> > > > The problem here is that the file descriptor is created and there a=
re
> > > > already several (up to 64) events waiting to be read. This just
> > > > doesn't feel right. If the process doesn't manage to consume all
> > > > initial events in time, we'll drop new ones. The alternative is to
> > > > allocate a larger FIFO but I just have a feeling that this whole
> > > > approach is wrong. I'm not sure any other subsystem does something
> > > > like this.
> > > >
> > > > >
> > > > > I'd be happier with a solution that addresses what happens when t=
he
> > > > > kfifo is full, or even better prevents it from filling, and then =
see
> > > > > how that feeds back to the startup case.
> > > > >
> > > >
> > > > You can't really prevent it from overflowing as you can't
> > > > update/modify elements in the middle.
> > > >
> > >
> > > You can if you let go of the idea of adding something to the fifo for
> > > every change.  If you know the change you want to signal is already i=
n
> > > the fifo then you don't need to add it again.
> > >
> > > The idea I'm suggesting now is for the fifo to contain "your info on
> > > line X is stale" messages.  If that hasn't been ACKed by userspace th=
en
> > > there is no point adding another for that line.  So worst case you ha=
ve
> > > num_lines messages in the fifo at any time.
> >
> > I see. But in this case I'm not sure a file descriptor is the right
> > interface. When POLLIN events are detected by poll() called on an fd -
> > it means there's data to read on the file descriptor: there's data
> > already in the FIFO waiting to be consumed by the user-space.
> >
>
> Agree with file descriptors not being ideal for this, but what other
> options are there?
>
> > Let's imagine the following situation: we detect one of the conditions
> > for emitting the event in the kernel, we set the "needs_update" flag,
> > we then wake up the polling process, but it calls the LINE_INFO
> > ioctl() on the changed line without ever reading the event from the
> > fd. What would happen now? Does the unread event disappear from the fd
> > because the user "acked" the event? What about ordering of events when
> > line X gets updated, then line Y, then X again but the process didn't
> > read the first event?
> >
>
> The unread event can't disappear from the fifo. The fifo is write only
> from the kernel side, right?
>
> You are right that things don't go well if userspace doesn't strictly
> follow the read from fd then LINEINFO ioctl ordering.
>
> So probably best to keep things simple.
>
> And we should accept that overflows may occur.  As that would leave
> userspace with stale info, userspace should poll the LINEINFO ioctl
> occassionally to check that it is still in sync.
>
> > IIRC the way the line events are handled in sysfs (polling
> > 'gpioXYZ/value', while 'gpioXYZ/value' doesn't work as a FIFO) was
> > criticized for its unreliability and was one of the reasons for
> > developing the chardev.
> >
>
> Tarring it with the sysfs brush is a bit harsh!
> You are comparing apples and oranges.
> In the sysfs case the problem was losing events.
> In this case losing events is not critical.
>
> > I would be much happier with your previous proposal: getting line_info
> > when setting the watch and then getting it all again every time the
> > status changes. We also get the "history" of changes that way.
> >
>
> I believe the previous proposal was yours - adding watch and unwatch
> ioctls to the chip fd.

The idea was yours, the concrete proposal was mine. :)

I'll try to prepare a v2 and let's discuss the code again.

Bart

>
> Kent.
>
> </snip>

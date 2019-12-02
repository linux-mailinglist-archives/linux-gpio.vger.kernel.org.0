Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90A9910EDEE
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 18:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbfLBRLT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 12:11:19 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:33466 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727644AbfLBRLT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 12:11:19 -0500
Received: by mail-io1-f66.google.com with SMTP id j13so165320ioe.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2019 09:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h5WOOF5+XwAdB8g+uLyi3g9vtPyjHzXskKrYOklWCYY=;
        b=vu8WrqJfwamqQFz2/i1Ym/Douf/0HuEj2VW4TTOTWIjP9Ui4hX8C/ds6zb4ubXI48+
         BF0sRp44r/WlgTGgDNCr7KL0zOpDwc6z1Y+8VO6v5Bahb+nLJzzYZL9I4sLqAmcdFh1W
         hL6XdS73o58kIS/xslFotCWkMmqJP/IcpGCg2BhXOFdC7071uYlXf8q3BI1RY+cBspyv
         mmnSyuGGY/46QEHR+0zBh1KNahSEN65L6IlAAEMhbY6ktp7Iks1DX+iMbO42tMOc56iY
         WXdLmrRzbDwbpWlolWscLQviiiB9BRaDjgyaiUunwlRqW1O//q9Mff6SI5u90iZDjF+d
         MzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h5WOOF5+XwAdB8g+uLyi3g9vtPyjHzXskKrYOklWCYY=;
        b=i08zvGgwpLXQ691Wp99CWv3buc9Sucw89xcD/fi8QqAToVZa0BeDZ5LSweoifIHazZ
         NnnL821vGG4OTYNPEDAqoCVIYxifMdFiOshhKK8ZNDJ/Jv+g4kion5GcdM5iMtD1MMO/
         EfLz4xKpJH8pnCWSB25XXiM5CGBYO7p3Sr9K8jqq4FGr9RqDOdcQulTeHaf+9g6lEDGC
         ne739O06JwrlFsCjdueAUwFBbzHQD5zfAGLSzqaF3DXd+/RUscHjUPUyc9VCR7vOXEGT
         UwUk/fqrl4eDtREjsi3Hj9+QiCJd+kjYsSxZte9+ZsGiLzX+6t849Bt7fIMWHPxhAGHS
         ELKA==
X-Gm-Message-State: APjAAAXP8bvQyhBltYzfQuatmpPorFFilLUNusz9H3sJODXnB0cxQsfG
        rUdXzHis0qVaAJXgUV7YZ1bgJ/GxScymKSbZNk1WpQ==
X-Google-Smtp-Source: APXvYqyL+PcazPoJWL/7qoBwKJHmwL+z6VUcO7dhz+uxkSuKrwM/EhYnvXLCTw3QYFACoZqdEX4QkO8R6wmgd9bNGC4=
X-Received: by 2002:a5d:8b83:: with SMTP id p3mr53847541iol.189.1575306677494;
 Mon, 02 Dec 2019 09:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20191127152410.GA24936@sol> <CAMRc=MdLnZFJQ+qMJSiSQSh6pOnKpLeU79u9ymA7HaujgK0kcg@mail.gmail.com>
 <20191127232330.GA3761@sol> <CAMRc=Me5kNUuPQCTM_H=2QjUL=7R-ii+uRvdNvAz3SqL_sPzcQ@mail.gmail.com>
 <20191128141028.GA15454@sol> <CAMRc=MeZzjuU25L_-qjP9n3O6Z3ucYUZkUoCA3sX0Z0yaXtgMw@mail.gmail.com>
 <20191128150200.GA16492@sol> <CAMRc=Md6aQobSoDVnAiLFQyZ1dKq8j4Wwm-_Zv9vrYReJvoCgA@mail.gmail.com>
 <20191129134907.GA24580@sol> <CAMpxmJUCjsWgZ0NHD2Uz-uG0F61J=BZe0G83=i=fewYYpWhrjQ@mail.gmail.com>
 <20191201234318.GA6832@sol>
In-Reply-To: <20191201234318.GA6832@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Dec 2019 18:11:06 +0100
Message-ID: <CAMRc=MeVNWo-weCT=ROQz0mVc-2Lh4JnBrDSf=3rBAPPCYL5Bw@mail.gmail.com>
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

pon., 2 gru 2019 o 00:43 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>

[snip!]

> > > >
> > > > How about reusing the already existing file descriptor associated w=
ith
> > > > the chip itself? We currently only implement the ioctl() operation =
on
> > > > it - the poll() and read() callbacks are empty.
> > > >
> > > > We'd need to add two new ioctls(): GPIOLINE_WATCH_IOCTL and
> > > > GPIOLINE_UNWATCH_IOCTL. The structures for both would look like thi=
s:
> > > >
> > > > struct gpioline_watch_request {
> > > >     __u32 lineoffset
> > > >     struct gpioline_info info;
> > > > };
> > > >
> > > > struct gpioline_unwatch_request {
> > > >     __u32 lineoffset;
> > > > };
> > > >
> > > > When GPIOLINE_WATCH_IOCTL is called, we'd setup a watch for given
> > > > line: the embedded gpioline_info structure would be filled with
> > > > initial info and we can now poll the gpiochip descriptor for events
> > > > and read them. The event structure would looks like this:
> > > >
> > > > struct gpioline_changed {
> > > >     __u32 event_type;
> > > >     __u64 timestamp;
> > > >     struct gpioline_info info;
> > > > };
> > > >
> > > > Calling GPIOLINE_UNWATCH_IOCTL would of course make the kernel stop
> > > > emitting events for given line.
> > > >
> > > > Does it make sense?
> > > >
> > >
> > > That makes sense.  But it doesn't really address the underlying probl=
em
> > > that you have identified - it just makes it less likely that you will
> > > fill the kfifo.
> > >
> > > Correct me if I'm wrong, but a pathological process or processes coul=
d
> > > still swamp your kfifo with events, particularly if they are operatin=
g
> > > on bulks.
> >
> > Don't get me wrong - the assumption is that a process knows what it's
> > doing. We expect that if it watches lines for events, then it will
> > actually read them as soon as they arrive on the other end of the
> > FIFO. If not - then this won't affect others, it will fill up the FIFO
> > associated with this process' file descriptor and we'll just drop new
> > events until it consumes old ones. In other words: I'm not worried
> > about pathological processes.
> >
>
> The reader can't guarantee that it can read faster than changes can occur=
,
> no matter how well intentioned it is.
>
> I am a bit worried if you just drop events, as there is no indication to
> userspace that that has occured.

This is what happens now with line events anyway. I added a patch to
the v2 of this series that adds a ratelimited debug message when the
kfifo is full. At least that will leave a trace in the kernel log.
Unfortunately there's no other way than limiting the FIFO's size -
otherwise a malicious process could hog all the memory by not reading
events.

>
> > The problem here is that the file descriptor is created and there are
> > already several (up to 64) events waiting to be read. This just
> > doesn't feel right. If the process doesn't manage to consume all
> > initial events in time, we'll drop new ones. The alternative is to
> > allocate a larger FIFO but I just have a feeling that this whole
> > approach is wrong. I'm not sure any other subsystem does something
> > like this.
> >
> > >
> > > I'd be happier with a solution that addresses what happens when the
> > > kfifo is full, or even better prevents it from filling, and then see
> > > how that feeds back to the startup case.
> > >
> >
> > You can't really prevent it from overflowing as you can't
> > update/modify elements in the middle.
> >
>
> You can if you let go of the idea of adding something to the fifo for
> every change.  If you know the change you want to signal is already in
> the fifo then you don't need to add it again.
>
> The idea I'm suggesting now is for the fifo to contain "your info on
> line X is stale" messages.  If that hasn't been ACKed by userspace then
> there is no point adding another for that line.  So worst case you have
> num_lines messages in the fifo at any time.

I see. But in this case I'm not sure a file descriptor is the right
interface. When POLLIN events are detected by poll() called on an fd -
it means there's data to read on the file descriptor: there's data
already in the FIFO waiting to be consumed by the user-space.

Let's imagine the following situation: we detect one of the conditions
for emitting the event in the kernel, we set the "needs_update" flag,
we then wake up the polling process, but it calls the LINE_INFO
ioctl() on the changed line without ever reading the event from the
fd. What would happen now? Does the unread event disappear from the fd
because the user "acked" the event? What about ordering of events when
line X gets updated, then line Y, then X again but the process didn't
read the first event?

IIRC the way the line events are handled in sysfs (polling
'gpioXYZ/value', while 'gpioXYZ/value' doesn't work as a FIFO) was
criticized for its unreliability and was one of the reasons for
developing the chardev.

I would be much happier with your previous proposal: getting line_info
when setting the watch and then getting it all again every time the
status changes. We also get the "history" of changes that way.

Bart

>
> > > Time to revisit your requirements...  Userspace doesn't need the deta=
ils
> > > of each change, all you are after is an asynchronous mechanism to
> > > bring userspace up to date.  You only need to inform userspace that t=
he
> > > line has changed since it was last informed of a change (or the fd wa=
s
> > > created).  You can collapse a set of changes that haven't reached
> > > userspace down to the last one.  Then the outstanding messages for
> > > userspace is at worst the number of lines being monitored.
> > >
> > > Wrt how to implement that, how about this:
> > > When a line is changed you set a "needs_update" flag on that line, an=
d
> > > if not already set then issue a change to userspace via the fd.  That=
 only
> > > contains the line offset - no info.
> >
> > Doesn't this bring us right back to my racy initial implementation?
> >
>
> It is closer to your original, but the race is only relevant when you
> are trying to match line info with changed events.  I'm suggesting we
> give up trying to do that.  It was probably a mistake to go down that
> particular rat hole - my bad.
>
> All we do here is notify to userspace that their info is stale.
> They ACK that by performing a LINEINFO ioctl on the monitoring fd (it
> can't be the chip fd as we are introducing side effects - the ACK).
> When the kernel sends the response to the LINEINFO ioctl we know the
> kernel and userspace are in sync at that time.  And isn't that what you
> want to achieve - bringing userspace back into sync with the kernel
> without having to poll?
>
> > > The userspace would then perform a LINEINFO ioctl to read the line st=
ate
> > > and clear the "needs_update" flag in kernel.
> > > At that point the kernel and userspace are back in sync for that line=
 -
> > > until the next change.
> > > The LINEINFO ioctl would be on the monitor fd, not the chip fd, but
> > > could otherwise be the same as the existing ioctl from the userspace =
pov.
> > > This logic would apply for each monitoring fd which is monitoring tha=
t
> > > line.
> >
> > But then the kernel would assume that the user-space does a
> > responsible thing with the event it reads, while the process may as
> > well just discard all arriving data.
> >
>
> The kernel doesn't assume anything - it just wont send another changed
> event for a line until the userspace ACKs the previous.
> If userspace doesn't ACK a changed event then they will not get any
> more for that line, so they have a strong incentive to ACK it.
> Note that the "your info is stale" message only contains the line
> offset so the userspace is forced to perform the LINEINFO ioctl to find
> out that the current state actually is.
>
> Kent.
>
> > Bart
> >
> > >
> > > Wrt the startup case, the userspace would create the monitor fd and t=
hen
> > > call the LINEINFO ioctl on each monitored line.
> > > Then you are in sync and good to go...
> > >
> > > There may well be better ways to implement that handshake - that is j=
ust
> > > the first that comes to mind.
> > >
> > > Kent.
> > >
> > > > Bart
> > > >
> > > > >
> > > > > Kent.
> > > > >
> > > > > > Bart
> > > > > >
> > > > > > >
> > > > > > > I'm used to setting up streams like this in a networked envir=
onment
> > > > > > > where returning data via the stream setup isn't an option, th=
e only
> > > > > > > option is to sync via the stream itself, so I overlooked the =
possibility
> > > > > > > of using the ioctl return.
> > > > > > >
> > > > > > > > > The name is immutable(??), and so is pointless to include=
.
> > > > > > > >
> > > > > > > > It is now, but let's be future-proof. I can imagine having =
modifiable
> > > > > > > > line names in the future. The code putting this info in str=
uct
> > > > > > > > gpioline_info wouldn't be really duplicated and the size of=
 such small
> > > > > > > > structures doesn't matter much - it's still a single contex=
t switch to
> > > > > > > > read it.
> > > > > > > >
> > > > > > > > > The consumer only changes when the line is requested, so =
I was willing
> > > > > > > > > to live with still having to poll for that.
> > > > > > > > > And what you gain by reporting bulk lines you might lose =
in increased
> > > > > > > > > report size and associated code.  OTOH it would make it e=
xplicit which
> > > > > > > > > lines are being changed together...
> > > > > > > > > So I could well be wrong on that - a full bulk report may=
 be better.
> > > > > > > >
> > > > > > > > I'm not sure we need bulk reporting - just as we don't prov=
ide bulk
> > > > > > > > GET_GPIOLINE_INFO. The corresponding ioctl() structure woul=
d get
> > > > > > > > pretty complicated soon.
> > > > > > > >
> > > > > > >
> > > > > > > That was my initial feeling as well.
> > > > > > > And bulk is no longer an option if you want to include name i=
n the change
> > > > > > > report.
> > > > > > >
> > > > > > > Kent.
> > > > > > >
> > > > > > > > Bartosz
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Kent.
> > > > > > > > >
> > > > > > > > > > > And a timestamp might be useful, as per gpioevent_dat=
a?
> > > > > > > > > >
> > > > > > > > > > Sure thing!
> > > > > > > > > >
> > > > > > > > > > Bart
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Kent.
> > > > > > > > > > >
> > > > > > > > > > > >  /* Linerequest flags */
> > > > > > > > > > > >  #define GPIOHANDLE_REQUEST_INPUT     (1UL << 0)
> > > > > > > > > > > >  #define GPIOHANDLE_REQUEST_OUTPUT    (1UL << 1)
> > > > > > > > > > > > @@ -176,6 +210,8 @@ struct gpioevent_data {
> > > > > > > > > > > >
> > > > > > > > > > > >  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, s=
truct gpiochip_info)
> > > > > > > > > > > >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, =
struct gpioline_info)
> > > > > > > > > > > > +#define GPIO_GET_LINECHANGED_FD_IOCTL \
> > > > > > > > > > > > +             _IOWR(0xB4, 0x0b, struct gpioline_cha=
nged_fd_request)
> > > > > > > > > > > >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03=
, struct gpiohandle_request)
> > > > > > > > > > > >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04,=
 struct gpioevent_request)
> > > > > > > > > > > >
> > > > > > > > > > > > --
> > > > > > > > > > > > 2.23.0
> > > > > > > > > > > >

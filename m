Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7904728EFD5
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 12:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731028AbgJOKFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 06:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbgJOKFf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2020 06:05:35 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB089C061755
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 03:05:34 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id r4so3596631ioh.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CJqURL+4+RJ2vxITr/6ADz3ENlJ4jCDo6VmLM8C/KV8=;
        b=Ps6fYLCCf7wylvCTwQLvLRA0jfDyThc1PCBVhB+U67fAFY7KXlZJ+3gvak8SZrbKIN
         iWZLXV+FzOAfk2WKsHRD2cdD2+n/+IkmEAEWZmQPtnC9dIrMWN3miJjwJ6cVDVT4AcZd
         j2bmVv+TzRJvLcYZeUzr0PtftP1MVfsL9I0FTT/35onXfoy53ccm+9XcyPS2LilrBhn+
         JjYUjuxyph11bVwiFaXJZhw2M6lpgPsxAGZemGa/yztWHsQVTiacNzUGFKgHvhaHUxqM
         F6+2YRoqXDuwvZqhtAWOcg0WF/Y/r0JsVtG2VS/mt7oFdHFO9ZzCOOvi4MQN0bPlmWtw
         /jlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CJqURL+4+RJ2vxITr/6ADz3ENlJ4jCDo6VmLM8C/KV8=;
        b=EPwmwbRpzL+uZP4qMeF7EyL0E/54aJfjsnScAQsr/JYcyPDPkxnTMvt1Rr6pczhetv
         L6+4qAfpVr29nu3DjFS3zVh+Ih25VA/6JX7j/hkkusD0ekNzUSPJKJR4Nh2nnMIGKP1K
         kA4KP+Nnou1JJ0Nnchxi3UkLYFgnbcoamfpsYa1h85+oqaP6zVHy2SCDwrzOBDufXIfC
         7j0nLkS3G5/Rh57C5sU+huGNzqRJz6U1lOO+nB9IDAUR/Ogm/8uPDlg6Bxed/Z5jzb13
         /V2JOBRZA292NxJkMi8+ug8A3/zgHzLeMosaVN88aqK8Evl9XoJ025461oS7hCKh4eO4
         V8AQ==
X-Gm-Message-State: AOAM5321A3wD7kfyPqF1ehQjvxjaYoPo5Dz08r7IQfSwcDBbk1N7GSjm
        ahUrSgzXPRdweGJnMFrtjXmXfEJyTZYjwHgTVM5qmG8F3nbUnQ==
X-Google-Smtp-Source: ABdhPJwNyFwkI+4ZFro22ag3QwepTdLqy7ajnQF7Gbj8uU/L9RHms4kLYriBSZn92rcgxKFjJHOneYn2oOUJRWqNA88=
X-Received: by 2002:a5d:91d2:: with SMTP id k18mr2537920ior.119.1602756334072;
 Thu, 15 Oct 2020 03:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev>
In-Reply-To: <20201015093526.GA10891@laureti-dev>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 15 Oct 2020 12:05:23 +0200
Message-ID: <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 11:35 AM Helmut Grohne <helmut.grohne@intenta.de> wrote:
>
> Hi,
>
> On Thu, Oct 15, 2020 at 11:26:47AM +0200, Bartosz Golaszewski wrote:
> > I probably just didn't know any better. :) I'm a kernel developer and
> > writing these bindings was basically me learning C++.
>
> Oh, ok. Then let me elaborte on the difference of duration and
> time_point a little and explain the implications of changing the type.
>
> A duration denots an interval in time. A time_point denotes a specific
> point in time with respect to a particular clock. Every clock has an
> epoch and you can convert a time_stamp to a duration by computing the
> time_since_epoch. Comparing time_points with different clocks is thus
> meaningless. Internally a time_point is represented exactly like a
> duration. It just has the connection to the clock.
>
> So what clock would you use here? There are a few standard clocks such
> as std::chrono::steady_clock. This clock has an unspecified epoch. The
> epoch will not change during use, but e.g. after a reboot of the system,
> the epoch may be different. A clock also knows whether time increases
> monotonically and a steady_clock does. On the other hand, the
> system_clock has a well-specified epoch, but it is not required to be
> steady. If you change the time on your machine, your system_clock may go
> backwards. While system_clock may be what we want here, it has an
> unspecified representation. libgpiod wants a specific representation
> though to preserve the high precision of the included timestamps. We
> therefore cannot use any of the standard clocks.
>

In case of the event timestamps - we get them from the kernel as
64-bit unsigned integers. They're then converted to struct timespec as
defined by libc and eventually to ::std::chrono:duration. The
timestamps use the MONOTONIC kernel clock - the same that you would
use by calling clock_gettime(CLOCK_MONOTONIC, ...). Is there any way
to couple the C++ time_point to this clock?

> libgpiod should add its own clock class. The clock is never instaniated.
> It is more a collection of functionality and a tag to be included in
> templates to differentiate types. I think your clock would look like
> this:
>
> struct gpiod_clock {
>     using duration = std::chrono::nanoseconds;
>     using rep = duration::rep;
>     using period = duration::period;
>     using time_point = std::chrono::time_point<gpiod_clock>;
>     static constexpr bool is_steady = std::chrono::system_clock::is_steady;
>     static time_point now() {
>         return time_point(std::chrono::system_clock::now().time_since_epoch());
>     }
> };
>
> (The code might not work as is, but you get the idea.)
>
> In essence, it's a system_clock with a different underlying duration
> type for representing high resolution timestamps.
>
> Even though changing the type does likely not change the binary
> representation of timestamps, it still consitutes an API break and an
> ABI break (due to changed symbol names).
>
> > Thanks for the suggestion - it's a good moment to make it, because
> > we're in the process of changing the API to accommodate the new uAPI
> > that will be released in v5.10 so I'll definitely make sure to change
> > it too.
>
> Ok. I'm not particularly enthusiastic about updating client code all the
> time for covering upstream API breaks, but sometimes it is unavoidable.
> Seems to be the case here.
>

Me neither, but the new user API exposed by the kernel addresses a lot
of issues and adds new features and it's really impossible to keep the
current library API while also leveraging them. I'll keep supporting
the v1.6 stable branch for a long time though.

> > Are you by any chance well versed in C++ and would like to help out by
> > giving me some advice? I want to fix the way GPIO line objects
> > reference their owning chips but I'm not sure how to.
>
> I would consider myself experienced in C++.
>
> As far as I can see, the chip class uses the pimpl pattern, so a chip
> practically is a reference counted pointer to the actual gpiod_chip. A
> line has a plain chip member and this seems totally fine. As long as the
> line exists, so does the underlying chip. Is this not what you intended?
>

Yes, it's what I intended indeed. I'm however worried that this isn't
the best approach. Having learned more, I now think that lines should
somehow weakly reference the chip - to emphasize that they don't
control its lifetime in any way (which is the case now with each line
storing a hard reference to the chip). Also what happens currently is
the fact that a new line object is created each time get_line() method
is called because we can't store lines in some array within the chip
because that would lead to circular references. Maybe a line should
store a weak_ptr to the underlying ::gpiod_chip? But then it would
create a new chip object every time get_chip() is called. Is there any
way around it? Making the chip and line non-copyable and expediting
any shared_ptr management to the user?

> What is less clear to me is the connection between a line and its
> underlying gpiod_line. It is unclear to me who "owns" a gpiod_line and
> who is responsible for disposing it. Since the line class is copy
> constructible, the line class clearly cannot own a gpiod_line. I would
> question whether this is a good decision. I'm not sure that a line must
> be copyable. It should be movable. So if you delete the copy constructor
> and the copy assignment for the line class, then you could argue that a
> line owns its referenced gpiod_line and then it could automatically
> handle release of resources upon destruction.
>

The thing with gpiod_line struct (the one from C libgpiod, not C++
class) is that the owner is the chip (struct gpiod_chip) - there's no
need to free any resources, they'll be freed when the chip goes out of
scope. You can copy the line pointer all you want, there's always a
single line behind stored in the opaque struct gpiod_chip. So in C++ -
I suppose - the chip should really own the C++ line (stored in a
vector maybe) and the line should at most weakly reference the chip
object. I'm just not sure how to correctly approach this so any advice
is welcome.

Best Regards
Bartosz

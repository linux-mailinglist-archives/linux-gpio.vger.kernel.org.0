Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B8228EF6A
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 11:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbgJOJfc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 05:35:32 -0400
Received: from mail.intenta.de ([178.249.25.132]:30375 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727988AbgJOJfc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 05:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=XzoG6hUztp4dyT+ioUz8TJd8tfThIk2kr8jWgEOi5ps=;
        b=o09Rf3Vo0/p03RW+ifnLX9KVomuZ9hj9B/cx3cwV0PmGKIjcZLUNbAn5aOWEoIJkKsDJwiwAMOmIvdLlL0Q65qlkWgcuUaWtVH3oPkv2pGfcMaico0t8Zbk/gveXxE9agw/Qqb4uRQn7jT6UE6pypnFUzaV49svjsfG/YjyZ6SHmDfTHxlE2QKbweqeATZEcGKZYWu4x+b+tEyh6ht3LfRXj+RYcLHamb71DVdVF7f81rDJ38DvxBx3xKjN3o0jnK1uilfFaP6x656hczH2jiYv6f3ZjtbDrK9WVfCrg7YZ5KSKtO6hQQ/9v9sZsUZU/vlI1ClILnkv7mZvCWJzdgg==;
Date:   Thu, 15 Oct 2020 11:35:26 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartekgola@gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
Message-ID: <20201015093526.GA10891@laureti-dev>
References: <20201015083805.GA10354@laureti-dev>
 <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Oct 15, 2020 at 11:26:47AM +0200, Bartosz Golaszewski wrote:
> I probably just didn't know any better. :) I'm a kernel developer and
> writing these bindings was basically me learning C++.

Oh, ok. Then let me elaborte on the difference of duration and
time_point a little and explain the implications of changing the type.

A duration denots an interval in time. A time_point denotes a specific
point in time with respect to a particular clock. Every clock has an
epoch and you can convert a time_stamp to a duration by computing the
time_since_epoch. Comparing time_points with different clocks is thus
meaningless. Internally a time_point is represented exactly like a
duration. It just has the connection to the clock.

So what clock would you use here? There are a few standard clocks such
as std::chrono::steady_clock. This clock has an unspecified epoch. The
epoch will not change during use, but e.g. after a reboot of the system,
the epoch may be different. A clock also knows whether time increases
monotonically and a steady_clock does. On the other hand, the
system_clock has a well-specified epoch, but it is not required to be
steady. If you change the time on your machine, your system_clock may go
backwards. While system_clock may be what we want here, it has an
unspecified representation. libgpiod wants a specific representation
though to preserve the high precision of the included timestamps. We
therefore cannot use any of the standard clocks.

libgpiod should add its own clock class. The clock is never instaniated.
It is more a collection of functionality and a tag to be included in
templates to differentiate types. I think your clock would look like
this:

struct gpiod_clock {
    using duration = std::chrono::nanoseconds;
    using rep = duration::rep;
    using period = duration::period;
    using time_point = std::chrono::time_point<gpiod_clock>;
    static constexpr bool is_steady = std::chrono::system_clock::is_steady;
    static time_point now() {
        return time_point(std::chrono::system_clock::now().time_since_epoch());
    }
};

(The code might not work as is, but you get the idea.)

In essence, it's a system_clock with a different underlying duration
type for representing high resolution timestamps.

Even though changing the type does likely not change the binary
representation of timestamps, it still consitutes an API break and an
ABI break (due to changed symbol names).

> Thanks for the suggestion - it's a good moment to make it, because
> we're in the process of changing the API to accommodate the new uAPI
> that will be released in v5.10 so I'll definitely make sure to change
> it too.

Ok. I'm not particularly enthusiastic about updating client code all the
time for covering upstream API breaks, but sometimes it is unavoidable.
Seems to be the case here.

> Are you by any chance well versed in C++ and would like to help out by
> giving me some advice? I want to fix the way GPIO line objects
> reference their owning chips but I'm not sure how to.

I would consider myself experienced in C++.

As far as I can see, the chip class uses the pimpl pattern, so a chip
practically is a reference counted pointer to the actual gpiod_chip. A
line has a plain chip member and this seems totally fine. As long as the
line exists, so does the underlying chip. Is this not what you intended?

What is less clear to me is the connection between a line and its
underlying gpiod_line. It is unclear to me who "owns" a gpiod_line and
who is responsible for disposing it. Since the line class is copy
constructible, the line class clearly cannot own a gpiod_line. I would
question whether this is a good decision. I'm not sure that a line must
be copyable. It should be movable. So if you delete the copy constructor
and the copy assignment for the line class, then you could argue that a
line owns its referenced gpiod_line and then it could automatically
handle release of resources upon destruction.

Does this help?

Helmut


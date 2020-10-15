Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652AD28F06F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 12:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgJOK5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 06:57:32 -0400
Received: from mail.intenta.de ([178.249.25.132]:30731 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgJOK5c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 06:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=JoUAv8x7Pnjck/3jwdaS6O3cPBl9DAF39FtS2H3YM/4=;
        b=LBeq0M8C1DWDFzrybBJyj/GjdxGVbtNoeTD8JQJv1MeViG/5GO82p0M7RCmt5pma0t85rVhr689RAYV11XNRSSiH2DWUSowI89w01g0tquR7UM3ECKNOs1LBksAFHOYfaSud34z2bsXMK6bkrPe4tOmA0f1MFWSlddt7IU8eK4U+KIaRtaYVEfrJwEA8PwfNSaQt6q4E1uJDgtSQnv1Uze4Sps8mq8mqVS4NmgL1AK+APScnRv1FqX0JiyDfCqaCQyqXb0R9yjgoK0FK2vL5CikJViPJRqmJgM21wBwm3dZthacLzoul2zvhKdJpOnXNbA+Z13tZPjrgeuePWxr60w==;
Date:   Thu, 15 Oct 2020 12:57:18 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartekgola@gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
Message-ID: <20201015105718.GA11027@laureti-dev>
References: <20201015083805.GA10354@laureti-dev>
 <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev>
 <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Oct 15, 2020 at 12:05:23PM +0200, Bartosz Golaszewski wrote:
> In case of the event timestamps - we get them from the kernel as
> 64-bit unsigned integers. They're then converted to struct timespec as
> defined by libc and eventually to ::std::chrono:duration. The
> timestamps use the MONOTONIC kernel clock - the same that you would
> use by calling clock_gettime(CLOCK_MONOTONIC, ...). Is there any way
> to couple the C++ time_point to this clock?

I got that wrong then as I thought they were wall clock time.
CLOCK_MONOTONIC is the thing that backs std::chrono::steady_clock on
Linux. At least gcc and clang's libcxx implement steady_clock using
nanosecond resolution. I don't thing nanosecond resolution is
guarantueed, but maybe this is good enough and you can just use
steady_clock? That would certainly be most welcome by consuming client
code.

> Me neither, but the new user API exposed by the kernel addresses a lot
> of issues and adds new features and it's really impossible to keep the
> current library API while also leveraging them. I'll keep supporting
> the v1.6 stable branch for a long time though.

Great news. Thank you.

> Yes, it's what I intended indeed. I'm however worried that this isn't
> the best approach. Having learned more, I now think that lines should
> somehow weakly reference the chip - to emphasize that they don't
> control its lifetime in any way (which is the case now with each line
> storing a hard reference to the chip). Also what happens currently is
> the fact that a new line object is created each time get_line() method
> is called because we can't store lines in some array within the chip
> because that would lead to circular references. Maybe a line should
> store a weak_ptr to the underlying ::gpiod_chip? But then it would
> create a new chip object every time get_chip() is called. Is there any
> way around it? Making the chip and line non-copyable and expediting
> any shared_ptr management to the user?

First of all, I don't think any of these types need to be copyable.
Keeping them moveable should be simple and makes handling them easy
enough.

It seems like you'd want a chip to include all lines as is the case for
the C-api already. In that case, a line does not exist by itself, it
only is an observable part of a chip. I'm not convinced that a line
should weakly reference a chip. If you have a line and the underlying
chip disappears, all the gpiod_lines get cleared and your line suddenly
has a dangling reference. Actually, you line would be gone if it was
part of the chip. That does not seem useful to me. So the current design
of having lines control the lifetime of the chip seems useful to me.

Why do you take issue with the fact that each get_line creates a new
line object? This line object practically is a counted reference on the
chip together with a line identifier. It kinda is a complex pointer. Why
not have two distinct pointers point to the same thing?

Likewise creating new chip objects is not a problem in my book, because
a chip object is a (counted) reference to a gpiod_chip. Having two
pointers should be ok. Creating them is cheap.

> The thing with gpiod_line struct (the one from C libgpiod, not C++
> class) is that the owner is the chip (struct gpiod_chip) - there's no
> need to free any resources, they'll be freed when the chip goes out of
> scope. You can copy the line pointer all you want, there's always a
> single line behind stored in the opaque struct gpiod_chip. So in C++ -
> I suppose - the chip should really own the C++ line (stored in a
> vector maybe) and the line should at most weakly reference the chip
> object. I'm just not sure how to correctly approach this so any advice
> is welcome.

That helps a lot with my understanding. I mostly concur up to the point
where you say that a chip should own the C++ line. The C++ line
currently is a counted reference on a gpiod_chip together with a line
identifier. I don't see what's so precious about this to ensure it is
not copied. That seems entirely fine with me.

Now if you go the route and have chips own lines, then your back
reference from line to chip can be a plain pointer. The forward
reference ensures that the pointer is always valid. It's still circular,
but you don't have to mess with weak_ptrs as long as destruction is
careful.

So this seems mostly fine as is. Having lines manage the lifetime of
chips is very convenient for using the library.

Helmut

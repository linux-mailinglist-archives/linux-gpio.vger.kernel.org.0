Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429AB2A75ED
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 04:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732194AbgKEDJX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 22:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgKEDJX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 22:09:23 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99137C0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 19:09:21 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id p4so88904plr.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 19:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mkoc3z+I8oLO+Z8IHZPZ9Ld9gcD5Y8DSuMeg1rGrKa4=;
        b=miVzKR1e+CEhbbySONCmLt6aTo08HHJ+99uWWCXBfMMjYMY4h7zboPRTEw7ufrjlzR
         akwhzGItAcjAmV/PME+R8oDD2j6J80N1YiqKtTe0ivblfn+FH21+zCcTJ3PMeCqrJ1y0
         2MFEWOa/IDtyIE+00g6xpZqmBzPGE3WJIbKknAil5RIxArnkEtPpI/ylwXC+76j1G9Xc
         Is2ejkvTJIl0OMCdVk5Lf0oyOdDX1YMBQjOHqgrrTWaPK05s/25YPdW4SxY0cTSOAOEY
         wEaEoww5vh+rElHkC9MaAHcUVNmk3lIhR4PZRDfOQvqxoudxmHBlUY4M6MGbhigEdxoO
         sFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mkoc3z+I8oLO+Z8IHZPZ9Ld9gcD5Y8DSuMeg1rGrKa4=;
        b=XDWbRWHFZrwMSElH1c6O+cdXyah6Twh+4GCdbhsoPpxYXmCQsoaZH6eJMZ+BtVMwXZ
         jXHnpD8Zt1MhpedAPFIUHyMmpvu3j0nthxZXDCPmui6zJ9TMl10KyE0IsrAeh9OgTZPn
         J5UEQWUa3V023jXNRZpcJ97r7yz3XBImiTa2AR4UuXr22DZeqZFRbHn4+EDSqtq8ui7j
         D4qFt2N746FKhvd4QMDEiv8ldTM2Ts8yCfmozbaKza3L69HSu/4WsSqm37GdkV+HhOjx
         25TGcKpIFNJsVwyv8s3kpQrFtSeZ/trKPCOYxxI6n4cuWs10UJZC+mPx/BrugGXWzZUl
         AFqw==
X-Gm-Message-State: AOAM533KiHRd1YKMngg+orWzjJD4SbBHHeAL+ybyVk7BYHBLJZqCJ3Sq
        7xpMapCRaKcyAS6appbkzkbxHyaVXgoQXw==
X-Google-Smtp-Source: ABdhPJwbme0aKOxnMge367pbdV8WWQCzokL5KwntwpicWV8yZ+DekLKxBxMwQKoI1y5LLMzpAjcIew==
X-Received: by 2002:a17:902:b196:b029:d5:a8fd:9a1c with SMTP id s22-20020a170902b196b02900d5a8fd9a1cmr445911plr.44.1604545760811;
        Wed, 04 Nov 2020 19:09:20 -0800 (PST)
Received: from sol (106-69-171-141.dyn.iinet.net.au. [106.69.171.141])
        by smtp.gmail.com with ESMTPSA id p11sm212239pgb.67.2020.11.04.19.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 19:09:19 -0800 (PST)
Date:   Thu, 5 Nov 2020 11:09:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] libgpiod v2.0 API discussion
Message-ID: <20201105030913.GA11741@sol>
References: <CAMpxmJWkcg0SgcQVzE2TVjenogyfUEiZAOR_0ssR7y8a-AnZXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWkcg0SgcQVzE2TVjenogyfUEiZAOR_0ssR7y8a-AnZXA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 03, 2020 at 09:42:23PM +0100, Bartosz Golaszewski wrote:
> Hello!
> 
> I'd like to start a discussion on the new API in libgpiod v2.0. Below
> are my ideas for different parts starting from the top of
> include/gpiod.h. I'm open for any other ideas.
> 
> Arnd: I'm Cc'ing you mostly for your knowledge on the year 2036
> problem: please take a look at the part about reading line events and
> whether we should use struct timespec in userspace or if it's
> discouraged.
> 
> * Context-less API
> 
> I think we can entirely remove it. As I mentioned in another thread: I
> have never received a single question about it - as opposed to all the
> other interfaces - so I suppose it's just needless cruft.
> 
> * Chip properties and handling
> 
> I think we're mostly good on that front. V2 has not altered that part.
> 
> * Line watch
> 
> Some preliminary work was done by me for V1 watch but it never got
> into mainline libgpiod. Since the v2 of line watch uAPI mostly follows
> what I did for v1 (except for a different lineinfo struct) I think we
> can mostly adapt the code from my development branch[1].
> 
> New tool: gpiowatch will be provided in tools/.
> 
> * Line properties
> 
> We're mostly fine here, but I'd still remove
> gpiod_line_is_open_source/drain() in favor of an enum defining drive
> flags and a function called gpiod_line_drive(). Also:
> gpiod_line_active_state() should probably become
> gpiod_line_is_active_low() and we can drop the corresponding enum.
> 
> * Line bulks
> 
> Already submitted a patch that makes gpiod_line_bulk opaque across the
> entire codebase.
> 
> * Line lookup by name
> 
> One thing that was omitted in the first version was the fact that GPIO
> line names are not unique in the kernel. Functions that do name lookup
> from a single chip should return bulk objects. Functions that can
> lookup several lines with different names should probably be removed
> because it's difficult to design an elegant API that would take this
> non-uniqueness into account. Returning arrays of bulks sounds like a
> bad idea.
> 
> For global line lookup: the core C library should probably offer some
> function to which a callback would be passed. This would then be
> called every time a matching line was found and would take the
> matching line and the owning chip as arguments.
> 
> gpiofind tool would need to be updated and display multiple lines if
> more lines are matching.
> 
> Testing of this part will only be possible once we have the new
> configfs-based gpio-mockup module on which I'm working currently. It
> will provide a way to flexibly name separate dummy lines.
> 
> * Iterators
> 
> Kent suggests we ditch iterators entirely. I agree for line bulks -
> seems like the overhead of allocating an iterator is not worth it
> (except for bindings where we use the built-in language features of
> C++ and Python).
> 

No problem with adding iterators in the bindings to provide an API best
suited for that language, but I definitely question their existence in
the C API.

> Kent also pointed out that the chip iterator will fail if opening any
> of the chips fails (which can happen for instance if the user only has
> permissions to access certain chips, not all of them) and this needs
> addressing.
> 
> I'd still prefer to keep some way of detecting chips in the system -
> be it an iterator or a loop function taking a callback as argument.
> Now that we have the is_gpiochip_cdev() function in the library, I
> think we don't have to limit ourselves to only checking devices whose
> names start with 'gpiochip' - we can check all files in /dev and
> verify in /sys if they're GPIO chips or not. Then the iterator would
> only iterate over chips we managed to access. Let me know what you
> think.
> 
> I think that is_gpiochip_cdev() could be renamed to
> gpiod_is_gpiochip_cdev() and exported so that users can verify on
> their own if given device file is a GPIO chip.
> 
> I think Kent suggested returning an array of paths to GPIO chips too.
> 
> I'm considering dropping the line iterator as we can simply call
> gpiod_chip_get_all_lines() and loop over the returned bulk.
> 
> * Reading line events
> 
> Since we now can have a single file descriptor for multiple monitored
> lines - reading of the events needs to be modified. Event structure
> needs to reference the line object with which it's associated. Adding
> additional fields for the seq numbers is a no-brainer of course.
> 

Why not just return the offset instead of a reference to the line?
Provide a helper to get the line with a given offset from a line
bulk/line request.

I'm also wondering if line bulk can be replaced with an analog of the
uAPI line_request.  As the line bulk now only applies to a set of lines
on one chip it has taken another step towards the line request, and
cases where linke bulks are accepted or returned could be replaced with
either a line request or a set of offsets on a particular request.

Sorry to be throwing half-baked ideas out - I'd like to spend some
time looking at changing the libgpiod object model to more closely
parallel the uAPI, but haven't had a chance yet and probably wont
until next week, so half-baked is as good as it gets for now...

> I'm wondering if we should still be using struct timespec for
> timestamps. On one hand it's used everywhere in libc but it's also
> subject to ABI change due to year 2036 problem. Maybe we should switch
> to nanoseconds in 64-bit integer just like what we get from the kernel
> but then user-space won't have standard tools to deal with such
> timestamps.
> 

Return the 64bit timestamp unchanged from the uAPI and provide helpers
to convert to other types if such conversions are not already available
in the standard libraries.  Or perhaps alternate accessors on the event
that perform the appropriate conversion?

Note that the source clock for the event timestamp is not available in
the event itself, so context free conversion is dangerous.
Hmmm, perhaps we should add a flag to the event as part of the realtime
clock patch??

> Some other general design issues I'd like to discuss too:
> 
> * Opaque data types
> 
> Kent suggested we make all user-facing data types opaque. While I
> agree for almost all structs - I think that line & watch events as
> well as request config should remain visible to users (although with
> padding this time - I missed this in v1.x).
> 
> For events the reason is simple: with opaque types we'd face an
> overhead with malloc() and I think it's important that we can read
> them as fast as possible.
> 

Opaque does not imply that libgpiod has to perform a malloc() - you can
provide helpers to alloc/init an event buffer that the event_wait() can
write the received events into, and accessors for the event buffer as
well as the event itself.

Wrt "fast as possible", what are you optimising for - minimal latency or
maximal throughput?  For minimal latency you want to read just the next
event.  For maximal throughput you want to minimise the number of
ioctls/syscalls and so dump the kernel event fifo into a userspace
buffer.

The library should allow the user to select what they are optimising
for, so you may want to consider two event_read() flavours, one that gets
just the next event and another that fills a buffer.  The single form may
just call the buffer form with n=1, or it may be able to be slightly
optimised as it could avoid buffer range checks.
Both should accept the line request fd, rather than the line or line bulk
that they currently do.
And in both cases the user should provide the space for the event(s) to
be written to.

Maybe other helper versions that wait on the fd, or malloc the space for
the events on the fly - but only if there is some user demand for them. 

Also consider that if the user wants best possible performance then they
should write a kernel driver rather than using the GPIO uAPI.

> For config: I believe an opaque request config structure will require
> a lot of getter/setter boiler plate code for not much profit.
> 

The profit being a guarantee of ABI stability and backward compatibility,
while still being free to completely rework the implementation
internally?

I still prefer opaque, with some helpers to create common cases, similar
to the existing gpiod_line_request_XXX variants, but also with a full set
of mutators so they can be tweaked for special cases.

Wrt config per-line, I'm assuming the line bulk/request will provide a
function to allow the setting of config for a given line, as well as the
default for the request, and that that would be mapped to the uAPI
attributes as part of executing the line request.

Cheers,
Kent.

> Let's discuss!
> 
> Best Regards,
> Bartosz Golaszewski
> 
> [1] https://github.com/brgl/libgpiod/commits/topic/line-watch

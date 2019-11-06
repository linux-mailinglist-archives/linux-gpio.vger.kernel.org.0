Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97903F17CB
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 14:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfKFN7p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 08:59:45 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38842 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfKFN7p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 08:59:45 -0500
Received: by mail-ot1-f68.google.com with SMTP id v24so15605209otp.5
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 05:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=REGHxGXMg9ukuquC3XK325uHWXi0E9wtNt/E/NNmbRw=;
        b=B0bOVfzFE62a2F7EzwIUN2DnsHNXi6E2iqzLHX4cLGnNOFSEo81PR+6to0QhaOEkG/
         NwDhFQS9QtJ95OuOOhf30/Y4kL0zMp2QUlSW3/exkcTeolMj6hNxbuiNTMKsl0Ah6c5L
         znxRsMWGKynJ2E9O+T8sQQuAlXvU5b+SkTXi4C8Fl3LcOHH0Hy4PZLLwkV5RjZpQMYhz
         R/QB2PjUJ+Nb05fS7bjjg/I33l0nbDni5DGyDjZK619WYOS7XaWWGULD6rE5554htRn6
         uUUs2osPBAjckT2l7PKUiLOoJEogTYb4C3ya1vBQR9KhpWPEOKw78l7YHFSfdtLfsrk9
         2RfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=REGHxGXMg9ukuquC3XK325uHWXi0E9wtNt/E/NNmbRw=;
        b=UohXUhNzfjfo6tgrUH+sch0TN/wT7gXVEkxAB339zJxJt8NGGCQkynVVEMt41Nlz2C
         g4Hq7gxXtjRXoAsk07zCQCM1BQhp+aIFXZC2ZhIJFQ+tnfcwqJTDD7mj0vPpWLTzo0ki
         qRzJtHLfyEoplaxE2XmScaLoDkjUVB2kogP6619XFOhO0KeQRhF7LWHgCmtNvtWY9u1E
         IDi2hJ87cQUxF2zVBn/we0O1GYhBS/8LJbabYrmgEbHA0rQoKG1MJNt2A4Ul75NpA/vv
         VmaT0uC0oJnwFLYKlOdp3qbKaR7bxyLtdUL6weOmQR7/j6QzSZnNBVRTgmY/E++qE61Z
         C/aA==
X-Gm-Message-State: APjAAAV5k9yLqxloicNqEUC8yz+94DyBMz78gnVCZ4/OKNZfj8yvM+Ai
        ESKazDWlDshYn7ueiS4E/pKRW3mGBxhjuPdXzVBp+nsE
X-Google-Smtp-Source: APXvYqyVaVJgh7M2xkON2Gmk4AEIAkBNTafFp3EKd7XSdvpN3LSMMkA3kpicA+oZ8fYpqhnDOjqXmqwoaQgJtNkNnJk=
X-Received: by 2002:a9d:3f7:: with SMTP id f110mr1981790otf.292.1573048784172;
 Wed, 06 Nov 2019 05:59:44 -0800 (PST)
MIME-Version: 1.0
References: <20191105020429.18942-1-warthog618@gmail.com> <20191105152616.GA19978@sol>
 <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
 <CAMpxmJW6R0gv5VG95ayx2wGSdPG1hUnuKqxtBEeWg+MHkcWX3Q@mail.gmail.com> <20191106064842.GB3478@sol>
In-Reply-To: <20191106064842.GB3478@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 6 Nov 2019 14:59:33 +0100
Message-ID: <CAMpxmJVORDjTWJ+j6LUERhKnW8DS_0GopcSuTVNOnda44u=3kg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 6 lis 2019 o 07:48 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Tue, Nov 05, 2019 at 10:07:58PM +0100, Bartosz Golaszewski wrote:
> > wt., 5 lis 2019 o 17:24 Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> napisa=C5=82(a):
> > >
> > > wt., 5 lis 2019 o 16:26 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > > >
> > > > On Tue, Nov 05, 2019 at 10:04:22AM +0800, Kent Gibson wrote:
> > > > > Patches are against Bart's gpio/for-kent branch[1].
> > > > >
> > > > > The patch has been successfully tested against gpio-mockup, and
> > > > > on a Raspberry Pi, in both cases using the feature/pud_set_config
> > > > > branch of my Go gpiod library[2], as well as with my feature/pud
> > > > > development branch of libgpiod[3].  Patch 7 has only been tested =
using
> > > > > my gpiod library as libgpiod has not yet been updated to support =
the
> > > > > SET_CONFIG ioctl.
> > > > >
> > > >
> > > > I've just pushed a first pass at SET_CONFIG support into my libgpio=
d
> > > > feature/pud branch.  It is causing me a bit of grief.  Due to the w=
ay
> > > > the libgpiod API is structured, with the direction flags pulled out=
 into
> > > > the request type, I thought it would be cleaner to keep changes to =
direction
> > > > orthogonal to changes to the other handle flags.
> > > >
> > >
> > > I'd love to see that branch - is it public?
> > >
> > > > So I've added these methods to the API:
> > > >
> > > > int gpiod_line_set_config(struct gpiod_line *line, int flags)
> > > > int gpiod_line_set_direction_input(struct gpiod_line *line)
> > > > int gpiod_line_set_direction_output(struct gpiod_line *line,
> > > >                                     int value)
> > > >
> > > > along with their bulk equivalents.
> > > >
> > > > I've coded that and started adding tests when I tripped over changi=
ng
> > > > bias.  The kernel requires a direction to be set, but I'm setting i=
t
> > > > as-is in gpiod_line_set_config - so that wont work.
> > > > Open drain/source are in the same boat - they require output mode.
> > > >
> > >
> > > Ha! Yes this is a problem - how about this:
> > >
> > > If the caller of set_config in the kernel doesn't pass any of the
> > > direction flags, then we read the current direction, set the right
> > > flag in lflags and only then call the function validating the flags?
> > >
> >
>

Cc'ing Linus, I'm not sure when he was dropped from this discussion.

> I was also thinking along that line - the config would be carried over
> from the initial request and any subsequent SET_CONFIGs.
> The kernel could overlay the existing config over any field set
> "as-is" before performing validation.
> The validation requirement would stand, but you don't need to pass the
> complete state, possibly including output values, with each SET_CONFIG
> request.
>
> In the bias case above, I create the line as an output and so should
> be able to set the bias, even if neither INPUT nor OUTPUT is set in
> the SET_CONFIG request.
>
> > After another thought: this would be a bit inconsistent with the rest
> > of the flags. IIRC this was the reason for me to split the
> > request_type and other flags into two separate fields in libgpiod in
> > the first place.
> >
>
> It is a bit inconsisent, so how about changing the rest of the flags
> to make them consistent? They need to have an as-is state, which
> corresponds to no flags set, and you then leave that field as is.
> We currently have four fields in the handle flags - direction, active
> state, drive, and bias.  Of those, direction and bias have as-is states.
> What we are missing are additional flags so we have an as-is state for
> active state and drive.
>
> Currently:
>     ACTIVE_LOW =3D=3D 0 =3D> ACTIVE_HIGH, and
>     OPEN_DRAIN =3D=3D 0 && OPEN_SOURCE =3D=3D 0 =3D> PUSH_PULL.
>
> If we added an ACTIVE_HIGH flag, to counter ACTIVE_LOW, and PUSH_PULL
> to counter OPEN_DRAIN/OPEN_SOURCE, then we can have SET_CONFIG change
> the four fields (direction, active state, drive and bias), independently,
> or not, as the caller sees fit.
>
> For backward compatibility, the lines would be created with ACTIVE_HIGH
> and PUSH_PULL set, should they be requested "as-is", by the new
> definition.
>

I'm not in favor of having the same behavior triggered in two
different ways: one explicit and one implicit. This API got released
and we have to live with it, I'm afraid. We could for instance add a
comment to the uAPI header though. I also don't think new AS_IS flags
are necessary. We can live fine with certain inconveniences in the
ioctl() API as long as user-space libraries make up for it by
structuring these calls differently.

To summarize: I'd prefer to make the SET_CONFIG ioctl() require
specifying the direction and then simply caching it in user-space.

> This feels like the right solution to me - as I write this anyway.
> The biggest downside I can see is that it means pulling v6, or at least
> the SET_CONFIG patches, pending an update.
>
> > When I think about it: the kernel behavior should be as predictable as
> > possible - if we keep the behavior as is in v6, I don't see why we
> > couldn't make userspace cache (or re-read) the current direction when
> > setting flags other than direction? Do you see any trouble in that?
> > That way we'd avoid having the kernel treat different flags in
> > different way.
> >
>
> If in userspace then it will have to be cached - the kernel still has
> issues reading back output values for emulated open drain/source outputs.
> Fixing that is somewhere down my todo list.
>

Right, but we've lived with problems in this area for a long time and
nobody complained - maybe it can wait just a bit more. :)

> I can't think of any concrete problems with caching.
> It gives me "I have a bad feeling about this" vibe, but I can't pin
> down why.  Maybe wanting to avoid shadowing kernel state in userspace?
>

The user-space can always read back the current state with the
lineinfo ioctl(), right? Any problems with that?

> But, as above, I'd rather fix the flags so we have as-is for all, and
> caching becomes unnecessary.
>

This idea in turn gives me a bad feeling. There's something too
implicit in this behavior for me. Sounds like it's too easy to get it
wrong from user-space.

> > Bart
> >
> > > > I see these options:
> > > >  1. set the direction as part of gpiod_line_set_config
> > > >  2. relax the kernel restriction.
> > >
> > > Yes, I don't think we should force users to always pass the direction
> > > flag in set_config. Good point.
> > >
> > > >  3. don't support changing bias or open source/drain.
> > >
> > > No! We definitely want to support it in libgpiod.
>
> Agreed.
>
> > >
> > > >  4. rethink the API.
> > >
> > > As for libgpiod: I think we should have a low-level
> > > gpiod_line_set_config() that would set both the direction and other
> > > flags (it could for instance only accept two request flags: input and
> > > output) and then a higher-level set_flags(), set_direction_input(),
> > > set_direction_output() that would call the low-level variant and - fo=
r
> > > set_flags() without the direction argument - it could simply retrieve
> > > the current direction and pass it to gpiod_line_set_config().
> > >
>
> I agree that there should add be a fully capable low level option.
>
> The low level function would look have a signature like this:
>
> int gpiod_line_set_config(struct gpiod_line *line, int direction, int fla=
gs,
>     const int *default_vals)
>
> The existing gpiod_line_set_config would be renamed gpiod_line_set_flags.
>
> > > But this is only a vague idea - I'd have to actually start looking at
> > > the code to be sure. I'd love to see what you came up with so far
> > > though!
> > >
>
> Indeed - what I had in mind changed radically once I had a closer look
> at the libgpiod API.  And it is still changing.
>

Thanks for doing it! It's also great you included some test cases!

Bart

> Cheers,
> Kent.
>

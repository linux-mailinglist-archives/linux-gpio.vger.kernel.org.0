Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7D49F1BD6
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 17:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfKFQ6O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 11:58:14 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32981 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727746AbfKFQ6N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 11:58:13 -0500
Received: by mail-pf1-f193.google.com with SMTP id c184so19386253pfb.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 08:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=xLa0sdTidZUDBikXjr9gzqnDRx5FxRZr6POmghmPM/Y=;
        b=g3fs0m7GM/KSC0lwwSQArBJuoxRoxsDhwwffxKYXtMVxyBihwcUfw4RqzzayjYBX6a
         6nMbGEDbMf+i6IpbpXNQ6rtjmqhJqy++7D5oVjBBV/EB7+FNk9SH8dj4yPnqo+RpC7EQ
         5udKkXHlPRoLq4gQFp+TJCKwe6wTHAcVD8WQIwtzvEE+MYfKFprHhksh9lfAsxVeyC0p
         G7uEAaFTUQEw+itEmEFVe2eKnaABEAxHkIRd+GeAu86bxUqZDlPxct7AeDs8twa/1mDP
         JiCFdCxSKFyIGTY9MtObAPUySP70TExujr5NHA4mac1S2BBhOaePokAJBLlIF3n2JwfQ
         IpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=xLa0sdTidZUDBikXjr9gzqnDRx5FxRZr6POmghmPM/Y=;
        b=N5jYMNwYi4VhcXax+ehyoLLtBS6xs06w+nDBsoaKhcjfRpTOcx5lYF9LBZpeL8lQRS
         tWpE9MEEEm2LDGxctjMM6x1ZUO4Il3JgJ9eYWUQhsyKfZqoHrKnAoVHkSWsOEMrld7nR
         7udtCldoLEZWzSg1D+w2L/sr7t0YXmp95mS+97cOX4E+cYX5Ocqm3ejBG+2Qqei+qPyz
         Vgr/7x3AyUBZRxRCXvWtaq2UGlpjoDdia21zH04xd7PdrMVLnEKFJgTdJ1W9gWF0nFXf
         UCjdlCfH9Oci+zPeuhU11piJ61liGjbLOL6StFKOV71ljRICEt18D6vxCwJMZWYk0DqU
         wqYQ==
X-Gm-Message-State: APjAAAWGPH/vkWMWwnwC+wYz9dr9YRpXQGKPCEmOYrvm9QJHFGMr/NPd
        I91+vmIEnGLfxYqD/S3MIfc=
X-Google-Smtp-Source: APXvYqwEucsx1aiMstvmsBFWTkyv7aZCyxHY0dyMzOCstXuUQ7M1AUmzM2ETZTnYZAb9WcdwezS9Ow==
X-Received: by 2002:a17:90a:d152:: with SMTP id t18mr3250927pjw.119.1573059491685;
        Wed, 06 Nov 2019 08:58:11 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z16sm25711170pge.55.2019.11.06.08.58.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 08:58:09 -0800 (PST)
Date:   Thu, 7 Nov 2019 00:58:04 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
Message-ID: <20191106165804.GA12770@sol>
References: <20191105020429.18942-1-warthog618@gmail.com>
 <20191105152616.GA19978@sol>
 <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
 <CAMpxmJW6R0gv5VG95ayx2wGSdPG1hUnuKqxtBEeWg+MHkcWX3Q@mail.gmail.com>
 <20191106064842.GB3478@sol>
 <CAMpxmJVORDjTWJ+j6LUERhKnW8DS_0GopcSuTVNOnda44u=3kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVORDjTWJ+j6LUERhKnW8DS_0GopcSuTVNOnda44u=3kg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 06, 2019 at 02:59:33PM +0100, Bartosz Golaszewski wrote:
> śr., 6 lis 2019 o 07:48 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Tue, Nov 05, 2019 at 10:07:58PM +0100, Bartosz Golaszewski wrote:
> > > wt., 5 lis 2019 o 17:24 Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> napisał(a):
> > > >
> > > > wt., 5 lis 2019 o 16:26 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > >
> > > > > On Tue, Nov 05, 2019 at 10:04:22AM +0800, Kent Gibson wrote:
> > > > > > Patches are against Bart's gpio/for-kent branch[1].
> > > > > >
> > > > > > The patch has been successfully tested against gpio-mockup, and
> > > > > > on a Raspberry Pi, in both cases using the feature/pud_set_config
> > > > > > branch of my Go gpiod library[2], as well as with my feature/pud
> > > > > > development branch of libgpiod[3].  Patch 7 has only been tested using
> > > > > > my gpiod library as libgpiod has not yet been updated to support the
> > > > > > SET_CONFIG ioctl.
> > > > > >
> > > > >
> > > > > I've just pushed a first pass at SET_CONFIG support into my libgpiod
> > > > > feature/pud branch.  It is causing me a bit of grief.  Due to the way
> > > > > the libgpiod API is structured, with the direction flags pulled out into
> > > > > the request type, I thought it would be cleaner to keep changes to direction
> > > > > orthogonal to changes to the other handle flags.
> > > > >
> > > >
> > > > I'd love to see that branch - is it public?
> > > >
> > > > > So I've added these methods to the API:
> > > > >
> > > > > int gpiod_line_set_config(struct gpiod_line *line, int flags)
> > > > > int gpiod_line_set_direction_input(struct gpiod_line *line)
> > > > > int gpiod_line_set_direction_output(struct gpiod_line *line,
> > > > >                                     int value)
> > > > >
> > > > > along with their bulk equivalents.
> > > > >
> > > > > I've coded that and started adding tests when I tripped over changing
> > > > > bias.  The kernel requires a direction to be set, but I'm setting it
> > > > > as-is in gpiod_line_set_config - so that wont work.
> > > > > Open drain/source are in the same boat - they require output mode.
> > > > >
> > > >
> > > > Ha! Yes this is a problem - how about this:
> > > >
> > > > If the caller of set_config in the kernel doesn't pass any of the
> > > > direction flags, then we read the current direction, set the right
> > > > flag in lflags and only then call the function validating the flags?
> > > >
> > >
> >
> 
> Cc'ing Linus, I'm not sure when he was dropped from this discussion.
> 

My bad - I cut it down to you and Drew + list in my initial reply as I 
thought we'd only be talking libgpiod changes.
But then it took a sharp u-turn back to the kernel patch.

Anway I think we are now in agreement that the kernel is fine and we're 
back in libgpiod territory - see below.

> > I was also thinking along that line - the config would be carried over
> > from the initial request and any subsequent SET_CONFIGs.
> > The kernel could overlay the existing config over any field set
> > "as-is" before performing validation.
> > The validation requirement would stand, but you don't need to pass the
> > complete state, possibly including output values, with each SET_CONFIG
> > request.
> >
> > In the bias case above, I create the line as an output and so should
> > be able to set the bias, even if neither INPUT nor OUTPUT is set in
> > the SET_CONFIG request.
> >
> > > After another thought: this would be a bit inconsistent with the rest
> > > of the flags. IIRC this was the reason for me to split the
> > > request_type and other flags into two separate fields in libgpiod in
> > > the first place.
> > >
> >
> > It is a bit inconsisent, so how about changing the rest of the flags
> > to make them consistent? They need to have an as-is state, which
> > corresponds to no flags set, and you then leave that field as is.
> > We currently have four fields in the handle flags - direction, active
> > state, drive, and bias.  Of those, direction and bias have as-is states.
> > What we are missing are additional flags so we have an as-is state for
> > active state and drive.
> >
> > Currently:
> >     ACTIVE_LOW == 0 => ACTIVE_HIGH, and
> >     OPEN_DRAIN == 0 && OPEN_SOURCE == 0 => PUSH_PULL.
> >
> > If we added an ACTIVE_HIGH flag, to counter ACTIVE_LOW, and PUSH_PULL
> > to counter OPEN_DRAIN/OPEN_SOURCE, then we can have SET_CONFIG change
> > the four fields (direction, active state, drive and bias), independently,
> > or not, as the caller sees fit.
> >
> > For backward compatibility, the lines would be created with ACTIVE_HIGH
> > and PUSH_PULL set, should they be requested "as-is", by the new
> > definition.
> >
> 
> I'm not in favor of having the same behavior triggered in two
> different ways: one explicit and one implicit. This API got released
> and we have to live with it, I'm afraid. We could for instance add a
> comment to the uAPI header though. I also don't think new AS_IS flags
> are necessary. We can live fine with certain inconveniences in the
> ioctl() API as long as user-space libraries make up for it by
> structuring these calls differently.
> 
> To summarize: I'd prefer to make the SET_CONFIG ioctl() require
> specifying the direction and then simply caching it in user-space.
> 

Agreed.  I had a quick play with changing the kernel and it was ugly.
Too many conversions between flag layouts and messing with flag masks
and bits.  It was absolutely hideous.
Requiring the userspace to provide the complete config is much simpler.

> > This feels like the right solution to me - as I write this anyway.
> > The biggest downside I can see is that it means pulling v6, or at least
> > the SET_CONFIG patches, pending an update.
> >
> > > When I think about it: the kernel behavior should be as predictable as
> > > possible - if we keep the behavior as is in v6, I don't see why we
> > > couldn't make userspace cache (or re-read) the current direction when
> > > setting flags other than direction? Do you see any trouble in that?
> > > That way we'd avoid having the kernel treat different flags in
> > > different way.
> > >
> >
> > If in userspace then it will have to be cached - the kernel still has
> > issues reading back output values for emulated open drain/source outputs.
> > Fixing that is somewhere down my todo list.
> >
> 
> Right, but we've lived with problems in this area for a long time and
> nobody complained - maybe it can wait just a bit more. :)
> 

Hey - I complained!  I had to skip over some of my tests because of that ;-).

> > I can't think of any concrete problems with caching.
> > It gives me "I have a bad feeling about this" vibe, but I can't pin
> > down why.  Maybe wanting to avoid shadowing kernel state in userspace?
> >
> 
> The user-space can always read back the current state with the
> lineinfo ioctl(), right? Any problems with that?
>

Only that you have to convert from the info flag layout to the request
handle flag layout, or the libgpiod request_type + flag layout.
And I've already had enough of that for one day.

> > But, as above, I'd rather fix the flags so we have as-is for all, and
> > caching becomes unnecessary.
> >
> 
> This idea in turn gives me a bad feeling. There's something too
> implicit in this behavior for me. Sounds like it's too easy to get it
> wrong from user-space.
> 
> > > Bart
> > >
> > > > > I see these options:
> > > > >  1. set the direction as part of gpiod_line_set_config
> > > > >  2. relax the kernel restriction.
> > > >
> > > > Yes, I don't think we should force users to always pass the direction
> > > > flag in set_config. Good point.
> > > >
> > > > >  3. don't support changing bias or open source/drain.
> > > >
> > > > No! We definitely want to support it in libgpiod.
> >
> > Agreed.
> >
> > > >
> > > > >  4. rethink the API.
> > > >
> > > > As for libgpiod: I think we should have a low-level
> > > > gpiod_line_set_config() that would set both the direction and other
> > > > flags (it could for instance only accept two request flags: input and
> > > > output) and then a higher-level set_flags(), set_direction_input(),
> > > > set_direction_output() that would call the low-level variant and - for
> > > > set_flags() without the direction argument - it could simply retrieve
> > > > the current direction and pass it to gpiod_line_set_config().
> > > >
> >
> > I agree that there should add be a fully capable low level option.
> >
> > The low level function would look have a signature like this:
> >
> > int gpiod_line_set_config(struct gpiod_line *line, int direction, int flags,
> >     const int *default_vals)
> >
> > The existing gpiod_line_set_config would be renamed gpiod_line_set_flags.
> >
> > > > But this is only a vague idea - I'd have to actually start looking at
> > > > the code to be sure. I'd love to see what you came up with so far
> > > > though!
> > > >
> >
> > Indeed - what I had in mind changed radically once I had a closer look
> > at the libgpiod API.  And it is still changing.
> >
> 
> Thanks for doing it! It's also great you included some test cases!
>

Oh, I always write test cases - manual testing is for monkeys.
The few I've added so far are just basic smoke tests - there will be
quite a few more added with better coverage once the API settles down.

I've pushed some more changes with the updated API we discussed earlier.
Those new tests I'd added now pass.  Yay.
One problem though - gpiod_line_set_config as written has no way to
accept an as-is direction.
Hopefully I'll have some time to take another look at that tomorrow.

Cheers,
Kent.


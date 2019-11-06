Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9E6BF1C14
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 18:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732172AbfKFRG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 12:06:26 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43649 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbfKFRGZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 12:06:25 -0500
Received: by mail-oi1-f193.google.com with SMTP id l20so9564281oie.10
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 09:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZZUsFv9E5JWWjc1rLfp2TWFKAfHqIUV7LPbvL8YxNIQ=;
        b=CVF7vsb6dlr55ND30hwIfpOG8xIaHCjerRqVTnnDD5xHxF84As3ZLYEuAX6pPahWan
         K80fRKZMxjNxPWJWNiN4Cj5GxXxrFsBq28ggFQvapC4aeRxcL5TA96a/u46ZXugP2EwS
         Lkl36DlCE6aAL2wJXvvSWoijThX/8Uva396G1kUm7k92NqAcRVCQbRhm8IfY7O2BTGoj
         BD59JfFVOQ8WETbM0jaqaafbx/jVSzV3+9opMwdw3vjwkZlAfZnfAIzFoMEl7E+BjYS5
         RrBccVw/zw2YxP6ReelegJ/soJTsTi3OMeOVEArd+5GTxsheGMRYTR4PzcD52yYp8M2y
         +ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZZUsFv9E5JWWjc1rLfp2TWFKAfHqIUV7LPbvL8YxNIQ=;
        b=iLNDjlMHsNhGwdWWktCOdLlqlCF/Bzb9T9X/UfG4Pjms45dKrK+HWJFY+jP5AHCWBC
         6oqqihFWQJS52s83bGu+UfzJYjc+XJojNMYpz7FQNQmDOF+ZK9EpOS+mjLsuLLZ+Iezi
         3QMrxhNfF/aTXgwGTYRMLetBcYyZCTSk5ByniQO7SJvm4d4Z6y+PI9wBsVXbYH1vUiqh
         ANU66qpLuVvyx7mW+OkL9lchzeghsmvQ/QvFtMrRBwoXMXrsyA103PfPaFgFJf0PkTAH
         HxHlrhURxRuEHKeXsFAzIvzeAjwIu00J47NCP1LNSyI0UqJ6F2v+yu6ATzWrQvlmP6xz
         K3lA==
X-Gm-Message-State: APjAAAUkJQw4Q2bGCgF2nBbxYd60V3SF07BvmtVt0/h+zzwBdBXQABXI
        ccYohiWcq39FPD+JfYAevw4hbWmBGPrkEvHNtJlh6g==
X-Google-Smtp-Source: APXvYqx1EdLYgpqR+ORO3qN9L//GjgMYFctkpUF8PtRKP4J2N8VSWBoXe+QjoalqAQshcG7bE4Yop39/04QiA9vkVZk=
X-Received: by 2002:a05:6808:1cf:: with SMTP id x15mr3169300oic.147.1573059983331;
 Wed, 06 Nov 2019 09:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20191105020429.18942-1-warthog618@gmail.com> <20191105152616.GA19978@sol>
 <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
 <CAMpxmJW6R0gv5VG95ayx2wGSdPG1hUnuKqxtBEeWg+MHkcWX3Q@mail.gmail.com>
 <20191106064842.GB3478@sol> <CAMpxmJVORDjTWJ+j6LUERhKnW8DS_0GopcSuTVNOnda44u=3kg@mail.gmail.com>
 <20191106165804.GA12770@sol>
In-Reply-To: <20191106165804.GA12770@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 6 Nov 2019 18:06:12 +0100
Message-ID: <CAMpxmJVmZdW0yqj_gu3__E__si8vQZ4=a1Te5fK2AjGmysdufg@mail.gmail.com>
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

=C5=9Br., 6 lis 2019 o 17:58 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Wed, Nov 06, 2019 at 02:59:33PM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 6 lis 2019 o 07:48 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > >
> > > On Tue, Nov 05, 2019 at 10:07:58PM +0100, Bartosz Golaszewski wrote:
> > > > wt., 5 lis 2019 o 17:24 Bartosz Golaszewski
> > > > <bgolaszewski@baylibre.com> napisa=C5=82(a):
> > > > >
> > > > > wt., 5 lis 2019 o 16:26 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > > > > >
> > > > > > On Tue, Nov 05, 2019 at 10:04:22AM +0800, Kent Gibson wrote:
> > > > > > > Patches are against Bart's gpio/for-kent branch[1].
> > > > > > >
> > > > > > > The patch has been successfully tested against gpio-mockup, a=
nd
> > > > > > > on a Raspberry Pi, in both cases using the feature/pud_set_co=
nfig
> > > > > > > branch of my Go gpiod library[2], as well as with my feature/=
pud
> > > > > > > development branch of libgpiod[3].  Patch 7 has only been tes=
ted using
> > > > > > > my gpiod library as libgpiod has not yet been updated to supp=
ort the
> > > > > > > SET_CONFIG ioctl.
> > > > > > >
> > > > > >
> > > > > > I've just pushed a first pass at SET_CONFIG support into my lib=
gpiod
> > > > > > feature/pud branch.  It is causing me a bit of grief.  Due to t=
he way
> > > > > > the libgpiod API is structured, with the direction flags pulled=
 out into
> > > > > > the request type, I thought it would be cleaner to keep changes=
 to direction
> > > > > > orthogonal to changes to the other handle flags.
> > > > > >
> > > > >
> > > > > I'd love to see that branch - is it public?
> > > > >
> > > > > > So I've added these methods to the API:
> > > > > >
> > > > > > int gpiod_line_set_config(struct gpiod_line *line, int flags)
> > > > > > int gpiod_line_set_direction_input(struct gpiod_line *line)
> > > > > > int gpiod_line_set_direction_output(struct gpiod_line *line,
> > > > > >                                     int value)
> > > > > >
> > > > > > along with their bulk equivalents.
> > > > > >
> > > > > > I've coded that and started adding tests when I tripped over ch=
anging
> > > > > > bias.  The kernel requires a direction to be set, but I'm setti=
ng it
> > > > > > as-is in gpiod_line_set_config - so that wont work.
> > > > > > Open drain/source are in the same boat - they require output mo=
de.
> > > > > >
> > > > >
> > > > > Ha! Yes this is a problem - how about this:
> > > > >
> > > > > If the caller of set_config in the kernel doesn't pass any of the
> > > > > direction flags, then we read the current direction, set the righ=
t
> > > > > flag in lflags and only then call the function validating the fla=
gs?
> > > > >
> > > >
> > >
> >
> > Cc'ing Linus, I'm not sure when he was dropped from this discussion.
> >
>
> My bad - I cut it down to you and Drew + list in my initial reply as I
> thought we'd only be talking libgpiod changes.
> But then it took a sharp u-turn back to the kernel patch.
>
> Anway I think we are now in agreement that the kernel is fine and we're
> back in libgpiod territory - see below.
>
> > > I was also thinking along that line - the config would be carried ove=
r
> > > from the initial request and any subsequent SET_CONFIGs.
> > > The kernel could overlay the existing config over any field set
> > > "as-is" before performing validation.
> > > The validation requirement would stand, but you don't need to pass th=
e
> > > complete state, possibly including output values, with each SET_CONFI=
G
> > > request.
> > >
> > > In the bias case above, I create the line as an output and so should
> > > be able to set the bias, even if neither INPUT nor OUTPUT is set in
> > > the SET_CONFIG request.
> > >
> > > > After another thought: this would be a bit inconsistent with the re=
st
> > > > of the flags. IIRC this was the reason for me to split the
> > > > request_type and other flags into two separate fields in libgpiod i=
n
> > > > the first place.
> > > >
> > >
> > > It is a bit inconsisent, so how about changing the rest of the flags
> > > to make them consistent? They need to have an as-is state, which
> > > corresponds to no flags set, and you then leave that field as is.
> > > We currently have four fields in the handle flags - direction, active
> > > state, drive, and bias.  Of those, direction and bias have as-is stat=
es.
> > > What we are missing are additional flags so we have an as-is state fo=
r
> > > active state and drive.
> > >
> > > Currently:
> > >     ACTIVE_LOW =3D=3D 0 =3D> ACTIVE_HIGH, and
> > >     OPEN_DRAIN =3D=3D 0 && OPEN_SOURCE =3D=3D 0 =3D> PUSH_PULL.
> > >
> > > If we added an ACTIVE_HIGH flag, to counter ACTIVE_LOW, and PUSH_PULL
> > > to counter OPEN_DRAIN/OPEN_SOURCE, then we can have SET_CONFIG change
> > > the four fields (direction, active state, drive and bias), independen=
tly,
> > > or not, as the caller sees fit.
> > >
> > > For backward compatibility, the lines would be created with ACTIVE_HI=
GH
> > > and PUSH_PULL set, should they be requested "as-is", by the new
> > > definition.
> > >
> >
> > I'm not in favor of having the same behavior triggered in two
> > different ways: one explicit and one implicit. This API got released
> > and we have to live with it, I'm afraid. We could for instance add a
> > comment to the uAPI header though. I also don't think new AS_IS flags
> > are necessary. We can live fine with certain inconveniences in the
> > ioctl() API as long as user-space libraries make up for it by
> > structuring these calls differently.
> >
> > To summarize: I'd prefer to make the SET_CONFIG ioctl() require
> > specifying the direction and then simply caching it in user-space.
> >
>
> Agreed.  I had a quick play with changing the kernel and it was ugly.
> Too many conversions between flag layouts and messing with flag masks
> and bits.  It was absolutely hideous.
> Requiring the userspace to provide the complete config is much simpler.
>
> > > This feels like the right solution to me - as I write this anyway.
> > > The biggest downside I can see is that it means pulling v6, or at lea=
st
> > > the SET_CONFIG patches, pending an update.
> > >
> > > > When I think about it: the kernel behavior should be as predictable=
 as
> > > > possible - if we keep the behavior as is in v6, I don't see why we
> > > > couldn't make userspace cache (or re-read) the current direction wh=
en
> > > > setting flags other than direction? Do you see any trouble in that?
> > > > That way we'd avoid having the kernel treat different flags in
> > > > different way.
> > > >
> > >
> > > If in userspace then it will have to be cached - the kernel still has
> > > issues reading back output values for emulated open drain/source outp=
uts.
> > > Fixing that is somewhere down my todo list.
> > >
> >
> > Right, but we've lived with problems in this area for a long time and
> > nobody complained - maybe it can wait just a bit more. :)
> >
>
> Hey - I complained!  I had to skip over some of my tests because of that =
;-).
>
> > > I can't think of any concrete problems with caching.
> > > It gives me "I have a bad feeling about this" vibe, but I can't pin
> > > down why.  Maybe wanting to avoid shadowing kernel state in userspace=
?
> > >
> >
> > The user-space can always read back the current state with the
> > lineinfo ioctl(), right? Any problems with that?
> >
>
> Only that you have to convert from the info flag layout to the request
> handle flag layout, or the libgpiod request_type + flag layout.
> And I've already had enough of that for one day.
>
> > > But, as above, I'd rather fix the flags so we have as-is for all, and
> > > caching becomes unnecessary.
> > >
> >
> > This idea in turn gives me a bad feeling. There's something too
> > implicit in this behavior for me. Sounds like it's too easy to get it
> > wrong from user-space.
> >
> > > > Bart
> > > >
> > > > > > I see these options:
> > > > > >  1. set the direction as part of gpiod_line_set_config
> > > > > >  2. relax the kernel restriction.
> > > > >
> > > > > Yes, I don't think we should force users to always pass the direc=
tion
> > > > > flag in set_config. Good point.
> > > > >
> > > > > >  3. don't support changing bias or open source/drain.
> > > > >
> > > > > No! We definitely want to support it in libgpiod.
> > >
> > > Agreed.
> > >
> > > > >
> > > > > >  4. rethink the API.
> > > > >
> > > > > As for libgpiod: I think we should have a low-level
> > > > > gpiod_line_set_config() that would set both the direction and oth=
er
> > > > > flags (it could for instance only accept two request flags: input=
 and
> > > > > output) and then a higher-level set_flags(), set_direction_input(=
),
> > > > > set_direction_output() that would call the low-level variant and =
- for
> > > > > set_flags() without the direction argument - it could simply retr=
ieve
> > > > > the current direction and pass it to gpiod_line_set_config().
> > > > >
> > >
> > > I agree that there should add be a fully capable low level option.
> > >
> > > The low level function would look have a signature like this:
> > >
> > > int gpiod_line_set_config(struct gpiod_line *line, int direction, int=
 flags,
> > >     const int *default_vals)
> > >
> > > The existing gpiod_line_set_config would be renamed gpiod_line_set_fl=
ags.
> > >
> > > > > But this is only a vague idea - I'd have to actually start lookin=
g at
> > > > > the code to be sure. I'd love to see what you came up with so far
> > > > > though!
> > > > >
> > >
> > > Indeed - what I had in mind changed radically once I had a closer loo=
k
> > > at the libgpiod API.  And it is still changing.
> > >
> >
> > Thanks for doing it! It's also great you included some test cases!
> >
>
> Oh, I always write test cases - manual testing is for monkeys.
> The few I've added so far are just basic smoke tests - there will be
> quite a few more added with better coverage once the API settles down.
>
> I've pushed some more changes with the updated API we discussed earlier.
> Those new tests I'd added now pass.  Yay.
> One problem though - gpiod_line_set_config as written has no way to
> accept an as-is direction.
> Hopefully I'll have some time to take another look at that tomorrow.
>

This is not something that we need to merge the kernel changes, it
won't hit a libgpiod release until v5.5 is tagged anyway. Unless I'm
missing something, v6 is still fine to be merged upstream, right? Do
we agree on requiring the full config in SET_CONFIG?

Bart

> Cheers,
> Kent.
>

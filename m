Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344C934FB44
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 10:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbhCaILg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 04:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234117AbhCaILN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 04:11:13 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49CCC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 01:11:01 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id v107so15266020ybi.9
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 01:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HFszK+twYRzz/xUh0jsb8XrFJx5lwzHPpVumbD92Nb0=;
        b=LQ9o7qNpdXx/YGba7dXYNSd9oz0QvMwgCnJgR5jzAXl4jMXxsIDNGXDAAiNTtDL+u1
         FWpLnp1Vu0ODsYpi/pDcItVyhSQdyfkn+WLDEcgiYjEK28w7+QuKcIrgE0yKKpgrwx+5
         5GwPePD+FJ1bJunpFUkrbsB+FBkWNqWBYdZQEklXmIbiFEW9Z0Bdvx4UQ3KKf9xuVjwn
         wJnRa9sCcHEFjO5VoQJ54DK+LctZydCrSimSJBeKRbH4OK+cAW1syx07qM0pW/bOu3hV
         6Vpu99btrYZd81k6Qv+PRQet7+1+IS8k0ScfPpHK4Hk7TnsbUR62OBJzUWk9I4ImV2Qq
         V4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HFszK+twYRzz/xUh0jsb8XrFJx5lwzHPpVumbD92Nb0=;
        b=tx3si8TBbMQtGvWGb2h+92C1yjVIFupiBKl0BwireeAIRbYJ0Y6QDLonUKFVolwxqN
         CXnFh2XSaK6GjLKa02qohhWgY9eAw4+wCd1xb86aLwHcbXLBCm+F0UUnICYSt3VMG8VU
         VGayID8DVer4LNEjfVkAlfsqexltUe/VIJ89aNVhi+nFD0E8VIxIXvFw3739pRTRhxtb
         Kb/Je82cc75Dr5Ko+v2EBWDgY6iyGXoeDnod362qtTy127kP7IbFTIrSUqwnrSW618DE
         WZ79eM36DordKkfI2CW5lHhTJq++DGj3IFk9t/ZhgSNhOuICit+EoiuwDLixagREgV9s
         puNg==
X-Gm-Message-State: AOAM531MPprOUUbvh0JLv+sfH9Jr7fCX3pQRszF6+nouUVaVdgSR9MW2
        4A0Gcmkx6eAOly3YYJuBamAvRT9d/uERwFYa90rZ0A==
X-Google-Smtp-Source: ABdhPJw5MbiV+ENPgtwfyATho4TkJIABcrE7M4/SD09eM70DPNsLm+gNTcoY/gJQVElINbkz7RYPfiy9uCyyJADbDBc=
X-Received: by 2002:a25:ae87:: with SMTP id b7mr2710339ybj.25.1617178261218;
 Wed, 31 Mar 2021 01:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
 <bf12f668db2f0dce7dfc09351780e295da30714c.camel@fi.rohmeurope.com>
 <YGHWZuNfbSDe+B6y@smile.fi.intel.com> <92243c7b428d2025c1a9f3beb8db46995c9376d0.camel@fi.rohmeurope.com>
In-Reply-To: <92243c7b428d2025c1a9f3beb8db46995c9376d0.camel@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 10:10:50 +0200
Message-ID: <CAMpxmJV12VgtQTXVkAFxx91a9Q=hxre9O52PGOS3x+xAR_YW0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from config
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Joe Perches <joe@perches.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 6:32 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Morning Folks,
>
> On Mon, 2021-03-29 at 16:30 +0300, Andy Shevchenko wrote:
> > On Mon, Mar 29, 2021 at 03:20:07PM +0300, Matti Vaittinen wrote:
> > > On Mon, 2021-03-29 at 14:59 +0300, Andy Shevchenko wrote:
> > > > On Mon, Mar 29, 2021 at 2:43 PM Matti Vaittinen
> > > > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > > > The checkpacth instructs to switch from ENOSUPP to EOPNOTSUPP.
> > > > > > WARNING: ENOTSUPP is not a SUSV4 error code, prefer
> > > > > > EOPNOTSUPP
> > > > >
> > > > > Make the gpiolib allow drivers to return both so driver
> > > > > developers
> > > > > can avoid one of the checkpatch complaints.
> > > >
> > > > Internally we are fine to use the ENOTSUPP.
> > > > Checkpatch false positives there.
> > >
> > > I agree. OTOH, the checkpatch check makes sense to user-visible
> > > stuff.
> > > Yet, the checkpatch has hard time guessing what is user-visible -
> > > so it
> > > probably is easiest to nag about all ENOTSUPP uses as it does now.
> > >
> > > > I doubt we need this change. Rather checkpatch should rephrase
> > > > this
> > > > to
> > > > point out that this is only applicable to _user-visible_ error
> > > > path.
> > > > Cc'ed Joe.
> > >
> > > Yes, thanks for pulling Joe in.
> > >
> > > Anyways, no matter what the warning says, all false positives are
> > > annoying. I don't see why we should stay with ENOTSUPP in gpiolib?
> > > (other than the burden of changing it).
> >
> > For sake of the changing we are not changing the code.
> No. But for the sake of making it better / more consistent :)
>
> Anyway - after giving this second thought (thanks Andy for provoking me
> to thinking this further) - I do agree with Andy that this particular
> change is bad. More I think of this, less I like the idea of having two
> separate return values to indicate the same thing. So we should support
> only one which makes my patch terrible.
>
> For the sake of consistency it would be cleaner to use same, single
> value, for same error both inside the gpiolib and at user-interface.
> That would be EOPNOTSUPP. As I said, having two separate error codes to
> indicate same thing is confusing. Now the confusion is at the boundary
> of gpiolib and user-land. Please educate me - is there difference in
> the meaning of ENOTSUPP and EOPNOTSUPP or are they really indicating
> the same thing? If yes, then yes - correct fix would be to use only one
> and ditch the other. Whether the amount of work is such it is
> practically worth is another topic - but that would be the right thing
> to do (tm).
>

In user-space there's no ENOTSUPP but there's ENOTSUP which is defined
in most sane toolchains as:

#define ENOTSUP EOPNOTSUPP

While ENOTSUPP is not the same number as EOPNOTSUPP.

So to answer the question: they mean the same thing in the kernel but
not to user-space. We must never return ENOTSUPP to user-space because
it doesn't know it.

Bartosz

> >
> > > But I have no strong opinion on this. All options I see have
> > > downsides.
> > >
> > > Accepting both ENOTSUPP and EOPNOTSUPP is the easy way to avoid
> > > allowing checkpatch warnings - but I admit it isn't stylish.
> >
> > I think the error code which is Linux kernel internal is for a
> > reason.
>
> If so, then the current checkpatch warning is even more questionable.
>
> >
> > > Converting all ENOTSUPP cases inside gpiolib to EOPNOTSUPP is
> > > teodious
> > > although end result might be nicer.
> >
> > Why? You still missed the justification except satisfying some tool
> > that gives
> > you false positives. We don't do that. It's the tool that has to be
> > fixed /
> > amended.
> >
> > > Leaving it as is gives annoying false-positives to driver
> > > developers.
> > >
> > > My personal preference was this patch - others can have other view
> > > like
> > > Andy does. I'll leave this to community/maintainers to evaluate :)
> >
> > This patch misses documentation fixes, for example.
>
> Valid point.
>
> > Also, do you suggest that we have to do the same in entire pin
> > control
> > subsystem?
>
> After reading/writing this, I am unsure. This is why the discussion is
> good :) I don't see why we should have two separate error codes for
> same thing - but as you put it:
>
> > I think the error code which is Linux kernel internal is for a
> > reason.
>
> not all of us thinks the same. So maybe I just don't get it? :)
>
> Best Regards
>         Matti Vaittinen
>
>

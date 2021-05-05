Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1B3373D85
	for <lists+linux-gpio@lfdr.de>; Wed,  5 May 2021 16:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhEEOVE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 May 2021 10:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbhEEOVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 May 2021 10:21:01 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DDF6C061574
        for <linux-gpio@vger.kernel.org>; Wed,  5 May 2021 07:20:04 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id b25so3134383eju.5
        for <linux-gpio@vger.kernel.org>; Wed, 05 May 2021 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tgBFW77w+tqXgd2qEhzNM+pBbVN0PtVs2ChlIQlnPok=;
        b=E0/0eSBIRoJ31aC+hu8b8fyOZgaiGRtak/6pzAv0VlIcRqBObMCPzEZaXsK/R085SU
         QNqZCv7io+8+UpPtOsLN9Gw4rXmi0D9EryZsIa2vA1H90I/J8J5ndJHnj0tDseLlGO6M
         O3b/XsVsGpaZUM6vXwEn/H7Tv2knupaQNUjSDhScaGZ1PsXZDRA0Tj/ytUmnqMSU1DKn
         l3ObaZV7lco5NHEOmSEZCUBEgEk0nWC/300ypBZFaZyfp10kT6K9l7563hSgWEBdYycE
         jezfZRst235bIHUGmfQyrgMJAUcbYZ5LLabv2eroQrm4eCZ9uDM/4RMX3n2kBNMVthZW
         iihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tgBFW77w+tqXgd2qEhzNM+pBbVN0PtVs2ChlIQlnPok=;
        b=ReYX1zJODmOSeg7eQWZu3WrM0/xel7u5I4D8Lu/6fpp98kl/bht0QJowNratQDUl/m
         2tbjleHsqVFXOvcS/YW8zD943Rb5kgoQrrf3QCYp0kPaiXQbfAr3oiDVIRrzVCYlF73F
         vZ8uDw2jxg2GW5pMio3WjbOKtmapGUDH+1hr9XUbWt/YRFGpwJH3GAFxBZCpxfCcg6Mv
         qypDAppuOi8U/aTdOV0Isk8OOwixsFuvE8Bp29pVFlXMMA16W4luuITA3hxzZRAfFfxw
         0eLy/bcG3ftH06SQDGCdE6ur+G6VtXgthRFgSArOyu3IVI4jQ4XE6SqEv0EMuCpLBg2Q
         3VLQ==
X-Gm-Message-State: AOAM532PJVqNr/n+CSq/ypzIw7eyI5dbfgJfYXtNJ5MjCoNdl5+2CI6U
        AC8ouJwfbDVISMZ8jttycB18bKm7FeORwbRFrCSw0A==
X-Google-Smtp-Source: ABdhPJyzLudiIQ/dpybDA57vC74JzVw449WHxrJNYfxwFjrKij9jEbD6z+ZLr4L2liSwFhoiYlSvyXGVP4cmweokm9k=
X-Received: by 2002:a17:907:78c4:: with SMTP id kv4mr27335251ejc.445.1620224402914;
 Wed, 05 May 2021 07:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210502193216.24872-1-brgl@bgdev.pl> <CAHk-=whSWp3exv8tZ2th5im_P7HF=c6iuOOVb9iSrNrd6405WA@mail.gmail.com>
 <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk> <YJCpnvKUNx+Tc+vg@zeniv-ca.linux.org.uk>
 <CAMRc=Mdh9LvUQCxcyt7ZBjitDB2noVnOptft_VORDhffxJaeCA@mail.gmail.com> <YJGFsrPBoQsKj+JZ@zeniv-ca.linux.org.uk>
In-Reply-To: <YJGFsrPBoQsKj+JZ@zeniv-ca.linux.org.uk>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 5 May 2021 16:19:52 +0200
Message-ID: <CAMRc=Mf1N1iL4b5KvVFbPsvKDMy_geXkd8LjmCu5r=bih-N7_w@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.13
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 4, 2021 at 7:34 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Tue, May 04, 2021 at 04:17:02PM +0200, Bartosz Golaszewski wrote:
> > >     Incidentally, if your code critically depends upon some field
> > > being first in such-and-such structure, you should either get rid of
> > > the dependency or at least bother to document that.
> > > That
> > > +               /*
> > > +                * Free memory allocated for the pending and live
> > > directories
> > > +                * of committable groups.
> > > +                */
> > > +               if (sd->s_type & (CONFIGFS_GROUP_PENDING |
> > > CONFIGFS_GROUP_LIVE))
> > > +                       kfree(sd->s_element);
> > > +
> > > is asking for trouble down the road.
> > >
> >
> > I'm not sure if this is a hard NAK for these changes or if you
> > consider this something that can be ironed out post v5.13-rc1?
>
> Rename implementation is simply bogus.  You are, for some reason, attaching
> stuff to *destination*, which won't be seen by anyone not currently using
> it.  It's the old_dentry that will be seen from that point on - you are
> moving it to new location by that d_move().  So I rather wonder how much
> had that thing been tested.  And I'm pretty much certain that you are
> mishandling the refcounts on configfs-internal objects, with everything
> that entails in terms of UAF and leaks.
>

The interface's stability in user-space has been tested a lot with the
test-suite for libgpiod[1] but I didn't look for leaks indeed.

> FWIW, I'm not happy about the userland API of that thing (what is supposed
> to happen if you create, move to live, then create another with the same
> name and try to move it to live or original back from live?), but
> Documentation/filesystems/configfs.rst is too sparse on such details.
> So I would like to see the specifics on that as well.  _Before_ signing
> up on anything, including "we can fix it up after merge".

Understood. I've sent out a new PR without these changes. I'll start
another thread asking for your help on the correct approach and maybe
some better ideas for the user interface.

Thanks,
Bartosz

[1] https://patchwork.ozlabs.org/project/linux-gpio/patch/20210429094734.9585-3-brgl@bgdev.pl/

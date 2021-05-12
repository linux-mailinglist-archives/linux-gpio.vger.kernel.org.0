Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48F737ED2E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 00:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239577AbhELUNe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 16:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378508AbhELTRG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 15:17:06 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8BEC06129D
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 12:11:27 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id v5so17288422edc.8
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 12:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MP25mFNYjdZfEJ+K2afJBNsaU0wrWzUC+MJo8UFw/5Q=;
        b=ApaXlJJOrWAXC+lybZWDPHlyWBmTCYMUKgAVwD/5GGx44YUdkuGHZ2qKn+pAzij60S
         F6w5dsMzxmvDRTL4Mna0QFE/GsRsgxB5N3Un2MFYeI++ewdn+jD3NHFhJD2gnHxm7mML
         1Cf4x0JmAJNGLn+c1bzcMnIaEj7kX+n7Ps56m3rEyx0Dzkc/a7jvld2OARw/U78P5P8g
         tHGVHxjXUyq0GmJROsGaR1rh3AlIWeZSScmGAPwmtiiqmUG/FTF7vub0KFSLTjLcbNm3
         3zyMYWiIl1LJfrrx6q+QHNr32GEUhHfOJg0jXDL8nLafEi6DKzyjNg9x5KrzjhYcpVrb
         jWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MP25mFNYjdZfEJ+K2afJBNsaU0wrWzUC+MJo8UFw/5Q=;
        b=hhZ/f4UPjmlJHpSznAHvLArAGZiFfrh+7ebZVQXWXV10FVaNPvUAipINKLIl2WBZDG
         Wmwkw0WeusWjcWe8EBE6GOS5ZQlfjDTJty982rAgXC+/jOG/KMH0qSF/I6cqbBshaYov
         UQYL7p4hsrxPQusnFv/E+XS7979LzSiQ9FvRBGDQqSzr/Ff8e887iztwpyOLKKno9woz
         8hmqXtvAhi+sXTvQ3OPrk7mhZbqXHFU5RwE5fFlNE/LnnoCGHKk7B4eQat7+eMSKXKmK
         it0HbBxtMgXIAQY1ydHYTjeWoJUZFJ5vF37MtWewJKDxvLmp2DQ/6FhX4eCW0ec64RGJ
         uz4w==
X-Gm-Message-State: AOAM532nWpCYw4d4jQ2lhYCHB4C/szFtzxzmaLABpnuKKoInmKJZcv4F
        3PX7v6xMjg3C677SB/RojsbQPWkjhv4YpVFed7J8mQ==
X-Google-Smtp-Source: ABdhPJzhhn72YZLsSlT3n6CJInAuFpexzIYfmN5GIL9N0oXGrfcJ3RgKSHTfyZIy4PoIxUh+DEPzadPoxoL83/C7m+E=
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr46060566edu.124.1620846686535;
 Wed, 12 May 2021 12:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210502193216.24872-1-brgl@bgdev.pl> <CAHk-=whSWp3exv8tZ2th5im_P7HF=c6iuOOVb9iSrNrd6405WA@mail.gmail.com>
 <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk> <YJCpnvKUNx+Tc+vg@zeniv-ca.linux.org.uk>
 <CAMRc=Mdh9LvUQCxcyt7ZBjitDB2noVnOptft_VORDhffxJaeCA@mail.gmail.com> <YJGFsrPBoQsKj+JZ@zeniv-ca.linux.org.uk>
In-Reply-To: <YJGFsrPBoQsKj+JZ@zeniv-ca.linux.org.uk>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 12 May 2021 21:11:15 +0200
Message-ID: <CAMRc=Mfk0cosLZbdTbg3XGHfSAtUkKpZ+zZpfSrN0Hntz3WtnQ@mail.gmail.com>
Subject: configfs: commitable items (was Re: [GIT PULL] gpio: updates for v5.13)
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Al!

This is a follow-up to your review of the configfs rename operation
for committable items. I'd like to start with a disclaimer: I have a
very limited knowledge of the linux VFS and am more of a driver &
platform guy. That means I may be asking silly questions so please be
patient with me.

You've mentioned two sets of problems: one with my rename
implementation and one with the general architecture of configfs.
While I can try to take on the latter as a side-project, I'll
definitely need guidance in the form of your old notes you mentioned.
For the former: I'd like to ask for advice on how to approach it. My
goal is to get an acceptable implementation of committable items in
for v5.14 and then potentially try to improve the overall configfs
design later.

> FWIW, I'm not happy about the userland API of that thing (what is supposed
> to happen if you create, move to live, then create another with the same
> name and try to move it to live or original back from live?), but
> Documentation/filesystems/configfs.rst is too sparse on such details.
> So I would like to see the specifics on that as well.  _Before_ signing
> up on anything, including "we can fix it up after merge".

Do you not like just the details like this (i.e. fixing this use-case
and documenting the behavior would be fine) or do you have an entirely
different idea for committable items? I'm open for other designs as
admittedly the hard-coded "live" and "pending" directories aren't very
elegant.

Regarding the repeating names: are there any helpers I could use for
finding the sibling (live for pending and vice versa) and then
inspecting its children for a repeating name? Any caveats to watch out
for?

> Rename implementation is simply bogus.  You are, for some reason, attaching
> stuff to *destination*, which won't be seen by anyone not currently using
> it.  It's the old_dentry that will be seen from that point on - you are
> moving it to new location by that d_move().  So I rather wonder how much
> had that thing been tested.  And I'm pretty much certain that you are
> mishandling the refcounts on configfs-internal objects, with everything
> that entails in terms of UAF and leaks.

I admit I don't really understand the meaning of "won't be seen by
anyone not currently using it". Should this cause some visible
problems in user-space or is it just related to VFS' accounting? Could
you point me to any existing example of the rename() callback that
would be useful in my case? The documentation does not really explain
the goal of rename wrt both the vfs and underlying fs' structures.

I assume d_move() should not be here at all (no other rename()
callback seems to call it) but does moving of the configfs sub-tree to
the live/pending sibling make sense?

Is the fact that configfs has its own tree with children and siblings
in parallel to the VFS a problem? To my inexperienced eye this looks
redundant if the VFS already keeps track of this. Is this one of the
things that should be reworked?

Best regards,
Bartosz Golaszewski

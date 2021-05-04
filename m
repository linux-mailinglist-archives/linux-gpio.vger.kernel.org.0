Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9F2372BD2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 16:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbhEDOSA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 May 2021 10:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhEDOR7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 May 2021 10:17:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B31C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 May 2021 07:17:04 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id n2so13419503ejy.7
        for <linux-gpio@vger.kernel.org>; Tue, 04 May 2021 07:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=n+KnWiTukcnI/04xktbWQop5hnuuOnBzWzlMDHOOkiA=;
        b=W3C+fVvrzwUW+T6/YT2KoyRnHfgwVmD/hoMyOL9IslubEil66EH/CyN0xMYYeTcFCh
         102vUQrqiHNeQUneD1qghBbw+IZNNHJoixrBagVQKo/sL/eB6sb+TRg22XdKBveYe1Nt
         2oKkj78Y5mRyhZ/Qbpjx9RdUpz/H41Or6y9MHp3XgB63FbX5cCNYZJk5bF0iT/i5kOlO
         9E8/RO7CH0gqkvjLkOhnFLqrYv0kLcO/3GCP2r+C6QGxZ82J5DBXaKeKaXNV3vL2B3cT
         tE1imT/V6qWYY19gbkFTg2TsenkZcBlwAaUi1qC8UQr8emeV2Yq7IJV+5qoxMmelStks
         RnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=n+KnWiTukcnI/04xktbWQop5hnuuOnBzWzlMDHOOkiA=;
        b=MY7WeTqKhzTI2xDOxuf7G16m3YGp4K2rgPLHVgnPpr79UodlxD7o+Kcgwta14LGfZ8
         /QsedzAfO5tiMsC3+XiPCP7VAHb+pfmM+fUr9JysSH8NXGKAtnh3WMGKtAHZtvaFVyWr
         F9ZVCAW2JHPq7RBqO+npcjxfFIo6j/IID+8G5uOaBALmgW1FUjuCwR/sMazo8l84nN3p
         yOLa8PB6WU/0edh96f7PSUjSS4jU5BpcTZncuV3bLnksve4CnWB6x0wNImaJEwcOBcaO
         +fhltRN5oQAPzcVeKZN3+Dh4paUOII4hVHvQbj/JgFxhhRGJ4Jj+zr6UqAMudtBRdSag
         DmPQ==
X-Gm-Message-State: AOAM533Hu50WrH12QAC4fJs67Ez0DRLnOIv+Ju/ecp8y1ij/vczX66Qw
        cD9XZ79MQzmWi7/+pdqav5Ej/L2yzpaUj5WVtA2Ctw==
X-Google-Smtp-Source: ABdhPJzz0u+qriRYXgleXetYnM8VDIR96rXYG4Zf9hwLJKtDmJkwSkmvH6755eJgdw/c084UGw5ceRdxiskuOMZrQAk=
X-Received: by 2002:a17:906:82d4:: with SMTP id a20mr22270386ejy.14.1620137823422;
 Tue, 04 May 2021 07:17:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:2a48:0:0:0:0:0 with HTTP; Tue, 4 May 2021 07:17:02 -0700 (PDT)
In-Reply-To: <YJCpnvKUNx+Tc+vg@zeniv-ca.linux.org.uk>
References: <20210502193216.24872-1-brgl@bgdev.pl> <CAHk-=whSWp3exv8tZ2th5im_P7HF=c6iuOOVb9iSrNrd6405WA@mail.gmail.com>
 <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk> <YJCpnvKUNx+Tc+vg@zeniv-ca.linux.org.uk>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 4 May 2021 16:17:02 +0200
Message-ID: <CAMRc=Mdh9LvUQCxcyt7ZBjitDB2noVnOptft_VORDhffxJaeCA@mail.gmail.com>
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

On 5/4/21, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Mon, May 03, 2021 at 06:28:38PM +0000, Al Viro wrote:
>
>> > So Al, do you see anything horrendous in how that configfs thing uses
>> > a rename to do kind of an "atomic swap" of configfs state?
>>
>> Give me a few hours; configfs is playing silly buggers with a lot of
>> structures when creating/tearing down subtrees, and I'd actually
>> expect more trouble with configfs data structures than with VFS ones.
>>
>> I'll take a look.
>

Hi Al and thanks for the comments!

> FWIW, one obviously bogus thing is this:
>
> +       spin_lock(&configfs_dirent_lock);
> +       new_dentry->d_fsdata = sd;
> +       list_move(&sd->s_sibling, &new_parent_sd->s_children);
> +       item->ci_parent = new_parent_item;
> +       d_move(old_dentry, new_dentry);
> +       spin_unlock(&configfs_dirent_lock);
> on successful ->rename().  sd here comes from
> +       sd = old_dentry->d_fsdata;
>
> 	Now, take a look at configfs_d_iput().  ->d_fsdata contributes
> to refcount of sd, and I don't see anything here that would grab the
> reference.
>
> 	Incidentally, if your code critically depends upon some field
> being first in such-and-such structure, you should either get rid of
> the dependency or at least bother to document that.
> That
> +               /*
> +                * Free memory allocated for the pending and live
> directories
> +                * of committable groups.
> +                */
> +               if (sd->s_type & (CONFIGFS_GROUP_PENDING |
> CONFIGFS_GROUP_LIVE))
> +                       kfree(sd->s_element);
> +
> is asking for trouble down the road.
>

I'm not sure if this is a hard NAK for these changes or if you
consider this something that can be ironed out post v5.13-rc1?

> 	I dislike (for the lack of adequate printable terms) the way configfs
> deals with subtree creation and, especially, removal.  It's kept attached
> to dentry tree (all the way to the root) as we build it and, in case we
> fail halfway through, as we are trying to take it apart.
>
> 	There is convoluted code trying to prevent breakage in such cases,
> but it's complex, brittle and I don't remember how critical the lack of
> renames had been in its analysis.  I can try to redo that, but that would
> take some time - IIRC, the last time I did it, it took several days
> of work (including arseloads of grepping through configfs users and
> doing RTFS in those)
>
> 	IMO we should attach the subtree we'd built only when it's
> fully set up.  I can dig out the notes (from 2 years ago) on how to massage
> the damn thing in that direction, but again, it'll take a day or two
> to verify that analysis still applies.  OTOH, that would simplify the code
> considerably, so the next time we want to change something it wouldn't
> be so unpleasant.
>

This seems to address fundamental issues with configfs. I probably
don't have enough deep understanding of the VFS to even try to take on
this. My question again is: should this block the committable items
from getting merged or is this a plan for future improvement?

Can we proceed with merging it to see if it causes any regressions
later in the release cycle?

IMO this isn't a case where we could corrupt someone's files if we
make a mistake but I also acknowledge that I'm biased because I'm the
one who wants this functionality to improve our user-space tests.

Best Regards
Bartosz Golaszewski

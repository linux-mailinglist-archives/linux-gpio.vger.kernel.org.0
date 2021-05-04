Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23AA372453
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 03:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhEDB4n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 21:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhEDB4n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 21:56:43 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829C8C061574;
        Mon,  3 May 2021 18:55:49 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1ldkHm-00ApeZ-PB; Tue, 04 May 2021 01:55:42 +0000
Date:   Tue, 4 May 2021 01:55:42 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] gpio: updates for v5.13
Message-ID: <YJCpnvKUNx+Tc+vg@zeniv-ca.linux.org.uk>
References: <20210502193216.24872-1-brgl@bgdev.pl>
 <CAHk-=whSWp3exv8tZ2th5im_P7HF=c6iuOOVb9iSrNrd6405WA@mail.gmail.com>
 <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 03, 2021 at 06:28:38PM +0000, Al Viro wrote:

> > So Al, do you see anything horrendous in how that configfs thing uses
> > a rename to do kind of an "atomic swap" of configfs state?
> 
> Give me a few hours; configfs is playing silly buggers with a lot of
> structures when creating/tearing down subtrees, and I'd actually
> expect more trouble with configfs data structures than with VFS ones.
> 
> I'll take a look.

FWIW, one obviously bogus thing is this:

+       spin_lock(&configfs_dirent_lock);
+       new_dentry->d_fsdata = sd;
+       list_move(&sd->s_sibling, &new_parent_sd->s_children);
+       item->ci_parent = new_parent_item;
+       d_move(old_dentry, new_dentry);
+       spin_unlock(&configfs_dirent_lock);
on successful ->rename().  sd here comes from
+       sd = old_dentry->d_fsdata;

	Now, take a look at configfs_d_iput().  ->d_fsdata contributes
to refcount of sd, and I don't see anything here that would grab the
reference.

	Incidentally, if your code critically depends upon some field
being first in such-and-such structure, you should either get rid of
the dependency or at least bother to document that.
That
+               /*
+                * Free memory allocated for the pending and live directories
+                * of committable groups.
+                */
+               if (sd->s_type & (CONFIGFS_GROUP_PENDING | CONFIGFS_GROUP_LIVE))
+                       kfree(sd->s_element);
+
is asking for trouble down the road.

	I dislike (for the lack of adequate printable terms) the way configfs 
deals with subtree creation and, especially, removal.  It's kept attached
to dentry tree (all the way to the root) as we build it and, in case we
fail halfway through, as we are trying to take it apart.

	There is convoluted code trying to prevent breakage in such cases,
but it's complex, brittle and I don't remember how critical the lack of
renames had been in its analysis.  I can try to redo that, but that would
take some time - IIRC, the last time I did it, it took several days
of work (including arseloads of grepping through configfs users and
doing RTFS in those)

	IMO we should attach the subtree we'd built only when it's
fully set up.  I can dig out the notes (from 2 years ago) on how to massage
the damn thing in that direction, but again, it'll take a day or two
to verify that analysis still applies.  OTOH, that would simplify the code
considerably, so the next time we want to change something it wouldn't
be so unpleasant.

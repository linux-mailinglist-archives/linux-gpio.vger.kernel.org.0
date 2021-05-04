Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFD2372EFC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 19:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhEDRft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 May 2021 13:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbhEDRft (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 May 2021 13:35:49 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15ADC061574;
        Tue,  4 May 2021 10:34:53 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1ldywU-00B57O-Th; Tue, 04 May 2021 17:34:43 +0000
Date:   Tue, 4 May 2021 17:34:42 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] gpio: updates for v5.13
Message-ID: <YJGFsrPBoQsKj+JZ@zeniv-ca.linux.org.uk>
References: <20210502193216.24872-1-brgl@bgdev.pl>
 <CAHk-=whSWp3exv8tZ2th5im_P7HF=c6iuOOVb9iSrNrd6405WA@mail.gmail.com>
 <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk>
 <YJCpnvKUNx+Tc+vg@zeniv-ca.linux.org.uk>
 <CAMRc=Mdh9LvUQCxcyt7ZBjitDB2noVnOptft_VORDhffxJaeCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdh9LvUQCxcyt7ZBjitDB2noVnOptft_VORDhffxJaeCA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 04, 2021 at 04:17:02PM +0200, Bartosz Golaszewski wrote:
> > 	Incidentally, if your code critically depends upon some field
> > being first in such-and-such structure, you should either get rid of
> > the dependency or at least bother to document that.
> > That
> > +               /*
> > +                * Free memory allocated for the pending and live
> > directories
> > +                * of committable groups.
> > +                */
> > +               if (sd->s_type & (CONFIGFS_GROUP_PENDING |
> > CONFIGFS_GROUP_LIVE))
> > +                       kfree(sd->s_element);
> > +
> > is asking for trouble down the road.
> >
> 
> I'm not sure if this is a hard NAK for these changes or if you
> consider this something that can be ironed out post v5.13-rc1?

Rename implementation is simply bogus.  You are, for some reason, attaching
stuff to *destination*, which won't be seen by anyone not currently using
it.  It's the old_dentry that will be seen from that point on - you are
moving it to new location by that d_move().  So I rather wonder how much
had that thing been tested.  And I'm pretty much certain that you are
mishandling the refcounts on configfs-internal objects, with everything
that entails in terms of UAF and leaks.

FWIW, I'm not happy about the userland API of that thing (what is supposed
to happen if you create, move to live, then create another with the same
name and try to move it to live or original back from live?), but
Documentation/filesystems/configfs.rst is too sparse on such details.
So I would like to see the specifics on that as well.  _Before_ signing
up on anything, including "we can fix it up after merge".

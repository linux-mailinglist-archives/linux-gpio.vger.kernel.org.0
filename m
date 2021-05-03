Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9372E371FA8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 20:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhECS3n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 14:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhECS3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 14:29:42 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22ADC06174A;
        Mon,  3 May 2021 11:28:48 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lddJ8-00AijV-8H; Mon, 03 May 2021 18:28:38 +0000
Date:   Mon, 3 May 2021 18:28:38 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] gpio: updates for v5.13
Message-ID: <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk>
References: <20210502193216.24872-1-brgl@bgdev.pl>
 <CAHk-=whSWp3exv8tZ2th5im_P7HF=c6iuOOVb9iSrNrd6405WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whSWp3exv8tZ2th5im_P7HF=c6iuOOVb9iSrNrd6405WA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 03, 2021 at 11:03:57AM -0700, Linus Torvalds wrote:
> Al,
>  would you mind taking a look at this part:
> 
> On Sun, May 2, 2021 at 12:32 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > You'll notice that we have a bunch of configfs commits in our tree not acked by
> > the configfs maintainers. These commits implement the concept of committable
> > items in configfs - something that was well defined in the documentation for
> > years but has remained unimplemented. Despite the first submission of these
> > patches back in November 2020[1] and repeated pings & resending, configfs
> > maintainers have remained unresponsive. After reviewing these on the GPIO
> > mailing list, we decided to pick them up ourselves and send them your way
> > together with the first user: the new GPIO simulator.
> 
> It doesn't look huge to me, and I don't care all that deeply about
> configfs, and honestly, I'm not seeing huge amounts of actual
> development there, with recent commits all being about cleanup of vfs
> changes (eg things like the new idmapping changes etc).
> 
> That said, I really don't want to pull that with some core sanity checking.
> 
> So Al, do you see anything horrendous in how that configfs thing uses
> a rename to do kind of an "atomic swap" of configfs state?

Give me a few hours; configfs is playing silly buggers with a lot of
structures when creating/tearing down subtrees, and I'd actually
expect more trouble with configfs data structures than with VFS ones.

I'll take a look.

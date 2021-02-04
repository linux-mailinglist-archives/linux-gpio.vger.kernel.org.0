Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44ACC30F520
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 15:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236805AbhBDOhA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 09:37:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:39806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236796AbhBDOfx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Feb 2021 09:35:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9388864EE2;
        Thu,  4 Feb 2021 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612449312;
        bh=q4iWNzlgf4ZwVVfzl0gBPNyXiRqM4z4Whq1heB8mwdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e7KLylsfzQvOcOhoq2QygjgosqRD3dFXXhEBxFmUg3abR0Tmx+4lGyatOeyEW32mR
         DhbN9zG//xY3yrCTKkBK+YyfZsxe8OeQehTwA+RHYNIMF7GtoiEHBao5w9styBNOd+
         LFCA1QnKoy5fyXaZrVXGET3pB6waWCrj1e8Xa+y4=
Date:   Thu, 4 Feb 2021 15:35:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: uapi: use the preferred SPDX license identifier
Message-ID: <YBwGHWSV1/ZZm7u/@kroah.com>
References: <20210204124357.3817-1-brgl@bgdev.pl>
 <YBv61eNnVksYq9mr@kroah.com>
 <CAMpxmJXcVOHbozzhQQW2GPg-6ivCWL3pQmyC-oU_YW5NX=gK3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXcVOHbozzhQQW2GPg-6ivCWL3pQmyC-oU_YW5NX=gK3w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 04, 2021 at 03:15:50PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 4, 2021 at 2:47 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Feb 04, 2021 at 01:43:57PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > GPL-2.0 license identifier is deprecated, let's use the preferred
> > > identifier: GPL-2.0-only.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > > Hi Kent, Greg,
> > >
> > > I started working on making libgpiod licensing reuse-compliant and noticed
> > > that the reuse-tool is telling me that the GPL-2.0 SPDX identifier in the
> > > GPIO uapi header is deprecated. Since I'm required to copy the header
> > > verbatim into libgpiod's repository, I think we need to fix that at source
> > > first.
> > >
> > >  include/uapi/linux/gpio.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > > index e4eb0b8c5cf9..3e01ededbf36 100644
> > > --- a/include/uapi/linux/gpio.h
> > > +++ b/include/uapi/linux/gpio.h
> > > @@ -1,4 +1,4 @@
> > > -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> >
> > No, there is no need to convert the kernel to the "latest" spdx level,
> > when we started out there was no "-only" nonsense (hint no other license
> > has that crud), and "GPL-2.0" is a totally valid summary of the license.
> >
> > So please don't go changing it all in-kernel, that way lies madness.
> > Let's finish fixing up ALL kernel files before worrying about what SPDX
> > "version" we are at.
> >
> 
> But then, the reuse script is telling me:
> 
>     Unfortunately, your project is not compliant with version 3.0 of
> the REUSE Specification :-(
> 
> because I'm using a deprecated license. :(

Go yell at the REUSE people, there's no requirement to have the most
recent version of SPDX, is there?   :)

And if that's the only thing wrong with the project when running 'reuse
lint' then you should be happy, no one will complain at all.

thanks,

greg k-h

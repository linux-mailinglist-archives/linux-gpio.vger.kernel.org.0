Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3922031677B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 14:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbhBJNHw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 08:07:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbhBJNGU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 08:06:20 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7714FC061756
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 05:05:39 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id w1so4006972ejf.11
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 05:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BOHWlzrGxv1diIztKsse/klmr7NSwYQVV9nNu4ohZ2Q=;
        b=OW7E8VgnPaZOABILrTCfAcgtkYPl2z/WwNcui8n4M9VObCPknyvv9UeQPsFQ8Dnjm+
         Vwz+gJwKwsn5hXjmAvqBuNMOfJY8vKjic9ociS5qa4vMutMX8THG8KAvIl6svwsqaUwG
         2LlJhUFecqDHjV2RMAogbdvl632Mzt6X5EgfGvlfCou1QiSbRFEg/nwnshPUoHEOHsk5
         kmu3FABT0LsbfUHG1JuEOyAbc/6sicTujDwM5TpcFbeLRb+kEf/EZbEJC6VvvgaA3j50
         W1VU5MTgOxeLLy6KCd/1MzKzF121mmWuHK1I9v5ViLT5brI2PW8haeB4NaEqdfgh8TLv
         fv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOHWlzrGxv1diIztKsse/klmr7NSwYQVV9nNu4ohZ2Q=;
        b=LKE4XR9VCb2E/wPVEJYiae/z15RWKce882i+m+d9QNtN9udp53TmDAxiJy+Vsrpd9R
         /v9hbKdHG5ZCvRKypdxfjywj+3KVPVmK+F3pNI2e1YoYRD3gzPCNavmH1IwZTWAE1D1P
         qJRrDg8d5n8sKrfcw1CiqCcc7hkA5eOl0/v4ypgZnVM/v/o5MPBaKICMH3vAmTFNRasF
         Ec/Z9q1C7mKhl5iY/IcGL6NRBudMpjia9F+M/TyJPkGkFIHb+F1S/9HRG5pr4xa7yW9R
         f6XjmqKl6Ouu4YzNhlImrtK6GlfUSkGYHvS3YeejMB/WKSUxDss2KNUMqvwKzbsDA1Jn
         gcfQ==
X-Gm-Message-State: AOAM531MJ0tVknhDnimdA8T4tbNpnrsPhvWomPH/rjuCNO2C4K90imVY
        np5LoA/HFkIGwZs9BE0gA+41tGK1i+snpj96xKNyQw==
X-Google-Smtp-Source: ABdhPJyCMOuPY+9w42KfhFy/YmhWoMYu3SVuX8cnGCW2uxM+dGpPZrxj2OYBZMLCLpw9+Hp1v052PIBLfIgX5g9WnLo=
X-Received: by 2002:a17:906:4707:: with SMTP id y7mr2801250ejq.445.1612962338160;
 Wed, 10 Feb 2021 05:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20210204124357.3817-1-brgl@bgdev.pl> <YBv61eNnVksYq9mr@kroah.com>
 <CAMpxmJXcVOHbozzhQQW2GPg-6ivCWL3pQmyC-oU_YW5NX=gK3w@mail.gmail.com>
 <YBwGHWSV1/ZZm7u/@kroah.com> <CAMpxmJUof3DN2YHBOQm1Z-hrtS1cj6in5CAHowce++36XtqsnA@mail.gmail.com>
 <YBwSuAjNu4FtXSn/@kroah.com>
In-Reply-To: <YBwSuAjNu4FtXSn/@kroah.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 10 Feb 2021 14:05:27 +0100
Message-ID: <CAMRc=MeBFCdcBWnm4nWTM3E7AnVhLmxQz_1C_YF3smA6ffXrDA@mail.gmail.com>
Subject: Re: [PATCH] gpio: uapi: use the preferred SPDX license identifier
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 4, 2021 at 4:29 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 04, 2021 at 04:17:51PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 4, 2021 at 3:35 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Feb 04, 2021 at 03:15:50PM +0100, Bartosz Golaszewski wrote:
> > > > On Thu, Feb 4, 2021 at 2:47 PM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Thu, Feb 04, 2021 at 01:43:57PM +0100, Bartosz Golaszewski wrote:
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > >
> > > > > > GPL-2.0 license identifier is deprecated, let's use the preferred
> > > > > > identifier: GPL-2.0-only.
> > > > > >
> > > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > ---
> > > > > > Hi Kent, Greg,
> > > > > >
> > > > > > I started working on making libgpiod licensing reuse-compliant and noticed
> > > > > > that the reuse-tool is telling me that the GPL-2.0 SPDX identifier in the
> > > > > > GPIO uapi header is deprecated. Since I'm required to copy the header
> > > > > > verbatim into libgpiod's repository, I think we need to fix that at source
> > > > > > first.
> > > > > >
> > > > > >  include/uapi/linux/gpio.h | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > > > > > index e4eb0b8c5cf9..3e01ededbf36 100644
> > > > > > --- a/include/uapi/linux/gpio.h
> > > > > > +++ b/include/uapi/linux/gpio.h
> > > > > > @@ -1,4 +1,4 @@
> > > > > > -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > > > > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > > > >
> > > > > No, there is no need to convert the kernel to the "latest" spdx level,
> > > > > when we started out there was no "-only" nonsense (hint no other license
> > > > > has that crud), and "GPL-2.0" is a totally valid summary of the license.
> > > > >
> > > > > So please don't go changing it all in-kernel, that way lies madness.
> > > > > Let's finish fixing up ALL kernel files before worrying about what SPDX
> > > > > "version" we are at.
> > > > >
> > > >
> > > > But then, the reuse script is telling me:
> > > >
> > > >     Unfortunately, your project is not compliant with version 3.0 of
> > > > the REUSE Specification :-(
> > > >
> > > > because I'm using a deprecated license. :(
> > >
> > > Go yell at the REUSE people, there's no requirement to have the most
> > > recent version of SPDX, is there?   :)
> > >
> > > And if that's the only thing wrong with the project when running 'reuse
> > > lint' then you should be happy, no one will complain at all.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Ok, I get it but let me try one last time: there's absolutely no harm
> > in merging this patch for the next release, is there? Currently there
> > are around 15000 instances of "GPL-2.0-only" in the kernel vs 30000
> > "GPL-2.0" - so the former is not that uncommon.
>
> It's up to the owner/maintainer of this file in the end, but I don't
> want to see patches doing this for many more files, as it's pointless
> churn as far as the kernel is concerned.
>

Since it's up to me to decide - I'll apply this but I'll clarify in
the commit message why user-space may want this change.

Bart

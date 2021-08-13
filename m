Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87ED23EB5E1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 14:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239791AbhHMNAX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 09:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbhHMNAW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 09:00:22 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F7DC061756
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 05:59:55 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g21so1538790edw.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 05:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6X01bZijtc057qKgTQXRv4jm3osac/023VihRQ/oC4Y=;
        b=g20/LWnhaXyjiRdYM8gRTaLoixNRvvcZ/uV3Tg67/rhFa6QQo37jdtDUKoSkOjkmVv
         aRa9UiHkP7a+TJ5ZYX3Pj0ixKLPTNMWAgbpqj+CwK54djRacvF4VnlUWk/LuhWrtyLiH
         Y6Zt9+zL04GKAMWPwLBrn3rxkCeVPDNb+rzTKrdP7u3PYxC8WfegwhQo2kodK0SvKkQj
         PWTYd/9fzZLBxhuKyZvFZId5tFmw1+hIYRvby3vDanz9H4hoigdfqrkxDcnkcXG6L/SX
         SuK54m0xZMVVUqGAkqUS3C38GDTiCVOb9hPUV//LQB4XkUnX/kd+wSc7XuOSxxXYJx3/
         0cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6X01bZijtc057qKgTQXRv4jm3osac/023VihRQ/oC4Y=;
        b=DJsr5542OW1XFyt49kudIVQfS4LgbakrYgXYQV1KL/6biZ0zLaFP9wPaGzHbb/3OQ7
         wbVhQXE1N+r7+0QEGI334uBiYmNY/KPtXIKbRTr9qvAXlhQShTl3AdXXOV4NCluotV6M
         JIPFjsVmlJz4FC9Gs4SONuUr/+4GUy0ZzBssjwD0sGb0oN/VHRWEjJ/U8BkNxV+JV9ye
         by2JXCFTUWNhy+pk/86VKiyZId3fXA4RX49ZCiypa+f5nLsGSf6yTT0Sg91uzb1z7NCy
         IduOTsCvU7y073AKuX4MiQ0oz4cGnFmhs0kOCtDE/FMpBFhq0jlDkvOozuU4K8Sm+SRh
         cmyQ==
X-Gm-Message-State: AOAM533kJKq5/t41uB185uW62fZ8mRO5RqU9Hn06juZfgmz2Vq2q3+8Y
        tahMMB7cUuAI9TAWJ4NcGys4VapSZLnmWnK/vL0Igg==
X-Google-Smtp-Source: ABdhPJz3HgqlkYz2gbbUzpbOnt7EsF8M8OUa/DRvDK+XMu9wadrWV+Rcw9GnxBsJALOg9XftD25NgOT8NaWlDre0TBM=
X-Received: by 2002:aa7:d982:: with SMTP id u2mr3025231eds.164.1628859594286;
 Fri, 13 Aug 2021 05:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210807084809.GA17852@sol> <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol> <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol> <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
 <20210812102913.GA21938@sol> <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
 <20210812142345.GA29599@sol> <CAMRc=MdV+GDGpwdMLwKTxaXR+x1ogLzanRBuvwG-aL2jQFrxsA@mail.gmail.com>
 <20210812150223.GA38195@sol>
In-Reply-To: <20210812150223.GA38195@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Aug 2021 14:59:43 +0200
Message-ID: <CAMRc=Mdt=SmzTuVMgXwk6OKeCT3U8U_oZNPLuGQmKU6yRCCz-Q@mail.gmail.com>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 5:02 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Aug 12, 2021 at 04:43:46PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 12, 2021 at 4:23 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Thu, Aug 12, 2021 at 02:51:02PM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Aug 12, 2021 at 12:29 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > >
> > >
> > > <snip>
> > >
> > > > >
> > > > > Sure, it's a trade-off, but the alternative is requiring a 2-3k block
> > > > > even for a one line request, which seems a wee bit excessive.
> > > > >
> > > >
> > > > As you said - it's on the heap, so who cares. But this is also an
> > > > internal structure and so we can use bit fields. That should reduce
> > > > the memory footprint significantly as we now don't require more than 3
> > > > bits for any given enum. That would leave us with the debounce period
> > > > and offset as full size variables.
> > > >
> > >
> > > Rather than introducing a new collection of enums and bitfields, why not
> > > just store the v2 flags for the line?
> > >
> >
> > Why a new collection of enums? It wouldn't change anything, we'd just
> > make sure in the setters we never overflow.
> >
>
> Yeah, my bad - you already have the enums.
>
> > I would prefer to limit the use of kernel symbols (and types!) to the
> > minimum for clarity.
> >
>
> OK, but you need to map the libgpiod config to kernel flags at some
> point...

Yep, right before passing the arguments to the kernel. Having separate
fields for each setting is much clearer IMO than storing flags.

> And this is all internal to line-config.c...
>

This code still needs to be maintained and using enums makes it easier.

Anyway, this is implementation detail really as with bit fields we'll
fit in an 32-bit integer anyway with all those enums. Does the general
idea sound good? If so, then I'll rework it.

Bart

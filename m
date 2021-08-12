Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D4B3EA6B6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 16:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236641AbhHLOoY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 10:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbhHLOoY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 10:44:24 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E21C061756
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 07:43:59 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id b15so12028170ejg.10
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 07:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SA1J4qC0P766tTsk5TfIdOgqs2d7AkUih5xYuanK7M8=;
        b=cqycbGzwizMrLbvDfuB7I2AG4AlOenfy4QSZ8ceasJtdU4RJNCFnNw4VQGJgmS7DPb
         p3+BB5sRapHeRgISYjXGMeB171XLV5U0vbIcvebVPmtbv11ZvbFTAvaifqOnkWF/Jd2O
         I2IWGX6UUOSdJsVbEkogmJ11BWIfXOFLY8nVgO9wpk3nbS6gxlM9Zv87xc38i0oJRzUe
         rxtgd1j5vXFJ+HEVezlXwQVaH+E1xZZX0EsKNLUoA3vQ7hW9D3SnH3cYc25tOmMrlt+5
         wZEoPt+kB5Vp5yzQv183gAkgOFYBlCySlLXryoiWYkDGi15A/l6Gw8W1OS5tJDMaaPqV
         TmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SA1J4qC0P766tTsk5TfIdOgqs2d7AkUih5xYuanK7M8=;
        b=qGxooGIFZ1qdIEe5Ibx2fjrOh+qvysdjMNsRhgZK8iomnRCWK//2xBLFX7AdrLQGKP
         6ZWAo5vJXPBM7f/5jwgLe8d72Tj3JiqCuLTkO5E5K4ta1p25gi8YgjAdfVM62T0rHEIQ
         nWJF3vapaZeZeNFcEooHNV+CYgTztHEHxfFHpEbaPQ4cVpUYLWHqK2PnWUe9zQ7G1XOX
         nTsR0+MhCAfx/6UC5mri1S6z9MbqiV5PaCujyFTe3n6xNg8NQ5E2dKqPFYNN04WI+n9K
         KL3S69znEz6NZEg883p7O/TQEUKFuWyRPFsLJEfLK39cx6DFyMzopei7faLqy0zrooMC
         28NQ==
X-Gm-Message-State: AOAM532J7X4Z3XbNJMJlTTq/N1BBICrm5o1JGJIdFgwHA6KYpRXAUoY5
        LiZY+9iVZn8S02A7HF91nPTXEXLzgOF1w0eBMWnXfg==
X-Google-Smtp-Source: ABdhPJxsmLU4lTwDogObtbdYvvcLhIHlNM0uYhFhmlpzGzrpKXdrX8JD8mZ9HRBvBcMP3rwpuKIvt68HR+/C2K3vkk4=
X-Received: by 2002:a17:906:9ac6:: with SMTP id ah6mr4051422ejc.64.1628779437637;
 Thu, 12 Aug 2021 07:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210806132810.23556-1-brgl@bgdev.pl> <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol> <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol> <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
 <20210812102913.GA21938@sol> <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
 <20210812142345.GA29599@sol>
In-Reply-To: <20210812142345.GA29599@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Aug 2021 16:43:46 +0200
Message-ID: <CAMRc=MdV+GDGpwdMLwKTxaXR+x1ogLzanRBuvwG-aL2jQFrxsA@mail.gmail.com>
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

On Thu, Aug 12, 2021 at 4:23 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Aug 12, 2021 at 02:51:02PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 12, 2021 at 12:29 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> >
>
> <snip>
>
> > >
> > > Sure, it's a trade-off, but the alternative is requiring a 2-3k block
> > > even for a one line request, which seems a wee bit excessive.
> > >
> >
> > As you said - it's on the heap, so who cares. But this is also an
> > internal structure and so we can use bit fields. That should reduce
> > the memory footprint significantly as we now don't require more than 3
> > bits for any given enum. That would leave us with the debounce period
> > and offset as full size variables.
> >
>
> Rather than introducing a new collection of enums and bitfields, why not
> just store the v2 flags for the line?
>

Why a new collection of enums? It wouldn't change anything, we'd just
make sure in the setters we never overflow.

I would prefer to limit the use of kernel symbols (and types!) to the
minimum for clarity.

Bart

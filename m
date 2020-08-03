Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2456123ADDB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 22:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbgHCT7j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 15:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbgHCT7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 15:59:39 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD9DC061756
        for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2020 12:59:38 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id m7so4184939qki.12
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2020 12:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WMr7j5kP6nex1WMLIUbWVtJxCoXdAe6Xx/9JM/a5res=;
        b=H2NcxoBrl7r69IvVi/9x92XDg1z7WmHdxs423ix+1AoNv23v0/+F7C9fxhaZqBhmDY
         CxtGBXCgtUn3x6dBNx0wBPYs1hRQlHmXDqw796NAbW03Q0aTuNpRESxJWOlaARyh5+1O
         43E5lh12SZ8yDmVmtCuZDQhRedmezpD3g42/HlJYut9lf2g3+rPnosbdvnQBywTKf+eP
         m4ifV99w/5uUmTNKap4TSizuU2qnfvob1O4EBwbkQAXfffGlVWjkMD1AC9B/1Y5+m+pj
         bQKhhpC/5JB1XhhN9nkW/Fnuk0yg1m3XYTRHpTAaMWWQoK2HRp5bN19Lq5Z3DzdwDPWT
         /MMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WMr7j5kP6nex1WMLIUbWVtJxCoXdAe6Xx/9JM/a5res=;
        b=PenRpoOhmiVrygAqjeZyueALxW5cLuZxkMQMf/Z2ujC2ScLlHxgZ6O80hJCXSjar6+
         1+zZpDhn9KbKr/f1L6hHSZaDCk7DpuAJU46PmswmeBMzzhepbUaIh/tzd3o2yAz6GRFz
         QuHiljcnJtthzRLhaQFJWxjxN1Cz+kODXixBC7q91Phcy7fjDs0T5ZFpbxqip815cn+G
         IoK/4OkhthVJfBa5Ui6HgaWx1PtxJm4Cpoqzn3zpuQ3fhnj8lZ0QxXIh4XU3Iokf81FP
         pDa5pbR2Om1Gk/AMOT+r+2DqWzJo9ES+fbU8qpl4OLRc7D5qNSM6OqFS+9v6T2LnOGA0
         9nhA==
X-Gm-Message-State: AOAM531aGuzbklaEGJR11ucngqVQQz/cdIcQFH4TASWivunnUXfF/nim
        Evi0LNVQ5zmKfXrM3lBzFiCpM7wE6m72gtg/f/2TJw==
X-Google-Smtp-Source: ABdhPJxDymFtZNgAnIJdxzvntCOIeqaOzyfwThGdou91UTBOOSVRS5gDgOWCrSjkXiDJGqr25BEvUWV5FAElompEqZw=
X-Received: by 2002:a37:a495:: with SMTP id n143mr18005291qke.330.1596484778138;
 Mon, 03 Aug 2020 12:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
 <20200726011244.GA6587@sol> <CAMpxmJWaEVwjXSFHTYmwdfA+88upVkJ4ePSQf_ziSOa1YdOUKQ@mail.gmail.com>
 <20200802033158.GA13174@sol> <20200802093242.GA23877@sol>
In-Reply-To: <20200802093242.GA23877@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 3 Aug 2020 21:59:27 +0200
Message-ID: <CAMpxmJWD9mA_=+8QGq4iQgahEqh39m=7QkmTcMN_Q5XkBZys6w@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and GPIOLINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 2, 2020 at 11:32 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Sun, Aug 02, 2020 at 11:31:58AM +0800, Kent Gibson wrote:
> > On Fri, Jul 31, 2020 at 06:05:10PM +0200, Bartosz Golaszewski wrote:
> > > On Sun, Jul 26, 2020 at 3:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >
> > > > >
> > > > > > +               dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
> > > > > > +                       offset);
> > > > >
> > > > > Perhaps tracepoint / event?
> > > > >
> > > >
> > > > Again, a cut-and-paste from V1, and I have no experience with
> > > > tracepoints or events, so I have no opinion on that.
> > > >
> > > > So, yeah - perhaps?
> > > >
> > >
> > > I think it's a good idea to add some proper instrumentation this time
> > > other than much less reliable logs. Can you take a look at
> > > include/trace/events/gpio.h? Adding new GPIO trace events should be
> > > pretty straightforward by copy-pasti... drawing inspiration from
> > > existing ones.
> > >
> >
> > You only want tracepoints to replace those dev_dbg()s, so when a line
> > is requested? What about the release?  Any other points?
> >
>
> Had a closer look and it seems to me that the correct place to add such
> tracepoints would be gpiod_request() and gpiod_free(), so they catch all
> requests, not just the cdev ones.  And that moves it outside the scope
> of this patch.
>
> I personally don't have any use for the dev_dbg()s here and am happy to
> remove them - they were only there to match the behaviour of
> linehandle_create as closely as possible.
>

Sounds good, we can work on trace points separately.

Bartosz

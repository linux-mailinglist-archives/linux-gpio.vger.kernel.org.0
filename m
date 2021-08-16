Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA0B3ED941
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 16:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbhHPOzF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 10:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbhHPOzE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 10:55:04 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC81C061764;
        Mon, 16 Aug 2021 07:54:33 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so402181pjl.4;
        Mon, 16 Aug 2021 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XqGlFzf6yPC8mxVmv/EzUERHXBD+D2QbKkrAV4TyyeU=;
        b=i59ch55wQ8kjlsDh0c/JMmkl3eJPrTvs1H/xODbRobY695ZKyv5MaaOBveizHJdPEF
         VIcE13x/ZCwPGWkDuQEjFdg1HIw288rvfMM2BAU+kqDP5iOEpoZ7Y+ld8fcO9bdbKjEq
         JpP9oqM94RQp4ihzVm2LFDKC7kmaN1C/eRqU+/CarwgKiprY+qyj5hrOzTEJAgCLlZBY
         oqb3o+VHSqqn+tAHzWuZSkNuHqDEjndQCSieuJcnANa857hK31PYUPlRsKX8H94q4tJh
         wv8fCFXrdoVW03TyDx8iOmXrmxaBz30yFd+X2tnymAxU4cAAs0nNOJXz+7Q2F2jslF0p
         pTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XqGlFzf6yPC8mxVmv/EzUERHXBD+D2QbKkrAV4TyyeU=;
        b=r3jtsA71DhELiHQ3rARVQiCOd2xVMd0YpEZQVjR8fGYhhku4fmZJSPL3/cwWiU7APN
         MF55muMZSRvaBjKtBSLAN7pS6DpViw0UErY0Emmz+32qNYIgC5U1KwqIlv+a014sUSjV
         WqDW1nCSuUpmrYHRdLTVr/1Cpl4gizBwPuRAPDIzQ9LZVsZpTb8Z/Hc/MNyJc8yDBdLC
         pE933lFsdXPyxE40M6VRLE+ZrzV/wrMu/+waSQ61HgJqENX6LVigMDKG4AZ4/p8k2nlV
         hoHhM9JmGU3kxYQFKlZ6vdlqcGIWnPEt3QbImG/ghIXY9xZhw65yvmujeGnn9pkmn43w
         HC+g==
X-Gm-Message-State: AOAM5319nkmJj5dXo0uvp6BFtJ+G4vmvqBUh23ke3/k+jJLwE+Wl5MDh
        5d7mzR7A76M5okulWxTG6KVKiEXZ4Eu5qfxpieU=
X-Google-Smtp-Source: ABdhPJyVegWRrZRtIYbsGYD+ZovjO/z0i75jLJNm0tM0YKOl6CTHLgikpQiSH7t7xrsM/ZsbB5XNycIHZXc7R8NRoYk=
X-Received: by 2002:a63:40c1:: with SMTP id n184mr16436749pga.74.1629125672892;
 Mon, 16 Aug 2021 07:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
 <YRpihHP3kDz5nYV9@google.com> <CAHp75VdcWsNFervoU7e4_m7qVKAnWXzF2z2mUgKg06-qmwn-2A@mail.gmail.com>
 <YRppKOxp4Jya5iEI@google.com> <YRpva4gS1LfncPUj@smile.fi.intel.com> <YRpz5UEDQbpewq5o@google.com>
In-Reply-To: <YRpz5UEDQbpewq5o@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 16 Aug 2021 17:53:53 +0300
Message-ID: <CAHp75VczCKwNQE8k6_e9Trk0qkD2EumFVxxG5w2BTYhiOTDUzA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 16, 2021 at 5:19 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> > On Mon, Aug 16, 2021 at 02:33:28PM +0100, Lee Jones wrote:
> > > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> > > > On Mon, Aug 16, 2021 at 4:11 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > > > On Mon, 26 Jul 2021, Andy Shevchenko wrote:
> > > > >
> > > > > > The driver can provide a software node group instead of
> > > > > > passing legacy platform data. This will allow to drop
> > > > > > the legacy platform data structures along with unifying
> > > > > > a child device driver to use same interface for all
> > > > > > property providers, i.e. Device Tree, ACPI, and board files.
> > > > > >
> > > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > ---
> > > > > >  drivers/mfd/intel_quark_i2c_gpio.c | 70 ++++++++++++++++--------------
> > > > > >  1 file changed, 37 insertions(+), 33 deletions(-)
> > > > >
> > > > > Doesn't seem to want to apply.
> > > >
> > > > Would it be okay for you to pull the immutable tag?
> > >
> > > What immutable tag?
> >
> > It's here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/tag/?h=intel-gpio-v5.15-1
>
> My Ack can't be merged like that.

Which one? There are two on different patches.
Do you have any documentation on the rules you imply by MFD?

-- 
With Best Regards,
Andy Shevchenko

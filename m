Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE88332A31
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 16:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhCIPT1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 10:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbhCIPS5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 10:18:57 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E74C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 07:18:47 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id mj10so28685627ejb.5
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uy8hTGwoIlbYzbJguofGBFpclocfOQDOvjuHpZxozsI=;
        b=ApMs2f3rlZtba3dQK48fjlsgDP9t7Nk63Kp7fahTQqfinEpZpGMucvH0tS471jm2eH
         acF2ywgsm+ZyNf2BNrrGxDotkX6miLV41Q/TOScIn03Iv0YG9248v8Yv9Kov2VhWyq+e
         U4j6RzK7KB+p8lqg/MWKd6dedlomQlxc/ZX3V83xB39ecR2wlNcEj3lLFuJzOisgKViH
         2+NSmxwI0ggot/WR5su4mzRuV9yAXseLdNPef7juvvhxTcKz9m3UwiA0GQCL/HYLV7wa
         N6lX2EdIouuFV3UtsY+7b8hsZN+R0iviOBW42AVvoQZ3TFf7O3DJFJwfFZqBejH8n/05
         iivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uy8hTGwoIlbYzbJguofGBFpclocfOQDOvjuHpZxozsI=;
        b=VuDUhWf7R3hjZiMImCM/YYZC87YJnrP8L9Fl287uanS6MIH3XlcEVZ/5bY8cVTF3WA
         q6JGvMGSnzz64Eo0QVbpqzH9pqdL7fCZTQN8jv8BQ6WwAL0sdaHdk4d6ovOD6olWZZS4
         kRkkgIG7Id5Rp4S6Zw8jFYUWLjdnnFvoAlHMCqIZN98v18LRRJ6CLOECRJcRHxLDcUwC
         i3l4yeMP3CrA6w1fxpRTDS+/Ajuak7mnDy5NC0lpQtuUyKmzZ6n76XBy1GdQtxCNH3tg
         fpb8dSTZVNQ+npawaWG8Fd+C83TFYlBpuvBo3F5llk3HD4SjFbwR5+oHBoov9le30Wol
         na6A==
X-Gm-Message-State: AOAM531VVer6ey7iNmAwos2HmUV5u5CWnekU9cPRt8iU6Zb3mikIz1NP
        bggfthEoiEcNddGX81aKXO/6y8v++Jv9pmWZFtpmcQ==
X-Google-Smtp-Source: ABdhPJzSNk80lnrBVcuYP4V+w1nHhwz1Ie3L1AtkPrH6ifGh3LGV8SAv6XYOhih3pyXiAA4owq1THkoDpaHusC5K8QY=
X-Received: by 2002:a17:906:f8d5:: with SMTP id lh21mr20719971ejb.64.1615303125559;
 Tue, 09 Mar 2021 07:18:45 -0800 (PST)
MIME-Version: 1.0
References: <20210309132639.29069-1-brgl@bgdev.pl> <20210309132639.29069-7-brgl@bgdev.pl>
 <YEePMkDDZA2Jxurr@smile.fi.intel.com>
In-Reply-To: <YEePMkDDZA2Jxurr@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 9 Mar 2021 16:18:34 +0100
Message-ID: <CAMRc=MdmdsQ=gPkOJdcV7OCkvXww6oNx0zgEQM+XYccxpLKLiw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 6/6] core: hide the GPIOD_API symbol
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 4:07 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Mar 09, 2021 at 02:26:39PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > GPIOD_API is unneccesarily polluting the user-facing headers. There's no
> > advantage to having it in public files. Let's make them internal to the
> > library. Upcoming modifications will also make GPIOD_BIT() redundant so
> > we'll be able to remove all macros unrelated to the main functionality
> > from gpiod.h.
>
> > -libgpiodcxx_la_SOURCES = chip.cpp iter.cpp line.cpp line_bulk.cpp
> > +libgpiodcxx_la_SOURCES = chip.cpp internal.h iter.cpp line.cpp line_bulk.cpp
>
> Don't we have something like _HEADERS ?
>

_HEADERS is for headers that are installed. Headers for internal use
should be defined as part of sources in autotools.

> ...
>
> > +#include "internal.hpp"
>
> I forgot C++ approximately when I tried it first time :-)
> But I'm confused between this and above file name. Do we have *.h and *.hpp
> with the same name?
>

Yes, internal.h is used by the core C library and lives in lib/,
internal.hpp is for C++ (it will grow because we'll have to share some
symbols between classes in the future with the new API) and lives in
bindings/cxx/.

Bart

> ...
>
> > -libgpiod_la_SOURCES = core.c helpers.c misc.c uapi/gpio.h
> > +libgpiod_la_SOURCES = core.c helpers.c internal.h misc.c uapi/gpio.h
>
> As above.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4660D2F18AC
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 15:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbhAKOtb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 09:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbhAKOtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 09:49:31 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85559C061794
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 06:48:50 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id c7so19074428edv.6
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 06:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X6tdCKto1G6o6iDKf5iwoDBGp8ivvffSHXL5ugy1NWE=;
        b=oKnZmubgjmbNVtOb9bHYtt41r7i4zTAG03FYfkSnZyd7WTyb5np1yHu+l9wk6BkpA5
         06XYjBaIA73M0Obu50KFlX4Xl1nFJpnQJdwxoUUaVrgCv25di9KTfmXOjUZcq2yCiEnl
         YE70CaDRpUneBca02zdtYu/pRP4yBjK8N5eqSwx+/lFEe1DtOz23gLNvQ+t50qDurXxB
         +zjci80965QyrbkD0k3BRcLqv/zF3rTslYAYcDH4H4yBjoaH+r0t/2YohCpePiqwDMLD
         zzoZy8adedhYehmo6kFbOar1iUsq/KpzBU/z9IRH7Tpptyzv3+z+8/5dYcDoxMvhm+C0
         9iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X6tdCKto1G6o6iDKf5iwoDBGp8ivvffSHXL5ugy1NWE=;
        b=dyxX5kVVCS7CG6vGQ1gxTdNOYHDUEXY8sN/qHZpiJ0RInUBI2X9JWMeFUyiarhrNU1
         xFnz9j8hqSv0U46VyqZBNlYB5xAF6jL6Xe6fPMfQbm//zZD7S+2TIKz2YU77ZWbo/9b7
         wi/tl+4SARtpEC/pbmw6DIUZyMK5o8EriiioH+nEPDwBTA2G3/PnTkc0YRQpwEpX/8d9
         wjq5w9ce75SNFcgOTDyrX9+1rK3XWpvaZoWtNpfT1aDYNjxkgX/RzSNFljz9mg4lxrV0
         R0t92/rya+jAFb0ZyH8sr3ph4SbKCUX/CPknSKTfaT0EbWtF+VVBTSbFZK9QAiK44ifZ
         x9zA==
X-Gm-Message-State: AOAM530hn4c5ljGc7gOAsiGLJRwGZUH1Tw1rX3/u2XpRQzzANdVkWsFN
        mU1UPFL2dsWelqeqbRtohWyCN9nuUOIdUiF1hr2nmQ==
X-Google-Smtp-Source: ABdhPJzA5bkob3nenMs+OffUikD7tIi0aduIz7/eXSUjAZ3meub0znvzOY7/zOsouqvFMRsRs7UQzbEJxGbXiwEJoqU=
X-Received: by 2002:aa7:d485:: with SMTP id b5mr13840443edr.214.1610376529301;
 Mon, 11 Jan 2021 06:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20210111133426.22040-1-brgl@bgdev.pl> <20210111133426.22040-5-brgl@bgdev.pl>
 <20210111143951.GB1036910@sol>
In-Reply-To: <20210111143951.GB1036910@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Jan 2021 15:48:38 +0100
Message-ID: <CAMRc=Mcr-8Cts29bTREvZa-BAjKTDdxXLGQqA4ZLam0APV13Kg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 4/6] treewide: make drive settings an enum
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 3:39 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Jan 11, 2021 at 02:34:24PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Open-source and open-drain drive settings are mutually exclusive just like
> > the bias settings. Make them into an enum so that becomes clear.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  bindings/cxx/gpiod.hpp                 | 24 +++++----
> >  bindings/cxx/line.cpp                  | 18 +++----
> >  bindings/cxx/tests/tests-line.cpp      | 45 ++++++----------
> >  bindings/python/gpiodmodule.c          | 73 ++++++++++++++------------
> >  bindings/python/tests/gpiod_py_test.py | 18 +++----
> >  include/gpiod.h                        | 26 +++++----
> >  lib/core.c                             | 12 ++---
> >  tests/tests-line.c                     | 36 ++++++-------
> >  tools/gpioinfo.c                       | 14 ++++-
> >  9 files changed, 134 insertions(+), 132 deletions(-)
> >
> > diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
> > index fb675fc..f9c341d 100644
> > --- a/bindings/cxx/gpiod.hpp
> > +++ b/bindings/cxx/gpiod.hpp
> > @@ -332,16 +332,10 @@ public:
> >       GPIOD_API bool is_used(void) const;
> >
> >       /**
> > -      * @brief Check if this line represents an open-drain GPIO.
> > -      * @return True if the line is an open-drain GPIO, false otherwise.
> > +      * @brief Get current drive setting of this line.
> > +      * @return Current drive setting.
> >        */
> > -     GPIOD_API bool is_open_drain(void) const;
> > -
> > -     /**
> > -      * @brief Check if this line represents an open-source GPIO.
> > -      * @return True if the line is an open-source GPIO, false otherwise.
> > -      */
> > -     GPIOD_API bool is_open_source(void) const;
> > +     GPIOD_API int drive(void) const;
> >
> >       /**
> >        * @brief Request this line.
> > @@ -482,6 +476,18 @@ public:
> >               /**< Line's direction setting is output. */
> >       };
> >
> > +     /**
> > +      * @brief Possible drive settings.
> > +      */
> > +     enum : int {
> > +             DRIVE_NONE = 1,
> > +             /**< Drive setting is unknown. */
>
> Unlike bias, the drive setting is never unknown - if zero the pin is
> assumed push-pull.
>
> And to me DRIVE_NONE implies a high impedance state.
>

Indeed, I'll change it to DRIVE_PUSH_PULL then.

Bart

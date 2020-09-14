Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13892268FAE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 17:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgINPXq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 11:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgINPXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 11:23:01 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2DFC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:23:00 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id c196so13061596pfc.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/zLup74T58O8nXigE3BEKwB3Doz9iT2G+vwrLy4TvBg=;
        b=cPWAIAEsnq5jF5UAyI4eU9RfViXqMSryTCvjERtdmLVZvjdKnWV6nEpbWcQw/UMUPo
         aCDahkMKOalU1CsZ1dQwWUYLNh9UOBaya9pWHGBk5TaPB/938iWmgvDTDiXDMbkRL6H6
         igGznjUjzSWn/nbp3jg9Ra033FR+6WQCF+LbcjZiUeWpGJAebJKhBFj5Yrr9zdvfeX88
         syhE3h2qhOFDup79GP/MF+ZzifLfNkJBTEOoCYIa69Ky4Tm3ukE0CxNZr8ZPffqvBLAT
         u3J5dEskeT6D5KGet09Dn6+EhvmG5YFCyRE7zObd8AwbAA+PJZRRQYszoWs8aH3i+TPh
         g4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/zLup74T58O8nXigE3BEKwB3Doz9iT2G+vwrLy4TvBg=;
        b=U+cf0sY3dDVmeQXXrFVuaozh6EuJu7nG3SbxSvxrjOT3X3De6kpIJmEh4+ca6X5PKf
         3QhjGaAcIlr5fB+3pxzK0aa5nAbO8PYSb21fCCFIwCdgnMPJ0CwANJ6ZfgbiOdrqHZNt
         uX1h/a3GZob6Y7cAZrM1I0tEhzSShofPIb3g39ydyqoiCf6Kc2M6M0stVVWOIDr6BHRl
         HNfDCJU6A3o/169vafi6p6gvpALiW3U++AxRlsaVwgmSzNrCFdVigIgahOOmF8KgKs/I
         RgabhD6vwdhnW3I6it/rSoo3/S89KaXNBe0nFuTlOBhoZ6LKnDVGamI0GCcNP+8c9X5k
         /EtQ==
X-Gm-Message-State: AOAM533e8RQhQ7ewembSUE22qa8X4VTTPJIISGsiS/HJibWe9zQgKX4d
        z5xSIv6W8G4YKl5aR5BnQur6/7QRZjqOn2jITdEl00zEEbrY3A==
X-Google-Smtp-Source: ABdhPJxrxqnlVEvlydkV8gr0DOSUqoNUGOTC1rstvoJA82sQSBI7fLZsTiFk9zo1DPsML2HRsvbArz0HTCxZcLZHbw8=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr10888660pgj.74.1600096980380;
 Mon, 14 Sep 2020 08:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200912081105.1615496-1-warthog618@gmail.com>
 <20200912081105.1615496-3-warthog618@gmail.com> <CAMpxmJWM4UZ2iDO047-H7sMeCR0BD2exmiMFo3=eF1UmYJZkQA@mail.gmail.com>
 <CAHp75VeFWQCkeXne+7i2FEUNy97yjPiMwsQqkm7mqhtXiGac7A@mail.gmail.com> <CAMpxmJUHcFsoREWoqqS5y7ZhOm=KqquJ0LDkUj7C2ZvtmTps9w@mail.gmail.com>
In-Reply-To: <CAMpxmJUHcFsoREWoqqS5y7ZhOm=KqquJ0LDkUj7C2ZvtmTps9w@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 18:22:42 +0300
Message-ID: <CAHp75VctD2B6thMatpEAM8N4z06=D_JbES0Dt5gPxgB==79ZMQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 2/2] core: fix reading subset of available events
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 6:20 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Mon, Sep 14, 2020 at 5:16 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Sep 14, 2020 at 11:16 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > On Sat, Sep 12, 2020 at 10:11 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > > > Fixes: 44921ecc9a00 (core: provide functions for reading multiple
> > > > line events at once)
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> >
> > > Will apply shortly and backport it to stable branches too.
> >
> > Please note that
> >  - Fixes (or actually any tag) should be one per line
> >  - no blank lines in the tag block
> >
>
> Kent: no need to resend this, I fixed it when applying, but yeah for
> the future it's true.

JFYI: I'm about to look at v8 patch 4 of uAPI v2 series.

-- 
With Best Regards,
Andy Shevchenko

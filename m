Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6703F30A3E6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 10:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhBAI7s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 03:59:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbhBAI7r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 03:59:47 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F89C061573
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 00:59:07 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id s11so17943581edd.5
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 00:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YO7mBFE+tnPFG3MuqP+RM+WeWF+bBTQ2zr7iiZtekbQ=;
        b=RSP/ixQYEtW3D0MCcu+tNTgMGsf2IwC2u33UCCMgjKlXvTI4wzttUmK6LoKgsojdIm
         bm0XLDdxE/xjRG3ZGUXzsWz2S5U2EfjqVqCYP4AwUV/6XCL/WDIKavosiRMHNND1NZSB
         dW5ErpSx/7KGPHwQTE3mnVHWHe3eHAbfl0ZQV3i+wQCxgO7f/qq/aIv67gN1T54Ua0ge
         PIMJLSbDPtpxEPYDwTlajukWWE4zyzSY9FnG+TjfTJAb2KgnSUzpyEWW8yj437Xk7KT8
         a2LJqyRk4i/DN0vRWAQi8fAXl9Kh2bxbaoWUsuUCkzEGGNwTsuhT8240foGgp6Gilk3D
         kThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YO7mBFE+tnPFG3MuqP+RM+WeWF+bBTQ2zr7iiZtekbQ=;
        b=Yr7hbay0je1w4Ig/0FGvfDBB8pJrxAvfTqJg+i6fDNgitPe8LdI92D5/BwKRRuh2OT
         DR6qMnhFSMLBdp6t+qHIDHOjtNSVX7v4aCLpFpPxzPC3wQT8TfVc4HOr6aruFXvjZ7vs
         dGfFcOE8nkIyWzMG8Esri3goYKGSakdDoMC4tX5wOFKWYf2K0ZqFMTVVzaV+QeKsJD1T
         CN5Pex1Pdksmi0wPu0+MEIJgCocfuBvs/Lx+jelb7a4aHo/RjcCZAS5aEnLcU9WDCsEt
         R7ijkBnzbTRzNd+KGq9tLEaMv4uI9a4HsyDJAmUhJ4MVBlX+ONUG0Gs0oTAJSUAlMC/r
         i91A==
X-Gm-Message-State: AOAM5311L6Db14WQULNSyzXDMG6BUgtPYeFRS7amR+k12t0px9uoXgvj
        TSWbOWB6iVs8ka+ws2SwJlS6pTXW90AdHO6c6GZycvD+cCw=
X-Google-Smtp-Source: ABdhPJxsUimNM1ukmldmIBP8S69QEICasyFTYbyT1ZQ+7qzmjRxlGlzUAQrBe0QQu1AvqU/n4owlss0KVc9KEFXpxPo=
X-Received: by 2002:a50:b742:: with SMTP id g60mr17477914ede.113.1612169945982;
 Mon, 01 Feb 2021 00:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20210105105914.13172-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUT8CEyJ1ERmLr443SuZgemFF40cDviSGwhYM7ZnN_b_g@mail.gmail.com> <20210127103919.GC928@ninjato>
In-Reply-To: <20210127103919.GC928@ninjato>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 1 Feb 2021 09:58:55 +0100
Message-ID: <CAMpxmJWKEHsdHAnQt-ozVPHDcjSPrTo3c7D8gGFiPvwrA8TzwQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: remove shadowed variable
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 27, 2021 at 11:39 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Jan 05, 2021 at 12:14:34PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Jan 5, 2021 at 12:00 PM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > After refactoring, we had two variables for the same thing. Remove the
> > > second declaration, one is enough here. Found by cppcheck.
> > >
> > > drivers/gpio/gpiolib.c:2551:17: warning: Local variable 'ret' shadows outer variable [shadowVariable]
> > >
> > > Fixes: d377f56f34f5 ("gpio: gpiolib: Normalize return code variable name")
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Ccing Linus & Bartosz
>

For some reason this is not on patchwork and I also don't have it in
my inbox, can you resend, please?

Bart

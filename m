Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C6F1E099E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388611AbgEYJFt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388182AbgEYJFt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:05:49 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2647FC061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:05:49 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m18so19929910ljo.5
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ULQ0C4Z8YG2DDBGrPOoLRiKZ8GIiUXMQgIJE2wsdX9U=;
        b=fatdWwToYQqxQ39058dHUjbr2e734cnwJtlLvWqTnEPGx47xhEVtC9ey3Pbg8eN1Gn
         liwptiU8gUqN0OKUKoYJn8nHv1ieiSHrVaLm9xHcF+mHwXahJ9l+PUO91XjXp2vZt3o6
         pnIJWNJTIF8H/3WBsRyxv0JTNTLAQLa5k/XyeoB6aifu+SCKPqOn3oY5LBAy9EulFFnp
         JmxVm6ERpk/uH3nX/gQEyU86vvFVYWSfbWFyJZIS73re6rhQMaUDBdw3ONtHYB9pGHkU
         rvyCPuJoC3zkWlm4VaWxcCx5pUQnTjJ2ggeU8k0I8DRyfz8gAq/ec7m9Np5uaH0f9vh/
         Sn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ULQ0C4Z8YG2DDBGrPOoLRiKZ8GIiUXMQgIJE2wsdX9U=;
        b=iJeqPYn6YxOqbzHJAXpYWFMC7zSO8G7q/NnXplRRc7iMPA6WSBPjYRE+1WpW76V+5X
         mJft1XE48fgaKW0bNsNwaOKQ7nYosKrGa9qf192EOjhLy/wSb6d+3gGrXDJ+yOwdZc1Q
         gThSuDileK799kWdTt+Zv92UZI73GzGJaj6w8KtJQPSnRJ8dHBOnHSm5wxtj749jmOab
         bV6N4hpsnO8QyvdtSTuVwO2KU4rIpcKOxm+akiHWTYYbWHP3Bsz6TnF2HxUINt5wULYF
         g/dO+ATZBPmfnSXKwsiWIwOOxkSHvpZI0qT1FBhR9Ep6RdTispIpirFKSeNYKRbti3s/
         MK4Q==
X-Gm-Message-State: AOAM5311OywhhwFpLijwo+44ajb5c+dBnV+JEmZam1ykwFHG/GCzNDHl
        Ldb2Ld9ISTE7G8GhsV9Rad8D49RFqwpGY1/z1EHorA==
X-Google-Smtp-Source: ABdhPJwvXVub1lKhMRE5xfouk0IV0hQodcZKcYvoyPn5kAg9Cj1rVP0qYhXcmdmw2R986sdTeYrmqyI63FJ3SdMk8ug=
X-Received: by 2002:a2e:8703:: with SMTP id m3mr14067583lji.286.1590397547673;
 Mon, 25 May 2020 02:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200519131233.59032-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200519131233.59032-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:05:37 +0200
Message-ID: <CACRpkdbBVg7JL2_2VTxC-WcH5nj9-Gi=h+fA8ZqRfGBxveZqTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] gpio: dwapb: Call acpi_gpiochip_free_interrupts()
 on GPIO chip de-registration
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 19, 2020 at 3:12 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Add missed acpi_gpiochip_free_interrupts() call when unregistering ports.
>
> While at it, drop extra check to call acpi_gpiochip_request_interrupts().
> There is no need to have an additional check to call
> acpi_gpiochip_request_interrupts(). Even without any interrupts available
> the registered ACPI Event handlers can be useful for debugging purposes.
>
> Fixes: e6cb3486f5a1 ("gpio: dwapb: add gpio-signaled acpi event support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Serge Semin <fancer.lancer@gmail.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> ---
> v3: appended tags (Serge)

All four patches applied, thanks!

Yours,
Linus Walleij

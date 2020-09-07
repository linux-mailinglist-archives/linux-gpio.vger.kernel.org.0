Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039C125F840
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 12:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgIGK3i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 06:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728947AbgIGK2R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 06:28:17 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E8EC061756
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 03:28:17 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p9so17535490ejf.6
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2020 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E+6kvSO+kGtFqzwSOsHYLQdHmE8ihK39UIVQKLTGAlE=;
        b=YKpxYuJtNjDEcMyhlLGRj0HX0hQkUXEqPjKuUoBXv/e3UDUS4Hln7rKvyvdJTkScwl
         k1rXYkIZAbO2UsMaPTxTaUrbbBWUu4R8sdHC0L1BG0mGaX4xk380OjSevy0ECUxykK/F
         W0r2qxkPzqjPoDdZ8gzABSBUnDIUQFXvKxYS4mab97WFlQCFfhbvkd4IVjnPhoWyKel2
         XD9I7vu5rWTXsRIKY4qpSRmj1lEfs+bqL5eIbLSlZkr5OCsU1EbDHMwj00krDCJyqj4O
         gmJBrn/Lyg7t/40d/iHFqrkkALM3z3AbVL2yVDPRt/STFncNY1w/mvM9VKLyly28uSNr
         Y8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E+6kvSO+kGtFqzwSOsHYLQdHmE8ihK39UIVQKLTGAlE=;
        b=pMU/MkB3Jc+9TDpkqcL8g34if1GVfdtbostLStfiAfcvQxAjmSQCvQEY1HXvbN+FY6
         OTqpmmE2Bal6XvYUBz9MNQjRDCuqjtdjrYoamoJfxFtFMwlYCl24r1vUtBtSap1xPnww
         7+JEzmoRYwnPhALD737+o37VTZPex/WPRY1hO0+jC/xqM0nIL34ju42/soamCk0oKkXp
         ua/RqgF7FRSjtWOz8TO8pCEBAQEjADoY7ofi8CMeyVXRaKaR5G6Y9FJSelB7Nj7Nry2I
         Oha5wj4bD1Y5gfDGqKUokxrTm5D/QbVlLGPLYZWgHx5Nb38wtVM1HsN+mOh6c6YmMGoH
         nJtg==
X-Gm-Message-State: AOAM533YqwiStOWUObnzzfYLMCSDclc98AYW+tUHXqPX8aaAH4EPMTck
        u/3NhmmyNhPE4ae4P8UyANUU349X99ozbmm6jSrvbw==
X-Google-Smtp-Source: ABdhPJwP4J3kM7zvzHGchdWRMUs1XHCPsNoozGebnZDrc/LmkHpUC8eNrTX90FFgDqlq6JBHy5dgtK4984ghibSDrvg=
X-Received: by 2002:a17:906:941a:: with SMTP id q26mr20103973ejx.496.1599474496010;
 Mon, 07 Sep 2020 03:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-4-brgl@bgdev.pl>
 <20200904163517.GW1891694@smile.fi.intel.com> <CAMpxmJWQsgV5WZrdPW3UUOVTEy1L6Y_rb7ThQK1QTRinmHSqWA@mail.gmail.com>
 <CAHp75VdOWdwT-e5ufsZ8MEH=YtdBgm1=TDKn3f8fJxXY4YKh9A@mail.gmail.com>
In-Reply-To: <CAHp75VdOWdwT-e5ufsZ8MEH=YtdBgm1=TDKn3f8fJxXY4YKh9A@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Sep 2020 12:28:05 +0200
Message-ID: <CAMpxmJXmY8oBpPue5v0wBvmjHkFGaUmzHScHoV-1pNEQ59am4w@mail.gmail.com>
Subject: Re: [PATCH 03/23] lib: uaccess: provide getline_from_user()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 12:19 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 7, 2020 at 1:05 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Fri, Sep 4, 2020 at 6:35 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Sep 04, 2020 at 05:45:27PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> > > Doesn't mm/util.c provides us something like this?
> > > strndup_user()?
> > >
> >
> > Yes, there's both strndup_user() as well as strncpy_from_user(). The
> > problem is that they rely on the strings being NULL-terminated. This
> > is not guaranteed for debugfs file_operations write callbacks. We need
> > some helper that takes the minimum of bytes provided by userspace and
> > the buffer size and figure out how many bytes to actually copy IMO.
>
> Wouldn't this [1] approach work?
>
> [1]: https://elixir.bootlin.com/linux/v5.9-rc3/source/arch/x86/kernel/cpu/mtrr/if.c#L93
>

Sure, but this is pretty much what I do in getline_from_user(). If
anything we should port mtrr_write() to using getline_from_user() once
it's available upstream, no?

Bart

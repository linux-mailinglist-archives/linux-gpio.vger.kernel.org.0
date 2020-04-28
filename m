Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CA11BBE9E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 15:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgD1NJR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 09:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726819AbgD1NJR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 09:09:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD864C03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:09:16 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id j3so21340480ljg.8
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6wGncaYo3LN/NQ0J5wn4KymE59fDMQLF7G38Kj4SR5I=;
        b=d5zYmSh/sLF8PRnCwJ5PFqFLmWs2hDLudcnmdg/fr4W5alWmrt88371fPhq7Jx20ei
         NRQ9YNvy5+fzMKoEX7L3GC0De0aGjGuv30GjtcBs+XnYaR6VsyJ5o3yHHXR2NShM/KBu
         yFa8nEFpAd3KAgPWXDpDBLXPnMNJ2c86xoEr1hF+UPaGCZ/qswhQ5ZmEtV1i6LaLIvoB
         +wdAvTlUbevn/+LZSECtajTFvcRk9U+BfFIdbGz6cAaKCcSgViuj3tHsoD268VBcVaXN
         8+VgTdEMZ6O+oUXNVaxSYCKWcFoIJYJA4HAdd0w/a+5ZqC17vfcOzepWF6rkA/C0JCnV
         QV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6wGncaYo3LN/NQ0J5wn4KymE59fDMQLF7G38Kj4SR5I=;
        b=Pqy8lA+a15mfo764qlDUaUII5gnPhkcALXbXs2GO9EwI9gviYcC2i2lfycLJkrBG5F
         OMeFtSJjUlGyjHDWu6eg3Z4T+dwgZsl0S4kAHGIfS/fdp0FhBsLHaAJNStKQ+uPpDyGx
         i4BhvA63zcwa8NwZ7CaX8+/tKv3m5TeWrkOu5HCwMsK6G5Yq0crN4mTKe2IVPHtdMrfX
         MQWLD5ZnMiTSeHpA83BKq7zTIIP21i8F6wprVqaHPLwL8TcM5yiIIqq238G8xPQVmR1T
         q1PdSDoVbXoU2KUt4+JGdDYL2E6mf7UWzFUlz6EhKwKEa/pT37gBKkfklEjDoLnaXGaI
         jRLA==
X-Gm-Message-State: AGi0PuZ/MT5YoQajzfzow5v478O/fcaYHxXZ5ABRfCglM+2J7px9orsC
        tPaokSWecGhiTDQX8p5/tAdkFhyfMKDgEX5bnSA=
X-Google-Smtp-Source: APiQypJqqFsPe8wwTx9/Es/1Ml+3jIa5oGIk/RbnpXluIyaMQ5c7oru7212HKUS3n7OcjkeRrH5nAjqBK3AVFLqNZ7Y=
X-Received: by 2002:a2e:6a08:: with SMTP id f8mr18392818ljc.8.1588079355163;
 Tue, 28 Apr 2020 06:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <20200421130300.GK185537@smile.fi.intel.com> <CAMpxmJVVDUN6ei__wt5z+hOJQ0w0r9TZjhN9HCtpCA8Vrud0qg@mail.gmail.com>
 <CACRpkdYDHiscnm0BrSTwG6=-SCWZeqVfnEEkMAeQcco77GM8kg@mail.gmail.com> <20200428124129.GR185537@smile.fi.intel.com>
In-Reply-To: <20200428124129.GR185537@smile.fi.intel.com>
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Tue, 28 Apr 2020 09:09:03 -0400
Message-ID: <CAD56B7cR9asgW-6PS7V+jZ8O7AYeYuH9egnF1G0uoQQaS9GhMA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 8:41 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 28, 2020 at 02:13:21PM +0200, Linus Walleij wrote:
> > On Tue, Apr 21, 2020 at 5:42 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > wt., 21 kwi 2020 o 15:03 Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> > > > On Mon, Apr 20, 2020 at 08:27:50PM +0300, Andy Shevchenko wrote:
>
> ...
>
> > I don't mind trying to put in code to optimize use cases
> > when accessing single bytes here either. But I'd like there
> > to be explicit comments in the code saying why these
> > optimizations are there. Can we do those on top of
> > this (hopefully) known working base?
For the record my original get_multiple patch was a known working base.

>
> As I pointed out to Paul, the optimization like he proposed is not bad th=
ing
> per se, the implementation is. On top of that I suggested to take a look =
to IRQ
> status bits, which presumable will leverage from this optimization as wel=
l.
>
> So, After applying this series it would be matter of change one line in t=
he
> ->get_multiple() to replace read_regs() with optimized version or so alon=
g with
> IRQ bits changes.

This new function would then at least need to be called with mask as
an additional argument right? Then the bitmap_replace() will set
everything regardless of if it was read, this is fine I suppose
because it doesn't matter if it's setting bits outside of mask. You
just have two loops one in the new function and one in
bitmap_replace(). If this is what people would like to see I can work
on it. I did look into the sparse reads and it seems as though regmap
has a gather_write, but not a gather_read and gather_write isn't in
regmap-i2c.c anyway.

-Paul

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01F53E0B2C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 20:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfJVSDN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 14:03:13 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34426 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbfJVSDN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 14:03:13 -0400
Received: by mail-ot1-f65.google.com with SMTP id m19so15039833otp.1;
        Tue, 22 Oct 2019 11:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ItjeopyPiKJpZ77ZcZWrSuAaklTz62gxnNhsCgncJs=;
        b=AflVT1wr4zBHpjziNPZCUa2UTPh2bKV0uLxNSxUlJaYbR4EYm18txMpjZwRx9mX9Tk
         YkUZpaLS2atrhDlOOkeQaEoEcSiiLhNkB8KkqXCUI2+OQC0c+PvGAb44u0JlXvRqWHHF
         +jfHmRVvEvIFEe9AKuOHoWlk8yOlNAKcrLsFt5E9v46Be+i3OrrdvJQBuL1I3OJLO3DB
         /SznM9GohyjdpZHJf0LhintaP/e1jbhn1QDOSPdpphW6PGnMWUOO1XsTn1sZrtp+uf1w
         2Uybl5auWCIuP8p3XcWuXwHtRHpEbPsyB3Qi0i5NSO61qI9rs2oKRV2hIvd8upSK8Iyp
         Kv+A==
X-Gm-Message-State: APjAAAU5XFiadRlc/PpUxpvLWrzaWcwb3cNQN/17htSVh3r42d5IUNhv
        6QEtmcxZ9mZ8y+0gVLm7MR81PsqN6XGLYZ20cvw=
X-Google-Smtp-Source: APXvYqzUWTtieH1+CaDR8gpTEnIElS3ketncNEVIBegQLyisAT9tHQA8kTmEGlDxAvIeN5653WjWxiyS3D2raysIFrU=
X-Received: by 2002:a05:6830:1685:: with SMTP id k5mr3871418otr.250.1571767391897;
 Tue, 22 Oct 2019 11:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com> <20191022172922.61232-11-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191022172922.61232-11-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Oct 2019 20:03:00 +0200
Message-ID: <CAMuHMdUUvVdg8w0evV4zjrqis9e9Jak_qTnkufYT5wQHUn9j-A@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpio: pca953x: Convert to use bitmap API
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Tue, Oct 22, 2019 at 7:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Instead of customized approach convert the driver to use bitmap API.
>
> Depends-on: 6e9c6674d1bf ("gpio: pca953x: utilize the for_each_set_clump8 macro")
> Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -9,8 +9,7 @@
>   */
>
>  #include <linux/acpi.h>
> -#include <linux/bits.h>
> -#include <linux/bitops.h>
> +#include <linux/bitmap.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> @@ -116,6 +115,7 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
>
>  #define MAX_BANK 5
>  #define BANK_SZ 8
> +#define MAX_LINE       (MAX_BANK * BANK_SZ)

Given (almost) everything is now bitmap (i.e. long [])-based, you might
as well increase MAX_BANK to a multiple of 4 or 8, e.g. 8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

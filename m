Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA4A3B4151
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 12:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhFYKTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 06:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbhFYKTa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 06:19:30 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E658AC061766
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 03:17:07 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id p133so3829438yba.11
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Aldb5boCCxep04PBntVMCCz9EWCiEULpp6xagZbzTQw=;
        b=aCiFlyyaydkh4N/1k5pyQ3fXGFQNuIb5wsfzWue8H/oXnENw5HZA/F60bZpDCb1+P6
         280MZurSlnHly2925MhBE2SzoGd1tK+vdQsWDCCoLC0jRIysCp8Wurk5fyTbEFkdzinV
         z7pYZ6GZL+EpblYEHNZVYBJXxE6FZVfJFdvsHkNCDE8XT7/xKleFp8VmQSLoAdiEosRT
         BwoHCRdHXFv8hRNtAYgI5clhS9uAoICDxNhUK29X5WzD72a8UNxYy6oEVYlFOIvkrk3o
         zkPR2BU9EZ5DevF+cidXqRv//+w/Hwc3jUbN36Lkn+sZzaXRMqG0NaPipywX7OYuYedH
         43DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aldb5boCCxep04PBntVMCCz9EWCiEULpp6xagZbzTQw=;
        b=iIUWaK7Bt8lStWS0hIWWmVKWgsLlXbYf6E2YwYLElw4uZLMIC/hJ55MYn2H1D9vl3c
         j5Y1L9sKgPWgQKr3N2Omr1CAvUhiYIRjpuyfDVeYwr9/0hKCWsqxnkdoPBaEB6eQtvtw
         yE0DAwD2sMWwlnFSlXba5C187GUx2ntNNMz1lpQxlZ/pdkR8UgZ+cVt59Jw3Zzv+7DZf
         wzFSWQtIrUrUR8gqxsjA+37PMl+rBw1HbS/s6sddExIVkUOG3Et2GhSQTuHUF4qtG64U
         gRkZ12zA6w45SoxdwaoEMX/9J+lV/yw4E8linSeUHjd3E1ydGlxlH5fMfcQaWDzwoW/4
         iMWA==
X-Gm-Message-State: AOAM533STGnXrfogOdC8PcdUg2+Xx+o9hLPSW4eHoJNVq3O4pds1y5/N
        PNzwr/Ot//drgo996x44ONrTA20dZo+OWQHA0cXjhw==
X-Google-Smtp-Source: ABdhPJzjvGHEk5dQZ2l+hmo51MGjY8KMmTyyy0KGGj5wgupaXWYKfo1Cf5UHKa6/uugqRknzWecRVXRlI5OFwbdUySo=
X-Received: by 2002:a25:ad5f:: with SMTP id l31mr11432241ybe.0.1624616227175;
 Fri, 25 Jun 2021 03:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210625103734.2f29630be607.Ied890c9ca650517103410e399ef509796653f5d3@changeid>
In-Reply-To: <20210625103734.2f29630be607.Ied890c9ca650517103410e399ef509796653f5d3@changeid>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 25 Jun 2021 12:16:56 +0200
Message-ID: <CAMpxmJWnh6RB98H_z5U3_x7J05GNwN8TW5=eiTj7QzPJRnuKuQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpio: AMD8111 and TQMX86 require HAS_IOPORT_MAP
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Baryshkov <dbaryshkov@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, linux-um@lists.infradead.org,
        Johannes Berg <johannes.berg@intel.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 10:37 AM Johannes Berg
<johannes@sipsolutions.net> wrote:
>
> From: Johannes Berg <johannes.berg@intel.com>
>
> Both of these drivers use ioport_map(), so they need to
> depend on HAS_IOPORT_MAP. Otherwise, they cannot be built
> even with COMPILE_TEST on architectures without an ioport
> implementation, such as ARCH=um.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>  drivers/gpio/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 1dd0ec6727fd..3c69b785cb79 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1383,6 +1383,7 @@ config GPIO_TPS68470
>  config GPIO_TQMX86
>         tristate "TQ-Systems QTMX86 GPIO"
>         depends on MFD_TQMX86 || COMPILE_TEST
> +       depends on HAS_IOPORT_MAP
>         select GPIOLIB_IRQCHIP
>         help
>           This driver supports GPIO on the TQMX86 IO controller.
> @@ -1450,6 +1451,7 @@ menu "PCI GPIO expanders"
>  config GPIO_AMD8111
>         tristate "AMD 8111 GPIO driver"
>         depends on X86 || COMPILE_TEST
> +       depends on HAS_IOPORT_MAP
>         help
>           The AMD 8111 south bridge contains 32 GPIO pins which can be used.
>
> --
> 2.31.1
>

Applied, thanks!

Bart

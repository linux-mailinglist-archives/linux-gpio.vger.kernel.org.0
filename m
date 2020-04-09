Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9004F1A35D9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbgDIO2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:28:34 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42545 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbgDIO2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Apr 2020 10:28:34 -0400
Received: by mail-lf1-f66.google.com with SMTP id s13so8044999lfb.9
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2020 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/DFqMg/9d5OZoJpezGLjo9V/b+56Y3THJiDRcavTxCQ=;
        b=ECCzfgNkS3E8TRfPqRHnWTCZ8qgrgYV+7Vpzp8+sJRL8pdVHlDqdE431mR6NXDcfNu
         4inBGNwmRiOKyqgISDYkHh+idi2n9BPwAmC8DxINRD1SpNBBpJrbbHafPHRS9fqcktbV
         1gI3JPeH+mRLcGGOGmtS5HLHrrpSM4vLyY4/3jL+QkOeO5PG6ZIOpCoXqsEtDmEIAXVN
         vQqpvhF6XKGkDHgX8OKRdFyT5znPaCD7Cmrc1QIMiJmcDomwmuiiBaLA/cARBrG7feOa
         Z671GpTngAvNcaZGZysRcDr153FLRYFWAXsjHFNV6S35LMsXaF8bty6WeRgHx2ibx6jQ
         r8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/DFqMg/9d5OZoJpezGLjo9V/b+56Y3THJiDRcavTxCQ=;
        b=HYroYNp3rptDfpGhGQAreYks2jZMSoKX6oDbTklrKTyiP8bGIlLBfpOaBvEMAibR2f
         wAxIml0NT3Na2p+j8G90lQrw6C68csBuSHJAE42DyfpYEebMVfFT882sP3BSr8Gd67I9
         FvZsQnR9VP7uIKE7GFs6QFgqAmO08w3rdn1VBhqDTmiYmCgpUHxPOPWU9zMbhAQyrVa5
         kdHgsI34YTDJi2b/RS+f6HP/Ri9kV0EjphuWXH1DK7XNlBAqWrDAVrYZKhkWE+dSWLgP
         2dInfOngtWF21ialrkFXD6oNhLxdx34tnwwhwUYVW2CuIrZqMqxlUfq6SCCvMdLc/bRb
         Tcmg==
X-Gm-Message-State: AGi0PubtN/ad/1QqvuTeXZ6iCt6n+VpRH8S/I4qbDBd/OIClxsNXHifC
        wPxbaSPz98PMTE6mVtpdWYIY3Qil
X-Google-Smtp-Source: APiQypILUcMuNSzGu/RARRXB0pxNXD43e+Apk8mYOtoBprWQ8pZsPB2GRHwTDACQziN7t31EViAzcQ==
X-Received: by 2002:a19:9141:: with SMTP id y1mr7814337lfj.168.1586442511772;
        Thu, 09 Apr 2020 07:28:31 -0700 (PDT)
Received: from mobilestation ([95.79.136.110])
        by smtp.gmail.com with ESMTPSA id h20sm15062640lji.103.2020.04.09.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 07:28:31 -0700 (PDT)
Date:   Thu, 9 Apr 2020 17:28:29 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 00/13] gpio: dwapb: Clean up the driver and a fix
Message-ID: <20200409142829.cyuxc36mjngwg2kw@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy

On Thu, Apr 09, 2020 at 05:12:15PM +0300, Andy Shevchenko wrote:
> It appears that GPIO DW APB driver wasn't touched for a long time. Here is
> the fix for long standing issue, i.e. missed module alias to make the driver
> be loaded automatically.
> 
> On top of above a lot small clean ups here and there.
> 
> The series based on the v3 by Serge Semin which he sent earlier.
> 
> Driver has been tested on Intel Galileo Gen2 with AT25 SPI EEPROM using it
> for a chip select.

Thanks for the series. I'll review it in one-two days and test it out on our
Baikal-T1-based hardware.

-Sergey

> 
> Andy Shevchenko (13):
>   gpio: dwapb: Append MODULE_ALIAS for platform driver
>   gpio: dwapb: Refactor IRQ handler
>   gpio: dwapb: set default handler to be handle_bad_irq()
>   gpio: dwapb: Deduplicate IRQ resource management
>   gpio: dwapb: Convert to use irqd_to_hwirq()
>   gpio: dwapb: Use device_get_match_data() to simplify code
>   gpio: dwapb: Convert to use IRQ core provided macros
>   gpio: dwapb: Switch to more usual pattern of RMW in
>     dwapb_gpio_set_debounce()
>   gpio: dwapb: Drop bogus BUG_ON()s
>   gpio: dwapb: Drop of_match_ptr() & ACPI_PTR() calls
>   gpio: dwapb: Split out dwapb_get_irq() helper
>   gpio: dwapb: Use positive conditional in dwapb_configure_irqs()
>   gpio: dwapb: Amend indentation in some cases
> 
>  drivers/gpio/gpio-dwapb.c | 205 +++++++++++++++-----------------------
>  1 file changed, 79 insertions(+), 126 deletions(-)
> 
> -- 
> 2.25.1
> 

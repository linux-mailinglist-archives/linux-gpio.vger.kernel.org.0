Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10E41A9E72
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 13:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409624AbgDOL4G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 07:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409617AbgDOL4B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 07:56:01 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE420C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 04:56:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id j3so2891413ljg.8
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 04:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ThQRICc5OXP3YfsYHpuU1KSyFzAUcmskO0ZXLUSWCFk=;
        b=tYKcvyIKYngOKt8jqfNLvdhLdXoLVWVlNpybZX0aODFqwWzjP+J843t3yT9YWXDNgE
         3DWgWx6SxhDZRTgakBualNv6Uc7AEFZauPdVXu7HoywIGh2+59/wyP71DoJ6kFizhv86
         nVmXYyG8sru7kqsWEP3QlFKNQgouXJtM5ODm8MLupzlrsE3yXvK6lngKKDTAulyAcchk
         z+y+IyBHNuD7KDaHcQ2pxqtdWblt4Ajjm4lr5P8qEuzBSN3gvjK7PGaFpwEg2jdH89TK
         OwlxxBEU0ZxoHsOB+9ig1o0iEB4DQPgQmJw+npufe8VyAxxIjOOtFA9P7Ji9fZFlsCAu
         /URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ThQRICc5OXP3YfsYHpuU1KSyFzAUcmskO0ZXLUSWCFk=;
        b=Im+AzAiElsRYg9ZlOLpQ3Kj3XgnPGH//igczXgjRcVYWIC9z3uIFs4u4ZPiskDkVIS
         fvkaJgWJ9H+ZuOSs12kGF+rgNfyQHb+VGIrijbcXE/Zm99ZMqvDJAHLqeHCyq7pEIumI
         gbCt0DKtbziaB4DKLeBa0NnJnpwyPdWMYj+0An/6px3rxvX7F9aI+8dfauPggxIK0+jt
         DkUeDHDlMpCnCboePYkjwe3P8JpxZC8WwKEXXNVmz54NRKN4BEdNQ48M8gke4iKqU3zU
         APnNlwdUT8ZvkYJxjjKL5tmq2EPIcAzbx25pJ7yB+AHyTtq+lr5geDeujiBBpcb2T7Ex
         1uSA==
X-Gm-Message-State: AGi0PuatSI7xOatmehPmqvlY2Cjx8JKQ8zdfpNf+2X7Ej/u2Mq2WajnG
        wwj7/Ji7oJzO2/krMEcdYZI=
X-Google-Smtp-Source: APiQypK9Qk2ZWa+hU8VzunEcqKtnBTDWwLwElnnmtTuIlgStEA8CZmJAIAmXJ9Znqll1LfrF/VHBIg==
X-Received: by 2002:a2e:914c:: with SMTP id q12mr3064473ljg.124.1586951759363;
        Wed, 15 Apr 2020 04:55:59 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id j8sm12504606lfk.88.2020.04.15.04.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 04:55:58 -0700 (PDT)
Date:   Wed, 15 Apr 2020 14:55:57 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 00/13] gpio: dwapb: Clean up the driver and a fix
Message-ID: <20200415115557.jhe5kwezgib7dvyn@mobilestation>
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

Thanks one more time for the series of nice cleanups. I've successfully
tested it on our board with Baikal-T1 SoC, which has two DW APB IP-cores
embedded with Ports A being configured as GPIOx32 and irqless GPIOx3.
So for the whole series
Tested-by: Serge Semin <fancer.lancer@gmail.com>

(Note since until my series is merged in to the kernel technically I'm not
the driver maintainer so I'll use the reviewers tag for now where it's
relevant.)

Regards,
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

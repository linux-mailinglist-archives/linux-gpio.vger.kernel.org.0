Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5455154E4D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2020 22:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgBFVrc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Feb 2020 16:47:32 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40552 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBFVrc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2020 16:47:32 -0500
Received: by mail-pf1-f194.google.com with SMTP id q8so128604pfh.7;
        Thu, 06 Feb 2020 13:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0++ty3KNqexXxUIh6o0w0NG3K1wrpafmFLgGyyqsx4w=;
        b=lCinl6OjAC1BsGy7Qc4HJiIKPaYyHIPkIDnBupbWgqlHYfqM8piZM7qOEWnL1GQE+y
         eJhq0y0zSN27JZA+iUYBu5TetOMK5dWhSE1SsqQ0y2G2ajhtYDoAsYTjQwa16Jt0FSda
         cm0JQVpsVzKW5p5aMnBfp77xakF2Ut6Z/W+RjRFmzzT2ylLres21qcil4e7VpKdpmaRp
         pXwG0VPizFP5UJG/v7RTZoVbdeX4rnJZxVi/wpgiT6xHtROZks4PNPQriq9dlzOpyZCV
         3YlVM0OFwe0H4FLmE33RqXUPupemCJSLk+ikzEfpnqLEf6uQ3GhYefwIWhztH1GLVz1N
         IJWQ==
X-Gm-Message-State: APjAAAW5o3aeT+PbZDLdsyNwVXiFTg9aR7js8cO26zteaOyBVLdvKVDA
        Bx3tJuL/wCPcIGk5mWuNCNJlRkJwCw==
X-Google-Smtp-Source: APXvYqxfJcovvxDOLT5By1ZcTbnBE5pz9dMGw5xHjf1hSoadJsP1jEbSfQ6mrwOeoburg7PHFcTRJA==
X-Received: by 2002:a63:306:: with SMTP id 6mr5937668pgd.337.1581025651303;
        Thu, 06 Feb 2020 13:47:31 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id v8sm331103pfn.172.2020.02.06.13.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 13:47:30 -0800 (PST)
Received: (nullmailer pid 3350 invoked by uid 1000);
        Thu, 06 Feb 2020 21:47:29 -0000
Date:   Thu, 6 Feb 2020 14:47:29 -0700
From:   Rob Herring <robh@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] gpio: Avoid kernel.h inclusion where it's possible
Message-ID: <20200206214729.GA30344@bogus>
References: <20200205134336.20197-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205134336.20197-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 05, 2020 at 03:43:36PM +0200, Andy Shevchenko wrote:
> Inclusion of kernel.h increases the mess with the header dependencies.
> Avoid kernel.h inclusion where it's possible.
> 
> Besides that, clean up a bit other inclusions inside GPIO subsystem headers.
> It includes:
>  - removal pin control bits (forward declaration and header) from linux/gpio.h
>  - removal of.h from asm-generic/gpio.h
>  - use of explicit headers in gpio/consumer.h
>  - add FIXME note with regard to gpio.h inclusion in of_gpio,h
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: Elaborate changes in the commit message (Bartosz)
>  include/asm-generic/gpio.h    | 4 ++--
>  include/linux/gpio.h          | 2 --
>  include/linux/gpio/consumer.h | 5 ++++-
>  include/linux/of_gpio.h       | 9 ++++++---
>  4 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index 19eadac415c4..aea9aee1f3e9 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -2,10 +2,8 @@
>  #ifndef _ASM_GENERIC_GPIO_H
>  #define _ASM_GENERIC_GPIO_H
>  
> -#include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/errno.h>
> -#include <linux/of.h>
>  
>  #ifdef CONFIG_GPIOLIB
>  
> @@ -140,6 +138,8 @@ static inline void gpio_unexport(unsigned gpio)
>  
>  #else	/* !CONFIG_GPIOLIB */
>  
> +#include <linux/kernel.h>
> +

I don't really think moving the includes inside #ifdef's is an 
improvment.

But I'll leave it to Linus.

Rob

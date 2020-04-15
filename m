Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEE71AA360
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 15:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504125AbgDONIT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 09:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2503977AbgDONHz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 09:07:55 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D962C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 06:07:55 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q22so3634205ljg.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=A/UFNrmRNXH4/WUROf2hpuHIegtRAu3sRJaGJ/b8qJo=;
        b=MAcRT+6IwyTUV8LbI+0ZKr0hVG186fBm3EaNhuk1Ngn+RiOetjTaWuLnUM3WScjsej
         JIAfHsMfLCYzL3UKic6a/0lRdzdoqCAYTVTslDkVtUow0wPsb6zUtcnUYf0RQvpKcSsg
         1HmTTG/CuwoMu34xeIOhKLC+ZUhZrUktE8fL8S1Igo6BRq4Xp0XPNPNTERRnIccZ+bSC
         Gjvy7EpQKJcs9rTFPGGuHBQ8aZoHIelYpu4rRXDyZiNBbgmRn5Ejnrmw75Oi49aRSQRm
         zz9uQ6QV2f7HgJZU37MmzpmvbGcedVqF6POBBHvzymeDDSZ9aJYAQAnYz7Tr60qfX1jD
         eeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=A/UFNrmRNXH4/WUROf2hpuHIegtRAu3sRJaGJ/b8qJo=;
        b=Cl9ybse9JriKeUpwH11fOorQIYCshef7ts0B8wZT710gQtuaCLEaznhR8cr8yq0x5E
         bdqSiVtU29SlOvuqi4OOs1zurSyqeA519MUuwZ7GEM4E8Y47LNcMFNToC+FqUk5cRbup
         oWyitt23uWX8/FYPueVJS9i/ge/oOF52StRoy/QZlpPeJ/YaKQSlywEsZwmgSbjR1UIj
         d/yk3l2YD/dO+RcpjwZk/t9vyBdWk0YFPUX4h1AE3aPCuek7BxXJQ+N4KL896Ahg/CJ/
         uSkOHiC0j0F30H0JvRzAe7dAiZ1XuKylsesKwbTdfgg6VsKs2xPu8Ge/yV5YmOrTNr2O
         5DYA==
X-Gm-Message-State: AGi0PubnB2KeRjfgOZPTIn/TZI5v3STrYGlIwLNeJOKwhraUXzyaSNvH
        //ra710JbQSSQkvj79yTl9c=
X-Google-Smtp-Source: APiQypLzdL4tUCp56qw8S6PJahaxBrTPC0rU/J5BeHlgmFsD8nWDmb/AOLYV8kW4H2C5MUE1Zdn3fw==
X-Received: by 2002:a2e:9256:: with SMTP id v22mr3203773ljg.286.1586956073571;
        Wed, 15 Apr 2020 06:07:53 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id y22sm8912117lfg.92.2020.04.15.06.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 06:07:52 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:07:51 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 10/13] gpio: dwapb: Drop of_match_ptr() & ACPI_PTR()
 calls
Message-ID: <20200415130751.sij2qh5g22uygzu2@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-11-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200409141228.49561-11-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:25PM +0300, Andy Shevchenko wrote:
> Since we always have a table of IDs compiled in, there is no use
> for of_match_ptr() nor ACPI_PTR() call. Besides that it brings
> a warning (depending on configuration):
> 
> .../gpio-dwapb.c:638:34: warning: ‘dwapb_of_match’ defined but not used [-Wunused-const-variable=]
>   638 | static const struct of_device_id dwapb_of_match[] = {
>       |                                  ^~~~~~~~~~~~~~
> 
> Get rid of them for good.

Looks good. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index c03d856be703..5b93967a4c96 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -805,8 +805,8 @@ static struct platform_driver dwapb_gpio_driver = {
>  	.driver		= {
>  		.name	= DWAPB_DRIVER_NAME,
>  		.pm	= &dwapb_gpio_pm_ops,
> -		.of_match_table = of_match_ptr(dwapb_of_match),
> -		.acpi_match_table = ACPI_PTR(dwapb_acpi_match),
> +		.of_match_table = dwapb_of_match,
> +		.acpi_match_table = dwapb_acpi_match,
>  	},
>  	.probe		= dwapb_gpio_probe,
>  	.remove		= dwapb_gpio_remove,
> -- 
> 2.25.1
> 

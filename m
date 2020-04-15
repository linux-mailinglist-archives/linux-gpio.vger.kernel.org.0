Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD851AA2E2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 15:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503350AbgDONAJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 09:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2897166AbgDONAF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 09:00:05 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7733EC061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 06:00:04 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u10so2537516lfo.8
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9pLSFlk93V9b2b/KoLOZUVv8vsfcQ1Fs1WwJnDmDMOQ=;
        b=hhAEP4fHMIgcsfxs2TzkAmjjeEbxwIUG0XtGIjPHCtJ7kVPeydIvaJBnijngNIbDmM
         29gbW/wx7OPxDLvx1e1fHAzmWrQkVXOjDfDA1R/JNIUJ5Q8MGwGmgzPWtZesxfTThKk6
         21SU7/z6RGpsQBcE4BDtUu4lMuAiyPsITzKaohrpB8KlwHYrh3CEc7lg9f+QlRDctqCx
         tty0Js4xWYphfsi2XJSdrP7mhItDLpBc718c4R2D4dW62oy/1HIKom3wrVcU81Ex24ax
         6XM//BCWGh3sYBv9xPuF8GHE/hU28IBWhXamLFPs/zNdPmJCF+C0kN0dIArfxIr+4vZv
         yaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9pLSFlk93V9b2b/KoLOZUVv8vsfcQ1Fs1WwJnDmDMOQ=;
        b=qTuuE7sgFMSZwq69XmCvIO0vwb1WA5BZ4SjS3YeEGyXuZADOemnwu1P/+ABu4aHyiq
         4jmW7+/w8IexXKePMBoRR25cSszAbAB324moScbldp96eaB4+wab5sXLlPPn9Td2Yoc+
         q+hqUisM+FWyZU7G3muOu6GVTUCUizKxEvlSaOdcTcjstC+YFWFYWT0xGtwqEdRiTWgG
         QrA+Ndy6gTBw/FtVqvmktzx5thC2g94DvLR+j/IckEKZFCUVJH9iO0pyc0AD2Ar7hDKy
         vX74u+hxk798zD1YM/SNzADvbFHQmWHKX0RgBALscmKyn2FLMGKcNjOPCYSPmKh3tipI
         P0Uw==
X-Gm-Message-State: AGi0PubQYj58xfBWEo3v3WHMDXcf2bsN4fWuSKuPOCFU2vbgSCrZ7X+E
        ETuSvk9/1INKdVDnYzKG2b4=
X-Google-Smtp-Source: APiQypLFU+xG7ML/vaq7bF/QNbC9LijnpXD1Xlm6OawLTj4Pxy+fpABUX7UEesWENiD1hDLmE7bCoA==
X-Received: by 2002:ac2:46c4:: with SMTP id p4mr3018627lfo.37.1586955602988;
        Wed, 15 Apr 2020 06:00:02 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id l18sm5193762lje.19.2020.04.15.06.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 06:00:02 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:00:00 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 08/13] gpio: dwapb: Switch to more usual pattern of
 RMW in dwapb_gpio_set_debounce()
Message-ID: <20200415130000.4zrylm4dlchit7sw@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-9-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:23PM +0300, Andy Shevchenko wrote:
> More usual pattern is to prepare value and then write it in a single place.
> Switch code in dwapb_gpio_set_debounce() to it.

Seems appropriate. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 916a42fea456..a15652ff9495 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -327,9 +327,10 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
>  
>  	val_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
>  	if (debounce)
> -		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb | mask);
> +		val_deb |= mask;
>  	else
> -		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb & ~mask);
> +		val_deb &= ~mask;
> +	dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb);
>  
>  	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  
> -- 
> 2.25.1
> 

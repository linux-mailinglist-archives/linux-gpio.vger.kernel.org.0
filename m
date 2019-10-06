Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80737CD25F
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 17:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfJFPIR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 11:08:17 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:36934 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfJFPIR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 11:08:17 -0400
Received: by mail-yb1-f193.google.com with SMTP id z125so3816135ybc.4;
        Sun, 06 Oct 2019 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L/3bXAMhH+NMl02E2HmiTYgs/jrbZvh1+VGy/pv/Uu4=;
        b=A/HtZGNKASObaRehA9OcjjBRSeAtpi4F6ziIrMchH412rKhTL5W4tpIP67/nHuQHV+
         wuDfh7O5e93k8mliYn1n4egN/Dqze6p1uj6F6wGiugSR2mCc/N6UYqPfc0UN1HK3n5pr
         Ij6F98HGEIPfaR4eDaaQLEJt0lZYNcetImUDufl2JSc8k1NkaRM6HIA0ZyNutWrn6AZj
         O8DNe6nAFiiACTiOSnE2y/Psjg6vgfJV/5MU1dJc4gaYU98WEJw+1ZDnLozgubzHiHNe
         NjCamTQImaXeYe4WvTuAKMUG5+d2ny0JiQyq3/E/YlWMeVcb3eUis7Gk94CfCd8Epusv
         zgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L/3bXAMhH+NMl02E2HmiTYgs/jrbZvh1+VGy/pv/Uu4=;
        b=MQsFWTDo0l/TBCW/f/WBpHIkuFcvoSst24jLNNB38vrxcEIWHHfBFmeu0c5+Kuz86u
         eEUY41SWhSyfz9uyMB0zi8kAbqegsqdgYqxAWesz77+Sk4Gn9t9/GlrrnOuOheYm9TDk
         m53qKMBc14Ks7mjqwDEq8b3sr9EQMNRA5wlf2ZuuIcQ6cuK8ctU5QhrYP8YVCOCr7xGi
         Bl/EmwKZyJenD2Ski63KxgsLpXLeEUGv4R+G106Ir5JWhHZ4lCpnJPGbVO99gIAdBTvK
         nX8m1tfa6TvktUiMR62p/wkB64PhY37GPC00Kvl+1+TGZJ+Nwn2GG2wMpoNBg9VIeXLS
         EXHw==
X-Gm-Message-State: APjAAAXpOPXHN/vdztTZRfHw/92KOS0xLniTS/iaHFng79fmRd/jqloU
        peDb3MCzsSyT6nGo5y1WGfQ=
X-Google-Smtp-Source: APXvYqwQ0LkvaQGAxA3mkt1Upbaiqmx2lXJuZg+G8EGDyVs9fWRTeF3gnxgsMn1rpvSMUgwATxHLSg==
X-Received: by 2002:a25:f50c:: with SMTP id a12mr8635437ybe.354.1570374494329;
        Sun, 06 Oct 2019 08:08:14 -0700 (PDT)
Received: from icarus (072-189-084-142.res.spectrum.com. [72.189.84.142])
        by smtp.gmail.com with ESMTPSA id m20sm3069324ywd.97.2019.10.06.08.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 08:08:13 -0700 (PDT)
Date:   Sun, 6 Oct 2019 11:07:59 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: 104-idi-48e: make array register_offset static,
 makes object smaller
Message-ID: <20191006150759.GA68457@icarus>
References: <20191006144256.23733-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191006144256.23733-1-colin.king@canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 06, 2019 at 03:42:56PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array register_offset on the stack but instead make it
> static. Makes the object code smaller by 63 bytes.  Also add the int type
> specifier to clean up a checkpatch warning.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    9212	   5712	   1408	  16332	   3fcc	drivers/gpio/gpio-104-idi-48.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    9085	   5776	   1408	  16269	   3f8d	drivers/gpio/gpio-104-idi-48.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpio/gpio-104-idi-48.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
> index ff53887bdaa8..c95c93ec0bd7 100644
> --- a/drivers/gpio/gpio-104-idi-48.c
> +++ b/drivers/gpio/gpio-104-idi-48.c
> @@ -65,7 +65,7 @@ static int idi_48_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
>  	unsigned i;
> -	const unsigned register_offset[6] = { 0, 1, 2, 4, 5, 6 };
> +	static const unsigned int register_offset[6] = { 0, 1, 2, 4, 5, 6 };
>  	unsigned base_offset;
>  	unsigned mask;
>  
> -- 
> 2.20.1

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

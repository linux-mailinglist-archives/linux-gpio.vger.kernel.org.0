Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB975116040
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2019 04:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfLHDnq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Dec 2019 22:43:46 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35196 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfLHDnq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Dec 2019 22:43:46 -0500
Received: by mail-pg1-f193.google.com with SMTP id l24so5352422pgk.2
        for <linux-gpio@vger.kernel.org>; Sat, 07 Dec 2019 19:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sWMtClNl8XwNKgQLggPkzKJERS5n6iPDCia4dn3R50w=;
        b=rbWooSisp6hgP51Y4NVm1IM0LYunQpQJB23NGGnmuXhFai0T7hZz/nFZCuT8sElY4b
         5vP4VSWmuwxTDBqvhUi+Y0Hx7T2/X4RScgTqmfnZ4L/1j5UHCe7bXK3HLIW8n+nyEjFQ
         Nx3bLhRUXXnvdXOI5jzYqaPwwLHTB2QtJCv8HOVRU1fjTpBAWOIYhXqTseojDP1paO4v
         wlkjZAqSpDlEMxp+bUBzcZsSm6b4NxQxFJdZlgN8WHqAjPqXg3wTlG7ppyGJniza93r9
         Ldp8Z+zM7iBVXFt2c4joZ0HAbf4O5VMG6jG8tD6PZKr8ABq/cZVhgEa3T32a8jL29K5G
         Z3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sWMtClNl8XwNKgQLggPkzKJERS5n6iPDCia4dn3R50w=;
        b=XcEM7qJKvFS/OhTVF2B8xgCuS+94Sn2nwamtSWAJuddHCMhYG5dURcdGVCVrH1DWeH
         KQJtCZLwIS4i2Cing55UOM5MYb6k5Ob1zrPtrD1+cGCHfx6J/afEyvE4VG+0VDmoJsPW
         IR8iW9S5irozp9J8MlZ/0EGrZdLDds2oVNVkEC6PKI6wz/TVIFurvUzM+DIkkzgAloUE
         pvdg6jBXoSQ6wEPgqZd5bXxgquKO5DqNRnj+ntE/BHeaV7Jb2wMoJ4H+e+KLFh9kVxAO
         3eTSnnfPredsDGYE0R/Vq7hBTkMD8Is6b4Rm7djUYkdGzDWcuvjP6a5mB1l7ZqXUfyIr
         XJlA==
X-Gm-Message-State: APjAAAXhWHWiRjOuBUY2QB70a4TGm5R0imoWa9H8JdAKiwSPjtoWiSLe
        yD5AGhC4RhcSFU7sP44yrsWyVfUS
X-Google-Smtp-Source: APXvYqwNNfPqYmmxrsETh0KM2KnNvsPM/eQhjwhYoGWm8zCXl0bXb+I3A//pPGXuCXcpK5lWLSXVCg==
X-Received: by 2002:a63:1c5e:: with SMTP id c30mr12387111pgm.30.1575776625796;
        Sat, 07 Dec 2019 19:43:45 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i13sm20418139pgr.48.2019.12.07.19.43.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2019 19:43:45 -0800 (PST)
Date:   Sun, 8 Dec 2019 11:43:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix up emulated open drain outputs
Message-ID: <20191208034340.GA9333@sol>
References: <E1idcoc-0004ni-4f@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1idcoc-0004ni-4f@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 07, 2019 at 04:20:18PM +0000, Russell King wrote:
> gpiolib has a corner case with open drain outputs that are emulated.
> When such outputs are outputting a logic 1, emulation will set the
> hardware to input mode, which will cause gpiod_get_direction() to
> report that it is in input mode. This is different from the behaviour
> with a true open-drain output.
> 
> Unify the semantics here.
> 
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/gpio/gpiolib.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 32c2048deb8c..70c60aac41cc 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -220,6 +220,14 @@ int gpiod_get_direction(struct gpio_desc *desc)
>  	chip = gpiod_to_chip(desc);
>  	offset = gpio_chip_hwgpio(desc);
>  
> +	/*
> +	 * Open drain emulation using input mode may incorrectly report
> +	 * input here, fix that up.
> +	 */
> +	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags) &&
> +	    test_bit(FLAG_IS_OUT, &desc->flags))
> +		return 0;
> +

What about the FLAG_OPEN_SOURCE case?

Kent.

>  	if (!chip->get_direction)
>  		return -ENOTSUPP;
>  
> -- 
> 2.20.1
> 

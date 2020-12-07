Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059EA2D13B0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 15:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgLGO3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 09:29:17 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35165 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgLGO3O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 09:29:14 -0500
Received: by mail-lj1-f193.google.com with SMTP id f11so3266031ljn.2;
        Mon, 07 Dec 2020 06:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oyG3xafNMDjBeHpTIfZ1CqSL3XaC5zJrd47UwVwp3Vc=;
        b=e4IjVz6wU26JdgXqKoymln+xYQE3ulqOVVZy+XNa+Ixp6HvUOP8mU7okOnqe0R25lt
         V/8QKYhF/QyWAmiQ6LShIY2L93/7Q6+Q+brP11DINT79WccLKZvGn/TfJ95L088TI+cY
         KIIavy0v8viDtBmxeACpaW4xF/CTrwuhwewdTCYv645nBrAzbKGqflwsYJko8dH5+cSQ
         K5HxfxM5FIpc8QcqJ3v+8C2h9m58ZCuKYqqupp4YGKwRuvcw23Gm69IPYasgO30GeqCU
         mXTx7q5mBVZbqLLeviyADPgmvV/PVU4qy6dmOz+NGkbGwrgove9zCvvgT/AO5YMykFeQ
         D8HA==
X-Gm-Message-State: AOAM532JybUIy13gOUpCuBFkZCFZ54f5VK+4M6fOZUbNelYQ2nK/89WC
        jIGP25vGZ32rzrVewNqO5Cc=
X-Google-Smtp-Source: ABdhPJweMD5isL/j9NGL6U2i6VJXDRPh6CRmvAZUUk8sDCLHT7DAuO5A3CouH5XiTmxY8qGlgeji6w==
X-Received: by 2002:a2e:858b:: with SMTP id b11mr8849727lji.90.1607351306392;
        Mon, 07 Dec 2020 06:28:26 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id q20sm3079742ljp.90.2020.12.07.06.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:28:25 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kmHVd-0002uS-BH; Mon, 07 Dec 2020 15:29:01 +0100
Date:   Mon, 7 Dec 2020 15:29:01 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 3/4] USB: serial: ftdi_sio: Log the CBUS GPIO validity
Message-ID: <X848LXNv3GRmmSXA@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <20201204164739.781812-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204164739.781812-4-maz@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 04, 2020 at 04:47:38PM +0000, Marc Zyngier wrote:
> The validity of the ftdi CBUS GPIO is pretty hidden so far,
> and finding out *why* some GPIOs don't work is sometimes
> hard to identify. So let's help the user by displaying the
> map of the CBUS pins that are valid for a GPIO.
> 
> Also, tell the user about the magic ftx-prog tool that can
> make GPIOs appear: https://github.com/richardeoin/ftx-prog
> 
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 13e575f16bcd..b9d3b33891fc 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -2012,6 +2012,15 @@ static int ftdi_gpio_init_valid_mask(struct gpio_chip *gc,
>  
>  	bitmap_complement(valid_mask, &map, ngpios);
>  
> +	if (bitmap_empty(valid_mask, ngpios))
> +		dev_warn(&port->dev, "No usable GPIO\n");

This isn't an error of any kind, and certainly not something that
deserves a warning in the system log on every probe. Not everyone cares
about the GPIO interface.

> +	else
> +		dev_info(&port->dev, "Enabling CBUS%*pbl for GPIO\n",
> +			 ngpios, valid_mask);

And while printing this mask has some worth I'm still reluctant to be
spamming the logs with it. Just like gpolib has a dev_dbg() for
registering chips, this should probably be demoted to KERN_DEBUG as
well.

> +
> +	if (!bitmap_full(valid_mask, ngpios))
> +		dev_warn_once(&port->dev, "Consider using a tool such as ftx-prog to enable GPIOs if required\n");
> +

And again, this is not something that belongs in the logs of just about
every system with an attached ftdi device.

While not possible to combine with the valid_mask approach, this is
something which we could otherwise add to the request() callback for the
first request that fails due to the mux configuration.

>  	return 0;
>  }

Johan

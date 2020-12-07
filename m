Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625642D1362
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 15:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgLGOQ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 09:16:58 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41776 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbgLGOQ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 09:16:58 -0500
Received: by mail-lf1-f65.google.com with SMTP id r24so18278150lfm.8;
        Mon, 07 Dec 2020 06:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=De8f5tX14bb8AEEyWxX1ChJ02+bhkDyPCHWdmOL4kMc=;
        b=qQ7+YOZlUSXWH/siW+RCSsAJzYYIJ7L2Jd2bK76yqxulELh3cEHkPFNcaj5kV3ebTB
         GY43VGsVvhh33U5H8wySP8JyaMrUrymQTcj0q7SehHE/aT2OxVyQpr9J0pqW/p5UfBsr
         Xz4v2rv5G0haaK0wDyXnzjo71tu2VuUNjq4b1QkVmv6YaKxxXKYUQSRr67Jy4+bMDUOO
         KtR9eThfDxV0qaxFnCs9omSAP7WLOWexImekPDAHgtYKlXn5vXtghtAantfiiTidEvbk
         doWM3u+93pwsUhNbJF9Hi0JvFpKN3OPKgHindtusch/fHAY0aDVFtGR3gDNr5j8n3EWM
         v55w==
X-Gm-Message-State: AOAM530PIwDU3qOp06H9uxCMKa2TLbs0kFQs78+f37jhw+zAsnlGMFFa
        QZfL0HWUdbbhCtLlB7uOEkU=
X-Google-Smtp-Source: ABdhPJwam/DokCF6LTWM7C91t/CQk0I8bWOaEkegl4L51Lb73wDreP7x6w5mcyhZX8BwjItXTXx1KQ==
X-Received: by 2002:a19:5ca:: with SMTP id 193mr2110713lff.375.1607350575796;
        Mon, 07 Dec 2020 06:16:15 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id c19sm2965326lfr.182.2020.12.07.06.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:16:14 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kmHJq-0002pK-Fu; Mon, 07 Dec 2020 15:16:50 +0100
Date:   Mon, 7 Dec 2020 15:16:50 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 1/4] gpiolib: cdev: Flag invalid GPIOs as used
Message-ID: <X845UohmzGM7+FPu@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <20201204164739.781812-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204164739.781812-2-maz@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 04, 2020 at 04:47:36PM +0000, Marc Zyngier wrote:
> When reporting the state of a GPIO to userspace, we never check
> for the actual validity of the line, meaning we report invalid
> lines as being usable. A subsequent request will fail though,
> which is an inconsistent behaviour from a userspace perspective.
> 
> Instead, let's check for the validity of the line and report it
> as used if it is invalid. This allows a tool such as gpioinfo
> to report something sensible:
> 
> gpiochip3 - 4 lines:
> 	line   0:      unnamed       unused   input  active-high
> 	line   1:      unnamed       kernel   input  active-high [used]
> 	line   2:      unnamed       kernel   input  active-high [used]
> 	line   3:      unnamed       unused   input  active-high
> 
> In this example, lines 1 and 2 are invalid, and cannot be used by
> userspace.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/gpio/gpiolib-cdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index e9faeaf65d14..a0fcb4ccaa02 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1910,6 +1910,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>  	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
>  	    test_bit(FLAG_EXPORT, &desc->flags) ||
>  	    test_bit(FLAG_SYSFS, &desc->flags) ||
> +	    !gpiochip_line_is_valid(gc, info->offset) ||
>  	    !ok_for_pinctrl)
>  		info->flags |= GPIO_V2_LINE_FLAG_USED;

So this is somewhat separate from the rest of the series in case it
applies also to gpio chips with reserved ranges (e.g.
"gpio-reserved-ranges" devicetree property). Are they currently reported
as available?

Looks like this will work well also for USB gpio controllers with static
muxing configured in EEPROM, especially as that is how we already report
pins reported as unavailable by pinctrl (i.e. ok_for_pinctrl).

Johan

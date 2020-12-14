Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E244C2D9544
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731709AbgLNJaH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:30:07 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34635 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgLNJaB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:30:01 -0500
Received: by mail-lf1-f65.google.com with SMTP id o19so2780151lfo.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hLtExAw8I0Po+S1qpcyK+BNbJjxxKyvPpcW6UMCiH9g=;
        b=rydZCg9mlrwx5TUyIS8cefP6rR4pfCqcF+9RVM4uNavtWbDIRWFug+Z2HUeFP0rkKP
         9enzggPXspZBTVw8Nsq/jbnpdzorFgKIX2TbVZxsyZDxQ3rfvSXetF3awHxFXuWfAL64
         Uzdy0UsqAzQq1RfTuZ81DpABD6+orSHEJxcnp7fKnopYMFd3OUHNSpfNC5WC2D0xNeo6
         IjLRN6AAMKPpetFLtsusgxLwpsf4Ms6LUYXUYmuw4wC1y95sqKFSnMqoPx9Fx4a7A7CM
         FX51W8l66enUp72jFs9+npc71WawRgHxbjhD91Wu2NP2mRRI2p6nlkGX7jVJAc/FvTFl
         80Iw==
X-Gm-Message-State: AOAM5311HPt0TUo88RGg+Kgc4NdviwnrgiXSdqEUdRf+FMD3ndtwU96a
        l4z1uIqp+vhgKj7mYrj9GwU=
X-Google-Smtp-Source: ABdhPJyOj6e3+8LK5ji+4AT9CZDoerB6u0OjHd5ErSimnZQ3f6tflJ72A6O0XQDjLX5oFpwYVIf9fA==
X-Received: by 2002:a2e:2f0f:: with SMTP id v15mr9753731ljv.402.1607938159265;
        Mon, 14 Dec 2020 01:29:19 -0800 (PST)
Received: from xi.terra (c-b3cbe455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.203.179])
        by smtp.gmail.com with ESMTPSA id b7sm2244241ljf.76.2020.12.14.01.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 01:29:18 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kokAM-0006ZN-F6; Mon, 14 Dec 2020 10:29:14 +0100
Date:   Mon, 14 Dec 2020 10:29:14 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: Disallow identical line names in the same chip
Message-ID: <X9cwahptmETQ5lkL@localhost>
References: <20201212003447.238474-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212003447.238474-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2020 at 01:34:47AM +0100, Linus Walleij wrote:
> We need to make this namespace hierarchical: at least do not
> allow two lines on the same chip to have the same name, this
> is just too much flexibility. If we name a line on a chip,
> name it uniquely on that chip.
> 
> I don't know what happens if we just apply this, I *hope* there
> are not a lot of systems out there breaking this simple and
> intuitive rule.
> 
> As a side effect, this makes the device tree naming code
> scream a bit if names are not globally unique.
> 
> I think there are not super-many device trees out there naming
> their lines so let's fix this before the problem becomes
> widespread.
> 
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This may be just the first step in tightening this up.
> Googling gives at hand that the colission warning doesn't
> happen much so we might go as far as to say the name can
> be required to be globally unique, but that creates a flat
> namespace so I don't know if that is desireable.
> ---
>  drivers/gpio/gpiolib.c | 34 ++++++++++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5ce0c14c637b..be4b3e9032b2 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -330,11 +330,9 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
>  
>  /*
>   * Take the names from gc->names and assign them to their GPIO descriptors.
> - * Warn if a name is already used for a GPIO line on a different GPIO chip.
>   *
> - * Note that:
> - *   1. Non-unique names are still accepted,
> - *   2. Name collisions within the same GPIO chip are not reported.
> + * - Fail if a name is already used for a GPIO line on the same chip.
> + * - Allow names to not be globally unique but warn about it.

As I mentioned earlier, the not-globally unique warning only makes sense
for cases where all names comes from something like devicetree, and we
shouldn't warn if we plug in two identical USB devices that provide
default line names.

Not sure it's even warranted to warn even if those default names collide
with the names provided in devicetree. Perhaps best to just drop the
flat-namespace assumption entirely and make sure gpiolib and the
userspace library can handle that.

Johan

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23CE2817D1
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 18:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgJBQYA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 12:24:00 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43485 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBQYA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 12:24:00 -0400
Received: by mail-ed1-f66.google.com with SMTP id dn5so2244793edb.10;
        Fri, 02 Oct 2020 09:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+MzJdC7AJYBNKP850flRQBqAg39526c7mEcoDXa1vc8=;
        b=W6AYcQXSj6ucI27Iry7nUl8m0KcdwMhvYJ3h3OtGNItARH9rlTLv2szvaLrDzvQISu
         O10V0pJNX5pcLteJqlLURROHmMrLQQbiXoLvaXKBRfeNr2RXdo6rT/hFNarMEjrgIXlD
         dGUHGkeulcE+y698KGQsa9ZsTtgB/YiHUAicDbPqv0kMm+xSofeE+iF/VLJ/LHOtg22y
         Ys/FkIj0RXlnV+/Ikwa3dkbt4vVNPhsOQMSBSUfnAjW2Dflj8cXxsKmJi7cKGVtOz/Jp
         34HoRDbzmQrTHGVPH76D4T7qsx84zhyqpmD1BybxzRK2HmA3xZb1znsAjq87hmii9oe0
         /oCg==
X-Gm-Message-State: AOAM532Aqnd+tKaCxWlsyVLIQb613WpO6ANOhksefNlMAng6fmyYJLTv
        2QOYhdtv95N4owtmVQyJp8w=
X-Google-Smtp-Source: ABdhPJwX7D85xx3iEoq/pMeJv9+pxrsyzjqmdtd89l7+FvbLqYa2SJikvg/hGqBR4vKxrCoYrmqIbg==
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr3222326edo.181.1601655837011;
        Fri, 02 Oct 2020 09:23:57 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id i7sm1604495ejo.22.2020.10.02.09.23.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:23:56 -0700 (PDT)
Date:   Fri, 2 Oct 2020 18:23:53 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v3 01/27] Input: Simplify with dev_err_probe()
Message-ID: <20201002162353.GA5870@kozik-lap>
References: <20200827185829.30096-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200827185829.30096-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 08:58:02PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v2:
> 1. Add review tags,
> 2. Fixes after review (see individual patches).
> 3. Two new patches - 26 and 27.
> 
> 

Hi Dmitry,

Any comments here? Some of these nicely simplify the code or remove some
lines.

Best regards,
Krzysztof

> Best regards,
> Krzysztof
> 
> 
> 
> Krzysztof Kozlowski (27):
>   Input: gpio_keys_polled - Simplify with dev_err_probe()
>   Input: gpio-vibra - Simplify with dev_err_probe()
>   Input: pwm-beeper - Simplify with dev_err_probe()
>   Input: pwm-vibra - Simplify with dev_err_probe()
>   Input: rotary_encoder - Simplify with dev_err_probe()
>   Input: elan_i2c - Simplify with dev_err_probe()
>   Input: bu21013_ts - Simplify with dev_err_probe()
>   Input: bu21029_ts - Simplify with dev_err_probe()
>   Input: chipone_icn8318 - Simplify with dev_err_probe()
>   Input: cy8ctma140 - Simplify with dev_err_probe()
>   Input: edf-ft5x06 - Simplify with dev_err_probe()
>   Input: ektf2127 - Simplify with dev_err_probe()
>   Input: elants_i2c - Simplify with dev_err_probe()
>   Input: goodix - Simplify with dev_err_probe()
>   Input: melfas_mip4 - Simplify with dev_err_probe()
>   Input: pixcir_i2c_ts - Simplify with dev_err_probe()
>   Input: raydium_i2c_ts - Simplify with dev_err_probe()
>   Input: resistive-adc-touch - Simplify with dev_err_probe()
>   Input: silead - Simplify with dev_err_probe()
>   Input: sis_i2c - Simplify with dev_err_probe()
>   Input: surface3_spi - Simplify with dev_err_probe()
>   Input: sx8643 - Simplify with dev_err_probe()
>   Input: bcm-keypad - Simplify with dev_err_probe()
>   gpio: Add devm_fwnode_gpiod_get_optional() helpers
>   Input: gpio_keys - Simplify with dev_err_probe()
>   Input: bu21013_ts - Use local 'client->dev' variable in probe()
>   Input: bu21029_ts - Use local 'client->dev' variable in probe()
> 
>  drivers/gpio/gpiolib-devres.c                 | 71 ++++++++++++++++++
>  drivers/input/keyboard/bcm-keypad.c           | 14 ++--
>  drivers/input/keyboard/gpio_keys.c            | 25 +++----
>  drivers/input/keyboard/gpio_keys_polled.c     |  8 +--
>  drivers/input/misc/gpio-vibra.c               | 20 ++----
>  drivers/input/misc/pwm-beeper.c               | 19 ++---
>  drivers/input/misc/pwm-vibra.c                | 20 ++----
>  drivers/input/misc/rotary_encoder.c           |  8 +--
>  drivers/input/mouse/elan_i2c_core.c           |  9 +--
>  drivers/input/touchscreen/bu21013_ts.c        | 72 ++++++++-----------
>  drivers/input/touchscreen/bu21029_ts.c        | 53 ++++++--------
>  drivers/input/touchscreen/chipone_icn8318.c   |  8 +--
>  drivers/input/touchscreen/cy8ctma140.c        |  8 +--
>  drivers/input/touchscreen/edt-ft5x06.c        | 10 +--
>  drivers/input/touchscreen/ektf2127.c          |  8 +--
>  drivers/input/touchscreen/elants_i2c.c        | 22 ++----
>  drivers/input/touchscreen/goodix.c            | 40 +++--------
>  drivers/input/touchscreen/melfas_mip4.c       |  9 +--
>  drivers/input/touchscreen/pixcir_i2c_ts.c     | 38 ++++------
>  drivers/input/touchscreen/raydium_i2c_ts.c    | 30 +++-----
>  .../input/touchscreen/resistive-adc-touch.c   |  8 +--
>  drivers/input/touchscreen/silead.c            |  8 +--
>  drivers/input/touchscreen/sis_i2c.c           | 20 ++----
>  drivers/input/touchscreen/surface3_spi.c      | 13 +---
>  drivers/input/touchscreen/sx8654.c            | 10 +--
>  include/linux/gpio/consumer.h                 | 30 ++++++++
>  26 files changed, 253 insertions(+), 328 deletions(-)
> 
> -- 
> 2.17.1
> 

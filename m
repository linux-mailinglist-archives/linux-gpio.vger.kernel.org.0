Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061517A2FE
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 10:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbfG3IRR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 04:17:17 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44731 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbfG3IRR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 04:17:17 -0400
Received: by mail-oi1-f194.google.com with SMTP id e189so47182853oib.11
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 01:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CNU8TS9u3/ubSDEXC8bYLt11vTX+jIiR3ccUu5xBq/s=;
        b=xn6TrcnJQW1843kXVkaivWSqaN6YpPuOoSGwYZH296NWOGCTIIFUhybEsgwhGezhj/
         JW8rx5mw3kap3WdICRseoi7PjJM75dSjB0Nz9wm9q63Krqsnlkc0a7J0mlGvPvEqp6KK
         kdNapt9bS6ofRieaQoz2o8+I7Ex7zVe+chFEKlZBN3rlxPzLAMZm7TSFuLXf/MYG0bzg
         5YPohWDxh6QreIXNahDV6kcvYSxG6RS+qCegWHydhnkykJbLHNNXLdkWE3Qd0H4Q1H8g
         4WAef36wkgJGMpHDKLpyC7H++2UMaCTsF4tp3CLNLXWhJQCkZjy1xq+i5XE+wP84aGct
         UX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CNU8TS9u3/ubSDEXC8bYLt11vTX+jIiR3ccUu5xBq/s=;
        b=Wv/AOGSAo6BMUlO3WNkOGuWX/yoSHVjfR53C05WWl/uDOzI4T+WCpwnaXdJYKG8rsh
         792KM1FVUKEYz19vG5iq16NjZUkyv/tfviai10WSJFNNG4DxX1QA2P6whV7a1hew3Fi0
         Uv3NCJQy77tKcJD/0x3vl6ff9F7eeHOlreZzmdc/1u5G31LlKXctW67kDU24QK1e8WT5
         Ze3TpaqsHHjb3bQBuIORzBMcKlvuYDK1noL3OGaFoSZDAtJr4djG0C/7/fweRCPkgEYc
         tc4JMxwluWiwhNJl6C91+PLCLkdZ1hDuBomO1RJX3AQeiXEW9b1vS7BvHfnICjgplsVm
         r+FA==
X-Gm-Message-State: APjAAAXLTYNajLaEvEP7Q8HOXx/NSj/B7H4jlsWdjCG+H4GDo7hGWa4S
        NRTKOZma+ZErh5ftXeLtnNxTmWV2264XEYKPrCrqqA==
X-Google-Smtp-Source: APXvYqzA9lnj0jchZGCMVFVje5J2e2ig9YqjWZigBEwtFQWTiBVjS1h0WVLyPMueKKXBH389khOeqr/AbFqXtSaX1Ig=
X-Received: by 2002:aca:b58b:: with SMTP id e133mr367236oif.147.1564474636495;
 Tue, 30 Jul 2019 01:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190729143730.18660-1-jcline@redhat.com>
In-Reply-To: <20190729143730.18660-1-jcline@redhat.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 30 Jul 2019 10:17:05 +0200
Message-ID: <CAMpxmJXanG_-Cet-VEg2=XHsZqCqqPJ9O8kUC+14u5-rr+ypkA@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: gpio: fix function links in the HTML docs
To:     Jeremy Cline <jcline@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 29 lip 2019 o 16:37 Jeremy Cline <jcline@redhat.com> napisa=C5=82(a):
>
> The shorthand [_data] and [devm_] cause the HTML documentation to not
> link to the function documentation properly. This expands the references
> to the complete function names with the exception of
> devm_gpiochip_remove() which was dropped by commit 48207d7595d2 ("gpio:
> drop devm_gpiochip_remove()").
>
> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> ---
> New in v2:
>   - Rebased onto v5.3-rc2
>
>  Documentation/driver-api/gpio/driver.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/dri=
ver-api/gpio/driver.rst
> index 921c71a3d683..906af220b164 100644
> --- a/Documentation/driver-api/gpio/driver.rst
> +++ b/Documentation/driver-api/gpio/driver.rst
> @@ -69,9 +69,9 @@ driver code:
>
>  The code implementing a gpio_chip should support multiple instances of t=
he
>  controller, preferably using the driver model. That code will configure =
each
> -gpio_chip and issue ``gpiochip_add[_data]()`` or ``devm_gpiochip_add_dat=
a()``.
> -Removing a GPIO controller should be rare; use ``[devm_]gpiochip_remove(=
)``
> -when it is unavoidable.
> +gpio_chip and issue gpiochip_add(), gpiochip_add_data(), or
> +devm_gpiochip_add_data().  Removing a GPIO controller should be rare; us=
e
> +gpiochip_remove() when it is unavoidable.
>
>  Often a gpio_chip is part of an instance-specific structure with states =
not
>  exposed by the GPIO interfaces, such as addressing, power management, an=
d more.
> @@ -418,11 +418,11 @@ symbol:
>
>  If there is a need to exclude certain GPIO lines from the IRQ domain han=
dled by
>  these helpers, we can set .irq.need_valid_mask of the gpiochip before
> -``[devm_]gpiochip_add_data()`` is called. This allocates an .irq.valid_m=
ask with as
> -many bits set as there are GPIO lines in the chip, each bit representing=
 line
> -0..n-1. Drivers can exclude GPIO lines by clearing bits from this mask. =
The mask
> -must be filled in before gpiochip_irqchip_add() or gpiochip_irqchip_add_=
nested()
> -is called.
> +devm_gpiochip_add_data() or gpiochip_add_data() is called. This allocate=
s an
> +.irq.valid_mask with as many bits set as there are GPIO lines in the chi=
p, each
> +bit representing line 0..n-1. Drivers can exclude GPIO lines by clearing=
 bits
> +from this mask. The mask must be filled in before gpiochip_irqchip_add()=
 or
> +gpiochip_irqchip_add_nested() is called.
>
>  To use the helpers please keep the following in mind:
>
> --
> 2.21.0
>

Patch applied, thanks!

Bartosz

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A0D1A531A
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2020 19:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgDKRXa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Apr 2020 13:23:30 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35625 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbgDKRX3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Apr 2020 13:23:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id x18so1365517wrq.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2020 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=IENUKdV3r4iMlcVFVIzU9k/XHXmK+JhwttMkKQCFE4c=;
        b=VeZo7J5EpZU6R34YGYLNdxUW+AIN582hRgGwmK78/Rx5n0tVA0Ze6C7DprSSd9p3zT
         7GR4+oTJaZO9jDCVu82by5wgBSMk0JlpBOXARKtF16e0uVXbDluZ+mNw7SNMkHE0eUdP
         FuIVHrUDd2CgpZ9FPyc1PsSG3GyXSpT16oIzei/WL72ItzEcbPRL0QYlP0hRXqIAqVZP
         aO1zrFfIiTBhX3pAbndCbUQmJPgqJEC+i6cwX6QlhFvWpGYN81M8XxBw/W/EOWWjwtSe
         gf8Ikkqh9Rw69EmQe/r1zXdVTJmf3PAMHBsRGAI+nlhd7Mb4iSZ+dOSnVXx3buxJX3kj
         xzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=IENUKdV3r4iMlcVFVIzU9k/XHXmK+JhwttMkKQCFE4c=;
        b=ncb99a9MYnJYKQWKGGoJuIsDMbPKXLWTPX2Zs6IFERn6curEM0sM3N36UMX9QoLlE6
         gO5dF/uONFKMUmF/3EfEYwRyuVkjyv2US5/tpo91TXdQ6jH5dnHBDt5lP1IDRqzfLkDe
         jQtsuy9eW5tQpNhTirEHLV8KeanoECCuCQ8nKgk8e2UEzUfEDEwX7EF27VaIAsg29UZD
         n/jNSbs39HB04rNs0F+0FWuGoMP7JJKQHQaHhlCL0Avl5WjFC66yC6SJvljj3AbE6GPQ
         bKCVtEbW584tJn6ZHzZLY00zSKwWpt929YK0Tk5XXI0SEl26hmN9U3CXfjcAqjHmG5S9
         htwg==
X-Gm-Message-State: AGi0PuYvpK11Pj6L/uQTwQSLLkHvQrW8o78XLkFRe6BmJ2sWsidaodog
        n+4ZXK1ueQgPBYJew+5q1CHGsEKpPeo=
X-Google-Smtp-Source: APiQypL+YF6wgk8qzrfgP6hNRy6A41pZ5shD19zczNqw61/jwZy3zmAllz3iK/CauKCOd9eoiEQu4Q==
X-Received: by 2002:adf:fc92:: with SMTP id g18mr1046596wrr.10.1586625808188;
        Sat, 11 Apr 2020 10:23:28 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id a205sm3621474wmh.29.2020.04.11.10.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 10:23:27 -0700 (PDT)
References: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com> <20200411170356.1578031-3-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v1 2/2] pinctrl: meson: wire up the gpio_chip's set_config callback
In-reply-to: <20200411170356.1578031-3-martin.blumenstingl@googlemail.com>
Date:   Sat, 11 Apr 2020 19:23:26 +0200
Message-ID: <1jlfn2szqp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Sat 11 Apr 2020 at 19:03, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Use gpiochip_generic_config for the gpio_chip's set_config callback so
> GPIO flags like GPIO_PULL_UP or GPIO_PULL_DOWN can be used in the board
> .dts descriptions.
> This is required for some Meson8m2 boards where GPIO_BSD_EN provides the
> "MUTE" signal and requires enabling the internal pull-up resistor.

I think your addition makes sense but, FYI, there is another solution to
your problem that should already work as it is.

If the platform requires a pull-up, you could set the pinconf 'bias-pull-up'
property in dt in the pinctrl definition passed to the device using the gpio.

There is an example of that in meson-gx-libretech-pc.dtsi with the phy
irq pin.

>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 291f3078e7c7..079f8ee8d353 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -603,6 +603,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
>  	pc->chip.parent = pc->dev;
>  	pc->chip.request = gpiochip_generic_request;
>  	pc->chip.free = gpiochip_generic_free;
> +	pc->chip.set_config = gpiochip_generic_config;
>  	pc->chip.get_direction = meson_gpio_get_direction;
>  	pc->chip.direction_input = meson_gpio_direction_input;
>  	pc->chip.direction_output = meson_gpio_direction_output;


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA63E44552
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 18:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfFMQn1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 12:43:27 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34013 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730476AbfFMGmd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 02:42:33 -0400
Received: by mail-lf1-f65.google.com with SMTP id y198so14164047lfa.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 23:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qh1uEWluiWqtbtRKgMx/1lY6AHPu/gzYyIbyLQQfcNg=;
        b=G4nlF8j55Z7xLO9Eg1hQZgQZ1LZNpqAwi+NsuZbY9FhzzEy4ZaNxJSaivX0T8f/NEW
         2Q607vm5ss3+wbiZG3LsPnF/UaQsh2SF22Rf+Pr1W3db5gS/2wAqIIeeX1kwJTDz0Uv7
         oEddHXCbz+8S+9JE0uXaW6GbefoyeMEwVBUcTFjbDuWkpOgSrmsI3Cwi/vto432KRkpR
         s8NBJ2YpBYNFfAd5aIB+glfMRAxTkEhk7BuwJybk7c76iXSViuHzZhwTj8h3OjH0OJPY
         N6tmAC297PEIFLtvq35PQQxX/mLO/94rz9c+FzAgqfZtTF7LEVGI4jVKrCuxrFxR7dnQ
         pccg==
X-Gm-Message-State: APjAAAW9sKHRFh9cKPU2DBhpVCPzeyl+fQ0nZfQ13Ek0EzB/Z0L4S/z+
        Rc5mDqCuW3DSggl/W/8S9gCPXe/EKF7UqDczM58=
X-Google-Smtp-Source: APXvYqzHJ4bUSqIvcAihbE6NdusegMuUQFu+WR1aLAGAv8Zwibdmi4Fnuf65CB2gtWz3SAlUpmxqU/PB2Xp+X2Qr82g=
X-Received: by 2002:a19:4a49:: with SMTP id x70mr6143310lfa.151.1560408151391;
 Wed, 12 Jun 2019 23:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com> <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Jun 2019 08:42:17 +0200
Message-ID: <CAMuHMdWYxUOKPhXXe0CSQCO7cHC3QiqDA+AX7R7vyg8L9LZyJA@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio configuration
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Harish,

On Wed, Jun 12, 2019 at 9:57 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:
> Provides a new virtual gpio controller to configure the polarity
> of the gpio pins used by the userspace. When there is no kernel
> driver using the gpio pin, it becomes necessary for the userspace
> to configure the polarity of the gpio pin.
> This driver enables the userspace to directly use the gpio pin
> without worrying about the hardware level polarity configuration.
> Polarity configuration will be done by the virtual gpio controller
> based on device tree information
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpio/gpio-inverter.c
> @@ -0,0 +1,144 @@

> +struct gpio_inverter {
> +       struct gpio_chip gpiochip;
> +       int count;
> +       struct gpio_desc *gpios[0];

Please use [] instead of [0] for denoting a flexible array, else
gcc will not warn when it is no longer at the end of the struct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

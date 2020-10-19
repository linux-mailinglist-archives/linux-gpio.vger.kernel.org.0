Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1442922F7
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 09:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbgJSHaI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 03:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbgJSHaH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 03:30:07 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB030C061755
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 00:30:07 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id f21so7093603qko.5
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 00:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VCInhAihFUcCpT7knzBgZ6WU9Eh9FYnKZwNfURzaMMs=;
        b=dHxcpHMGJ1PAhEaksLz7FZvDQOLysBNLbNSuihHHruNZTn03gxWyFdXcTHQ2DDwNZR
         mQjE0nhOEaX5tJZZkQZS0yGqdRm98t67eDqwdd1+rIBh6uBlbLKsuEUDZa5hGKJ2Twy5
         a7jMqx3WEby9eKaY5YZyW+ItKFJueZ74CqRfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VCInhAihFUcCpT7knzBgZ6WU9Eh9FYnKZwNfURzaMMs=;
        b=QRrpyngVU4sAb0+xHOe7i5xJXUUvzYk98ka3dQIZmCZEfAEVzMUajiIyyI3PJ7yhZB
         n4kmkyXcz/egIBEIKkwcA6eARB/34gqebOlEpDLZC6utPro5lvX0/YKPzyTDIPasAamx
         akWiXImBUNZRg4//eABbXzFdLZrA0gJ8Aq555iXV9nlwEsyt6iWr45oBnNvFWGMyBP0l
         dRkyOqxZmLRBRb9O/dHjFYuMtNtBg0F017Vd06X6g0S/VHKPNk6rjmCkheBiqlvH8QSo
         n/QpVJAEcoaTDXcpsw1MZe+psptZUi+sub3hpvBOrK6BgQHmxOK4Ytv2Vgdf9nLjgT3e
         Z/Sg==
X-Gm-Message-State: AOAM533cbK2bHRjKHblxyoLKdo17v+NeF/i1SMfT3yxuvFrl5w22jvdJ
        nX3aJq9wNUAWXTl5e+BsL/vR3zz6TYhKn9+DvkY=
X-Google-Smtp-Source: ABdhPJw/IqE3LR106FT98SjcxaRDqwmMNgsw+032qhQPFInhOWVOU0mUQsS5kxQBPJ5GWZg0+3LYkurMiUUcs13u/4U=
X-Received: by 2002:a37:4a4d:: with SMTP id x74mr15107575qka.55.1603092606847;
 Mon, 19 Oct 2020 00:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 19 Oct 2020 07:29:54 +0000
Message-ID: <CACPK8Xdp16BJYpGOB9qmXjYDgU7s8eOAiYNDPniRwq3qnG8d5g@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tao Ren <rentao.bupt@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Billy,

On Mon, 19 Oct 2020 at 04:50, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> GPIO_T is mapped to the most significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_T is input only. All
> the other bits need to be 1 because GPIO_Q/R/S support both input and
> output modes.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

This is a very similar commit message to the one that Tao sent out, so
I thought for a moment that it was a duplicate patch. I can see now
that it's a different change.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")

Cheers,

Joel




> ---
>  drivers/gpio/gpio-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d07bf2c3f136..f24754b3f6d1 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1114,6 +1114,7 @@ static const struct aspeed_gpio_config ast2500_config =
>
>  static const struct aspeed_bank_props ast2600_bank_props[] = {
>         /*     input      output   */
> +       {4, 0xffffffff,  0x00ffffff}, /* Q/R/S/T */
>         {5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
>         {6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
>         { },
> --
> 2.17.1
>

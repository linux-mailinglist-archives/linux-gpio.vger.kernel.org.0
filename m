Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D29C41450B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 11:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234321AbhIVJZx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 05:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234233AbhIVJZt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 05:25:49 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72F0C061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:24:19 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id i132so7660423qke.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qQjS+YUNUrQvd5p8/QPjpYBhtl8QQcNn03ovFra/KVc=;
        b=hdQl6Jhv3nKZPrRqxUD2kabVRg98+lvqgn0CoqSwGnnrDujQzC69v6nON0dRjJfVec
         52e8QEZnDENir/5Twp754+5olSRwaYd0d5E/NnqVPxxjpekU2VL/Odg2EWucQDC3/zwZ
         GOIxWYwg42AitFyF696e21sf16kvS2qJAH6Tmk4y0gd2wig/p+DTZ2Nyh2ddnLuFPnvF
         pw1zBFHBP6s8LCkmIwy/WSMjvdSVi8OUdLSArKRpuafTBOy0bEPLl9SRuC0vBfL7iLKv
         PG4LJhWp+8brmA7zsWKrcgqOJxYHGIB4OKydFwYovbcsFc0C4zhQBuP3bplk6SoLP/VW
         opbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qQjS+YUNUrQvd5p8/QPjpYBhtl8QQcNn03ovFra/KVc=;
        b=rrWeN3FYYKiWBju2Jz3T33oognTKukZpWx9/UaY9Woj1hPHBnGsaHzMlTLL7oVVXZb
         VvR7NE2vFtgjOtfiPdNEB8L4HvVRshAT8h4d+rQzjBB3xZT8iaeBBnjYOf1XOk9/fWcl
         syaagEkVsg3tgz+ka0rdZVNW65HK+T45T5GkB7MqeBCqlGf7V1jVAimf1xAiWYzn3RP5
         VyOspRnfY7jLgdU+v1vEFdFhGprEQ53OVvpoQoD/d9Cp5IYDAKLrlAXj+aTBXQWz8BS/
         RQtabLOHy8AZDavGnSb3ipmaPWN++FXZX3TQL8Uiow4uiBqePma54jssSYvt9XO8eL+F
         iyTQ==
X-Gm-Message-State: AOAM532RKqghTqj7YfuUQEYigUn5wMVodHlW6b6giODSjyjzzdMTZNYW
        WZMimukyYv86IdVU1qOjliENEDArWXFxCQZjhGLrt9ijaNc=
X-Google-Smtp-Source: ABdhPJwLDef2xFFrYqwxuqRg5CszN9RklipON1tm1Qj57SF5l366b9nDgkBGGoz51etUG4uuzzrqW2ZyVSSBfmmG7JM=
X-Received: by 2002:a25:7146:: with SMTP id m67mr43571579ybc.353.1632302659089;
 Wed, 22 Sep 2021 02:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210907095525.24668-1-steven_lee@aspeedtech.com> <20210907095525.24668-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210907095525.24668-2-steven_lee@aspeedtech.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 11:24:08 +0200
Message-ID: <CAMpxmJVzAiZvg2xfUGgt5RqTyRbZggkxUTGZJod_5Tq2pzsS8g@mail.gmail.com>
Subject: Re: [PATCH -next v1 1/1] gpio: gpio-aspeed-sgpio: Fix wrong hwirq in
 irq handler.
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 7, 2021 at 11:55 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> The current hwirq is calculated based on the old GPIO pin order(input
> GPIO range is from 0 to ngpios - 1).
> It should be calculated based on the current GPIO input pin order(input
> GPIOs are 0, 2, 4, ..., (ngpios - 1) * 2).
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> index 10f303d15225..3d6ef37a7702 100644
> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -395,7 +395,7 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
>                 reg = ioread32(bank_reg(data, bank, reg_irq_status));
>
>                 for_each_set_bit(p, &reg, 32)
> -                       generic_handle_domain_irq(gc->irq.domain, i * 32 + p);
> +                       generic_handle_domain_irq(gc->irq.domain, i * 32 + p * 2);
>         }
>
>         chained_irq_exit(ic, desc);
> --
> 2.17.1
>

Applied for fixes, thanks!

Bart

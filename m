Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8701E43DEC9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 12:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhJ1K01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 06:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhJ1K00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 06:26:26 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE22C061570
        for <linux-gpio@vger.kernel.org>; Thu, 28 Oct 2021 03:24:00 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h7so23158032ede.8
        for <linux-gpio@vger.kernel.org>; Thu, 28 Oct 2021 03:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cqnzQlRgd3nrttZuWVKFyMEi0hf9eMQGkNhcFNOJXtI=;
        b=mF+/C32InA9Fh9HIHzJSMYv5F8c6X6/5xwwNGDh6399N3YfmbQSq10bOUelpoUUF0R
         5j4C2oixhYUJBL6I29ckxdjphUyfkOFqRyWB10qHmXBG/VVrTdsZNtWs+W7MsU795N6t
         N0+0sELQnCOMbp3+Gndb+L78de3MlJx7n6ENUFl9L8qDGkLZ8vmEUUvoCEMoR6IsG/ub
         9Z1nK829k5LyudBpqtywqnB4iMUDB/ocCO1RgruFMGnqxlIFCEyE7KtizPF14LAEyCYu
         rtG+aVx7gJH4LIOSS+dcvg9yPUpYwLyVMmaFiGMQB/iI5+kIzkl98I1NfEVMexUY8GEi
         KHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cqnzQlRgd3nrttZuWVKFyMEi0hf9eMQGkNhcFNOJXtI=;
        b=U6+w4uq+ZhXc5gFd5o+VlS2zSdojD/zDohwvJGxoCO3j1B66KhvR1GtJbMBKprpF/K
         zS7bonB6le9UcYDots920uiuWHYx8im1WKHLaBAfZc8SnokGcklYevClepqATMvWP91B
         A+92kt5ubRfgWdqCOnG71z2DzYFZ+LBtvvU0UbUnV89ThjqG1UWmLTD0EBG0QjHqJ4NR
         yTEQ66WAeHSsHd/2m28LMfX5s7Nd9wkUwB8SlCbKn9MC04BcQMSswRPXnDxSDX/GC8ZX
         Sdy5tz+j359u030B7/MwKpO56S9a7Q4hB3HC/ftvTIbEn2oqz882BYX5TKUOR7BBwFbv
         Ss9A==
X-Gm-Message-State: AOAM532HsxtNoHsoaALDkQfdrD2ZyMFfUngMjl2mcG46hkN45Hn1wtYX
        cgrwKDfJU6yPdyI2QRG1bpu7vBG8ci0uYYBIiV0=
X-Google-Smtp-Source: ABdhPJxEKkllzTDj+2Pb8bgvRpGNAlh4/8AY47XA5at6j+THOQQ0wbxEq8DEhcGc2OqWMVeAt5FSSvXhQr7ZI8qvWTs=
X-Received: by 2002:a17:906:a158:: with SMTP id bu24mr3921137ejb.356.1635416637984;
 Thu, 28 Oct 2021 03:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211028085243.34360-1-sander@svanheule.net>
In-Reply-To: <20211028085243.34360-1-sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 Oct 2021 13:23:05 +0300
Message-ID: <CAHp75VdafMtemORf3FvV-M4x7iJMxhCQrGSa17vJHrHuzQCqyg@mail.gmail.com>
Subject: Re: [PATCH] gpio: realtek-otto: fix GPIO line IRQ offset
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 28, 2021 at 11:52 AM Sander Vanheule <sander@svanheule.net> wrote:
>
> The irqchip uses one domain for all GPIO lines, so the line offset
> should be determined w.r.t. the first line of the first port, not the
> first line of the triggered port.
>
> Fixes: 0d82fb1127fb ("gpio: Add Realtek Otto GPIO support")

Not sure it fixes anything (it wasn't working from day 1), but in any
case the patch is good.

> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  drivers/gpio/gpio-realtek-otto.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
> index eeeb39bc171d..bd75401b549d 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -205,7 +205,7 @@ static void realtek_gpio_irq_handler(struct irq_desc *desc)
>                 status = realtek_gpio_read_isr(ctrl, lines_done / 8);
>                 port_pin_count = min(gc->ngpio - lines_done, 8U);
>                 for_each_set_bit(offset, &status, port_pin_count)
> -                       generic_handle_domain_irq(gc->irq.domain, offset);
> +                       generic_handle_domain_irq(gc->irq.domain, offset + lines_done);

Looking into these '/ 8', '8U' sounds to me that it may be a good idea
to switch to for_each_set_clump8(). But it's out of scope here.

>         }
>
>         chained_irq_exit(irq_chip, desc);
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko

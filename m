Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD68B332C21
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 17:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhCIQb6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 11:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbhCIQbh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 11:31:37 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC007C06174A;
        Tue,  9 Mar 2021 08:31:36 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id e6so9126140pgk.5;
        Tue, 09 Mar 2021 08:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qNWMgDx1a2f8chkmQG5Nz6MqqWyQFzDq2KVQ7C4Y9yw=;
        b=naQNBBHEpefklaoMfhy1yZypasulNnx/BYCbIt8bxLK8ZcpggdVED5BIiOakC1DKSe
         wtDnYfG7rLVMcVI0ipnYDqULVxhcGhA9LNNLpF+IzpTllXm1f6O3yl1GFm9dEW0l3HiG
         Ghp1YSleY/99jfPOga5N3Jfe6u8HVawRumj9xiCF2t02fgEYD9fjzHLwy4wz0u9coCaI
         MoESoYjhWg+WWwvu9r6o+byROlarz7wJNSY5MF756Lfp7NhGYKXh9RmJI9MsMlooTJja
         Tx/hE5SzI910l9o9tSzXb+OPNlz4SUa9yUSlMsm/n4SzYcTP9Q66Il2hWTDiUW5uUAwj
         LiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qNWMgDx1a2f8chkmQG5Nz6MqqWyQFzDq2KVQ7C4Y9yw=;
        b=ew/o317zTSmZmRN4K4s+1n9oRzpueu6R34dwDKi9UhZpom8FZTekJ06L9WXgFRwcsS
         mndYMZom5GdzrAsdZQ17phDZeh4WlI9QEYRHuntMwqrXyzPXqVTFMjiqJAV/0aGGLKO7
         ohkJaJyj5czF8isk6RYGKvviQJZsjs+apBHFFzF25PPSz7wXHUTzoQsnJxZdW8RdS7AY
         pL0AaK5YXif4zk/Mo9utTgnr90+VaOAXiZmLBhBH3ubiom2XqYI1aHs0zPHQmwG9K+BR
         lrWe1oKI/Lp5mOiwMsfb6CUt+KmRtX4zKcvjny4gPbRuhoVuMbgM6PsJePBEd9Uw2+5X
         4ljw==
X-Gm-Message-State: AOAM532BSMcoQiku81y/nU0JynI+DPNLqB2+Wgl7xwJm97iCmEJGMG6u
        4w50i6zbQw7mih28SW9HdWx38mxCu1y3cd48jW9MVx3qtQLLRg==
X-Google-Smtp-Source: ABdhPJy37LWu6GPML+naRrM1oXgoUf4DX4GZ3sZXMcx3M14bQXoXgtCryzOqorchlaRAMq4ri70tMoKeeEcv/pIFhL8=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr25256446pgq.203.1615307496320;
 Tue, 09 Mar 2021 08:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20210309101908.27688-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20210309101908.27688-1-srinivas.kandagatla@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Mar 2021 18:31:19 +0200
Message-ID: <CAHp75VcBc_pYVPw6A4tH0fqzWKtCT61a45tfN9ZrhuLee1VBUg@mail.gmail.com>
Subject: Re: [PATCH] gpio: wcd934x: Fix shift-out-of-bounds error
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>, amit.pundir@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 12:21 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> bit-mask for pins 0 to 4 is BIT(0) to BIT(4) however we ended up with BIT(n - 1)
> which is not right, and this was caught by below usban check

It would be nice to reduce below to ~2-3 (significant) lines.

> UBSAN: shift-out-of-bounds in /workspace/dev/linux/drivers/gpio/gpio-wcd934x.c:34:14
> qcom-q6v5-mss 4080000.remoteproc: failed to acquire pdc reset
> remoteproc remoteproc2: releasing 4080000.remoteproc
> shift exponent 4294967295 is too large for 64-bit type 'long unsigned int'
> CPU: 6 PID: 155 Comm: kworker/6:2 Not tainted 5.12.0-rc1-00045-g508b7280ec3d-dirty #1396
> Hardware name: Thundercomm Dragonboard 845c (DT)
>
> Call trace:
>  dump_backtrace+0x0/0x1c0
>  show_stack+0x18/0x68
>  dump_stack+0xd8/0x134
>  ubsan_epilogue+0x10/0x58
>  __ubsan_handle_shift_out_of_bounds+0xf8/0x168
>  wcd_gpio_get_direction+0xc8/0xd8
>  gpiochip_add_data_with_key+0x4ac/0xe78
>  devm_gpiochip_add_data_with_key+0x30/0x90
>  wcd_gpio_probe+0xc8/0x118
>  platform_probe+0x6c/0x118
>  really_probe+0x24c/0x418
>  driver_probe_device+0x68/0xf0
>  __device_attach_driver+0xb4/0x110

After addressing above, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: 59c324683400 ("gpio: wcd934x: Add support to wcd934x gpio controller")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/gpio/gpio-wcd934x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
> index 1cbce5990855..97e6caedf1f3 100644
> --- a/drivers/gpio/gpio-wcd934x.c
> +++ b/drivers/gpio/gpio-wcd934x.c
> @@ -7,7 +7,7 @@
>  #include <linux/slab.h>
>  #include <linux/of_device.h>
>
> -#define WCD_PIN_MASK(p) BIT(p - 1)
> +#define WCD_PIN_MASK(p) BIT(p)
>  #define WCD_REG_DIR_CTL_OFFSET 0x42
>  #define WCD_REG_VAL_CTL_OFFSET 0x43
>  #define WCD934X_NPINS          5
> --
> 2.21.0
>


-- 
With Best Regards,
Andy Shevchenko

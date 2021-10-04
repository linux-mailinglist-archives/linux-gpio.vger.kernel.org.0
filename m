Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24EA4210B0
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 15:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238371AbhJDNvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 09:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237779AbhJDNu6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 09:50:58 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0DEC077848;
        Mon,  4 Oct 2021 06:21:32 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z20so13370053edc.13;
        Mon, 04 Oct 2021 06:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oz9vve8zThdv/wPK7/DByuqhiCMubVfBEBzCDs6tqrs=;
        b=m6AMYsE89oo56yvenoWJ5bhL0vlQJeSsBI3wfBZ8GcyyJCXpFQhNNniTO5Q+wWhbs0
         aKNVi77NhYG2SiPMcCCiQUaSQ2prjJiUw6ieb2F8QLEIw3In7fZElaHwt7x6z24LBVLC
         Jm+6+Ci1NHBdT9ksTYlKWeMCFqpiHFoaIuDly/KZ5zysTnxLc3b+NkBdb5uXfUkY3kN9
         cGDowUlx2ZE92sr/pBEda83jPMMit5++C8vIxgHz8+Xa9ve+O3V8Nmw6CjGvulKFq1MM
         w0vSlT53Txdy6PG7YlRbhdF90Ycdw09c1fx5xci8Z/67rJ5ouIwHz4R12wyY//88W4JG
         H1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oz9vve8zThdv/wPK7/DByuqhiCMubVfBEBzCDs6tqrs=;
        b=d9+xvStUg3VRZtdfcIfNsn7IF4KjK1dR4ilefHCfRd8GjJIDRH2CqvFNI95yfPNQeh
         WViTGtdqAORT2rdtwWcjIZW1yMqx7jiNBWMzzxmf8MCIkktIPqxqja05dnUL0oXFgrOp
         z8UM/IX5gWoaWbDXjOnT/XPenQwhSEK0QzlhwWaMeLb1dbrh5XdH+wHwGgEDsdQ/piy2
         AUndoXbBUsIpThi0IhiK2zorZCyYhZbPy2pswvcM+dExqD6f4VhP6qs3SitAwms24yVZ
         X3pHBPbTaX5XGr555UwPPnf8UhBkZIucmn35g4rDGfDnC2U0gD9n4ufZKjXuN68myuBR
         pciA==
X-Gm-Message-State: AOAM531hLwfHzW1hys//XI/YvNo3bYjd59ydCbwmxxuXJevblHv9lFgq
        vF12nMnMFN1xRCp2wPWiTjg8zUaAGQrDfLOf0YGEQdaIX+4=
X-Google-Smtp-Source: ABdhPJyB3mVHFW/Z2z99Kl1krfVJ19hPkVyGDYuhOKM2hgM0Nlp/7d+7tBPyeCypP0sv0InVT8Ak3dL+wYa8oeaxOmw=
X-Received: by 2002:a50:e142:: with SMTP id i2mr17841867edl.107.1633353666627;
 Mon, 04 Oct 2021 06:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <c987d0bf744150ca05bd952f5f9e5fb3244d27b0.1633350340.git.geert+renesas@glider.be>
In-Reply-To: <c987d0bf744150ca05bd952f5f9e5fb3244d27b0.1633350340.git.geert+renesas@glider.be>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 4 Oct 2021 16:20:30 +0300
Message-ID: <CAHp75VcBVGLbNxnZ4FwvdoyxQjA_V8MVHdrSYOQdxTm5bFDc5g@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: Add interrupt support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Viresh Kumar <viresh.kumar@linaro.org>, Enrico@rox.of.borg,
        Weigelt@rox.of.borg, metux IT consult <lkml@metux.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 4, 2021 at 3:45 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Currently the GPIO Aggregator does not support interrupts.  This means
> that kernel drivers going from a GPIO to an IRQ using gpiod_to_irq(),
> and userspace applications using line events do not work.
>
> Add interrupt support by providing a gpio_chip.to_irq() callback, which
> just calls into the parent GPIO controller.
>
> Note that this does not implement full interrupt controller (irq_chip)
> support, so using e.g. gpio-keys with "interrupts" instead of "gpios"
> still does not work.

...

> @@ -414,7 +421,8 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
>         for (i = 0; i < ngpios; i++) {
>                 struct gpio_chip *parent = gpiod_to_chip(descs[i]);
>
> -               dev_dbg(dev, "%u => gpio-%d\n", i, desc_to_gpio(descs[i]));
> +               dev_dbg(dev, "%u => gpio %d irq %d\n", i,
> +                       desc_to_gpio(descs[i]), gpiod_to_irq(descs[i]));

This is an unconditional call that will allocate the IRQ descriptor
even if we don't use it. Correct?
If so, I don't like this.

-- 
With Best Regards,
Andy Shevchenko

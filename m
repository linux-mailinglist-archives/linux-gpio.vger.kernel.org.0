Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000D02B7335
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 01:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgKRAjF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 19:39:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbgKRAjF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 19:39:05 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAEDC061A4F
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:39:03 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id s30so475519lfc.4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8cUIbkZJylsb5mO6hD/KZYGDtSV3P8FggXBoXgK+a98=;
        b=spDKP8Cj1EaiX/Lv5t3Qkw8QD0FSRfZa/OQOa/7jvbJs0fpyUfTlaf7QGQ0S+UAdez
         SX8kQ6hZj+W1hgFZUV8GqSBklPHOJDyy8SxvO5CLmie/8wyXwkaZ2aiGVXYQvvZo3Jzx
         maRCHS63l7HL59+bKhFIOLi0ptIP47AvkIRf3s298xunQ6JY4lcG2g7gum+M5E+fwg7x
         Hv7gg6oxYSiXOHpPYj9GIaobsuYesLc+ROcJx/RWeAQ+d6D7x3tcrK1F5C7kT6xjNZY9
         JfEuxBxuaK7d0Z1jxSXxhh2jfAPpXPHluITOn2AAhO/KSpNDJqCF2H2QrUiB+beesAia
         cX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8cUIbkZJylsb5mO6hD/KZYGDtSV3P8FggXBoXgK+a98=;
        b=Ws+ernT1Wgebt+ReS40EcVsNJGbykWOp3etc0ZoC2GjRv6f3wB+xOrA6nz06jg4Ugo
         Hyyxvq0AJuV2aXgyPG9CkP6BEiLwTOfn/zA5tx8NLXnXVcHpKGGrN2WEqiOeDoEmioCg
         bc+FdVjm6/TyKEqhX6bgkAU93XgKDlFQKn186rw5ykT15kZQZXNQD7dVxO+b8Gf7vy5m
         etjUyzlgOi1ppPbYdT1m/smpW00P3p1CzFjzM1BVFx9c4QM2CgsqgnUlAW/0+tMRLYp7
         wwU6a4tg9DJg8OiuVB+wIUBMgdJ7Epw8Iuu9fHmHD8E+wXWtdRgG8jl+8eqGDU3HwbKh
         4qSg==
X-Gm-Message-State: AOAM5314boO+4+90nkB/rzMu0HNXqSKDXzWIueG/XQyoH8oHiotSwkgX
        XPqCpJ2Ny+EkxxoQzqyDRzKSVIXvO4h8zYG5ytGs+Q==
X-Google-Smtp-Source: ABdhPJzP/7gUUiG2Hzqfd0CHPMAFi62oLlQ30ZVIBtWrmH4gJQa06oqnka0nRprKaPt7QqMH80d7vCKK79I+HmFZHP8=
X-Received: by 2002:a19:546:: with SMTP id 67mr2477974lff.502.1605659941675;
 Tue, 17 Nov 2020 16:39:01 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com> <1605201148-4508-8-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-8-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 01:38:50 +0100
Message-ID: <CACRpkdasQEgsOEim5oFMBk-K24SzxYAR17jzuPR3_CTjYZ1hvA@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 7/9] gpio: gpio-xilinx: Add support for suspend
 and resume
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Srinivas,

On Thu, Nov 12, 2020 at 6:13 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> Add support for suspend and resume, pm runtime suspend and resume.
> Added free and request calls.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
> Changes in V3:
> -Created new patch for suspend and resume.

(...)

I'm following the idea here I think.

> @@ -544,6 +618,8 @@ static int xgpio_probe(struct platform_device *pdev)

> +       pm_runtime_enable(&pdev->dev);
> +       status = pm_runtime_get_sync(&pdev->dev);
> +       if (status < 0)
> +               goto err_unprepare_clk;

Now the clock is enabled a second time. Because
runtime PM kicks in.

Do this instead:
pm_runtime_get_noresume()
pm_runtime_set_active()
pm_runtime_enable()

Now runtime PM knows it is active and will not call
runtime resume and enable the clock a second time.

> +       pm_runtime_put(&pdev->dev);
>         return 0;

This is right, now pm runtime will gate the clock
until the first GPIO is requested.

> +err_pm_put:
> +       pm_runtime_put_sync(&pdev->dev);
>  err_unprepare_clk:
> +       pm_runtime_disable(&pdev->dev);
>         clk_disable_unprepare(chip->clk);
>         return status;

Use this on the errorpath instead:
pm_runtime_put_noidle()
pm_runtime_disable()
clk_disable_unprepare();

Now the code will not call runtime suspend to
gate the clock a second time.

Double-check the references to the clock and check
in debugfs that the clock really gets disabled if you're
not using any GPIOs.

Yours,
Linus Walleij

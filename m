Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C6230025A
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbhAVMC5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbhAVMCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 07:02:46 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F9EC061786
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:02:06 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id bx12so6230170edb.8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2KI6hX15GLNc3/Zwk+3jktz2PkpyxrJPc9EgkCyOlB8=;
        b=G5tVjaSycld7W6lDh+iKl7DzUf6NbO+3prZA1wc1j7++uVePfpDwzZoa/VP2QdU6rM
         FirwaeZ0RIggnrr0RHY0p3M+/qG6Jo2KCyL5oT3CS/zPiW8gliS/pVlnIJXHlM6WfCuz
         ZP8dor+tlETUeNkSP7s7VOCfv21xPOOfKRjoP6WUsC3BpFYUQmfgXFaQew2llvm2fUVZ
         RAZyQYTzBpG+/frhJAFGOS3rBbquRMssS//Undpgd6ys43ylj0o3ARsZ5AY/8N+2AykQ
         +Qd3dqShs7jgq2bmnizUg0YgZBjC+IgOKQsGMXTS7K4pUR143g8UkPeFaOtkhTgo3m1R
         cq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KI6hX15GLNc3/Zwk+3jktz2PkpyxrJPc9EgkCyOlB8=;
        b=Xy/oD3nluRrymZTLb+vJSI11rmyxQ0JurPYc2o1GJICIZAy95DiOJW7YZy0WazwJMg
         2kg13BI5M31LtS0bDrFLyRBVSAL0zOMwGpAeT6RvxxzKhVZZJgNHYm81DN4+hQvONw+A
         8s+Roxdg3AXJCxHdfF1vv9g5Fg4DLDWkjS6H89EDJCl89o3fVq8DlejFP4looxk78Fgj
         Vocjb7iKC3KKuHvupYIpClJUb3DbE/ZF3GyfPcE/6iXU/2SWx5KZ6RMMadkaTmygwLMr
         MuQ3KMuTdfDL3hKtLcCrzTEcNP1Yen1skJybSNyNEBtAJEktaLrtlZvuyyJwU6b5JHbO
         6XLA==
X-Gm-Message-State: AOAM5313ORKLoPKLasJXg6Fj+mpmX8S9rMxI5n1sJv7DKe716I4FSVB9
        0quZrZ43Pkg8uSxViQK6qSbR/ha6Kkq1eCKXwVBl3g==
X-Google-Smtp-Source: ABdhPJyvNh+GV3SV/S4iKNTv46EFVOvM0xFOINGooc6QIuDXKfliDJ4znnxaI2fKibq88mDu+fAZMCmGZI0/3MSRMCk=
X-Received: by 2002:a05:6402:35ca:: with SMTP id z10mr2982399edc.186.1611316925382;
 Fri, 22 Jan 2021 04:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20210108092405.19291-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210108092405.19291-1-zhengyongjun3@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 13:01:54 +0100
Message-ID: <CAMpxmJXHs4ixgQPD+M5XJdHWEJLX-DZvJ_D65qc1MgiB6OnjLQ@mail.gmail.com>
Subject: Re: [PATCH v2 -next] gpio: max77620: convert comma to semicolon
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 10:23 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/gpio/gpio-max77620.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
> index 7c0a9ef0b500..82b3a913005d 100644
> --- a/drivers/gpio/gpio-max77620.c
> +++ b/drivers/gpio/gpio-max77620.c
> @@ -325,7 +325,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
>         girq->parents = NULL;
>         girq->default_type = IRQ_TYPE_NONE;
>         girq->handler = handle_edge_irq;
> -       girq->init_hw = max77620_gpio_irq_init_hw,
> +       girq->init_hw = max77620_gpio_irq_init_hw;
>         girq->threaded = true;
>
>         platform_set_drvdata(pdev, mgpio);
> --
> 2.22.0
>

Applied, thanks!

Bartosz

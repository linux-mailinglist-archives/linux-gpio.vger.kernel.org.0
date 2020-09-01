Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7BA25959F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 17:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732011AbgIAPyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Sep 2020 11:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731955AbgIAPqo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Sep 2020 11:46:44 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E35C061244
        for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2020 08:46:44 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id a12so1904702eds.13
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2020 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M+9aVf+WSnx8CBq0GMCkAfZ1rE+F3TmQ51w7zDfTEpU=;
        b=bsLkINae79fmFro/p0x4TrU0JPjb70SfWRMj/SD8wyDYjWGqfNFVN3cF82yY9YgE3o
         OZ8NSRIM1f9IzBldCUDaNmWdyUyWf72VTcIerawmb/ionJGJyExm4vAsAj6TU3Y1UVQJ
         I4deO4GlLU3Xh7d6RRHWNAa/sCZ0XR5/UDCnHDiiXcf5IBLgQ/GPTm06XO33k+2bNQM8
         PJOxxlJ5x7aYbCLPHp9ykMJ4txU7sLGT8x3NqLliRcSYdV3ADCkKXfOgMkOfoy3w5eB1
         nBJbNzr7FoprbxP7G/pNLzIdL3/AqO+NhKi+76PuBzuDHP+yrSMlP2FunNH1zMGNcsts
         meIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+9aVf+WSnx8CBq0GMCkAfZ1rE+F3TmQ51w7zDfTEpU=;
        b=jaBV1M5hpdy3ObdJzT+XXHDXucxQZubzxXwM25BUH0QwzMverPhh2k002gg8Nvs0PO
         dorPcrofFk3Recat6aFOg7OlDeRbfS67tYPKYaZMyzCh8y8Gs5FGgdbtyWNVVN8UvTTG
         K+YMZifniAywKeAcNNjTmjSzOG7Ub2LLmr08frLbBvm7xWIzs+ZE9fDZTaGtjL9+e1E8
         O9JmyydFeteqn8+rdOsPvzRQ7cVdRjMjSvwHJqZlhEUa0G8FjfEpISrSWG/O7exGaX19
         UBrTe1VPwMiMOsVqJb4HhAQfxhUmHCVZQ03KLpIr7kNMxR15MjrTZ8Fh1+heL1W3tnEg
         NgWw==
X-Gm-Message-State: AOAM5301K3mlHRwoldGxHKyr1sic0B13sZLNoytDpuK/9fL445zRvute
        z2MCE5n+wsaFkJekmWkXC06VQEMxBZpwz8FYVOOXTA==
X-Google-Smtp-Source: ABdhPJy9BsUfD5Aq/2j2MP/wrG+Xf4MWg6SG1u0JNFyLS/rxN4ufnUmjbfZBOe7rG30qhP3tLqEd6MwFC42qu97zKq8=
X-Received: by 2002:a05:6402:17ec:: with SMTP id t12mr2167525edy.328.1598975202861;
 Tue, 01 Sep 2020 08:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <1598858073-5285-1-git-send-email-dillon.minfei@gmail.com> <1598858073-5285-2-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1598858073-5285-2-git-send-email-dillon.minfei@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 1 Sep 2020 17:46:31 +0200
Message-ID: <CAMpxmJW9iMVJgm6czSz5fPpRVHFnnp4=6x_7fTcJxGL1f10RGA@mail.gmail.com>
Subject: Re: [PATCH: 1/2] gpio: tc35894: fix up tc35894 interrupt configuration
To:     dillon.minfei@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 31, 2020 at 9:14 AM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> The offset of regmap is incorrect, j * 8 is move to the
> wrong register.
>
> for example:
>
> asume i = 0, j = 1. we want to set KPY5 as interrupt
> falling edge mode, regmap[0][1] should be TC3589x_GPIOIBE1 0xcd
> but, regmap[i] + j * 8 = TC3589x_GPIOIBE0 + 8 ,point to 0xd4,
> this is TC3589x_GPIOIE2 not TC3589x_GPIOIBE1.
>
> Fixes: c103de240439 ("gpio: reorganize drivers")
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  drivers/gpio/gpio-tc3589x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
> index 58b0da9eb76f..ea3f68a28fea 100644
> --- a/drivers/gpio/gpio-tc3589x.c
> +++ b/drivers/gpio/gpio-tc3589x.c
> @@ -212,7 +212,7 @@ static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
>                                 continue;
>
>                         tc3589x_gpio->oldregs[i][j] = new;
> -                       tc3589x_reg_write(tc3589x, regmap[i] + j * 8, new);
> +                       tc3589x_reg_write(tc3589x, regmap[i] + j, new);
>                 }
>         }
>
> --
> 2.7.4
>

I suppose this patch may be correct but I don't see how commit
c103de240439 ("gpio: reorganize drivers") could be the culprit. It's
been like this since the original driver implementation from commit
d88b25be3584 ("gpio: Add TC35892 GPIO driver").

It's been over a decade since this driver was merged and nobody ever
reported this. Either nobody ever used the GPIO module with interrupts
(unless the bug's impact is not significant) for this chip or this is
a quirk of some specific model you're using. Could you double-check
this?

Bartosz

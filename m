Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0074D27ABBD
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 12:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgI1KYD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 06:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1KX7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 06:23:59 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C51C061755
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:23:57 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id i26so7691120ejb.12
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kcQ3Q5G7b1iYSZV9wYb2LjY+OnGWWHVqpPN2pZmnPAM=;
        b=xdjR0uBbD8V3PgvOy2pnav7PYFNuSjlZqObOj0QX/LlRX8GwcdXfGkYoYsT77+BLC2
         viXOj9LPAa84LbZxoO+SzNTAiNAQY3Ui4fA/HdzdXqt1VLf08uPL9OkxUuhWpkJi5hNA
         xNdLvZVbsvdfZdWhUtjBT4ZJYgl9Fgh/bplxAWmdWsn4XEBe46y9E3V9VQd6J2PcBNl+
         WvHYDXlJUwVmYsPnc2zOwdHOISaLcjEtAkJyU1UjWi+rGpiMINEEup5vCh1efUIufWFZ
         mPVoddcOm/AOmN4LwMLN3a4l2rhWoW52fU/5xV8jMITcEJAJyzukiuiJ9FywlUUK2dCQ
         1W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kcQ3Q5G7b1iYSZV9wYb2LjY+OnGWWHVqpPN2pZmnPAM=;
        b=GCNyfp1MdFKi6jORsvIN8X3tKxhltFdUaSaRiav1lBXogtlClLvknntzGgH4vqcO/S
         L9vGrhNbkcBoEzR+mqxV7y1ntBCMyhMkYf5keru8gEigPqHnxGZxFVEbXAd0HuQiCe4G
         91rviyqMZ563oFdqP4g+cslTImfB12pcdM83nC/ASrnzrdBIe7Fj9QRHU/9PaGCm9/1+
         FldN719soxS2QIkq6uhUGZJGuj1u2WdWnR15PbXP+MQO01lIaeKnrIQgVo0/bWscOHY9
         gddYZVDFdBijfn42WqkCVh4LvLsfCP5KtIfDdEuxnY6KuGKgND/5vlrpRnuyRZYiq+xi
         Hw4Q==
X-Gm-Message-State: AOAM5302zJguAHea26ZDESWe9QIVCaSv1sT9x4fIzv+PEFL6OpJuZuKN
        IsgKkYgBnKuOoohWirGRmyTKXj/SxomRPolbNmJfXxikcFA=
X-Google-Smtp-Source: ABdhPJz+qlAAw4d5faIhEVhDwipCEy9QfC5hjH+z40kZktFm1EUNksrZRJG/94w6YS06dIpL8UQ6go/Z6/AiyOk6Zs0=
X-Received: by 2002:a17:906:850e:: with SMTP id i14mr917595ejx.168.1601288636377;
 Mon, 28 Sep 2020 03:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJV0jwLAn3Xee_3zDiF_DQF-8uy52qxU1WAbr9xiVb0WLQ@mail.gmail.com>
 <20200928094452.7005-1-lists@wildgooses.com>
In-Reply-To: <20200928094452.7005-1-lists@wildgooses.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 28 Sep 2020 12:23:45 +0200
Message-ID: <CAMpxmJXv5+hegJX_m5Pw72O9Fiez++ELN6EqSP0MiPyrcm79Kw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-amd-fch: Correct logic of GPIO_LINE_DIRECTION
To:     Ed Wildgoose <lists@wildgooses.com>
Cc:     fe@dev.tdt.de, "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 11:45 AM Ed Wildgoose <lists@wildgooses.com> wrote:
>
> The original commit appears to have the logic reversed in
> amd_fch_gpio_get_direction. Also confirmed by observing the value of
> "direction" in the sys tree.
>
> Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
> Fixes: e09d168f13f0 ("gpio: AMD G-Series PCH gpio driver")
> ---
>  drivers/gpio/gpio-amd-fch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
> index 4e44ba4d7..2a21354ed 100644
> --- a/drivers/gpio/gpio-amd-fch.c
> +++ b/drivers/gpio/gpio-amd-fch.c
> @@ -92,7 +92,7 @@ static int amd_fch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
>         ret = (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_DIRECTION);
>         spin_unlock_irqrestore(&priv->lock, flags);
>
> -       return ret ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> +       return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
>  }
>
>  static void amd_fch_gpio_set(struct gpio_chip *gc,
> --
> 2.26.2
>

Queued for fixes, thanks!

Bartosz

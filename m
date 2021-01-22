Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA9130038F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbhAVM4w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbhAVM4t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 07:56:49 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AD7C061788
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:56:06 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p21so2284557lfu.11
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hbysKLgwDzAo+nX90SpxzAyrCCK68/bvQhdhyAtkNpo=;
        b=QDULxrStPPn057tG9barLLBFRTBLJ8ylUfC0+F54+qfA4SNlZv40pBLuzSI0N/59g+
         SapNPHtGBn0koEhPx0looQTZhW4s0UFM5EVkuMCzoapTRXpEDyc69fqvsU908jFwJhl1
         j/yvSpIt2HaWfzv+03V9uyp8XZPdrS6Fth+Ku9EuwOJYLiz4LOmW9KBVV+H7uB9ILTHo
         76d+qxuVb/0yZGYHVhgwPn0OxgWrekrE33QMuejE4dqntZ4GJoOtPN0Jyx7bDRdcr5qZ
         m6CggsFCwzDH7b5b9jySKPwtmQ3X/dswem/zBMF8fVnBErlwmXTgKtFmBiztB4LRoPvI
         ipow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hbysKLgwDzAo+nX90SpxzAyrCCK68/bvQhdhyAtkNpo=;
        b=ikDbahvculVVg6TNCXH+eOEYdZ698vy513G3QAQhWwokm6FfcaQJI4Egm/ccB243Bs
         BPocNdEpfM/4HS3K799aECTTcnJ5uKv/xDzm+PSA+iuM6mAhrh3Tjm4CT7DatqIwbLSP
         zL0PW91JwpnXXTbtLq7+4jyOyZ3n79EEZKKEP94+YUkLG3v9BlybVlHyx1JuVv1PP3+s
         hfi9glDUgX3kvsC6j2N0I/1vWF0wFcLmk5MUqKivLCp5agKr88Y4N0C/GnuUrQTeyHmm
         sqULF1shiGCkdZ3V6LjvwUdXOMp6yfxuQr8Gb4rr7Re7W3ut/Qo+eb0h/rAvtKrLvYLU
         EUiQ==
X-Gm-Message-State: AOAM530I3EEV4tyOJNUnyRAtgashGl5NzgJMXLLOey+PA0TEv4gmO5NI
        W7tvxZOv4uxij6F7dIS2PHmN+Pqtvk5e5/UEgTmd8A==
X-Google-Smtp-Source: ABdhPJyzQ8QWrLb9ryGYf8zFaFDgdefT9zZMp875FZQAg32906v115z1A2LAgTQWXJX5DB0zn6ghDHXKGH30CeVhH7A=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr129571lfd.291.1611320164547;
 Fri, 22 Jan 2021 04:56:04 -0800 (PST)
MIME-Version: 1.0
References: <20210120004548.31692-1-digetx@gmail.com>
In-Reply-To: <20210120004548.31692-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 13:55:53 +0100
Message-ID: <CACRpkdZynT6T8wnN3xY6hUmZy5emWUe5ep9N3BEV8iQEZLnEew@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: tegra: Fix irq_set_affinity
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 1:46 AM Dmitry Osipenko <digetx@gmail.com> wrote:

> The irq_set_affinity callback should not be set if parent IRQ domain
> doesn't present because gpio-tegra driver callback fails in this case,
> causing a noisy error messages on system suspend:
>
>  Disabling non-boot CPUs ...
>  IRQ 26: no longer affine to CPU1
>  IRQ128: set affinity failed(-22).
>  IRQ130: set affinity failed(-22).
>  IRQ131: set affinity failed(-22).
>  IRQ 27: no longer affine to CPU2
>  IRQ128: set affinity failed(-22).
>  IRQ130: set affinity failed(-22).
>  IRQ131: set affinity failed(-22).
>  IRQ 28: no longer affine to CPU3
>  IRQ128: set affinity failed(-22).
>  IRQ130: set affinity failed(-22).
>  IRQ131: set affinity failed(-22).
>  Entering suspend state LP1
>
> Hence just don't specify the irq_set_affinity callback if parent PMC
> IRQ domain is missing. Tegra isn't capable of setting affinity per GPIO,
> affinity could be set only per GPIO bank, thus there is nothing to do
> for gpio-tegra in regards to CPU affinity without the parent IRQ domain.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
> Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
> Reported-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Ick, sorry for the noise!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

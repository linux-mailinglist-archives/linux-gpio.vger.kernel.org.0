Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CA52D2748
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 10:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgLHJQq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 04:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgLHJQq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 04:16:46 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C428C0613D6
        for <linux-gpio@vger.kernel.org>; Tue,  8 Dec 2020 01:16:00 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id q16so16782332edv.10
        for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2020 01:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tKbroCBz7rOKy383pNZ1k7Wl5tQXAIwK8AanppyWRXA=;
        b=ynaZElSiXc5gn43s0Nrkcc8u6JtLfrLNVgncDYewtSkJU8e8vT/BJSVAcUJ3bPXrrL
         YfNVfcz9EllKZyAPS7fP6p73r2Yb1BEqHq0fchHuIbtZQwDDN7DWi4FNe+UYHXovmwXQ
         NoLttNbBOoWzu5jeLSE3InEwSD/y07nkcbe1TUxUHWw0mR3dEfs2v6C4jj4cctGzemRP
         CVyhROuLp29sUKjDu30S/XqtrFLwtI+G7SvUEflhUjGxe7KIhe8fiiAaJabfdxfQraRz
         Ybb0V7xVfQJBiKQTg4MfZ/T8rglXkeqdq4fBQPBQGt5yOJHhKCAWuqveOVEPAmEGSuBS
         Y5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tKbroCBz7rOKy383pNZ1k7Wl5tQXAIwK8AanppyWRXA=;
        b=CEQVjBHS2BqoL7BQ1XHjXWOR63kBU67oMEFVh2BBwGbtKiEkh4LKc41Jp3syrTxyl3
         GD3RTR3SwiGSGJZ5AMfsckns815dxJTWilVz1OJ7UM6BIbO5FbJjOFBoSYH/+BVbbilZ
         6JhnfJQjCssUkdgNYs1l0Aszna98zouCUorbHNm3Wo2ehRuZPpBCFDcl5fIYnXB7+aSX
         cvFcgyYJJe5GQf+1QttP2bFxea9k8odoOUUGnnM1s96qcUjS0xClpeKYsmiHs6cl7NjT
         1VrR7pES8j5ofU1SUIjN23oIbUrDekT6fAfl17v4quOLUs+SURPkS42MJNLPGXW5i2Ne
         5Cog==
X-Gm-Message-State: AOAM530lrrNnl4Gu62T6iR9V1mVmrW4bAM/khEdQnBLZCA8dZfaNn7eH
        BQ+fPf/PRBfxyXcPgjDEN71jqXS4jUS6hjCj72E73A==
X-Google-Smtp-Source: ABdhPJwrCpNw6Q4nOUFUhX6r5AE5MDGZtLQsv27hIB8jh4ievkFMx/MJInj7m07ISCBqR9rOWG3KTQO/DAgYlzWNz2c=
X-Received: by 2002:a50:b742:: with SMTP id g60mr1530053ede.113.1607418959063;
 Tue, 08 Dec 2020 01:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20201207203816.18269-1-info@metux.net>
In-Reply-To: <20201207203816.18269-1-info@metux.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 8 Dec 2020 10:15:48 +0100
Message-ID: <CAMpxmJWinRPUrmpcqsLaE62uAQpZ3Cb1ys3s7oHmeKM6rUUqQg@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: gpio: put virtual gpio device into their own submenu
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 9:38 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Since we already have a few virtual GPIO drivers, and more to come,
> this category deserves its own submenu.
>
> changes v2: fixed menu title (replaced "devices" by "drivers")
> changes v3: added patch changelog

This should be below the --- under all tags because we don't want this
in the actual log that goes into git.

>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/gpio/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5d4de5cd6759..8596f9320971 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1590,6 +1590,8 @@ config GPIO_VIPERBOARD
>
>  endmenu
>
> +menu "Virtual GPIO drivers"
> +
>  config GPIO_AGGREGATOR
>         tristate "GPIO Aggregator"
>         help
> @@ -1613,4 +1615,6 @@ config GPIO_MOCKUP
>           tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
>           it.
>
> +endmenu
> +
>  endif
> --
> 2.11.0
>

I fixed up the above and applied the patch, thanks!

Bartosz

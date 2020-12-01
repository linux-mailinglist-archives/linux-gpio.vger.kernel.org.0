Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF602CA5F6
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 15:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391380AbgLAOmw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 09:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389266AbgLAOmw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 09:42:52 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE54C061A04
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 06:42:12 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id pg6so4589912ejb.6
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 06:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wKPA9Trb1gdcfbmvahL7WdqHhHJJ0n41ize6GvJPbig=;
        b=qlZSJBo/itDAhzQGoWneBhtkT9dtN4uwqEZvwkh8dbUVSXKK15jlFu5X/UocAE3GL8
         DdVOAKL5I5Dw7lIPGYXR3qPQMvrFUucaoYh0qWkbwjVpB+P6xW6xx5dnCNcokIxbxrrc
         UUlZAOZbOx8aIfHXLdCQ5ho9nXoM+bYE1Ci0gg1pzijDtCUTFEW2+7VNc6drazpTTeWI
         hQJdJEvKme+4icpjEnM57TsGqaJ3GUryyl5Jau/j8FN4kkXcv4fUaoLKghSQDdpU8av7
         ExD4lut8sQN6/O+rbrLn3S263RQrLqkW5y+8ziYKH6PgcpIQOEkE8Mw0N3YpQtmwbQjZ
         5CQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wKPA9Trb1gdcfbmvahL7WdqHhHJJ0n41ize6GvJPbig=;
        b=iuO9JwjK5b3kvImhgrRQz3LktA+nnS9pN0qa8yFTTJDJH37VCvbQ+A3kQ3Nqkp7DTC
         3t3YgmkOmbpZixO+K11VpOchenzcx+97IXdYgshW7gA+ppTY8JTQAMOfixF+EgG7bOAs
         2vtjS8ms27OSs/qZ47ceSkFPAv21x+lu3GnkXUsnrpRg8nUMyixs1N0AYOc78HaQJMC8
         o5GKdbuZeg+7uO5EdMr91pzzkv6EybkOJwSg1F0408XRlkXja2z+gouFaytOt2cQ4XKG
         X/UFb4M5yAwmialQTWKhccYT0RzL11eqWPg0Yu1Ff7AYDcRXYBQMKN1lAwk+sT7RH0Ey
         u5/A==
X-Gm-Message-State: AOAM533zBW/BT6typD/LYPB/BZVqI3da0dik4fize06AHxGxoZCroQwB
        KAfkMIzlCCHgGap/RMSHxvHLeht2x6hDL7mOjbWHcw==
X-Google-Smtp-Source: ABdhPJwJLYBGBSKQBfecB3lzNduBcx4IK6dvErjyKFHcmyGhzPtaqJWgu7Doi2dT5LcXVnwLNOIwV9BH0AGTWUXtwNo=
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr3255758ejr.429.1606833730786;
 Tue, 01 Dec 2020 06:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20201130224753.1569357-1-willmcvicker@google.com> <20201130224753.1569357-2-willmcvicker@google.com>
In-Reply-To: <20201130224753.1569357-2-willmcvicker@google.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 1 Dec 2020 15:41:59 +0100
Message-ID: <CAMpxmJUb43gNHY_pFZyNjVVhumXTQCGkH2m6uM=Aezv3L29ULQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Don't free if pin ranges are not defined
To:     Will McVicker <willmcvicker@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Edmond Chung <edmondchung@google.com>,
        Andrew Chant <achant@google.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 30, 2020 at 11:48 PM Will McVicker <willmcvicker@google.com> wrote:
>
> From: Edmond Chung <edmondchung@google.com>
>
> A similar check was added in gpiochip_generic_request, but not in free.
> This has caused an imbalance count of request vs. free calls to the
> pinctrl driver. This patch is targeted to fix that issue.
>
> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
> Signed-off-by: Edmond Chung <edmondchung@google.com>
> Signed-off-by: Andrew Chant <achant@google.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/gpio/gpiolib.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 089ddcaa9bc6..6e3c4d7a7d14 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1806,6 +1806,11 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
>   */
>  void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset)
>  {
> +#ifdef CONFIG_PINCTRL
> +       if (list_empty(&gc->gpiodev->pin_ranges))
> +               return;
> +#endif
> +
>         pinctrl_gpio_free(gc->gpiodev->base + offset);
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_generic_free);
> --
> 2.29.2.454.gaff20da3a2-goog
>

Applied, thanks!

Bartosz

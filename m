Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5FC2E8CC6
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 16:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbhACPLD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 10:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbhACPLC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 10:11:02 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FEFC0613CF
        for <linux-gpio@vger.kernel.org>; Sun,  3 Jan 2021 07:10:22 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id w1so33509645ejf.11
        for <linux-gpio@vger.kernel.org>; Sun, 03 Jan 2021 07:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v2eCTCh3sPSKxbmVYCA5K6gAkjTyl0RABNT20hQRB1w=;
        b=cqNsyGqfm8I+yIFTmAdF1+5+wGWsQoUYoiDvkS9lXRxpEm1uE1YR1udoBls+yh0DT1
         WiqgRUVwOC3IjBPimP2ReALvuwA1q6VS+E/APj5r8mDbyPKCbTGQCuqwi3b9XEH+ZUBZ
         tmX+DohA9lN4yAjYXQkyG/0xpjXFNeeGdFPBDdS3DgiwHR7TAEOlQeSDtn63TLzNvPao
         gWKr41G8z/sHpPvHTVbPNKr4tEl4HXZEiHz6nCTf69bfRrikZd1ggj80jwv7tt28MlGC
         OE29GW67Nqkneq/uPsIkkXwT6HZ58Q7Oevs046zE0YasliUMtpNHZYkqQ1MHJNPe3n5Q
         jeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v2eCTCh3sPSKxbmVYCA5K6gAkjTyl0RABNT20hQRB1w=;
        b=S4pTmKfhG2Nsy1TwTREbEjx+56WGqVXfzfhTJPHLhHHaN1oKerX8D+XyIdlEilqg8c
         pq/dvkHUxAdIB1in65hWUfiesXVb+y6kDdF7h015P90nNq75NlLRE8jED6Kg6csRNMgZ
         /lzB83c4fkE5OZlQlNAgrtckrtpiD0NjF5Nj6UNbNFa+48E7Yzo/lDMryU/pxWI25reK
         DYZx9AQCRMP9+Cj53VZe86jtanhfn3sZqO5XMMTRWtvhvMWVICyKwqVlXyZfVk0t9h4g
         cKRzBIyirluggRdWFsqNFlbscZDK8vYYU9Jp5ePoANLlWi52niYqFy+UK50q/c30FR5W
         EqQg==
X-Gm-Message-State: AOAM532kRbZL1B+ehnWIq2EZyeDknTr9L4ZkpBHT9pjLFeuhlj0iccA6
        yjLsMc/2FrsP8obno4e5NhFYvFmm5fneeIVeJRElITba3uM=
X-Google-Smtp-Source: ABdhPJzTHwRUSjjsGeIvxDbiBU4vFEXApfPchE6luAXuLhygbX6laFnr14wtoWa5iw5TZstkQFQpgpWw9LzpUQH25Vc=
X-Received: by 2002:a17:906:8594:: with SMTP id v20mr63112642ejx.470.1609686620644;
 Sun, 03 Jan 2021 07:10:20 -0800 (PST)
MIME-Version: 1.0
References: <20201215105329.138193-1-colin.king@canonical.com>
In-Reply-To: <20201215105329.138193-1-colin.king@canonical.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 3 Jan 2021 16:10:10 +0100
Message-ID: <CAMpxmJVQb0Rh2kkVwAgmEvFzxckTUr4HANp_XUkWq8EC88TV=A@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix spelling mistake in Kconfig "supprot" -> "support"
To:     Colin King <colin.king@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 15, 2020 at 11:53 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the Kconfig help text. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c70f46e80a3b..f58e46ec1c96 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -666,7 +666,7 @@ config GPIO_WCD934X
>         tristate "Qualcomm Technologies Inc WCD9340/WCD9341 gpio controller driver"
>         depends on MFD_WCD934X && OF_GPIO
>         help
> -         This driver is to supprot GPIO block found on the Qualcomm Technologies
> +         This driver is to support GPIO block found on the Qualcomm Technologies
>          Inc WCD9340/WCD9341 Audio Codec.
>
>  config GPIO_XGENE
> --
> 2.29.2
>

Applied, thanks!

Bart

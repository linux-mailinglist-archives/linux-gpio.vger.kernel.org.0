Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFEBD3F462E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 09:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235115AbhHWH5I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 03:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbhHWH5I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Aug 2021 03:57:08 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB31EC061575
        for <linux-gpio@vger.kernel.org>; Mon, 23 Aug 2021 00:56:25 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id n15so1028481ybm.12
        for <linux-gpio@vger.kernel.org>; Mon, 23 Aug 2021 00:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0OhiGT4qQVjJYAFOHkyHfks1d757IwOnLUM/viefbjw=;
        b=aEhfzAOiyY88nkFLF5czuI+g2xIIgPapI/UFwVLUGSH38dZAuMBPCI23UNRZ+/RbNn
         cCf6TazwW3QssYVNnWlVoGBIblEEVisCI920ETxJUiKdK2YNuu6exIQEGshkARCvdXnN
         GY79n2yHfCKg47ylSHW3mzW5TvAPiy/MqwiHDp/+ly7KQU+xOy2aly8WYpjrklJmvvk6
         wAmKxb8S+kuk8nKh9Y3I5HRLWEC/ZVjurk+SKBcyH5KaJ/QSMZ5vehbUnmDgPxUep+VY
         IX4q4PFogN3ZQPFS3iHo4vjrOPpixkLkpAIFRTVxKJ9C5rVr99xnkvR7Z/NA1AVAps0Y
         QCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0OhiGT4qQVjJYAFOHkyHfks1d757IwOnLUM/viefbjw=;
        b=i5JEfKLs0F0dCAte08hymF8l1cPBFiAetRTXsyXoRxz/lM1JIzUAoJtnEOFbQGcdcT
         +sJlls0dyJps3pQu/6iP5cRPiN0YLAZwAcK8kVoxCerptoLGJd+lpQNlsDMNnoAsRjvU
         JZC2Blb34Ub9XqC0rbpfkMzzhO4xOMNJujUdg9bVACLyg52KpFJ5TTU9lWwtWeRyDJKF
         cFxl/fQs2x2xeffcpQwGQJVez38052gpbY4n7PKwx/r57CAa1rPMSMG28hPX3S8A/Foq
         z/mnyvc7SG6E2sdl6DxW7089QS1dWrD4uifRxncd3iZwp1UpsAAoffYRnFRQJRMyRtyP
         2lhg==
X-Gm-Message-State: AOAM530d3b/YS+XGTsXsJa9wgzj9I7KpWe3DQSLYI0NA7m7gvhYR+J1l
        i6cis+KBQfGHuXBeoVohI3AcT6W6s/P5Lb+2mpsFxA==
X-Google-Smtp-Source: ABdhPJzQNypJMpbKpTYw9UMjPGOO3q5EI/76XuGApFtsIAAscQoqvMfTPzWSIKhTBgt1HIxDjgoe4pTLU/qclcMdqYU=
X-Received: by 2002:a25:42c2:: with SMTP id p185mr7848253yba.0.1629705385176;
 Mon, 23 Aug 2021 00:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210820225821.103070-1-linus.walleij@linaro.org>
In-Reply-To: <20210820225821.103070-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 23 Aug 2021 09:56:14 +0200
Message-ID: <CAMpxmJV=bSCRiX5sBCDwoDPEnHMTuYoV+C3RXXLJpC2khLKM-w@mail.gmail.com>
Subject: Re: [PATCH] gpio: max730x: Use the right include
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 21, 2021 at 1:00 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> <linux/spi/max7301.h> despite the placement of the header, is
> used by drivers/gpio/gpio-max730*.
>
> The include needs struct gpio_chip and needs to include
> <linux/gpio/driver.h> not the legacy <linux/gpio.h> include.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  include/linux/spi/max7301.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/spi/max7301.h b/include/linux/spi/max7301.h
> index 433c20e2f46e..21449067aedb 100644
> --- a/include/linux/spi/max7301.h
> +++ b/include/linux/spi/max7301.h
> @@ -2,7 +2,7 @@
>  #ifndef LINUX_SPI_MAX7301_H
>  #define LINUX_SPI_MAX7301_H
>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>
>  /*
>   * Some registers must be read back to modify.
> --
> 2.31.1
>

Applied, thanks!

Bartosz

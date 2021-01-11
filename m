Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C45A2F0FBF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 11:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbhAKKMN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 05:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728690AbhAKKMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 05:12:13 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8387DC061786
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 02:11:32 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ga15so23905851ejb.4
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 02:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DzSq10+w9uGbouK/0N/k/Vyq9HI+oX+c5Bfx1maAHnk=;
        b=brKNTh29fweEfuS7wgq5tVU7Zox/66VxMuF0fPbTJ6B0iOTekE8JiQ0ChdjK165R8S
         1Ku+FXvjag1mGTx5kLLtuq+6JZ+5VEKaReKXGtiYYwAoe69Tz3rkaq9Xn6R3zhEYMFkB
         2JzuJJOQUU7LyUTdENSO6Pi3mkDQMGc/cpoD3r+bJo9Rx16iin6ZScdkBgRfnXTHuiWv
         rIrEgzKkLKL98GGxdFiMri/U3KQmi49J700/znPeKpI1VIwD3Xu9idqOuYQAjHB78UtO
         5FNRTglPy3U5YF/iFswc3yeMpRGPasK4Vb8vgdKF33I7Nf1Ie07zsDwCReqW58APyFOE
         9uqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DzSq10+w9uGbouK/0N/k/Vyq9HI+oX+c5Bfx1maAHnk=;
        b=KajvniCfd78T8jtjsm6i+ttrQeMs7ysKwCGp8kkSJ45Taj500gvHjXK6UG9qF6JDoF
         PdlI7wFP2Mz3hy5RF38frZDvWxrUzkyLxig23anyDMN/QMo/m2u+Zu0fP2lJ2WXCR/YO
         GYpJ4+dn1RSrwMcTaxdpsU4Uys37cqRCBCoCl1qaPntj5xB/iCkXlp1uxbDWXxUYm+yP
         7VPAeHu1KM+/AlegnDyBim1cN/JQQ8VhdXjjkKcDG6pr+b0BtM48spWAxnoM8txLtV6t
         mIr1nWFOSUjxhF1x2hDuelm6IiUayULTcCgVB3QXQfnfIUGSze1tYLU4ZOWsis4Obswd
         GnrQ==
X-Gm-Message-State: AOAM530NgdnGsCA7PklYtHIOJCcTibAriwE4Swf1it4U9VOrytcrNYIG
        a7gpiUWhYYQQ0Mhw33NBTTjRH18CjVyM/msTT9rRDutaxqQ=
X-Google-Smtp-Source: ABdhPJy6BAGaxo9ow37JgvNCEtTIWZ6DevYVOAPVrh5msYMf4oLqwqvTx+sKPHhMSvbD1Yo57et1/lMYJHV8uQwa0FY=
X-Received: by 2002:a17:906:3513:: with SMTP id r19mr10055190eja.445.1610359891259;
 Mon, 11 Jan 2021 02:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20210108092334.19101-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210108092334.19101-1-zhengyongjun3@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 11 Jan 2021 11:11:20 +0100
Message-ID: <CAMpxmJV=k7bWC5xNNmk1rHXwCQUX=c1qEQ6gm6xU24zE70Hymg@mail.gmail.com>
Subject: Re: [PATCH v2 -next] gpio: convert comma to semicolon
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
>  drivers/gpio/gpio-mc33880.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
> index f8194f7c6186..704cd4e6171f 100644
> --- a/drivers/gpio/gpio-mc33880.c
> +++ b/drivers/gpio/gpio-mc33880.c
> @@ -99,7 +99,7 @@ static int mc33880_probe(struct spi_device *spi)
>
>         mc->spi = spi;
>
> -       mc->chip.label = DRIVER_NAME,
> +       mc->chip.label = DRIVER_NAME;
>         mc->chip.set = mc33880_set;
>         mc->chip.base = pdata->base;
>         mc->chip.ngpio = PIN_NUMBER;
> --
> 2.22.0
>

Why does the tag mention -next when this has been like this for a long
time? The subject should also be: gpio: <driver name>: something
something.

Bartosz

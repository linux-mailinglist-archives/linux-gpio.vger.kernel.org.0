Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B970B188654
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 14:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgCQNun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Mar 2020 09:50:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44631 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgCQNun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2020 09:50:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id y2so10286219wrn.11
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2020 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bl6Wl8W1k8+UQXRdrCsPqiuDGnxac/zO2yeYWcwH/eY=;
        b=BBO2buZOeTxK0pTFcnu2vsX80POcqQJc4xww2aupjp3CUcUyRERCJVPxOku6Aa1UD+
         TdQ3ulqZrG+z4FycBEAhYazQKCR56uL3u+gjU2zBF1yApArsbKhWr+mIlMaeU6RJnIkH
         3mha3ioQs0YGEaIJZyKWvb16kby/lPx/VM9v6RZ+7Vn/V3CzxmV9M/m4xaFBEmEAPnj1
         at+zXtyuHqSvx6FIl1EDBhs4TosAgYqCTcjUKCE6hL9aWmjBjuD1ck604axr8kvBZp/X
         2aIO/omD5oUHySZmd1whOdSQk6M2cGFoKZmq43572olq0U2X2dWCj6fWpArT4t+R2Ubo
         LrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bl6Wl8W1k8+UQXRdrCsPqiuDGnxac/zO2yeYWcwH/eY=;
        b=JbBxhwk261QvE/FFZ+2yQhM7unXkuIen0rHtB2swEEahCiS9XEMwTitcGwI/ZVkAh9
         No4k9qULS9iUJGKCvWzDnmnYtigNU/esal50+q0fAL93ytBFIHI8NqfjGnVdDXVyiYab
         VyP6QSly8uo0MLDvunuHkZrt6A8PJryRsRg5g6vbnbO3fUMbHFbGktBw26nkIuwfL4gb
         kprS3xmlfjGKEZpYVkSns2hQdhmyvNBzp0JYUE/glKJWF2ba3NmFWaLNcwfXhln5VK5S
         ddqBV47gZ4LPeAtXG1z7TaGEqCN6+v5juImtMcxM6zTQPNy29ephqujplNCizgUf4IM0
         7rJw==
X-Gm-Message-State: ANhLgQ1D+GVP9cNEYTb/LbFPpskqGzY7uC3tJaEmwBu3urPgDGwGyvRE
        +O0OdPak/k3F0du0fNyY64HKTm+h8CIn6R62HVe9zWhy
X-Google-Smtp-Source: ADFU+vs1OKaCfhYsk3ZLqgceZIr7uOgl5r7AdLgYUcjxlwtwPMRQ6uDNBO6ughO/XEUAqjxZzkDuEiXPj5zd5bOvAHc=
X-Received: by 2002:adf:bb06:: with SMTP id r6mr6318759wrg.324.1584453039735;
 Tue, 17 Mar 2020 06:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200316195048.2592199-1-gabravier@gmail.com>
In-Reply-To: <20200316195048.2592199-1-gabravier@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 17 Mar 2020 14:50:03 +0100
Message-ID: <CAMpxmJXHQPDBsuJ_tBhys0wtp1xcsi3irC7uexqW3iXxq=5JAA@mail.gmail.com>
Subject: Re: [PATCH] gpio-hammer: Apply scripts/Lindent and retain good changes
To:     Gabriel Ravier <gabravier@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 16 mar 2020 o 20:50 Gabriel Ravier <gabravier@gmail.com> napisa=C5=82=
(a):
>
> "retain good changes" means that I left the help string split up instead
> of having this weird thing where it tries to merge together the last thre=
e
> lines and it looks **really** bad
>
> Signed-off-by: Gabriel Ravier <gabravier@gmail.com>
> ---
>  tools/gpio/gpio-hammer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
> index 0e0060a6eb34..51a65f8149ea 100644
> --- a/tools/gpio/gpio-hammer.c
> +++ b/tools/gpio/gpio-hammer.c
> @@ -77,7 +77,7 @@ int hammer_device(const char *device_name, unsigned int=
 *lines, int nlines,
>
>                 fprintf(stdout, "[%c] ", swirr[j]);
>                 j++;
> -               if (j =3D=3D sizeof(swirr)-1)
> +               if (j =3D=3D sizeof(swirr) - 1)
>                         j =3D 0;
>
>                 fprintf(stdout, "[");
> --
> 2.24.1
>

Patch applied, thanks!

Bartosz

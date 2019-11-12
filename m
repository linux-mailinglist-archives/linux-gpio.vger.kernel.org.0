Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF116F8CA9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 11:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfKLKUR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 05:20:17 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40177 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfKLKUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 05:20:17 -0500
Received: by mail-ot1-f68.google.com with SMTP id m15so13823055otq.7
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2019 02:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rjd1FS8nNm6yRr4WVn+HN8ZG0ZScPCeZT4lpNVe4Zbk=;
        b=HT2E7HWmfg4NPppXd4Z/N3e+10XqEJpkjLfqXexTfchGFx59EKIlflcB29Pvff1Ii+
         Pee1vLZ2acJeOayIkvQe1hyi56T6jI6nITcT9E2DBBnQq5J17t3acaq+8cyxRmA4k+fm
         WA46zucZtzf5PeihhI8Cp2UsziPgYvcqyd1YpZHDAe/RpWNEiIaddhmbc6XHTsTLMwGK
         hrIRhCGCg12VYvW1IsWdRWeFqQVf/n4WkoCKnbQ8LcdTIxaXkMjkxWrjnviserTeAkL9
         DarQ/kew1zKc/ZWhn4Ge8QJzrHzk5AEvI8rGEV4/4PKULnnxZybyYBkdT3ayUrli5Mhe
         b5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rjd1FS8nNm6yRr4WVn+HN8ZG0ZScPCeZT4lpNVe4Zbk=;
        b=ZjFsp4v90PnfXDrK8PXU+eO8mrsqP7nGI5+cG4Eugg8CATFjZQ6w34PMFEr26EKFYc
         pW3YyTHlMUHxhMORBwZVkU7MYVpNjEVO3Evnr6ipkWFPB5Zax5b3UKgXlqyhiSag0Upe
         FvQN2L4pH+afmCBEv3hYueYls7FZlhTf24hd76s7PUQzG03GeoSs0axOQiSLLvfKXcGX
         QwWSPrfox98G8Hjf43ZiZ1yHZoC+PTeV56rLKaB719bVFS5PlC2lg5t/AKMdkGVGqeB9
         V0ihPvBKx9gN66SZ9CYDm7HH77BuN+vSLcpSKr9GoXUFkqJiANOcOCFF8QXP4oGpozt2
         KJAA==
X-Gm-Message-State: APjAAAVZa6C8/ahiBl9KGHW0G991NvP7dJqL1BpaYZWfk+TcixAuvT2D
        zRPcILCyFrVlr6Bn3RpGOD7HX+g0vZ/lgnM/0aCvnA==
X-Google-Smtp-Source: APXvYqyJYU1a1wAD6RMTrT6g96ZtxZ7A8y0Kd61mPfdbLz15t3BIBUD3Ta5YCEivW+oP4c/yRxIQN1WJuUKzonHyOUI=
X-Received: by 2002:a05:6830:210e:: with SMTP id i14mr24546593otc.250.1573554016083;
 Tue, 12 Nov 2019 02:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20191108160747.3274377-1-thierry.reding@gmail.com> <20191108160747.3274377-2-thierry.reding@gmail.com>
In-Reply-To: <20191108160747.3274377-2-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 Nov 2019 11:20:05 +0100
Message-ID: <CAMpxmJUdqWzMJo0LMXudyzyoyP9TZyAA1t50GxG0DCL3aTBASw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: bd70528: Use correct unit for debounce times
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@denx.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 8 lis 2019 o 17:07 Thierry Reding <thierry.reding@gmail.com> napisa=C5=
=82(a):
>
> From: Thierry Reding <treding@nvidia.com>
>
> The debounce time passed to gpiod_set_debounce() is specifid in
> microseconds, so make sure to use the correct unit when computing the
> register values, which denote delays in milliseconds.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpio/gpio-bd70528.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
> index d934d23b77c6..d29cbd3c9e53 100644
> --- a/drivers/gpio/gpio-bd70528.c
> +++ b/drivers/gpio/gpio-bd70528.c
> @@ -25,13 +25,13 @@ static int bd70528_set_debounce(struct bd70528_gpio *=
bdgpio,
>         case 0:
>                 val =3D BD70528_DEBOUNCE_DISABLE;
>                 break;
> -       case 1 ... 15:
> +       case 1 ... 15000:
>                 val =3D BD70528_DEBOUNCE_15MS;
>                 break;
> -       case 16 ... 30:
> +       case 15001 ... 30000:
>                 val =3D BD70528_DEBOUNCE_30MS;
>                 break;
> -       case 31 ... 50:
> +       case 30001 ... 50000:
>                 val =3D BD70528_DEBOUNCE_50MS;
>                 break;
>         default:
> --
> 2.23.0
>

This fixes commit 18bc64b3aebf ("gpio: Initial support for ROHM
bd70528 GPIO block") present in v5.3 so applied to fixes and marked
for stable.

Bart

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED1D314CCC7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 15:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgA2Ow0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 09:52:26 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43729 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgA2OwZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 09:52:25 -0500
Received: by mail-qt1-f195.google.com with SMTP id d18so13394689qtj.10
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2020 06:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pepq9Fwj7iOLvacHkqH96ILFGnT39BOdCUezBU3lPeY=;
        b=1Nyr4tTQQLDy+yChx0gBW0ZWxT4kvseFdi6bC9WuIUJyxV+JG7C6VUX14i1oGkV/6g
         /YDaAFHokGGsKcMw8Eqo8+qq7Qv5ZpoQe5rWDshkx9uPHjKfklYjfk5gkHYPN+AhbEze
         0L8z3y87fBrOD0JdXFsxNVIiKdX8kuqA4Vp7MjuSOHFAeTqdWN/GHhrCbNG/XnNW33+J
         xwsg04YPd6S+/zwm8tdfCanTd0N52LYQXf2h46vNLpfjXggo7sSVzvX1aXYgkiCVLvs0
         0Afsr7xbjltCzwqinYq/hc8m+Oq0veH1SHvrHs3BCTfdJjoPbDJfXkKh3s85tdeRxZYN
         qfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pepq9Fwj7iOLvacHkqH96ILFGnT39BOdCUezBU3lPeY=;
        b=WOHoNzQJx6GAd4Unoedt51hELdSPG4wnb9th+M/vAEZgiCCf4HagBm0N1hMGaFUDyx
         VFV/fPN+nnXWDL/ljdoi8RLIJ/fnSTtYQN5/2zPLBS9+fdzObGxO/n5YuifcTyTVKAvU
         GUbqOScsKUl6PxKMqChJURb+UkabF6fQuc4ZgC+2t/WkxHydfUvfslfWa5fehqAqszRF
         3YEQsERce+jdwIYjlpOrLtsbVOEppp1VviQ8U/jGPeI+iWXnnPXwaO6FTg6c2kwapBjK
         Gm+A5W0JXY1jEKQXTkOl9pIbTNluALQOuCpjwyW9tNTDG2SEAz75mQM4pjWX5arcrE+t
         QTZg==
X-Gm-Message-State: APjAAAVaDApBcItGNHJy3CDkP+cYRVsvCqxut2Oir9A2Q2T/T5uI3dhG
        W5TsGkizDbyfI4eGzXI16vyGmWREJtBzJA456BoU0Q==
X-Google-Smtp-Source: APXvYqz2PH4gTWG6LdFyLnOIGUt8WKmizd52veq8sbenx4NpySJwECL+9WveVY8926t919RqRpo0J71GDTMDF2+rtI8=
X-Received: by 2002:ac8:3676:: with SMTP id n51mr27120845qtb.208.1580309544928;
 Wed, 29 Jan 2020 06:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20200118200607.68830-1-sachinagarwal@sachins-MacBook-2.local>
In-Reply-To: <20200118200607.68830-1-sachinagarwal@sachins-MacBook-2.local>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 29 Jan 2020 15:52:14 +0100
Message-ID: <CAMpxmJUrRooRRdo6oBUMj+a=OxdtjcUs6tUac7ro92m1c9UJOQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] GPIO: creg-snps: fixed a typo
To:     sachin agarwal <asachin591@gmail.com>
Cc:     Eugeniy.Paltsev@synopsys.com,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        sachin agarwal <sachinagarwal@sachins-macbook-2.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 18 sty 2020 o 21:06 sachin agarwal <asachin591@gmail.com> napisa=C5=
=82(a):
>
> we had written "valiue" rather than "value" and "it's" rather than "its".
>
> Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
> ---
>  drivers/gpio/gpio-creg-snps.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.=
c
> index ff19a8ad5663..1d0827e79703 100644
> --- a/drivers/gpio/gpio-creg-snps.c
> +++ b/drivers/gpio/gpio-creg-snps.c
> @@ -64,11 +64,11 @@ static int creg_gpio_validate_pg(struct device *dev, =
struct creg_gpio *hcg,
>         if (layout->bit_per_gpio[i] < 1 || layout->bit_per_gpio[i] > 8)
>                 return -EINVAL;
>
> -       /* Check that on valiue fits it's placeholder */
> +       /* Check that on value fits its placeholder */
>         if (GENMASK(31, layout->bit_per_gpio[i]) & layout->on[i])
>                 return -EINVAL;
>
> -       /* Check that off valiue fits it's placeholder */
> +       /* Check that off value fits its placeholder */
>         if (GENMASK(31, layout->bit_per_gpio[i]) & layout->off[i])
>                 return -EINVAL;
>
> --
> 2.24.1
>

The subject should be 'gpio: <driver name: ...' and this looks like a
new version of the series, so please mark it as such and describe the
differences between versions.

Please refer to Documentation/process/development-process.rst on how
to submit patches.

Bartosz

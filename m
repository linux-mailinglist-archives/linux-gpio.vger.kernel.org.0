Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7911DC99C5
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 10:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbfJCIYe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 04:24:34 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43924 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbfJCIYe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 04:24:34 -0400
Received: by mail-oi1-f196.google.com with SMTP id t84so1784268oih.10
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zUA3u1BSXrY9Ik2AcFkwsTNlxrkAsn7Y3a8AWnLHJCs=;
        b=h8H/vn0shPR2AQlVRPOxIV+d0a78GeWR741CrWoHLD3dQOd8vPoKvYNHrJKMbaehoQ
         g+1ZWq8e7ceYDz55w85Fq4ItKbhbWp/wBG5z0dxFFSzCndVZDS0eWZgKNcEQ8I/t2Z4n
         JHWrq7ZA11DmqXcrylhwOdrOoQc+XOOyedUM2kThILG39klPkX7nDWG2jx5TLwThdjbJ
         vHiC8Ht83H6rHcZ7sig02tHHEr+IARV+x142dHmtqsyVvPunKJ7XYEPpTxnKRXUkLpbX
         RNnMVyfBJjzVQigFX1u4VrbZAcorMoOXxBQsu9VamHRjxWNY+dWfNEviJOPqMg3m5OJT
         LrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zUA3u1BSXrY9Ik2AcFkwsTNlxrkAsn7Y3a8AWnLHJCs=;
        b=U+RRDYM1pNt375ZP4PeIHRlLF3VgCZ4VG5KljtWbhwrolWsaEpovJYyfq4ToPX1BvB
         mmTVYS7M4vpSs9mkatFNZlWS/izdFv+K+et/7Pew2OBZbsSfnEGhT/3mMHiae2eOkv7e
         Z3wSsjoUGUGiE6sM0h4XqHBY46olmtY8wTleXEWJBwgwG62hOyYAwQVKwe0/SqCxBVKQ
         8hiEwPaPW8FSuxXQYxPyGCGFwhRiHgXdF6/fRptzfdUHVBrlLvKmX0CP3R/WomjP7Ibp
         5dUHf8YMtzAnH+DA/m9h6bKoXZc4K6bseahb28o8wVIeQZhZcw9aImFWj1Np6rg0i1l6
         aD3A==
X-Gm-Message-State: APjAAAX1kU5Wn3Au8rNuQtvVzCgXdnlFL3z5Q0H2Wf/VUmXoYBC2vaA3
        HM6w8r95wSDZJaPTpuTDTsiB+p4aL+oZvG/ENLdbEQ==
X-Google-Smtp-Source: APXvYqxhCodm6x8Cy94oJgXJLhll1GesYiXNbQJAVbEpxh6rdxy/3quBYU1XRWlZwgnpUDbJPTiVbsltQ7qhcwlVcgA=
X-Received: by 2002:a54:4f8a:: with SMTP id g10mr1908892oiy.147.1570091072850;
 Thu, 03 Oct 2019 01:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com> <20190927100407.1863293-4-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190927100407.1863293-4-paul.kocialkowski@bootlin.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 3 Oct 2019 10:24:22 +0200
Message-ID: <CAMpxmJUHPuGPPPFSctyhtfj0oAk6oJ+=mvgN4=7jmLxAfHs45Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpio: syscon: Add support for a custom get operation
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 27 wrz 2019 o 12:04 Paul Kocialkowski
<paul.kocialkowski@bootlin.com> napisa=C5=82(a):
>
> Some drivers might need a custom get operation to match custom
> behavior implemented in the set operation.
>
> Add plumbing for supporting that.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/gpio/gpio-syscon.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> index 31f332074d7d..05c537ed73f1 100644
> --- a/drivers/gpio/gpio-syscon.c
> +++ b/drivers/gpio/gpio-syscon.c
> @@ -43,8 +43,9 @@ struct syscon_gpio_data {
>         unsigned int    bit_count;
>         unsigned int    dat_bit_offset;
>         unsigned int    dir_bit_offset;
> -       void            (*set)(struct gpio_chip *chip,
> -                              unsigned offset, int value);
> +       int             (*get)(struct gpio_chip *chip, unsigned offset);
> +       void            (*set)(struct gpio_chip *chip, unsigned offset,
> +                              int value);

Why did you change this line? Doesn't seem necessary and pollutes the histo=
ry.

Bart

>  };
>
>  struct syscon_gpio_priv {
> @@ -252,7 +253,7 @@ static int syscon_gpio_probe(struct platform_device *=
pdev)
>         priv->chip.label =3D dev_name(dev);
>         priv->chip.base =3D -1;
>         priv->chip.ngpio =3D priv->data->bit_count;
> -       priv->chip.get =3D syscon_gpio_get;
> +       priv->chip.get =3D priv->data->get ? : syscon_gpio_get;
>         if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
>                 priv->chip.direction_input =3D syscon_gpio_dir_in;
>         if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
> --
> 2.23.0
>

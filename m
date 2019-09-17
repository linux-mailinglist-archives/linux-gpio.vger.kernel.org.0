Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7D3B48C7
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 10:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbfIQIJT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 04:09:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35441 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729815AbfIQIJS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2019 04:09:18 -0400
Received: by mail-ot1-f66.google.com with SMTP id z6so2264929otb.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2019 01:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vo/oVpeB3qhdq7dqY8xlj9Tzr7vj+ZfcOGdaj1cujrc=;
        b=hf/AAXhWJ1kDjSCHqgEJyJvrWfGfpo0PtPZysXVvZcD52JRSE2JO+9LyTajUdDmbk6
         IB8MhXfJqp0lprL2UUZyUydwvZ4/JS3BsMduAPqZge1MDz8VpPs/K1uc9bJdsGLph/3p
         2BROoCuI9Mrn8g27pZ9DLlqkkBLxKE8uv5IH5m+3LkGQKtxC3GcjZG7ABQA3rtL4cElp
         j4K/LrjfLj5JCzxdXTx3UeFRCYTVcErpKPJ/2Gg4U0aYA3dHUL1ylyfKSBk6hd1tL1pf
         00/gzjZAn3KOdIJ5jh2/iQyNWB0X3mEn0srkOj39hcakO458IFYnreJjsWIAg+V5ud42
         Rmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vo/oVpeB3qhdq7dqY8xlj9Tzr7vj+ZfcOGdaj1cujrc=;
        b=Qs7YYresrRrfv0pvAIRckxoI7n+T/B2DXViqM09Lz7n9SuCiC55bg/UpPR9DquLG82
         a9LD/LJHjtD/6Q85GFdsWPi/aPs7c+AG1IH7lX+5CpztvtRrrsCzuHPkEjeWcK+9QtSo
         70Cn7YVmHpoxFXuOpIyngtuLF0Uu0C3RSUsEtQGJN3X08wz3qraoy6hzBmhjEzFiMM15
         U+st55Gjk0pJw8VtpJUDBnUH/Oilz1IvioY3ExMEquwqoDR6Sg6KHUITHFydaZKaRwxp
         adHvBjPMsX9J9O92D9LCAwqZM0kx3HtocjAd1hcJS9oomr8FGwvA72InwTMPNwOFO489
         Yx0w==
X-Gm-Message-State: APjAAAW8x7fZLbRtt/hpxYekTgV2Ks9L2T8GJul1B1/zeqcIq05Ug2X3
        fg4Id26f+Le5CBA1xz1Hwevdmj459SRhgTIztdQ8xA==
X-Google-Smtp-Source: APXvYqwtq0F/cD3QmH9ByzxWbexSd+XkNUO2+TWJmjSfUz7aVUU8Fyyl0II2Y5tGw9prcchOxrmDeVEeU/lexI1NUBU=
X-Received: by 2002:a05:6830:18f3:: with SMTP id d19mr1727959otf.256.1568707757737;
 Tue, 17 Sep 2019 01:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <5ca714b7bbd12ce24a6e8cc278eb438c576fa75d.1568627608.git.baolin.wang@linaro.org>
In-Reply-To: <5ca714b7bbd12ce24a6e8cc278eb438c576fa75d.1568627608.git.baolin.wang@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 17 Sep 2019 10:09:07 +0200
Message-ID: <CAMpxmJVBzOwZ7JaySzq1bZkEtwEfMSu_e8dGTSEiY6wG0d=KiQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: eic: sprd: Fix the incorrect EIC offset when toggling
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>, bruce.chen@unisoc.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 16 wrz 2019 o 11:57 Baolin Wang <baolin.wang@linaro.org> napisa=C5=82=
(a):
>
> From: Bruce Chen <bruce.chen@unisoc.com>
>
> When toggling the level trigger to emulate the edge trigger, the
> EIC offset is incorrect without adding the corresponding bank index,
> thus fix it.
>
> Fixes: 7bf0d7f62282 ("gpio: eic: Add edge trigger emulation for EIC")
> Signed-off-by: Bruce Chen <bruce.chen@unisoc.com>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
>  drivers/gpio/gpio-eic-sprd.c |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
> index 7b9ac4a..090539f 100644
> --- a/drivers/gpio/gpio-eic-sprd.c
> +++ b/drivers/gpio/gpio-eic-sprd.c
> @@ -530,11 +530,12 @@ static void sprd_eic_handle_one_type(struct gpio_ch=
ip *chip)
>                 }
>
>                 for_each_set_bit(n, &reg, SPRD_EIC_PER_BANK_NR) {
> -                       girq =3D irq_find_mapping(chip->irq.domain,
> -                                       bank * SPRD_EIC_PER_BANK_NR + n);
> +                       u32 offset =3D bank * SPRD_EIC_PER_BANK_NR + n;
> +
> +                       girq =3D irq_find_mapping(chip->irq.domain, offse=
t);
>
>                         generic_handle_irq(girq);
> -                       sprd_eic_toggle_trigger(chip, girq, n);
> +                       sprd_eic_toggle_trigger(chip, girq, offset);
>                 }
>         }
>  }
> --
> 1.7.9.5
>

Queued for fixes.

Bart

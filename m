Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4921308F0
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2019 08:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfEaGrD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 02:47:03 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41863 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfEaGrD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 May 2019 02:47:03 -0400
Received: by mail-ot1-f65.google.com with SMTP id 107so2339189otj.8
        for <linux-gpio@vger.kernel.org>; Thu, 30 May 2019 23:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LHsuz5C78dkdvwrhyeVagSvPz79gQy4vqSHZT3+aUfg=;
        b=NSxrzxd8aOEYZehUe9dCn90NakB9YFTWgiZUbBdgNlda6YA0tme/1FPQ06xaEb/3r8
         AHfU3Zw4eC3BrBDfVt+AJvkKCADxkkCQ+XvnDygzYk1i5qSXOkevg8h7GO+vddXkrmXS
         d7+nxkab/cIZfIyf1xL25mkjECp7tuBNklgTcAta3w46aeR6UVbjQv5F/4datpKXTnrl
         h2KdMEleaHpuRFm1zuaSfK1BkENLKraCNBQUi+nUAJMu2pOVq3cYKqRC+vlhD1DBq/Hg
         ctv3IBzlT9N3CVMeo0RtX57DYLHuy/U5tb3nWihIbdemmh+DmSISVnso6iXSHHBxNHUa
         AzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LHsuz5C78dkdvwrhyeVagSvPz79gQy4vqSHZT3+aUfg=;
        b=JTOoTi1Vo8knmiwe//XBi6T1A/9WmXTC5jFwOwbijdTZqt/5+cr2VWGoZ9UgcyoK9C
         w2+6cyIWa6XNzhXry/EWrsw17NiKIeHtF7CkMF0fFN8oIlvpYS06+ygpOUX0cskyoNw6
         FsXrggJ0AqO0K2aWSzG1rKCaunKZBJW0P0b0L8YfFsuSaXVnLBfa79OKyMWs21EHuMgB
         wbWVLrGXwzQF/6Kop/xKLCx9cqfs27lqTMPC9GahOevsEZ9vKb/ffmjSFK/oP/7kkhUL
         hOcwyCphaYDboVfYsn1chcgr6/G31dUJJjGlJ0tbzyvSTGa/Wy7x7XgOtIl5ZA9dwt+J
         Xv8Q==
X-Gm-Message-State: APjAAAVUE9TNmW6dtPAwqmLr+80TQvUeeP5yB14rbAHdhGrw+sm52cj1
        tIizkvwTtYzIUCRT0evj1kYz9iXVVUbwJLmZhZe94Q==
X-Google-Smtp-Source: APXvYqwfZHeQnWjNQ/2RVzPT65SQnuV2CF+p1BUmCVG6iYSOdkJl9naM3l/rYR0IW9a1yRrR1mQ5HMQJbp4Mx22Kyk4=
X-Received: by 2002:a9d:6c5a:: with SMTP id g26mr631753otq.194.1559285222315;
 Thu, 30 May 2019 23:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190530211832.23889-1-tomasz.motyl@se.com>
In-Reply-To: <20190530211832.23889-1-tomasz.motyl@se.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 31 May 2019 08:46:51 +0200
Message-ID: <CAMpxmJUKtqrA7sOV5S+v4wUA33YqW=Sog4MTV5Oibb4KcYZ4wg@mail.gmail.com>
Subject: Re: [PATCH] When ones changes the state of any input pins of a
 PCA9555 chip before setting up the IRQ mask through i.e. SysFS e.g. echo
 "both" > /sys/class/gpio/gpioXYZ/edge the epoll_wait shall not exit on the
 subsequent change of the GPIO state. The reason behind it is that the IRQ
 status is not being saved when the IRQ is masked.
To:     Tomasz Kazimierz Motyl <tomasz.motyl666@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        butterfly_tm666@yahoo.com,
        Tomasz Kazimierz Motyl <tomasz.motyl@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 30 maj 2019 o 23:18 Tomasz Kazimierz Motyl
<tomasz.motyl666@gmail.com> napisa=C5=82(a):
>
> ---
>  drivers/gpio/gpio-pca953x.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 7e76830b3368..088bef902156 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -716,13 +716,16 @@ static bool pca953x_irq_pending(struct pca953x_chip=
 *chip, u8 *pending)
>                 trigger[i] =3D (cur_stat[i] ^ old_stat[i]) & chip->irq_ma=
sk[i];
>                 if (trigger[i])
>                         trigger_seen =3D true;
> +
> +    /* We want the current status recorded in the chip->irq stat regardl=
ess the
> +     * chip->irq_mask setting in order to have a change detected when th=
e interrupt
> +     * mask gets changed i.e. echo "both" > /sys/class/gpioXYZ/edge */
> +    chip->irq_stat[i] =3D cur_stat[i];
>         }
>
>         if (!trigger_seen)
>                 return false;
>
> -       memcpy(chip->irq_stat, cur_stat, NBANK(chip));
> -
>         for (i =3D 0; i < NBANK(chip); i++) {
>                 pending[i] =3D (old_stat[i] & chip->irq_trig_fall[i]) |
>                         (cur_stat[i] & chip->irq_trig_raise[i]);
> --
> 2.17.1
>

Hi Tomasz,

please format your patch correctly. Give it a short summary line in
title (no longer than 75 characters) and put the detailed description
below.

Bart

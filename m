Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08F7FB7BF1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 16:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388949AbfISOQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 10:16:50 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:32819 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388331AbfISOQu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2019 10:16:50 -0400
Received: by mail-oi1-f195.google.com with SMTP id e18so2889454oii.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2019 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qaeMCYjZPRaH9Ju9SgkSov7Ze/8oIWs13QEihdDThJ8=;
        b=z+2qSOa3cyfelEyS2Tc7A9vemu+IwUiJQqeEP2gEj3gSL1xNk+m7ZN8QluhyS5bXfA
         I8vH6Zhm8sg5ohv6KRmQicpAHf95W+eBHjtmirVWhc7uSQIokMbjxkyHSipMh+zJ7uav
         g3TZR0TxEX1iedciFW5eFGEwtEFlpF1n2VMEW4f+MlUH334eb9jav1XI8ouU3mpXzrwJ
         W+3gCxXBF47XY2HQON0XxJLnNkHzgQTsmW5j4rTpDTRpowEFjPSV9LxZ3YwN8n658w/r
         t780vK5wrh8QDRjJNbdN63IJzBv1Rh2ItXdhYnVdXxlC0VmaJ+7QAzBMBvenefk5pMU+
         YvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qaeMCYjZPRaH9Ju9SgkSov7Ze/8oIWs13QEihdDThJ8=;
        b=afBkIJ9Hvp1HxFciyNzTrUFP762h+JR1m0ZvoFqQTjSLifGajf65eaTIbyKraFsFfI
         keMTZS4w/8EpOdKByaGaUgB9hW6DZDn0iHHYfpRDvtz8e46ZeCN5LGO3SRB7UP7HP8zb
         xZmmOzErNfReP9t98CReaPsWpDl/QV9z3VZXTmt0kKirMLqBTYnOirve9/Yx4rd+IFJM
         KXP1A6x82tRnsuCJ7zohmfiNCRvIhzOq96q6Ou+AlAA2bxGZLXqs1T2q6u5cQJ1fQOo2
         QK0HVUlEe6wGg0YjJVttsAU/ap4d5yiPl46Tm63WNoI7frUnSX5OdS65Cpvume30bqj6
         R8pg==
X-Gm-Message-State: APjAAAUeqi7LUGW8fMWT6iWfzCsghDM7k2NqPLLnEkTn1sIYbeNWR8gq
        f2F0kxLiCVXyMeEelJReg/chEGBMFKYqVjrSORDiDg==
X-Google-Smtp-Source: APXvYqwXltbLynYwpGAPcFo116M4pb5TeU6PcSlbflTdA2waTF273hEyMScZ1wWzwpDkltR4r+LG+7VVFEkP7Odi6Ik=
X-Received: by 2002:aca:ad09:: with SMTP id w9mr2447606oie.114.1568902609135;
 Thu, 19 Sep 2019 07:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <1568885957-2968-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1568885957-2968-1-git-send-email-Anson.Huang@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 19 Sep 2019 16:16:38 +0200
Message-ID: <CAMpxmJW1Z2WAAcCByPM=MS+PZdo-xxBjsVraHdnftwx-WzRA_A@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: mxc: Only getting second IRQ when there is more
 than one IRQ
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dl-linux-imx <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 19 wrz 2019 o 11:40 Anson Huang <Anson.Huang@nxp.com> napisa=C5=82(a)=
:
>
> On some of i.MX SoCs like i.MX8QXP, there is ONLY one IRQ for each
> GPIO bank, so it is better to check the IRQ count before getting
> second IRQ to avoid below error message during probe:
>
> [    1.070908] gpio-mxc 5d080000.gpio: IRQ index 1 not found
> [    1.077420] gpio-mxc 5d090000.gpio: IRQ index 1 not found
> [    1.083766] gpio-mxc 5d0a0000.gpio: IRQ index 1 not found
> [    1.090122] gpio-mxc 5d0b0000.gpio: IRQ index 1 not found
> [    1.096470] gpio-mxc 5d0c0000.gpio: IRQ index 1 not found
> [    1.102804] gpio-mxc 5d0d0000.gpio: IRQ index 1 not found
> [    1.109144] gpio-mxc 5d0e0000.gpio: IRQ index 1 not found
> [    1.115475] gpio-mxc 5d0f0000.gpio: IRQ index 1 not found
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
>         - use local variable irq_count instead or err to avoid confusion.
> ---
>  drivers/gpio/gpio-mxc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 7907a87..c77d474 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -411,6 +411,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>  {
>         struct device_node *np =3D pdev->dev.of_node;
>         struct mxc_gpio_port *port;
> +       int irq_count;
>         int irq_base;
>         int err;
>
> @@ -426,9 +427,15 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>         if (IS_ERR(port->base))
>                 return PTR_ERR(port->base);
>
> -       port->irq_high =3D platform_get_irq(pdev, 1);
> -       if (port->irq_high < 0)
> -               port->irq_high =3D 0;
> +       irq_count =3D platform_irq_count(pdev);
> +       if (irq_count < 0)
> +               return irq_count;
> +
> +       if (irq_count > 1) {
> +               port->irq_high =3D platform_get_irq(pdev, 1);
> +               if (port->irq_high < 0)
> +                       port->irq_high =3D 0;
> +       }
>
>         port->irq =3D platform_get_irq(pdev, 0);
>         if (port->irq < 0)
> --
> 2.7.4
>

Applied, thanks.

Bart

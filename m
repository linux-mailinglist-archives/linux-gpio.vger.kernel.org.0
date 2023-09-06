Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F83793FF8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Sep 2023 17:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240849AbjIFPIg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Sep 2023 11:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238930AbjIFPIf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Sep 2023 11:08:35 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755E11700
        for <linux-gpio@vger.kernel.org>; Wed,  6 Sep 2023 08:08:32 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3a81154c5f5so2465621b6e.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Sep 2023 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694012912; x=1694617712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gavJuxwmSmgP/RUUA9/YWvKZcfoiOmepb1zXwUNO4U=;
        b=PWSEgOx9P+D4R6+bemBstJNujTZgaHLRVY6ovNYTKjOu0N1hjkdAjCvi7foajgC7Hs
         HoqvsA0Sj/X4LJqM8o4yjhK73IwpnKPd+RbT52LVTbBh8Qh+2BjB47SQ2QgAlBbz+wvU
         Rzdxa6UL824qTP9GLyzg6jbWgRhsxkl1pJepnkz4bAKCJGtEXUduSdhW9KwAaKImm+Pb
         hCDfYT+kTW1KoICBnwkMpDNR+azPk3Y3Y9yGJuQAqTCh4MtlmkH+ZPptMRcDPgoyOXi0
         gduTK96MOI+RoE6ya58sTDGUtbhN138MVPfMFkp1JCRS5SD8H0x+nFdR1q0FgVT/yNEn
         /JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694012912; x=1694617712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gavJuxwmSmgP/RUUA9/YWvKZcfoiOmepb1zXwUNO4U=;
        b=edWDD3plL9t7tLbsUXs1e7CUd+NAia6ch/Gnmyr2j5u8gOHIi0qn2byiuLSHU5gTKN
         jY16y3RlVvhl73646C12lwVw+0AF7aQJUwLSbH0N/s6TtncKGN0kycZ4+SjJ8y9R94Fj
         kEWcmIWnXXEqF0X2u2YH5IxpC2qo8+B7+cYWTf9Q/N1kp1Lm2qdwHYenrNO1DvRvnvgE
         DbEnKJLrWtaOUsUED1lAoVBraq7OSfJngdi6mEwsezSzIeN5TZngIf4YdSTKrM8XoLc3
         sT1Nu+pY0b13D9pG9Bve9WYlok7NdeY9vNe9QXO2YoMH5AQE39rhjr86WEG5Jfwxhwie
         qhzg==
X-Gm-Message-State: AOJu0Yz+/cpRjjEzY9hAZkcbqxnyVq6YTDkfUHwtHcYhTyuzXuEb1C6l
        oaWbsXX+CDmvDmzhp6QtdRYqVqg/HHy3MTb4uP46lw==
X-Google-Smtp-Source: AGHT+IFjbgZTuKU6H3oUmJrgLNuCUDo2Pl8cy1udmxXL6qwaWoSUE6FZiCZ40D+0fOlDZWtBW7dnOJ7FxWJgQW7y4HA=
X-Received: by 2002:a05:6808:10cc:b0:3a4:6a:6363 with SMTP id
 s12-20020a05680810cc00b003a4006a6363mr21321026ois.14.1694012911788; Wed, 06
 Sep 2023 08:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230901122424.247070-1-daniel@zonque.org>
In-Reply-To: <20230901122424.247070-1-daniel@zonque.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Sep 2023 17:08:21 +0200
Message-ID: <CAMRc=MfB6yN7NHwB+DJRWLREUeZCeSM=2c3-mx4VR2e4JxhiMA@mail.gmail.com>
Subject: Re: [PATCH] gpio: zynq: restore zynq_gpio_irq_reqres/zynq_gpio_irq_relres
 callbacks
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-gpio@vger.kernel.org, manikanta.guntupalli@amd.com,
        linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 1, 2023 at 2:34=E2=80=AFPM Daniel Mack <daniel@zonque.org> wrot=
e:
>
> Commit f56914393537 ("gpio: zynq: fix zynqmp_gpio not an immutable chip
> warning") ditched the open-coded resource allocation handlers in favor
> of the generic ones. These generic handlers don't maintain the PM
> runtime anymore, which causes a regression in that level IRQs are no
> longer reported.
>
> Restore the original handlers to fix this.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Fixes: f56914393537 ("gpio: zynq: fix zynqmp_gpio not an immutable chip w=
arning")
> Cc: stable@kernel.org
> ---
>  drivers/gpio/gpio-zynq.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 0a7264aabe48..324e942c0650 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -575,6 +575,26 @@ static int zynq_gpio_set_wake(struct irq_data *data,=
 unsigned int on)
>         return 0;
>  }
>
> +static int zynq_gpio_irq_reqres(struct irq_data *d)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(d);
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(chip->parent);
> +       if (ret < 0)
> +               return ret;
> +
> +       return gpiochip_reqres_irq(chip, d->hwirq);
> +}
> +
> +static void zynq_gpio_irq_relres(struct irq_data *d)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(d);
> +
> +       gpiochip_relres_irq(chip, d->hwirq);
> +       pm_runtime_put(chip->parent);
> +}
> +
>  /* irq chip descriptor */
>  static const struct irq_chip zynq_gpio_level_irqchip =3D {
>         .name           =3D DRIVER_NAME,
> @@ -584,9 +604,10 @@ static const struct irq_chip zynq_gpio_level_irqchip=
 =3D {
>         .irq_unmask     =3D zynq_gpio_irq_unmask,
>         .irq_set_type   =3D zynq_gpio_set_irq_type,
>         .irq_set_wake   =3D zynq_gpio_set_wake,
> +       .irq_request_resources =3D zynq_gpio_irq_reqres,
> +       .irq_release_resources =3D zynq_gpio_irq_relres,
>         .flags          =3D IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED=
 |
>                           IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
> -       GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>
>  static const struct irq_chip zynq_gpio_edge_irqchip =3D {
> @@ -597,8 +618,9 @@ static const struct irq_chip zynq_gpio_edge_irqchip =
=3D {
>         .irq_unmask     =3D zynq_gpio_irq_unmask,
>         .irq_set_type   =3D zynq_gpio_set_irq_type,
>         .irq_set_wake   =3D zynq_gpio_set_wake,
> +       .irq_request_resources =3D zynq_gpio_irq_reqres,
> +       .irq_release_resources =3D zynq_gpio_irq_relres,
>         .flags          =3D IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
> -       GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>
>  static void zynq_gpio_handle_bank_irq(struct zynq_gpio *gpio,
> --
> 2.41.0
>

Thanks Thorsten for bringing it to my attention.

Daniel: please use scripts/get_maintainers.pl when sending patches.
This was sent neither to my email address from the MAINTAINERS file
nor to my linaro address.

Other than that, this looks good, applied for fixes.

Bartosz

Return-Path: <linux-gpio+bounces-24936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2273B34047
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 15:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02E5D3A9D23
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 13:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328301E0E08;
	Mon, 25 Aug 2025 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q38JW+gB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4CB15D3
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756126954; cv=none; b=GgmezE9jfJ7koz28oOaqr5dtESV7fdRUFIOE36GNKQW+/juTcgT1aEqA3P0OtydzqhubquanzL4D0RRNdmijIxebNGsyOPMg2wzgGBoRSd9rC7Nv6iWoSs7EF2nwWH36kVSmS1rzJv4xbJ/4HhICq1rLB/4zg2dCgK+CD8QBrSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756126954; c=relaxed/simple;
	bh=RUe7pp4xIBVwL+ohweLdsRy2XB07ZVUCszgIoLrntk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2Gew8+ViCR/IYHx7BCdHor+gx/ciPUaUxXhTaBEzd30nwHjlLZZgyeakKGHb2fHEEG4vX3c0Zxx0p1lAXEOA1BZU4WqO+neASifKW6ALkn+hmd7TSngniyvnoeFkoAogNb035rB4Z2iC4Lm+/Teqm+91U5J/EotQinoDrTTVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q38JW+gB; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-333f9145edaso32941921fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 06:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756126950; x=1756731750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qlNbTonn3k9dHTKDIxbFD3ecc/jQTJTOnDOSezLWog=;
        b=q38JW+gB+Yx4heN7jHVGw+O+XZeiEbjtiibWkePSRHFTuSNQYIL7h6ukGyYwGoMqpt
         mgb6JtnTPjBhqumbC/lPAx6KhFBjCQRPyzE0nUIod2LuNEeppBeo3MY0xl3heJty5JxB
         g0AN6dD8rs5ETYDNywM3yR8NO5DBUi5UA/cWQ7gEAolLpqEyIdt7ip2qUB3sR/YjRLvf
         tO0Hf44bCqAN9ttOG3160Adf5QDkMA/b89obv5MnnUyu+RWxhFjCGkY5n7XYLv4mYsIU
         rFh9INOBWV9ZyUf8MLHh1RJQL4LycH9d4xEfe78Ly90jqPmAyZylon/6fsgl37DNKWsB
         X4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126950; x=1756731750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qlNbTonn3k9dHTKDIxbFD3ecc/jQTJTOnDOSezLWog=;
        b=s4BhLIRll3gIW1L05OlV4Ckr75VoEFFoTZepyX3h/7Lh4losVBj53GaZM8nKsO9Zm7
         5QdmibeQ6ZSslDws/EWk8YEjH4TfJnVHJu/IyzOyDdmPq/7Lme6TVWSrMHyTYZtkHnN4
         MgIE1liirtcdQSdBr3cPxuNxYV8E07O3p1+yFXQ7yrCoLODNiBGuwj6c6e4zJAEM5hAS
         ru+QNJgzd5tkzk+uGPCApZ2mlBjnmSH85MRm7kCI93DgnoNwigpa5fVo9XMJ0O+q6x8f
         vXiVyjswsubC4Zz0RIfGk/muHCRMXB7Yik0OH0jkHuO2Q/+gHwR2hb/XgOKzz/r2qWx2
         fOyA==
X-Forwarded-Encrypted: i=1; AJvYcCWKtjkjAg0+AnNO0py8nCu+3fD+SX6BhsCbTjlNgtTMdDy7Egc5efQ75yBsT0S+jxzFC7gXNcHQ56n5@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVfG7lKIxSGbGgeGftDvixlAxkO4uJFUteYeJmsISvu2fpf35
	qrme0EqDFaamooUufuXeI/9wEgmfPyjpd+CxYN0IhxwR1Fc/xxgLRYt8OHEVQaPNIbJcUb/0/dn
	UHJq9oq2tc3ti4AYhFZBLMw4yzvfiigcca75LogDBVA==
X-Gm-Gg: ASbGncvgC2K0psmRAUkm7OBYUJW7qA/phcXpp0Su8KBf/I5gAvcgMGDG2Dg8BiV8Awo
	GOe+de0rBkEuPcrBjlTVQMzy7UkSvRV4X+VjFVtsCWLfyH13O0oJLJVrTVHhGJhMWAlWKGacUvi
	aTwfXPaZNbNImZ04Fvgfjle5rx1KfAcB0eVMPTjJIOKwokaZ61QJ2U7xsOoOV50Z6+T2uMbnjVZ
	R7vmHQ4dnTGOHkxZdeFgJqmO6qE98jkEizPR1E=
X-Google-Smtp-Source: AGHT+IE1cPp7/f2NM1rVH6MrrLLid9uO1WDm7Tr7hJO4vukRyYAlROcawa5lviPhg4lAzMblh0nEsperMiDMgmGGDrU=
X-Received: by 2002:a05:651c:1501:b0:336:511a:5cd9 with SMTP id
 38308e7fff4ca-336511a5e23mr34251991fa.45.1756126949664; Mon, 25 Aug 2025
 06:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756104334.git.christophe.leroy@csgroup.eu> <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
In-Reply-To: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 15:02:18 +0200
X-Gm-Features: Ac12FXy9S__uk5RovBEBeE_m8RhEgixkMtqWHgPxd5PT8kPlrjjc0TrS2oxEL_I
Message-ID: <CAMRc=McNAC-pN1=UUrhXVx8qQiv37HRubui6DMLVRcGg2ZONKA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 8:53=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>
>         qe_pio_b: gpio-controller@1418 {
>                 compatible =3D "fsl,mpc8323-qe-pario-bank";
>                 reg =3D <0x1418 0x18>;
>                 interrupts =3D <4 5 6 7>;
>                 interrupt-parent =3D <&qepic>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 fsl,qe-gpio-irq-mask =3D <0x01400050>;
>         };
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index a338469cebe4..91d469403126 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> @@ -32,6 +33,8 @@ struct qe_gpio_chip {
>
>         /* saved_regs used to restore dedicated functions */
>         struct qe_pio_regs saved_regs;
> +
> +       int irq[32];
>  };
>
>  static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
> @@ -135,6 +138,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, uns=
igned int gpio, int val)
>         return 0;
>  }
>
> +static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct qe_gpio_chip *qe_gc =3D gpiochip_get_data(gc);
> +
> +       return qe_gc->irq[gpio] ? : -ENXIO;
> +}
> +
>  struct qe_pin {
>         /*
>          * The qe_gpio_chip name is unfortunate, we should change that to
> @@ -295,6 +305,7 @@ static int qe_gpio_probe(struct platform_device *ofde=
v)
>         struct device_node *np =3D dev->of_node;
>         struct qe_gpio_chip *qe_gc;
>         struct gpio_chip *gc;
> +       u32 mask;
>
>         qe_gc =3D devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
>         if (!qe_gc)
> @@ -302,6 +313,14 @@ static int qe_gpio_probe(struct platform_device *ofd=
ev)
>
>         spin_lock_init(&qe_gc->lock);
>
> +       if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {

Please use device_property_read_u32 and stop including of.h if
possible (it seems it is upon visual inspection).

Bart

> +               int i, j;
> +
> +               for (i =3D 0, j =3D 0; i < ARRAY_SIZE(qe_gc->irq); i++)
> +                       if (mask & (1 << (31 - i)))
> +                               qe_gc->irq[i] =3D irq_of_parse_and_map(np=
, j++);
> +       }
> +
>         gc =3D &qe_gc->gc;
>
>         gc->base =3D -1;
> @@ -311,6 +330,7 @@ static int qe_gpio_probe(struct platform_device *ofde=
v)
>         gc->get =3D qe_gpio_get;
>         gc->set =3D qe_gpio_set;
>         gc->set_multiple =3D qe_gpio_set_multiple;
> +       gc->to_irq =3D qe_gpio_to_irq;
>         gc->parent =3D dev;
>         gc->owner =3D THIS_MODULE;
>
> --
> 2.49.0
>


Return-Path: <linux-gpio+bounces-2660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6DD83F22D
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76EA7286D8C
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 23:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BBE20307;
	Sat, 27 Jan 2024 23:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRrxnhHt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C8920330
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 23:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706398420; cv=none; b=EWjmM7qSo2zaQ3Qw5yXMaay3bTEG9/VTtXst5ntd/O67j1insL8+Al5fTrQdElVoH2brVOYEb/UyQxIA7qD8MdxgnXIsCJa+aVWhH/m7LDk8mTWKIGeCBrCqOf16txshhv6Z26jTFx+Z7QqdefJpGSJVn7QTfPAGCxGCpNz9d44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706398420; c=relaxed/simple;
	bh=AKmQOSDJUHVCp8enLhSmqwwWGGlHRO2KUcSOqhEATEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9iumgfCTHrymvvOFKY+W07x5AMy/dRAEJx2N1/QeBoG/V8CxAi4ytzWivM94lclmIp2wqG8lNm7pAI4va84c7ZB3fPxJ4yU/BRDm0jRtecmPLkCltIwh1dzEC5jPtC28JSgl1ElVxealr3uVLtM08KKL+N9L5WqXSPYypS0388=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRrxnhHt; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ff828b93f0so17346737b3.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 15:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706398417; x=1707003217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjk5TjN3e4CujJkcyDdIuVVrZ16DzmScuHfifhjJf3w=;
        b=tRrxnhHt3e2004OJXDWN4ppYlPH3+1ESQtA6Z1lPnwRWyb756QnKion0/JYa10I8Kd
         KSkUvWIuN9ImKzQxAEClhJAFA/aCcWix4KLUcLsd3B7DtV8q3o4+vGK66Vhv+Oxq5vPO
         bdKEGV5B/sdj4YYd8B8RM1B3T/LufIbI9hFXxsWgXCovUZKFrlUtZb8KufWRNG0h34OE
         DtWM92wIaf4eUigWGhSFXpG9Obw7AYiJTd2NYbNFtjUngHimAelGgEIXHCo5tq9HomVv
         SIEYuKAhwxf9xida32MK9YIE4vA9nouqXypA3PIl+EJiLfNe83GrJElN6abH4LJ9OJqj
         cdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706398417; x=1707003217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjk5TjN3e4CujJkcyDdIuVVrZ16DzmScuHfifhjJf3w=;
        b=aztVd5FU2eHdCUJyo5vS1QQ6xDkgPLosi+S0fUqz8KM4pcAn6VgbxfVG1XAwarIAxP
         EeVEgTm7Q9M4MN9z9lNa322uD/LJeSaxAbTSdjg1CILWHhgn4QuUq5Ju677deS+I7k15
         esfnIP/CZR+ZK0onnxf1MpWLBxLU5MdwjXcytGNbIpua6tKQZKfZpOp2rSI3VMW787S+
         t989cMqI70wvYf10wDhziNmAURus8Ce3qmg5q0AZLzioUccXP3GL4D1L/sXz8n5pGAXc
         xT3bdbUha/6c5tE9Qk6NnReljXIpPtvGnWCCDFfT63eXSsY/hh5VqY5uFr+3Pa4K1aGW
         j/qA==
X-Gm-Message-State: AOJu0YxM68xcibuYWIb/jPp1Tm6r2DZs2HYw1neKQK2MtjwgEMu/kcNQ
	kMP7TDgClP7eetLGTZE8Ihx+1TN4NbSrnai8MPPJZ2lk/py9yfG5UoYdjzq4sAWOkiBiXRm0W9p
	Ky2VFRgdYe/SWMjClek0klkzB708qvfjkbb2mGg==
X-Google-Smtp-Source: AGHT+IE4dcccCEbQeihI3WL932A84/O0oOrLVoFknlXg47wcDttREAsCbLva8RomwckZu+AizukRocf64P6phpkxwtk=
X-Received: by 2002:a81:b666:0:b0:603:414b:d357 with SMTP id
 h38-20020a81b666000000b00603414bd357mr1755803ywk.52.1706398417533; Sat, 27
 Jan 2024 15:33:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221083622.3445726-1-yuklin.soo@starfivetech.com> <20231221083622.3445726-3-yuklin.soo@starfivetech.com>
In-Reply-To: <20231221083622.3445726-3-yuklin.soo@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:33:26 +0100
Message-ID: <CACRpkdagPYfSq91dXOTJ9d8VjCMMG2AN3L9-Qxdw3C8tki09EQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] pinctrl: starfive: jh8100: add pinctrl driver for
 sys_east domain
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

thanks for your patch!

On Thu, Dec 21, 2023 at 9:36=E2=80=AFAM Alex Soo <yuklin.soo@starfivetech.c=
om> wrote:

> Add pinctrl driver for sys_east domain.

This commit message is wrong, it also contains the main driver for jh8100.
Please add some proper subject and commit message.

> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
(...)
> +#define pin_to_hwirq(sfp) (((sfp)->wakeup_gpio) - ((sfp)->gc.base))

Please do not reference gc.base like this, it is a gpio internal detail.

Also, turn this into a static inline function, the macro is hard to read.

> +/* pad control bits */
> +#define JH8100_PADCFG_POS      BIT(7)
> +#define JH8100_PADCFG_SMT      BIT(6)
> +#define JH8100_PADCFG_SLEW     BIT(5)
> +#define JH8100_PADCFG_PD       BIT(4)
> +#define JH8100_PADCFG_PU       BIT(3)
> +#define JH8100_PADCFG_BIAS     (JH8100_PADCFG_PD | JH8100_PADCFG_PU)

JH8100_PADCFG_BIAS_MASK

> +#define JH8100_PADCFG_DS_MASK  GENMASK(2, 1)
> +#define JH8100_PADCFG_DS_2MA   (0U << 1)
> +#define JH8100_PADCFG_DS_4MA   BIT(1)
> +#define JH8100_PADCFG_DS_8MA   (2U << 1)
> +#define JH8100_PADCFG_DS_12MA  (3U << 1)

Please use (1U << 1) for 4MA, this looks weird otherwise.

> +static const struct pinconf_ops jh8100_pinconf_ops =3D {
> +       .pin_config_get         =3D jh8100_pinconf_get,
> +       .pin_config_group_get   =3D jh8100_pinconf_group_get,
> +       .pin_config_group_set   =3D jh8100_pinconf_group_set,
> +       .pin_config_dbg_show    =3D jh8100_pinconf_dbg_show,
> +       .is_generic             =3D true,
> +};
> +
> +static int jh8100_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       return pinctrl_gpio_request(gc, gpio);
> +}
> +
> +static void jh8100_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       pinctrl_gpio_free(gc, gpio);
> +}

Skip one level of indirection, just add pinctrl_gpio_request/free directly
into the vtable.

> +static int jh8100_gpio_set_config(struct gpio_chip *gc,
> +                                 unsigned int gpio, unsigned long config=
)
> +{
> +       struct jh8100_pinctrl *sfp =3D container_of(gc,
> +                       struct jh8100_pinctrl, gc);
> +       u32 arg =3D pinconf_to_config_argument(config);

Please don't reimplement .set_config, just call into the pinctrl
backend using

.set_config =3D gpiochip_generic_config

> +static int jh8100_gpio_add_pin_ranges(struct gpio_chip *gc)
> +{
> +       struct jh8100_pinctrl *sfp =3D container_of(gc,
> +                       struct jh8100_pinctrl, gc);
> +
> +       sfp->gpios.name =3D sfp->gc.label;
> +       sfp->gpios.base =3D sfp->gc.base;
> +       sfp->gpios.pin_base =3D 0;
> +       sfp->gpios.npins =3D sfp->gc.ngpio;
> +       sfp->gpios.gc =3D &sfp->gc;
> +       pinctrl_add_gpio_range(sfp->pctl, &sfp->gpios);
> +       return 0;
> +}

Why are you not putting the ranges into the device tree where the
GPIO core will add them for you?

> +       if (info->irq_reg) {
> +               jh8100_irq_chip.name =3D sfp->gc.label;

That's not immutable. The struct should be const.
You have to use .irq_print_chip in the irq_chip.

> +               gpio_irq_chip_set_chip(&sfp->gc.irq, &jh8100_irq_chip);

Use the convention:

struct gpio_irq_chip *girq;

girq =3D &chip->irq;
gpio_irq_chip_set_chip(girq, &nmk_irq_chip);

... and use girq-> in the rest of the assignments.

> +               dev_info(dev, "StarFive GPIO chip registered %d GPIOs\n",=
 sfp->gc.ngpio);

StarFive JH8100 (be precise)

Yours,
Linus Walleij


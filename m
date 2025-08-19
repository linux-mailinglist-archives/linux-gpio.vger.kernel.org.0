Return-Path: <linux-gpio+bounces-24530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63025B2BD94
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B24DA680D2B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 09:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D2631AF27;
	Tue, 19 Aug 2025 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYbJDkXM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9FB311955
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596291; cv=none; b=AqzDGQ/fRetEfBshMW/rSJkxYX9QoyvO2y6Jqh7ubaR33aVS4WjpLTOmZYSOM32a6Dmg0hZHZLv51NArg9DVSyTgZaHfeLlth4TKE7uQ+oVMqm0QQ0cwY299/3sezRD18WYTyuWV4NqhY7ZsjZbOUgp3ByxuccrXXadrdXIUfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596291; c=relaxed/simple;
	bh=gfzxdIAe2xxtBHxvYGko8XA2pI4aPMA6vNi3f4lf2r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUHDo4vNC0yr/6GeY0WUWc/ygw7AdoF9B7H98+pyGGOljJlSCc6NKeBJNMLhYZKK8TdQ/ViiasfOxvPRz9rNaqrqVsXAUhgE7CTmvORl2k9tQwjkJYgY9ibLEwSYDRqpOsNDsmjv91bC1R7eAswMbno3F+jtazhZZWnDNjeDzJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYbJDkXM; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55e041f6da0so63447e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596287; x=1756201087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45Gyirnivv46PMdh1Lnt9ECnMjdDdutOYsw1cHCwkIY=;
        b=jYbJDkXMgcu6l9dIFmeOeTaPXIg7798Wq4QNJCRNEk5TPokutSvsoSIE+TVaL1mpqQ
         1ET7tc040Qi5Ap7z4ia7TdVqyJhxB1adjIn7S1qSSCwWxWIVhfnGim+oE1+lHxgHnI6i
         AN2k3PdXs9S3SOEzJ3p34Y3kqzUQDJaOSwkisP+NAZiJkHDRnmMIjTQnpRCimt7+bd9G
         jEcqTxPztgMcne4YOivTKf8C+MjVIGM3o+QUlhUiEMBYxdSOS597v2W5lpJyi7Ro9dpx
         C7OTGV70URJgsJwPg3ysxmH9oh1JbkeIvUlGtwcyZg2zvQgmyZIDcZ8wE/pexUS25qns
         MgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596287; x=1756201087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45Gyirnivv46PMdh1Lnt9ECnMjdDdutOYsw1cHCwkIY=;
        b=HHOxPPmLbAkYoEyPLJssRr8Vd8Ee57I1m0vwO0LzocMY4gb/zV/Ut4Vr/8orWHCzc5
         4qSq/CGn/qjuJSVIUE4qftVFwQPM83hRoj0mqhogXoxqfbDm2Dd3BNnsH2m+4qnmS/7t
         KwH9A3gI5YNoHuyF1plH6Bqjlfhf6WgpJJ5NlMnj/YlJCOlf+P+rtd5Vhg8IQXjgSSfP
         4tN8K708psGPhW+MBI93kmhdfkJcfAMapzbDqVffldsF9VyQDSTlpv90U3eN9IHKunHx
         DdbhS/t0r2o8GG6dUzlw8oyO1B/YfTlb45AMW8DA2mgv20tg90VoOj/ti6FItnAHFb6E
         eujQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlO7OpPx1NVyzo9RbpCMzcw4E6So7ZDAdiBIiBKSF2+77CoM4H1/+wXTZluRwitqKy39/x3z4kSh6d@vger.kernel.org
X-Gm-Message-State: AOJu0YzhT+XL36XeYbuUWaPHlg7UWDDIvKYM3yrTR5dTzalGgrtTycoO
	X6BuyspprdM5hgJ0qaDhM8ATymUkc6Lwk7sH4acsYl/YRoKhzqqhh1GooDrVXBBTXtwjqE9n1zu
	JUTaH1rOXe8mpZFUG0Gw/ccY46b3PD1+y+p72AWP3lQ==
X-Gm-Gg: ASbGnctMG+bEvT16pzQBVgvBAijfWEz93HLsb5y3eAAaol7Q7yG9ejNgsdHJ05Zkwmh
	1TTIRK1ugsbPTxXw201aidMA0THMNZf5b9gxIBTLibXty4T4fhh6S+bID7F/e12S4P3FIdRi8ZP
	wsxtxmTdhJoo6M4Ci9gGEVCpE7sxPXTWrjE7EQ9OyxQ6svYl7Zg4/cfjGNz0/7MK4vItri2A8hr
	iiwuusUY2+R
X-Google-Smtp-Source: AGHT+IGXVlOojxEDcgD+SsNiM3vrgcb4bOifDf292PuQ3chLA4qwroPbPD5ZSWbbg/JQdXsFHTqAE1Hi5Seml5pOfAI=
X-Received: by 2002:a05:6512:2c89:b0:55b:8f46:80f4 with SMTP id
 2adb3069b0e04-55e00863d0bmr581512e87.48.1755596286911; Tue, 19 Aug 2025
 02:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1754922935.git.andrea.porta@suse.com> <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
In-Reply-To: <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:37:55 +0200
X-Gm-Features: Ac12FXzbOSTWApe1RnzVXH6U4DB1jaUnJzvcIC1jxBa1XB9XRDcN_qZMPH3lBoA
Message-ID: <CACRpkdaH8sxQQFmx9-Gzc6ybJ_AFvLUCk=MiS=0KiB4VhZhXaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrea/Ivan,

thanks for your patch!

I'll make a bit of detailed review below, the big question I have
is if it is possible to split the files a bit, like:

pinctrl-brcmstb.c  <- STB core
pinctrl-brcmstb.h  <- STB API
pinctrl-brcmstb-bcm2717.c <- All BCM2712 specifics

This would make it easier to reuse the base file with other STB
chips, right?

On Mon, Aug 11, 2025 at 4:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> +#define FUNC(f) \
> +       [func_##f] =3D #f
> +
> +#define PIN(i, f1, f2, f3, f4, f5, f6, f7, f8) \
> +       [i] =3D { \
> +               .funcs =3D { \
> +                       func_##f1, \
> +                       func_##f2, \
> +                       func_##f3, \
> +                       func_##f4, \
> +                       func_##f5, \
> +                       func_##f6, \
> +                       func_##f7, \
> +                       func_##f8, \
> +               }, \
> +       }

These macros have a bit too generic names. Prefix with BRCMSTB_* or
something please.

> +#define MUX_BIT_VALID          0x8000
> +#define PAD_BIT_INVALID                0xffff
> +
> +#define BIT_TO_REG(b)          (((b) >> 5) << 2)
> +#define BIT_TO_SHIFT(b)                ((b) & 0x1f)
> +
> +#define MUX_BIT(muxreg, muxshift) \
> +       (MUX_BIT_VALID + ((muxreg) << 5) + ((muxshift) << 2))
> +#define PAD_BIT(padreg, padshift) \
> +       (((padreg) << 5) + ((padshift) << 1))
> +
> +#define GPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
> +       [n] =3D { MUX_BIT(muxreg, muxshift), PAD_BIT(padreg, padshift) }
> +
> +#define EMMC_REGS(n, padreg, padshift) \
> +       [n] =3D { 0, PAD_BIT(padreg, padshift) }
> +
> +#define AGPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
> +       GPIO_REGS(n, muxreg, muxshift, padreg, padshift)
> +
> +#define SGPIO_REGS(n, muxreg, muxshift) \
> +       [(n) + 32] =3D { MUX_BIT(muxreg, muxshift), PAD_BIT_INVALID }
> +
> +#define GPIO_PIN(n)            PINCTRL_PIN(n, "gpio" #n)
> +#define AGPIO_PIN(n)           PINCTRL_PIN(n, "aon_gpio" #n)
> +#define SGPIO_PIN(n)           PINCTRL_PIN((n) + 32, "aon_sgpio" #n)

These are also pretty generically named, but this is OK because they
don't intrude on the pinctrl namespace as much.

> +static inline u32 brcmstb_reg_rd(struct brcmstb_pinctrl *pc, unsigned in=
t reg)
> +{
> +       return readl(pc->base + reg);
> +}
> +
> +static inline void brcmstb_reg_wr(struct brcmstb_pinctrl *pc, unsigned i=
nt reg,
> +                                 u32 val)
> +{
> +       writel(val, pc->base + reg);
> +}

This looks like unnecessary indirection. Can't you just use readl/writel?

> +static int brcmstb_pinctrl_fsel_set(struct brcmstb_pinctrl *pc,
> +                                   unsigned int pin, enum brcmstb_funcs =
func)
> +{
> +       u32 bit =3D pc->pin_regs[pin].mux_bit, val;
> +       const u8 *pin_funcs;
> +       unsigned long flags;
> +       int fsel;
> +       int cur;
> +       int i;
> +
> +       if (!bit || func >=3D func_count)
> +               return -EINVAL;
> +
> +       bit &=3D ~MUX_BIT_VALID;
> +
> +       fsel =3D BRCMSTB_FSEL_COUNT;
> +
> +       if (func >=3D BRCMSTB_FSEL_COUNT) {
> +               /* Convert to an fsel number */
> +               pin_funcs =3D pc->pin_funcs[pin].funcs;
> +               for (i =3D 1; i < BRCMSTB_FSEL_COUNT; i++) {
> +                       if (pin_funcs[i - 1] =3D=3D func) {
> +                               fsel =3D i;
> +                               break;
> +                       }
> +               }
> +       } else {
> +               fsel =3D (enum brcmstb_funcs)func;
> +       }
> +
> +       if (fsel >=3D BRCMSTB_FSEL_COUNT)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&pc->fsel_lock, flags);

Please use lock guards instead, we do that in all new code:

#include <linux/cleanup.h>

guard(spinlock_irqsave)(&pc->fsel_lock);

The framework handles the flags variable and the freeing,
look at other drivers using guard() for guidance.

> +static int brcmstb_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                          struct pinctrl_gpio_range *ran=
ge,
> +                                          unsigned int pin)
> +{
> +       struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       return brcmstb_pinctrl_fsel_set(pc, pin, func_gpio);
> +}
> +
> +static void brcmstb_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
> +                                         struct pinctrl_gpio_range *rang=
e,
> +                                         unsigned int offset)
> +{
> +       struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       /* disable by setting to GPIO */
> +       (void)brcmstb_pinctrl_fsel_set(pc, offset, func_gpio);
> +}
> +
> +static const struct pinmux_ops brcmstb_pmx_ops =3D {
> +       .free =3D brcmstb_pmx_free,
> +       .get_functions_count =3D brcmstb_pmx_get_functions_count,
> +       .get_function_name =3D brcmstb_pmx_get_function_name,
> +       .get_function_groups =3D brcmstb_pmx_get_function_groups,
> +       .set_mux =3D brcmstb_pmx_set,
> +       .gpio_request_enable =3D brcmstb_pmx_gpio_request_enable,
> +       .gpio_disable_free =3D brcmstb_pmx_gpio_disable_free,
> +};

With regards to the GPIO "shotcut" functions:
please familiarize yourself with Bartosz recent patch set:
https://lore.kernel.org/linux-gpio/20250815-pinctrl-gpio-pinfuncs-v5-0-955d=
e9fd91db@linaro.org/T/#t

This makes it possible for the pinctrl core to know about
functions that are used for GPIO, so you can mark your
pin controller as "strict". using the new .function_is_gpio()
callback.

I plan to merge Bartosz series soon and if your pin controller
is aware about which functions are GPIO functions, this makes
things better.

> +static int brcmstb_pull_config_set(struct brcmstb_pinctrl *pc,
> +                                  unsigned int pin, unsigned int arg)
> +{
> +       u32 bit =3D pc->pin_regs[pin].pad_bit, val;
> +       unsigned long flags;
> +
> +       if (bit =3D=3D PAD_BIT_INVALID) {
> +               dev_warn(pc->dev, "Can't set pulls for %s\n",
> +                        pc->gpio_groups[pin]);
> +               return -EINVAL;
> +       }
> +
> +       spin_lock_irqsave(&pc->fsel_lock, flags);

Use a guard()

Yours,
Linus Walleij


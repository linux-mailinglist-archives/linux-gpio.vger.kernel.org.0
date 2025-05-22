Return-Path: <linux-gpio+bounces-20477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27FAC0C1B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 15:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76FD33A30A0
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 13:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D1528B4F2;
	Thu, 22 May 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H5c8q866"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753E33010C
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918880; cv=none; b=owm5ineI2vGJ21Bv908sAupYXyh2PB0AXllRmXQbbdjAkNjUbmFj+dRBdqOdsyAMrYaK+b3c6QThSFIUwjoluhUDGkUsFJlVvH8PPXx1cZtFXJNfy5JLKBtzz0pTK7Hs97tBES3xAZnPs8ggEQNj11Z1yMisl22EeimSow5vWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918880; c=relaxed/simple;
	bh=dyHhktMA+tP6K9DkwriiNHXh1gKPz9cPXffhriQHbYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oz/lLOt6Nyo0cWupCQXpV4w2Rtmua5J/xlLjTve+P4zJuQHqfqI1Kb+xB9w6jJo0QqRWMNRnKdLzb27ZgK5+nSWr4Z22RQHClmpG5hvYt2jESry+USRJZjPEmEvPn43431mrtlA7NEsqkT2c82ZnQrCg0yXkeCtI1rhWV3Xgl0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H5c8q866; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso9579072e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 06:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747918876; x=1748523676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzu+PRVXcOL8yrXNh1C3D66rYRdfVDajFRg4W7HU2/U=;
        b=H5c8q866PU2olvrfRdCEzxfs5UqFPCJMlqXXzSEXsxL5wjcfX68lHYvdD1lpx7VvYR
         jqk8ChlF/3FyxPHO7ilFWoR6fYkD4pecoWGltnsy96k+m1HkAbAz8sQogTwFuLQkptra
         Ufv19xKEPummZ69LGAdIMxyde9VE/+vwiSRx62rhTCDn0oQS9e0Xy43cOyFwibBtv/PN
         5w7x75QhSG9DFdGyBUaolHSu50bpprwtiGLlS5tbQYJc98P1oBcSBrYyPTGQQpGeDkMT
         vSYuBDc9kVlk+4p135FHfCSw95UTuRSJ+54XFqN/pc8cIYMHeqkq0kNq67raQOtWTCcw
         tqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918876; x=1748523676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzu+PRVXcOL8yrXNh1C3D66rYRdfVDajFRg4W7HU2/U=;
        b=cIyR38HRAbcb43ZifbQeNoNPv2FTrxycmWZGuSjTLkhq1l3+2/HL2VGjpSiE6w5C96
         GP+GlKYEWhRuvSsie6NJs7gtLnEKWHwkAS5nxLqmpSX0km9yVUIX09cE+tZpIz3kPnIr
         G8c3yogcHykRReNvFcq4FhIH3kiYMWWjoN3QOIHENpmyd9x3kJ1kk0CNA+7hgPzRxOHD
         dlh8xdxzZ+NBxcft3Du1plnk/BwAQoJcW7Q9HMuS51760BCUl2O3I/t6zZsonBI5pOQ/
         rgpWiq7/89OJ02n4x4s6faiDLl7nD19HeR4wGHLxLSjZiHyzTGCcGRKggwo/RUf7l/TE
         A62Q==
X-Forwarded-Encrypted: i=1; AJvYcCUY72sVdQ5fI9k8YD8ytnPvPt9ogXsc1d+Dyra+1UuVihBZEWFQbkSoanPe5gwaUj3lisKhqbb4xdo9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ8Wfo3Fwl7pEZj4x0dCtOOsnvxmbE4cmn8oUpa0wboUhAjAE7
	3ABluTMiKD2/LikQXRn3uR+anOG8qNJPa3AEw6UXcceHRCl9wnGBUWSGlAOIuvC8j58aCDd2ftr
	XpMsfUNn3CIxx+98VrJyPgoDc/D1Tv9dGNZwUVp1XCA==
X-Gm-Gg: ASbGncupy5sTvTm9ZIjTxi3TPjIChYLEMbYgGWdVUjf5R99Wrxml8RuRBh0adh+t2wo
	5MxEtmF2ZcAJyDxMej7WFmWMPW6k8KCrDs7O4j6lXtUvOnel1MBvIdmQN0nTQpImsxiwEWpEfYm
	sZpog12II/PjjIcIYBPwONCJz+K1501FaQfET1pbUyn3b9t+swoZA82+rDeDnby+kq
X-Google-Smtp-Source: AGHT+IEKXZsuXa61rx7iYXVdN5gAUYZ6t4jPh8WeQF1z9sKal0LbQMPKsCLBhIwfmsJA3Pg+puN9L64R+OYtBY9d0U8=
X-Received: by 2002:a2e:a594:0:b0:30c:4610:9e9e with SMTP id
 38308e7fff4ca-328077c36ecmr91178471fa.35.1747918874917; Thu, 22 May 2025
 06:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-mdb-max7360-support-v9-0-74fc03517e41@bootlin.com> <20250522-mdb-max7360-support-v9-6-74fc03517e41@bootlin.com>
In-Reply-To: <20250522-mdb-max7360-support-v9-6-74fc03517e41@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 May 2025 15:01:03 +0200
X-Gm-Features: AX0GCFsKBsNYnfZ6NFYjJv1MLR5Cl4LpJ53FIqsJ0O4hK_3tLeUr_p3wGhtMou4
Message-ID: <CAMRc=MeT+b5dBOWyf6-BpTjk70nwVhLOpCY-JHNizBo5H1-AnQ@mail.gmail.com>
Subject: Re: [PATCH v9 06/11] gpio: regmap: Allow to allocate regmap-irq device
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pwm@vger.kernel.org, andriy.shevchenko@intel.com, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 2:06=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> GPIO controller often have support for IRQ: allow to easily allocate
> both gpio-regmap and regmap-irq in one operation.
>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 21 +++++++++++++++++++--
>  include/linux/gpio/regmap.h | 11 +++++++++++
>  2 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 87c4225784cf..9cbbbaf82609 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -215,6 +215,7 @@ EXPORT_SYMBOL_GPL(gpio_regmap_get_drvdata);
>   */
>  struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config=
 *config)
>  {
> +       struct irq_domain *irq_domain;
>         struct gpio_regmap *gpio;
>         struct gpio_chip *chip;
>         int ret;
> @@ -295,8 +296,24 @@ struct gpio_regmap *gpio_regmap_register(const struc=
t gpio_regmap_config *config
>         if (ret < 0)
>                 goto err_free_gpio;
>
> -       if (config->irq_domain) {
> -               ret =3D gpiochip_irqchip_add_domain(chip, config->irq_dom=
ain);
> +#ifdef CONFIG_REGMAP_IRQ
> +       if (config->regmap_irq_chip) {
> +               struct regmap_irq_chip_data *irq_chip_data;
> +
> +               ret =3D devm_regmap_add_irq_chip_fwnode(config->parent, d=
ev_fwnode(config->parent),
> +                                                     config->regmap, con=
fig->regmap_irq_line,
> +                                                     config->regmap_irq_=
flags, 0,
> +                                                     config->regmap_irq_=
chip, &irq_chip_data);

I don't think using devres here is a good idea. There's no guarantee
that gpio_regmap_register() will be called on device attach so you
must not make the release of the resource depend on an associated
detach which may never happen. Please use the non-managed variant
here.

Bart

> +               if (ret)
> +                       goto err_free_gpio;
> +
> +               irq_domain =3D regmap_irq_get_domain(irq_chip_data);
> +       } else
> +#endif
> +       irq_domain =3D config->irq_domain;
> +
> +       if (irq_domain) {
> +               ret =3D gpiochip_irqchip_add_domain(chip, irq_domain);
>                 if (ret)
>                         goto err_remove_gpiochip;
>         }
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index c722c67668c6..19b52ac03a5d 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -40,6 +40,11 @@ struct regmap;
>   * @drvdata:           (Optional) Pointer to driver specific data which =
is
>   *                     not used by gpio-remap but is provided "as is" to=
 the
>   *                     driver callback(s).
> + * @regmap_irq_chip:   (Optional) Pointer on an regmap_irq_chip structur=
e. If
> + *                     set, a regmap-irq device will be created and the =
IRQ
> + *                     domain will be set accordingly.
> + * @regmap_irq_line    (Optional) The IRQ the device uses to signal inte=
rrupts.
> + * @regmap_irq_flags   (Optional) The IRQF_ flags to use for the interru=
pt.
>   *
>   * The ->reg_mask_xlate translates a given base address and GPIO offset =
to
>   * register and mask pair. The base address is one of the given register
> @@ -78,6 +83,12 @@ struct gpio_regmap_config {
>         int ngpio_per_reg;
>         struct irq_domain *irq_domain;
>
> +#ifdef CONFIG_REGMAP_IRQ
> +       struct regmap_irq_chip *regmap_irq_chip;
> +       int regmap_irq_line;
> +       unsigned long regmap_irq_flags;
> +#endif
> +
>         int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base=
,
>                               unsigned int offset, unsigned int *reg,
>                               unsigned int *mask);
>
> --
> 2.39.5
>


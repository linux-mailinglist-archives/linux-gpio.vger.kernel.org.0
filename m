Return-Path: <linux-gpio+bounces-6887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF218D3F1E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 21:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 254731F24868
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 19:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73891C2335;
	Wed, 29 May 2024 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkGYnJV2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237E2522A;
	Wed, 29 May 2024 19:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717012429; cv=none; b=olnJIi1aStju59FkSYGwt+9GTEHtfuMB6dYnbayQ2Gfx6fE4vSEaDYzqbr0gtumiyc1yEFT0kcoQ4lC/z4rkpsAJEOC+akC8bEFCreXXbJFuNBvtwVSE815FXXbz5Anha+O6AeiPKH4+NKm6XCdfF7b1k5FEOYJW/unyGVh8YcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717012429; c=relaxed/simple;
	bh=TgIN2Vko2QSfeAhaQWA7wstejia7wbLXf1FK1ROIXk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRfYZXFa8wKAXozxybQSonExIS8SBLcTcxCRde5fLBZQ4VuyxdC6Osn3iGCbpO2Izbpn8CYgAhbJFyuzy+SQ5wDWYTqj4APpzvxmsPpS+hOhoyT/zb2f2gz7Frxky8T4+wlbEGfYROImsUOGP9GRS7Vt22fZD8CyVuc5Zr6YrPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkGYnJV2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a63359aaaa6so2949066b.2;
        Wed, 29 May 2024 12:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717012426; x=1717617226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m+eJ0+HTX5hevlSV4OPbUaaD5T4sWeJ+vrIGfi1+BU=;
        b=hkGYnJV2SpsshZiT2LkD5opUJCFkC+gdGYq3PSJIxownC4hdckWUofZJ+1hmAO3+He
         4mFTbf/Yobv1WCZug5NeiWtvKU6ads8sbAKGydvRXHWZCJ+tmLfNZQK7lboHZT1jVcup
         fKShumFHCNwOQfKxgTjfBiAmDQnJg3XY/Eb+MtQ+mSOzZ09H+5DV7DLpR9jz0JTBD/8S
         6bw3vGrNlRgNgfvcCYvW3byNlV4WCY0xA6zcVEVxdHXY9Pw7YSqHBPxkHdD1zJrUNcec
         ooFwkdy0OE0yRrQxV8mNgS7w5ZtFRhs4iSHZpCF9lMW8+kXs4q9MNyAHQ9nterimdGNn
         eXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012426; x=1717617226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1m+eJ0+HTX5hevlSV4OPbUaaD5T4sWeJ+vrIGfi1+BU=;
        b=iBlQcyAEj9m6ZrVp+jla9Ry3FD2lZFSxGhePt+VAnRZPm6UYXIrj5vKoINeJ1xrTZO
         Vjs381UL4ERDQuXzDj3iRCeGJzS4MwGaPuIAipEsuoLBe+EKh4JGSEoJSZUiEkX2avsc
         iWU5U4opZhyyEbmHSE7ozJ1Xr8Dtywb2afogbjkUO4OM9C6IEr0qfyfWV8YJxezC3KO4
         a1cU+LcSV9MJXOgUziAM0flplS30tRzBwZ4+1zAAnT763qwDiZuYaIlhZ+xS1wYZfiC4
         RyikTpl0PX6LW5yCbQ1XvpZ3lwttI/v39F2AAWXA2MYDkChwFXhAHuWD+fDUFkKnmVBt
         BRYw==
X-Forwarded-Encrypted: i=1; AJvYcCUO/O8Pa01AgYY7Tr1F9YLK19GgiiImWJMFaGxPIWxKCqI55m8PTd59dzGnKj7+uxwoMQgC7niZCPnqX+M5gTEu0XEM0cLg/vIh/SAVPdo+e0vU0eVj4Ezl/ZpHe+dBX3BI1ZOY1hyTNA3j1XL+8GKPlZD3XdQHKQ8TVkeAheCLX59KEY5TR1eJKTDwTjYCtiqgXNS23Qzr3ZCUri7bLE+3Qt4V
X-Gm-Message-State: AOJu0Yyw998Gm6ply0ftDV4AGAFexSL2o9ZCX3H73ZG2BMJYIOA6bSLF
	JafUNTNsTy7exBEsTAcIR1Vc115cc3YoUGvUdQ94tlqxlZHTiqXuGgGPBFxPeWr44/YhMarq3+6
	aUlmWXsvVjtGFkUeWQtFZTkJVoes=
X-Google-Smtp-Source: AGHT+IHdLo2Dle0xvU6wdDZvW+5ygpMdmBCnbICN8kcAYk7je6Y+Ci1/SHIdh8p+ng8bmsjWJmc5zj2MS6lW66x6EsY=
X-Received: by 2002:a17:906:4087:b0:a5a:896e:d0b4 with SMTP id
 a640c23a62f3a-a65e8e5d2e3mr11830466b.26.1717012426261; Wed, 29 May 2024
 12:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529162958.18081-1-johan+linaro@kernel.org> <20240529162958.18081-13-johan+linaro@kernel.org>
In-Reply-To: <20240529162958.18081-13-johan+linaro@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 May 2024 22:53:09 +0300
Message-ID: <CAHp75Vcww07EkUDVSMSd+RviQ9_uku=w4pkCWUt8iGTW580eXg@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] mfd: pm8008: rework driver
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 7:30=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Rework the pm8008 driver to match the new binding which no longer
> describes internal details like interrupts and register offsets
> (including which of the two consecutive I2C addresses the registers
> belong to).
>
> Instead make the interrupt controller implementation internal and pass
> interrupts to the subdrivers using MFD cell resources.
>
> Note that subdrivers may either get their resources, like register block
> offsets, from the parent MFD or this can be included in the subdrivers
> directly.
>
> In the current implementation, the temperature alarm driver is generic
> enough to just get its base address and alarm interrupt from the parent
> driver, which already uses this information to implement the interrupt
> controller.
>
> The regulator driver, however, needs additional information like parent
> supplies and regulator characteristics so in that case it is easier to
> just augment its table with the regulator register base addresses.
>
> Similarly, the current GPIO driver already holds the number of pins and
> that lookup table can therefore also be extended with register offsets.
>
> Note that subdrivers can now access the two regmaps by name, even if the
> primary regmap is registered last so that it is returned by default when
> no name is provided in lookups.
>
> Finally, note that the temperature alarm and GPIO subdrivers need some
> minor rework before they can be used with non-SPMI devices like the
> PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
> rather than "spmi" prefix to prevent binding until the driver has been
> updated.

...

> +       dummy =3D devm_i2c_new_dummy_device(dev, client->adapter, client-=
>addr + 1);
> +       if (IS_ERR(dummy)) {
> +               ret =3D PTR_ERR(dummy);
> +               dev_err(dev, "failed to claim second address: %d\n", ret)=
;
> +               return ret;
> +       }


> +       ret =3D devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, clie=
nt->irq,
>                                 IRQF_SHARED, 0, &pm8008_irq_chip, &irq_da=
ta);
> +       if (ret) {
> +               dev_err(dev, "failed to add IRQ chip: %d\n", ret);
> +               return ret;
>         }

I believe there is no harm to use

  return dev_err_probe(...);

for these. But it seems you don't like that API. Whatever, no-one will
die, just additional work for the future :-)

--=20
With Best Regards,
Andy Shevchenko


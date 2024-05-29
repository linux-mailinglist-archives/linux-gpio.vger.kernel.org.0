Return-Path: <linux-gpio+bounces-6888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981E8D3F50
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 22:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304D52891E5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 20:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2EF1C6893;
	Wed, 29 May 2024 20:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWdnTCeU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12FB26AD3;
	Wed, 29 May 2024 20:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717013017; cv=none; b=uGM+XS7MJNMVGtyLGuAfwPV6Nj9DbeeWZbZZR/YCtX/RUMPJXcrj9nri6jEl3VyU3PWgg93xzhsQhGiKyt5NeRIrlPtsBF995ZYwe55bZmZK9T+lDZ8+EfEbAHCkAZ2RRwJYNER+nA7pc58F94J9Nh/h5z+3DfDDP+wy89nyPMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717013017; c=relaxed/simple;
	bh=pMtranmfzFRx/+XwNa7k5baRKOTR3u+ZCQDAChLw+uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOSvmiAcq+tETG3al8kUQfKcORAkh63mT16VcpE088GBTd3wd8vLfAWzZBMIUKQl3K/WInJq7Cz9ic/fl0zjOduAng21E/TA9gHjs1NK3XJoZk3pS8kl3SB1/WD053ai9taYbFEWK4zfURs63j0vNQNKVz4hJT/ZXzn+5IYTivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWdnTCeU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6269885572so60778766b.1;
        Wed, 29 May 2024 13:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717013014; x=1717617814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jspYgMPf1TGJsKvnieXws/U9x2VxrP0hSajzZDvz/Qw=;
        b=eWdnTCeUiYCOJ7Io0Uu0uICBFWOJr9gqXcVgesrT2sRBaKDbBOnko/lA0V5phhtfsi
         ty8IIW1Klw2GVdqv2DZB0F18g271NKBU2Ta/mH25O++Zt27tlGuLvKuyOKPE5PLi17QE
         2SEvzcojelyt0Pd2MZ0QxU6XaVpLSr62KxvhGcy20JSZtimxhHUVIfOVBM+XFn/skWBX
         Hg4+aVco3ipdY7OeFHgzoIn/igXrdhCL0PqRotQc7iH7qzO5t5SIIKNcAjlNpDl9X2Od
         sVyaU5XGi2StFEkIEXGin5XXUk6NrSmy03pUYm77MP3IUhotvI3ZeMz5ZTjgBLkEZnJ9
         aWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717013014; x=1717617814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jspYgMPf1TGJsKvnieXws/U9x2VxrP0hSajzZDvz/Qw=;
        b=D91183G1ZeodtvTWIemNIiTPlK3miznuKYWyEB4iJjphi/+KaTqb9oD3jR25f2RfkC
         VjeOA6b2AGhrRSYsqxW9veoGHuqJHzXDR5Pkgu75HhkT9ACG3Qw8N30oWTOvXdj3GYP/
         QGAMmB073mN797fzqW2laYWj7siEmjOqilovvu+DW8KGwzw79Bv7IvhIHjigtL5QX7j9
         To1yvgycZwoeWiVXnon2/QZTcOA3PnwOFia2sjyMt0PKE8iPs2v5vgCQSPkD/FeTYC0n
         05ThLE0RSFXjhyBcjSeviKHhA6HJ3JGwXah1Lc1KqiGYIU4aX0ObVoZJJgup6kRAisjG
         QRUw==
X-Forwarded-Encrypted: i=1; AJvYcCWeFsmr4AhKhiKJbQxUMWgSGkP93+3aZSuj7qiFuk6MJfeJfk0/sSQaOxfZCml5ad9d8gshZ2mFbdQU5VQjBKAxEBPTrACxqE6j2DLtD8hArzOWn/uWtbriVyaC+h/LV5kg8z8lNnjlbJO0Q0HO501/wqel368ylC+uUH5mBO0QjbcR4WwUdb6xIG2jIYuk9XkvB3WYKC9nCcQYW0yEzqMTOk67
X-Gm-Message-State: AOJu0YxZ4QCZPNQCedOoO80SWsZJN2uHaPBVSdjUYN2GY9c8pdmwdXWM
	EMQmtn8ie9KU3iA9gADf51KpAZYlniJ/Lyh9LNivlKobBymxNv5dUxOWSYCvsCi66FyysN2hm+5
	J6JDIfI2SG3tubNeqzl/RrIy3G/0=
X-Google-Smtp-Source: AGHT+IGEDBMh8pWz5oOkcGHMvev/GVVjPNGH78a/QfMx1MZEdewz3K6t1+Eh9uKqWuzg7V2utDmdho0H/e6hpabC8JI=
X-Received: by 2002:a17:907:5c3:b0:a5a:89a8:49c5 with SMTP id
 a640c23a62f3a-a65eb6735aamr7154566b.33.1717013013636; Wed, 29 May 2024
 13:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529162958.18081-1-johan+linaro@kernel.org> <20240529162958.18081-14-johan+linaro@kernel.org>
In-Reply-To: <20240529162958.18081-14-johan+linaro@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 May 2024 23:02:57 +0300
Message-ID: <CAHp75VcC5t1FynFeHGd+57=AeXKE8u0uduzOfozsG3MEzCPpDQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] regulator: add pm8008 pmic regulator driver
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
> The Qualcomm PM8008 is an I2C-controlled PMIC containing seven LDO
> regulators.
>
> The driver is based on a driver submitted by Satya Priya, but it has
> been cleaned up and reworked to match the new devicetree binding which
> no longer describes each regulator as a separate device.
>
> This avoids describing internal details like register offsets in the
> devicetree and allows for extending the implementation with features
> like over-current protection without having to update the binding.
>
> Specifically note that the regulator interrupts are shared between all
> regulators.
>
> Note that the secondary regmap is looked up by name and that if the
> driver ever needs to be generalised to support regulators provided by
> the primary regmap (I2C address) such information could be added to the
> device-id table.
>
> This also fixes the original implementation, which looked up regulators
> by 'regulator-name' property rather than devicetree node name and which
> prevented the regulators from being named to match board schematics.

...

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/math.h>
> +#include <linux/module.h>

> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>

+ types.h

+ asm/byteorder.h

...

> +static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, =
unsigned int sel)
> +{
> +       struct pm8008_regulator *preg =3D rdev_get_drvdata(rdev);
> +       unsigned int mV;
> +       __le16 val;
> +       int ret;
> +
> +       ret =3D regulator_list_voltage_linear_range(rdev, sel);
> +       if (ret < 0)
> +               return ret;
> +
> +       mV =3D DIV_ROUND_UP(ret, 1000);

MILLI from units.h ?

> +       val =3D cpu_to_le16(mV);

> +       ret =3D regmap_bulk_write(preg->regmap, preg->base + LDO_VSET_LB_=
REG,
> +                       &val, sizeof(val));
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;

May be written as

  return regmap_bulk_write(...);

> +}
> +
> +static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
> +{
> +       struct pm8008_regulator *preg =3D rdev_get_drvdata(rdev);
> +       unsigned int uV;
> +       __le16 val;
> +       int ret;
> +
> +       ret =3D regmap_bulk_read(preg->regmap, preg->base + LDO_VSET_LB_R=
EG,
> +                       &val, sizeof(val));
> +       if (ret < 0)
> +               return ret;
> +
> +       uV =3D le16_to_cpu(val) * 1000;

MILLI ?

> +       return (uV - preg->desc.min_uV) / preg->desc.uV_step;
> +}

...

> +               rdev =3D devm_regulator_register(dev, desc, &config);
> +               if (IS_ERR(rdev)) {
> +                       ret =3D PTR_ERR(rdev);
> +                       dev_err(dev, "failed to register regulator %s: %d=
\n",
> +                                       desc->name, ret);
> +                       return ret;

It's possible to use

  return dev_err_probe(...);

even for non-probe functions.

> +               }
> +       }


--=20
With Best Regards,
Andy Shevchenko


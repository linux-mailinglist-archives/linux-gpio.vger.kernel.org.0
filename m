Return-Path: <linux-gpio+bounces-4533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5689288703F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 17:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F171C21D87
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 16:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C93256B7A;
	Fri, 22 Mar 2024 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IdDw0AIz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17897524C4
	for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711123395; cv=none; b=jMTMjIKNR/iYNYGW/Z0kgW2tGhlTO/2RsLObi3VNN6Ec1eJn5xixfhkS1I2Pq1I4uR2sXyUehWtCirZJrrae6iYH6ZavsMBJCwjvr+dZaL7DlSBC0x48bpnGIPsxxCt99eEwI0Jl8M5eM7swxTfcKj7Rq05alYS6TMTtqCBgFp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711123395; c=relaxed/simple;
	bh=SvJGLYHJxEO+kQPgbDvLc6DOGWqvWJBC/KeHsXQ0S+4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=RMoxxV0mwYGsebXtoDm68d6V2dARXyd46ZCx4/qV4P8PqO3GXPHGIfONFu38ZKsM3IXW8hQJgOU+rQ/EteavFcqvmpkPcx0Th+EMGR1y87AfSBGKwG559Tp7pFt86czDfRYm8WrE35p/iPh6NVTRBwHaIXjJjyDfWTnFVI78smM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IdDw0AIz; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d49f7e5c2cso31409671fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711123390; x=1711728190; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh0B0Op/7iFcRFrIOoiJQuhYzDeOdAJ2QNUlBpVkvVY=;
        b=IdDw0AIzYkF3KLWngPQI+az8mx+M8FLiWwNYqRIE92h8Vu9srNP9eZVFiNGc7jtPGA
         Ih89BDJdG9LFzi2dVc6cam4pv2zesvKRNxKYOSDUnFqxFZEUW/yVWNqD0bdxut/MYyDB
         dML5PQc5dNse+OU64tVuoIjNUO8bApbXSsFiR/yWFhKl1A5B9tGZfD64CsH/PgdECJM1
         KPL6zNMYuXmleSPYhC21pYuyYgUSQNnGV2k9Y9Mjp/WHXv4Z7CKhk8NJJUXEmBhcDerA
         Ey21LQwfdKeZ2OqOI+V3JMqd9Ts9EOw3/9wHS2EY9+S2I7eLvf7L91yC9X7TKKWED4il
         MYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711123390; x=1711728190;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kh0B0Op/7iFcRFrIOoiJQuhYzDeOdAJ2QNUlBpVkvVY=;
        b=S/oJMqXP/7rL20eZFnAZoc3MF3BNI1WxCJADsinmDCzoFU6oVY9VH0Z24YgtDF1XuK
         wj50EVKhju26+pvQ+g5L33JtLzgmeTKWU7ozusSmMsOTV69MNPCy1oDpfUXjIg13d76n
         aZaetOyR/Eu2EO4b+7vZ3kWoHUo37SrUMGnqJhXlr9yoZyPs82xL1mBO8IMmv/1wVm9B
         JxHxIIpyDgznOEsM2gSK3Rfbpmmh4zWba8+wTXV8NGYh7GkSMjt45EFiEmZgqE5Lh89M
         MbFSIvIlu0S1MiOCtF1fnjCxKdoKqUV4s+ttqrf0RfR3VDUW/26iG5gUs3H32nn7Au2e
         5Vpg==
X-Forwarded-Encrypted: i=1; AJvYcCVniHCsAzRh/RHoRwdRkSz+dq9OSRDR6WgZ6XTqeSeXeciwOLY0U9/Eo2PgJ0R7/V0m12MgV1X7SzVh+tE2vS3EKdyZMtRldFnkeg==
X-Gm-Message-State: AOJu0YzqDm2iMXIgUnPVPblXlETP571Jz7hLpWdjs95xiWyQf9C0bjmX
	mioZ4nwEI674wBEfv88vN2mH9Yfn3QOqfDBmw+YpNCoUEPU/SebCSDRAaF8u2RI=
X-Google-Smtp-Source: AGHT+IEkR6PizaNuC62j5Grot13csXnQY6gVrSzN5nx/GfkID77oL8KO3GnXgbM82pcwsLxNamFMfQ==
X-Received: by 2002:a2e:9f4c:0:b0:2d4:6910:2ee5 with SMTP id v12-20020a2e9f4c000000b002d469102ee5mr2129385ljk.8.1711123390044;
        Fri, 22 Mar 2024 09:03:10 -0700 (PDT)
Received: from localhost (alyon-651-1-22-137.w82-122.abo.wanadoo.fr. [82.122.123.137])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c310b00b0041408e16e6bsm3472839wmo.25.2024.03.22.09.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 09:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Mar 2024 17:03:08 +0100
Message-Id: <D00EM8TTYGXL.3MMIBWJT03M5R@baylibre.com>
Subject: Re: [PATCH v4 10/11] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC
 pinctrl and GPIO
From: "Esteban Blanc" <eblanc@baylibre.com>
To: "Bhargav Raviprakash" <bhargav.r@ltts.com>,
 <linux-kernel@vger.kernel.org>
Cc: <m.nirmaladevi@ltts.com>, <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <jpanis@baylibre.com>, <devicetree@vger.kernel.org>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <nm@ti.com>, <vigneshr@ti.com>,
 <kristo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240320102559.464981-1-bhargav.r@ltts.com>
 <20240320102559.464981-11-bhargav.r@ltts.com>
In-Reply-To: <20240320102559.464981-11-bhargav.r@ltts.com>

On Wed Mar 20, 2024 at 11:25 AM CET, Bhargav Raviprakash wrote:
> From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
>
> Add support for TPS65224 pinctrl and GPIOs to TPS6594 driver as they have
> significant functional overlap.
> TPS65224 PMIC has 6 GPIOS which can be configured as GPIO or other
> dedicated device functions.
>
> Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-tps6594.c | 258 +++++++++++++++++++++++++-----
>  1 file changed, 215 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-=
tps6594.c
> index 66985e54b..db0f5d2a8 100644
> --- a/drivers/pinctrl/pinctrl-tps6594.c
> +++ b/drivers/pinctrl/pinctrl-tps6594.c
> @@ -320,8 +451,18 @@ static int tps6594_pinctrl_probe(struct platform_dev=
ice *pdev)
>  		return -ENOMEM;
>  	pctrl_desc->name =3D dev_name(dev);
>  	pctrl_desc->owner =3D THIS_MODULE;
> -	pctrl_desc->pins =3D tps6594_pins;
> -	pctrl_desc->npins =3D ARRAY_SIZE(tps6594_pins);
> +	switch (tps->chip_id) {
> +	case TPS65224:
> +		pctrl_desc->pins =3D tps65224_pins;
> +		pctrl_desc->npins =3D ARRAY_SIZE(tps65224_pins);
> +		break;
> +	case TPS6594:
> +		pctrl_desc->pins =3D tps6594_pins;
> +		pctrl_desc->npins =3D ARRAY_SIZE(tps6594_pins);
> +		break;
> +	default:
> +		break;
> +	}
>  	pctrl_desc->pctlops =3D &tps6594_pctrl_ops;
>  	pctrl_desc->pmxops =3D &tps6594_pmx_ops;

See below.

> @@ -329,8 +470,28 @@ static int tps6594_pinctrl_probe(struct platform_dev=
ice *pdev)
>  	if (!pinctrl)
>  		return -ENOMEM;
>  	pinctrl->tps =3D dev_get_drvdata(dev->parent);
> -	pinctrl->funcs =3D pinctrl_functions;
> -	pinctrl->pins =3D tps6594_pins;
> +	switch (pinctrl->tps->chip_id) {

You could use tps->chip_id like in the previous switch.

> +	case TPS65224:
> +		pinctrl->funcs =3D tps65224_pinctrl_functions;
> +		pinctrl->func_cnt =3D ARRAY_SIZE(tps65224_pinctrl_functions);
> +		pinctrl->pins =3D tps65224_pins;
> +		pinctrl->num_pins =3D ARRAY_SIZE(tps65224_pins);
> +		pinctrl->mux_sel_mask =3D TPS65224_MASK_GPIO_SEL;
> +		pinctrl->remap =3D tps65224_muxval_remap;
> +		pinctrl->remap_cnt =3D ARRAY_SIZE(tps65224_muxval_remap);
> +		break;
> +	case TPS6594:
> +		pinctrl->funcs =3D pinctrl_functions;

This should be tps6594_pinctrl_functions

> +		pinctrl->func_cnt =3D ARRAY_SIZE(pinctrl_functions);
> +		pinctrl->pins =3D tps6594_pins;
> +		pinctrl->num_pins =3D ARRAY_SIZE(tps6594_pins);
> +		pinctrl->mux_sel_mask =3D TPS6594_MASK_GPIO_SEL;
> +		pinctrl->remap =3D tps6594_muxval_remap;
> +		pinctrl->remap_cnt =3D ARRAY_SIZE(tps6594_muxval_remap);
> +		break;
> +	default:
> +		break;
> +	}

See blow.

>  	pinctrl->pctl_dev =3D devm_pinctrl_register(dev, pctrl_desc, pinctrl);
>  	if (IS_ERR(pinctrl->pctl_dev))
>  		return dev_err_probe(dev, PTR_ERR(pinctrl->pctl_dev),
> @@ -338,8 +499,18 @@ static int tps6594_pinctrl_probe(struct platform_dev=
ice *pdev)
> =20
>  	config.parent =3D tps->dev;
>  	config.regmap =3D tps->regmap;
> -	config.ngpio =3D TPS6594_PINCTRL_PINS_NB;
> -	config.ngpio_per_reg =3D 8;
> +	switch (pinctrl->tps->chip_id) {

Same here, use tps->chip_id

> +	case TPS65224:
> +		config.ngpio =3D ARRAY_SIZE(tps65224_gpio_func_group_names);
> +		config.ngpio_per_reg =3D TPS65224_NGPIO_PER_REG;
> +		break;
> +	case TPS6594:
> +		config.ngpio =3D ARRAY_SIZE(tps6594_gpio_func_group_names);
> +		config.ngpio_per_reg =3D TPS6594_NGPIO_PER_REG;
> +		break;
> +	default:
> +		break;
> +	}
>  	config.reg_dat_base =3D TPS6594_REG_GPIO_IN_1;
>  	config.reg_set_base =3D TPS6594_REG_GPIO_OUT_1;
>  	config.reg_dir_out_base =3D TPS6594_REG_GPIOX_CONF(0);

Regarding all the switch case, they should be use to set all the struct
fields that are known at runtime only. For example, pinctrl->funcs, and
pinctrl->func_cnt are known at compile time. You should create template
structs, one for TPS6594 the other TPS65224, initialise the allocated
struct with the template and then fill the remaining fields with the
runtime values. Something like this:

```c
struct test {
    int a;
    int *b;
};

static struct test template =3D {
    .a =3D 42,
};

int main(void) {
    struct test *test =3D malloc(sizeof(*test));
    *test =3D sample;
    test->b =3D NULL;

    return 0;
}
```

You could also try to reduce the number of switch case, there is no good
reason to have 2 switch instead of one for pctrl_desc and pinctrl
structs.

Best regards,

--=20
Esteban "Skallwar" Blanc
BayLibre



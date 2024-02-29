Return-Path: <linux-gpio+bounces-3973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBDE86CBD2
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 15:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEFF5B21BF5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981DD137749;
	Thu, 29 Feb 2024 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tnCsGb3Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDAB7D3F9
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709217776; cv=none; b=mkS2lK7ngxRtQ2HyChHslbzG3QoC5LMbTjirQgFbxKrhB6Bdf/q+vpEZGYZdPXj2yIz0A97LEFC79/ea6tBf5Itv5Y+T2QgfOb2Iv97u5/h0q/cZBYiwLevAinoXU/mcSQ3e4uZMTZN0MYgk/UgSgkBlQzjQvY+7dfFpom10Mt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709217776; c=relaxed/simple;
	bh=ES9enoNgnkqWdPYetfZj1fjEWXAhCMXaUdM4x2i4NBs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ygmr8LEpcsqXfLjo/lvXlMQk5hjww1F58qx5ruVONEyKCAQbwKMexyixxXgaCWdEu7Sbsbp+GAKlwjFd3cCgqLgSujFDW+wuUd/gXrG2lLtHPX1efsU4G5ue/2OdTHTS0kbogKnjayJP0RsTApCnQbpzeMYAPfUDLeQkDoIQdOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tnCsGb3Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-412c37a8001so5095e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 06:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709217773; x=1709822573; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvFUVHgs0WkHQ8lyy0DH+ud+r327AtQ3M1EUgtTUDUg=;
        b=tnCsGb3ZlL8ZdCzylUZkdAHfVPHm66Y7IjJx94gCVRud8rK5rxoPLvgh7qqDSE9Mk7
         MN0G6O/BYPtZj7u0nKMLT76A5sGlEOODAqh9BQN+0jGoC+xeHzoV4RmhV8htYP+8knkN
         DyyPlFhYemOaulVUMqOHgtKC+V1/NAobPBZ5CjrOHkcwIzO4tj2ySVvCV1eQW2x5Vd2r
         dyVot6Okon0b37BNpgNNgRqIRTtxKTdKcArOB2M1qXtfubPMtb7z6TknF6I6ADD8zr91
         MTb42tDk4ZJMKfJPQBFAJBcGUh+v/NxEaXjYHkhvsJUABg2uhmLLXV23tijtVFbW2jDt
         jybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709217773; x=1709822573;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvFUVHgs0WkHQ8lyy0DH+ud+r327AtQ3M1EUgtTUDUg=;
        b=RL2oF22/1ngo+AMsO2tNgaLcPAH8dGm5Nt1AesAhqw6ClT7MoTd+YcmH/MCmkURNjb
         5Vmi/tVKM9WwTlFuwJh/xF0KdjD/NHggAposa3yR12LaaxYzKqhDdU7ptn0RPHHmcpeg
         ZTHKm1R5cAJ/qVOsxmSiVUekIfXtpg26/UCkcKySbg0rFpTVqYlWfS4jbVAdjTGHiNJ9
         6jdDil2xxhWp8M0Cjh827vgwjfeZC26wkPULRGx0uIBeP6C2vx8djBQIdmNunS4LzSJt
         0/00PN1AZRDQj9xaDNbqFm40MLIBjAzy6utT9Q4p09dIbl1WDDriF+bqpAX50TUKjOST
         +CLg==
X-Forwarded-Encrypted: i=1; AJvYcCWjZoKmxZpbftlPV6c/E50Y/8uuG4cZrLrLRHJde5zTnkz8lxTes5tbWu/uS7Uv1+BQpIvckhJthqD/Nv+UhHpMwXkEsGbXN7PnAQ==
X-Gm-Message-State: AOJu0YydAzjjC9gQK5q7jotd83UKMuh04arDcaiVAe33L9BKmDlgdOHE
	do+a7sij7gqKVJf2s/A4QbIM0ZBIKbZcFEuNfbmgUPC9PcrQpllxfjBkzO5te2o=
X-Google-Smtp-Source: AGHT+IHh+ON/LL6ZZNj2crn5+292UIB9nm79QnO4uDOpHItauFzeue6Uksr2VBCfylunYEg865eO6w==
X-Received: by 2002:a05:600c:4fd0:b0:412:bfa1:2139 with SMTP id o16-20020a05600c4fd000b00412bfa12139mr1184812wmq.37.1709217772375;
        Thu, 29 Feb 2024 06:42:52 -0800 (PST)
Received: from localhost (alyon-651-1-22-137.w82-122.abo.wanadoo.fr. [82.122.123.137])
        by smtp.gmail.com with ESMTPSA id dx14-20020a05600c63ce00b004129f28e2cdsm5339141wmb.3.2024.02.29.06.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 06:42:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 15:42:50 +0100
Message-Id: <CZHN4S2QW6MY.KKKHHRPPY4ZG@baylibre.com>
Cc: <m.nirmaladevi@ltts.com>, <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <jpanis@baylibre.com>, <devicetree@vger.kernel.org>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <nm@ti.com>, <vigneshr@ti.com>,
 <kristo@kernel.org>
Subject: Re: [PATCH v2 12/14] regulator: tps6594-regulator: Add TI TPS65224
 PMIC regulators
From: "Esteban Blanc" <eblanc@baylibre.com>
To: "Bhargav Raviprakash" <bhargav.r@ltts.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240223093701.66034-1-bhargav.r@ltts.com>
 <20240223093701.66034-13-bhargav.r@ltts.com>
In-Reply-To: <20240223093701.66034-13-bhargav.r@ltts.com>

On Fri Feb 23, 2024 at 10:36 AM CET, Bhargav Raviprakash wrote:
> From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>

> @@ -122,6 +131,27 @@ static const struct linear_range ldos_4_ranges[] =3D=
 {
>  	REGULATOR_LINEAR_RANGE(1200000, 0x20, 0x74, 25000),
>  };
> =20
> +/* Voltage range for TPS65224 Bucks and LDOs */
> +static const struct linear_range tps65224_bucks_1_ranges[] =3D {

You prefixed your arrays with `tps65224` and that makes sense. However
you should also prefix the old ones with `tps6594` then.
This applies to the whole driver.

> @@ -374,11 +518,17 @@ static int tps6594_request_reg_irqs(struct platform=
_device *pdev,
>  {
>  	struct tps6594_regulator_irq_type *irq_type;
>  	struct tps6594 *tps =3D dev_get_drvdata(pdev->dev.parent);
> -	int j;
> +	size_t j;
>  	int irq;
>  	int error;
> +	size_t interrupt_cnt;
> =20
> -	for (j =3D 0; j < REGS_INT_NB; j++) {
> +	/* Number of interrupts supported by each voltage source */
> +	interrupt_cnt =3D (tps->chip_id =3D=3D TPS6594) ?
> +			 ARRAY_SIZE(tps6594_buck1_irq_types) :
> +			 ARRAY_SIZE(tps65224_buck1_irq_types);

The comment is not adding anything, the name is clear and ARRAY_SIZE is
quite explicit.

> +		for (i =3D 0; i < LDO_NB; i++) {
> +			if (ldo_configured[i] =3D=3D 1)
> +				continue;
> =20
> -			error =3D tps6594_request_reg_irqs(pdev, rdev, irq_data,
> -							 tps6594_ldos_irq_types[i],
> -							 &irq_idx);
> -			if (error)
> -				return error;
> +		struct tps6594_regulator_irq_type **ldos_irq_types =3D (tps->chip_id =
=3D=3D TPS65224) ?
> +								       tps65224_ldos_irq_types :
> +								       tps6594_ldos_irq_types;
> +
> +		const struct regulator_desc *ldo_regs =3D (tps->chip_id =3D=3D TPS6522=
4) ?
> +							 tps65224_ldo_regs :
> +							 tps6594_ldo_regs;
> +
> +		rdev =3D devm_regulator_register(&pdev->dev, &ldo_regs[i], &config);
> +		if (IS_ERR(rdev))
> +			return dev_err_probe(tps->dev, PTR_ERR(rdev),
> +					     "failed to register %s regulator\n", pdev->name);
> +
> +		error =3D tps6594_request_reg_irqs(pdev, rdev, irq_data, ldos_irq_type=
s[i], &irq_idx);
> +		if (error)
> +			return error;

There is an indentation missing on the content of the `for` loop.

Best regards,

--=20
Esteban "Skallwar" Blanc
BayLibre


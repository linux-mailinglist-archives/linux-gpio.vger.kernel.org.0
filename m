Return-Path: <linux-gpio+bounces-18716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57722A86876
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 23:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52FFE1B672BE
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 21:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC5F29CB53;
	Fri, 11 Apr 2025 21:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Bto2CHuv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B2D29C345
	for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 21:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744407901; cv=none; b=fSt7A4oS8hJerrGceqbfun4hc/fGuqYqXZvLLJcJvbY9FSugDysUiU+y4vbOz/xPds3vYGUWkoOAt3srrw/P7h3dfdd6ycT2NDkUE9vi23aSPmK4P8vLpziYYfFhN7HHeTSLn6d+YZGMcDd9VyD32OdRHrO9XXnRZ9wCPlMJxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744407901; c=relaxed/simple;
	bh=JhEtLQYxJUYf6hS4yrM6mRaFZC5s56CpaPGv53UDIbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOrdPX51e/8EShtrPFUYjm/wIrNH8JBRifPmaXVpVGTWC5qs65egWKRuiF2XA1lk1KKEPubYQ0jhCM35hgBigTVG4PhWpLK6/oF1e+8Vt1zvg82Lx2juaWItPl4FWWTlN6vjRMhCAT+l3Udo/UwnaC87mpftJjW/NeXbjlqbIyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Bto2CHuv; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-601c469cce3so682709eaf.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 14:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744407898; x=1745012698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qxKGBsMkMzJ2BNc5R5UbHVjtuUaRbTsxJED20d0p+M=;
        b=Bto2CHuvKd0fx2uKL1m5U1rT9d+ppNeZpZnnvrVgxo1Cxx5TpoTWxstoo3z/WDgRYm
         PRAq5qlhA3vLQDmK0zu3F4cz4LrcyvhicHjd4VLWeb0r9/nBHDzTerJH919aAQGgvfTn
         PugZh8FHrb9rY9vcRGCPmDO/O54FvY6P6yxij6pfdTMQv5k8C00Hpg8VVCA2YdyWNnPi
         13AveBl3pXGtd01jb8fST5eIZpnIskcqrilnxZBOHjCEa9/yg8IEviHZAQk/K90jPHl9
         e5E5EQJIE/han4nrocNdfO7j/QTHKEh9nX5JvWI5ibrCuCZ6+3pgals5xscdFC0Am2GD
         7DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744407898; x=1745012698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qxKGBsMkMzJ2BNc5R5UbHVjtuUaRbTsxJED20d0p+M=;
        b=fFP3nN5VoLtHF57KzJgvL3TWIFUhJJv3gME1NG67+zpeKa2z0/5Xz9+AgAktJ4k/wu
         hGup/pPj9n8gcRz0hkyBBnVIxlGojWIj0ewX6N6K2gXaN1LtlbKRYC9OAHDdvqzdl3QG
         hzDQllq2Olfi9AaXIskgcI1xjezhA+P/CaoUK35P24cA3Yob4o4+FNAQyZi8UaYe0O7f
         NnDZQKvgNyMDnkoE7f/DBlqaV70MLTkKRc9Kljj9Vc5FKCW9nNwemdqLKLK04n3IjaZu
         qlnuO1iGvu3smyycoj5XXhDFaTTHrH3eEQE0hj54j1VD5gznbLQs7spjj3zdZ9Mpwq5S
         Tt/g==
X-Forwarded-Encrypted: i=1; AJvYcCWWdkGjR/GuaD70FlxsPFKCa22E9leG6aYFdpOYbk5dMqeAQUNeAj7X4IMTnkxE2hTaAbFGjGefGs+v@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69UMt5QfnM5/P5IYmx1Xi1bxdIPR13ak+Px9kkjPo8zqogNII
	FOzwAVtkNX3sebHWUlYpepgz5YSWkiKLw+W0xTu6+68NfaW8IyzAI99KdrBnPzw=
X-Gm-Gg: ASbGncvH7b2Jcp04fs5iplMA3h5ZWGXmxNkhTA+VsZhJ9TlFQp6ds5aol+Ro8l6/HDW
	dEUdkJqnwK1DqI+/H5tSulynC8CAr4ZR9NGVCVHCFWDq5yc2KPRwd2quQDKLCg06ur7+b5dU+0/
	zywnvmr9BoTdfG3tVYaeC8UHlW/2GSMIXYs+utxbtW0xQQkWQlmpbuxF33EApeARidr0yscZKnm
	I65GbdlmVkEMidjNaq1XRRfWkWQymlLZJwdcUGr7OlRwTkApg4WhOcRzYFB1QcFLRLvOKVc9Zh/
	rqPdYiepWGRn+mlxLF3S9CEvIr5kJE8C1ypekNMB65no2qZjMBegr1hgdPZ8o/b9vOMlIGSTxnQ
	UYQ==
X-Google-Smtp-Source: AGHT+IHXy3+92TRvDVV1gjmxCyi/zce38/vLVqmGl0gMcBYh4Q0YmYalGIFle2vzEHSzGH1qCGI38A==
X-Received: by 2002:a05:6820:1514:b0:604:117:1a5d with SMTP id 006d021491bc7-6046f5c8a59mr2387896eaf.7.1744407898203;
        Fri, 11 Apr 2025 14:44:58 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f5b28dfsm1015069eaf.37.2025.04.11.14.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 14:44:56 -0700 (PDT)
Message-ID: <bbdbf4ff-662e-459b-a31f-bc58e738a51f@baylibre.com>
Date: Fri, 11 Apr 2025 16:44:55 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/14] iio: adc: ad7768-1: add regulator to control VCM
 output
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1744325346.git.Jonathan.Santos@analog.com>
 <7753dcd690f07f855100fc28e7b8ae746082de1c.1744325346.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7753dcd690f07f855100fc28e7b8ae746082de1c.1744325346.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 10:57 AM, Jonathan Santos wrote:
> The VCM output voltage can be used as a common-mode voltage within the
> amplifier preconditioning circuits external to the AD7768-1.
> 
> This change allows the user to configure VCM output using the regulator
> framework.
> 
> Acked-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

...

> +static int ad7768_vcm_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct iio_dev *indio_dev = rdev_get_drvdata(rdev);
> +	struct ad7768_state *st = iio_priv(indio_dev);
> +	int ret, val;
> +
> +	if (!indio_dev)
> +		return -EINVAL;
> +
> +	if (!iio_device_claim_direct(indio_dev))
> +		return -EBUSY;
> +
> +	ret = regmap_read(st->regmap, AD7768_REG_ANALOG2, &val);

If we put iio_device_release_direct(indio_dev); here, we can avoid
the goto.

> +	if (ret)
> +		goto err_release;
> +
> +	ret = FIELD_GET(AD7768_REG_ANALOG2_VCM_MSK, val) != AD7768_VCM_OFF;
> +err_release:
> +	iio_device_release_direct(indio_dev);
> +
> +	return ret;
> +}
> +
> +static int ad7768_set_voltage_sel(struct regulator_dev *rdev,
> +				  unsigned int selector)
> +{
> +	unsigned int regval = AD7768_REG_ANALOG2_VCM(selector + 1);
> +	struct iio_dev *indio_dev = rdev_get_drvdata(rdev);
> +	struct ad7768_state *st = iio_priv(indio_dev);
> +	int ret;
> +
> +	if (!indio_dev)
> +		return -EINVAL;
> +
> +	if (!iio_device_claim_direct(indio_dev))
> +		return -EBUSY;
> +
> +	ret = regmap_update_bits(st->regmap, AD7768_REG_ANALOG2,
> +				 AD7768_REG_ANALOG2_VCM_MSK, regval);
> +	iio_device_release_direct(indio_dev);
> +	st->vcm_output_sel = selector;

Do we still want to make this assignment if there is an error?

> +
> +	return ret;
> +}
> +
> +static int ad7768_get_voltage_sel(struct regulator_dev *rdev)
> +{
> +	struct iio_dev *indio_dev = rdev_get_drvdata(rdev);
> +	struct ad7768_state *st = iio_priv(indio_dev);
> +	int ret, val;
> +
> +	if (!indio_dev)
> +		return -EINVAL;
> +
> +	if (!iio_device_claim_direct(indio_dev))
> +		return -EBUSY;
> +
> +	ret = regmap_read(st->regmap, AD7768_REG_ANALOG2, &val);
> +	if (ret)
> +		goto err_release;

Can rearrange to avoid goto here too.

> +
> +	val = FIELD_GET(AD7768_REG_ANALOG2_VCM_MSK, val);
> +	ret = clamp(val, 1, (int)rdev->desc->n_voltages) - 1;
> +err_release:
> +	iio_device_release_direct(indio_dev);
> +
> +	return ret;
> +}
> +

...

> +static int ad7768_register_regulators(struct device *dev, struct ad7768_state *st,
> +				      struct iio_dev *indio_dev)
> +{
> +	struct regulator_config config = {
> +		.dev = dev,
> +		.driver_data = indio_dev,
> +	};
> +	int ret;
> +
> +	/* Disable the regulator before registering it */
> +	ret = regmap_update_bits(st->regmap, AD7768_REG_ANALOG2,
> +				 AD7768_REG_ANALOG2_VCM_MSK, AD7768_VCM_OFF);
> +	if (ret)
> +		return -EINVAL;

Why not return ret; ?

> +
> +	st->vcm_rdev = devm_regulator_register(dev, &vcm_desc, &config);
> +	if (IS_ERR(st->vcm_rdev))
> +		return dev_err_probe(dev, PTR_ERR(st->vcm_rdev),
> +				     "failed to register VCM regulator\n");
> +
> +	return 0;
> +}
> +


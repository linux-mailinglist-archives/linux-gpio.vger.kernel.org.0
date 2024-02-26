Return-Path: <linux-gpio+bounces-3760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C02B867567
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 13:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA27828497F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 12:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686C57F7C7;
	Mon, 26 Feb 2024 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HMR8jM7J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE87F493
	for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 12:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708951438; cv=none; b=gozuCXdxAQArz9aEC4qxpL0JfDCWIFVOOgrDYTirf9uK+jKO0Ai2cKroSAOd+ScztQjgf6KrOT0z3HgHTj9O9KK99u/iviZjewZ1IcTBL0xJZ+Hi+AVh+puD9da+HV0jwHH+ud6NOSfK7NGERQHJ8UzJRmUGLYvNbqAtWGdq+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708951438; c=relaxed/simple;
	bh=QWUMPu+CtYb0e6Z/NfDSuuMZHNPPaOp7x8I5Ob5Dgfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBlDr8to9xuwsUkVezhf78XQL9Fr+mFcj3BXTRq2j3wPhopvjlHxSmsf+S+6VUkNc+cMIqhzUKRMs7sbmVAVq9KlJHfPAj4BS1NkYwxpEXxbxkuH8Fzl7EsqfTz48uVHZmSbjHUi9KFkUYT5q4ugtybiW8r03ClRgYOro4xdxDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HMR8jM7J; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5129cdae3c6so3881765e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 04:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708951434; x=1709556234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naqFL0E+hNyDvv+vNCMwB2nUVsIEfS7e+n3trxNKW+M=;
        b=HMR8jM7JnQfNJZAtaIKkDoP+fKuLdKMrOAtYXHo1zHaQrU8Sl/ohZHUdzAOYq5+Ng0
         ZNsI1MLI6NiOEj6aJgWXvOccyrRT0m9mvxXIKAV5Fqz6Bi2ixqn/QE1ojOsuQnow4jfw
         lyimbQGdC8KGdukVkB9G3VrB5ML/1hl8UbWPCmDgayAYZQ0uXe1XrQWjhazEAT5sGrgZ
         TfWLl/MtYh56y6c8EI+IvzZdPCF3IkrcuUGc64YZOdtJ4kWbE+r4GgETJ4rl+2+jAj7q
         NLM/tyyt/1i2d6Yhol1TYjDrrn+dbnEn8GoXGI6qInNdrK5dhYKJ3y3neuOosxnuH4H2
         FQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708951434; x=1709556234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naqFL0E+hNyDvv+vNCMwB2nUVsIEfS7e+n3trxNKW+M=;
        b=Hbm7f5fDWnnlG5pmAmzVc4S9kr6IJb3rFU/+xe1Z1N/7403HKWYUQ8AcG7BWfjely+
         1GNr9EihA1zSOPWtWDuEFpWn+6DVkgYbZTi4iJHOgPc+qRz8nEouu+jl51c3fsKmK1GV
         tr0IQJpbCqj77X2UMSp1ytihkmfptRxIQhsOV/MCPokDuzeVXmijG2ysGpnVTmKviXVK
         DP9NkI1DVfjgj4dOGyKB3S3w+NVMgzxph622o9VH0YPGbgqUz5IK7LiQ4yy5L+VlVN6h
         AgzvbI7vOAAwqKH84pTfYz41UytHgS9c2dq9OBmASjrFBw6wH4hJ7kJvbRerR8LojTDo
         Qwcw==
X-Forwarded-Encrypted: i=1; AJvYcCVrDnQSe09+6Sg8G2LGd5zIk+Vh4sIxS5N7FA5Jv3XsjY5VNEW+wC4ySDiT6Yogu+5+87dPDU9BSuYbXZQENc51WlusAzqUB9MeEw==
X-Gm-Message-State: AOJu0YwuaGpggEYlAwI5Q6Q6CcvOj7vuKfuW/NdNyJjfytyauqf51KCh
	4NWdLQjaHIAzBN1+7rmtu4RI+ubHkutiselXriNJyfBd2+wRs8LZ7uOur9CUJJQ=
X-Google-Smtp-Source: AGHT+IEr6GkkP+hEkx/7rVH3ZwrWmBQXEk8hVCRf2PMK+0MkEU8g/LzJ/x61wmA8BWhBFLisUVyRlw==
X-Received: by 2002:a05:6512:1156:b0:512:b426:53e8 with SMTP id m22-20020a056512115600b00512b42653e8mr5504601lfg.30.1708951434428;
        Mon, 26 Feb 2024 04:43:54 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id d11-20020a056512368b00b00513022c0d3esm42963lfs.91.2024.02.26.04.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:43:54 -0800 (PST)
Message-ID: <8f09bc42-b85d-446f-bd9d-77155060a4b8@baylibre.com>
Date: Mon, 26 Feb 2024 13:43:51 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] misc: tps6594-pfsm: Add TI TPS65224 PMIC PFSM
Content-Language: en-US
To: Bhargav Raviprakash <bhargav.r@ltts.com>, linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nm@ti.com,
 vigneshr@ti.com, kristo@kernel.org
References: <20240223093701.66034-1-bhargav.r@ltts.com>
 <20240223093701.66034-9-bhargav.r@ltts.com>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240223093701.66034-9-bhargav.r@ltts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/23/24 10:36, Bhargav Raviprakash wrote:
> Add support for TPS65224 PFSM in the TPS6594 PFSM driver
> as they share significant functionality.
>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
> ---
>   drivers/misc/tps6594-pfsm.c | 55 +++++++++++++++++++++++++++----------
>   1 file changed, 40 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
> index 88dcac814..4fa071093 100644
> --- a/drivers/misc/tps6594-pfsm.c
> +++ b/drivers/misc/tps6594-pfsm.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * PFSM (Pre-configurable Finite State Machine) driver for TI TPS6594/TPS6593/LP8764 PMICs
> + * PFSM (Pre-configurable Finite State Machine) driver for TI TPS65224/TPS6594/TPS6593/LP8764 PMICs
>    *
>    * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
>    */
> @@ -34,15 +34,17 @@
>   
>   #define TPS6594_FILE_TO_PFSM(f) container_of((f)->private_data, struct tps6594_pfsm, miscdev)
>   
> -/**
> +/*

Here it should be /** for the structure documentation, I think.
Please check in kernel doc.

[...]

> @@ -210,8 +230,12 @@ static long tps6594_pfsm_ioctl(struct file *f, unsigned int cmd, unsigned long a
>   			return ret;
>   
>   		/* Modify NSLEEP1-2 bits */
> -		ret = regmap_clear_bits(pfsm->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
> -					TPS6594_BIT_NSLEEP2B);
> +		if (pfsm->chip_id == TPS65224)
> +			ret = regmap_clear_bits(pfsm->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
> +						TPS6594_BIT_NSLEEP1B);
> +		else
> +			ret = regmap_clear_bits(pfsm->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
> +						TPS6594_BIT_NSLEEP2B);

Instead of this if/else, a ternary operator might do the trick here:
regmap_clear_bits(pfsm->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
                               pfsm->chip_id == TPS65224 ? TPS6594_BIT_NSLEEP1B : TPS6594_BIT_NSLEEP2B)

Julien



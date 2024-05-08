Return-Path: <linux-gpio+bounces-6245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC18C034B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 19:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0051A280F84
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 17:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327D9127B5D;
	Wed,  8 May 2024 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="GCun67eN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A212AAE8
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 17:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715189898; cv=none; b=GuYQWOIecCAkNMWViLnjWTEfxMBKzn2rm+o4Tzd7mUkCqoHHf7eklN4f06NNLq+PYBl0+IqXSS/oPvlZJPEfkcVtIeKZ7VDjy/9vNdlskDrSpN3R7ZMpXjiyYw/xhpvSfIA3c1WH7Sls4UFNhbL0eviOX7BLmtpnJSpqKpFKNFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715189898; c=relaxed/simple;
	bh=ErG2ieJPaEYuaHedZhTINnKRaDaa38gXIxejZHbKqMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcXE+b6EYFcl8lOMUXFIbPG3zRsXzSQuacwriLRos53AcvYdc7CTIOYqW5Wk/GDQxMjhxAu6vAU9fqfhkr/VqxhjFQdKWjD1QdGCaiGhLC1YqX1AXORZOvPtcwhK+CjHtCGoucFzAEg4g1Qc4IQkbygXPlkkObC8wOU3s0J2D4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=GCun67eN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34fde285fa2so791096f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 10:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1715189894; x=1715794694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWbZVpkexFeZlMx4P9mhVzhuw8y16zVOCFCMCVJku5w=;
        b=GCun67eNTj7z8cTuff5QFDG0RM1xaB9b/cIZQ/olbKt3/6zCC81e6LpantW5twuLZB
         AUXAPYOmQ3LuNr5+Y7Pzh2bL7a6bNl52Co9BSCJDu2UyIsH1CRSxAow6ltvbtUB4xML8
         F5SBAnPVqGLBin92FxDe94Ae/Eaz67DC0wJQFWlceoOGFfHcPlrlCBmtfyOenmyQw2ht
         ACFGocJzQrwvdemCucVIcOZjhLQO4IXAL4/Ri90YgeYDDeS6unnSqzPeohfFkAIi7Sgy
         obasisgyjiUZ/0Z1B4PbqOAPiMxEjw2ohJhMNvushHhHHvx9Bqe+ZiNKBO3pnRUC8zVD
         LQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715189894; x=1715794694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWbZVpkexFeZlMx4P9mhVzhuw8y16zVOCFCMCVJku5w=;
        b=SIN/frOiz/dK1KEa1hbaFJyK9Xxnv7Z5X4cc1dKByerfkpmgGrzPBVSAyaNy9GrlZk
         ajjXRKfqmnzdJIwVaMf6PaawD35hxrtLVOgFJiMSEZpe/u8VZes5V93T1yforzAirzMD
         0OuE+JBV0Fi9ouoKGjb3P89PFk6vWg+gfBIURvtSisliZbADrAgevEVRxTBIZzJ7yOUY
         M788CRYjl2pLOz3q27eqAe5TKfBdR1qquUfCzbAd5CNNQLfvxOOv1EirJxEu727cR6OJ
         TDP10GPUK8IhU517LK9PDzN7PWMOxIWW5tjDRCSuGtuEVMoYo4MxQb2D1fmDVGTNRe0e
         kjGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpsQv4VGk1CY2iX2nkHEtUcmx9FGAGX7R0fqf8bT+mfnkb+0fsnnysI6z9AB28qOoEoEDs3pGmzC9KbjHLi6L+23LG6tOMK7V6oA==
X-Gm-Message-State: AOJu0YwPUvQBuWjs9V9pmHnKDF8BVBneIM3qHLsHpQWy6tEbQDWyrzja
	txwNC9SW5wYlkwrSeUuJfP7k0fHKYG4t3YNFL6rHMCpIvrR52LYihMamPPMTqgY=
X-Google-Smtp-Source: AGHT+IFkZvpduhl1H1+IBk45OEZkAiRGbKk490m/3Scad3SACsl6dfRNUbMbqgdvdqmEhOHLIrurfQ==
X-Received: by 2002:a5d:4a81:0:b0:34c:6677:b7de with SMTP id ffacd0b85a97d-34fca0547edmr2445419f8f.2.1715189894357;
        Wed, 08 May 2024 10:38:14 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id d18-20020adfef92000000b0034c71090653sm15797198wro.57.2024.05.08.10.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 10:38:13 -0700 (PDT)
Message-ID: <c7bc6fd6-d0f2-4317-b619-57ba31e0b08f@nexus-software.ie>
Date: Wed, 8 May 2024 18:38:12 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] mfd: pm8008: use lower case hex notation
To: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-6-johan+linaro@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240506150830.23709-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2024 16:08, Johan Hovold wrote:
> Use lower case hex notation for consistency.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/mfd/qcom-pm8008.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 42dd4bf039c9..f1c68b3da1b6 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -38,8 +38,8 @@ enum {
>   
>   #define PM8008_PERIPH_0_BASE	0x900
>   #define PM8008_PERIPH_1_BASE	0x2400
> -#define PM8008_PERIPH_2_BASE	0xC000
> -#define PM8008_PERIPH_3_BASE	0xC100
> +#define PM8008_PERIPH_2_BASE	0xc000
> +#define PM8008_PERIPH_3_BASE	0xc100
>   
>   #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
>   #define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
> @@ -153,7 +153,7 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
>   static struct regmap_config qcom_mfd_regmap_cfg = {
>   	.reg_bits	= 16,
>   	.val_bits	= 8,
> -	.max_register	= 0xFFFF,
> +	.max_register	= 0xffff,
>   };
>   
>   static int pm8008_probe(struct i2c_client *client)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


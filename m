Return-Path: <linux-gpio+bounces-22728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBFEAF7430
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B44E1C20C43
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D112E2E54A3;
	Thu,  3 Jul 2025 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH2HyAYN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91822D3729;
	Thu,  3 Jul 2025 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545927; cv=none; b=Hd+CxEMp6cIRmKtCXLEUjmzkcnzjWv65I3sDpxCNLwkICgedat/8c3lLS2/umVgxlm+S9onX/AxpGU1HuEtXM2uKdhjIqtfQyx/HN/BKz1arP969s3pCIeFjVhvHCVnErRhBGx2UB+BKihpJ/QFhCjCGyXkcWOJB4b/bhKA7LSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545927; c=relaxed/simple;
	bh=q2mcQoL00V2Ae5Z7ktClCO7OMB85dTKElX64vAtjs7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgdW4zWjvxpTWpOP5rddSvJUgjIZFBc9g4FpMsEXTdq5cOhq+HukgjEmvZZDQb9wdVSJiPyniYd7rsWytqbZKrTIozgEmTAv1Xz2wEjJc8uTiZ6tkw35nRPlvehMaco/ddFAXypMnSa5TVZOZJwju/KEugZLnX5XQOoUtLNA/Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH2HyAYN; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so12053989a12.2;
        Thu, 03 Jul 2025 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751545924; x=1752150724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZPLWfXiCCARjQLVMbM6O6mOQhpsqAEIICbBKDhLFXs=;
        b=YH2HyAYNtvjADcZYOjdDIOs/5xcPr8DPDQhHyzlhS8TL2JuHZV5+NOe473DIzbdNFs
         1P7PWGaXT9sS8THyM+LFV7mrDNNkDYzxTLbtQot6p+FSkuyd/J07Z2eCMK1Uywc8x54g
         iKsMGgcgboDCTbZ0dpEfC/mkRNRzOzo8xuaHkCBK6CIQsWJ1bSv98sL/ErYyGsPjypOx
         4nVmO8F3P6HFUuTnLS4gfdFNiv4NLe0G2Iz3hi7SPic/4huuRtdtjQZg5ZPID4NaMKZA
         rxTOrzEWEom23NuP9S5yINDHPOeVDS3Ollw/9jw3nLNeQ9Ran80GwfZjumkgyP3Hhok0
         H6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545924; x=1752150724;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZPLWfXiCCARjQLVMbM6O6mOQhpsqAEIICbBKDhLFXs=;
        b=b8p22jiFZVjDJLouX/EPcSlCkmqnudvncloykhEHeHwHZQFyGaVfuYGVDKRlvE/sVS
         KbVBh+vWcoLEP50nhlgg+XcG5g3glJlmeBmFs2A2gfVxGSghBlCjpufKbYoI6Obct7LE
         5pcF7OlSOXrcMooO1E0w7GpQJmO5HPYGYv+g/hR35gdvnCpSbrGHnwR+tpQsvLRDb/hf
         Djc5sufQik1pKwQRcLJ/jy/IxdXjgsMTU9E9tpTZdg0BgUO8ZmBYldoJG0wK0aBxL6hf
         9BA8c+yef9pTyOyQs6hqVGN9FYuW0/ax9QufVfWlZcQxpQ5FBQ6n2iedV8Nl0Ck4JqVw
         IJrw==
X-Forwarded-Encrypted: i=1; AJvYcCUjvjUGhsd2jduJqx1zX5PR0QYAyDGuiZiyi0bkIAI3A4Tx1a2LpBVxz4mxV+1YMlePRhFV3agPVibt+w==@vger.kernel.org, AJvYcCUvsLqMsRnNyA2F/mThwpiaHM5GqtVSVatLFnks8wW2PZxxq16MBTm8M9dbMhopvnCqD577izEFjkkK@vger.kernel.org, AJvYcCW4hHDxeQTIBxgHrivBnD+Os9RO6gss6nW9Mj07Uc/PUsKXuQ/HpwX1KYBnBs/NALG5u0gLpzFR209KM9bZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJTS8d3A2tSsAfR9qNlHcSyA2iKUZ2aSzryScWCptUTQkF60B
	IRMA+IuNwwEToAUX63MNqYSJ2re16A5ARe85tQnJOBPgOJ5QYXRl9mP7
X-Gm-Gg: ASbGnctlg34AuUbBxnvvF7EyVHe8kS6pvgyQR4xAE4mwamIcy65yZwX9aw9cHV27k4x
	rEqgVNOQXFmEI3g8n/mVBPKYP9gZSrIQGO8VS9/nCM5a5X09TwS9fxzG1W9791ByCp5kPrCppf9
	nGAsrFJcbAMUkd7NMITavQFQQhn5X4wx+dB7jdbL8tZxxWGln7jPFARSU+yQifLGxpB6qA+nIOf
	JWv7oKOIlBS14sW/IOWOS+QVOn6+HuG9LYe5LL/FQOrmTJLYn4GVj+nq2cIVGmQmL8FQyVpRhbo
	TKbClxk87xnAlozQ4oDasJ4ksVAWNmhktdOkKVoGSobwoGIBu/CsuHc2pHhHuRWeQsyn64fkGCQ
	pTyI=
X-Google-Smtp-Source: AGHT+IHuheH2n6bV6dLkCNbg1HG9FS/Kp24cqUOr7wqs04JRCAIlvn2pDbqaGZ7WBJdV42dGc8EYOw==
X-Received: by 2002:a05:6402:238a:b0:60c:44d6:2817 with SMTP id 4fb4d7f45d1cf-60e536053a9mr5295465a12.20.1751545923806;
        Thu, 03 Jul 2025 05:32:03 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8320b5aasm10343175a12.76.2025.07.03.05.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:32:03 -0700 (PDT)
Message-ID: <5fad0945-27a5-4c49-8f20-59c197fc1ba0@gmail.com>
Date: Thu, 3 Jul 2025 15:31:58 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/24] media: i2c: maxim-serdes: add MAX96717 driver
To: Julien Massot <julien.massot@collabora.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
References: <20250702132104.1537926-1-demonsingur@gmail.com>
 <20250702132104.1537926-19-demonsingur@gmail.com>
 <b591e7daf1e351fbfee181fcce399db08b28faf9.camel@collabora.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <b591e7daf1e351fbfee181fcce399db08b28faf9.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/3/25 3:16 PM, Julien Massot wrote:
> On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
>> Add a new MAX96717 driver that also supports MAX9295A, MAX96717F and
>> MAX96793.
>>
>> Integrate it with the common serializer framework, while keeping
>> compatibility with existing usecases, avoiding code duplication, and
>> also enabling more features across all chips.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   drivers/media/i2c/maxim-serdes/Kconfig    |   16 +
>>   drivers/media/i2c/maxim-serdes/Makefile   |    1 +
>>   drivers/media/i2c/maxim-serdes/max96717.c | 1685 +++++++++++++++++++++
>>   3 files changed, 1702 insertions(+)
>>   create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
>>
>> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/maxim-serdes/Kconfig
>> index cae1d5a1293e..648cb891eefe 100644
>> --- a/drivers/media/i2c/maxim-serdes/Kconfig
>> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
>> @@ -14,3 +14,19 @@ config VIDEO_MAXIM_SERDES
>>   
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called max_serdes.
>> +
>> +config VIDEO_MAX96717
>> +	tristate "Maxim MAX96717 Serializer support"
>> +	depends on COMMON_CLK
>> +	select VIDEO_MAXIM_SERDES
>> +	select GENERIC_PINCONF
>> +	select GENERIC_PINCTRL_GROUPS
>> +	select GENERIC_PINMUX_FUNCTIONS
>> +	select GPIOLIB
>> +	help
>> +	  This driver supports the Maxim MAX9295A, MAX96717, MAX96717F,
>> +	  MAX96793 Serializers, which receive video on a MIPI CSI-2
>> +	  interface and output it on a GMSL2/3 link.
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called max96717.
>> diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/maxim-serdes/Makefile
>> index b54326a5c81b..04abda6a5437 100644
>> --- a/drivers/media/i2c/maxim-serdes/Makefile
>> +++ b/drivers/media/i2c/maxim-serdes/Makefile
>> @@ -1,3 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   max-serdes-objs := max_serdes.o max_ser.o max_des.o
>>   obj-$(CONFIG_VIDEO_MAXIM_SERDES) += max-serdes.o
>> +obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
>> diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2c/maxim-serdes/max96717.c
>> new file mode 100644
>> index 000000000000..60b285e547b7
>> --- /dev/null
>> +++ b/drivers/media/i2c/maxim-serdes/max96717.c
>> @@ -0,0 +1,1685 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Maxim MAX96717 GMSL2 Serializer Driver
>> + *
>> + * Copyright (C) 2025 Analog Devices Inc.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/pinctrl/pinctrl.h>
>> +#include <linux/pinctrl/pinmux.h>
>> +#include <linux/pinctrl/pinconf.h>
>> +#include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/regmap.h>
>> +
>> +#include "max_ser.h"
>> +
>> +#define MAX96717_REG0				0x0
>> +
>> +#define MAX96717_REG2				0x2
>> +#define MAX96717_REG2_VID_TX_EN_P(p)		BIT(4 + (p))
>> +
>> +#define MAX96717_REG3				0x3
>> +#define MAX96717_REG3_RCLKSEL			GENMASK(1, 0)
>> +#define MAX96717_REG3_RCLK_ALT			BIT(2)
>> +
>> +#define MAX96717_REG6				0x6
>> +#define MAX96717_REG6_RCLKEN			BIT(5)
>> +
>> +#define MAX96717_I2C_2(x)			(0x42 + (x) * 0x2)
>> +#define MAX96717_I2C_2_SRC			GENMASK(7, 1)
>> +
>> +#define MAX96717_I2C_3(x)			(0x43 + (x) * 0x2)
>> +#define MAX96717_I2C_3_DST			GENMASK(7, 1)
>> +
>> +#define MAX96717_TX3(p)				(0x53 + (p) * 0x4)
>> +#define MAX96717_TX3_TX_STR_SEL			GENMASK(1, 0)
>> +
>> +#define MAX96717_VIDEO_TX0(p)			(0x100 + (p) * 0x8)
> This is a bit confusing, looks like this register address is valid for MAX9295a VIDEO_TX0
> but not for MAX96717, VIDEO_TX0 (Z) is at 0x110.
> 

See pipe_hw_ids field of max96717_chip_info.
MAX9295A has pipes 0, 1, 2, 3, MAX96717 has pipe 2 only.
Registers and strides are the same, just pipes are missing.

> 
> 



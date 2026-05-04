Return-Path: <linux-gpio+bounces-36065-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBrdFq2a+GkAxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36065-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:10:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 542E04BD896
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 458FE301A2C3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8853D9DC4;
	Mon,  4 May 2026 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="vRzD39VN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA53A3D8132
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900077; cv=none; b=ljvTaQq2ExnCltlJjNpzDsTl7c+BJFLa2as+Wv6xsDXDuoPK9H/6kg+SyHvHcPdfKNbJghq0UAYOAiAEX++zANRgmOPE9fWmy5Xw1ePsda8MqojCU8utXR43UHqhWf6jRC/62NNfxRHEathMb/O4oliEvvvKBpDn8jj/gDCblHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900077; c=relaxed/simple;
	bh=SfrLhYfvia58mIrqMwiqY24xvyzZfeN95GCFj9Ymlu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHtFqFkTDDTWs1OJsyPVP7tvD2j+HdS8TEWwOiBdVHVLwzBbqULBmw7y2zwSy+zsBZILiDKqfnNFMhXkQJzwTh2zScKtw+fwovYttY7+/CdapN17YEnzZh8vBP0vFu3vBHtTXAKVwILnEhtly/oV6Kpfp+mjVtoPaQFBQb5nfeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=vRzD39VN; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8b6c9fdb68cso17006176d6.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 06:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777900075; x=1778504875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orEuFxihbtCw78bb0MGSYlMJ0pgE+offZfO0F9CrVb0=;
        b=vRzD39VN3deczejGqt9SufnxB8wHk6NHfv9oYhWXRya1NwOOjMIr9pvl/sNUvMCl9H
         FOi1wFLMGpO1uG+7ISWuUgc9msPeJIczmqB/JK/kknw36JtsV1Iog4u/ZSQcDuZcwLdW
         3crdaBslFVDS7hgCZcj0Ga1++6O3wReejN6gK2qSHNq0CB2w8thMmsCPbk37852ToJev
         W14PGnDaI6D/WpVMtBJJILy2gxHKuZh2ppEJq3aRW9hwUJ9+G+JTC/mf9DX7+06Y/fl7
         qq9mCTQYjdFGU+GBx6FzsXtT+MCOhrPDHsqpdEwrGLNgfM69naPCqIzNylOrB/g52E+E
         GfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900075; x=1778504875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orEuFxihbtCw78bb0MGSYlMJ0pgE+offZfO0F9CrVb0=;
        b=fVqRz7QD8MZ0rOLKxzSNUlh8oQ/OnO2n+Ow0w4ml/YjeJw2ou8vBUe4mfwoKeVf6IN
         M+QBn1FjQywY5CX0RH8+V9Y6LojE7p831k6/cxAqw1OtSq3ne8zd8cWUMwZ0twS0Z9iA
         oMG3VQK6+Y+CJdTCGKF+ZhCrCM+AWKdOJpI/EIfITa8yR48ytRFSn3vFqSevQvaqBvNE
         GCNUfEB2FwGqn8DgTj+xeHufxL8imL2KqCpt65AXp9CDxH8q3lWLgKzjv14MeA3ISevs
         4YGXEuTId44Wp6K/y/m3/hllVBIcwBIZghK1t09l9iWV+QsREaJuJx3duWkZOaug3bp4
         qx9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/xHZplj5VkK/T3NDHfJAgAWRHYb8luOMxailpD11b6b2+HDzHRmFtuGMRiCmB0ueFGo5KI90U9ayzJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVCGTnT0m6bT8ZTQVFRsoTvlKZs2wz4DYdCBIwyMAGrkdV+rI
	LiTzcgL2F3JBJ5tFVauprxytsrgfN/uEb3gOf6SVAxjPPSWH5k0eQfTZ7B3Atz94g8c=
X-Gm-Gg: AeBDiet6btdMdvkZJ25clKg31m+GNAHMgQjsZbG8PXWB1lMdyacCX0TgkSIRHZsAjqH
	YL5JuBUPRCNyTqsReM0S20jj3PXWEPpExJ2vG3QTbr3hB31IyN+Anu39znRtAn9XBRknQ4ifBf3
	DWFA2BoVxPEAHg5129NwjD7ETELXGBjty/kVgjEcZTwJ5M5mzMAQM4s6LBi/hEjVWMlQdwZ9q0E
	karmVVAt/P4IIDzsWeGdcukA9aR7kG5XWa0dp4HH26FrUPLqrCa8B5DejGqJW1BBX1ut/FLiLUi
	uxR/kPo5Ohx+Ufg22WeqyN6SQrLKUUuRRf1bLXWV/TR0D2JoucuGrjNcUp4X+ts1XNONvtxtKnt
	hR+hyjPeg2BlIilvaDBg+UBG8VyYPFHVcJLGEevyD7pPirCOV1bSHrhY2xaO27YymZe9BU0dS/R
	alkJK5JuTZcM054EW/pztCwz9NB/OSUCjQInZYhxCeoTPUQTtmUHmQX7N7hBzlTQPTcgDY9XsNs
	g==
X-Received: by 2002:a05:6214:5342:b0:8ac:b4d5:50ec with SMTP id 6a1803df08f44-8b668a1fafbmr160317526d6.38.1777900074368;
        Mon, 04 May 2026 06:07:54 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c6b8398sm130363776d6.37.2026.05.04.06.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:07:53 -0700 (PDT)
Message-ID: <53fb87c9-25f3-4da1-aa7b-104c10c92a06@riscstar.com>
Date: Mon, 4 May 2026 08:07:50 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <CAMRc=McWXCqyv1LmWMuEMmE3HqaURx_eMD8rkDs9AJT+7W2aYw@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAMRc=McWXCqyv1LmWMuEMmE3HqaURx_eMD8rkDs9AJT+7W2aYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 542E04BD896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36065-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,lunn.ch,davemloft.net,google.com,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,riscstar.com:mid,riscstar.com:email]

On 5/4/26 7:46 AM, Bartosz Golaszewski wrote:
> On Fri, 1 May 2026 17:54:17 +0200, Alex Elder <elder@riscstar.com> said:
>> Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
>> a small and highly-specialized SoC.  TC956x includes a GPIO block that
>> can be accessed, alongside several other peripherals, via two PCIe
>> endpoint functions.  The PCIe function driver creates an auxiliary
>> device for the GPIO block, and that device gets bound to this auxiliary
>> device driver.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>

Thanks Bartosz, I've got some responses below.

>> ---
>>   drivers/gpio/Kconfig       |  11 ++
>>   drivers/gpio/Makefile      |   1 +
>>   drivers/gpio/gpio-tc956x.c | 209 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 221 insertions(+)
>>   create mode 100644 drivers/gpio/gpio-tc956x.c
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 020e51e30317a..746cedea7e91d 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -1646,6 +1646,17 @@ config GPIO_TC3589X
>>   	  This enables support for the GPIOs found on the TC3589X
>>   	  I/O Expander.
>>
>> +config GPIO_TC956X
>> +	tristate "Toshiba TC956X GPIO support"
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default m if TOSHIBA_TC956X_PCI
>> +	help
>> +	  This enables support for the GPIO controller embedded in the Toshiba
>> +	  TC956X (and Qualcomm QPS615).  This device connects to the host
>> +	  via PCIe port, which is the upstream port on an internal PCIe
>> +	  switch.  On some platforms, a few of the GPIO lines are used to
>> +	  manage external resets.
>> +
>>   config GPIO_TIMBERDALE
>>   	bool "Support for timberdale GPIO IP"
>>   	depends on MFD_TIMBERDALE
>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> index b267598b517de..c3584e7cba9b4 100644
>> --- a/drivers/gpio/Makefile
>> +++ b/drivers/gpio/Makefile
>> @@ -178,6 +178,7 @@ obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
>>   obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
>>   obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
>>   obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
>> +obj-$(CONFIG_GPIO_TC956X)		+= gpio-tc956x.o
>>   obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
>>   obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
>>   obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
>> diff --git a/drivers/gpio/gpio-tc956x.c b/drivers/gpio/gpio-tc956x.c
>> new file mode 100644
>> index 0000000000000..12221d8f812d9
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-tc956x.c
>> @@ -0,0 +1,209 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +/*
>> + * The Toshiba TC956X implements a PCIe Gen 3 switch that connects an
>> + * upstream x4 port to two downstream PCIe x2 ports.  It incorporates
>> + * an internal endpoint on a internal PCIe port that implements two
>> + * Synopsys XGMAC Ethernet interfaces.
>> + *
>> + * 35 GPIOs are also implemented by an embedded GPIO controller.  Three
>> + * registers control the first 32 GPIOs (other than 20 and 21, which are
>> + * reserved).  Three other registers control GPIOs 32 through 36. GPIOs
>> + * 22-24, 27-28, 31, and 34 are treated as "input only".
>> + *
>> + * There is a TC956X PCI power controller driver that accesses the
>> + * direction and output value registers for GPIOs 2 and 3.  These
>> + * GPIOs control the reset signal for the two downstream PCIe ports.
>> + * Their values will never change during operation of this driver, and
>> + * this driver reserves these two GPIOS.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/dev_printk.h>
> 
> This is implied by device.h which is guarnteed by platform_device.h. Please
> drop it.

OK, I'll drop it.

>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#define DRIVER_NAME		"tc956x-gpio"
>> +
>> +#define TC956X_GPIO_COUNT	37	/* Number of GPIOs (20-21 reserved) */
>> +
>> +/* The GPIO offsets are relative to 0x1200 in TC956X SFR space */
>> +#define GPIO_IN0_OFFSET		0x00		/* Input value (0-31) */
>> +#define GPIO_EN0_OFFSET		0x08		/* 0: out; 1: in (0-31) */
>> +#define GPIO_OUT0_OFFSET	0x10		/* Output value (0-31) */
>> +
>> +#define GPIO_IN1_OFFSET		0x04		/* Input value (32-36) */
>> +#define GPIO_EN1_OFFSET		0x0c		/* 0: out; 1: in (32-36) */
>> +#define GPIO_OUT1_OFFSET	0x14		/* Output value (32-36) */
>> +
>> +/*
>> + * struct tc956x_gpio - Information related to the embedded GPIO controller
>> + * @chip:		GPIO chip structure
>> + * @regmap:		MMIO register map for SFR GPIO region access
>> + * @input_only:		Bitmap indicating which GPIOs are input-only
>> + */
>> +struct tc956x_gpio {
>> +	struct gpio_chip chip;
>> +	struct regmap *regmap;
>> +	DECLARE_BITMAP(input_only, TC956X_GPIO_COUNT);
>> +};
>> +
>> +static int tc956x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 reg;
>> +	u32 val;
>> +
>> +	if (test_bit(offset, gpio->input_only))
>> +		return GPIO_LINE_DIRECTION_IN;
>> +
>> +	reg = offset < 32 ? GPIO_EN0_OFFSET : GPIO_EN1_OFFSET;
>> +
>> +	regmap_read(gpio->regmap, reg, &val);
>> +	if (val & BIT(offset % 32))
>> +		return GPIO_LINE_DIRECTION_IN;
>> +
>> +	return GPIO_LINE_DIRECTION_OUT;
>> +}
>> +
>> +static int tc956x_gpio_direction_input(struct gpio_chip *gc,
>> +				       unsigned int offset)
>> +{
>> +	u32 reg = offset < 32 ? GPIO_EN0_OFFSET : GPIO_EN1_OFFSET;
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 mask = BIT(offset % 32);
>> +
>> +	return regmap_update_bits(gpio->regmap, reg, mask, mask);
>> +}
>> +
>> +static int tc956x_gpio_direction_output(struct gpio_chip *gc,
>> +					unsigned int offset, int value)
>> +{
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 vreg;
>> +	u32 dreg;
>> +	u32 mask;
>> +
>> +	if (test_bit(offset, gpio->input_only))
>> +		return -EINVAL;
>> +
>> +	if (offset < 32) {
>> +		vreg = GPIO_OUT0_OFFSET;
>> +		dreg = GPIO_EN0_OFFSET;
>> +	} else {
>> +		vreg = GPIO_OUT1_OFFSET;
>> +		dreg = GPIO_EN1_OFFSET;
>> +	}
>> +	mask = BIT(offset % 32);
>> +
>> +	/* Set output value first, then direction */
>> +	regmap_update_bits(gpio->regmap, vreg, mask, value ? mask : 0);
>> +
>> +	return regmap_update_bits(gpio->regmap, dreg, mask, 0);
>> +}
>> +
>> +static int tc956x_gpio_get(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	u32 reg = offset < 32 ? GPIO_IN0_OFFSET : GPIO_IN1_OFFSET;
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 val;
>> +
>> +	regmap_read(gpio->regmap, reg, &val);
>> +
>> +	return val & BIT(offset % 32) ? 1 : 0;
>> +}
>> +
>> +static int tc956x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
>> +{
>> +	u32 reg = offset < 32 ? GPIO_OUT0_OFFSET : GPIO_OUT1_OFFSET;
>> +	struct tc956x_gpio *gpio = gpiochip_get_data(gc);
>> +	u32 mask = BIT(offset % 32);
>> +
>> +	return regmap_update_bits(gpio->regmap, reg, mask, value ? mask : 0);
>> +}
>> +
>> +static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
>> +				       unsigned long *valid_mask,
>> +				       unsigned int ngpios)
>> +{
>> +	/*
>> +	 * GPIOs 2 and 3 are used by the PCI power control driver, and
>> +	 * we don't allow them to be used.  GPIOs 20 and 21 are reserved
>> +	 * (and not usable).
>> +	 */
>> +	bitmap_fill(valid_mask, ngpios);
>> +	bitmap_clear(valid_mask, 2, 2);
>> +	bitmap_clear(valid_mask, 20, 2);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tc956x_gpio_probe(struct auxiliary_device *adev,
>> +			     const struct auxiliary_device_id *id)
>> +{
>> +	struct device *dev = &adev->dev;
>> +	struct tc956x_gpio *gpio;
>> +	struct gpio_chip *gc;
>> +
>> +	if (!dev->platform_data)
>> +		return -EINVAL;
>> +
>> +	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
>> +	if (!gpio)
>> +		return -ENOMEM;
> 
> Add newline.

I will add a newline here.

> 
>> +	gpio->regmap = dev->platform_data;
> 
> It's not clear whether this is an mmio regmap or a slow-bus one that can fail.
> In the code above you're checking the return values of regmap operations quite
> inconsistently. Could you please verify if you need it and either always check
> them or not at all?

You're right.  I'm returning the result of regmap_update_bits()
from two callback functions.  But yes, this is an MMIO regmap.

I will return 0 and ignore the return value of regmap_update_bits()
in those spots, and will add some comments that make it clear that
this is an MMIO regmap.

>> +
>> +	/* Mark GPIOs 22, 23, 24, 27, 28, 31, and 34 as input only */
>> +	bitmap_set(gpio->input_only, 22, 3);
>> +	bitmap_set(gpio->input_only, 27, 2);
>> +	set_bit(31, gpio->input_only);
>> +	set_bit(34, gpio->input_only);
>> +
>> +	gc = &gpio->chip;
>> +
>> +	gc->label = DRIVER_NAME;
>> +	gc->parent = dev->parent;
>> +
>> +	gc->get_direction = tc956x_gpio_get_direction;
>> +	gc->direction_input = tc956x_gpio_direction_input;
>> +	gc->direction_output = tc956x_gpio_direction_output;
>> +	gc->get = tc956x_gpio_get;
>> +	gc->set = tc956x_gpio_set;
>> +	gc->init_valid_mask = tc956x_gpio_init_valid_mask;
>> +
>> +	gc->base = -1;
>> +	gc->ngpio = TC956X_GPIO_COUNT;
>> +	gc->can_sleep = false;
> 
> This makes me think this is an MMIO regmap after all.

You are correct.

> 
>> +
>> +	dev_set_drvdata(dev, gpio);
> 
> There's no corresponding dev_get_drvdata().

I hadn't noticed that.  We're only using the GPIO chip data
field (gc->gpiodev->data) instead.  I'll drop this call.

>> +
>> +	return devm_gpiochip_add_data(dev, gc, gpio);
>> +}
>> +
>> +static const struct auxiliary_device_id tc956x_gpio_ids[] = {
>> +	{ .name = "tc956x_pci.tc9564-gpio", },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(auxiliary, tc956x_gpio_ids);
>> +
>> +static struct auxiliary_driver tc956x_gpio_driver = {
>> +	.name		= DRIVER_NAME,
>> +	.probe          = tc956x_gpio_probe,
>> +	.id_table       = tc956x_gpio_ids,
>> +	.driver = {
>> +		.name		= DRIVER_NAME,
>> +		.owner		= THIS_MODULE,
>> +		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +};
>> +module_auxiliary_driver(tc956x_gpio_driver);
>> +
>> +MODULE_DESCRIPTION("Toshiba TC956X PCIe GPIO Driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("auxiliary:" DRIVER_NAME);
>> --
>> 2.51.0
>>
>>
> 
> There are a few minor issues but overall looks good!

Thank you very much for the review Bartosz.  I'll implement
all of your suggestions in the next version.

					-Alex


> 
> Bart



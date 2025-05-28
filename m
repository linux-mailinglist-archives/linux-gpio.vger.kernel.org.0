Return-Path: <linux-gpio+bounces-20654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11EAAC6894
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 13:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9260A4E023B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 11:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4F1283C92;
	Wed, 28 May 2025 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PkSYp+6T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E21C54A2;
	Wed, 28 May 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748432757; cv=none; b=fSf2uxCbvGevrF/a3Ti8R8U0zo5yexAh8RltwFgr47yO8Cozhx2qzCz+KMayMb4wCzrHiQXahI8mqV2Cn3/Tl5uPg7v/oRxl8QxzYbAp1ydkVuO/xE0YxT2OI9iKQWvzztOME5BZVmEEo9wyps/fQsNkNgCku4XNKFxfS7EHCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748432757; c=relaxed/simple;
	bh=kI/vxUI4Qz9dWk22zKonSQ4bWCxs0gqjDMYF2pUbJCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GARO0/IVf4Iqd/FUcQakHoeaicYAFLPhjnI9IhQ5nnNQObYbKwuZK1QWe5ZvCEpr72Jgx1lzbbSA4DcJ6n2mkr2vQsbtdrn7Uz29GdFqDQeg3Lhna9DjEvuz3a59t8pyVruuX2a0wX7p2t7nzzmtv7feIaP7jBCjBEAhlK7Lu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PkSYp+6T; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SB0xLs006237;
	Wed, 28 May 2025 13:45:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	y0H2U/oo7isvFrY6LzlGfAAitGQ52BI2rQGm2Do/Tms=; b=PkSYp+6TOsroWwK7
	bNaz6ZZwYxpPHjYec1wzx1Cnv80UpaT0mUWvfBoDE6Xdov9AkBAJrV+qMxKdX9Mm
	OWmeoMznLX+gdQuWsZ2+ZTBBXKWBFpUQYXr+Rlo8XqjjoKG7hoCJod3MfEaHwth4
	1Oyj4cQOiNaEYXmgAP/MGAraS222Kc4GxCEyqMdtgZV4kMSvFNa6a3WDRSPC0Pa3
	MbbXJBnt3DNiVVWJ19kU0pBnX1d3cZg7GX+JH12buGIK58U+gbIF8MhXwR5WPmgz
	n3+2yIdwLPhTiNH6OY3+24sJwfyfjXzVkwt618du/BrLq8+skSpicdqr7vP3s9po
	lzKHAA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk9a8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 13:45:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8195E4004B;
	Wed, 28 May 2025 13:44:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 166BD44D095;
	Wed, 28 May 2025 13:43:57 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 13:43:56 +0200
Message-ID: <2ebfc611-ce8f-4b10-8c71-a53eb634343d@foss.st.com>
Date: Wed, 28 May 2025 13:43:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] pinctrl: stm32: Introduce HDP driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-3-bd6ca199466a@foss.st.com>
 <85866e42-b3d4-462c-8890-e2a354627229@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <85866e42-b3d4-462c-8890-e2a354627229@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01

On 5/28/25 10:28, Krzysztof Kozlowski wrote:
> On 23/05/2025 14:38, Clément Le Goffic wrote:

Hi,

>> This patch introduce the driver for the Hardware Debug Port available on
> 
> "Add driver...", see submitting patches

Sure, I'll shorten the commit message

> 
> 
> 
>> STM32MP platforms. The HDP allows the observation of internal SoC
>> signals by using multiplexers. Each HDP port can provide up to 16
>> internal signals (one of them can be software controlled as a GPO).
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   drivers/pinctrl/stm32/Kconfig             |  14 +
>>   drivers/pinctrl/stm32/Makefile            |   1 +
>>   drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 720 ++++++++++++++++++++++++++++++
>>   3 files changed, 735 insertions(+)
>>
>> diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
>> index 2656d3d3ae40..4b474cfd1f2c 100644
>> --- a/drivers/pinctrl/stm32/Kconfig
>> +++ b/drivers/pinctrl/stm32/Kconfig
>> @@ -57,4 +57,18 @@ config PINCTRL_STM32MP257
>>   	depends on OF && HAS_IOMEM
>>   	default MACH_STM32MP25
>>   	select PINCTRL_STM32
>> +
>> +config PINCTRL_STM32_HDP
>> +	tristate "STMicroelectronics STM32 Hardware Debug Port (HDP) pin control"
>> +	depends on OF && HAS_IOMEM
>> +	default ARM64 || (ARM && CPU_V7)
> 
> I just cleaned this up and I still think this should be default for your
> arch, not for every other platform during compile test. See bunch of my
> commits "Do not enable by default during compile testing".
> 

Ok I'll use "default ARCH_STM32 && !ARM_SINGLE_ARMV7M" which is more 
restrictive.

> 
>> +	select PINMUX
>> +	select GENERIC_PINCONF
>> +	select GPIOLIB
>> +	help
>> +	  The Hardware Debug Port allows the observation of internal signals.
>> +	  It uses configurable multiplexer to route signals in a dedicated observation register.
>> +	  This driver also permits the observation of signals on external SoC pins.
>> +	  It permits the observation of up to 16 signals per HDP line.
>> +
>>   endif
>> diff --git a/drivers/pinctrl/stm32/Makefile b/drivers/pinctrl/stm32/Makefile
>> index 7b17464d8de1..98a1bbc7e16c 100644
>> --- a/drivers/pinctrl/stm32/Makefile
>> +++ b/drivers/pinctrl/stm32/Makefile
>> @@ -11,3 +11,4 @@ obj-$(CONFIG_PINCTRL_STM32H743)	+= pinctrl-stm32h743.o
>>   obj-$(CONFIG_PINCTRL_STM32MP135) += pinctrl-stm32mp135.o
>>   obj-$(CONFIG_PINCTRL_STM32MP157) += pinctrl-stm32mp157.o
>>   obj-$(CONFIG_PINCTRL_STM32MP257) += pinctrl-stm32mp257.o
>> +obj-$(CONFIG_PINCTRL_STM32_HDP) += pinctrl-stm32-hdp.o
>> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
>> new file mode 100644
>> index 000000000000..e91442eb566b
>> --- /dev/null
>> +++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
>> @@ -0,0 +1,720 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
>> + * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
>> + */
>> +#include <linux/bits.h>
>> +#include <linux/clk.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
> 
> Not used.

Ack

> 
>> +#include <linux/pinctrl/consumer.h>
>> +#include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/pinctrl/pinctrl.h>
>> +#include <linux/pinctrl/pinmux.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +
> Best regards,
> Krzysztof



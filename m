Return-Path: <linux-gpio+bounces-14987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B72A1861B
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 21:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA824188BAB0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 20:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262EF1F7572;
	Tue, 21 Jan 2025 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VAfLXoWF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16121F543E;
	Tue, 21 Jan 2025 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737491155; cv=none; b=Mg+VvB7Gws20XiGugUSBBTHPL02bzvC68XwefLY8J/DuzjlbJUixbeDGw3BIBfWP0bKS6+4CUH2EV6XwncwEQaKdvXPElLDZy2QfdMnoiucdBWo+xNnUwqF5Kd6i8yoODcuxyZasZB7/jT8a6vMTYoSObyL4QXd+npkxfWXE4lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737491155; c=relaxed/simple;
	bh=OeQYxBNSvninRamTPoDFwD/3XDpLYxGP+p+rn0x3lmU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=BKvcmJc3Aaam6gQcGVDHBHI8pv6gCSsNr94fTofnc4tWBWoFTxekZVRKpb4FSmALeYrWlY7rwQBXgzOwvZRWcB3XbQMUo+owhyKAUHILdObbUgjucg1NyJPP24e56tknzVfOlIWwbMRGGtLEZHgkpEZ7NB37HwQfSgMfT4hXxl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VAfLXoWF; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LKPBof885622
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 14:25:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737491111;
	bh=+baiWO3XSuOuVQ0nf47EOojWyPz6NENRXK3GNxWuHbQ=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=VAfLXoWFcLmGB8u3V5zyqGR/6UZlpbhWoKMC30IQFBFIPx/Nlq5K2xnYPC5S1Felf
	 aTUFbJ6hvf77bLGvTyTeztCxj8lrDdFwfQ740m+fUXoOXdeUR+Esch9cW7VGHgPZOl
	 xXURb+MqUQb+2O5l+x9CZEKj9IcPjKYkU/Hr7Qe4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LKPAVi092337
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 14:25:10 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 14:25:10 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 14:25:10 -0600
Received: from [10.250.42.221] ([10.250.42.221])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LKPAHg002934;
	Tue, 21 Jan 2025 14:25:10 -0600
Message-ID: <0c502117-fdea-46c0-99f4-10b0173483b1@ti.com>
Date: Tue, 21 Jan 2025 14:25:10 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Subject: Re: [PATCH v1 1/1] gpio: tps65214: Add support for TI TPS65214 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
References: <20250116223840.430054-1-s-ramamoorthy@ti.com>
 <20250116223840.430054-2-s-ramamoorthy@ti.com>
 <08ecd393-d5c9-4426-a488-d4fea7067358@kernel.org>
Content-Language: en-US
In-Reply-To: <08ecd393-d5c9-4426-a488-d4fea7067358@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/17/25 3:27 AM, Krzysztof Kozlowski wrote:
> On 16/01/2025 23:38, Shree Ramamoorthy wrote:
>>  /*
>> - * GPIO driver for TI TPS65215/TPS65219 PMICs
>> + * TI TPS65214/TPS65215/TPS65219 PMIC GPIO Driver
>>   *
>>   * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
>>   */
>> @@ -156,6 +156,10 @@ static const struct gpio_chip tps65219_template_chip = {
>>  };
>>  
>>  static const struct tps65219_chip_data chip_info_table[] = {
>> +	[TPS65214] = {
>> +		.ngpio = 2,
>> +		.offset = 1,
> So that's the same as TPS65215? Why do you keep duplicating entries?

Thanks for reviewing! I will register TPS65214 as "tps65215-gpio" in the
MFD driver to minimize changes. This will eliminate the tps65215 gpio series,
since only the description changes are left.

>> +	},
>>  	[TPS65215] = {
>>  		.ngpio = 2,
>>  		.offset = 1,
> Best regards,
> Krzysztof

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer



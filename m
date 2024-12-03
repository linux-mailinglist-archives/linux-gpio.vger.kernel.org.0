Return-Path: <linux-gpio+bounces-13470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D857E9E2E76
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 22:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E284283361
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 21:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2647208997;
	Tue,  3 Dec 2024 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FiZf/AIZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC391362;
	Tue,  3 Dec 2024 21:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733262891; cv=none; b=cbd051WZ7p8E5SGhdSumzBtF4v5w0eT0wKM5FVmFWiSe5HkNPUMqP0DNsPcLCQfpEmQtEAz0DZfwgUZwZwz1WuKLM6is+voWRxIFIDZAhqpiZb7dmlTIg8wn8lOiCNTAvgJZeDOHxknk1X6PjxkArIdE1n22erkvkVU8zDhRIgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733262891; c=relaxed/simple;
	bh=mO3P53jjRSPArFtNaOavfmbYHxijZc/rirxayXf1Ewg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gEN0nP3OUbFiFOTqDcl/jYpUXF38PTdUMvBkyY168UODowyWVZdJ8HEuhrTp0xdIFboLFVpS+qW4Lgur/jvGBWnOl6t6gPr2jd2HzSAfm51LQyUubatcgDTifQbu2ImqA7LfqkzyMyKmaoBHun69ABI2ENFsrnbTNJaxhTlf2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FiZf/AIZ; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3LsfSS1506095
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2024 15:54:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733262881;
	bh=t9UmxNX5ocO42iQ/orx9DcB2voE4RNWe9sONi2VfXO8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FiZf/AIZBa7IJ63jtMmleyIqt7IrlbAVzYtbbT99/uFO6siU22YeEGtHsf64ivNHK
	 F/VAF11xeYLS72Nw4fK1S3YOXHvUZ5oGLFFsnhA5vNX+WyiXrI6yG9QMtrOovEkAKA
	 EpbUFet5BvnMgqcPcPQNl8rCJz+I/WHUqQib+m1U=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3LseUv000330
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Dec 2024 15:54:40 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 15:54:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 15:54:40 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3LsdIT081180;
	Tue, 3 Dec 2024 15:54:40 -0600
Message-ID: <37f90519-48e9-4caa-80c6-9f6ae61aae0a@ti.com>
Date: Tue, 3 Dec 2024 15:54:39 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpio: omap: allow building the module with
 COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Alexander Sverdlin
	<alexander.sverdlin@siemens.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
References: <20241203164143.29852-1-brgl@bgdev.pl>
 <213de4bc-3706-4bb0-a827-06c63bfe0294@ti.com>
 <CAMRc=Md_u3YmseW5kV5VH4F99_0P=tc4pWty_fB3dVfv_JDxWQ@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CAMRc=Md_u3YmseW5kV5VH4F99_0P=tc4pWty_fB3dVfv_JDxWQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/3/24 2:36 PM, Bartosz Golaszewski wrote:
> On Tue, Dec 3, 2024 at 7:41 PM Andrew Davis <afd@ti.com> wrote:
>>
>> On 12/3/24 10:41 AM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> For better build coverage, allow building the gpio-omap driver with
>>> COMPILE_TEST Kconfig option enabled.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>    drivers/gpio/Kconfig | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>>> index 56fee58e281e7..fb923ccd79028 100644
>>> --- a/drivers/gpio/Kconfig
>>> +++ b/drivers/gpio/Kconfig
>>> @@ -530,7 +530,7 @@ config GPIO_OCTEON
>>>    config GPIO_OMAP
>>>        tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
>>>        default y if ARCH_OMAP
>>> -     depends on ARM
>>> +     depends on ARM || COMPILE_TEST
>>
>> Why do we have this depends on ARM at all? It already has that condition
>> above on ARCH_OMAP2PLUS which limits to ARM outside of compile testing.
>>
>> And anything that selects ARCH_OMAP2PLUS also selects ARCH_OMAP, so we
>> could just do this:
>>
> 
> I agree we can drop that bit.
> 
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -528,9 +528,9 @@ config GPIO_OCTEON
>>             family of SOCs.
>>
>>    config GPIO_OMAP
>> -       tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
>> -       default y if ARCH_OMAP
>> -       depends on ARM
>> +       tristate "TI OMAP GPIO support"
>> +       default y
>> +       depends on ARCH_OMAP2PLUS || COMPILE_TEST
> 
> This would default to y with COMPILE_TEST. We definitely don't want
> that. IMO it should be:
> 
> tristate "TI OMAP GPIO support"
> depends on ARCH_OMAP2PLUS || COMPILE_TEST
> default y if ARCH_OMAP2PLUS
> 

Looks good to me

Andrew


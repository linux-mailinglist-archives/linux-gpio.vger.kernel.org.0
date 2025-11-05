Return-Path: <linux-gpio+bounces-28091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D0C34FE8
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 10:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 057F718C155B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 09:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8FF304BC2;
	Wed,  5 Nov 2025 09:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U7apPqlw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182812E092B;
	Wed,  5 Nov 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762336768; cv=none; b=r8qlDSF+1eKr7H2I/q3dZhtjaES/AwrWpNagUDh+2/OENVaEufvysyP7VMHxXBJqPEo0lsuEpA9hPldtCgL7Y4rCVWC0spdkAtHjXczSTOK+IQcQwH0VW7+hcMaNoy10EMiAZh+OVTIQ6O8k26lKYszZFWP3I6DnRFzTXyHBJng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762336768; c=relaxed/simple;
	bh=GkzER4LywElZ1Te04pFR7BzD01AG7yO8Xnaj5QbcBTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXOLRFRaq/WjbQGKjHRWCeFUS2R3l4upIzcbzoePGpziGFggDItWKwxVcUHpNK7SAJ4y/KQjnH2VhbSui75CJWeAmmoKb+PHLIFitIZ8jko2Ewum6GpJUL2ntxx7QZVYlx3/+4Ppu+dZ/8KuysAmqz3hEibt59w8fwxftwRKG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U7apPqlw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 472A24E41529;
	Wed,  5 Nov 2025 09:59:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C0BA60693;
	Wed,  5 Nov 2025 09:59:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFFFF10B51CDA;
	Wed,  5 Nov 2025 10:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762336762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=W7mQ7IokHJ3nWA7cRt64cKeM8hjAsSEvGV/qAnTn+2M=;
	b=U7apPqlwefz1Foe2DA/nunmFM2kF14BvaxYO7EmnTFczsmlokpQXs5OS9bgQxnwevJqH3k
	XH2y9I6QtAOKbBNR75G6D8D6wpafvO0HUGOCRtV/e+iZOCwtUn3623CrSpkp0dZTRLMxH4
	dNT3riXBF3kmDZVTgPqBPKoOiFaDlYN4Vkdzzz53ObO1NIxDafgwm6FTG5LMcvPepu/UKG
	JOjKYW+98YQFvfMGHOrrpVhaiIEcGOflzJJJ6gsdBOJrVkkTZQir6fZZgiaIr6S2H8uanT
	JEIqphFG11uA4NzGSbfMXofigbxQXxbXxQ4dY0RD8egaS+esWjotuufMnXppWw==
Message-ID: <743d8bda-6c95-4d10-88a3-72a42973781b@bootlin.com>
Date: Wed, 5 Nov 2025 10:59:20 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: aggregator: restore the set_config operation
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <oliver.sang@intel.com>
References: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
 <CAMRc=MfG8-c_+_R3meR_DgK3OMM3JEMSWu3SjfdMz-aW8c5wew@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAMRc=MfG8-c_+_R3meR_DgK3OMM3JEMSWu3SjfdMz-aW8c5wew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Bartosz,

On 9/29/25 2:45 PM, Bartosz Golaszewski wrote:
> On Mon, Sep 29, 2025 at 12:03 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> Restore the set_config operation, as it was lost during the refactoring of
>> the gpio-aggregator driver while creating the gpio forwarder library.
>>
>> Fixes: b31c68fd851e7 ("gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd")
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>> Closes: https://lore.kernel.org/oe-lkp/202509281206.a7334ae8-lkp@intel.com
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
>>  drivers/gpio/gpio-aggregator.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
>> index 37600faf4a4b728ceb1937538b3f6b78ab3e90fa..416f265d09d070ee33e30bf6773e9d8fffc242bd 100644
>> --- a/drivers/gpio/gpio-aggregator.c
>> +++ b/drivers/gpio/gpio-aggregator.c
>> @@ -723,6 +723,7 @@ struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
>>         chip->get_multiple = gpio_fwd_get_multiple_locked;
>>         chip->set = gpio_fwd_set;
>>         chip->set_multiple = gpio_fwd_set_multiple_locked;
>> +       chip->set_config = gpio_fwd_set_config;
>>         chip->to_irq = gpio_fwd_to_irq;
>>         chip->base = -1;
>>         chip->ngpio = ngpios;
>>
>> ---
> 
> Thanks for fixing it. I saw the report but I had already prepared my
> big PR for Linus. This will still make v6.18-rc1, I will send it later
> into the merge window. Please address Geert's review.

Gentle ping, just in case of you forgot it :)
Geert sent his Reviewed-by tag.

Best Regards,
Thomas



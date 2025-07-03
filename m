Return-Path: <linux-gpio+bounces-22741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F449AF7D77
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 821174E5CF2
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 16:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99D12EE60E;
	Thu,  3 Jul 2025 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MD1ZMeI5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892C2343CF;
	Thu,  3 Jul 2025 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558928; cv=none; b=p5dD7EYhDGGJTDob3lWdDhHWyZlmQwFKtV/Inb9i52OPp487nIYVPUThlGyUyXFUKABOV2toHtZn2RmP0qI/qyzdXqm1egMIo3swZABvHUoZT1YAz8Zpt/rrWWsNvdD+H/jjF10MemlIGjbY4jiZfl878n6xAp1zhx/jZrtttOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558928; c=relaxed/simple;
	bh=jgXmg0croTNgf5Skg/x4EaWgIz2NY41vbNOhzhNBgMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ISRqKyG9ZuAFDiAuGVl/YKsTamVbOzTawk4cYpu2DdxPYU6mdMdczoR+t2usyhoOeVIVjKPYgsHnRfxBD8In00wWAmds81r7SMfUCYOJsTDXnzehZTo87UgW1vguvlOTmot8R1gvOqIPsd/UFp3Nw0N1S5W5rP4RaAi+REVZwB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MD1ZMeI5; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 563G8GFd3585162;
	Thu, 3 Jul 2025 11:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751558896;
	bh=+jcBCieFDen8sKXicA5k7QAJrs0vZ+msRPr3l1brO6c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MD1ZMeI51FQsnFe6f28qSkle0hNfjlXTpY1VkhuBuzTl5EPVb0glWbCLHm9UWVgDr
	 +vJPmuoJOsCQUqLDp1CG6l2JCytVG5XkrvvFsFEtfT+VSmx4zURczjz9bo0OSyC96X
	 nN3jGkILbtv0EEEoKFfR9iv8U6eEMpa0kOxPE+EA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 563G8G6i510422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 11:08:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 11:08:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 11:08:16 -0500
Received: from [10.250.42.221] ([10.250.42.221])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 563G8FwS1391436;
	Thu, 3 Jul 2025 11:08:15 -0500
Message-ID: <41e8bfba-b44c-4a12-994e-3fd1fe3dd347@ti.com>
Date: Thu, 3 Jul 2025 11:08:15 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] gpio: tps65219: Update _IDX & _OFFSET macro prefix
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>,
        <jcormier@criticallink.com>
References: <20250702164926.2990958-1-s-ramamoorthy@ti.com>
 <20250702164926.2990958-2-s-ramamoorthy@ti.com>
 <CAMRc=Mdg8_Tq1PWAaOSzzPGUMu6-_3SvOy6F+n_Qv90arVyeLg@mail.gmail.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <CAMRc=Mdg8_Tq1PWAaOSzzPGUMu6-_3SvOy6F+n_Qv90arVyeLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 7/3/2025 4:51 AM, Bartosz Golaszewski wrote:
> On Wed, Jul 2, 2025 at 6:51 PM Shree Ramamoorthy <s-ramamoorthy@ti.com> wrote:
>> TPS65215 and TPS65219 are overlapping PMIC devices. While their regulator
>> features differe, the GPIO features are the same. In the TPS65219 MFD
>> driver, the 2 PMICs share the same "tps65219-gpio" compatible string to
>> limit support for TPS65215 in this GPIO driver to comments.
>>
>> The TPS6521X_GPIO0_IDX and TPS6521X_GPIO0_OFFSET macro name prefixes are
>> updated to indicate these macros apply to both PMICs.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> Reviewed-by: Roger Quadros <rogerq@kernel.org>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/gpio/gpio-tps65219.c | 27 +++++++++++++++++----------
>>  1 file changed, 17 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
>> index 526640c39a11..3c762103babc 100644
>> --- a/drivers/gpio/gpio-tps65219.c
>> +++ b/drivers/gpio/gpio-tps65219.c
>> @@ -1,8 +1,8 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /*
>> - * GPIO driver for TI TPS65219 PMICs
>> + * GPIO driver for TI TPS65215/TPS65219 PMICs
>>   *
>> - * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
>> + * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com/
> Should be 2022,2025.

Will consolidate the copyright years, thanks!

>
> Bart


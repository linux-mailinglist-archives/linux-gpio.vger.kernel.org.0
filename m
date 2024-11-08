Return-Path: <linux-gpio+bounces-12745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 750689C20D3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 16:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A11CA1C219A9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 15:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61F221B441;
	Fri,  8 Nov 2024 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U9hBt24h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAC71EF0BD;
	Fri,  8 Nov 2024 15:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080593; cv=none; b=i9zI4R9cQ4Bbq/Jv4y0h2yPN1oM9hRa54cTURHUNxMEjqSz7ShG2yZLqChxl0w/HAv098Apzm4ru5oLN3YbqrMHu5K/KTSEkaBaF6dM0ZEamD5N5DGVrJvZrlUlK0dwclSiS5KsQXl7FwG+eyi7X2iXCl+xjZqOHUOW6BTE056g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080593; c=relaxed/simple;
	bh=b4X++9C+P9DTjtKS5lwaxeV29oAFiHpqKkhfWAGXw7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:CC:From:
	 In-Reply-To:Content-Type; b=qRzAMawDB8MzYsC1iiIG2Z2jlOqrBZBLzkO9IJPonkTGP0fEQhDWv6ZuqwyBIA+gZRdHtt14/fjPGRE4uxh3kYq+CXYJ8gmyOTby94rwvmjwA/0biIv0sCQC4dyRJ/dEE0cxs+jX8nKWqQhXp4fo0mmpB097rUZiuaWjvc2SM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=U9hBt24h; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A8Fh5hd062572;
	Fri, 8 Nov 2024 09:43:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731080585;
	bh=AdSqTP2kP6+Pzmnx8mliJefFa0Q27jkrh0vetk8iYjM=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=U9hBt24hYZcfGOyRFgtoTXNs9ttIFvG/L2D8lrXXqa/dGIV0as6x+Fk7/T00ITi2Q
	 4SnkPUoTTteayQmYNBNuUFI33FBpV5Joixk6+YBVWRUkIurU4Kbe+b25FRBwahk68y
	 gvS3kaS83ETQ9XS2kRDYWOFqIDUp0KSrbfvJQ6Lo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8Fh583116200;
	Fri, 8 Nov 2024 09:43:05 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 09:43:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 09:43:05 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8Fh5gp112055;
	Fri, 8 Nov 2024 09:43:05 -0600
Message-ID: <e54b0558-80ca-4352-b54a-22f9eb8c9001@ti.com>
Date: Fri, 8 Nov 2024 09:43:05 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] gpio: omap: Add omap_gpio_disable/enable_irq
 calls
To: Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>
References: <20241031145652.342696-1-jm@ti.com> <7h5xp7owmy.fsf@baylibre.com>
 <520c7e6b-f9c0-441f-8810-8e5ede668f6a@ti.com>
 <20241105190005.cg6dpeedbirgflqm@iaqt7>
 <CAMRc=MexFELAEVpEg39teG=Yr-R71gwxRR9TtGDwHjVijzDeWA@mail.gmail.com>
Content-Language: en-US
CC: Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-kernel@vger.kernel.org>, Kevin Hilman
	<khilman@kernel.org>,
        Bin Liu <b-liu@ti.com>, <linux-omap@vger.kernel.org>
From: Judith Mendez <jm@ti.com>
In-Reply-To: <CAMRc=MexFELAEVpEg39teG=Yr-R71gwxRR9TtGDwHjVijzDeWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Bartosz,

On 11/6/24 7:42 AM, Bartosz Golaszewski wrote:
> On Tue, Nov 5, 2024 at 8:00 PM Bin Liu <b-liu@ti.com> wrote:
>>
>> On Tue, Nov 05, 2024 at 12:47:58PM -0600, Judith Mendez wrote:
>>> Hi Kevin,
>>>
>>> On 11/1/24 9:29 AM, Kevin Hilman wrote:
>>>> Hi Judith,
>>>>
>>>> Judith Mendez <jm@ti.com> writes:
>>>>
>>>>> From: Bin Liu <b-liu@ti.com>
>>>>>
>>>>> Add omap_gpio_disable_irq and omap_gpio_enable_irq
>>>>> calls in gpio-omap.
>>>>>
>>>>> Currently, kernel cannot disable gpio interrupts in
>>>>> case of a irq storm, so add omap_gpio_disable/enable_irq
>>>>> so that interrupts can be disabled/enabled.
>>>>>
>>>>> Signed-off-by: Bin Liu <b-liu@ti.com>
>>>>> [Judith: Add commit message]
>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>
>>>> Thanks for this patch.  Can you give a bit more context on the
>>>> problem(s) this solves and on which SoCs/platforms it was
>>>> developed/validated?
>>>
>>> Sorry for the late response. Patch was tested/developed on am335x
>>> device BBB, If you feed a PWM signal at 200KHz frequency to
>>> GPIO, and execute gpiomon 0 12 &, Linux will be unresponsive
>>> even after CTRL+C without these 2 functions in this patch. Once
>>> this patch is applied, you can get console back after hitting
>>> CTRL+C and then proceed to kill gpiomon.
>>
>> In addtion to Judith's explanation, when the PWM is applied to a GPIO
>> pin, kernel detects the interrupt storm and disables the irq, however,
>> without these callbacks, this gpio platform driver doesn't really
>> disable the interrupt in the gpio controller, so the interrupt storm is
>> still happening and handled by this gpio controller driver then causes
>> Linux unresponsive.
>>
>> -Bin.
> 
> I take it that this is a fix then and should have relevant Fixes and Cc tags?

ok, will send v3 with fixes tag.

~ Judith



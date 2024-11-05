Return-Path: <linux-gpio+bounces-12572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDB9BD54F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 19:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D9FB1F244BF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 18:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7E21EC015;
	Tue,  5 Nov 2024 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ab2Loq2+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8181E7674;
	Tue,  5 Nov 2024 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832486; cv=none; b=utV8vfr4BSaVT67LOOlPXAp1xZkXVz1v5PTu1s9D3pPGA/lSrJ5P6gfh7KFFe0cyD1wBVTwuJ6ZSltq5bky6ERgiYgy25OaJZAOOu953ZS1BLekTi9alXJio/xXab9naL4afdsn8XTOKy5g3v6w3gBbimyVe3EYqh5ILhId3nO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832486; c=relaxed/simple;
	bh=wZ3nz/ueeoAtZQLoiZuzfHvYGkCKP/0+bKttFhSmcuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qkklf+oIh3WdygBuL1Z2Vbf1fg9aKyf2wCNT6D8/DS3galXFHSJziZTQlzQimRFpDySyYjXkwhlC5mbGA0dT/r2YtQk+8vSxiih3LiAtd5ZWUQllhl6PyFhkOtsVOAoWCIx3z+64QzhN6wM0Q/6DzfxdkDemKKw8+ysbKwDzCfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ab2Loq2+; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A5IlwON081389;
	Tue, 5 Nov 2024 12:47:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730832478;
	bh=p0l2itf7c4GFGonKlq5wqstKsJwjqiz36EQVwMCRD2Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ab2Loq2+S/jDW5xZ+K4lzxBjzpxAGguI6OGJVRMfAPoX4rpIWQHs1RM5AKTo4Lp5b
	 PI0ZPwWR5MdFGeWlks3s9m84VydaI+wI64fxCYY/ucCt0yfKqUmmstLz3Lp+9R6Tgp
	 MBwIyCUCmBGpBkzZyC6uc2mulMWap3ZNii8RNr+4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A5IlwBM013292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 12:47:58 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 12:47:58 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 12:47:58 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A5IlwLf009405;
	Tue, 5 Nov 2024 12:47:58 -0600
Message-ID: <520c7e6b-f9c0-441f-8810-8e5ede668f6a@ti.com>
Date: Tue, 5 Nov 2024 12:47:58 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] gpio: omap: Add omap_gpio_disable/enable_irq
 calls
To: Kevin Hilman <khilman@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bin Liu <b-liu@ti.com>
References: <20241031145652.342696-1-jm@ti.com> <7h5xp7owmy.fsf@baylibre.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <7h5xp7owmy.fsf@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Kevin,

On 11/1/24 9:29 AM, Kevin Hilman wrote:
> Hi Judith,
> 
> Judith Mendez <jm@ti.com> writes:
> 
>> From: Bin Liu <b-liu@ti.com>
>>
>> Add omap_gpio_disable_irq and omap_gpio_enable_irq
>> calls in gpio-omap.
>>
>> Currently, kernel cannot disable gpio interrupts in
>> case of a irq storm, so add omap_gpio_disable/enable_irq
>> so that interrupts can be disabled/enabled.
>>
>> Signed-off-by: Bin Liu <b-liu@ti.com>
>> [Judith: Add commit message]
>> Signed-off-by: Judith Mendez <jm@ti.com>
> 
> Thanks for this patch.  Can you give a bit more context on the
> problem(s) this solves and on which SoCs/platforms it was
> developed/validated?

Sorry for the late response. Patch was tested/developed on am335x
device BBB, If you feed a PWM signal at 200KHz frequency to
GPIO, and execute gpiomon 0 12 &, Linux will be unresponsive
even after CTRL+C without these 2 functions in this patch. Once
this patch is applied, you can get console back after hitting
CTRL+C and then proceed to kill gpiomon.

~ Judith




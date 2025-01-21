Return-Path: <linux-gpio+bounces-14965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1033A17B38
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 11:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E03FD16B43D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 10:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D7D1EEA3C;
	Tue, 21 Jan 2025 10:17:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9222F1C07F3
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454620; cv=none; b=E1DCwJraCN0QFMPc4eojjHfiNuSMe8a+EnhuKdttEE/ejNLnfj30/rwpGGBX+T5aEK3230wl3ehwKt2KL+R8IsRx1T7tahD/SRrzanJD5cjykLer0a9lU7enIIc6+ef6CMNvW614I4prtpCOtEz2s32vHCutPm1i9FCV8C47QvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454620; c=relaxed/simple;
	bh=/trfDYGvu3TDFvV4FpiW1kmpQxxytA2WZ68X4Ltj5mY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfc/4/dLq3f/iOVZoNLLvBrfU+VJwqfHe6H3NSM2Ws2WUfFaopmKvt8xwzWIArr3r318TmAVjBQHHjc+cIKgjViCtDSR2QFKTat4B83mTQSMH1ALG3hpecdoTh/Eb6mdRUzAml/VQ//K5EpGLqjwX+m9CKSw2OYxKNdKN8wYAqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taBJL-0004uM-KZ; Tue, 21 Jan 2025 11:16:43 +0100
Message-ID: <1cedb66f-dad9-4974-865c-bd5a2721a873@pengutronix.de>
Date: Tue, 21 Jan 2025 11:16:41 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] gpio: mxc: remove dead code after switch to DT-only
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Haibo Chen <haibo.chen@nxp.com>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
 <CAMRc=MfZncRy_Qx_Yi_QjqX2cszv9X9st5Yk87Q7R3Hug2S9KQ@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAMRc=MfZncRy_Qx_Yi_QjqX2cszv9X9st5Yk87Q7R3Hug2S9KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On 15.01.25 17:55, Bartosz Golaszewski wrote:
> On Mon, Jan 13, 2025 at 11:19 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>
>> struct platform_device::id was only set by board code, but since i.MX
>> became a devicetree-only platform, this will always be -1
>> (PLATFORM_DEVID_NONE).
>>
>> Note: of_alias_get_id() returns a negative number on error and base
>> treats all negative errors the same, so we need not add any additional
>> error handling.
>>
>> Fixes: 0f2c7af45d7e ("gpio: mxc: Convert the driver to DT-only")
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  drivers/gpio/gpio-mxc.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 4cb455b2bdee71ba4eb20c93567c3b8db100dbb2..619b6fb9d833a4bb94a93b4209f01b49ad1cbdb0 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -490,8 +490,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>         port->gc.request = mxc_gpio_request;
>>         port->gc.free = mxc_gpio_free;
>>         port->gc.to_irq = mxc_gpio_to_irq;
>> -       port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
>> -                                            pdev->id * 32;
>> +       port->gc.base = of_alias_get_id(np, "gpio") * 32;
>>
>>         err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
>>         if (err)
>>
>> --
>> 2.39.5
>>
> 
> This looks like I can pick it up separately from the rest? Is that right?

Yes, please do.

Thanks,
Ahmad

> 
> Bart
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


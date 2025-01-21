Return-Path: <linux-gpio+bounces-14966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E94DA17B8B
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 11:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D46D8188161F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 10:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251581F0E5C;
	Tue, 21 Jan 2025 10:26:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C01F0E57
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455205; cv=none; b=sM8QIz+rm2Hygm06JQYgCMBOUA6eSULOi0NqOgSH3UL+rbk0hanbG3IJGWQV2Rv0OtMQ6d4BxUZ6NPSjeuQK6xDIjYYr6cGVmM5fK+rU6P8fdySerdLGQwkMEoUTaks2EU3UswAHoXsN/csN1o7etB0OO/SG08dZfhShX4gC+DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455205; c=relaxed/simple;
	bh=+GwUqLVv9UiG81Eik2G/N+A+U9sjJV2P+7G7dsBseQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkSUU3SDaf0Rn7gbqqDYbHN9DtfVRuBkpmpg0i2QPXdmzaseeJsSXe3PdyPLEsBmkQ+2YZWInYgWak1wQM+aM7VS0sNoDMGZT4qzqmAqE0BID7dLyZxRI2rDFxCjZmIdsUK+UNPPIm4xleNJGlcwJKDGfLTfBQKlKsfyKWEPvfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taBSt-0006uR-6B; Tue, 21 Jan 2025 11:26:35 +0100
Message-ID: <449b4618-7d06-49c8-b521-5fdd02a2ba1b@pengutronix.de>
Date: Tue, 21 Jan 2025 11:26:33 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Haibo Chen <haibo.chen@nxp.com>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
 <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
 <CAHp75VfAmqzKxgXTc9TqeFOeGSr_D3NmCa0M7+4Zf37CofrHeg@mail.gmail.com>
 <40531a5e-993f-4532-b071-6f233d6923f8@pengutronix.de>
 <20250115130432.GA159787@rigel>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250115130432.GA159787@rigel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hi Kent,

On 15.01.25 14:04, Kent Gibson wrote:
> On Wed, Jan 15, 2025 at 08:07:38AM +0100, Ahmad Fatoum wrote:
>> On 14.01.25 20:38, Andy Shevchenko wrote:
>>> On Tue, Jan 14, 2025 at 12:06 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>> On 14.01.25 10:49, Andy Shevchenko wrote:
>>>>> On Tue, Jan 14, 2025 at 12:20 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>>>>
>>>>>> Some drivers have had deterministic GPIO numbering for most of
>>>>>> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
>>>>>> ("gpio/mxc: specify gpio base for device tree probe"), more than
>>>>>> 12 years ago.
>>>>>>
>>>>>> Reverting this to dynamically numbered will break existing setups in
>>>>>> the worst manner possible: The build will succeed, the kernel will not
>>>>>> print warnings, but users will find their devices essentially toggling
>>>>>> GPIOs at random with the potential of permanent damage.
>>>>>>
>>>>>> As these concerns won't go away until the sysfs interface is removed,
>>>>>> let's add a new struct gpio_chip::legacy_static_base member that can be
>>>>>> used by existing drivers that have been grandfathered in to suppress
>>>>>> the warning currently being printed:
>>>>>>
>>>>>>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>>>>>>   use dynamic allocation.
>>>>>
>>>>> Warning is harmless and still a good reminder for the stuff that needs
>>>>> more love.
>>>>> NAK.
>>>>
>>>> A warning is a call-to-action and it's counterproductive to keep tricking
>>>> people into removing the static base and breaking other users' scripts.
>>>
>>> Are you prepared to say the same when the entire GPIO SYSFS will be
>>> removed? Because that's exactly what I referred to in the reply to the
>>> cover letter as an impediment to move forward.
>>
>> No. But this gives me an idea: We could make the warning dependent
>> on CONFIG_GPIO_SYSFS and add a comment to the i.MX code suggesting
>> users do that instead. What do you think?
>>
> 
> AIUI, the purpose of the warning is to remind driver authors, not end users,
> to update their drivers, as the old behaviour is deprecated. That is
> independent of GPIO SYSFS - that just happens to be something that makes the
> change visible to userspace.
> 
> Rather than making the warning conditional, how about making the fix for the
> warning in your driver, so switching to dynamic allocation, conditional on
> CONFIG_GPIO_SYSFS not being set?
> That would provide a path forward for users that want to dispense with
> the warning - as long as they dispense with GPIO SYSFS.

That could work for gpio-mxc, provided that SysFS is the only user for which
the static base matters. I assume that's the case, but I am not sure.

An argument for suppressing the warning selectively in the GPIO core is that
this doesn't only affect gpio-mxc, but also e.g. gpio-zynq or gpio-mxs.

Cheers,
Ahmad



> 
> Cheers,
> Kent.
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


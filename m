Return-Path: <linux-gpio+bounces-14818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2C5A11A70
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 08:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE9DB163678
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 07:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83822309AE;
	Wed, 15 Jan 2025 07:07:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C9A22F392
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924869; cv=none; b=jUZTlj8MukJnHFQExjTRwaNBDtPr67DHIMSSMhQ2X4mVc6SH8I6Gk85DPySao7Uq1WzI9cF2JlFGJJEjV8mqWl12keYz1I2H2Wx8b51msaw3nomBlh+BixlMW5N5ttm5qNJd66/Xvl9WNEkAQh1LL93CKb+1+V8mIjBHnz0g9YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924869; c=relaxed/simple;
	bh=20ODciCJkVPGXL8bl1J5Gnel9mKRBsQcgJ/dHp+VnpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=diHS45sWGCDfx078XAv1H7YoMJtnMfB0sw9lVdd+CfKwEToLvhzeHcp1vFLBYIAWRnJgRY+3oYXL/jGeSfyjvDK5Kk2RyR7H377K/v4kFRg8nPn6vTgxTgMcO/ADbt0pCmTf/7cJIRdJGiXssJPeIU4I6ZqK0nrXFdbu6cvO2t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXxV5-0002m7-Tw; Wed, 15 Jan 2025 08:07:39 +0100
Message-ID: <40531a5e-993f-4532-b071-6f233d6923f8@pengutronix.de>
Date: Wed, 15 Jan 2025 08:07:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>,
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
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAHp75VfAmqzKxgXTc9TqeFOeGSr_D3NmCa0M7+4Zf37CofrHeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On 14.01.25 20:38, Andy Shevchenko wrote:
> On Tue, Jan 14, 2025 at 12:06 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> On 14.01.25 10:49, Andy Shevchenko wrote:
>>> On Tue, Jan 14, 2025 at 12:20 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>>
>>>> Some drivers have had deterministic GPIO numbering for most of
>>>> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
>>>> ("gpio/mxc: specify gpio base for device tree probe"), more than
>>>> 12 years ago.
>>>>
>>>> Reverting this to dynamically numbered will break existing setups in
>>>> the worst manner possible: The build will succeed, the kernel will not
>>>> print warnings, but users will find their devices essentially toggling
>>>> GPIOs at random with the potential of permanent damage.
>>>>
>>>> As these concerns won't go away until the sysfs interface is removed,
>>>> let's add a new struct gpio_chip::legacy_static_base member that can be
>>>> used by existing drivers that have been grandfathered in to suppress
>>>> the warning currently being printed:
>>>>
>>>>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>>>>   use dynamic allocation.
>>>
>>> Warning is harmless and still a good reminder for the stuff that needs
>>> more love.
>>> NAK.
>>
>> A warning is a call-to-action and it's counterproductive to keep tricking
>> people into removing the static base and breaking other users' scripts.
> 
> Are you prepared to say the same when the entire GPIO SYSFS will be
> removed? Because that's exactly what I referred to in the reply to the
> cover letter as an impediment to move forward.

No. But this gives me an idea: We could make the warning dependent
on CONFIG_GPIO_SYSFS and add a comment to the i.MX code suggesting
users do that instead. What do you think?

>> I don't understand what love you think this will spawn with regards
>> to the i.MX GPIO driver. Can you explain?
> 
> To fix the bugs you found. If it's not the GPIO driver a culprit, we
> need to find the real one and fix that.

Again: jumbling GPIOs with potential hardware harm as a result is not a fix.

Cheers,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


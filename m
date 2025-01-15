Return-Path: <linux-gpio+bounces-14815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C9A11A42
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 08:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 694D63A8C31
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 07:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C232522DFA4;
	Wed, 15 Jan 2025 07:03:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FEF23243D
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 07:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924598; cv=none; b=ohlb3j1bp42keIcXj8ixbr4v4PXiDRAMc5x/zGTN3N9Ll/NXUUmGl/fWJFc4yTd4DZpIsQnLfNM6hv5JM+wi0PON2JKx9ihWWG0U/W/sPFua/JZKuwtChtrd2RQfyYW4f0Jl4x7f3V47d4Qud+FyK7pEjt7LhnHTIxgF/P5nKs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924598; c=relaxed/simple;
	bh=jSEWg4EMuMVXUCaAkiVdII0DJ6CB33/BCGItwud/NWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+HlCVFpud5rx4+6/kosqC9ycQvrMC0ZSFuJ3mv6oikojgkYfjjtI2vWbk2A9oK6/8a8il3DWdLXuDGtIQlq5xK2vexwB914yOmnjj3Rk0FpzXadC7bnH03OE0fkC+2t9ajt1whw6LnFlwT2RJJRzCtdJCYBkipeuY1w9lf8j7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXxQf-0002M8-Ds; Wed, 15 Jan 2025 08:03:05 +0100
Message-ID: <43ecfb45-d96b-46e5-95e1-2ece32532e74@pengutronix.de>
Date: Wed, 15 Jan 2025 08:03:02 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
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
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
 <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
 <CAHp75VfOhAmkpB_nhQE8m25p=3P2wvTfOnQFEsLR5KEktLy4vQ@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAHp75VfOhAmkpB_nhQE8m25p=3P2wvTfOnQFEsLR5KEktLy4vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hello Andy,

On 14.01.25 20:43, Andy Shevchenko wrote:
> On Tue, Jan 14, 2025 at 11:55 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> On 14.01.25 10:46, Andy Shevchenko wrote:
>>> On Tue, Jan 14, 2025 at 12:19 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>>
>>>> The i.MX GPIO driver has had deterministic numbering for the GPIOs
>>>> for more than 12 years.
>>>>
>>>> Reverting this to dynamically numbered will break existing setups in the
>>>> worst manner possible: The build will succeed, the kernel will not print
>>>> warnings, but users will find their devices essentially toggling GPIOs
>>>> at random with the potential of permanent damage. We thus want to keep
>>>> the numbering as-is until the SysFS API is removed and script fail
>>>> instead of toggling GPIOs dependent on probe order.

Please read my cover letter / commit messages. I do nowhere object to deprecation
and removal of the sysfs interface. But I strongly disagree that a necessary step
towards that is having Linux start toggling random GPIOs after an update on
platforms that behaved consistently for >10 years.

Can you explain why we can't remove the hardcoded base at the same time that
sysfs support is removed for good?

>>> While I understand the issue this tends to get never fixed until the
>>> entire support of iMX boards will be dropped.
>>
>> i.MX is an actively developed and widely used platform. Why should support
>> be dropped?
> 
> Exactly, Which means "tend to get never fixed".

Imagine ReiserFS deprecation strategy involved shipping an update that
just corrupted your existing file system and developers insisted on calling
it a fix, as ReiserFS is going to be removed anyway.

>>> Personally I do not like
>>> this series at all. Rather let's try to go the hard way and understand
>>> what's going on to fix the current issues.
>>
>> /sys/class/gpio is deprecated and when it is finally removed, this series can
>> be reverted again. The alternatives are either do nothing and live with 6 kernel
>> warnings cluttering every boot or show users the finger as described in
>> the cover letter.
>>
>> Do you see a different path forward?
> 
> Yes, try to write your scripts based on the libgpiod or the tools
> provided by the project. I.o.w. follow the warning that SYSFS will be
> removed at some point and prepare yourself for that. If some kernel
> work needs to be done, contribute.

I have been using libgpiod for many years, but have in the past used sysfs
or been involved with projects using sysfs. I agree that these projects
need to switch to the GPIO character device and that they will be eventually
broken. Yet, I still get warnings despite doing everything correctly IMO and no,
I don't want to fix a warning by doing negligent stuff like jumble GPIO numbers,
with the reason that it's going to be broken for good in the future anyway.

To reiterate, my issue is with the manner of breakage:

  - broken, because /sys/class/gpio doesn't exist: good
  - broken, because script executes successfully, but toggles arbitrary pins: bad

Thanks,
Ahmad

> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


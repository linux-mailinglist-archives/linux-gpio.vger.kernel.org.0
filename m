Return-Path: <linux-gpio+bounces-14969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84390A17CDA
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 12:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D5C3AB532
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 11:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB1F1C07F1;
	Tue, 21 Jan 2025 11:17:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0D61ABED7
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458219; cv=none; b=FKnWslBMPd3N87s8a9u9s1UI0/XuVuDZ2rkuTLKmAEa33kzwqMc9i/ov9T0PKdJZWCY9J94wvjn2PTTlYLgPnYhuOqrQFaL231OZiUWFO9jHF3a/eCPZ24sOg7zPqcJ+UeOHgvmFa3vxJxMbXjFHeI0yCgIC2NkrwW7BhJ7gzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458219; c=relaxed/simple;
	bh=8yKxH0g/pG8RGcNLDmVG/8uOXwMa3rxyM6mR14fJvpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgaVMjzWLkSUaAwwFyEEBUMcWW9u/XCZFmYnrjzqaLqbu1D1rcf4ekh8S30MQcZHEw2pUzjb5UppLd/BhP6ZYm5nrqTL3FKkbUQq8rF2GQ+pggbs6wrbm4Mrfu69DcvihVsd6F/RoRKO8eiJbvldDHQ3FlI3UalGv8v2iXk+aqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taCFV-0001Dr-Vy; Tue, 21 Jan 2025 12:16:50 +0100
Message-ID: <591d482c-cf1b-4875-b18d-8560f66e00d0@pengutronix.de>
Date: Tue, 21 Jan 2025 12:16:48 +0100
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
 <43ecfb45-d96b-46e5-95e1-2ece32532e74@pengutronix.de>
 <CAHp75VfZHZ7Xx1SnryBX683B=gm70SE_bvhivn+ecUePebQLdA@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAHp75VfZHZ7Xx1SnryBX683B=gm70SE_bvhivn+ecUePebQLdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hi Andy,

On 15.01.25 16:16, Andy Shevchenko wrote:
> On Wed, Jan 15, 2025 at 9:03 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> Please read my cover letter / commit messages. I do nowhere object to deprecation
>> and removal of the sysfs interface. But I strongly disagree that a necessary step
>> towards that is having Linux start toggling random GPIOs after an update on
>> platforms that behaved consistently for >10 years.
>>
>> Can you explain why we can't remove the hardcoded base at the same time that
>> sysfs support is removed for good?
> 
> Because (if follow your logic!) it won't ever happen until all the
> platforms that are using the non-dynamic bases are being removed as
> well.
>
> Otherwise this situation isn't anyhow different to the broken platform
> as you described.

Sorry, it's not clear to me why non-dynamic-bases can't be removed
at the same time that SysFS itself is removed. Can you explain?

>>>> i.MX is an actively developed and widely used platform. Why should support
>>>> be dropped?
>>>
>>> Exactly, Which means "tend to get never fixed".
>>
>> Imagine ReiserFS deprecation strategy involved shipping an update that
>> just corrupted your existing file system and developers insisted on calling
>> it a fix, as ReiserFS is going to be removed anyway.
> 
> It's not the same. If you still want to compare, then it means that
> what I suggest is to move from Reiser to say XFS.

I made a chart.

Starting position is that both ReiserFS and GPIO SysFS are going to be removed.

                +------------------------------------------------------------------------+
                | File System                       | GPIO                               |
+---------------+-----------------------------------+------------------------------------+
| Sensible      | Use XFS. ReiserFS will be         | Use libgpiod. /sys/class/gpio will |
|               | removed in future.                | be removed in future               |
+---------------+-----------------------------------+------------------------------------+
| User-hostile  | Mounting will jumble your inodes  | Booting will jumble your GPIOs     |
|               | and possibly corrupt your FS.     | and possibly brick your board.     |
+---------------+-----------------------------------+------------------------------------+

I believe the second row is bad and I don't want it for i.MX
users (or any users for that matter).

>> To reiterate, my issue is with the manner of breakage:
>>
>>   - broken, because /sys/class/gpio doesn't exist: good
>>   - broken, because script executes successfully, but toggles arbitrary pins: bad
> 
> I understand that, but what the series is trying to do is to put on
> hold _any_ sysfs removal activity along with reducing test coverage
> and motivation to fix the certain platform to work with dynamic base.

Why can't consumers of the static base be removed and then when none
are left, the base goes away too. Why does it have to be the other
way round?

> So, prepare your scripts not to toggle arbitrary numbers then and use libgpiod.

The SoC's own GPIO controllers have had deterministic numbering
for a long time. What would make them arbitrary is setting the base
to -1.

> P.S. I think this discussion goes nowhere. Talk to the GPIO
> maintainers for the matter, 

I believe that's what I am doing now?

> I'm not preventing you to put on hold GPIO
> development for _this_ platform, but I'm strongly against that because
> of your platform others should also be on hold, hence my NAK for that
> gpiolib patch.

Can you explain or point me at resources to understand why a static base
is blocking GPIO development subsystem-wide?

Thanks,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


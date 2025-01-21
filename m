Return-Path: <linux-gpio+bounces-14967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5FAA17BFC
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 11:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7E97167713
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 10:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7771EF0B8;
	Tue, 21 Jan 2025 10:37:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F481F0E2B
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455850; cv=none; b=QbrJlr3X3zNwsvLvolb3fk7IBltcOS1lYPUKH0UaCLV0+0emGVFuJmXT9ACZ6kBL/dMu62q80NpQkfkuQBIYZ6XfEelDef/SkaIB5UzvXlPCn3EoeIlmXqbAEadxdN+rzVJl4FMV4LvIc12bHy8oSt/Fr7AzDWPWHhmeyCkG4ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455850; c=relaxed/simple;
	bh=fqyXwICWjYHIfxpEIj9YTGdsmPTGZBm2nD8wy6ZMLPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8A/JvA8StUAPSTVe+udtGgn2yhk5VIjUtB8DQv/+fhku3WR08ipJwopaaG+g78CeyTiEGW1GZi2xoI4Byup+T6jWtNfh4bTmCPCb9RwYHvbjv/TJfLz1yxkuGWt4327DMRZGCsjvXmK0XLXAhe8n0UeEhzvhyAYmlg+6cDPJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taBdH-0001OQ-Rz; Tue, 21 Jan 2025 11:37:19 +0100
Message-ID: <3f21523b-816e-488c-bf0a-c6677c375a18@pengutronix.de>
Date: Tue, 21 Jan 2025 11:37:18 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Whitcroft
 <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
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
 <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hello Bartosz,

On 15.01.25 17:52, Bartosz Golaszewski wrote:
> On Tue, Jan 14, 2025 at 10:55 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>
>> Hi Andy,
>>
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
>>>
>>> While I understand the issue this tends to get never fixed until the
>>> entire support of iMX boards will be dropped.
>>
>> i.MX is an actively developed and widely used platform. Why should support
>> be dropped?
>>
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
>>
> 
> I recently wrote a user-space compatibility layer for sysfs[1]. While
> right now it doesn't support static base numbers, I'm very open to
> adding it except that I wasn't sure how to approach it.
> 
> Is this of any use to you and could it help you switch to libgpiod
> without changing your user-space set-up (given the support for static
> GPIO numbering)?

If the goal is to have a drop-in replacement for sysfs outside
of the kernel, I think it needs to maintain the same numbering.

I am not sure I see myself using it, because the new projects are using
libgpiod from the get-go. My issue is not with removal of sysfs, but with
user hostile deprecation approaches.

> If so, how would you like to see this implemented? A
> config file at /etc that would list chip labels and their desired GPIO
> base?

Many GPIOs tend to not have labels. I think the mapping config file
should rather map GPIO controllers to a base address. The same thing the
kernel is currently doing. This assumes the numbering of the built-in
GPIO controllers is deterministic, e.g. by consulting /aliases. I haven't
checked, but I hope this is already the case.

Cheers,
Ahmad

> 
> Bartosz
> 
> [1] https://github.com/brgl/gpiod-sysfs-proxy
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


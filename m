Return-Path: <linux-gpio+bounces-14762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76DFA10365
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 10:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D0613A7EE4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 09:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706A924333A;
	Tue, 14 Jan 2025 09:55:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE7E28EC8D
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848532; cv=none; b=k7UhjGQfNk9cirHGBLJTn58iFgJx0Q6ICaxCr2LwTMWZ7pWae18VGyOXuUb0+7d+3wrk4eLIRPlCBoK/Jqyf7zAgsI0+tR4d2McMW5P2noRaIMVE/X0LEr0Cd+0czGwWO7KQSSEwsK5xZdo5TQlYZORdTynN2zpqZ0x92HcAj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848532; c=relaxed/simple;
	bh=Wf7Ij/bbTSH9F+tunPrr1EksbaNI5ggnkDzx2XjAQBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNvP8+vzvc8PX8Do3Co6bze0zpXtQp7lq4YrBlLzSFG/65iI1kd7e/ddvfoW1t+kZdtuakOkpn2Gy8hlRABWhecyABQNxDIDvINpg8koqTPnEPNjJGa1+OplW8/SnCO/0mKloMy5+CwmAm/EOde73XLNXt/qFBpHOQUcVrvN31o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXddj-0003GN-6L; Tue, 14 Jan 2025 10:55:15 +0100
Message-ID: <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
Date: Tue, 14 Jan 2025 10:55:12 +0100
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
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hi Andy,

On 14.01.25 10:46, Andy Shevchenko wrote:
> On Tue, Jan 14, 2025 at 12:19 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>
>> The i.MX GPIO driver has had deterministic numbering for the GPIOs
>> for more than 12 years.
>>
>> Reverting this to dynamically numbered will break existing setups in the
>> worst manner possible: The build will succeed, the kernel will not print
>> warnings, but users will find their devices essentially toggling GPIOs
>> at random with the potential of permanent damage. We thus want to keep
>> the numbering as-is until the SysFS API is removed and script fail
>> instead of toggling GPIOs dependent on probe order.
> 
> While I understand the issue this tends to get never fixed until the
> entire support of iMX boards will be dropped.

i.MX is an actively developed and widely used platform. Why should support
be dropped?

> Personally I do not like
> this series at all. Rather let's try to go the hard way and understand
> what's going on to fix the current issues.

/sys/class/gpio is deprecated and when it is finally removed, this series can
be reverted again. The alternatives are either do nothing and live with 6 kernel
warnings cluttering every boot or show users the finger as described in
the cover letter.

Do you see a different path forward?

Cheers,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


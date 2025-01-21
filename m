Return-Path: <linux-gpio+bounces-14971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F569A17D11
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 12:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E3B5161F4D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 11:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099AD1C243D;
	Tue, 21 Jan 2025 11:34:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6F18FC67
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737459250; cv=none; b=Q06ndvF9Z+JSYVF00HWEuN7Zo33S1FaTYhCtzF7wEjKLK+u2RITwcn1Hce4KWxHVB/obhOcTM7AK2jTRLXu13S3vAxRF9rpJHvwH9v9K7H61dgOoRgBJ7pnb9S1IB8+69E+0WSefabvJW6acsmwU1U7PEyAV0L4vEi+PJRediYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737459250; c=relaxed/simple;
	bh=NoXQwoCtpnaZQjVbLneelfBDRPuJ3Ck7akKmGThLcK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgOrLK0UHj++06ecDgiHf87tvgTTxXjnotUyr2hBv60KnxA8jA5q250us8iZenWkXXquI5Zymvm9tCL5nVnL2f7cBh4lPD42aZsrJVK/9vFQ+dFZaPeNfXRcwHK5iWP+NPBReNhIAfchjCtAhquRwZP21adsq+0CpQVB2nzeelY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taCWE-0004e1-6h; Tue, 21 Jan 2025 12:34:06 +0100
Message-ID: <f1b00285-4afb-4a3b-9918-46fbfc8ce4a8@pengutronix.de>
Date: Tue, 21 Jan 2025 12:34:04 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Linus Walleij <linus.walleij@linaro.org>
Cc: imx@lists.linux.dev, linux-gpio@vger.kernel.org,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Haibo Chen
 <haibo.chen@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andy Whitcroft <apw@canonical.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CACRpkdbgv5BhP_iv1fV7-=w6qF3H+=GiUJz=hQko3rcd6uq4BQ@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CACRpkdbgv5BhP_iv1fV7-=w6qF3H+=GiUJz=hQko3rcd6uq4BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hi Linus,

On 15.01.25 13:00, Linus Walleij wrote:
> On Mon, Jan 13, 2025 at 11:19 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
>> As these concerns won't go away until the sysfs interface is removed,
>> let's add a new struct gpio_chip::legacy_static_base member that can be
>> used by existing drivers that have been grandfathered in to suppress
>> the warning currently being printed:
> 
> I think entire drivers, pertaining to in worst case several generations
> of SoCs is not the way to approach this. It could be a SoC or, more
> likely, single systems using a SoC, that has a problem with this.
> 
> If you want to safeguard this I would use some code loop in the
> gpiolib(-sysfs) that looks at of_machine_is_compatible("foo,bar-machine")
> to match the top-level compatible for known problematic machines
> so we can be fine-grained of this so when that machines retires
> the driver can start using dynamic GPIO number allotment.

It's meant to apply to all existing i.MX SoCs, but not for new ones using
the same driver.

Filtering by board is not practical and doesn't address the problem of
a kernel update leading to toggling of arbitrary GPIOs.

I am wondering, what remaining _users_ of the GPIO base do we have.
Is it just SysFS and legacy board code?

Cheers,
Ahmad

> 
> Yours,
> Linus Walleij
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


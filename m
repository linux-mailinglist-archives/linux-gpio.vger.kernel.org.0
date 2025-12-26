Return-Path: <linux-gpio+bounces-29904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE626CDEB05
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 13:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C35E030198AE
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 12:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB126320A0B;
	Fri, 26 Dec 2025 12:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nj5z+U1X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3AD31ED66;
	Fri, 26 Dec 2025 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766751582; cv=none; b=XvVyLCTMOZTQcgiKCZIm0F3HxhQ5dn2QXgOLj4E58ROM9nKtMvuQy9MQqgXTkDY+XXj9BOn8EB4X/V9Krw1FSMlYkk2CYsU4oorRNxqk9QN63FzXu7cg5N9wtDo8llQqp4il7OkEFnnDiVpItRv6KbhYn5bSrTEVbrgxDLVm5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766751582; c=relaxed/simple;
	bh=uAxk26knPepIH440iKZ5l20d0wLGzJkjVhWaQLPTqko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAYqRU3XQI99eyNrR2aIOkn93jp5ZnzbFXqWNSkPGQxmuFuw0uhrSNS7FkYRyFdidHQ7fj/ZzrmtTvGlJVYdXWkKotBWoW34d+X9gAxM719J2liTm2EW7or7bjUOWmBKjvVrQ38ZtW4PkaNygyGr+3k2+T+4+GvKoLXWcaF/Y6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nj5z+U1X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFB0C4CEF7;
	Fri, 26 Dec 2025 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766751581;
	bh=uAxk26knPepIH440iKZ5l20d0wLGzJkjVhWaQLPTqko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nj5z+U1XgV+GXN87GIVYLhlSzBqc8DsIgU+zyKp5dqIc3VQMby5xJV5RPhxFRR8VP
	 TCW0zcp5yCiq+ZNrz98jjbqvNblahHeezL0a2x5xw9G3GC9BSA1R5LN/ltLIsLY3H3
	 RKBgjE7w1IpahppEyYyMePNOyoRpz5T4xeGcBwt8QTz1x/DKaSHxQaBLtgYLEuWWpc
	 NglBTbeq0Gw45ev5nN0UeWxobArwRHgcV/yrSlEQVQQ7op/RoBwMO5CXcDv4iQrsH7
	 0aO1ZbQV2YCr5GWVVf0yFXIkptr1C2f7byuZiPf8vekYRCKe3C1C1BEnTvUOl97Rjf
	 G2W2ol3ok1H5g==
Message-ID: <a26a5397-7597-49f6-9e73-3eb853915166@kernel.org>
Date: Fri, 26 Dec 2025 13:19:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] mfd: Add RTL8231 core device
To: Sander Vanheule <sander@svanheule.net>, kernel test robot
 <lkp@intel.com>, Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Mark Brown <broonie@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20251215175115.135294-4-sander@svanheule.net>
 <202512220956.FVakrdhV-lkp@intel.com>
 <12c98c7c8bead26a61764e3e9611badf2cdfcac5.camel@svanheule.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <12c98c7c8bead26a61764e3e9611badf2cdfcac5.camel@svanheule.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/12/2025 12:59, Sander Vanheule wrote:
> Adding the netdev and regmap maintainers for extra input.
> 
> On Mon, 2025-12-22 at 09:43 +0100, kernel test robot wrote:
>> url:    https://github.com/intel-lab-lkp/linux/commits/Sander-Vanheule/dt-bindings-leds-Binding-for-RTL8231-scan-matrix/20251216-015552
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-fixes
>> patch link:    https://lore.kernel.org/r/20251215175115.135294-4-sander%40svanheule.net
>> patch subject: [PATCH v9 3/6] mfd: Add RTL8231 core device
>> config: alpha-kismet-CONFIG_MDIO_BUS-CONFIG_REGMAP_MDIO-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220956.FVakrdhV-lkp@intel.com/config)
>> reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220956.FVakrdhV-lkp@intel.com/reproduce)
>>
> 
> For context: these patches introduce a new MFD with pinctrl and led subdevices.
> The RTL8231 MFD is attached to an MDIO bus, but it can also be attached to an
> I2C bus (not currently supported). The drivers use regmap to provide a bus
> abstraction.
> 
>> kismet warnings: (new ones prefixed by >>)
>>>> kismet: WARNING: unmet direct dependencies detected for MDIO_BUS when
>>>> selected by REGMAP_MDIO
>>    WARNING: unmet direct dependencies detected for MDIO_BUS
>>      Depends on [n]: NETDEVICES [=n]
>>      Selected by [y]:
>>      - REGMAP_MDIO [=y]
> 
> I'm a bit puzzled on how to solve this one. The issue detected here is that my
> driver (MFD_RTL8231) selects REGMAP_MDIO, which in turn selects MDIO_BUS. The
> latter is dependent on NETDEVICES, which is not selected in this test. 
> The kernel does not yet have any other consumers of REGMAP_MDIO, which is
> probably the reason the dependency issue has gone undetected until now.
> 
> REGMAP_MDIO is not a visible symbol, so it must be selected by drivers.

Reminds me old problem, probably the same:

https://lore.kernel.org/all/20250515140555.325601-2-krzysztof.kozlowski@linaro.org/

https://lore.kernel.org/all/20250516141722.13772-1-afd@ti.com/

Exactly the same MDIO here and there.

> 
> Other REGMAP_XYZ symbols (almost) exclusively use "depends on XYZ", but if I
> change REGMAP_MDIO to "depends on", the warning just changes to:
> 
>    WARNING: unmet direct dependencies detected for REGMAP_MDIO
>      Depends on [n]: MDIO_BUS [=n]
>      Selected by [y]:
>      - MFD_RTL8231 [=y] && HAS_IOMEM [=y]
> 
> Trying to make MFD_RTL8231 also depend on MDIO_BUS, like .e.g I2C dependent
> devices do, results in a recursive dependency:
> 
> 
>    error: recursive dependency detected!
>    	symbol GPIOLIB is selected by PINCTRL_RTL8231
>    	symbol PINCTRL_RTL8231 depends on MFD_RTL8231
>    	symbol MFD_RTL8231 depends on MDIO_BUS
>    	symbol MDIO_BUS is selected by PHYLIB
>    	symbol PHYLIB is selected by ARC_EMAC_CORE
>    	symbol ARC_EMAC_CORE is selected by EMAC_ROCKCHIP
>    	symbol EMAC_ROCKCHIP depends on OF_IRQ
>    	symbol OF_IRQ depends on IRQ_DOMAIN
>    	symbol IRQ_DOMAIN is selected by GENERIC_IRQ_CHIP
>    	symbol GENERIC_IRQ_CHIP is selected by GPIO_MVEBU
>    	symbol GPIO_MVEBU depends on GPIOLIB
>    
> The 'quick fix' appears to be to add "select NETDEVICES" to REGMAP_MDIO. The
> platforms that use the RTL8231 MFD are typically ethernet switches, so they
> would have NETDEVICES enabled anway, but that feels very heavy handed and
> automatically pulls in a lot of extra stuff. Would this be acceptable or is
> there a more desirable approach I'm not seeing here?

Rather fix the same way Andrew did it. Or maybe his patch was not merged?

Best regards,
Krzysztof


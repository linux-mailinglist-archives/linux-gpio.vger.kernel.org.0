Return-Path: <linux-gpio+bounces-25562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3512B42FE3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 04:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2098E7AEEC4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 02:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DAC1FAC34;
	Thu,  4 Sep 2025 02:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zgdPixrz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B328A3D3B3;
	Thu,  4 Sep 2025 02:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756953773; cv=none; b=DMYgpYjgxQCk753s0di+LrkcUUCfcb0hDN/bfZSA6xfNDDJ3SWBbVNk1DeLYaxXjN+E+VkRp3QE3hjl++XTyWlZeebvhMY2GvRHXdvlG/bAMHB8uQAq1IIuqO/IV6eCCJ1201lxg4Q6OQzJrdjOEbmeYlDCzqfhmjSOjz42xRXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756953773; c=relaxed/simple;
	bh=LQ1AA6YtGx0dyBtxOqIWy5XG55hhZgcniAQICgxVYLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNT3dLVyH629RtFb093EYASJgwQexcKpSN9XJ1pD33Htv5//ZV2wAo3jY8XAnny53fCf67KIcPoRCMQ2Z89TYu5UPtVGckXKUy1xfyWPoPsSuJQw087XKjQwoCBPxA2Bs28HnLEnImNHiSEIJex/WdqRFLPT2X0u3/b9bj4SvnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zgdPixrz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=t6Qv7z1IN8S8fv1frwsYzP+oy3CFyPNsjv2eggmm0RA=; b=zgdPixrzDDevLDZ83jSHOwgKf9
	iVbwl3LwKxvnX487n3tBetP+/pjSRWgdbJpBYkv+qV7b3w4Dw+San7GE8lzh/hZ9guYtNoyIuY3bZ
	qit2B8QFI9UhgnV11v82DY44AU+OmF3pbLQ/+HBS9rZ5j5zkO+FfcPGEMPSrCwCllGXtdx+2bE0Ed
	WSiTx/Hypmxc81neIZu9Ks/6B1nBqgvsGzqEJiAR2IrtHz1gAU8crTz/SUkqiBItyRbDPHk9logYs
	CpEqF8VFX6DgAUFbOSs231zVd9FkB0nDMTFGf723AEfVdIqS5dyeAum3RdChMs1QQ6g5tM1VG9eTl
	Dwx445+g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzvy-00000008S2K-0NuR;
	Thu, 04 Sep 2025 02:42:46 +0000
Message-ID: <afd7e91d-8c79-4f78-8c79-3b667b35f8f8@infradead.org>
Date: Wed, 3 Sep 2025 19:42:45 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi--

On 9/3/25 3:05 AM, Nuno Sá via B4 Relay wrote:
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e43abb322fa6e15f19f2f498aa5adea03e6cd3bf..0273b0f8944b634f14141aac4d99f502d03b3a32 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -461,6 +461,16 @@ config GPIO_LPC32XX
>  	  Select this option to enable GPIO driver for
>  	  NXP LPC32XX devices.
>  

How about either of these instead?

> +config GPIO_LTC4283
> +	tristate "Analog Devices LTC4283 GPIO support"
> +	depends on SENSORS_LTC4283
> +	help
> +	  If you say yes here you want the GPIO function available in Analog
> +	  Devices LTC4283 Negative Voltage Hot Swap Controller.

this

> +	  Say yes here you want the GPIO function available in Analog
> +	  Devices LTC4283 Negative Voltage Hot Swap Controller.

or this

> +	  If you say yes here you get the GPIO function available in Analog
> +	  Devices LTC4283 Negative Voltage Hot Swap Controller.

or use the GPIO_LPC32XX kconfig entry just above here as a model.

thanks.
-- 
~Randy



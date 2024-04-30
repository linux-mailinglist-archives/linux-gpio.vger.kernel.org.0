Return-Path: <linux-gpio+bounces-5941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E428B74F3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 13:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 038991F22E3C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 11:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D23D13D26E;
	Tue, 30 Apr 2024 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAYfwnR9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83E13C9C3;
	Tue, 30 Apr 2024 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478073; cv=none; b=U/iYkBn2CUiUEQ6h15q/R/M7ITbV6YUdaDI44zjK2CWVwY7vJh+PHrV3t08dyHusLEvnn6XVMbybe9ApeDjpMIeUuRwp2aRYXDKMbM4Cb32jRD2C57nirbFZzNMAV+zBrW5Iaci5y0+essX80WLDUliIYpmKb3jiTpRO3qyiUOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478073; c=relaxed/simple;
	bh=IapLrD/jogJqlTH0kGzdqSYfKtIIUt9wn2mvkUe0d0k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WxOfErQ/Yd9DfpdlqF1D47akLywMr0qGX+sS/0EcaaQQMkpjkWIW+Xz4izKoakoR+Ysl0MzIbPKE5eBAlQZaE/f1yK6cLib9Wp9rHv1o/Yi/4iKd+YVxTNI+rZIaquKB2TIuo5gCO//z4JwS1pyhBA9FqWY/g+7WqM7Z6UQAOOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAYfwnR9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D00C4AF19;
	Tue, 30 Apr 2024 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714478072;
	bh=IapLrD/jogJqlTH0kGzdqSYfKtIIUt9wn2mvkUe0d0k=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=kAYfwnR98InXLzwlWJqhJA+JJwOhNTOxNuHCOr4RLbp9x8NKXnlALo/tp99txLx5D
	 A6L77Zd/oAV1I+ZP3rWVoFgPC7SrlJNbLS9BwUzJb9J8Pow4CpbGZ2tEbComEoLqak
	 cis1JMW3l5PHjwsqJbWZnJju62BIOR48k+31tZhtFG7TKgdAx4OMKRHVDXPuCUlS8J
	 lcRNkrbkXpZaPhiOuTIPh1CA6lqP383MVfvUdxwGj4wISR6qmPChKtUPMlE+qUNU0U
	 ClQsCpxIooroqgx27cmxLAR8VjL8181Zxg8IuTivqPkJHmWwJWhsHkr6QI3Zekz59q
	 MCzjOH19AN24Q==
Date: Tue, 30 Apr 2024 13:54:23 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy
 Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Dan Carpenter <dan.carpenter@linaro.org>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Herbert
 Xu <herbert@gondor.apana.org.au>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, Rob
 Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v7 0/9] Turris Omnia MCU driver
Message-ID: <20240430135423.2034fb51@dellmb>
In-Reply-To: <875xw45cgj.fsf@BLaptop.bootlin.com>
References: <20240424173809.7214-1-kabel@kernel.org>
	<875xw45cgj.fsf@BLaptop.bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Apr 2024 18:13:32 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Hello all,
>
...
> 
> It is still early as there are some comment pending but I wonder who
> will responsible of merging all theses patches ?
> 
> Arnd ? Hans ? Ilpo ? me ?

I am assigning these patches to Arnd on patchwork all this time, so I
guess it could be him, unless he has a problem with this?

I've just sent v8.

Marek


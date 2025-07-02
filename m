Return-Path: <linux-gpio+bounces-22649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9EAF5D46
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 17:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019704E1C0F
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7E82E03F3;
	Wed,  2 Jul 2025 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQjZ8wsg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272BE1C84CD;
	Wed,  2 Jul 2025 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470207; cv=none; b=UKVTbkJfSQzB03O6R5W2EY2h0D9luzHgbG+lszrKXhgzSVdQERx74BA9lD1JEPlsb/0xdsbjClHBGl18d3PrV8XuOGieLEzMOIuyG+dskPd6iKZaC2FV8yj0tVVdtyR5EEspzWiRWCCpP7+QUMTRM4TFeXbBbA/AIsWuIzkFd8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470207; c=relaxed/simple;
	bh=1hB7Zt6/rC5KgiBrbFJS8tkSgdS8qaxfYi4Ore/zPkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efAUTadAEuvpvRJzvVwS+uUKfvtbqoEohx0IWQfLx3gIyR+ooCSyglbDUcvCHoSuMt0W+Qd1sTDfGHe4bDNIzgU4vLjKTupw9T02JjbmNXgZ2i3tUehRl+FkcqGC4ZXXLADxG+0TPnZSx+fZ+Zt5kFlGCikHf95x10fHLAzz2qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQjZ8wsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416F6C4CEE7;
	Wed,  2 Jul 2025 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751470206;
	bh=1hB7Zt6/rC5KgiBrbFJS8tkSgdS8qaxfYi4Ore/zPkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQjZ8wsg7xexe1fb1H5E/QPkW4Oxb32rgzlfDzw5je0/rgRzrjasgqXZdKqMUFOht
	 UhhSnbaPqc+MP65Uul8jywX2R3iIQacDKEt25Pyz34N7pV48pwLn88EJjv+WopyVMm
	 CUC1gRcp1+Bz5qP7Dt2MUbc+G1X8nIjrpo45uKIHMy0iEkszX3GlJdBVayxBejpR1v
	 mVeNzBsX3mssaa2J2UY1jfWIJf8sbzhA55FNRg3+xn8kUziMHacbNEkEYPk+2ormEK
	 phkd2yhtTkXB5DIEfJk9AuVhVuplk4e8vwsroDkuAdUkXg0lp1zWXpOA5cCQ1GtZLF
	 hkwfap89cvlfg==
Date: Wed, 2 Jul 2025 16:30:01 +0100
From: Lee Jones <lee@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/7] mfd: tps6594: Add TI TPS652G1 support
Message-ID: <20250702153001.GV10134@google.com>
References: <20250613114518.1772109-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613114518.1772109-1-mwalle@kernel.org>

On Fri, 13 Jun 2025, Michael Walle wrote:

> Add support for the TI TPS652G1 PMIC which is a stripped down
> version of the TPS65224. Support for the latter has already been
> merged. Refactor the regulator driver to ease adding new devices.
> After doing that adding the TPS652G1 variant is really straight
> forward. Some care has to be taken by the interrupt handling (of the
> regulator part) because there interrupts are used for voltage
> monitoring which this variant doesn't have.
> 
> Michael Walle (7):
>   mfd: tps6594: Add TI TPS652G1 support
>   misc: tps6594-pfsm: Add TI TPS652G1 PMIC PFSM
>   pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC pinctrl and GPIO
>   regulator: tps6594-regulator: remove interrupt_count
>   regulator: tps6594-regulator: remove hardcoded buck config
>   regulator: tps6594-regulator: refactor variant descriptions
>   regulator: tps6594-regulator: Add TI TPS652G1 PMIC regulators
> 
>  drivers/mfd/tps6594-core.c            |  88 ++++++++++-
>  drivers/mfd/tps6594-i2c.c             |  10 +-
>  drivers/mfd/tps6594-spi.c             |  10 +-
>  drivers/misc/tps6594-pfsm.c           |  31 ++--
>  drivers/pinctrl/pinctrl-tps6594.c     |  35 ++++
>  drivers/regulator/tps6594-regulator.c | 219 +++++++++++++++-----------
>  include/linux/mfd/tps6594.h           |   1 +
>  7 files changed, 284 insertions(+), 110 deletions(-)

Doesn't apply.

Please rebase onto v6.16-rc1.

-- 
Lee Jones [李琼斯]


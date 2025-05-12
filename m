Return-Path: <linux-gpio+bounces-19999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D693FAB467B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83C91883695
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E0E29AB0A;
	Mon, 12 May 2025 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="tJ1KlA7l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91371D6DBF;
	Mon, 12 May 2025 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085473; cv=none; b=Gt02ehyjqn25oHdG7ROUqzqtLrBYdVr337lZ2j47Nj/NnQ7CBjkYLSHlOCk/JnAZ0ol2evawj0JSbr7kEyzvxhW2lp2L9hL2GRz+hJbI+6BXyq03dchmQgLMcqM945i9hqb1TJd4b2roa5SxMhRuClTSHNIVDj04xYnFAXuvwPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085473; c=relaxed/simple;
	bh=vuD8PSpbjK/RFewkSXNCz5nSf32NkTU2cDE8QsRA8xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJG6PHWnHzs5Z7ZtKUrGDuJ8pMu4ZzoEnflswJO4gYJ0ub6V2Dkq9fvACMqhUfAfnYChSus2xvyzcOAa/8Aw1eMkWtOjq4U/fb9OhSO8I0FdcwOX6lZpSag8LGGeCY21fVgVVG3VTonuPSgA4tyJF1F0IoW03qMAw6LCuYxrTYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=tJ1KlA7l; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mMmumDHJrQrC3ojVWsvTiwHp063FSyjVswid4qSVvjE=; b=tJ1KlA7lz0Bu6y5PGQfM0nW+ih
	Twa2ujZa8sqK/4HmiRRt1sdKHD0eZJfRSiUtwSICmlI4FCwKUjJcXi88swqHDTB0mtVYIoXkjZ3FR
	VHfAinUYi7NMz81oWJBTVU8Zn4jh2mqZl2YfniE8P07H7pPBYWg/vcjMi8xBpwBz42AI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEajr-00CNss-MG; Mon, 12 May 2025 23:31:07 +0200
Date: Mon, 12 May 2025 23:31:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 4/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get()
Message-ID: <e0abbcc5-1ebf-4864-a7e6-6cbcc139b978@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-4-d470fb1116a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-4-d470fb1116a5@gmail.com>

On Mon, May 12, 2025 at 04:22:40PM +0200, Gabor Juhos wrote:
> The regmap_read() function can fail, so propagate its error up to
> the stack instead of silently ignoring that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


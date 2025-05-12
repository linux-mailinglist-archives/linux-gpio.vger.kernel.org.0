Return-Path: <linux-gpio+bounces-20001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED12AB467F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBC40189D769
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64F029ACD6;
	Mon, 12 May 2025 21:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="WoxZ6F8f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3682299AA4;
	Mon, 12 May 2025 21:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085517; cv=none; b=NLyY9QGqKaukfjDpih4/3CFmWrYxMMznl4XKRE+7uwWuvYMdQS5x5Mjzk7y0evtg9fthywdr4VxZ6vAIIbvYf2nFGd58J7UQsRaL56GjRTXAK1EreD/tcAdvP74k4kH90NBLtH9EU181S6bNKCAY8gyeeP0M22ptZ2J4eA/VdpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085517; c=relaxed/simple;
	bh=SMRcItGbn2Yzpf0iGFnjtxiQ2KyqlgWhBMpjrduxMkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dde+G7RR0JItCg2FPjPo3BjAy63QR9iiC5iSZ3U8NKtNz/cLhO8/mc+wao8AdDvGV7nDEIRbWKvc/KJd3YDIuRHtUFBUVP0bHbIw4Ubmjy9pdxG9xOg69Eq2Qoq5AUT76m/DBFuudB0ntg0HqPkmfqlAhbUaWzoxrrsJzlvfCww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=WoxZ6F8f; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qJD3G1v8djv/XvZ5jb2IlZ2ijtfQheho94GC5N3EbLU=; b=WoxZ6F8fHKBW6J7DMjriamMW0n
	uSJmTpMdXB6heFOReFbF7VA9NiUV+9Zd2jzFg98uSc1Ggbe+c1PYrKNgK3ZYU1pc2goOHfWZKUMOz
	88ESZGZ97UBgGSZauhIX/PgqdpW6ZKfwTL+Wt/fDcLfyXGsU8InA40wvvtyZdnB7jYsI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEaka-00CNtp-Qx; Mon, 12 May 2025 23:31:52 +0200
Date: Mon, 12 May 2025 23:31:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 6/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get_direction()
Message-ID: <9fc2d6fa-5e16-41aa-b996-a9933473640c@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-6-d470fb1116a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-6-d470fb1116a5@gmail.com>

On Mon, May 12, 2025 at 04:22:42PM +0200, Gabor Juhos wrote:
> The regmap_read() function can fail, so propagate its error up to
> the stack instead of silently ignoring that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


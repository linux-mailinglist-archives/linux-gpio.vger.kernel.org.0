Return-Path: <linux-gpio+bounces-19987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81CAB4643
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F2CE464300
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DE529B8CB;
	Mon, 12 May 2025 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="AJmpw6js"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9CD29B8C2;
	Mon, 12 May 2025 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085360; cv=none; b=ILxbcx4cQ6IuTXuofHIyIGeL21GvycVE2F2MuESZLTx3Ik849pDjrtsXPUNxgOIc5gTCqQo0K2gI0MA0PYHyNC8x6UCT7iGT1OV8ZUPpmLMPEkt8GuWeCSQRcb74AmACBhsg7QDYRst+8biOrd3uxfBjAvE8K+PTY165XWYK3cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085360; c=relaxed/simple;
	bh=6jrw8zHCz1r1/7CMpB8k4WhjdJjmPFhTyt0LDMniKSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9+qYmFou2G3P1PQz40eeXVnDu+dLQ0aHl/4iNi2RM06AbC5PtoXxqgaReYGDqjUKt+bLSxy36xKJRzfdROGx6CWWxQY42rlq2Vbm3vx9ghu8eZsnNKCrBKgFTpFAjRjnWjfN9Q8SxMdbYsEpRTM3Vrl0Xy0JYssyuNoCl5wm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=AJmpw6js; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x5XbTPT9ktX1zk54qFhJAtK3gzja6m/tnN4R9IXWUSY=; b=AJmpw6jsmkNJM33wxWXjUp3mgx
	9lCtZyKYbsGIB04QB50S1SNKwLQ6m832AoDiOWi+By6LBJaFPbm7xgbFQJdNiT8YjHZ6uNR6TZnJ0
	Z+j0fv2S1Y7A2RzRJC2lOwoqikTSnDyjvzPVw5vx/CO3hmx5x5EPezzgnla/Ck80MO4k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEai2-00CNrX-PA; Mon, 12 May 2025 23:29:14 +0200
Date: Mon, 12 May 2025 23:29:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 2/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_direction_output()
Message-ID: <8945ab39-cca2-46e5-821a-df24bb6d9218@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-2-d470fb1116a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-2-d470fb1116a5@gmail.com>

On Mon, May 12, 2025 at 04:22:38PM +0200, Gabor Juhos wrote:
> The regmap_update_bits() function can fail, so propagate its error
> up to the stack instead of silently ignoring that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


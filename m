Return-Path: <linux-gpio+bounces-19976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7EAB4616
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C673A16E37C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD5629995B;
	Mon, 12 May 2025 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vOSg6E9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3305475E;
	Mon, 12 May 2025 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085316; cv=none; b=prZBkDyxcIrMp6kSDMtQmx7tGZk4t6hQRqLDj5CZbZQO385s+mLxfa4vmBzHwkoSWk6GWPsNKI9kLwMw3s+OzQu1douncIrUVa2lrE7zieoV4TVhYr3/1sB68jEpQ43zltBMwA0UMCtPnYXwvsPheGEfUD/nWZCRLYEq9lE9TnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085316; c=relaxed/simple;
	bh=tWxwEuhtSFJyCtZQ2QKs3oiKC16cbq70BmCdogS+GAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYC5PcBREnwQHHaySkc8pQjKZncplJHeoc4/OGB1mHQ9H/TwxXpEefSGELDlqwrY0VeAdWHBJv/s3UTxn+TzzmVnIk7XLa2EeGjM0gLsvJJRL2tiUIVBPmm6Egq7bhnF1/G7GgXq8ckG/i1m6Q5f3oqgtrjeKUWW2j3cW/AM9bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vOSg6E9h; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AfQpXa3tBlUEYjokNIxHFziqeEJgVAZbUffZzLdfAGE=; b=vOSg6E9hchsbTwy4bBgAN2i9am
	RY+v8KoYMRNADVKOAGMzuZ9rejgNNyeCrYc99dHyX0+xDAWrGAY73O0jlz6QfxLektakpmcsKsE+3
	Km3Jdlx7BihLma0y1eCeL4Wyh8fgYvm5LfGSnJ4k24DM4zi/x7O02cxiMYFh9I4mEe3k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEahF-00CNqq-On; Mon, 12 May 2025 23:28:25 +0200
Date: Mon, 12 May 2025 23:28:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 1/7] pinctrl: armada-37xx: use correct OUTPUT_VAL
 register for GPIOs > 31
Message-ID: <d5fa1e79-8204-464c-b12d-de8e59411146@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-1-d470fb1116a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-1-d470fb1116a5@gmail.com>

On Mon, May 12, 2025 at 04:22:37PM +0200, Gabor Juhos wrote:
> The controller has two consecutive OUTPUT_VAL registers and both
> holds output value for 32 GPIOs. Due to a missing adjustment, the
> current code always uses the first register while setting the
> output value whereas it should use the second one for GPIOs > 31.
> 
> Add the missing armada_37xx_update_reg() call to adjust the register
> according to the 'offset' parameter of the function to fix the issue.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


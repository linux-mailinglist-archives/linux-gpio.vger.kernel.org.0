Return-Path: <linux-gpio+bounces-18481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A23A804E2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 632D3426BD2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 12:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C7726B0AB;
	Tue,  8 Apr 2025 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xp3rEe4O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD7526A0C4;
	Tue,  8 Apr 2025 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113832; cv=none; b=DU5cDNyphQ3QOUHp2u/9UvEy0rUMcfrRxGn0HQqfCOyv61eINI5JTvpmEj6qIhJN5uwXtfYrpIytpmAMi1crvJJxNB8gzuNqN9Jq4uz1GviArQEXdyHIwCUJgE2rOpSc5yB7EzLonB8Y8Dj9eQeSBBi1B6VwKdkPYFYOmioUL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113832; c=relaxed/simple;
	bh=Z1zT87rBvOEKv8KpVFrOLezCUVQJmrwqKuYJdNPLvJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDhc01/tizTXXuk4OC0mxPUqyCU/OLj5Bef0btb7ReiF8EE8zq78K6MKKygft8E+bnByzoWgHHqsIrmFsaXX7R5DuHzMq2Bumb8LRnfn+jXY5JX38BsBlWgzYxsfCXwpxH61wGVe1lzLItLiC/w5vDzpZAUHwPM/q/0q6Du0q2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xp3rEe4O; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LlVgctfX+fhu7Ib5YWK8ZN9s/oLxJyWlWfXhN5vl21c=; b=xp3rEe4OAMtpT/KFJAYQctPQ1D
	0JuSKozJAeNGubaAqkfXXELpDviUSc3+LwZ97x2zBuKPzGsAq385mydRfFluG4AIxWKhh2UuW1P6L
	hRWz4qD9le2NWlmPinju6kNp+VoaAV2mZg70T9rfq5Fk/r7iIWkVD6VFbuSh9DN4NyHI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u27g1-008NlV-Tw; Tue, 08 Apr 2025 14:03:37 +0200
Date: Tue, 8 Apr 2025 14:03:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/4] ARM: orion/gpio: use new line value setter callbacks
Message-ID: <b032eea6-96c9-4511-8085-da9f5655c252@lunn.ch>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
 <20250407-gpiochip-set-rv-arm-v1-1-9e4a914c7fd4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-1-9e4a914c7fd4@linaro.org>

On Mon, Apr 07, 2025 at 09:09:18AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

What is you intended merge path for these? Have arm-soc take them as a
whole?

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


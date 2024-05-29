Return-Path: <linux-gpio+bounces-6829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BEE8D35ED
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24CD6B23C8E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280B3180A7B;
	Wed, 29 May 2024 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EOuuUoyw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB8180A65;
	Wed, 29 May 2024 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716984182; cv=none; b=iFNNZ43yklzIbWcII43TEx0dYErtrvyrxouVHaKEwOZQtj8edxgGu6eWrDWdnxzP2AnMDSpyNuSSazfMNBKLfnztDKQ4AGGYJOZyMa6Z4xCTOghV10T8Ow89+b5xYliBZZdzrfpePlio1pKBEf0/99pSQCkgRdRU0+ggwDsuLsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716984182; c=relaxed/simple;
	bh=FyoOjqny/xJPD7HNo4I46mJ3CF4D4Z73lT1Hsa1X+ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTusjQ8336xCF4gPT4aVgM2GMzfXPLtqMaYj8srnbi4X9X3hqLT/sBnWZRonGkBALVBHm0N5QFWt0MwwrFhlzYvQ3WxR5XBCKlARa4BzM1AsTrZjc2r+3IRQXAym+t4CqKcFw8DnRq3yp5nx7cg8GPJbLCqXkPhTyQYrTXWj1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EOuuUoyw; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=n/x1Z37OezN75w7C6JPLJkcKz+QLusQSg8hGqUj0csw=; b=EOuuUoywca/LZrvrzety5nLa5w
	FfzOOfEin02XTV0tOaJoVW7TrBvI9bT41+QcznCl43OzfUK+wAC7IZV96bZsL7g9h3gPNrFuvUTiC
	4jgpxuFP+yYsl6jUSGeb6AouVGUTolpH0TWXn1L7XwXot3riyEfEasPYirRg5IZ9FRhs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCI19-00GFZD-Fk; Wed, 29 May 2024 14:02:55 +0200
Date: Wed, 29 May 2024 14:02:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/8] gpio: tqmx86: introduce shadow register for GPIO
 output value
Message-ID: <5d45ed61-e1f0-4898-b094-24785843dc8d@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <3fe75a419cd3a4628315e3457703581304cfc9b8.1716967982.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe75a419cd3a4628315e3457703581304cfc9b8.1716967982.git.matthias.schiffer@ew.tq-group.com>

On Wed, May 29, 2024 at 09:45:14AM +0200, Matthias Schiffer wrote:
> The TQMx86 GPIO controller uses the same register address for input and
> output data. Reading the register will always return current inputs
> rather than the previously set outputs (regardless of the current
> direction setting). Therefore, using a RMW pattern does not make sense
> when setting output values. Instead, the previously set output register
> value needs to be stored as a shadow register.
> 
> As there is no reliable way to get the current output values from the
> hardware, also initialize all channels to 0, to ensure that stored and
> actual output values match. This should usually not have any effect in
> practise, as the TQMx86 UEFI sets all outputs to 0 during boot.
> 
> Also prepare for extension of the driver to more than 8 GPIOs by using
> DECLARE_BITMAP.
> 
> Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


Return-Path: <linux-gpio+bounces-25258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 020F1B3D3EB
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 16:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C2571895100
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 14:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AEE25A34D;
	Sun, 31 Aug 2025 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="J4+35Cvv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73151DF24F;
	Sun, 31 Aug 2025 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756651292; cv=none; b=UR3v35rOTT6VbqjdQTnJMkYIhutA+jeJwRYnwH1SKgeWy5shrBBH/sQ+rR86E4fp8It1wQ66VQregIl5qqoIOw+JXVLkO4rUuJlqjXTdIEEm5km+kmdV2lSYkJN2vUcFsUCxOMjuJV0gjNn5kGQB3rUWIzd/2b1NfLqCctuzKqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756651292; c=relaxed/simple;
	bh=bvFAVGs/OakVMpYvdYL16ed7cN0RWaNDGI1k9EAuDpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMeiJyPKb6zagrFYbeYcPthn083jPCbD0PUWEaTnKGMw30n3Os3gsq66Jp2oFLgG9qh1i8Rj4twMMTU48d0FP7FJEk0Yg7V/b7pGEfAUGCj8u+W/63gmhobHCbRztjKOj+UyTXD3YJFtuZP4WFgZd5fbA8JJs6vqnmzTX/uvwG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=J4+35Cvv; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1yA5JPGmM9+DIovHFNOYfqsmTWKkkgyERhyC5rBngGI=; b=J4+35CvvDsKQ/kpNwfXcCm65GQ
	rXJLTHlYgXGoL76HF60A5gT1N1DEllJg4LEeY4poc2aDrrSYcXeG7ROhzylm0vhj0SgbxdJnGBkWp
	G133F7bu7ZkfIkLtj0i/UAKgC7eBpnuyUPQCf1K3hS7Js+IpPQGdn1ueLxX3R5eC5Yt0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1usjF7-006eZw-E6; Sun, 31 Aug 2025 16:41:17 +0200
Date: Sun, 31 Aug 2025 16:41:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] pinctrl: armada-37xx: Use int type to store negative
 error codes
Message-ID: <272eb94c-0d19-47ee-868b-94d07a692877@lunn.ch>
References: <20250831084958.431913-1-rongqianfeng@vivo.com>
 <20250831084958.431913-2-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831084958.431913-2-rongqianfeng@vivo.com>

On Sun, Aug 31, 2025 at 04:49:56PM +0800, Qianfeng Rong wrote:
> In armada_37xx_gpio_direction_output(), the 'ret' variable might store
> the negative error codes returned by regmap_update_bits(), and in
> armada_37xx_edge_both_irq_swap_pol(), the 'ret' variable directly
> stores -1, so the type of the 'ret' variable needs to be changed to
> int in both cases.
> 
> No effect on runtime.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


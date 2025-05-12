Return-Path: <linux-gpio+bounces-20000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A76AB467C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3553A7AE430
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5915329A309;
	Mon, 12 May 2025 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="O2dxoUg+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4C4299AA4;
	Mon, 12 May 2025 21:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085503; cv=none; b=hcjTymtSHP5LWCwCN1N2CaLohQE8eUxZsTRK0D0tqfO72Lg0gGXDyphdNs6mUQOhIvb4Cdu7SZVmIJSRH5btrxlZ6q3fxmgEyq0JTm1ZktcuFeQDWt3WmmfvPQzKgRKEMggKhenYMOTYCueq8C4fiqtXJZqlzf9+IqD025efZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085503; c=relaxed/simple;
	bh=U+MD5IiZXjjFEHNcHsIdKSiQKMk5/+cTdMtpahXaMLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDat5bpfUxhrP/fZEYK5D/ujvLg+rAkH2IJuaHhHB5SUqlYVw1PHygY3zDBxxIz40H13x23ac0ls9ZZl5uldfOq3hlfTPhB09cbyKHU3ljm9piGoOZflRR+0yXEg7UMzVM31dJTwqNQS5GGXVKuNpN3eQYWDt6/gIVLkU6rr32w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=O2dxoUg+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dLTkO1eok+IdR9aSFtzVKMWKvmBCW+NKv9rkG+TdCCs=; b=O2dxoUg+nNDsR6QFj4py2n3hbm
	WrjOGCuxqKVTWFuhYuia8NMWQ9IoYJLLfL34E5UCU/fbY2whnXgBLTn36dJAxvW6+ns133cRy4RiP
	nxtxpCpueFXW9UCa+og15IBkZ6Qxm+GzX6nYwkHoGtpWX7BRBGJWfxfk6oX+ivx5rQJU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEakM-00CNtN-Fu; Mon, 12 May 2025 23:31:38 +0200
Date: Mon, 12 May 2025 23:31:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 5/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_gpio_set_direction()'
Message-ID: <742e1ba4-a066-4dab-b201-05d0467553ca@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-5-d470fb1116a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-5-d470fb1116a5@gmail.com>

On Mon, May 12, 2025 at 04:22:41PM +0200, Gabor Juhos wrote:
> The armada_37xx_gpio_direction_{in,out}put() functions can fail, so
> propagate their error values back to the stack instead of silently
> ignoring those.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


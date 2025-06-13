Return-Path: <linux-gpio+bounces-21553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47324AD8FC3
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 16:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCA543B250B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 14:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D132199385;
	Fri, 13 Jun 2025 14:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5+6qd3P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8730191493;
	Fri, 13 Jun 2025 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825621; cv=none; b=exc1C6IZOuIZqc5lIkU6eigtSy6Qd0KTAVOsCRF19WehPfcD2iGepLyCaL1/CLTRmKp/J+twDZb5X8RXqtcDpG/f2bqBciKl6/fiXCLwoVpJp+v/toIMckZRTxbgkXOl7UV+4+j+5fZiHWGjcpiNddAr4C12z8cSlHz82M8Tg7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825621; c=relaxed/simple;
	bh=ITZFyS21U+zCOStvhgK2RHhgm5QwQidWMeeety/ts8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gt8Kn9STA1Liqu6bJ68OsL59rDT9oGV0ES1bFxXXD5CYcRPwuxWR3YoKJVgxYB1LqSmMlyH5j1f3Z3yoUS+VsJ1IxRaC+0tCBnfhX3ZLi2qhc+n74V4GX5wKMEKdStjUrJxSGWflpA/JG4xx8ZfvpboNwkORtp3RXhr4RXAMJg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5+6qd3P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F4BC4CEE3;
	Fri, 13 Jun 2025 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825620;
	bh=ITZFyS21U+zCOStvhgK2RHhgm5QwQidWMeeety/ts8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5+6qd3P1WztJuri2EhMxUbC311PrDjV6+k7vmYn5h9vsxp9hWZmJ3UByPxlb6DIx
	 rheKtGV6B0v7/rTXW1cEwu2QwD0ggEKqEje7dGOcyg/chHtMvq0rRhoaljeztbANlz
	 LGocFuU0OX5ovZ9PJ20vb4mbdA71niDR2s4I6RonOo9tVOClMTh8k3LYSLbqPIkQ2p
	 /4Smqm/74Jc73703K3dngeLNzy9mTCQ2c8ClYWV9wuGZ9+g0MdOZf6PuVnnYbdzWt6
	 o6JnIrM0lkPjg27vCTy5W1Cmx3M6Xe6eu2fEKnD7WElgytQV/Gp1gTvR+DUd1EhXMV
	 s3SA2Iysdr5PQ==
Date: Fri, 13 Jun 2025 16:40:11 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 03/12] gpio: moxtet: use new GPIO line value setter
 callbacks
Message-ID: <lekcp6p4s5hbkrul2aq4ukmc722qajitvpxs7mtrqg5nlmfxd5@b5c7zzh2lb5u>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>

On Tue, Jun 10, 2025 at 02:33:13PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Marek Behún <kabel@kernel.org>


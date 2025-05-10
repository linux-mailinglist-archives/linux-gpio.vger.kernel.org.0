Return-Path: <linux-gpio+bounces-19889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E1AB24F6
	for <lists+linux-gpio@lfdr.de>; Sat, 10 May 2025 20:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E916B9E26E3
	for <lists+linux-gpio@lfdr.de>; Sat, 10 May 2025 18:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934862777F9;
	Sat, 10 May 2025 18:31:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC927603B
	for <linux-gpio@vger.kernel.org>; Sat, 10 May 2025 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901861; cv=none; b=iHhn3e12MpMzpfqK1AMOnX+olHKsTjP5meAJ5hs3jCdaELR7lKTGrUFwqDQJPps7QwBL9uSFHMl5BAp+hPm2YU9ry+XaYW5jDPYPjDyCPdiOAhHoOtLVQQc6p8RJBxBsWXIjayXy7O+DifXrn6xvCfAxphgdtFc7dDi9+DV2FIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901861; c=relaxed/simple;
	bh=kw8sFH6NcIVRkErPKGz/8/FmW8EHGa9/rfc4gc5NJoE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNLZ9L2pRb/CXKkY+hecfhmNiRHYcLL2bCUznfiNIzj0OCJgc0UjkCooJ22+CfxcnpYnt/Yk9tdFNzOodBRMpm1Zrxx7qEAKhL1lCHv6B8oUZwR6GhsjfeBD0NwK455lAX3RziUscprzPDU4eNGjznLzxNMWq2evcP80aXnPTUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id e8fa2954-2dcc-11f0-96ba-005056bdd08f;
	Sat, 10 May 2025 21:30:56 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 May 2025 21:30:55 +0300
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v1 1/1] pinctrl: at91: Fix possible out-of-boundary access
Message-ID: <aB-bX57Y88TmYyas@surfacebook.localdomain>
References: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>

Thu, May 08, 2025 at 11:08:07PM +0300, Andy Shevchenko kirjoitti:
> at91_gpio_probe() doesn't check that given OF alias is not available or
> something went wrong when trying to get it. This might have consequences
> when accessing gpio_chips array with that value as an index. Note, that
> BUG() can be compiled out and hence won't actually perform the required
> checks.

Also
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202505052343.UHF1Zo93-lkp@intel.com/

> Fixes: 6732ae5cb47c ("ARM: at91: add pinctrl support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




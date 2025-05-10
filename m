Return-Path: <linux-gpio+bounces-19888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E6FAB24F5
	for <lists+linux-gpio@lfdr.de>; Sat, 10 May 2025 20:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE9159E2721
	for <lists+linux-gpio@lfdr.de>; Sat, 10 May 2025 18:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3D922F392;
	Sat, 10 May 2025 18:30:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017A3275865
	for <linux-gpio@vger.kernel.org>; Sat, 10 May 2025 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901827; cv=none; b=s3OUmvmy06VkKtpKvJylU0Mdq+Usx4sA1aWijndDWKWDY/Pc7/TWPoAy0QFJ3ubdyHtNSDVzJC6GYkt08l+dqmRkzJrRSLl9PHrE8PnvRZQB+YaxlvNH7tPC83E7C58TJY+Q4nxroupSqI8aHQstYPpUAIE0AxifxLc4Oo2jER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901827; c=relaxed/simple;
	bh=sn/Bk+ioxgpnfSbChJ29su52n768bR6tck/4LkDDLv4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMBjGZlZCquMZVDPRVJqj8eVip6k11p6vI24pOpcLjRnVnZO2dzx7Mul0yUY5VjuTRYkka039Wg0VVX03t6eyywe7wzFaoAerea9HvxVfwv0rxn8RmkbTCWXultPjKCMVv1wvtho1Afa3Py5dyA+hsYveRkPbAjO7IpaZGZb6TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id ad2ab1b7-2dcc-11f0-96ba-005056bdd08f;
	Sat, 10 May 2025 21:29:15 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 May 2025 21:29:14 +0300
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
Message-ID: <aB-a-tH6AGUfBZVB@surfacebook.localdomain>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>

Fri, May 09, 2025 at 12:45:31PM +0800, Peng Fan (OSS) kirjoitti:
> This might be a bit late to post this patchset, since it is almost rc6,
> but no rush here. Not expect this patchset be in 6.16.

Why not? These are mostly trivial ones and they fix the warning, they may
potentially be the fixes between -rc1 and -rc2,

> This is an effort to make irq_chip immutable to elimnate the kernel
> warning "not an immutable chip, please consider fixing!"

> The major changes 
> - add "gpiochip_disable_irq(gc, hwirq)" to end of mask hook
> - add "gpiochip_enable_irq(gc, hwirq)" to start of unmask hook
> - add IMMUTABLE flag
> - add GPIOCHIP_IRQ_RESOURCE_HELPERS

No need to list the implementation details of IMMUTABLE flag. Just a summary
line is enough.

> For davinci, two patches are made, 1st is to update irq chip data, 2nd
> make irq_chip immutable.
> For xgene-sb, two functions are added, because previous driver directly
> use irq_chip_unmask_parent and irq_chip_mask_parent.
> 
> In some patches, I use irqd_to_hwirq(d) to get hwirq; in others, I
> direclty use d->hwirq to align with previous code.
> 
> Some Kconfig entries do not select GPILIB_IRQCHIP, but I tried
> to build pxa_defconfig lpc18xx_defconfig and multi_v7_defconfig,
> GPIOLIB_IRQCHIP is y.
> Not sure we should select GPIOLIB_IRQCHIP for them, because if
> deselect GPIOLIB_IRQCHIP, there will be build failure.

-- 
With Best Regards,
Andy Shevchenko




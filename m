Return-Path: <linux-gpio+bounces-21831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82063ADFC01
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 05:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C1D13A46BB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 03:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EBB239E95;
	Thu, 19 Jun 2025 03:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="K6uNNIZ0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C85288A8;
	Thu, 19 Jun 2025 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305169; cv=none; b=a7bMyCeX/rs8dCCmGcMSBmuoU30ccJRgGrduPJ2hD8oJfQOy1DpZCQysM57T2GdZUjUgY3ZiyE/5WlR0RrMxqaMf4frEboEmsUHmiksKyo6eyle15lqFmdsqAi8ZOtx0VceDaUfFIPfBv7GZsxtQIPB5sxfHRj56bsl42QfYvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305169; c=relaxed/simple;
	bh=NydPpa35rXGs0G2PDqRqkVfYKr6/UHoJ3LE3lvB+h4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDALXcyJgmR+mLUmTuBAVZbk9fnh80AtKJVzZja/C4Am6XeHqa1nEmJSEGEicG7KDiHvG8SOwn5qFTTYcR1A+qnAiZWEH5CBGsSA0nqLJpx2TkDljlj1KkkTmQFWRxS0rCdGz7rokdT23/bkOLcW1h0csFEi1vKgdAfZY1LGkTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=K6uNNIZ0; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ra31PvflUj2/dfEest80/0xB0KpZjPPOVZSt5vtRaHE=;
	b=K6uNNIZ0comjpOJ1tCTnKTR7Jt7JYL74HgnaSOjmMRoGI58BjJjl4oVpVCQzXa
	YlkGZ92Q018P2lUqr63fOiX0oTrYwDxCEXwrEOcTf6tbu1g0SogUJ+6Sak5GKitW
	VyMNnierDphjCFyXHmq46OjnHqKJQNL//Eo4B9zvp5IvE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD31+1LiVNoPnL8AA--.63076S3;
	Thu, 19 Jun 2025 11:51:41 +0800 (CST)
Date: Thu, 19 Jun 2025 11:51:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	peng.fan@nxp.com, wahrenst@gmx.net, conor@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
Message-ID: <aFOJSz10KoTzQ+01@dragon>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
X-CM-TRANSID:Ms8vCgD31+1LiVNoPnL8AA--.63076S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUo1v3UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwJxZWhTQrn41gAAsz

On Tue, May 20, 2025 at 11:46:13AM +0800, Haibo Chen wrote:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"),
> the vf610 GPIO driver no longer uses the static number 32 for
> gc->ngpio. This allows users to configure the number of GPIOs
> per port.
> 
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied, thanks!



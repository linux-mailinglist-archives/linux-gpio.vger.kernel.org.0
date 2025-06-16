Return-Path: <linux-gpio+bounces-21666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0960ADB3F9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 16:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C90D8188E4B5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 14:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC901C2324;
	Mon, 16 Jun 2025 14:31:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8EC1F91E3
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084311; cv=none; b=HAlzzWZS4u7SyCDx37sbevD82udx7USu3m/WUAshvJfU6UYh8wEHOtuykPFqU2gqrshfHxY3Q1iWiSavX3jVw0MK5RuWsJeyhQ/jy7+Tbfc85PdDTUuy652kRJTiGdB+fBHu9Apa9wYCRAdN+e6O3WFHy8nZo6/Ov8H9ngB8WO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084311; c=relaxed/simple;
	bh=sP5m0kuPKiS/WCBtatxWYXmjGlGqfu0bIYTcLzutOvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjge4iF1O6NrWUorRJ7Ke8UlSAl/jrRShyQR46uRmmy1G+TtjcIJOFCbs2nKHbNuLfSYgRqA0kU/9ebYQ8rc+e/6LhImv/2bvSkOE9TbjZC843zddwd+Hez4D+osMzQuqnjfN2DDNMqtw0E8Zx3Jm+nEVSa0SvS0mNcrmVR3PNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uRAsE-0003e3-SA; Mon, 16 Jun 2025 16:31:46 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uRAsE-003p3H-1h;
	Mon, 16 Jun 2025 16:31:46 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uRAsE-00H5ur-1H;
	Mon, 16 Jun 2025 16:31:46 +0200
Date: Mon, 16 Jun 2025 16:31:46 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: fix wrong error probe return value
Message-ID: <aFAq0il8HFQNFyWk@pengutronix.de>
References: <20250616134503.1201138-1-s.hauer@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616134503.1201138-1-s.hauer@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Mon, Jun 16, 2025 at 03:45:03PM +0200, Sascha Hauer wrote:
> The second argument to dev_err_probe() is the error value. Pass the
> return value of devm_request_threaded_irq() there instead of the irq
> number.
>

Fixes: c47f7ff0fe61 ("gpio: pca953x: Utilise dev_err_probe() where it makes sense")

Sascha

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index b852e49976294..e80a96f397885 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -974,7 +974,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
>  					IRQF_ONESHOT | IRQF_SHARED, dev_name(dev),
>  					chip);
>  	if (ret)
> -		return dev_err_probe(dev, client->irq, "failed to request irq\n");
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
>  
>  	return 0;
>  }
> -- 
> 2.39.5
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


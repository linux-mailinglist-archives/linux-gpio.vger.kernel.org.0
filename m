Return-Path: <linux-gpio+bounces-3340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFDD855EB0
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 11:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F8321C21551
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 10:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F3F69979;
	Thu, 15 Feb 2024 10:03:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B967C5C
	for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707991414; cv=none; b=hbMmo2SCnl0NLV2gI1obk8yo5C1tMfuwE5fgdSTYz2mQZTddnAS0Pw6nvWCBZT0/U+PUYyV155YwGRw9OM5styuG+xj9w0BnqK1WGrPRZPJEC2UA81Mi/XD1opJfvdQnclqrSof+bzKRUJJV7ZiupqNR5+ylgJrwUW3/uD76818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707991414; c=relaxed/simple;
	bh=Ve+pubFl36SuRCGH2rkW001StUMBkU3PFQCpivTVbiQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JY5AMERNkhVa7vdsAtSaOSQr8T+mJYi+UF7ZPlhLzSHh11as4/N9g2ZvwnWomUj0M2dtV8Ue05GXtVCmRHTQnsGNJROX1f1hEKz1IBwINbZeEPjqTH7h0QTd8sI0S+a1HVV9Dk9l5GxNnKm6DbyZVnoygDA00iFWVIQa6FCcAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1raYaU-0004lH-B5; Thu, 15 Feb 2024 11:03:26 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1raYaS-000rZp-U9; Thu, 15 Feb 2024 11:03:24 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1raYaS-0003HJ-2l;
	Thu, 15 Feb 2024 11:03:24 +0100
Message-ID: <e031566a85ae0da0ee71dffba5d87c6414ef83e1.camel@pengutronix.de>
Subject: Re: [PATCH 05/23] gpio: nomadik: extract GPIO platform driver from
 drivers/pinctrl/nomadik/
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Date: Thu, 15 Feb 2024 11:03:24 +0100
In-Reply-To: <20240214-mbly-gpio-v1-5-f88c0ccf372b@bootlin.com>
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
	 <20240214-mbly-gpio-v1-5-f88c0ccf372b@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Mi, 2024-02-14 at 17:23 +0100, Th=C3=A9o Lebrun wrote:
[...]
> diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
> new file mode 100644
> index 000000000000..e39477e1a58f
> --- /dev/null
> +++ b/drivers/gpio/gpio-nomadik.c
> @@ -0,0 +1,660 @@
[...]
> +static int nmk_gpio_probe(struct platform_device *dev)
> +{
[...]
> +	ret =3D gpiochip_add_data(chip, nmk_chip);

Use devm_gpiochip_add_data() to cleanup on unbind, before nmk_chip goes
away. Or make the driver un-unbindable via suppress_bind_attrs. In that
case you could drop devm_ prefixes everywhere for consistency.

regards
Philipp


Return-Path: <linux-gpio+bounces-10354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1597E463
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 02:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A32112812F0
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 00:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074F023AD;
	Mon, 23 Sep 2024 00:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="hv7PivUj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39719635;
	Mon, 23 Sep 2024 00:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727051665; cv=none; b=ghaISmUrij3qCoCjSDhPVWwX4YLbNUIin2vkTUZURnP4UNA2K3cHLRWI3a/NPYqhFu3PPEAcMN7n6WXAwHJgXUHv29QZTM45pmebEgR6WjYLifHb9goP3nTFwVA39jUPfotDfPwkxUZQ3korPTMSYmSKVboEpivY0FzTZIjIw1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727051665; c=relaxed/simple;
	bh=k0R1VSEBcUQCVT5pa6sW4PDOy6epFWwyRWbhVPCZ+kA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O43+T1/o7UMMF52NWoEAQlHdab94UbZ45kpczL+zm66gt3rzDJEZpSvKhxyYwT0OSFxE/M2tembWZsDvIXCA4NnlDWR8qH5kuRgJ8zeKQJ7m5a1/EahuwEJKmS3R5RVLzfB239++JfvsFWITqUas4vqSFJQcD7HZGsCwPJFe38M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=hv7PivUj; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727051661;
	bh=J8lZa+H3G/xwr0+dUXS/TBLSPBCwgo0bJD6759puYZY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=hv7PivUjzA5mCleEYQ2yPhpRbIv3vJQAqKQWGqTezKx7WLAF2Ou1FzkcuLyIuW5z7
	 elFpwFaXYpXtxbzAuqQ7nkXVLKQYTUjGNmtWEwCB+ltgV/Azw4kxIC50z4y7pGLREn
	 44U1efdDyJtxuIOxzUnxjNoTUovGNESkU8QhNn/L73JjMIyIQ3CuI8yfDIijb5GyBU
	 /BMlp1rT+pbw8qQmwXsLuPc9gnCaDwgolo2E3m4DMfd8LvSNg98DEXe5ha6LknJr7s
	 u3/CHD+NChCHSe+sAgqFIeQAW9kcHaa8YAfky/Dp4YtKU0OSgBPhItYOQr6pK1/sDI
	 CYGv6HTS/OALA==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B13FB640E8;
	Mon, 23 Sep 2024 08:34:17 +0800 (AWST)
Message-ID: <1333d8dd77c80825cb20bc5a9885a6ced774183b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/6] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,  "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, 
 "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, "Jay_Zhang@wiwynn.com"
 <Jay_Zhang@wiwynn.com>
Date: Mon, 23 Sep 2024 10:04:17 +0930
In-Reply-To: <OSQPR06MB7252FDD739DCE7D4A44F63248B6C2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
	 <20240919094339.2407641-4-billy_tsai@aspeedtech.com>
	 <7aaed8cf171b67300aa5b7e861628278de948a27.camel@codeconstruct.com.au>
	 <OSQPR06MB7252FDD739DCE7D4A44F63248B6C2@OSQPR06MB7252.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-20 at 09:19 +0000, Billy Tsai wrote:
> >=20
> > > @@ -1191,6 +1203,9 @@ static int __init aspeed_gpio_probe(struct
> > > platform_device *pdev)
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpio->config =3D gpio_id->data;
> > >=20
> > > +     if (!gpio->config->llops->reg_bit_set || !gpio->config-
> > > >llops->reg_bits_get)
> > > +             return -EINVAL;
> > > +
>=20
> > This will need to clean up gpio->clk. Perhaps you could move it
> > above
> > the of_clk_get() call instead?
>=20
> How about change the `of_clk_get` to `devm_clk_get(&pdev->dev, 0);`?

Yep.

>=20
> > However, looking through the rest it seems we have a few issues
> > with
> > this leak :/
>=20
> This gpio driver doesn't have the reset, is it?

No, just leaking the resource.

However, I can't see that we prepare/enable (and disable/unprepare) the
clock either :( [1]. Do you mind fixing that as well? It would be best
if debounce didn't work by accident.

Andrew

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/include/linux/clk.h?h=3Dv6.11#n527





Return-Path: <linux-gpio+bounces-3551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7F585D74A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 12:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19A161C21FE5
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 11:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4343745977;
	Wed, 21 Feb 2024 11:41:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBFA45976
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515675; cv=none; b=SxQJXNk1p4DBHgrwG60OYJ4gk4UbwQ2Wg1O/9HmsH5HbM6y4fEaJqdUVY0L+z9/k2BoN778h8RwDqYe79pIJ1TRE92xrHdShj9r6Ze7ibyZEo5hYHW2iBNliH6U3bUWUDFpDfue7Lc866iGaY7AdlTA5e7T5/P0ee8D+jHlCrHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515675; c=relaxed/simple;
	bh=N88ZAVmfemoKev6jlYmIQMcDug/YAdpNBEedT/wfwl8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qSmngCALk5Xn9TzJ4ehZu5GnZtqH0S3vU5qCDl/Kx+qswWrm9Xs4Xv3iGvPbXaJBGCyADNhSgDIGS5HT/kdXYTUhmjF8QwRbuQHU0xqQB3VSYWPmyYGxGQoE4e2kn+p/yECgm9L4AlQEdicmFVEh50y8jA9W7eM/Rco/y1MCGyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckyI-0002lV-Sp; Wed, 21 Feb 2024 12:41:06 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckyE-0021v1-Of; Wed, 21 Feb 2024 12:41:02 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckyE-00061g-2E;
	Wed, 21 Feb 2024 12:41:02 +0100
Message-ID: <f2e3d662e92b76e43b89a3c99669c3dadb2176b5.camel@pengutronix.de>
Subject: Re: [PATCH 05/23] gpio: nomadik: extract GPIO platform driver from
 drivers/pinctrl/nomadik/
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?ISO-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Date: Wed, 21 Feb 2024 12:41:02 +0100
In-Reply-To: <CAMRc=Me-oEx9S0w=XhwC4MzV9uzV0o0HnWBfNSstcqg5jpXyZg@mail.gmail.com>
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
	 <20240214-mbly-gpio-v1-5-f88c0ccf372b@bootlin.com>
	 <e031566a85ae0da0ee71dffba5d87c6414ef83e1.camel@pengutronix.de>
	 <CAMRc=Me-oEx9S0w=XhwC4MzV9uzV0o0HnWBfNSstcqg5jpXyZg@mail.gmail.com>
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

Hi Bartosz,

On Mo, 2024-02-19 at 16:33 +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 15, 2024 at 11:03=E2=80=AFAM Philipp Zabel <p.zabel@pengutron=
ix.de> wrote:
> >=20
> > On Mi, 2024-02-14 at 17:23 +0100, Th=C3=A9o Lebrun wrote:
> > [...]
> > > diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.=
c
> > > new file mode 100644
> > > index 000000000000..e39477e1a58f
> > > --- /dev/null
> > > +++ b/drivers/gpio/gpio-nomadik.c
> > > @@ -0,0 +1,660 @@
> > [...]
> > > +static int nmk_gpio_probe(struct platform_device *dev)
> > > +{
> > [...]
> > > +     ret =3D gpiochip_add_data(chip, nmk_chip);
> >=20
> > Use devm_gpiochip_add_data() to cleanup on unbind, before nmk_chip goes
> > away. Or make the driver un-unbindable via suppress_bind_attrs. In that
> > case you could drop devm_ prefixes everywhere for consistency.
> >=20
>=20
> No! Why? What about error paths in probe() where you want to undo everyth=
ing?

Brain fog moment. I was triggered by the mixture of devm_ and non-devm_
calls and jumped to the wrong conclusion.

Yes, keeping devm_ for error cleanup is of course correct, and with
suppress_bind_attrs it'd even be ok to use non-devm_
gpiochip_add_data(), as long as there can be no error return
afterwards.

regards
Philipp


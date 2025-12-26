Return-Path: <linux-gpio+bounces-29903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD0CDEAC4
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 13:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C0AE301177F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 11:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17FD31E0EA;
	Fri, 26 Dec 2025 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="23hxyghz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D96318133
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766750393; cv=none; b=HWJtYS1rrQvJ/DoFldkMEXc2XvHXe6kyT5sKlShjyMzDvVh+qrHJyuR/U7zpFSnM8q3hHL0fI3IsoSq8uo3Qd3WB1tymXBdsVolmeUnRt4o2D4pjtoKlx5+LoylSY1XSyHkj6AAOnXNmXtvk4WHf8RjE2HG0uevF9vGaVi40qRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766750393; c=relaxed/simple;
	bh=OWWYLrilFhz9YC8b9tP2fN0oE1fQiFaqy3spTA2lL2M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bbZy77w7/+Hc3zZI+Z+eiAAQOAYT91sC+M3jOqHQdUpfNcS1p1ppRpbHd0CFBEnzyvhoSBv0FO6CC80WrBL4oXAJCOXk6frnLmE0/eNkyqYEBNm7VKT9UvtXn4sWqegXtpgK1AGVnsWLjnvRrgrDKrb182Nwj4PAPyaD1xV6Icw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=23hxyghz; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 8C6476B8CAB;
	Fri, 26 Dec 2025 12:59:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1766750382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtiGe9UVY4DRuvW+VF67JllIQ13Z+/lQWqwadNoyDPI=;
	b=23hxyghzwayhUxPh7bSQxjkB0B59Vce2uTZ4urCcEqxrCM7VT5aTxuVfGceB/FeN+4KL3A
	4OydY24Q2CI8/Clu1DrbSowTnyzUrNajPIG+1nW/UHlJQjPXdXhT5M9RsyDn51l6FRCs60
	o6ny4vB2n9l5KO4Do/pK/8FnWT8rvIv/tf96TgQfjifQae0sluFCcUGoIHpmDKR/kiNJ6k
	mPOH+gnzsXhmPuLRWy+KKt8j2kdxgnD890CBxQiEj2luZSGoqOEamX4SeCQBlplFoNPDLl
	IEU+Ftd65iwYsnuLmjnCpGmOzYr9d9Ja6oN1ekrWQwJX0qUz+47o7JtOWVZI+Q==
Message-ID: <12c98c7c8bead26a61764e3e9611badf2cdfcac5.camel@svanheule.net>
Subject: Re: [PATCH v9 3/6] mfd: Add RTL8231 core device
From: Sander Vanheule <sander@svanheule.net>
To: kernel test robot <lkp@intel.com>, Lee Jones <lee@kernel.org>, Pavel
 Machek	 <pavel@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Michael Walle	 <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Mark Brown	 <broonie@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit	 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller"	 <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran	
 <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Fri, 26 Dec 2025 12:59:40 +0100
In-Reply-To: <202512220956.FVakrdhV-lkp@intel.com>
References: <20251215175115.135294-4-sander@svanheule.net>
	 <202512220956.FVakrdhV-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Adding the netdev and regmap maintainers for extra input.

On Mon, 2025-12-22 at 09:43 +0100, kernel test robot wrote:
> url:=C2=A0=C2=A0=C2=A0 https://github.com/intel-lab-lkp/linux/commits/San=
der-Vanheule/dt-bindings-leds-Binding-for-RTL8231-scan-matrix/20251216-0155=
52
> base:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd=
.git=C2=A0for-mfd-fixes
> patch link:=C2=A0=C2=A0=C2=A0 https://lore.kernel.org/r/20251215175115.13=
5294-4-sander%40svanheule.net
> patch subject: [PATCH v9 3/6] mfd: Add RTL8231 core device
> config: alpha-kismet-CONFIG_MDIO_BUS-CONFIG_REGMAP_MDIO-0-0 (https://down=
load.01.org/0day-ci/archive/20251222/202512220956.FVakrdhV-lkp@intel.com/co=
nfig)
> reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220956=
.FVakrdhV-lkp@intel.com/reproduce)
>=20

For context: these patches introduce a new MFD with pinctrl and led subdevi=
ces.
The RTL8231 MFD is attached to an MDIO bus, but it can also be attached to =
an
I2C bus (not currently supported). The drivers use regmap to provide a bus
abstraction.

> kismet warnings: (new ones prefixed by >>)
> > > kismet: WARNING: unmet direct dependencies detected for MDIO_BUS when
> > > selected by REGMAP_MDIO
> =C2=A0=C2=A0 WARNING: unmet direct dependencies detected for MDIO_BUS
> =C2=A0=C2=A0=C2=A0=C2=A0 Depends on [n]: NETDEVICES [=3Dn]
> =C2=A0=C2=A0=C2=A0=C2=A0 Selected by [y]:
> =C2=A0=C2=A0=C2=A0=C2=A0 - REGMAP_MDIO [=3Dy]

I'm a bit puzzled on how to solve this one. The issue detected here is that=
 my
driver (MFD_RTL8231) selects REGMAP_MDIO, which in turn selects MDIO_BUS. T=
he
latter is dependent on NETDEVICES, which is not selected in this test.=C2=
=A0
The kernel does not yet have any other consumers of REGMAP_MDIO, which is
probably the reason the dependency issue has gone undetected until now.

REGMAP_MDIO is not a visible symbol, so it must be selected by drivers.

Other REGMAP_XYZ symbols (almost) exclusively use "depends on XYZ", but if =
I
change REGMAP_MDIO to "depends on", the warning just changes to:

   WARNING: unmet direct dependencies detected for REGMAP_MDIO
     Depends on [n]: MDIO_BUS [=3Dn]
     Selected by [y]:
     - MFD_RTL8231 [=3Dy] && HAS_IOMEM [=3Dy]

Trying to make MFD_RTL8231 also depend on MDIO_BUS, like .e.g I2C dependent
devices do, results in a recursive dependency:


   error: recursive dependency detected!
   	symbol GPIOLIB is selected by PINCTRL_RTL8231
   	symbol PINCTRL_RTL8231 depends on MFD_RTL8231
   	symbol MFD_RTL8231 depends on MDIO_BUS
   	symbol MDIO_BUS is selected by PHYLIB
   	symbol PHYLIB is selected by ARC_EMAC_CORE
   	symbol ARC_EMAC_CORE is selected by EMAC_ROCKCHIP
   	symbol EMAC_ROCKCHIP depends on OF_IRQ
   	symbol OF_IRQ depends on IRQ_DOMAIN
   	symbol IRQ_DOMAIN is selected by GENERIC_IRQ_CHIP
   	symbol GENERIC_IRQ_CHIP is selected by GPIO_MVEBU
   	symbol GPIO_MVEBU depends on GPIOLIB
  =20
The 'quick fix' appears to be to add "select NETDEVICES" to REGMAP_MDIO. Th=
e
platforms that use the RTL8231 MFD are typically ethernet switches, so they
would have NETDEVICES enabled anway, but that feels very heavy handed and
automatically pulls in a lot of extra stuff. Would this be acceptable or is
there a more desirable approach I'm not seeing here?

Best,
Sander


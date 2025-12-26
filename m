Return-Path: <linux-gpio+bounces-29909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB6CDEC70
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 15:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE28B3006F6F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 14:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD09B231836;
	Fri, 26 Dec 2025 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="yEUhes3A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C651142E83
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766760751; cv=none; b=aF1JPDSSk9EYnkTR+lDUrglT59wx4Ef7QO517TjTOCUo8iOiJnzBZlHpe9ajraEpv/tAJ26YXQT67AqSkVNks0pTYloB+AAThHoPNaR4oPX8DR5Rhk7PclIL9/ikHjtFlJwU3yQazKC4V4OH0AMrQeXKq+fmOn0FGEwCy576TZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766760751; c=relaxed/simple;
	bh=8cv+uRDsgY/kwycqF2X1hXxbRFbVLqnu/AZyd5HHPNM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ihMUsNflhu9DJUvENMuUH+VKJEHa/VfRXTXQpiU6cd10lzPIY2FsJqh6q1OufT3vMLHna642T4BA/4yIAd0zjnw1iwYMW0VKcdw91OY01j7ExOIS47MS54V/Zt2DjyjTeSwewpSS12P2E4rITbG5hWuosSLKNjR+kZOTQY47dTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=yEUhes3A; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id D48E66B8DB8;
	Fri, 26 Dec 2025 15:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1766760747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WAThaaKjBVKVFz/Q0ebC6b7atC4HpfaPtb4nS/rc8QA=;
	b=yEUhes3Ah6Cx5ZxXDtQNZ6VyqYrO4/f2heXKM/THg/s4+iWariqU3z5zv3TWpH3XcbTPc9
	BU6MaOpAga2ds3WXUCL+ml8NJaghTODKtObu9OSF5VZQlZOd8ug+nexDFAGP6bcAVRHLQ8
	YOZpyxlR7gB4kscEmxwGcW3Dk/FPRhmbbYav/50sS9AqNQNIvwBq+lPiCKeZbUCq2PTmrO
	1VTTFP8EulztRLAcxEwMis/y2Q40bt6iy8WhO2KNglwsv5c39tSj+lSJZJkhReaJONDxrg
	4YHDf4QZEzhQ3pw3LHrA+uM83daNFmKPLVJUNM5kEdNJYqBqTaQRMXBILqchvQ==
Message-ID: <a844934b105136f576ab46a5779cf57ef0cc7bbb.camel@svanheule.net>
Subject: Re: [PATCH v9 3/6] mfd: Add RTL8231 core device
From: Sander Vanheule <sander@svanheule.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot
 <lkp@intel.com>,  Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,  Michael
 Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown
 <broonie@kernel.org>,  Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,  "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Randy Dunlap
 <rdunlap@infradead.org>
Cc: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran	
 <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Date: Fri, 26 Dec 2025 15:52:25 +0100
In-Reply-To: <a26a5397-7597-49f6-9e73-3eb853915166@kernel.org>
References: <20251215175115.135294-4-sander@svanheule.net>
	 <202512220956.FVakrdhV-lkp@intel.com>
	 <12c98c7c8bead26a61764e3e9611badf2cdfcac5.camel@svanheule.net>
	 <a26a5397-7597-49f6-9e73-3eb853915166@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Fri, 2025-12-26 at 13:19 +0100, Krzysztof Kozlowski wrote:
> On 26/12/2025 12:59, Sander Vanheule wrote:
> > > kismet warnings: (new ones prefixed by >>)
> > > > > kismet: WARNING: unmet direct dependencies detected for MDIO_BUS =
when
> > > > > selected by REGMAP_MDIO
> > > =C2=A0=C2=A0 WARNING: unmet direct dependencies detected for MDIO_BUS
> > > =C2=A0=C2=A0=C2=A0=C2=A0 Depends on [n]: NETDEVICES [=3Dn]
> > > =C2=A0=C2=A0=C2=A0=C2=A0 Selected by [y]:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - REGMAP_MDIO [=3Dy]
> >=20
> > I'm a bit puzzled on how to solve this one. The issue detected here is =
that
> > my
> > driver (MFD_RTL8231) selects REGMAP_MDIO, which in turn selects MDIO_BU=
S.
> > The
> > latter is dependent on NETDEVICES, which is not selected in this test.=
=C2=A0
> > The kernel does not yet have any other consumers of REGMAP_MDIO, which =
is
> > probably the reason the dependency issue has gone undetected until now.
> >=20
> > REGMAP_MDIO is not a visible symbol, so it must be selected by drivers.
>=20
> Reminds me old problem, probably the same:
>=20
> https://lore.kernel.org/all/20250515140555.325601-2-krzysztof.kozlowski@l=
inaro.org/
>=20
> https://lore.kernel.org/all/20250516141722.13772-1-afd@ti.com/
>=20
> Exactly the same MDIO here and there.
> > [...]
> Rather fix the same way Andrew did it. Or maybe his patch was not merged?

Andrew's patch was merged, that's the code I'm seeing now. I think by
placing the dependency under REGMAP_MDIO (or REGMAP_IRQ) instead of
REGMAP, it just made the circular dependency less visible.

Making PINCTRL_RTL8231 "depends on GPIOLIB", like the GPIO drivers, only
shortens the circular dependency loop:

   error: recursive dependency detected!
   	symbol IRQ_DOMAIN is selected by MFD_CORE
   	symbol MFD_CORE is selected by MFD_RTL8231
   	symbol MFD_RTL8231 depends on MDIO_BUS
   	symbol MDIO_BUS is selected by PHYLIB
   	symbol PHYLIB is selected by ARC_EMAC_CORE
   	symbol ARC_EMAC_CORE is selected by EMAC_ROCKCHIP
   	symbol EMAC_ROCKCHIP depends on OF_IRQ
   	symbol OF_IRQ depends on IRQ_DOMAIN

Of these symbols, IRQ_DOMAIN and OF_IRQ are hidden symbols, so they must be
selected by another symbol to be used. As shown above, OF_IRQ *depends* on
IRQ_DOMAIN, which means some other symbol *must* select it for the dependen=
cy to
be satisfied, as IRQ_DOMAIN also cannot be selected directly by the user. O=
F_IRQ
also appears to be the only symbol in the kernel to depend on, rather than
select, IRQ_DOMAIN.

Turning the dependency of OF_IRQ on IRQ_DOMAIN around resolves the dependen=
cy
loop here, and ensures the hidden IRQ_DOMAIN symbol is selected whenever an=
y
other symbol selects OF_IRQ.

The same reasoning was actually used in 2023 to suggest this change as well=
:
https://lore.kernel.org/lkml/20230213041535.12083-3-rdunlap@infradead.org/

I found some follow-up, but it didn't look like it actually got wrapped up:
https://lore.kernel.org/lkml/20230313023935.31037-1-rdunlap@infradead.org/

Randy, do you happen to recall if/why this stalled? Should we just try to i=
nvert
the dependency again if there is no pressing need for the "proper" clean-up=
?


Best,
Sander


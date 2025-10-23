Return-Path: <linux-gpio+bounces-27515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D47A0C00240
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 11:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FEDB1A64248
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B042FBDF0;
	Thu, 23 Oct 2025 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="iMp870HE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAD52FB963
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210603; cv=none; b=eSlMtzwjIAmbM05b552PfWL/eC9+VgEyR9LkBIFx1diunWtIhpbmhtT/yWtBgg3YBQpOP4oZCE3nf0TfV43ElrgxezNfQ8BbA0reEeLndhD3m/74DqcIsUK1iyObt2POs/doBVcWCjh5cMP0wrwKrAmJSUzfDUgukpioGXsd+pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210603; c=relaxed/simple;
	bh=AxdHT4+N+ETHMW1HCoygK8rvw6Y4adLO3i2QobmUico=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dkI/3bySK6AFS5zhC6TijzyxUZePSgi45QCXXuh9iPVMCRc8YS/ql7lC/mHAPU1uvi5p4vilsPWYLX2uIgEgqD18P/81ivSZvoODvTvKnIhB//OYM+l5cpSqQwVxV/UfROnZ/c/Y68nhXZT5U7/fdjZgLgQzdEx92qgqvpFyeBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=iMp870HE; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 08BA268C10D;
	Thu, 23 Oct 2025 11:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761210598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AxdHT4+N+ETHMW1HCoygK8rvw6Y4adLO3i2QobmUico=;
	b=iMp870HELK0j939dmvIPOwh8y6l4cHkgqc+AcvpPiqBeGkU4R/U8nOuKSgSUkfM3Xt78mU
	xXiprctsG59/rBu7jLhxJu45vGFA0Q/juG1UaJPy0Y3Ku2w+CdoWsH1pBzKnU/O5UTMqza
	8eG19ifxWB1hL4AeOayi1xdJidZv1H3Ii81c+j/UBc5Tn7DkEMlqSGdWaLGp3VSxXYIr1r
	6BFdm+MKhgKfiFOPDiDUioxgCLDc+eA00D4JJDdxD4dSesD9gntBXyop6vycwd/miEqE1P
	H2njhY2OXPwCrLfDnsJD7+X0O++ty5GY7a/npLOXuJAYum9uPYuM56sPzPS5BQ==
Message-ID: <69a020e444bfbd3b72971dec3a34261ff8d39f24.camel@svanheule.net>
Subject: Re: [PATCH v6 0/8] RTL8231 GPIO expander support
From: Sander Vanheule <sander@svanheule.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, 	linux-gpio@vger.kernel.org, Lee Jones
 <lee@kernel.org>, Pavel Machek	 <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 23 Oct 2025 11:09:57 +0200
In-Reply-To: <CAMRc=MeGehj3EHP=W3E3fJOpOAqXXg_D8XRRuv2SMxF8_UYpbQ@mail.gmail.com>
References: <20251021142407.307753-1-sander@svanheule.net>
	 <CAMRc=MeGehj3EHP=W3E3fJOpOAqXXg_D8XRRuv2SMxF8_UYpbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Thu, 2025-10-23 at 11:05 +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 4:24=E2=80=AFPM Sander Vanheule <sander@svanheule=
.net> wrote:
> >=20
> > The RTL8231 GPIO and LED expander can be configured for use as an MDIO
> > or SMI bus device. Currently only the MDIO mode is supported, although
> > SMI mode support should be fairly straightforward, once an SMI bus
> > driver is available.
> >=20
> > Provided features by the RTL8231:
> > =C2=A0 - Up to 37 GPIOs
> > =C2=A0=C2=A0=C2=A0 - Configurable drive strength: 8mA or 4mA (currently=
 unsupported)
> > =C2=A0=C2=A0=C2=A0 - Input debouncing on GPIOs 31-36
> > =C2=A0 - Up to 88 LEDs in multiple scan matrix groups
> > =C2=A0=C2=A0=C2=A0 - On, off, or one of six toggling intervals
> > =C2=A0=C2=A0=C2=A0 - "single-color mode": 2=C3=9736 single color LEDs +=
 8 bi-color LEDs
> > =C2=A0=C2=A0=C2=A0 - "bi-color mode": (12 + 2=C3=976) bi-color LEDs + 2=
4 single color LEDs
> > =C2=A0 - Up to one PWM output (currently unsupported)
> > =C2=A0=C2=A0=C2=A0 - Fixed duty cycle, 8 selectable frequencies (1.2kHz=
 - 4.8kHz)
> >=20
> > The patches have been in use downstream by OpenWrt for some months. As
> > the original patches are already a few years old, I would like to reque=
st
> > all patches to be reviewed again (and I've dropped all provided tags an=
d
> > changelogs).
> > ---
> > RFC for gpio-regmap changes:
> > Link:
> > https://lore.kernel.org/lkml/20251020115636.55417-1-sander@svanheule.ne=
t/
> >=20
> > Patch series v5 (June 2021):
> > Link:
> > https://lore.kernel.org/lkml/cover.1623532208.git.sander@svanheule.net/
> >=20
> > Sander Vanheule (8):
> > =C2=A0 gpio: regmap: Force writes for aliased data regs
> > =C2=A0 gpio: regmap: Bypass cache for aliased inputs
>=20
> If I'm not mistaken, nothing depends on these two at build-time, so I
> can just take them through the GPIO tree for v6.19?

That's okay for me.

Best,
Sander


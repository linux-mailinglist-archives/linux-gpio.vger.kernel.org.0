Return-Path: <linux-gpio+bounces-28848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D1EC70FB4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 21:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 886C32B68C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 20:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F492EB856;
	Wed, 19 Nov 2025 20:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="fdmaCx3T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6B36BCD9
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 20:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582813; cv=none; b=ifnEVhOYVuw5y0SsZINGai9Hrsajnb7eiKLsz7A/vFrsyRVHZWhGWRfeZUG9MKmAA3nUj/0PERq7g0Sv+sljCgzCF7LQf6j7rSWpjZFVul0E+1WK06qfOhW0IH/kYxXvLQjpEZah7konwCLiE+6fH8HjtqF5Ywk1jxPi1D9gZAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582813; c=relaxed/simple;
	bh=qG5+IlHh1mxaXcrUVMcJNHvtrGkvdwElR/i6jnAiIwM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qSblrtJRo8+9m0CieLkeZrbSt9JQJgrAug4dpT/if1YpeMl6cfO0ChAXHZVZCnQBWynm+qWOfkHtFEQljolGlLky0/7ctIl+4I3xK4QeUg3OvepxvDHfueoav1YggDddtxrImPEzvOpBHT81mM96hOu8dEd642WzI9EuM9icNls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=fdmaCx3T; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:26cd:b932:ba51:717b] (2a02-1812-162c-8f00-26cd-b932-ba51-717b.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:26cd:b932:ba51:717b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 7DA186A1EA0;
	Wed, 19 Nov 2025 21:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763582807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qG5+IlHh1mxaXcrUVMcJNHvtrGkvdwElR/i6jnAiIwM=;
	b=fdmaCx3TLAF9VwAdGFa3rdhkQkbJW0/0OoDJbK/2SyK3iWImNSFb+yBMlqBNoW/u/BwiKa
	XCwdrvIYoUbcpNxLqrc/iyBxOODFbhxKBbwpC0oM/uY6Zitbts90SkoW5YQRHtfqQqalk0
	WXP8uOS2WneaTe2habZwv5GorT61ytCySN1tY1M1+nAD66yxtW2irvdiKJYG0O9Jmw4WVN
	jqB/tp4rqzsHTs7r+lhEqXtZvAou9jyFK6/YQFa5im+mWUbgJthRzg3ee4lNVFNUbJSscr
	Q+JR65g8YgRl2jNGLCiHp/tViVz07hvwhGwU9hKdiM9VlTySCXTTCulXLBwt3g==
Message-ID: <5644907b34f2806afa1a7c997942642eca94628a.camel@svanheule.net>
Subject: Re: [PATCH v8 0/6] RTL8231 GPIO expander support
From: Sander Vanheule <sander@svanheule.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael
 Walle	 <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 19 Nov 2025 21:06:47 +0100
In-Reply-To: <20251119200306.60569-1-sander@svanheule.net>
References: <20251119200306.60569-1-sander@svanheule.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-11-19 at 21:02 +0100, Sander Vanheule wrote:
> The RTL8231 GPIO and LED expander can be configured for use as an MDIO
> or SMI bus device. Currently only the MDIO mode is supported, although
> SMI mode support should be fairly straightforward, once an SMI bus
> driver is available.
>=20
> Provided features by the RTL8231:
> =C2=A0 - Up to 37 GPIOs
> =C2=A0=C2=A0=C2=A0 - Configurable drive strength: 8mA or 4mA (currently u=
nsupported)
> =C2=A0=C2=A0=C2=A0 - Input debouncing on GPIOs 31-36
> =C2=A0 - Up to 88 LEDs in multiple scan matrix groups
> =C2=A0=C2=A0=C2=A0 - On, off, or one of six toggling intervals
> =C2=A0=C2=A0=C2=A0 - "single-color mode": 2=C3=9736 single color LEDs + 8=
 bi-color LEDs
> =C2=A0=C2=A0=C2=A0 - "bi-color mode": (12 + 2=C3=976) bi-color LEDs + 24 =
single color LEDs
> =C2=A0 - Up to one PWM output (currently unsupported)
> =C2=A0=C2=A0=C2=A0 - Fixed duty cycle, 8 selectable frequencies (1.2kHz -=
 4.8kHz)
>=20
> The patches have been in use downstream by OpenWrt for some months. As
> the original patches are already a few years old, I would like to request
> all patches to be reviewed again (and I've dropped all provided tags and
> changelogs until v6).
>=20
> ---
Forgot to list the changes since v7:
- All drivers can now be built independently with COMPILE_TEST
- Fix storage size of pinfunction flags in a more compatible way
- Add missing OF dependency to pinctrl driver
- Improve references properties in bindings

Best,
Sander


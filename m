Return-Path: <linux-gpio+bounces-28700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F7C6BA8A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 21:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F35DD4EBE2F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 20:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B6C2F49FB;
	Tue, 18 Nov 2025 20:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="Re5Lfyqt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F52F6186
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 20:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763498248; cv=none; b=gKF97rWaXU7C1ZdjYmAKj8eztfuw64+HyAHfCRIBXIV+aDXFInxOKgfM3YSYd7n1IR1xJj9MmRuaFEU1D9r12Stkhd+Rg548eKKfn7/hsXFZf3S201UzCsgWsNJBLrB0hnXbzOER9OLtdXr9UQ+T2zq9rNFSWCWhSmN1hzlKprQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763498248; c=relaxed/simple;
	bh=U0bO+cFG7Ix82Qk9J/VxfrGtiVDBxJrS24aORhUcrIY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OoA+/A12wxUxlIYVk5Gnqn47MJreQMa0VteugEMAIfHyNUJAkyte/CDWBRBRg7Lq+Ab/7pkAFrlOWrJuaS/ncwWbh8Dt2e42zY4r6UqKNMXMa15/e/VAm/CZawhxZw5pVuE7P97zVj8StFu54Y6nvsGHON7SEACd+8YASv7A67Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=Re5Lfyqt; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:110a:5400:17f3:a8ff:d314:780e] (2a02-1812-110a-5400-17f3-a8ff-d314-780e.ip6.access.telenet.be [IPv6:2a02:1812:110a:5400:17f3:a8ff:d314:780e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id D8D366A14EB;
	Tue, 18 Nov 2025 21:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763498243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U0bO+cFG7Ix82Qk9J/VxfrGtiVDBxJrS24aORhUcrIY=;
	b=Re5Lfyqt+TCF0Um6kyalyhufMpbWyLHopLgWFaVoUYLU2DzH0H66mBqR1tdCT1bC7J0gUJ
	sRl7EHM8jCf0iHrUCfJ+9ipdVaYGUSy1BsPnbUswuM1AyoixTG0On6+xK0db0s50m6ct3F
	mJLRpLRH9A1EpxiHKOUePqEBjiooN/9nLvjBpiUovk2A1WSVq5tXo9CDS4L7xvXWkLpGF1
	eyYlzM6HW4VXZWVoWB5ktG9siZLXzvqdHYhyQxD+WHFZKbC9wEE+0rKGC4qmZN0CPWGnI6
	EA90WGSKxfENjVFS9gQ95q7MUgnKgC4bM77wuXo/LEaf21EMqw7sJLGZR+kD8Q==
Message-ID: <6a0fafaa35d29ab5efb3871a61b68bed0272d1d6.camel@svanheule.net>
Subject: Re: [PATCH v7 1/6] dt-bindings: leds: Binding for RTL8231 scan
 matrix
From: Sander Vanheule <sander@svanheule.net>
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus
 Walleij	 <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Tue, 18 Nov 2025 21:37:21 +0100
In-Reply-To: <20251118145805.GA3231100-robh@kernel.org>
References: <20251117215138.4353-1-sander@svanheule.net>
	 <20251117215138.4353-2-sander@svanheule.net>
	 <20251118145805.GA3231100-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,

On Tue, 2025-11-18 at 08:58 -0600, Rob Herring wrote:
> On Mon, Nov 17, 2025 at 10:51:31PM +0100, Sander Vanheule wrote:
> > +=C2=A0=C2=A0=C2=A0 allOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - $ref: /schemas/leds/common.yaml#

I've moved the $ref property as you mentioned in your first message and add=
ed the
unevaluatedProperties: false

> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/leds/common.h>
> > +=C2=A0=C2=A0=C2=A0 led-controller {
>=20
> Also, drop the example here. It just duplicates what is in the mfd=20
> schema and we want 1 complete example, not piecemeal examples.

Done!

Thanks,
Sander


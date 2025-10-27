Return-Path: <linux-gpio+bounces-27688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C07F1C0F94C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 18:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A9C421BD6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 17:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40838315D26;
	Mon, 27 Oct 2025 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="oEnRC4Db"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCBE315D2A
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761585174; cv=none; b=Np6pRmmRdHiY0UE7XQchzH8HPzuqmK1iedcQ3RIx6EaZMfoaZb728WX9wqKtTuHAgXl8pVY2yo8NxJ2owdSLSeA7ngs3w5Vn+G3yWVtbePTZ4J62AplJRX8tbt4JGM3nYxpvqc2dBRwKng+XGsNGMYsYpqw1+2HhL92PEWVl9m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761585174; c=relaxed/simple;
	bh=DDUOz6pjS0RFP4FR/CFhn3TMmkuBCJmIvoPoMyDYCzk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KlE1UHCiQKjuyJgvJs7+SjFLiTXqhwTI2dTfYkv6I1z5CrzCZRadYm4s5DRER8lbjSKR2XU6lfa+wDb6r5JLK0ypluTzdSPQ7kqIR+QMadcr3c95qRWPvud7tckaVsOuj8WEbDCjURDLdxnL6pCgj8egeynouYPDTXmwQuidsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=oEnRC4Db; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 473BA68ECC7;
	Mon, 27 Oct 2025 18:12:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761585164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rVfZIHqcFGwmFDGY9gRpKS0fz36XexTpMSYfxIv3Xkk=;
	b=oEnRC4DbwPWXDWKFgpZ2SqaFL6q2n3B9p09ycmim6OYvGhAlaE9MQOgiWEwJb6c7Zk3rCG
	MFtxPFH1b8oQVln1BUNDF1APUQw2Yx0ED809EhFic6EqWzHcSLMKp7kxtO7ZAPgFyxYF5k
	JLQmTrkCXevghrQDat0EAMltxXGxs3OvcNJN+aQea0qhjjch5TFdKtPWdHdx7WF1BKhxtn
	TCOzoa6XPJTqbNwNvXUVoNlwkep6RYZ1hIbV1koR4a6QKnmMR5Ki/DJQK/SK4JVVaGYOsd
	MJpCrW4Mf2NErbdeD5SjnRQBBfwkqjDNOpX7XteeZ3zFk89Q4V6AicRLh4F/xQ==
Message-ID: <7d1bf3eacd59a3cea1330a16bf7a9a328cd6d806.camel@svanheule.net>
Subject: Re: [PATCH v6 3/8] dt-bindings: leds: Binding for RTL8231 scan
 matrix
From: Sander Vanheule <sander@svanheule.net>
To: Rob Herring <robh@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Mon, 27 Oct 2025 18:12:43 +0100
In-Reply-To: <20251026215957.GA2994223-robh@kernel.org>
References: <20251021142407.307753-1-sander@svanheule.net>
	 <20251021142407.307753-4-sander@svanheule.net>
	 <20251026215957.GA2994223-robh@kernel.org>
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

On Sun, 2025-10-26 at 16:59 -0500, Rob Herring wrote:
> On Tue, Oct 21, 2025 at 04:23:58PM +0200, Sander Vanheule wrote:
> > +=C2=A0 realtek,led-scan-mode:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 description: |
>=20
> You don't need '|' if there is no formatting to preserve.

Will drop it.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specify the scanning mode the chip shou=
ld run in. See general
> > description
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for how the scanning matrices are wired=
 up.
> > +=C2=A0=C2=A0=C2=A0 enum: [single-color, bi-color]
>=20
> Wouldn't 'single' and 'bi' be sufficient?

I used these values to align with the datasheet:

   En_bicolor
   1'b0: Uses single-color LED when in Scan LED mode
   1'b1: Uses bi-color LED when in Scan LED mode

If you would like a single word, I would prefer [single, dual] and mention =
the
single-color/bi-color mapping in the description.

>=20
> > +
> > +patternProperties:
> > +=C2=A0 "^led@":
>=20
> You need to define the unit-address format:
>=20
> "^led@([1-2]?[0-9]|3[0-1]),[0-2]$"

Hadn't considered that yet. I'll update this too.


Best,
Sander


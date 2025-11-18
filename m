Return-Path: <linux-gpio+bounces-28704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 312E3C6BC9D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 22:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 604DB357A08
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 21:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E310E30CDA8;
	Tue, 18 Nov 2025 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="pHz/pqGQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB43127B4F5
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 21:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503054; cv=none; b=t1fOnDD6Nz79tdz9/6JAuqa/cxAi8fFtgNue5YQGGr9K/uS7TcE2ibR9xQIr3KEM5iyoa2miBiLoHoYgJ7hjIU9lKgw4twDoCvTvC8fOvUEfWwTajXxUt81fJcK2kxKz6H3DN+N6Hx15aoLBexokNHUqVLHJnHMi194mc3QZfo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503054; c=relaxed/simple;
	bh=nDGUiNESXr/rk2f1Ufl3c5x7NuqKX4Rz5TSE+doWLJU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qc+n6hJHOhbqq9dbrVMgfTkCzTgv2qC1tt8PAW0YaY0P9jLyevJw5HwXuTNcyzyD1fntc5MuQLGItH0Vn8hzsVqKG1ekKjEIeaiKy9NPCn/UIrdD0i9AOUBs6fx0RqygtIHZB8UQYhTvkPjO4W7V4AKifeegj0Oa32EGxs4qEmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=pHz/pqGQ; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:110a:5400:17f3:a8ff:d314:780e] (2a02-1812-110a-5400-17f3-a8ff-d314-780e.ip6.access.telenet.be [IPv6:2a02:1812:110a:5400:17f3:a8ff:d314:780e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 79AA96A156A;
	Tue, 18 Nov 2025 22:57:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763503044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FoCVshSXdNUyMpw0qMmzthb7W/n838KzCUnDBLc60Y=;
	b=pHz/pqGQSo6sxg+CTv0ndIhE1mbXjYrlENas4Zt4EqQX6eZv07SQeAf34/yARsBjEE4ho4
	8x4d1IedgTOR4Fv7/2iDI/c6Ko2E4n5Hdbl0VDs4DuLYv6PpYV/K7cXcWuhARtqZwGoVmr
	6hYa4dzYtvCkgSHEBn8NcKZ8JlOhGACOo88hxrfwobM8aWsfoQPgaL+XZWSJlcgmmJyyrm
	pe7/dhivnf5V3gNrIf5iCkSBThwizYr/DdnvBaOacv0n4+AXyNAo+r/25KNrOxJnXPmjy4
	d5URVFY2ctJZk3g4RWjvnSZAX86E4Wy57V8ew4XQrP9lqGmajTzhyBsb6xqOGQ==
Message-ID: <9fc358372ef267530b4304b4fa1cf5643c18cb42.camel@svanheule.net>
Subject: Re: [PATCH v7 2/6] dt-bindings: mfd: Binding for RTL8231
From: Sander Vanheule <sander@svanheule.net>
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus
 Walleij	 <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Tue, 18 Nov 2025 22:57:23 +0100
In-Reply-To: <CAL_Jsq+Mzj+3d4q+xQLq_GEYzRJA6E+CEJ9M8FQH6kL9eBZhVg@mail.gmail.com>
References: <20251117215138.4353-1-sander@svanheule.net>
	 <20251117215138.4353-3-sander@svanheule.net>
	 <CAL_Jsq+Mzj+3d4q+xQLq_GEYzRJA6E+CEJ9M8FQH6kL9eBZhVg@mail.gmail.com>
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

On Tue, 2025-11-18 at 15:28 -0600, Rob Herring wrote:
> On Mon, Nov 17, 2025 at 3:52=E2=80=AFPM Sander Vanheule <sander@svanheule=
.net> wrote:
> > +patternProperties:
> > +=C2=A0 "-pins$":
> > +=C2=A0=C2=A0=C2=A0 type: object
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/pinctrl/pinmux-node.yaml#
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 additionalProperties: fa=
lse

In this case dt_binding_check doesn't recognize input-debounce. The followi=
ng seems to
work for the provided example:

-    $ref: /schemas/pinctrl/pinmux-node.yaml#
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+    additionalProperties: false
=C2=A0

with this included in the led node properties:
+      input-debounce: true

If I understand correctly, "unevaluatedProperties: false" (like for the led=
s binding)
would allow everything from the referenced pincfg-node and pinmux-node sche=
mas, which is
more than is actually supported by this device.
>=20

Best,
Sander


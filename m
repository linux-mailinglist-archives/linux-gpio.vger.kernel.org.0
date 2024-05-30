Return-Path: <linux-gpio+bounces-6892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F20948D427A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 02:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FFCE286D19
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 00:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C94C14F;
	Thu, 30 May 2024 00:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="DcdFYA/Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0ECC12C;
	Thu, 30 May 2024 00:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717030105; cv=none; b=uy3KJtfeXS4o6AsR8GB3WLLYagTEDGRIPZuVy2tG3jbJgF4EYmEY4uPsToHIgt0C2KmndcteldP2/ugK94LOxX0kMhoPFgX51GqJms4x5i1tFw8fb8mX+PXG1JqDOxcdyIiWz4ISt2xiFVK6WlpiyjwrbUAl6vMM/ICtKBLCW6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717030105; c=relaxed/simple;
	bh=C0dhth9kpR94j1l7Mfkz8buHZB7swFp/TtH4qXE8Ig4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sQmNuoPzZc2seh82LfdwlT/tLaNsztUdlHwUCxw7rp3z6GLO46lcYBstCZYlZN1X55W8ojjGPwBXXYQyMkjjiLDHQNcUFNiITqICFfWjXbNIfkoR7qLbhoDfoO3uEPf/29zAYZFQzIT38t0DskgSfuknEJJ2qbYC6+zHgRm237g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=DcdFYA/Z; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A76CF2012A;
	Thu, 30 May 2024 08:48:11 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717030094;
	bh=BL3VSBZFjB9LfmhW9pMux5iQFs+tV59KattgzjY68gk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DcdFYA/ZptlfMYfcV4NO4o+KF/gifV+wKQ4sSxRqP95G0dKtp6DtmTY41Wz+SekIB
	 zftLO4U3716/mBRT/9X8IImKRWNy04vYIW+Y/0sz3vRYh5qEJqHBimFY7UOUsOIino
	 XNu+eOmv869hLH0yeykwSsFuOdcjqZ4JB7rWds0rVlB79n6pTjqTZ7pfbaisT6MI30
	 cb95f+y96/sp3CGwy7yyGJ2II3Um1HJQFjDYHLgq5sbUOZb+BUkom92ufY+eIVG11E
	 2Si31f036oeodXxYnt82tZwX+adjOU11ZohZFf9MjlQIfcU5PB9Yavnz9DK+z0353e
	 Vh5I59nlhomyg==
Message-ID: <1bcaba5063820df7fd87d887835c42e2faad9d86.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/4] dt-bindings: gpio: aspeed,sgpio: Order properties
 by DTS style
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 30 May 2024 10:18:10 +0930
In-Reply-To: <080c4c05-e795-49d8-a547-d39d10ed8333@kernel.org>
References: 
	<20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
	 <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-1-91c42976833b@codeconstruct.com.au>
	 <080c4c05-e795-49d8-a547-d39d10ed8333@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-05-29 at 09:26 +0200, Krzysztof Kozlowski wrote:
> On 29/05/2024 07:13, Andrew Jeffery wrote:
> > Tidy up the list of required properties and the example node by orderin=
g
> > the properties in terms of the DTS coding style.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> >  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 12 ++++++--=
----
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b=
/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > index 46bb121360dc..6b15a3a3fb66 100644
> > --- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > @@ -51,12 +51,12 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > -  - gpio-controller
> > -  - '#gpio-cells'
> > +  - clocks
> >    - interrupts
> >    - interrupt-controller
> > +  - gpio-controller
> > +  - '#gpio-cells'
> >    - ngpios
> > -  - clocks
> >    - bus-frequency
>=20
> No, this should have the same order as properties are listed.
>=20
> Don't change it.

Ack.

>=20
> > =20
> >  additionalProperties: false
> > @@ -65,13 +65,13 @@ examples:
> >    - |
> >      #include <dt-bindings/clock/aspeed-clock.h>
> >      sgpio: sgpio@1e780200 {
> > -        #gpio-cells =3D <2>;
> >          compatible =3D "aspeed,ast2500-sgpio";
> > -        gpio-controller;
> > -        interrupts =3D <40>;
> >          reg =3D <0x1e780200 0x0100>;
> >          clocks =3D <&syscon ASPEED_CLK_APB>;
> > +        interrupts =3D <40>;
> >          interrupt-controller;
> > +        gpio-controller;
> > +        #gpio-cells =3D <2>;
>=20
> That's just example. I don't find this change useful but churn.

Sure, I'll drop the patch.

Thanks,

Andrew


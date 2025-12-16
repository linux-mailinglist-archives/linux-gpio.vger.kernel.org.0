Return-Path: <linux-gpio+bounces-29633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74544CC49D6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 18:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DD5C30CBEB2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 17:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAF03191BF;
	Tue, 16 Dec 2025 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="HUR0c1oP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A2B2EC0A6
	for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904592; cv=none; b=t2NiJW4rG2PWklyGiPCIQpFX4XGwkZohpJf1vaRXbd+qiXEkldH3QdkMkduLbD0EhdLaNhfqOyx+xyMBTIxSQeJvRyYS6nKshBV5ehCgdE/YbBhTdqnbOnNzMVy5iHd5rS8Xz3F/S2Ts7sym8m3AmqYEqibZpeNiS8V/4ue0SNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904592; c=relaxed/simple;
	bh=F5ummgPhzVwfH3aJi4+uY671i9nGNbXpL0FkgxynloY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBJLI7+Dklbi+k6TL92DhEfMobDZBcHIULUv9oZxwaGY0023/rU5U3yoMKi1//Xk+a60YsUVlBZ2XaMB9RBTLRpeV04rNBFEjKgQJondgTIVRQkrUU8imPs29ARmGgCkdx+rViTi/rMr5qbq3OZY+8taBZ6Nj9NHIJv1cHncykw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=HUR0c1oP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64979bee42aso7092073a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 09:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904589; x=1766509389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5ummgPhzVwfH3aJi4+uY671i9nGNbXpL0FkgxynloY=;
        b=HUR0c1oP2r19YIGGQc967WfYD/smuI0IJPFKrMRJYAdsvIaZyCJkMtulHBsm50ODwb
         JauGSBBPrDXsSq6QkLWzTbFOO2IIL4lhNSXyLb8MqULUXURDfgh4GPvBYCnxfqO/uGNH
         M7T/KWr9FIkE5Oj2EjHFjl5VFswk6OifRQzQIZh7me8snBfVDzURqctiIcbpDzzWfl/X
         ALEri3nkrW2HWDbC3o0fNTuIobUwibSu89QPHCHEcc1P1KG8qKwBmI39JeSZVzimFedS
         2b5iNPv4DU/s9e6srUZGkRWZB64tCxPJenC/s7w0P87DEsXXQyZLfIfqFHTWLG0iZxY6
         DQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904589; x=1766509389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F5ummgPhzVwfH3aJi4+uY671i9nGNbXpL0FkgxynloY=;
        b=V0Wu3Wkq0E6abbsSFNf89bPB5bWV6sHcwDhleiS0GBd1D9zcb1xxtJpSuD3NFiy9xE
         Pjmz5rdd59K/IXlSBJ+RZBM2UkwrJpd6+ZAXvBGekrG+wRlrqt25Pl+GSMgsd3lgzIyQ
         eBg3aPAtDodq7SCSLpSXmx75+YWd9AzFGUnL3vUgYmdhApcEFyTz6TpWWQV4CYU9y93B
         cG5Cd4cIlGN3a5cj8Gv7Aib3NFtdcIzT/k6exsR9+klisPc7JbhgKKGdlrzrYdOubXcR
         P77+YUiFWnKbUGeiqRRSXlTvUXP+qhVkTiCVsGVlbuD7fZOaPPhNqpnatDm98T+AKzk3
         kZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSDZllXMsCeATrAnqJrhzMTiXNiRKbr+eZNV9gbRAoRIHb7oUfXlNBTU3Lc00Y5sy1292ooHxAeByL@vger.kernel.org
X-Gm-Message-State: AOJu0YzG69H/RNPxhRpl+T1MJy8GqTI73Li2iDNvN1C2o0Lb9eJHu5Gc
	yEUKNvrF51UqVuxBsO0YhAfu49MX50EYKL4M2zh5hZtsnLZfQbtOgiKdOYxMh38vvFB+eY+LTf+
	e8ORp77LKZsOYXcgdMOtucza3lRLBeTv843gCJDwtcA==
X-Gm-Gg: AY/fxX4hnMVkvLW/fBjC6KsJWFRjN89D9ha+IGQ4EsMju9MNOjvCC0Rf0G3DvN1P1p/
	L3xoZ7mVClGwWfOmROp3XMMkSvDI2BsyP4wJxFyaU0QbNVqCOLocQ8fA5bnpC8Pmztw7pwcWHdr
	ocfgL4UYcMWe6aGdJV0uj0vXrhv+TEa/sWckftVFQLD0521zMUxCEC3amfOIhn/meMQlL7wCZG5
	9jLPuIqdMOz4jFmjuOl5NJ09HappuVuIfYU5LA8+XVXDQGQoZTYJAMl/3uhHbiCGATCsnkA
X-Google-Smtp-Source: AGHT+IFN/waKvJ1dk6OhR5cf+U/bNCur64fqPTgP6eIpNT5zthYFXF01jY49UDISUGnP6m+DUwrvZmTGOhEzi55R+Mg=
X-Received: by 2002:a05:6402:1ed1:b0:647:532f:8efc with SMTP id
 4fb4d7f45d1cf-6499b31266bmr15476133a12.33.1765904588965; Tue, 16 Dec 2025
 09:03:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-3-robert.marko@sartura.hr> <d9665340-5a96-4105-88e9-ec14a715df5a@kernel.org>
In-Reply-To: <d9665340-5a96-4105-88e9-ec14a715df5a@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 18:02:57 +0100
X-Gm-Features: AQt7F2rU23EYA-TATIPjguH2zW0uOL-rOKCV2dD8OGkl08WLSt_IEutVu0MO3jw
Message-ID: <CA+HBbNF2EeP=miC9GpEm2HpPTmZAefV2fwxKjm0vHB6tj_1usQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] dt-bindings: arm: AT91: relicense to dual GPL-2.0/BSD-2-Clause
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, mwalle@kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 4:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/12/2025 17:35, Robert Marko wrote:
> > As it is preferred to have bindings dual licensed, lets relicense the A=
T91
> > bindings from GPL-2.0 only to GPL-2.0/BSD-2 Clause.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>
> You need all contributors to ack this...

I understand, all of the contributors were CC-ed.

Regards,
Robert

>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr


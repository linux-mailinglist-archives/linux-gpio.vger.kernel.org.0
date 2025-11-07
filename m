Return-Path: <linux-gpio+bounces-28244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DBAC3FAC2
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 12:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 726A73ADA4D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 11:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4C131D366;
	Fri,  7 Nov 2025 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="luiBTTBq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE20331D753
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762514053; cv=none; b=Y+xVfnsUnR5hZnk74OcACotAgX/1adxYfaYk8quXoPBxLDNRX1YoLm+XdFcHAuKKpBkIfXdM+YQru1+tHX8DULW+IRGkTdAYCW8w0XPAgcFm0Pk12eFO6QBomJEOZoIDE9jjMt8kZwHrH3QPhMwXCcUjK7uoob2y/2OblRtbyyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762514053; c=relaxed/simple;
	bh=Z7IPw5CPkkm8JcNSROY9Rb8Po+uOfMzr3L63jIIDVFM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WIh4VobSKhx2QLcbjtF0OrzwjZ10A/l7H7EFcPoJ/6feTYsSdx0wKpf1cLbTkuhXQz5Q24cIzCFEj615a2FeMhIArIXq25zAkDpaWeJeRGB1cf87/rovzyk0VD21vizTlhphH+dI+r/X+HGzPlF+rkGqesHUqoCewX01IbtY474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=luiBTTBq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640c3940649so841838a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2025 03:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762514050; x=1763118850; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z7IPw5CPkkm8JcNSROY9Rb8Po+uOfMzr3L63jIIDVFM=;
        b=luiBTTBqWyYVxLyfjIjqWhL/TJ+aTGylHamIgM1BRtHW5ij3i3o5qpvRxapwh7561R
         w4GRGBK1McbigXxWw+/q6TgbJYU/E3UViPtoXds9dTCc5575WylTzZcVG+/rCsYKnQTw
         vSrNbf1MluN1tWVqTd+CNpC9Xpf1DUXSpmjY1X34V2ZVpnn/rvI+fbAOALIfHo0hV9Bj
         9tGlvH6KP9jreduQoMZ5wtNRU45+XI/5DCPuUKvIWmRZ3xciAee9jK+MAvSR1V5b+6o4
         D+v1nPgUb9YPcDqWNcIVJy2IwY1VCKPsJUjvsVbTtGlc4HSGP5HmTFOSzLnYYT5srUiO
         Ah+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514050; x=1763118850;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7IPw5CPkkm8JcNSROY9Rb8Po+uOfMzr3L63jIIDVFM=;
        b=AZeOHVvAFUQoM/sg2j5aP+MqSgfg/7XzE5SMZB3CPWthhS3NXV8Dnto3FM8tg9pT1D
         Q+M7arkCLwyrAPPYuVYUHw2WOmAtLAfQzxucUKPmTfliEGHEcRQ9tJ2qZysWkQXMntJa
         QJjw78NYbkCmwUJ9+hYme4NrX+5FPxrOdeERbTHUohchA4KEoIU7yq4QQaH1h3BBowEb
         VDWXNh0sGn51TIrM2iW4w8uz6uwDKHUqtunZ0OjC9KTaD/cE6GmpULlBhF9EI6d9Nohq
         Ja4PpV6+cYinz5ntIxkFcqF6YurlkUyrextnoLDiLGjYsF4z4yn4KOudt3NJ7O0SF/Tp
         rcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2sn2jUeqhH8sQV6+qjbynq4wunCuaxZdIG1bY3+XmcSPO/aPj322fpM1Z/zgF9S6kA13pR78ZsNlK@vger.kernel.org
X-Gm-Message-State: AOJu0YzEcuR2MtiDL6dPuEj3egc6MwudU9FYzZAQytQ+IVO/lyIRxN73
	zkClNNG+7IJtreuXJ+VtqkzZVhlUpp4NjQYnpBzKKmxJnfJO+ykCzqwAx//bvZFb+mI=
X-Gm-Gg: ASbGncspMfOIPcLWyJnIYTm5lXzEC57cOA+gSA+EC8zr+s6eSPXseaupqNdS7wuGTJ4
	xR5scjhemwHkB6KgA0aoSvjvZsQ1dU+6okUcU1p64+WbmSb/WERW6+HNKCW+8PqzlaTfTROknWU
	OZ1zObII7tuqGunK/R8EGqGYyiQNx8I/UzSaM3gE0vYW0S3hOuLNMcxdgBlw2rwtA3r25MXQMJw
	9M6pR4dWAIA4k5tDyxWRN7pAUo4/wKHC9b4MwDjhhTJPLL581A1VBwVPsTN5Nx2bxGISjAKH5uj
	W9c8rwxBN/UxshxuLmfPCu+SiVOgka48ueP2p+aStAKnucC1ZL1qnk/+dpyNIJJ6heHrFHodk8y
	bLEaJ02KdOFGOM3fSxphRNOEgyDg6qUzsoFJ/GVoiEj3uVoRUIkElzQST2WYSMIeHx0tLVok0YQ
	gShjdGqXkLhsJ0NyTU4oJMC4gFprHBErPpBQ==
X-Google-Smtp-Source: AGHT+IFXZ+Ksq+F4K5MrYL+0Ly42CejCgVP+A4n4kcnrW9kMuuDkI5VXyfDYyP5cJO6HwQMmVPf1ww==
X-Received: by 2002:a17:907:3f28:b0:b3d:5088:213d with SMTP id a640c23a62f3a-b72c0cf643dmr254948266b.42.1762514049980;
        Fri, 07 Nov 2025 03:14:09 -0800 (PST)
Received: from [172.20.148.133] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97e457sm212986366b.43.2025.11.07.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:14:09 -0800 (PST)
Message-ID: <46b008c946e36ea0b317691356ff874c4a78882d.camel@linaro.org>
Subject: Re: [PATCH v3 04/20] regulator: dt-bindings: add s2mpg11-pmic
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Fri, 07 Nov 2025 11:14:09 +0000
In-Reply-To: <20251104-zircon-lobster-of-agility-cbcbb0@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-4-b8b96b79e058@linaro.org>
	 <20251104-zircon-lobster-of-agility-cbcbb0@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-11-04 at 10:39 +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 03, 2025 at 07:14:43PM +0000, Andr=C3=A9 Draszik wrote:
> > +=C2=A0 The S2MPG11 PMIC provides 12 buck, 1 buck-boost, and 15 LDO reg=
ulators.
> > +
> > +=C2=A0 See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.=
yaml for
> > +=C2=A0 additional information and example.
> > +
> > +definitions:
>=20
> defs:

All existing bindings are using definitions, not defs. Shouldn't this stay
consistent?

[...]

> > +patternProperties:
> > +=C2=A0 # 12 bucks
> > +=C2=A0 "^buck(([1-9]|10)s|[ad])$":
> > +=C2=A0=C2=A0=C2=A0 type: object
> > +=C2=A0=C2=A0=C2=A0 $ref: regulator.yaml#
> > +=C2=A0=C2=A0=C2=A0 unevaluatedProperties: false
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Properties for a single buck regulator.
> > +
> > +=C2=A0=C2=A0=C2=A0 allOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - $ref: "#/definitions/s2mpg11-ext-cont=
rol"
>=20
> defs
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator-ramp-delay:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum: [6250, 12500, 25000]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default: 6250
> > +
>=20
> ....
>=20
>=20
> > +=C2=A0=C2=A0=C2=A0 allOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - $ref: "#/definitions/s2mpg11-ext-cont=
rol"
> > +
> > +=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator-ramp-delay:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum: [6250, 12500]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default: 6250
> > +
> > +additionalProperties: false
>=20
> This goes to the end, after allOf, see example-schema.

Will fix.

Thanks for your review Krzysztof.

Cheers,
A.


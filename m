Return-Path: <linux-gpio+bounces-30021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD173CEC9C0
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 22:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3BB53010FF0
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 21:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FC430E84B;
	Wed, 31 Dec 2025 21:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUhkrStJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5E530E84F
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 21:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767217867; cv=none; b=S2haaKdukX6mE6a2uiSlPcj3V/mFYK3E9/WAJ9snRc9ewGjXOUKvBaJKQ+l+imxvGigHGbwF77HiqH5HVBgrmHxX67+1eTvqLgCvaqya619kYiyljMYT2te0H3YKEwtJ+dWp/AeC09dYJfD1+qj/ZEuvd1Vim6ivdzgRSy2Wzps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767217867; c=relaxed/simple;
	bh=1dgOiCMHW+Z7a4Iq31trxTmP5l0kzHmrGC9ib/clXB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mn04MLfQVGDCg5o0dKbBOZW2y6BiQe6haEwca2eArPw7zbpE1xzQbNC2DV776TgPoW5dY2Il+dIUOC58pDRaY0lRcEqPLqMEYAzAPfH5FEv7fwto6cPtGGzgh8M0X+ar9nnf3Af4SBH7eleu1ubwlnQ0aPewhM1F2EjQPPCGdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUhkrStJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58C8C2BC87
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 21:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767217866;
	bh=1dgOiCMHW+Z7a4Iq31trxTmP5l0kzHmrGC9ib/clXB4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sUhkrStJSwjGZ2XRy9OJb6HUvUKwET0l9AiU6cNZosCauIHjFKzQ1b7TOKHLwxRdc
	 b5nPDpnnlCBqd2zATN+TSwKN09UnT06oJMorI7qRZ7tPu617nyFv3V/JLc41jgAqRO
	 XU6yU5g2bc8G5DLtO5Ozd0fkI+hOKqEXLWbIojJAu9ZZq+xWNlLQtzqq3P3Qsr3p0t
	 gYJsWSrl/Xsmn9vIJo+Et94QdgZtWVQIlhq/FSVhksJkp97iiSl60ZHTNxClwhfB4M
	 GKWL2T1hvzLJoPdTS5xcn/Tl7IuVvFRWwIxokPYKkN8VdOAA4Gf3DDXugPLUC0V6Df
	 uho202+Fyh+LA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7904a401d5cso16702977b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 13:51:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCHqUBTS8oWQXJoBM29npfl6tckFeySHcOlo7aTlQfduieEYuLq4yP+Mh/ua1K+DvHoyk9E4xNGwwk@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIvH014r29dd4IKe4J75b5GUQunI0nb3ncsF5zyDjUjsjKKSx
	0dyvfBdnf2TDH5eMMNET7QliJwVbeIkZhBj+lHc+NykJvenJ5Q1us9SocZWOXPFkks8S+Tv6BnK
	IKKJ2W+En2CedHxUpF7s7bxn46DBqKEM=
X-Google-Smtp-Source: AGHT+IH29S99+HYf8SuC4lZx27OfrHABr4tetzXdccaN2xUVWn/wgVS/NlKdgLQVr0jKfoYAGzsi8EIIhZ5XvfkifzI=
X-Received: by 2002:a05:690e:1486:b0:63e:b41:cebc with SMTP id
 956f58d0204a3-6466a8395admr30714655d50.17.1767217865999; Wed, 31 Dec 2025
 13:51:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
 <20251212-dev-b4-aaeon-mcu-driver-v1-3-6bd65bc8ef12@bootlin.com> <019aa49f-fe59-488d-aff8-f07cf07ee68d@kernel.org>
In-Reply-To: <019aa49f-fe59-488d-aff8-f07cf07ee68d@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:50:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLmKL4afaOn_eka6v=j_Wu0orZMb-2NbPZgP4SM2q4V7qw@mail.gmail.com>
X-Gm-Features: AQt7F2pjZLgNxaiWJYqspkMb-XGMxgFbeL4lckn8FGNkckGZmMd1GQVA1LvpjDo
Message-ID: <CAD++jLmKL4afaOn_eka6v=j_Wu0orZMb-2NbPZgP4SM2q4V7qw@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: watchdog: Add AAEON embedded controller
 watchdog binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 9:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 12/12/2025 08:41, Thomas Perrot (Schneider Electric) wrote:
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    watchdog {
> > +      compatible =3D "aaeon,srg-imx8pl-wdt";
>
> No, that was discussed many times on the mailing list already. Fold the
> child into the parent. Your driver model really do not matter for DT.

True. For an example in Linux check how I spawn a watchdog
platform device from a timer node in:
drivers/clocksource/timer-ixp4xx.c

It's just one node in the device tree, in Linux it is in two different
subsystems but we just deal with that in code.

Yours,
Linus Walleij


Return-Path: <linux-gpio+bounces-27516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C2C00A9A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B7E6A505366
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 11:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2986630C633;
	Thu, 23 Oct 2025 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/9otqDC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BD30BF6A
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217982; cv=none; b=gqyp7NKVm9UU0iX/l1Ze7xbu9O/ZodpYEs/id4Rkb/DCgnCasycur4zU94LPIm2e/CjdVImTplLDlsDVHMTcUQYO7TrGViy+VZwRHsE7u1LAAcMcI4nhIkTYXFaHMkufkaglSMw4vXPQWckP6gafvWbc3on4MdGxMlzamKv2gf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217982; c=relaxed/simple;
	bh=VSofXPKltqSzfUAWfolhUYjZILc/jZGqF+OMoYUXiPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSJT6AnLcpZHp+8/Q9XV43vmDp1GN0ke9A6/CaQygQql8ys4Kx70hBAWDAjgmnubq7AqFk4z2PGp8AJxCQ9eZaacNz5e0SXaNWS8pD84lBTjuHP31ErVwavaKvEvBYirXBGoDIogQKCo1rSPzKKrAdxyOCtLpi/ankSzzD6pek8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/9otqDC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D08C113D0
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761217982;
	bh=VSofXPKltqSzfUAWfolhUYjZILc/jZGqF+OMoYUXiPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f/9otqDCFyr/bE8MPe6ch3MwaJ1kyi5Kq9EIZzV9+hO+1AqinNOOZIBZfpxkZRBqx
	 bptX2Z7iZb5DDWZPoMUACkW/5EdPelk3FYviPAFMHF+r1xSgv+FD44cW5wPzUX7Vyc
	 UPCAoHqzRafCo4j3+dqcrjFjn6PVF/Z7dw9lvFYJ6AmGmD8inamXBApCsgijcdvu3k
	 yXw1KqlJ3tglPWS5WMKmaV+7TnJPTBD6NZi4BjsttO4YmL8W2P0xo+qTjb1yXtETSh
	 XAnPXhkXsJd8nEoZ9xMO9tYn/xk0twYm9keODkjt+L08SGR9DeHjrO2bSqxLW2ppEq
	 Fk5NvYeEA7B8Q==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso153796666b.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 04:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVB8yTUn9apQNKdEBpl27qeMwD2E5B8q7Jz3pDBxjd1SVI/d1F8dicbtSErLsyxINfi4O74YdXrPm/@vger.kernel.org
X-Gm-Message-State: AOJu0YwnaksuKgE2z8KDsPFNXdhiTDJAYDZ7+5r9fBg/qcqvsl0bzmoS
	Z9q4dOQDqxU3B6DR2lWmMajYGBWe9DIv5uDxtHPZwleKrV7pUCGnljXPOUCh1rcH1lcI143PxZ9
	zDj4re3z1sBt6N0khcTuDbBbluq9Rig==
X-Google-Smtp-Source: AGHT+IHXTXK9Inhzp31f6w2tfR0eGiG69ffpyx6TLgXjLoQig5J/jMOVgrMAnyrlyG50AeAs4SS7Rb45JstbYWrnInk=
X-Received: by 2002:a17:907:9690:b0:b46:8bad:6970 with SMTP id
 a640c23a62f3a-b6d51c05e68mr217698766b.36.1761217981126; Thu, 23 Oct 2025
 04:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022165509.3917655-2-robh@kernel.org> <87ms5iqf5b.fsf@bootlin.com>
In-Reply-To: <87ms5iqf5b.fsf@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Oct 2025 06:12:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL+DY4j62m3_BVjC7_o9Hbx4a54UORDNBC+Pg0YAQCO+w@mail.gmail.com>
X-Gm-Features: AWmQ_bmtPaFimucwq25igSrk9S_iboFzoF-uoqSjxWerG3P5s9m5XHzlE7aUD-4
Message-ID: <CAL_JsqL+DY4j62m3_BVjC7_o9Hbx4a54UORDNBC+Pg0YAQCO+w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 1:57=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi Rob,
>
> > Convert the Marvell CP110 System Controller binding to DT schema
> > format.
> >
> > There's not any specific compatible for the whole block which is a
> > separate problem, so just the child nodes are documented. Only the
> > pinctrl and clock child nodes need to be converted as the GPIO node
> > already has a schema.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> [...]
>
> > +  "#clock-cells":
> > +    const: 2
> > +    description: >
>
> I am surprised you prefer a description to a constraint expressed with
> yaml. Yet, I am totally fine with it.

I don't, but no one has come up with a way to put constraints here and
then apply them to 'clocks' properties as appropriate.

>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks.

Rob


Return-Path: <linux-gpio+bounces-30550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A0D1F3CC
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 14:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 183663093B32
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 13:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AF32749E6;
	Wed, 14 Jan 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pqc2EcwD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABED266EE9
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768398732; cv=none; b=GmDlIpkbOm/WGKHezoXvBEnJTcOXq7CqD/wgNTUOIzbTyYoBg3C4NqZM+QFuRouTEuw3qBsb/NRvZPOGsm/en6k78lgc90/PhyCvzUr/HF7O6TUh9gIS12mIfPp/yEph9lA/NTMMUgmaYEBgtBWXlhy8h3a/00IVXXC8dYX/3uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768398732; c=relaxed/simple;
	bh=o4N5JpJTNXUU0Dc7hQeHgC2iDV+P+SrbzUWxsdpSo3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghgsTmnFGLj3XO5Af1fS6IMp/uznV1WbzI7K6Gl9JZAsWxTQLzcDV0uXgEamJx8sUy+NOR1dosJmX/zPw/Nk/aljtEN2E8wIKBXIJTDMNYR4lUKKNiDB/eYinXahAGx3Zr1LNv6TkmagIXt+ebBxEUs5wD6l1RnOYkI6Euc+738=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pqc2EcwD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB16AC4AF0B
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768398731;
	bh=o4N5JpJTNXUU0Dc7hQeHgC2iDV+P+SrbzUWxsdpSo3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pqc2EcwDie1UjUzq3h7Bv3OYukc52J0+yCS8rZwDrsJC9EIim6uQ8S21XtpCqXq7Z
	 FDT6uk7awJZSV60CsDWj5pgHIh9v8f6goRKQBEWfCnQIfI+xPrP6ZwLq00T8/DMMnB
	 Xs7BAgOnqGpZxYRGPMODZ/EzA0Bc+GyuIPFFCDDoSpQTlitt6BoO1FERCcnDNANJOG
	 vYq/pMrLO9F7npAcj4M4fV90hwUqOrYXbinuV/XuFdBI6HxhL9bNpwMhHf90royxEI
	 RVwl/TuHyMZOrO+cBN15A97bSKFOz80f+GvCyqljbuJcWsT9bRhEqalAukgJ5a7Pxl
	 pjBD6BDLC9TcA==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-646b8d2431dso7508819d50.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 05:52:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUR00kyRJcDSsM9cjTLfxfQjIX03EA+EZ3q3dBuwvx0xCMvlGK0UiYUVQUVOJMevzTR2UEZ2equ97vR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8o/Btyzym2HWZ+EHbjfpHedDawm8iY5WAfduT7g2q2QttlP5q
	LN3uCgjAuN5UgbzeZXFHyZ8MAqzW1Zg3wNU5W0yWib6aokkUkB5fP+Vk52EIhTNBBceBGqMmpQU
	UIaTHkpja2iOBrpNfRBsDZcy2/rowry0=
X-Received: by 2002:a05:690e:140f:b0:63f:bdfa:666 with SMTP id
 956f58d0204a3-64901aae935mr2397419d50.27.1768398731080; Wed, 14 Jan 2026
 05:52:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
 <20260113-mcp23s17-multiple-addr-names-v1-2-f14b60f92c82@yoseli.org>
In-Reply-To: <20260113-mcp23s17-multiple-addr-names-v1-2-f14b60f92c82@yoseli.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Jan 2026 14:52:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLmP13oeiZJx9_Y4oOCvFbJ=TaU_exHu9qqZjnCR9DGAbA@mail.gmail.com>
X-Gm-Features: AZwV_QiRtEgKAiU1dv5vzvOUpkKQqMPq253iD_8iSg8523y5Rf5h9D-1uMx6KQc
Message-ID: <CAD++jLmP13oeiZJx9_Y4oOCvFbJ=TaU_exHu9qqZjnCR9DGAbA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mcp23s08: Add multi-chip example
To: jeanmichel.hautbois@yoseli.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

thanks for your patch!

On Tue, Jan 13, 2026 at 3:29=E2=80=AFPM Jean-Michel Hautbois via B4 Relay
<devnull+jeanmichel.hautbois.yoseli.org@kernel.org> wrote:

> +  gpio-line-names: true

I have a bit of similar concerns as Krzysztof, this is unlimited.

This is actually:
- 8 for microchip,mcp23008 and microchip,mcp23s08
- 16 for microchip,mcp23017, microchip,mcp23018, microchip,mcp23s17
and microchip,mcp23s18

(The "s" variants are just the SPI variants of the same chip...)

Make some fancy - if: clauses to decide the maxItems from the compatible.
Don't hesitate to ask for help if this gets complicated, I get a panic
every time I have to deal with it because of the whitespacing business.

 +            /*
> +             * Names assigned sequentially in address order.
> +             * First 16 names for chip at address 0 (GPA0-7, GPB0-7).
> +             * Next 16 names for chip at address 1 (GPA0-7, GPB0-7).
> +             */
> +            gpio-line-names =3D
> +                "EXP0_GPA0", "EXP0_GPA1", "EXP0_GPA2", "EXP0_GPA3",
> +                "EXP0_GPA4", "EXP0_GPA5", "EXP0_GPA6", "EXP0_GPA7",
> +                "EXP0_GPB0", "EXP0_GPB1", "EXP0_GPB2", "EXP0_GPB3",
> +                "EXP0_GPB4", "EXP0_GPB5", "EXP0_GPB6", "EXP0_GPB7",
> +                "EXP1_GPA0", "EXP1_GPA1", "EXP1_GPA2", "EXP1_GPA3",
> +                "EXP1_GPA4", "EXP1_GPA5", "EXP1_GPA6", "EXP1_GPA7",
> +                "EXP1_GPB0", "EXP1_GPB1", "EXP1_GPB2", "EXP1_GPB3",
> +                "EXP1_GPB4", "EXP1_GPB5", "EXP1_GPB6", "EXP1_GPB7";

So we get this, and we already have this (from the example):

            gpiopullups: pinmux {
                pins =3D "gpio0", "gpio1", "gpio2", "gpio3",
                       "gpio4", "gpio5", "gpio6", "gpio7",
                       "gpio8", "gpio9", "gpio10", "gpio11",
                       "gpio12", "gpio13", "gpio14", "gpio15";
                bias-pull-up;
            };

This is wild, we need some constraints I think.

Whatever we come up with to limit the number of items in gpio-line-names
should also be applied to the "pins" list in the pinmux node.

Yours,
Linus Walleij


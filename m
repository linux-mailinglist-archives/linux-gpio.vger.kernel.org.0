Return-Path: <linux-gpio+bounces-13993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB8F9F6E23
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 20:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA38816B725
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 19:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A7419993B;
	Wed, 18 Dec 2024 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IK8koeV3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177D9461;
	Wed, 18 Dec 2024 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734549725; cv=none; b=YZMUEqmuwZ/XuXakEa2WMoWIeVn3YxRXU2FGJfWepqtwrhAK6ss8VEOHrt/CbqXN5aNY7rDlLXxvUHvRQZur84icNtd4+YzNoUJijxJebitziEql1yfAYNStHYKs0MmQe/Rm6te71uLRA1hqTqCFnO9jxMlOjm7Ju/7Ojfij4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734549725; c=relaxed/simple;
	bh=g0itux1y5QBN1EauPQHYKIrHS2jd8Tnwagl1kmww+ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsz8djlPbwtXRtQFR4PejlmhpGDHAcQeatJuM6dUaW3c9dJVYUX35NKuJ8c8zYWN3D2oTKL+MhkH/H6K4cU9cYfT/HwfjUi4xnmEsZJTEyJfhsHpqYH1qqVszoZvfcvICqYL1R5oSoTqw40zXQzR/wteJhU3g9tGLcj/J+tQlsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IK8koeV3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15864C4CECD;
	Wed, 18 Dec 2024 19:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734549724;
	bh=g0itux1y5QBN1EauPQHYKIrHS2jd8Tnwagl1kmww+ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IK8koeV3clK/ET6yxUTSL3nM47Lh3BYFhdqw3exKz7Vyc6bVvOkJhAPGjtb7ZfO6Y
	 3DAG6s656Jes9vNMmOlopCivkoxc480BwNdKCOqy4k2hYMmUF3aWAz9k/I7KrTs60c
	 lD5KWZ8WS0g+8pA8KMVAmT2WgqBp8LdNTfIdQRc4ejbBGVbQ9fSRxXjOMDECNGrXZT
	 MArvDOSlLXkrDS1/3cdfQ5K8rAFnbAtzvFrbDEvf2hnt5P5brPJf/yJVyY0L/KAPDJ
	 jlQkMlCziQlDUV26ws5z9NIw4Fu3r8HoXew8zpjNFRW5hUvS6K0OeXJHyh375vbCgf
	 RsTHEcYkcmLkA==
Date: Wed, 18 Dec 2024 13:22:02 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Message-ID: <20241218192202.GA2184154-robh@kernel.org>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
 <20241217115828.GA859895-robh@kernel.org>
 <TY3PR01MB11346412D98C6644E51B253BB86042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346412D98C6644E51B253BB86042@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Tue, Dec 17, 2024 at 12:33:45PM +0000, Biju Das wrote:
> Hi Rob,
> 
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: 17 December 2024 11:58
> > Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
> > 
> > On Mon, Dec 16, 2024 at 07:53:11PM +0000, Biju Das wrote:
> > > RZ/V2H has ports P0-P9 and PA-PB. Add support for defining
> > > alpha-numerical ports in DT using RZV2H_* macros.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v3->v4:
> > >  * Added new header file with separate RZV2H_P* definitions.
> > > v3:
> > >  * New patch.
> > > ---
> > >  .../pinctrl/renesas,r9a09g057-pinctrl.h       | 31 +++++++++++++++++++
> > >  1 file changed, 31 insertions(+)
> > >  create mode 100644
> > > include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> > >
> > > diff --git a/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> > > b/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> > > new file mode 100644
> > > index 000000000000..9008a7e71609
> > > --- /dev/null
> > > +++ b/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> > > @@ -0,0 +1,31 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +/*
> > > + * This header provides constants for Renesas RZ/V2H family pinctrl bindings.
> > > + *
> > > + * Copyright (C) 2024 Renesas Electronics Corp.
> > > + *
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_RZV2H_PINCTRL_H #define
> > > +__DT_BINDINGS_RZV2H_PINCTRL_H
> > > +
> > > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > > +
> > > +/* RZV2H_Px = Offset address of PFC_P_mn  - 0x20 */
> > > +#define RZV2H_P0	0
> > > +#define RZV2H_P1	1
> > > +#define RZV2H_P2	2
> > > +#define RZV2H_P3	3
> > > +#define RZV2H_P4	4
> > > +#define RZV2H_P5	5
> > > +#define RZV2H_P6	6
> > > +#define RZV2H_P7	7
> > > +#define RZV2H_P8	8
> > > +#define RZV2H_P9	9
> > > +#define RZV2H_PA	10
> > > +#define RZV2H_PB	11
> > 
> > I'm not a fan of defines which are just 'FOO_n n'. And these are if you speak hex.
> 
> For RZ/V2H, ports are P{0..9} and P{A..B}, the port name are with in hexa decimal range
> 
> whereas for RZ/G3E SoC,
> 
> Ports are P{0..8},P{A..H},P{J..M},PS
> 
> RZ/V2H and RZ/G3E are similar SoCs.
> 
> > 
> > > +
> > > +#define RZV2H_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZV2H_P##b, p, f)
> > > +#define RZV2H_GPIO(port, pin)		RZG2L_GPIO(RZV2H_P##port, pin)
> > 
> > So the user does RZV2H_GPIO(A, 123) instead of RZV2H_GPIO(0xA, 123)? Not sure the bounds checking the
> > port is worth it. pin or function can still be crap.
> 
> Previously we were using plain number in DT for RZ/V2H, RZG2L_GPIO(10, pin) = RZG2L_GPIO(0xA, pin)
> The port names for RZ/G2L are plane number, whereas for RZ/G3E and RZ/V2H it's alpha numeric.
> 
> Since RZ/V2H ports are within the hexadecimal range, maybe this header file can be dropped
> at least for RZ/V2H??
> 
> Any way we are doing bounds check in driver.

If you are doing it elsewhere, then I guess it is fine for some 
consistency.

Rob


Return-Path: <linux-gpio+bounces-25059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 431FEB39EE2
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 15:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A8291C26A23
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4180A3128A4;
	Thu, 28 Aug 2025 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swzObivg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62A13126C7;
	Thu, 28 Aug 2025 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387727; cv=none; b=i5AKNQN02GTnxqavsnK+yL/8rspj7f5Tciptw1y/gqBggEM1M4saaqLX8Pc4pnP5EhJwn4aFcjc8VMKQFCYZdsocLSOu8TBe/uFyyTmaVpX2xtD13mErrVwq3iGlZ+kyoIDovOhhv/jbPGQ8+L1xIXZZNNWBaB/UDwcKhebflj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387727; c=relaxed/simple;
	bh=DfHHBD/rVjjrqh5NmASHX+RFHIrOFeXwQ0K0sXIKM0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rhg+h0+HrshOQSzoPAcuUXzkdxkrok0FehnpXlhvGanR2rHDHMqnpCnbNTlhXGcH9sFscqAIsQxvuCeq9ez7y4XjjUGvzhTE9CJicEPzyYAw67nbw5TjH+a9D6lubzgXZk2g83hRYJH22KlYqRxzRHvTX8F3aOLb3MxBLGDxkbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swzObivg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7455AC4CEF6;
	Thu, 28 Aug 2025 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756387727;
	bh=DfHHBD/rVjjrqh5NmASHX+RFHIrOFeXwQ0K0sXIKM0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=swzObivgRxQ1txTRZOLUVqeNZa30HWFK/E0loDw51gF1fYkBfgiRHVViLErwUbGe4
	 tah2ih40TeRH5TbGU+fURSCilcEw5fk41YCdMnlDI0U8Jpcam/U9UCHfEqIlzTGREW
	 3v8+EbjwRBduKZzUn/PyAKWN2kLXYqbKyQfbp9ISsuVdl/eaB8rluloH/3teYGMe9n
	 1e1sURGOAzbO/5ASZVMVH+OAr/GiWXRBcnKRsUM+V9W0D76ONMZAfLCyV8izrF7hEP
	 yvMMk0HtP087rudOTF4ljFhubq3lh0QsfCPEzSJt5qPximNFO9taD7TmHaRgKixx41
	 FqYxNmc/mB/Mw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb6856dfbso177681966b.1;
        Thu, 28 Aug 2025 06:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUD3lXzQswU50K18Rq7taLEsEFK8CJynBslgO8harZcr4k7ic02WVCthwOnbos0CkHheURNy7IZLWESX0gk@vger.kernel.org, AJvYcCVvaaPEmNYwDL338240en4ewfghfPF3m+y//G8dlKE7xvEaBOmF1XcRK3GMy/TeqS2lMtABYQwCDFs3YA==@vger.kernel.org, AJvYcCVxekRMzinIDJMiHG6tzr6ibr9CGXKEy+L9gyTN+FJia4P13BAVoPHoHkVhudv8M3AqZRzAZ/ZsR4Yo@vger.kernel.org
X-Gm-Message-State: AOJu0YzvU+noegVizUZeCEb72L7E4b7M109eaxZ0dHfL/oMXjrkDKxUE
	7UR9v0RcBTTLltsXegWh1OwUZJ36f1hQP6EhsqkqrV7WfCq7eVNIkIA04nSybXpF5DRLGuAi3t7
	kbEvLsmxtOjh/b9ZTTtLeJInV8Jl1wA==
X-Google-Smtp-Source: AGHT+IFgWx3EjxiuyoE9wirR/dDT7Hm9AlZ1rldwPD7NWFyqMumFqslPy2Yia23VX1xN9hg0OQGKXYTedeYDgzaTElM=
X-Received: by 2002:a17:907:1c1c:b0:af9:a381:aee1 with SMTP id
 a640c23a62f3a-afeafecae85mr812402766b.0.1756387726034; Thu, 28 Aug 2025
 06:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756104334.git.christophe.leroy@csgroup.eu> <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
In-Reply-To: <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Thu, 28 Aug 2025 08:28:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
X-Gm-Features: Ac12FXxDhqNf1LWnckP7L04gabZFe5TqvyzgYXr11IYk9xaITt-kXXAUX9A3-yw
Message-ID: <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 2:20=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.

Why do you need to know this? The ones that have interrupts will be
referenced by an 'interrupts' property somewhere.

> Here is an exemple for port B of mpc8323 which has IRQs for

typo

> GPIOs PB7, PB9, PB25 and PB27.
>
>         qe_pio_b: gpio-controller@1418 {
>                 compatible =3D "fsl,mpc8323-qe-pario-bank";
>                 reg =3D <0x1418 0x18>;
>                 interrupts =3D <4 5 6 7>;
>                 interrupt-parent =3D <&qepic>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 fsl,qe-gpio-irq-mask =3D <0x01400050>;
>         };

You are missing #interrupt-cells and interrupt-controller properties.

With multiple new properties, this should be converted to schema first.

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.t=
xt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> index 09b1b05fa677..829fe9a3d70c 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> @@ -32,6 +32,15 @@ Required properties:
>    "fsl,mpc8323-qe-pario-bank".
>  - reg : offset to the register set and its length.
>  - gpio-controller : node to identify gpio controllers.
> +Optional properties:
> +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item=
 tells
> +  which ports have an associated interrupt (ports are listed in the same=
 order
> +  as in QE ports registers)
> +- interrupts : This property provides the list of interrupt for each GPI=
O having
> +  one as described by the fsl,cpm1-gpio-irq-mask property. There should =
be as
> +  many interrupts as number of ones in the mask property. The first inte=
rrupt in
> +  the list corresponds to the most significant bit of the mask.
> +- interrupt-parent : Parent for the above interrupt property.
>
>  Example:
>         qe_pio_a: gpio-controller@1400 {
> @@ -42,6 +51,16 @@ Example:
>                 gpio-controller;
>           };
>
> +       qe_pio_b: gpio-controller@1418 {
> +               #gpio-cells =3D <2>;
> +               compatible =3D "fsl,mpc8323-qe-pario-bank";
> +               reg =3D <0x1418 0x18>;
> +               interrupts =3D <4 5 6 7>;
> +               fsl,qe-gpio-irq-mask =3D <0x01400050>;
> +               interrupt-parent =3D <&qepic>;
> +               gpio-controller;
> +         };
> +
>         qe_pio_e: gpio-controller@1460 {
>                 #gpio-cells =3D <2>;
>                 compatible =3D "fsl,mpc8360-qe-pario-bank",
> --
> 2.49.0
>


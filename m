Return-Path: <linux-gpio+bounces-19487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C7AA43C0
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 09:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6984D3B8394
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 07:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58041F76A5;
	Wed, 30 Apr 2025 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkrydZAB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9A91DFE09;
	Wed, 30 Apr 2025 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745997666; cv=none; b=e3ozFCShaKLA7tqDHtZ7mwH4bOiBrl3AQ0O1Xokx6iwOPUzTD0ZMuBV7wPZnLwPzt5HkgFdgkR93GQ0nMguep83ukBTRKe33Guozs61FfIFSnCT/5mVZI1OcbBQHzqE61Hr+w9TBf4sjuthDmsp7OtXsocrJ4OSA/UWiWKql7uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745997666; c=relaxed/simple;
	bh=unOAuHHlLSDYswEV053BVvtCpbY1HBhf14HMlI/dclI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6pVqYgClQ3ARNDUtE8JCeklHpd1YkHtNpxR+Zn1+G4IY4zZzu7chYjjyH8A6ksvDZypYgwq4WhYlSf/4U+7bnAcdBrT4wFUOv8G+NByIIk67m/TqERQIAygIsi32J8QOeEMiCxuwJt3rT1vOsT92bGBgh1zAZsz6BbkvT+8arA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkrydZAB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A350C4CEE9;
	Wed, 30 Apr 2025 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745997665;
	bh=unOAuHHlLSDYswEV053BVvtCpbY1HBhf14HMlI/dclI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkrydZABVN2h5znRN4UMWCuCuzR39Wj/6N5lYPSOxVD7PLIr07qGDVz8B0ddsauDn
	 vfcrkOHyrCDAeShx323/3z12fMsEJYRLoD2ptrbyW3ehqtigC5WsVV1nhvntJ8jRLZ
	 Lh0YYIkTB1kdvTyvsUAoz0eeV5J5IPQKcejy2iqxEPEy5NKYq//DwhSkzhvnsHrDfy
	 pGPHAcAa1IkB0NKxjhTtXw/C5R/B0w3LU2AMcVAYguYI3IHs+ZzzSsvFqUCTlJMlqd
	 CaL/3ZH7gVg/ZWS+3AyTHReOJ2CTKlJw1+8FIlD/wpG8CkftZBTQv9KcSrHAkIy2ZS
	 Lr4N3qNmn2kXA==
Date: Wed, 30 Apr 2025 09:21:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
Message-ID: <20250430-vagabond-agile-yak-7afe68@kuoka>
References: <20250424062017.652969-1-uwu@icenowy.me>
 <20250424062017.652969-2-uwu@icenowy.me>
 <20250428-smiling-azure-sunfish-7c1c25@kuoka>
 <34c92033f4bbf289c6048a85f0f6ba04435e7bf8.camel@icenowy.me>
 <8e131fce-12b6-4a5f-8601-c15a0e4290fe@kernel.org>
 <4d0bf5b8e1dd00f4025b7643a746cd99010c08fc.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4d0bf5b8e1dd00f4025b7643a746cd99010c08fc.camel@icenowy.me>

On Tue, Apr 29, 2025 at 05:00:04PM GMT, Icenowy Zheng wrote:
> > > > > +/* virtual pins for forcing GPI */
> > > > > +#define PAD_INTERNAL_LOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0254
> > > > > +#define PAD_INTERNAL_HIGH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0255
> > > >=20
> > > > Why this cannot be 20 and 21? These are not values for registers,
> > > > but
> > > > abstract numbers.
> > >=20
> > > The number must not collide with SYS GPIO pads too.
> >=20
> > There are no SYS GPIO pads here. Do you understand that this is not
> > value for registers?
>=20
> Yes I understand.
>=20
> The situation is that JH7110 has two similar pin mux controllers, one
> SYSGPIO and one AONGPIO. Despite I listed the values after the AONGPIO
> pad list, these values should apply to SYSGPIO too (unless you want to
> let them have different values for these two pinmux controllers), which
> is the part with comment "sys_iomux pins".

It is fine for me in such case.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



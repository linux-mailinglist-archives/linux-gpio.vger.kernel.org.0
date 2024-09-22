Return-Path: <linux-gpio+bounces-10349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5BE97E398
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 23:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 061DCB20D7B
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 21:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4F7745CB;
	Sun, 22 Sep 2024 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Va1pjudg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F96EEDB;
	Sun, 22 Sep 2024 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727039066; cv=none; b=VTo9cEQKqxzaZJe7xHnNntl6Oxqb+REskpiz0zun5UzRfS8cDj67SiDQKEzTsOELHakVkhYFWWZOgy68MO65HHcH/YIBTZ8aMm6jLyebI5g0pGe1N6dVmYEg4ZYH6aJLigA9mzgn68rHoHLTgEaqWjCXBI1CqT+/KAReb9UMUDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727039066; c=relaxed/simple;
	bh=3UZwWZ/k8yycOfVfCgYu9zo+m7c/YEuQ6FtR8R0xTh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsVSkffS9sduWLdVtynwC8GqSU0rpH+tHoSQt50kCA3B6oHGyD2/3WtysbmwadOBsKXRD7sXF7FgnfJYNWtprKU9uSEsRvFodH05ptSMZLTg1un/US+l36/bNaxA4NRhWf4meyTcYoWDtu2sTqToZDT1lpbcbhHKXcYsEifZ9JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Va1pjudg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB66C4CEC4;
	Sun, 22 Sep 2024 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727039065;
	bh=3UZwWZ/k8yycOfVfCgYu9zo+m7c/YEuQ6FtR8R0xTh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Va1pjudgIYjoEoPXeHt2pN9mwSb5dki3yKACWIFNnwd3m9XsizclebNpSMogJLvkG
	 ZcXuGuODPk6IkjL1wEOHRQZSPqIiQCt21qN8nrRTqbcBu0RjmOvOz3RsvnxDzeONwe
	 dLj/vB1Rhtv3eBDsSQJXa3IvNbkc6A5zJwzj8VyLvoEp8wpOfs+HQ5d4zLQxy7Y6Xf
	 2WQQ9Kzm+uWSIbu9daAC79Tx/oyh27LDr92D+yBr+h9fkgHsqEREBfJDGD56RJnLSG
	 uEaE2d0oXy144dPVNpyi1whBZB+kgMyLPJloQLWSh7zibNB29p6wkV5WKsATKfR48p
	 BwHuKGGBEWBoA==
Date: Sun, 22 Sep 2024 23:04:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs
Message-ID: <e6u3kui5md4km5xvjzlq5cfgwvtb73c763uep4j5ysaokmmucr@gz5nxiebg7gu>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
 <20240920-reapply-amusement-a37cf13fd910@squawk>
 <16950e81-e0ef-4e7c-b0ef-4f56415dceed@oss.nxp.com>
 <bd5a2d24-164c-4707-a5fd-6584e444ee0b@kernel.org>
 <20240921-party-glass-bfb7099c7ded@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240921-party-glass-bfb7099c7ded@spud>

On Sat, Sep 21, 2024 at 10:58:46PM +0100, Conor Dooley wrote:
> On Fri, Sep 20, 2024 at 03:40:31PM +0200, Krzysztof Kozlowski wrote:
> > On 20/09/2024 15:33, Andrei Stefanescu wrote:
> > > Hi Conor,
> > > 
> > > Thank you for your review!
> > > 
> > > On 20/09/2024 15:46, Conor Dooley wrote:
> > >> On Thu, Sep 19, 2024 at 04:47:22PM +0300, Andrei Stefanescu wrote:
> > >>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
> > >>>
> > >>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> > >>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > >>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > >>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> > >>> ---
> > >>>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 107 ++++++++++++++++++
> > >>>  1 file changed, 107 insertions(+)
> > >>>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> > >>> new file mode 100644
> > >>> index 000000000000..0548028e6745
> > >>> --- /dev/null
> > >>> +++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> > >>> @@ -0,0 +1,107 @@
> > >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> > >>> +# Copyright 2024 NXP
> > >>> +%YAML 1.2
> > >>> +---
> > >>> +$id: http://devicetree.org/schemas/gpio/nxp,s32g2-siul2-gpio.yaml#
> > >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>> +
> > >>> +title: NXP S32G2 SIUL2 GPIO controller
> > >>> +
> > >>> +maintainers:
> > >>> +  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > >>> +  - Larisa Grigore <larisa.grigore@nxp.com>
> > >>> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> > >>> +
> > >>> +description:
> > >>> +  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
> > >>> +  chips. It includes an IRQ controller for all pins which have
> > >>> +  an EIRQ associated.
> > >>> +
> > >>> +properties:
> > >>> +  compatible:
> > >>> +    items:
> > >>> +      - const: nxp,s32g2-siul2-gpio
> > >>
> > >> Commit message and binding description say s32g2 and s32g3, but there's
> > >> only a compatible here for g2.
> > > 
> > > Yes, the SIUL2 GPIO hardware is the same for both S32G2 and S32G3 SoCs. I plan
> > > to reuse the same compatible when I add the SIUL2 GPIO device tree node for
> > > the S32G3 boards. Would that be ok?
> > 
> > There are only few exceptions where re-using compatible is allowed. Was
> > S32G on them? Please consult existing practice/maintainers and past reviews.

Just in case this was not clear - comment "please consult existing..."
was towards Andrei, not you Conor.

> 
> Pretty sure I had a similar conversation about another peripheral on
> these devices, and it was established that these are not different fusings
> etc, but rather are independent SoCs that reuse an IP core. Given that,
> I'd expect to see a fallback compatible used here, as is the norm.

Yep.

Best regards,
Krzysztof



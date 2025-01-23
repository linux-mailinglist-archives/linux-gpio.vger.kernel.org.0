Return-Path: <linux-gpio+bounces-15035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4BBA1A2F7
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 12:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78D107A2F57
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 11:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAA220E314;
	Thu, 23 Jan 2025 11:30:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1C20CCF7;
	Thu, 23 Jan 2025 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631850; cv=none; b=e0urk2lFfPC5LtFayGDu/051q2rdHRsTQvQj885oXg+39qT9zlQ4+n4okMkuipRbY2rqGahuj6hQIOVBTpS7XasQ1Sqs3LT1ReFTaSTcdFn0Udzl+SKh14TCRbvxXk30qUYzPsm9nGB//O1eylnVBIPUs8gtTrlvFGuPFUPT78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631850; c=relaxed/simple;
	bh=QXN45v3zlJ4Zmrk+cA8n8eududQA1Tin/vmIgvLpvc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbbDTyg2WyeCQVhM2CNP/tOF0DXR9ir7Kkk35KMd12TD2NUFDCBqwpKE8mGmpGuFufwkEp1LTg/GvUpCeouM9EnvmSmH59D+7LNPIebUV8aQd0h6e+ekko7GBRwRDTndUnqvvTjThjU0Bo2TzOVi1NgqBFgxNIBCCPqawVvUeOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.60.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3E44E3434F4;
	Thu, 23 Jan 2025 11:30:46 +0000 (UTC)
Date: Thu, 23 Jan 2025 11:30:42 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Olof Johansson <olof@lixom.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20250123113042-GYA38135@gentoo>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
 <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>

Hi Olof:
 thanks for your reivew

On 12:03 Wed 22 Jan     , Olof Johansson wrote:
> Hi,
> 
> On Tue, Jan 21, 2025 at 11:38:11AM +0800, Yixun Lan wrote:
> > The GPIO controller of K1 support basic functions as input/output,
> > all pins can be used as interrupt which route to one IRQ line,
> > trigger type can be select between rising edge, failing edge, or both.
> > There are four GPIO ports, each consisting of 32 pins.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 116 +++++++++++++++++++++
> >  1 file changed, 116 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..dd9459061aecfcba84e6a3c5052fbcddf6c61150
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > @@ -0,0 +1,116 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K1 GPIO controller
> > +
> > +maintainers:
> > +  - Yixun Lan <dlan@gentoo.org>
> > +
> > +description:
> > +  The controller's registers are organized as sets of eight 32-bit
> > +  registers with each set of port controlling 32 pins.  A single
> > +  interrupt line is shared for all of the pins by the controller.
> > +  Each port will be represented as child nodes with the generic
> > +  GPIO-controller properties in this bindings file.
> 
> There's only one interrupt line for all ports, but you have a binding that
> duplicates them for every set of ports. That seems overly complicated,
> doesn't it? They'd all bind the same handler, so there's no benefit in
> providing the flexibility,.
> 
yes, all ports share same interrupt line, but each port has its own
irq related handling register, so it make sense to describe as per gpio irqchip

also see comments below

> > +properties:
> > +  $nodename:
> > +    pattern: "^gpio@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    const: spacemit,k1-gpio
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^gpio-port@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: spacemit,k1-gpio-port
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      gpio-controller: true
> > +
> > +      "#gpio-cells":
> > +        const: 2
> > +
> > +      gpio-ranges: true
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      interrupt-controller: true
> > +
> > +      "#interrupt-cells":
> > +        const: 2
> > +        description:
> > +          The first cell is the GPIO number, the second should specify interrupt
> > +          flag. The controller does not support level interrupts, so flags of
> > +          IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> > +          Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
> 
> Same here, since there's no real flexibility between the banks, it might
> make sense to consider a 3-cell GPIO specifier instead, and having
how to handle the fourth gpio port? I would like to have uniform driver for all ports

> the first cell indicate bank. I could see this argument go in either
> direction, but I'm not sure I understand why to provide a gpio-controller
> per bank.
> 

IIUC, your suggestion here was same as the implementation of patch v3 of this driver[1],
 while combining all four ports into one irqchip, which NACKed by maintainer[2].
 I tend to agree having a gpio-controller per bank provide more flexibility,
 easy to leverage generic gpio framework, even each port can be disabled or enabled,
 and IMO having shared irq handler isn't really a problem..

[1] https://lore.kernel.org/r/20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org
[2] https://lore.kernel.org/r/CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com
https://lore.kernel.org/r/CACRpkdYgGho=VQabonq4HccEiXBH2qM76K45oDaV1Jyi0xZ-YA@mail.gmail.com


> Comparing to say Rockchip, where each bank has a separate interrupt line
> -- so there the granularity makes sense.
> 
> 
> -Olof

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55


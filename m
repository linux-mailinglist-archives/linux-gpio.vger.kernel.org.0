Return-Path: <linux-gpio+bounces-24461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D7B28F53
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 18:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131B01CC398C
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 16:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AC628D85D;
	Sat, 16 Aug 2025 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IELA6aiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FFB5464D;
	Sat, 16 Aug 2025 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755360496; cv=none; b=ST4sozP6MGxYBl6MpSdk90t1VchmGxAzk4V2ijHa47ny2iYQympwOCbqaR8etizmGCXqNU2m06MCQkytY+ntDeydSGQVO6qDEpRiOGJS6bDXaI7o2Vm0IjUx14z87U3OkoCHFv2k1BRCZBNZW6lMo5qq8H4HvXNg6un9uwqMnto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755360496; c=relaxed/simple;
	bh=oSXu/5bEZ9WlhAtEdxk5ZZ6vNoMPX9phFwiUWWadqvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuEO3i1KTPxsyJKb5YzBVkH1Pops08+xJs/pjmJ/66VRkRxpW3Cph2XipEWknM4AOpUamCy8REoJ3Cq05MIUFP4zCimbGidQ6INqk9uJkrOg6DbnlvGz8nfekBPDaim6ujTrSdOupWZoDk86471GXrrWq1jJYL/y4lbRQE8AlNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IELA6aiB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C1B8222B44;
	Sat, 16 Aug 2025 18:08:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vBCi2Do4UOV; Sat, 16 Aug 2025 18:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755360492; bh=oSXu/5bEZ9WlhAtEdxk5ZZ6vNoMPX9phFwiUWWadqvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IELA6aiBcm3HMTEUydHZCrrPcJ5NtlDuORsKQvVPYYeJjH5ERsS3B9sWzjEst/oGs
	 1f7rjUNwvmmBAcmdGlRABwGCfndD6JWwoDCeQLfpdFWULZU/nplHbkOKtHnnGQLNTC
	 P27gDeRs0VjlultmUXco9VyHHM8NIe0tBVQwBgx6EeWk9jJFoKOrQdv+J5oZtQ5Xmx
	 HTf0BtDZ1Zj6LHB/TxzRV4exQTFZ3TisVihCgOVV4rcHaiahs9XfsyFajcSJfxt7Mz
	 Vh4l9Anys9IYCR+CR/eKm8trWct8WGU4WHp50ZOWmC8QtfPq9XhWzVJSmmyUVw94ge
	 EyEmtR/hAYOqA==
Date: Sat, 16 Aug 2025 16:07:54 +0000
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: loongson: Document GPIO
 controller of 2K0300 SoC
Message-ID: <aKCs2jUcYxYHWIB2@pie>
References: <20250816035027.11727-2-ziyao@disroot.org>
 <20250816035027.11727-3-ziyao@disroot.org>
 <CAAhV-H5ZQQpHS_b9UL8UNgX9MH8-i4DV8bid00vEDzg76rgebw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H5ZQQpHS_b9UL8UNgX9MH8-i4DV8bid00vEDzg76rgebw@mail.gmail.com>

On Sat, Aug 16, 2025 at 10:18:57PM +0800, Huacai Chen wrote:
> On Sat, Aug 16, 2025 at 11:51 AM Yao Zi <ziyao@disroot.org> wrote:
> >
> > Loongson 2K0300 ships a GPIO controller whose input/output control logic
> > is similar to previous generation of SoCs. Additionally, it acts as an
> > interrupt-controller supporting both level and edge interrupts and has a
> > distinct reset signal.
> >
> > Describe its compatible in devicetree. We enlarge the maximum value of
> > ngpios to 128, since the controller technically supports at most 128
> > pins, although only 106 are routed out of the package. Properties for
> > interrupt-controllers and resets are introduced and limited as 2K0300
> > only.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../bindings/gpio/loongson,ls-gpio.yaml       | 28 ++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> > index b68159600e2b..69852444df23 100644
> > --- a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> > @@ -14,6 +14,7 @@ properties:
> >      oneOf:
> >        - enum:
> >            - loongson,ls2k-gpio
> > +          - loongson,ls2k0300-gpio
> >            - loongson,ls2k0500-gpio0
> >            - loongson,ls2k0500-gpio1
> >            - loongson,ls2k2000-gpio0
> > @@ -36,7 +37,7 @@ properties:
> >
> >    ngpios:
> >      minimum: 1
> > -    maximum: 64
> > +    maximum: 128
> >
> >    "#gpio-cells":
> >      const: 2
> > @@ -49,6 +50,14 @@ properties:
> >      minItems: 1
> >      maxItems: 64
> >
> > +  "#interrupt-cells":
> > +    const: 2
> > +
> > +  interrupt-controller: true
> ls2k300 supports interrupt-controller while others don't?

For these SoCs' GPIO controllers (I didn't carefully check 3A{5,6}00 and
7A{1,2}00), there're three different cases,

1. Controller of 2K0500, 2K1000:

   These controllers have only interrupt enable bits for each GPIO.
   Interrupts are routed directly to the parent interrupt controller and
   there're multiple pins share the same interrupt in the parent, e.g.,
   GPIO 0-31 share interrupt 26 of the second liointc on 2K0500.

   Since we have neither an interrupt status register nor interrupt ack
   bits, it's hard to tell which GPIO line is triggering the interrupt.
   And we even cannot configure the polarity/edge for triggering
   interrupts, thus I don't think these GPIO controller should be
   described as interrupt controllers.

   For these controllers, gpio-loongson-64bit.c implements GPIO
   controller's .to_irq() method which translates GPIO descriptor to
   corresponding IRQ number. This should work as long as there's at most
   one interrupt consumer for each group of GPIOs that share the same
   parent interrupt line.

2. Node controller of 2K1500 and 2K2000:

   These SoCs have GPIO controllers directly attached to the "node" (I
   think it means the CPU core, but am not sure). These controllers are
   similar to the first class, but they have an additional feature that
   the polarity for triggering interrupts could be configured.

   Still we couldn't precisely tell which GPIO line is triggering the
   interrupt, thus it's hard to implement it as a fully-functional
   irqchip, either. But if we don't do so, I cannot come up with a way
   to describe the polarity settings. I'm unsure whether these
   controllers should be implemented as interrupt controllers.

3. South-bridge controller of 2K1500 and 2K2000, and 2K0300's
   controller:

   Reading through the public TRM, I'm sure these're all fully
   functional interrupt controllers, and should be implemented as
   interrupt controllers.

   However, this also means the current binding for 2K1500/2K2000's
   south-bridge controller is WRONG, and a fix it seems to bring in ABI
   breakages (interrupt-controller/interrupt-cells are a must). But
   since I don't have these devices on hand, and they are at least not
   related to the situation of 2K0300, I decided to keep them as-is.

So the answer to the original question is, no, at least 2K1500/2K2000's
south-bridge GPIO controllers are also interrupt controllers according
to their public documentation. But I cannot test my GPIO changes against
them since I don't have such boards, and fixing the binding up may break
the ABI, thus I leave them as-is in this "support for 2K0300" series.

> Huacai

Best regards,
Yao Zi

> > +
> > +  resets:
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -58,6 +67,23 @@ required:
> >    - gpio-ranges
> >    - interrupts
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: loongson,ls2k0300-gpio
> > +    then:
> > +      required:
> > +        - "#interrupt-cells"
> > +        - interrupt-controller
> > +        - resets
> > +    else:
> > +      properties:
> > +        "#interrupts-cells": false
> > +        interrupt-controller: false
> > +        resets: false
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.50.1
> >


Return-Path: <linux-gpio+bounces-25333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F8DB3E80C
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 16:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9C31A8628A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B09D340DA2;
	Mon,  1 Sep 2025 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fm+Y8Lvq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB18F2F1FFE;
	Mon,  1 Sep 2025 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738760; cv=none; b=TBr4x9+AEgWtFOTGB8VH131VcEosh8Bw3/7i4GjAkwRmFgvrODJuPr9y3/HenpfxfOCTarZldb6JX0ZUYkRyaSXgpRkI9Liza7hSD3BQ5G5T9207Hhwse2rElsL19hlWhVI/rfduSfN+cmj7xrARQFAaf1ZhrQhqNBgOvYQGiuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738760; c=relaxed/simple;
	bh=/ycGbSkHOxuM3sRpgIzjfmP2guQFUiYSHp1rOlm+S1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8l7d0jYmglAtfQSw2J13uZME/L9vnABIcq8quVcBE+NwW/pRRPxuAg+b2dWmwbtiHE3BMDMchdxh1HzUo0JLBEYg9N+dC2SStwemkgZ9VFHqd4kX84PRkQS4/HR8fGdJde635N4fFALIE64c4hv4KYzJ/lPXq3MssVypuDIvsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fm+Y8Lvq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 101BD20075;
	Mon,  1 Sep 2025 16:59:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pSPqeFkcKwx; Mon,  1 Sep 2025 16:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756738753; bh=/ycGbSkHOxuM3sRpgIzjfmP2guQFUiYSHp1rOlm+S1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fm+Y8Lvqwnsy2ZfpOBdDIqmHULGETv1XwNudZrjHhxIfFKPL6HqEvsqa6zaD7hKGV
	 +paBqu6mmz/3GqB5nG5uHRZFKpOkhEFUTGdr2emzHgPinga9yhdW0NvTVM/3NgyBCq
	 SuazwKJnitM3II1GO5jCJcrReWiZn+hMK+aBKHCJlqsyFAps44/AzjTs5B9eZ0NOdE
	 5F6dvpXk6fCVkkIqc2qfBE9SW9LEK6YkoqLtjWt83xDoqWaXviejWPEy0o5ao9DsAP
	 mnpW+AD9ji/ivwhCYocWk4HTLEnY+o/FDiucqFsBsJKub0ko2eQvZA/4rJ371vJPXu
	 nH2qzkGDIs4zg==
Date: Mon, 1 Sep 2025 14:58:54 +0000
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
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: loongson: Document GPIO
 controller of 2K0300 SoC
Message-ID: <aLW0rgvKno3zpXDi@pie>
References: <20250901133804.38433-1-ziyao@disroot.org>
 <20250901133804.38433-2-ziyao@disroot.org>
 <CAAhV-H5odi479mTr0zmDnX1WF2AmJRXTL34_ts2VCM-g6N7bjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H5odi479mTr0zmDnX1WF2AmJRXTL34_ts2VCM-g6N7bjA@mail.gmail.com>

On Mon, Sep 01, 2025 at 10:22:04PM +0800, Huacai Chen wrote:
> Hi, Yao,
> 
> On Mon, Sep 1, 2025 at 9:38 PM Yao Zi <ziyao@disroot.org> wrote:
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
> Replace the full name with "Loongson-2K0300" and short name with
> "LS2K0300", others look good to me.
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

I don't understand what is improved with this. For the fullname, I don't
see any difference between "Loongson 2K0300" and "Loongson-2K0300". And
for the short one, omitting the "LS" prefix doesn't introduce any
ambiguity, either.

I did a quick search through git log, and found many commits for Loongson
2K SoCs do include a hyphen for the fullname and "LS" prefix for
abbreviation in messages, while some merge commits don't do so.

Even the official production page for Loongson 2K0300 refers to it
without a hyphen[1]. Thus I cannot find out of the point of rewording...

> Loongson 2K0300 is a multi-function SoC build upon the LA264 processor
> core, ...

I'll appreciate and adapt it if you could explain why the change is
necessary. Thanks for your patience.

Best regards,
Yao Zi

[1]: https://loongson.cn/EN/product/show?id=35

> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
> >
> 


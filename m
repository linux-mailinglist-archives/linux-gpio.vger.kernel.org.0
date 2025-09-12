Return-Path: <linux-gpio+bounces-26016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA9FB545BA
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 10:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F0BC165FC3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664272D5938;
	Fri, 12 Sep 2025 08:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XQyQ1xhD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279D71E1DE9;
	Fri, 12 Sep 2025 08:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757666559; cv=none; b=hNOP+dDFhtIW1ZXSDiZLuzSE/wC/2Eu0/oKEYLW8jYnLBoMmERbiy8F98wZqePEhMbcIJlh5ANee3tlAZoxw/T66vYLJwiXBi1aWd3s7KudGoZnq8sUZqCKL/+UJEqxe5FNfK+O+Inn44ARhW4jdqrpuTg1rC6mPL76V5fja6xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757666559; c=relaxed/simple;
	bh=DxQwjwkkgCus0lc3RFJ14NA9phr1rMb9GHdKSvPXbJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbgxhP/eCfZQFWJ9oc0ceT30RXwOA0+k0hO+AHumzLf3fDt/H48GLUyrHB6X7Gn6aGnTQi0/KzIQYMf/TtMWxEA/SxrC4oThFx/m06iy5oHaswXJGBOTgF4Ua83COVba/1d8PNraCsLOqTJFQKOWEpbsyWc8aPi6lRyU26Y5OdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XQyQ1xhD; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3073520822;
	Fri, 12 Sep 2025 10:42:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-yEYBJTT9nY; Fri, 12 Sep 2025 10:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757666546; bh=DxQwjwkkgCus0lc3RFJ14NA9phr1rMb9GHdKSvPXbJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XQyQ1xhD4/JjR7yV/ko1JFRyYkrxoG5cjkoIfpkvVEE+m+5sVtarqzLn8PaVGlT0g
	 j4/REY64UCU+rTvFAhM05Yh15zXFCHF6cM7QRWK9em926BOEzBsCbHKBfYHIGI8WtT
	 uAYtyJ8JAlslKSqE8cAWDO4TGtiqtn9Ma/4+HDVh6dHcTWFQuM7VGAcf2vgNhIG9Au
	 zBL/7n/CQbDbMNU7RYXuyCJF9Tqjz+rvb8BtRQTkq2/vK9OCaH3SN4XyHABc0whT87
	 klweirxHXSNc5hfKDj5IY4SgkAOu/8NCigDY7GS1cBiyaWkgAakhByC99t5oaNVEhG
	 wRXg5OLpiv3fw==
Date: Fri, 12 Sep 2025 08:42:08 +0000
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 1/3] dt-binding: pinctrl: Document Loongson 2K0300 pin
 controller
Message-ID: <aMPcLusIHmji8e_3@pie>
References: <20250811163749.47028-2-ziyao@disroot.org>
 <20250811163749.47028-3-ziyao@disroot.org>
 <20250818175827.GA1507697-robh@kernel.org>
 <aKRh8M0szWKfpPF9@pie>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKRh8M0szWKfpPF9@pie>

On Tue, Aug 19, 2025 at 11:37:20AM +0000, Yao Zi wrote:
> On Mon, Aug 18, 2025 at 12:58:27PM -0500, Rob Herring wrote:
> > On Mon, Aug 11, 2025 at 04:37:48PM +0000, Yao Zi wrote:
> > > The pincontroller integarted in Loongson 2K0300 is able to configure
> > > function multiplexing for all the pins. It could also configure drive
> > > strength on basis of functions, which means all pins set to the same
> > > function share drive-strength setting. Drive-strength configuration
> > > isn't available for all functions, either.
> > > 
> > > This binding utilizes two levels of subnodes, where the outer represents
> > > function and the inner represents groups. Drive-strength is allowed in
> > > the outer since it's shared among all groups configured to the function.
> > > 
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  .../pinctrl/loongson,ls2k0300-pinctrl.yaml    | 92 +++++++++++++++++++
> > >  MAINTAINERS                                   |  6 ++
> > >  2 files changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> > > new file mode 100644
> > > index 000000000000..cbd74cb45342
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> > > @@ -0,0 +1,92 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/loongson,ls2k0300-pinctrl.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Loongson-2K0300 SoC Pinctrl Controller
> > > +
> > > +maintainers:
> > > +  - Yao Zi <ziyao@disroot.org>
> > > +
> > > +allOf:
> > > +  - $ref: pinctrl.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: loongson,ls2k0300-pinctrl
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: Pin function-multiplexing configuration registers
> > > +      - description: Pin drive-strength configuration registers
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: mux
> > > +      - const: drive
> > > +
> > > +patternProperties:
> > > +  '^func-':
> > > +    type: object
> > > +
> > > +    $ref: pincfg-node.yaml#
> > > +
> > > +    properties:
> > > +      drive-strength:
> > > +        description:
> > > +          Maximum sink or source current as defined in pincfg-node.yaml. Note
> > > +          that drive strength could only be configured on function basis, i.e.,
> > > +          all pins multiplexed to the same function share the same
> > > +          configuration.
> > > +
> > > +          This could only be configured for several functions, including jtag,
> > > +          dvo, uart, gmac, sdio, spi, i2s, timer, usb and emmc.
> > > +        enum: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
> > 
> > How do you know what pin this drive strength corresponds to without any 
> > other properties? Node names generally aren't important, so you 
> > shouldn't be using that. 
> 
> Thanks for the hint... yes I'm matching the node name to identify
> functions in this revision of driver. Could I introduce a "function"
> property to the outer node for identification of the function?
> 
> > > +
> > > +    additionalProperties: false
> > > +
> > > +    patternProperties:
> > > +      '-pins$':
> > > +        type: object
> > > +        $ref: pinmux-node.yaml#
> > 
> > Generally the pin config and muxing are in 1 node if you can control 
> > both.
> 
> On 2K0300, drive-strength could only be configured for each function,
> not each pin, i.e. all pins configured to the same function share the
> same drive-strength configuration.
> 
> Putting the driver-strength property in the outer node describes the
> situation: a property in the outer node is function-specific and shared
> between all groups (represented by inner nodes) configured to this
> function.
> 
> Do you think it's better to move pin config (the driver-strength
> property) to the inner node in this case? If so, should the new
> "function" property for identifying functions reliably be in the inner
> node or the outer node? Thanks for your explanation,

Hi Rob, could you please comment further on my questions? Thanks for
your time.

> Best regards,
> Yao Zi

Regards,
Yao Zi


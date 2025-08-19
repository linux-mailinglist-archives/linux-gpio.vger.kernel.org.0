Return-Path: <linux-gpio+bounces-24543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED92B2C0AE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9157C3A69BD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F7C32BF28;
	Tue, 19 Aug 2025 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="kyRP/RHM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABA231B137;
	Tue, 19 Aug 2025 11:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603468; cv=none; b=Nr9YZJAFqd1AJdCerpRBkDW8w78RSkK65S+K4UA0G2a6+7DqvxUkYn7MHZ6RNbojqcf8HeJhqcgYuIOOSt5JpQ47qwlr/B9ugsSAgJ7QS/LZQ9LpRujSq2l13+Nv4RjZ5tiG3+vcflAIK8vzcdLWNDJPNUacWEf9vOZU/IEgBxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603468; c=relaxed/simple;
	bh=BUIQ0o7+0DXfZZvDBmTqmNPqQg3jq/hl9aI0B7gOgcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKD9JTNwQNpc9TK8Qa5xk3vnEGbICXGRa+ic1kWb+c8N/Wk/BZf0LqcV7dOXliOscn9fhQIm6wApYa9Tfc/iztZjo80DElsaD9d2ZjBHMIs2kzKWp2UIJsuwJW+GdmSMVNNJ/HEowjefYprlh9uKZG+n4nT3dvceT7Z8mLoNcUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kyRP/RHM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9A12225E9E;
	Tue, 19 Aug 2025 13:37:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AC7mISEh3rgQ; Tue, 19 Aug 2025 13:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755603457; bh=BUIQ0o7+0DXfZZvDBmTqmNPqQg3jq/hl9aI0B7gOgcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kyRP/RHMHJ6j4vgYAdkttv3EFVvN9bOwZTWeuNddtiduLfbQZjIST/6dvi1di3e0G
	 v8v3Pdx3XWhMfRUa7nHgihQdgFvpdraUelhrOcBQeK/rleFuWLLzv+ffcDyvmM8NMi
	 5Dmdqy7oPS6IxlGW69UaOlIv/F2UsGQvHVCQi0pd0P7HajTJDM49eH0F6jgMKZzKoc
	 jftoiK79ZlFv0gwBnJAhZCYq63qFNYy9XMFjkIgQcz5B2nJ9oQjkCIibG9S8yPB8uf
	 alNwkMUwHBwCysF3YfRbukVHHWLaKuLTxqcE6le+7tWqQznbwj9VlupBRSPi5dakw7
	 gm4ZAxZnIb61A==
Date: Tue, 19 Aug 2025 11:37:20 +0000
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
Message-ID: <aKRh8M0szWKfpPF9@pie>
References: <20250811163749.47028-2-ziyao@disroot.org>
 <20250811163749.47028-3-ziyao@disroot.org>
 <20250818175827.GA1507697-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818175827.GA1507697-robh@kernel.org>

On Mon, Aug 18, 2025 at 12:58:27PM -0500, Rob Herring wrote:
> On Mon, Aug 11, 2025 at 04:37:48PM +0000, Yao Zi wrote:
> > The pincontroller integarted in Loongson 2K0300 is able to configure
> > function multiplexing for all the pins. It could also configure drive
> > strength on basis of functions, which means all pins set to the same
> > function share drive-strength setting. Drive-strength configuration
> > isn't available for all functions, either.
> > 
> > This binding utilizes two levels of subnodes, where the outer represents
> > function and the inner represents groups. Drive-strength is allowed in
> > the outer since it's shared among all groups configured to the function.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../pinctrl/loongson,ls2k0300-pinctrl.yaml    | 92 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++
> >  2 files changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..cbd74cb45342
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/loongson,ls2k0300-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson-2K0300 SoC Pinctrl Controller
> > +
> > +maintainers:
> > +  - Yao Zi <ziyao@disroot.org>
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: loongson,ls2k0300-pinctrl
> > +
> > +  reg:
> > +    items:
> > +      - description: Pin function-multiplexing configuration registers
> > +      - description: Pin drive-strength configuration registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: mux
> > +      - const: drive
> > +
> > +patternProperties:
> > +  '^func-':
> > +    type: object
> > +
> > +    $ref: pincfg-node.yaml#
> > +
> > +    properties:
> > +      drive-strength:
> > +        description:
> > +          Maximum sink or source current as defined in pincfg-node.yaml. Note
> > +          that drive strength could only be configured on function basis, i.e.,
> > +          all pins multiplexed to the same function share the same
> > +          configuration.
> > +
> > +          This could only be configured for several functions, including jtag,
> > +          dvo, uart, gmac, sdio, spi, i2s, timer, usb and emmc.
> > +        enum: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
> 
> How do you know what pin this drive strength corresponds to without any 
> other properties? Node names generally aren't important, so you 
> shouldn't be using that. 

Thanks for the hint... yes I'm matching the node name to identify
functions in this revision of driver. Could I introduce a "function"
property to the outer node for identification of the function?

> > +
> > +    additionalProperties: false
> > +
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        $ref: pinmux-node.yaml#
> 
> Generally the pin config and muxing are in 1 node if you can control 
> both.

On 2K0300, drive-strength could only be configured for each function,
not each pin, i.e. all pins configured to the same function share the
same drive-strength configuration.

Putting the driver-strength property in the outer node describes the
situation: a property in the outer node is function-specific and shared
between all groups (represented by inner nodes) configured to this
function.

Do you think it's better to move pin config (the driver-strength
property) to the inner node in this case? If so, should the new
"function" property for identifying functions reliably be in the inner
node or the outer node? Thanks for your explanation,

Best regards,
Yao Zi

> > +
> > +        properties:
> > +          pinmux:
> > +            description:
> > +              Integer array, represents GPIO pin number and multiplexing
> > +              setting. Configuration for each pin takes one cell. The pin
> > +              number locates at the high 24 bits, and the setting locates at
> > +              the low 8 bits.
> > +
> > +        additionalProperties: false
> > +
> > +        required:
> > +          - pinmux
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pinctrl@1fe00420 {
> > +        compatible = "loongson,ls2k0300-pinctrl";
> > +        reg = <0x16000490 0x20>, <0x16000110 0x4>;
> > +        reg-names = "mux", "drive";
> > +
> > +        func-uart {
> > +            drive-strength = <2>;
> > +
> > +            uart0-pins {
> > +                pinmux = <((40 << 8) | 0x3)>, <((41 << 8) | 0x3)>;
> > +            };
> > +
> > +            uart1_pins: uart1-pins {
> > +                pinmux = <((42 << 8) | 0x3)>, <((43 << 8) | 0x3)>;
> > +            };
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7960e65d7dfc..dd50571b4072 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14414,6 +14414,12 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
> >  F:	drivers/thermal/loongson2_thermal.c
> >  
> > +LOONGSON-2K0300 SOC PINCTRL DRIVER
> > +M:	Yao Zi <ziyao@disroot.org>
> > +L:	linux-gpio@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> > +
> >  LOONGSON EDAC DRIVER
> >  M:	Zhao Qunqin <zhaoqunqin@loongson.cn>
> >  L:	linux-edac@vger.kernel.org
> > -- 
> > 2.50.1
> > 
> 


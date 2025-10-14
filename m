Return-Path: <linux-gpio+bounces-27058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 461EABD711A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 04:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 191364F13A0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 02:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398C13043B3;
	Tue, 14 Oct 2025 02:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HqtJfKtL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BE15E97;
	Tue, 14 Oct 2025 02:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760408618; cv=none; b=OQb8FC1ixp8UIDax+bfiEPRWs7GLguW0NGM47wBQBm0RLU8QKjtI4Wj+sqekwzrxcyESrpDLiwVR8QdBN9SHBld3kfuNGSXsGJB4vjF/EZzob2XOCX62ktAFJvISiGb+FUNT04DdyQzTBhf/vIC/DzbSaFnXsAUJ7f+GOppEm3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760408618; c=relaxed/simple;
	bh=9wos1iQGekXRuYAqDwpm5kTkuWg2EB110LQ7Z+hNRvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njxjpzOkVPxSGSi7WQCluzZWX7mRGJ3HO0q1BU4VIBi87sfXPv6tqfv04Nku06J9EXeCFXc2gRzhKlALY9Z34FD9MPuDp1su4ooX67snds5uQE9Ulk2+35mTSHh0dB2GRnadNry7XHEPSF3fhQASe4Tp7tlindt8rkgsejr2IHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HqtJfKtL; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 03EE4264C7;
	Tue, 14 Oct 2025 04:23:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpXP0q_EE9wl; Tue, 14 Oct 2025 04:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760408614; bh=9wos1iQGekXRuYAqDwpm5kTkuWg2EB110LQ7Z+hNRvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HqtJfKtL8HZ9DpOd5ZJfDQVf3fbQi+zJObBC+vs+GH6yD7NPpSljr9Wah+T1FvhxZ
	 jsr3tBjzcan5T9zdEuxtWiTtLCpcRbUMxaKBkCIeGaXShyEep2Fi/bREbJLeFJRijf
	 M2Xg03bU9YmTKsPslZHLVJKtxhIqTtGAsiQk0+RLxF5VuzmxxHGTe2i8ez937G6B4s
	 PTpfRloto+EeFqkzQfQMCMcQzusDKgURLkdAG1QiGRcB/ZUbgcP46LVUXAGQpHNEEq
	 ksoc6KbJmm2VAlcPmA1a6zjMpNz0GfXV7GL7ZBzO2R2bDFIF7jQmTWe0rFHh/S22XK
	 3qlxk8o+w6NoA==
Date: Tue, 14 Oct 2025 02:23:23 +0000
From: Yao Zi <ziyao@disroot.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 1/3] dt-binding: pinctrl: Document Loongson 2K0300 pin
 controller
Message-ID: <aO20G22p7OwJq6C-@pie>
References: <20250811163749.47028-2-ziyao@disroot.org>
 <20250811163749.47028-3-ziyao@disroot.org>
 <CACRpkdYC6ueVGngC=KMqh9aW8DiMKWyxoa8dqb4N3sEEkpdsFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYC6ueVGngC=KMqh9aW8DiMKWyxoa8dqb4N3sEEkpdsFg@mail.gmail.com>

On Tue, Oct 14, 2025 at 12:48:31AM +0200, Linus Walleij wrote:
> On Mon, Aug 11, 2025 at 6:39 PM Yao Zi <ziyao@disroot.org> wrote:
> 
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
> (...)
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
> As Rob points out this is really odd, or rather the first time I see
> something like this.
> 
> It is clear from the driver that these are all set by writing bits
> in a 32bit register, with 2 or 3 bits dedicated to each function.
> 
> Its a bit weird, like each function has driver totempoles/stages
> before the mux instead of after (which is the normal). But
> I guess it is engineered like that then!

Yes, it occurs strange to me at the first sight, too.

> 
> It now looks like this:
> 
> +        func-uart {
> +            drive-strength = <2>;
> +
> +            uart0-pins {
> +                pinmux = <((40 << 8) | 0x3)>, <((41 << 8) | 0x3)>;
> +            };
> 
> I think this is better:
> 
> uart0_default: uart0-pins {
>      function = "uart0";
>      drive-strength = <2>;
>      pinmux = <((40 << 8) | 0x3)>, <((41 << 8) | 0x3)>;
>  };
> 
> This is consistent with the bindings if you include both
> $ref: pinmux-node.yaml#
> $ref: pincfg-node.yaml#
> 
> And will configure it all in one go.

To confirm my understanding, would you like to drop the outside node
(which now refers to pincfg-node.yaml) and refer to both
pinmux-node.yaml and pincfg-node.yaml in the single level of subnode?
i.e.

	pinctrl {
		uart0_defaults: uart0-pins {
			function = "uart0";
			drive-strength = <2>;
			pinmux = <...>;
		};
	};

> Sure you need a lookup for the function strings in the driver
> but it's OK.
> 
> It's odd to have "function" without "group" but it seems legal
> and works fine for your usecase. The normal would be to
> skip pinmux, have just pins = <40, 41>; and look up the
> function value for each function for a pin from a table that
> cross-reference in this case "uart0" to 3. But I
> guess you don't wanna do that so pinmux is fine too.

Thanks, glad to hear it's okay.

> <((40 << 8) | 0x3)>, <((41 << 8) | 0x3)> is a bit odd, maybe
> you want to also include an explanatory macro in the bindings.

Sure, I will add a macro like the one included in the DTS change.

> Yours,
> Linus Walleij
> 

Thank you and Rob for the help! Will adapt the suggestions in v2.

Best regards,
Yao Zi


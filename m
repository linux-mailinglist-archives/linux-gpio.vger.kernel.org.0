Return-Path: <linux-gpio+bounces-16701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C0AA47C74
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A541D3A4456
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 11:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136DA1A4E9D;
	Thu, 27 Feb 2025 11:46:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62816374F1;
	Thu, 27 Feb 2025 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656777; cv=none; b=qoRMVlKwe9sdKSJM/ug1Rz9RDraBO4NOubDs+hpLx9kAa4u9ydLLDd7YCnLfqz//UHPkzKe+EGYupor2EwKGHggTwJI9ObIYloThuBcc1kzaeBReTAOCAkzKn4bpI7oaqVspl8uXF6qPloPwD5m4eAidf52KyGXmC1i41JrWBcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656777; c=relaxed/simple;
	bh=aByXJS8GUsb9ZsYE5JKgEsiOVfFiyObN7vaAoQDQ9W0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koki+Az5j/JG+Gl6XqCUU8meUSyekn4IRSqXuflhvTKNXxxv6WHUoe92X59thejcret+jrJMM4dV9nwqpeGlUTKfztkTZWKjtkJrenmJYzn3IkF4jkbqPboa6W1BFhwuCnm/6pzCfunHcP86pQEHdrcn16PhRfH00IE4Y5nwRMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5461F15A1;
	Thu, 27 Feb 2025 03:46:31 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DADDB3F6A8;
	Thu, 27 Feb 2025 03:46:13 -0800 (PST)
Date: Thu, 27 Feb 2025 11:46:11 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Chen-Yu
 Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: pinctrl: add compatible for
 Allwinner A523/T527
Message-ID: <20250227114611.67a1ba00@donnerap.manchester.arm.com>
In-Reply-To: <173949598874.895319.6861900349653451498.robh@kernel.org>
References: <20250214003734.14944-1-andre.przywara@arm.com>
	<20250214003734.14944-7-andre.przywara@arm.com>
	<173949598874.895319.6861900349653451498.robh@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Feb 2025 19:19:48 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

Hi Rob,

> On Fri, 14 Feb 2025 00:37:32 +0000, Andre Przywara wrote:
> > The A523 contains a pin controller similar to previous SoCs, although
> > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > With this SoC we introduce a new style of binding, where the pinmux values
> > for each pin group are stored in the new "allwinner,pinmux" property in
> > the DT node, instead of requiring every driver to store a mapping between
> > the function names and the required pinmux.
> > 
> > Add a new binding file, since all the different variants of the old
> > binding are making the file a bit unwieldy to handle already, and the new
> > property would make the situation worse.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../allwinner,sun55i-a523-pinctrl.yaml        | 177 ++++++++++++++++++
> >  1 file changed, 177 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> >   
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.example.dts:24:18: fatal error: dt-bindings/clock/sun55i-a523-r-ccu.h: No such file or directory
>    24 |         #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ah yeah, of course, that's in another series. What's the best approach
here? I could cheekily import an existing header file, the symbol names in
there are often the same (ccu-sun20i-d1-r.h defines the same symbol, even
with the same number).
Or I just replace it below with the number "1"?
Or let git format-patch append the patch-id of the clock binding header
patch?

Cheers,
Andre

> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250214003734.14944-7-andre.przywara@arm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 



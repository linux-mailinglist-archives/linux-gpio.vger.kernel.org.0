Return-Path: <linux-gpio+bounces-8016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B98926252
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 15:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 145211F232B3
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 13:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41B617B429;
	Wed,  3 Jul 2024 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrqbGcY3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD8217A59A;
	Wed,  3 Jul 2024 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014784; cv=none; b=aNU/nJ0Hg8cEqeOn7iKYIYXtldFClqQmu5GV+jR6onquK52yajkLtVtL5W/H9SgDIJg8ZhqiRUpbnGoSK4WGZcCsJXxlZobfGcnvoUzYAas4TOO1Dkf51CO4xbry/pWQqZu/+1I2TfD0PAgY+8ZBKonM0CWuNCiv5S11Zos2OR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014784; c=relaxed/simple;
	bh=9N8yVPzno2N9d24Snv1GHc+eDBmXHT41IhW0UTd1FJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/l/nbY/fqO3iEFm6y8cwyVHuKWEmpF+2zy+d48R4rXgXiS3nSvMNqhdZA4T5EWbrELzV/Zhv4Qs6vTWk6up3QzotAG1tWZH8fDTOm4aQoWYc4qqdptYwdPQzqCIygWKBTZCtwqZhTNuCLxcaloS/pPcYdxRvEIdjCBPIY9Vg9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrqbGcY3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C281C2BD10;
	Wed,  3 Jul 2024 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720014784;
	bh=9N8yVPzno2N9d24Snv1GHc+eDBmXHT41IhW0UTd1FJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrqbGcY3PeLUqWFqLP2gHFfZQA13YUIpyeXzzFEC527S9yHYTXpj7UrJ03Qr6BOVj
	 VBobvRhHTBQIKsICEEbwdFeW6uAjLdXE0Joi+VMxUsgIO0nKeU1oi6uEd3vaJfHdzq
	 G2EaD/EVYqXIuTJDbnvdZLNJ/39FmVAUpPoYy9zWM637U6qgZsEFiWCUlEF5DmLU1+
	 zPbP6jgYhL8mXfAlW4v7ysfqpNYDQHDcKb+s0aQ8otboVeJ3esWgKULvFi3Ak2dVuQ
	 /lhsTRxvFHKDePcBeE9Cb2HFwDm4amrtJ5+iimlQNSIgenNmvc9DiJkZrTot1g/izx
	 M7x41TvzJ60dg==
Date: Wed, 3 Jul 2024 07:53:03 -0600
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl
 bindings
Message-ID: <20240703135303.GA56155-robh@kernel.org>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-2-emil.renner.berthing@canonical.com>
 <20240115173657.GA999912-robh@kernel.org>
 <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>

On Fri, May 17, 2024 at 07:48:17AM -0500, Emil Renner Berthing wrote:
> Rob Herring wrote:
> > On Wed, Jan 03, 2024 at 02:28:38PM +0100, Emil Renner Berthing wrote:
> > > Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> > >
> > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > ---
> > >  .../pinctrl/thead,th1520-pinctrl.yaml         | 372 ++++++++++++++++++
> > >  1 file changed, 372 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > new file mode 100644
> > > index 000000000000..d3ad7a7cfdd1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > @@ -0,0 +1,372 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: T-Head TH1520 SoC pin controller
> > > +
> > > +maintainers:
> > > +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > +
> > > +description: |
> > > +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> > > +
> > > +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> > > +  Confusingly the memory ranges are named
> > > +    PADCTRL_AOSYS  -> PAD Group 1
> > > +    PADCTRL1_APSYS -> PAD Group 2
> > > +    PADCTRL0_APSYS -> PAD Group 3
> > > +
> > > +  Each pad can be muxed individually to up to 6 different functions. For most
> > > +  pads only a few of those 6 configurations are valid though, and a few pads in
> > > +  group 1 does not support muxing at all.
> > > +
> > > +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> > > +  be configured or has some special functions. The rest have configurable drive
> > > +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> > > +  addition to a special strong pull up.
> > > +
> > > +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> > > +  are then meant to be used by the audio co-processor. Each such pad can then
> > > +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> > > +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> > > +  also configured in different registers. All of this is done from a different
> > > +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
> >
> > It is still not clear to me if each instance is a different programming
> > model or the same with just different connections. The latter should
> > be the same compatible string. That needs to be answered in *this*
> > patch, not a reply.
> 
> Hi Rob,
> 
> Sorry for the late response. I honestly don't know exactly what you mean by
> differenty programming models and what the difference is, so I'll need a bit of
> help with what you want me to write here.

Is the register interface of each instance the same? Looks like it is 
from the driver. So normally that's 3 instances of the same compatible.

> Any driver for the TH1520 SoC (not just Linux) would need some way to discern
> between the 3 pin controllers so they know how many pins to control and what
> pinmux settings are valid. Basically they'd need the data in the three
> th1520_group{1,2,3}_pins arrays in the driver and a way to know which of them
> to use.
> 
> https://lore.kernel.org/linux-riscv/20240103132852.298964-3-emil.renner.berthing@canonical.com/

Why do you need to know how many pins? The DT says configure a pin and 
you just configure it. It's not the kernel's job to validate that the DT 
is correct.

Aren't the pin names globally unique? So you just look up the pin name 
across all the arrays. Or you can just look up one pin from each 
instance to find which th1520_groupN_pins array goes with the instance. 
Or just have 1 array.

Rob


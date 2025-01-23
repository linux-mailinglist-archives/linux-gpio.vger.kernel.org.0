Return-Path: <linux-gpio+bounces-15044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1EA1AD2D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2025 00:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2D75188B583
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 23:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024FA1D514C;
	Thu, 23 Jan 2025 23:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b="LGiS34cL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1761B1CEE9F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737674366; cv=none; b=RmSq3StQyUPGTkCDX06GcCiAYnaUDcmls/tf3JMwiae/mBPXQXn1+NOefOmRj4BqzLlrlqIHORjUAYGxNZVuCSPuqO3S8rwO8z07dI0R85UIDwJDMIW4y6IV8bLTjOYfFqm/9d5smDkxz648BiZNmcuUjcF0xQv8JLTUaXnDPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737674366; c=relaxed/simple;
	bh=PgAhW/EhaBr+SCErS2B28yLOIwL/Oga2x3QZVVDnNW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlO06ZmrXhOqhtSJ8gMk/m2DELi4NN1j3iaQFnNi3boeKgU86FBCw18U0UNC7cnmG9XdNTyMqNA8hy3dnREAfpqoBrJMNEeg8aQEu1gBifs1bG4Y9FICrmGv71Cr0gAtRts/3VZ420N9xZZCUPFrecWPu8oymoPCIJXuR9zTYNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net; spf=none smtp.mailfrom=lixom.net; dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b=LGiS34cL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2164b662090so29115235ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 15:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1737674364; x=1738279164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jfONWgM4B+rw2JH14h+1A74u4ndlqnjc1n9HGrEwEIU=;
        b=LGiS34cL/AxlDPY7NiaqNfLq2Tqz0Il/h4kg0Lei0Q3IX8bG7BLuB6lsIAyfrasrSB
         BpwXAqXv2BMeCdBHgdoTPpKURvlHDfOCV2NCe31WefzWLMN5fH7uaD2Zn/YPYI/1ncdp
         iienDUXaAk8Xo/Zwfn+0gX/tTd4OvzAyjEf/gjl1rWIlsl2EsnAmwYP7TEowdw34p5QC
         NH6nOwuXQ69belM1V0I9E96EKqe4iptwoO34KbzKCvyNVPfmh+wdtX5z2Fn1VB/pyrsI
         hAujeF/su/BPzrtHoLFcHDvHDlTh1GZLElVQyM+i650FaRchlivn3ZpxE0nQNN+Gdica
         EEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737674364; x=1738279164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfONWgM4B+rw2JH14h+1A74u4ndlqnjc1n9HGrEwEIU=;
        b=jXKu9UtPJcUrLV5/ia6hUsXbTTAihOlesk42WQWCRLxw1djCGgeKn2DZAk4kbUsVc+
         uSfXYLyYYI29zEKXVp6DW5VqzmksA9c4AUcb27quU4paYkeRoPC+I1Rgpcg/ye965L/m
         ff+Y+Fa12iP2k8F6QCTGkD5THiZZDUrzAsKUViISxFZcypwcqC1jNyRI0fNwUs4SvVdM
         fP/KJeYx4MuxK3I0FSECwFpzHdIgZrbBTK5LdG139POO2ckBbcbnlXJxw2RMTK+ll5rJ
         I+APinTkH0eu/+sChb/iP0/c0eU6K8UIW8YW31Q3/5EW4yzoaBRHF/MAomnC+IixIum9
         UAkg==
X-Forwarded-Encrypted: i=1; AJvYcCVecabKj48V08SYxSHwC0P0Rtx/1wD0Z+AiRiFjopp0HmxHpWx0FCEb35Eme6Xn4MGvXzxEnG8dm5vA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vrsdy6EozMwagKthobnJv4rtFEDdXGRw7Im4f8UhjsB7a7WY
	YcE1IGvFuJmQMHIrAnURYQcJ61i3wZ2fXfsL8R+LtyDTypLS7A7cUWPEd0Pa+3c=
X-Gm-Gg: ASbGncvAlrb3RdXJ5iTdcwI4AZzQVsLGzvQg2usLQCvFBCyu2JZAheuMXyNXRRAHtKr
	8deMq1+Z4g62ldHVYUgb7eTfJLfFEEZRVShVoVe3L+y43J6aSZmACf4B+YHo0wPJjlFgD6rGJu6
	LUI5T8TJIceMI9ltiqZcA4YVja82vQZncruX93ugL9vxRPbQ67WCxzsAZC88RORTWbmGsd6x4Dj
	AYX/KWQya+u7IBLOc3Sz9xi48kMzW1bhWeO24H4xyh6IQqDs+iPpNXm7oDE4gWgkZ3GWjPdp48B
	HN4AChF+HGn5lW5DSfazaE2r18Cqzb34P3MBS405nBp53A==
X-Google-Smtp-Source: AGHT+IG9D69/A30bCSG56XByEivne0LZ4eTvZXYB8a9hFGTFSDJHXfcZ7shZT7kJGwKsgbTgNynaAA==
X-Received: by 2002:a05:6a20:8423:b0:1e1:ca27:89f0 with SMTP id adf61e73a8af0-1eb215bec54mr45503593637.37.1737674364069;
        Thu, 23 Jan 2025 15:19:24 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac4907f076dsm426261a12.37.2025.01.23.15.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 15:19:23 -0800 (PST)
Date: Thu, 23 Jan 2025 15:19:18 -0800
From: Olof Johansson <olof@lixom.net>
To: Yixun Lan <dlan@gentoo.org>
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
Message-ID: <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
 <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123113042-GYA38135@gentoo>

On Thu, Jan 23, 2025 at 11:30:42AM +0000, Yixun Lan wrote:
> Hi Olof:
>  thanks for your reivew
> 
> On 12:03 Wed 22 Jan     , Olof Johansson wrote:
> > Hi,
> > 
> > On Tue, Jan 21, 2025 at 11:38:11AM +0800, Yixun Lan wrote:
> > > The GPIO controller of K1 support basic functions as input/output,
> > > all pins can be used as interrupt which route to one IRQ line,
> > > trigger type can be select between rising edge, failing edge, or both.
> > > There are four GPIO ports, each consisting of 32 pins.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 116 +++++++++++++++++++++
> > >  1 file changed, 116 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..dd9459061aecfcba84e6a3c5052fbcddf6c61150
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > > @@ -0,0 +1,116 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SpacemiT K1 GPIO controller
> > > +
> > > +maintainers:
> > > +  - Yixun Lan <dlan@gentoo.org>
> > > +
> > > +description:
> > > +  The controller's registers are organized as sets of eight 32-bit
> > > +  registers with each set of port controlling 32 pins.  A single
> > > +  interrupt line is shared for all of the pins by the controller.
> > > +  Each port will be represented as child nodes with the generic
> > > +  GPIO-controller properties in this bindings file.
> > 
> > There's only one interrupt line for all ports, but you have a binding that
> > duplicates them for every set of ports. That seems overly complicated,
> > doesn't it? They'd all bind the same handler, so there's no benefit in
> > providing the flexibility,.
> > 
> yes, all ports share same interrupt line, but each port has its own
> irq related handling register, so it make sense to describe as per gpio irqchip
> 
> also see comments below
> 
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^gpio@[0-9a-f]+$"
> > > +
> > > +  compatible:
> > > +    const: spacemit,k1-gpio
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^gpio-port@[0-9a-f]+$":
> > > +    type: object
> > > +    properties:
> > > +      compatible:
> > > +        const: spacemit,k1-gpio-port
> > > +
> > > +      reg:
> > > +        maxItems: 1
> > > +
> > > +      gpio-controller: true
> > > +
> > > +      "#gpio-cells":
> > > +        const: 2
> > > +
> > > +      gpio-ranges: true
> > > +
> > > +      interrupts:
> > > +        maxItems: 1
> > > +
> > > +      interrupt-controller: true
> > > +
> > > +      "#interrupt-cells":
> > > +        const: 2
> > > +        description:
> > > +          The first cell is the GPIO number, the second should specify interrupt
> > > +          flag. The controller does not support level interrupts, so flags of
> > > +          IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> > > +          Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
> > 
> > Same here, since there's no real flexibility between the banks, it might
> > make sense to consider a 3-cell GPIO specifier instead, and having
> how to handle the fourth gpio port? I would like to have uniform driver for all ports
> 
> > the first cell indicate bank. I could see this argument go in either
> > direction, but I'm not sure I understand why to provide a gpio-controller
> > per bank.
> > 
> 
> IIUC, your suggestion here was same as the implementation of patch v3 of this driver[1],
>  while combining all four ports into one irqchip, which NACKed by maintainer[2].
>  I tend to agree having a gpio-controller per bank provide more flexibility,
>  easy to leverage generic gpio framework, even each port can be disabled or enabled,
>  and IMO having shared irq handler isn't really a problem..
> 
> [1] https://lore.kernel.org/r/20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org
> [2] https://lore.kernel.org/r/CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com
> https://lore.kernel.org/r/CACRpkdYgGho=VQabonq4HccEiXBH2qM76K45oDaV1Jyi0xZ-YA@mail.gmail.com

Hmm, I don't understand the reasoning there, but it's not my subsystem.

It seems worse to me to misdescribe the hardware as separate blocks
with a device-tree binding that no longer describes the actual hardware,
but it's not up to me.

Let's get the platform support merged, ignore my feedback here -- we need more
SoCs supported upstream and this code is good enough to go in as-is.


-Olof


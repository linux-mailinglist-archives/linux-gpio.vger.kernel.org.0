Return-Path: <linux-gpio+bounces-11749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5199E9A9F70
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 12:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C7BA283CEF
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 10:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0343419994A;
	Tue, 22 Oct 2024 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VqzZr0qs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64E1199238
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729591195; cv=none; b=lQq9Dh+GvtazsAWkt4of6Yxp8BzvhcxxBOwDkzeux1fXDeEejoyqyohGabbYt+VVutb59qyj+dmQbun1Jy9OTxPSqvkFLEYOS4awlORlGNAKxx7I/YReM7lkUAOfeAnCH5P3tkkSE5WnhlT5JVQVQaFonlRpcEpslLtKBFU8w1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729591195; c=relaxed/simple;
	bh=WyTNn9Kvl5r4cjirWMedKm36u/M6pfnFsku29HKXjTc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY+XAuHBc/hkzVhnqZpfbbXpK6RPqgZpF/WQI/vv8mlkb/8NNC7Ee2OmcsRssxfayjdOOfSU+NsDBroWXjz9+8PotUjsbXd0Vm37JrZsKwri7pTSU69Ppow+PLI4y9LNUkKyImOTTv+O3sYaoQpt3UsrZY0hrPMOu0Nay6oC+ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VqzZr0qs; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a9a4031f69fso784904266b.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729591191; x=1730195991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tse3WFb+Cqy4NQjY2x57/IK1kjaHJljLdncZwV39uDw=;
        b=VqzZr0qsUcJgB4DeGo2/5JVsn/HLozrOMVl+HBvFOqQyFN0tvM9e72o6ADyPHp5Tb9
         ND5T3aR5EFGXRCS5Z62AC11A7V7RxybVCPMAqVa/ea1YzLd7qwhDb9kUZ/Znn3xiUWDc
         AAvPCH3Banj3kxwUgiBIQ7w+e6qi+VUpeSpY3nXZTw6LNe+ArHaUtbBSuzU5jvBvte1e
         ju9MwbhcNea1x6nJwPsrqiqf0Fml4vwwCyo0it1J5/sM/88yTTMLmXbbNIL3naUCZJmZ
         +AfcMxG/1RkINMDijbOBPy8kLHqVgMIfHYgWjKvq/h2fBJxHA/83BUHIYHWBglNHbh/U
         mOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729591191; x=1730195991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tse3WFb+Cqy4NQjY2x57/IK1kjaHJljLdncZwV39uDw=;
        b=Fj8jEhWQO+nnLbZ5YL8smi2wZtkilZwm8IIUMvZc0qQqbpPVHEtj470m/gvevxa/xi
         uMlxpgEsTJ0HLbMT61rw78bFTJa5rX5EDahim5qHDXnWg85I+mZ0zy7nBCJ66Hu4Uay8
         VBse+2X7OUZcSR/89Pj4dMk79fFFtqzjUKCHyDT3FCu19ar0SeS+9E+Ijv1wY+Pu/1hB
         gFp+JBo21MNoOFG8cBuVyMxFYQT2Nz8h64Q7Xtmt6Sc9EjZTZZsf6uUiEZZFOQqpun39
         9IOisUjpA0rkDioONf/tpVz1aQ2OmPuz9nv5jKa8TZ1mfXT3JZE8gXpRmVXB6TZ3FEMr
         zSgw==
X-Forwarded-Encrypted: i=1; AJvYcCXFQdZ6lWQx0bYucIyEUFnanp2Pp5sGGtXOhmJFwposGVt3FJGFMnklLd6Ck7Dr+0Y7fWCOA2HK1wkv@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwCpsPFjlcwGJcBEIWtR6IKCEuKpBZSmomHsrnohOYKyQstuC
	4q4rIAGBy72qvI9ffKz6FH6ki82a9SkIp4/54J+3PhsNj/eSIqaYceu3sMqOcas=
X-Google-Smtp-Source: AGHT+IGsNax4L/Gs6SdwZlVryK8Odsx0A/4SKDkH5jIR6gUFIIm5jqy15/Lspkq6C28pNgM1cfZgyA==
X-Received: by 2002:a17:907:7b92:b0:a9a:420:8472 with SMTP id a640c23a62f3a-a9a69ca04e3mr1598636166b.42.1729591190900;
        Tue, 22 Oct 2024 02:59:50 -0700 (PDT)
Received: from localhost (host-95-239-0-46.retail.telecomitalia.it. [95.239.0.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d8381sm313843166b.45.2024.10.22.02.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:59:50 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 22 Oct 2024 12:00:12 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 04/14] dt-bindings: misc: Add device specific bindings
 for RaspberryPi RP1
Message-ID: <Zxd3rAspFDglujkM@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <3141e3e7898c1538ea658487923d3446b3d7fd0c.1728300189.git.andrea.porta@suse.com>
 <zequ4ps7h6ynr2y5yrcqm3tpvvmmrgc6auupfy435rpysiyypf@7cd2zbwhk3ya>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zequ4ps7h6ynr2y5yrcqm3tpvvmmrgc6auupfy435rpysiyypf@7cd2zbwhk3ya>

Hi Krzysztof,

On 08:26 Tue 08 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 07, 2024 at 02:39:47PM +0200, Andrea della Porta wrote:
> > The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> > schema is intended as minimal support for the clock generator and
> > gpio controller peripherals which are accessible through BAR1.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../devicetree/bindings/misc/pci1de4,1.yaml   | 110 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 111 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > new file mode 100644
> > index 000000000000..3f099b16e672
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RaspberryPi RP1 MFD PCI device
> > +
> > +maintainers:
> > +  - Andrea della Porta <andrea.porta@suse.com>
> > +
> > +description:
> > +  The RaspberryPi RP1 is a PCI multi function device containing
> > +  peripherals ranging from Ethernet to USB controller, I2C, SPI
> > +  and others.
> > +  The peripherals are accessed by addressing the PCI BAR1 region.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-ep-bus.yaml
> > +
> > +properties:
> > +  compatible:
> > +    additionalItems: true
> 
> Why is this true? This is final schema, not a "common" part.

The 'compatible' property I've specified in rp1.dtso is not strictly
necessary since it will be added automatically during the dynamic device
node creation by the OF subsystem, and will be something like this:

"pci1de4,1", "pciclass,0200000", "pciclass,0200"

I've redefined simply as "pci1de4,1" in the dtso so it can be validated
against the relative binding schema, and I opted for a shorter name since
the RP1 is not really a simple ethernet controller as advertised by the 
config space (pciclass=2). The schema definition allows for the "relaxed"
extended version, shoudl someone want to use it for resemblance with the
dynamically create compatibel string.

> 
> > +    maxItems: 3
> > +    items:
> > +      - const: pci1de4,1
> > +
> > +patternProperties:
> > +  "^pci-ep-bus@[0-2]$":
> > +    $ref: '#/$defs/bar-bus'
> > +    description:
> > +      The bus on which the peripherals are attached, which is addressable
> > +      through the BAR.
> > +
> > +unevaluatedProperties: false
> > +
> > +$defs:
> > +  bar-bus:
> > +    $ref: /schemas/pci/pci-ep-bus.yaml#/$defs/pci-ep-bus
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      "#interrupt-cells":
> > +        const: 2
> > +        description:
> > +          Specifies respectively the interrupt number and flags as defined
> > +          in include/dt-bindings/interrupt-controller/irq.h.
> > +
> > +      interrupt-controller: true
> > +
> > +      interrupt-parent:
> > +        description:
> > +          Must be the phandle of this 'pci-ep-bus' node. It will trigger
> > +          PCI interrupts on behalf of peripheral generated interrupts.
> > +
> > +    patternProperties:
> > +      "^clocks(@[0-9a-f]+)?$":
> 
> Why @ is optional? Your device is fixed, not flexible.

Right.

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 


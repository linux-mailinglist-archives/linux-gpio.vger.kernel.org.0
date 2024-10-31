Return-Path: <linux-gpio+bounces-12376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF89B7C61
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 15:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F7A8282A9C
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 14:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2829B19DF99;
	Thu, 31 Oct 2024 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vb536Sc/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADADC14901B
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730383627; cv=none; b=s45A0UReJfHw8g0E0W+G81g/xVaUefTHScWSvIEsfi5W1nUTpfmjz75WjmiJPYyk+xrgFaW1X3PZ9OZ1Q1h/DIWeRbhH2b0zanP1SwtVs//tKdECml4C7J+Jnl5p71+B67YT0CP6gNXn0xG1Iwj9emiYQvPmEp9zpG2hHPc1I9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730383627; c=relaxed/simple;
	bh=4n8iR94+PGBpitBvSOEgevPVeC9olrRr+D45j2D0gEM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5Q+B9IWxThjF6zh9FUmlPuO6GX4WXOYuCkoI6OidiRQJZ10XHmw+yXvOxrRTokw/+hw+awLgzKwSVF3HMuwBc2Vgk/B/DpCX/2wY8art5OQYQNKBGuUvY1cy9W0epvFDgE028AxcCRFBjvC5yQh/J/IhnAwBdUgQQ5+xcyC1Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vb536Sc/; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a99ebb390a5so372663166b.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730383623; x=1730988423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEGfHgtlfX7KJ8goCZZIWVQ2MO0hMqzb+0kc1/rtAds=;
        b=Vb536Sc/cKV4Pc5/qQpCClxva7sRvAf8sDg1z773wAgi+SSt+/H8yKFiuwcNog1D7Z
         5tphw5KQKUfwPdgjsoIJUTlaQh4IagUc+unjpqrhkBDXcPU4QzVadscwnY88VHPZrhXE
         aYspjCeL0Ck6cnIzWPX58aRzduBt7wrZqvpKwZ55rJ8CtdsqoLAe0xltrKTq12DvzgDN
         7bKX4KPzDPLqJCO47xaiNZzQwt+Cc58gaax7s/wpcB+r8/jUCOUSRHCp2C6+kk5v70Es
         7qeKtJHf4vHfjEYGEDfIdd5MWpuEHEu5Oh3ewzmBaSqUNkanrwAKWs1bi/pB2R1JTUnj
         Btmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730383623; x=1730988423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEGfHgtlfX7KJ8goCZZIWVQ2MO0hMqzb+0kc1/rtAds=;
        b=ZW+ZkFiviTD5ExKvUgtECHcoEMHb5T4ZwM6YkafASVY9Zvk33Jch0SKUDFsMy9wd3N
         JUDD8d/5B0fvmyMEi6Ht6+SgZMFvc26ArCJwYigfy/yK+Y5aqhoq4MSbvJALvehVZfvI
         /dG1qe52Re1fj44mLj0mEbwlzi//zw13/9EUYvU77TIe2TwuKUhHNdCMxTSugtJ43q6w
         Vl4rOi4yvkO21sAJFEV3dGJpdr/SX9/rDaZk3V29UILamkZ9bRsJoAzuit795CscQn16
         hH5cQ2lc1tusnHxkNVsOtrNsu2GURh/6jBhITyDHpxoHkIGboaydU3IaH/pfIDx4du4S
         YVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+3sG44dIAI9h1hZoTRognjxOnjxIqfAfgBvpL3Vk9qaFOBAr4sx0D2rtcKcT7HlYT/Ic2YoKFRDKc@vger.kernel.org
X-Gm-Message-State: AOJu0YyOyhrZF8EXc+xpPC9zDyp9a2iKggg32hEFulW9oPjFafsj2Krz
	pNOWSFdcgVrrooz5LIX7WVnpflUS7LW+2ZeZY3eycv7+Ba/SqIq4MP/frzzLz54=
X-Google-Smtp-Source: AGHT+IHIQ0tbBiD4S9T+SeWA7RT+bD93Ja4MEmDsZzDyFDQ+3MuTwIXh7kQIQRv4IgnjZ0byYOCkag==
X-Received: by 2002:a17:907:3f87:b0:a9a:cea7:1294 with SMTP id a640c23a62f3a-a9e65436316mr9805566b.21.1730383622809;
        Thu, 31 Oct 2024 07:07:02 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c5327sm72556866b.56.2024.10.31.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 07:07:02 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 31 Oct 2024 15:07:26 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
Subject: Re: [PATCH v3 02/12] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
Message-ID: <ZyOPHm7fl_vW7mAJ@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <9a02498e0fbc135dcbe94adc7fc2d743cf190fac.1730123575.git.andrea.porta@suse.com>
 <mjhopgkrjahaxydn3ckianqnvjn55kxrldulvjkpqivlz72uyi@57l5vhydpzc2>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mjhopgkrjahaxydn3ckianqnvjn55kxrldulvjkpqivlz72uyi@57l5vhydpzc2>

Hi Krzysztof,

On 08:26 Tue 29 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 03:07:19PM +0100, Andrea della Porta wrote:
> > Add device tree bindings for the gpio/pin/mux controller that is part of
> > the RP1 multi function device, and relative entries in MAINTAINERS file.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../pinctrl/raspberrypi,rp1-gpio.yaml         | 163 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +
> >  2 files changed, 165 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > new file mode 100644
> > index 000000000000..465a53a6d84f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> > @@ -0,0 +1,163 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/raspberrypi,rp1-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RaspberryPi RP1 GPIO/Pinconf/Pinmux Controller submodule
> > +
> > +maintainers:
> > +  - Andrea della Porta <andrea.porta@suse.com>
> > +
> > +description:
> > +  The RP1 chipset is a Multi Function Device containing, among other sub-peripherals,
> > +  a gpio/pinconf/mux controller whose 54 pins are grouped into 3 banks. It works also
> 
> Please wrap code according to coding style (checkpatch is not a coding
> style description but only a tool).

Ack.

> 
> > +  as an interrupt controller for those gpios.
> > +
> > +properties:
> > +  compatible:
> > +    const: raspberrypi,rp1-gpio
> > +
> > +  reg:
> > +    maxItems: 3
> > +    description: One reg specifier for each one of the 3 pin banks.
> > +
> > +  '#gpio-cells':
> > +    description: The first cell is the pin number and the second cell is used
> > +      to specify the flags (see include/dt-bindings/gpio/gpio.h).
> > +    const: 2
> > +
> > +  gpio-controller: true
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  gpio-line-names:
> > +    maxItems: 54
> > +
> > +  interrupts:
> > +    maxItems: 3
> > +    description: One interrupt specifier for each one of the 3 pin banks.
> > +
> > +  '#interrupt-cells':
> > +    description:
> > +      Specifies the Bank number [0, 1, 2] and Flags as defined in
> > +      include/dt-bindings/interrupt-controller/irq.h.
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +additionalProperties:
> 
> Not much improved. You are supposed to have here pattern, just like
> other bindings. I asked for this last time.
> 
> And there are examples using it - almost all or most of pinctrl
> bindings, including bindings having subnodes (but you do not use such
> case here).

This is the same approach used in [1], which seems quite recent. I did't
use pattern because I wouldn't really want to enforce a particular naming
scheme. Subnodes are used, please see below. Since pinctrl.yaml explicitly
says that there is no common binding but each device has its own, I
thought that was reasonable choice. Should I enforce some common pattern,
then?

> 
> > +  anyOf:
> > +    - type: object
> > +      additionalProperties: false
> > +      allOf:
> > +        - $ref: pincfg-node.yaml#
> > +        - $ref: pinmux-node.yaml#
> > +
> > +      description:
> > +        Pin controller client devices use pin configuration subnodes (children
> > +        and grandchildren) for desired pin configuration.
> > +        Client device subnodes use below standard properties.
> > +
> > +      properties:
> > +        pins:
> > +          description:
> > +            A string (or list of strings) adhering to the pattern 'gpio[0-5][0-9]'
> > +        function: true
> > +        bias-disable: true
> > +        bias-pull-down: true
> > +        bias-pull-up: true
> > +        slew-rate:
> > +          description: 0 is slow slew rate, 1 is fast slew rate
> > +          enum: [ 0, 1 ]
> > +        drive-strength:
> > +          enum: [ 2, 4, 8, 12 ]
> > +
> > +    - type: object
> > +      additionalProperties:
> > +        $ref: "#/additionalProperties/anyOf/0"
> 
> Your example does not use any subnodes, so this looks not needed.

The example has subnodes, as in the following excerpt from the example:

            rp1-uart0-14-15 {
                pin_txd {
                    function = "uart0";
                    pins = "gpio14";
                    bias-disable;
                };

                pin_rxd {
                    function = "uart0";
                    pins = "gpio15";
                    bias-pull-up;
                };
            };

Many thanks,
Andrea

[1] - Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml

> 
> Best regards,
> Krzysztof
> 


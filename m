Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D312215CF
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 22:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgGOUKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 16:10:13 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:39596 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgGOUKI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 16:10:08 -0400
Received: by mail-il1-f194.google.com with SMTP id k6so3111854ili.6;
        Wed, 15 Jul 2020 13:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rmVtJlWO28OOYfQ7+3Cqk4pCJzcKCbIXhxW473pP140=;
        b=MQnX2pCFZXYyxRGSpVSzPW+LVfgzWZqdqbEKz4n3PEwbEiaMNGq/lwXcJEew1aohZe
         xo2DUlIFt7XwEzDY7HfDHQ1SXj0QmR5U0gv9Fbxof6jOwzh2b5EnOfEC13SULpBsuLDx
         jY2Fx6anmNW3O05gBtCY07WElrXYs20NUqdsc/BdeTgBLWrArT5Yl2sEDgJ74EdAMERk
         uf0r2HoCPexsj4mHKjcWLgYIEHPyjcEitMvdJz0fdOFU0nC0OFxWHXHycF4MC4AGbJNm
         eTRQOWWao0W5ArXGctpYqTp6pxasjD0KBVK9ixRXx/8Sxtpn/YlLSp0SAqs5BWjcfW7P
         s3uQ==
X-Gm-Message-State: AOAM530qsEYuSRGomQEpXudi6IZa8KC9signcxoAdoypCMfZRTQRrX6S
        f/EaCJ6Fkzf6FcNSgh8GBQ==
X-Google-Smtp-Source: ABdhPJzOXUHR2YApwW/xqgdoIvFiii1UPpVML18Gnab6Oq9EntcKo7Ry/ClzqXv+/yh8XoRD1BmWsw==
X-Received: by 2002:a92:1b8c:: with SMTP id f12mr1150301ill.93.1594843806690;
        Wed, 15 Jul 2020 13:10:06 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id x1sm1545157ilh.29.2020.07.15.13.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 13:10:05 -0700 (PDT)
Received: (nullmailer pid 739658 invoked by uid 1000);
        Wed, 15 Jul 2020 20:10:04 -0000
Date:   Wed, 15 Jul 2020 14:10:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Convert to
 json-schema
Message-ID: <20200715201004.GA735389@bogus>
References: <20200626143638.16512-1-geert+renesas@glider.be>
 <20200628163902.GI1105424@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200628163902.GI1105424@oden.dyn.berto.se>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 28, 2020 at 06:39:02PM +0200, Niklas Söderlund wrote:
> Hi Geert,
> 
> Thanks for your work.
> 
> On 2020-06-26 16:36:38 +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas RZ/A2 combined Pin and GPIO controller Device Tree
> > binding documentation to json-schema.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  .../bindings/pinctrl/renesas,rza2-pinctrl.txt |  87 ---------------
> >  .../pinctrl/renesas,rza2-pinctrl.yaml         | 100 ++++++++++++++++++
> >  2 files changed, 100 insertions(+), 87 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> > deleted file mode 100644
> > index a63ccd476cdaf919..0000000000000000
> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> > +++ /dev/null
> > @@ -1,87 +0,0 @@
> > -Renesas RZ/A2 combined Pin and GPIO controller
> > -
> > -The Renesas SoCs of the RZ/A2 series feature a combined Pin and GPIO controller.
> > -Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> > -Each port features up to 8 pins, each of them configurable for GPIO
> > -function (port mode) or in alternate function mode.
> > -Up to 8 different alternate function modes exist for each single pin.
> > -
> > -Pin controller node
> > --------------------
> > -
> > -Required properties:
> > -  - compatible: shall be:
> > -    - "renesas,r7s9210-pinctrl": for RZ/A2M
> > -  - reg
> > -    Address base and length of the memory area where the pin controller
> > -    hardware is mapped to.
> > -  - gpio-controller
> > -    This pin controller also controls pins as GPIO
> > -  - #gpio-cells
> > -    Must be 2
> > -  - gpio-ranges
> > -    Expresses the total number of GPIO ports/pins in this SoC
> > -
> > -Example: Pin controller node for RZ/A2M SoC (r7s9210)
> > -
> > -	pinctrl: pin-controller@fcffe000 {
> > -		compatible = "renesas,r7s9210-pinctrl";
> > -		reg = <0xfcffe000 0x1000>;
> > -
> > -		gpio-controller;
> > -		#gpio-cells = <2>;
> > -		gpio-ranges = <&pinctrl 0 0 176>;
> > -	};
> > -
> > -Sub-nodes
> > ----------
> > -
> > -The child nodes of the pin controller designate pins to be used for
> > -specific peripheral functions or as GPIO.
> > -
> > -- Pin multiplexing sub-nodes:
> > -  A pin multiplexing sub-node describes how to configure a set of
> > -  (or a single) pin in some desired alternate function mode.
> > -  The values for the pinmux properties are a combination of port name, pin
> > -  number and the desired function index. Use the RZA2_PINMUX macro located
> > -  in include/dt-bindings/pinctrl/r7s9210-pinctrl.h to easily define these.
> > -  For assigning GPIO pins, use the macro RZA2_PIN also in r7s9210-pinctrl.h
> > -  to express the desired port pin.
> > -
> > -  Required properties:
> > -    - pinmux:
> > -      integer array representing pin number and pin multiplexing configuration.
> > -      When a pin has to be configured in alternate function mode, use this
> > -      property to identify the pin by its global index, and provide its
> > -      alternate function configuration number along with it.
> > -      When multiple pins are required to be configured as part of the same
> > -      alternate function they shall be specified as members of the same
> > -      argument list of a single "pinmux" property.
> > -      Helper macros to ease assembling the pin index from its position
> > -      (port where it sits on and pin number) and alternate function identifier
> > -      are provided by the pin controller header file at:
> > -      <dt-bindings/pinctrl/r7s9210-pinctrl.h>
> > -      Integers values in "pinmux" argument list are assembled as:
> > -      ((PORT * 8 + PIN) | MUX_FUNC << 16)
> > -
> > -  Example: Board specific pins configuration
> > -
> > -	&pinctrl {
> > -		/* Serial Console */
> > -		scif4_pins: serial4 {
> > -			pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
> > -				 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
> > -		};
> > -	};
> > -
> > -  Example: Assigning a GPIO:
> > -
> > -	leds {
> > -		status = "okay";
> > -		compatible = "gpio-leds";
> > -
> > -		led0 {
> > -			/* P6_0 */
> > -			gpios = <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIVE_HIGH>;
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> > new file mode 100644
> > index 0000000000000000..b7911a994f3a9f12
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> > @@ -0,0 +1,100 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/renesas,rza2-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/A2 combined Pin and GPIO controller
> > +
> > +maintainers:
> > +  - Chris Brandt <chris.brandt@renesas.com>
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +description:
> > +  The Renesas SoCs of the RZ/A2 series feature a combined Pin and GPIO
> > +  controller.
> > +  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> > +  Each port features up to 8 pins, each of them configurable for GPIO function
> > +  (port mode) or in alternate function mode.
> > +  Up to 8 different alternate function modes exist for each single pin.
> 
> This paragraph formatting looks odd, but I'm not sure it's intentional 
> or not :-) In either case with or without this changed,

If you do want the formatting here maintained, you need a '|'.

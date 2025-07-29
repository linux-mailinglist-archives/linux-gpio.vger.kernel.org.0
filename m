Return-Path: <linux-gpio+bounces-23879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5FDB14DF0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 14:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1354E0F4D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 12:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD713595E;
	Tue, 29 Jul 2025 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY/vFbI9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186111482F2;
	Tue, 29 Jul 2025 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793564; cv=none; b=K01b3Pbt4QpEM7Z6mbJV79jSYiWadwYGzmS6xxz4f4314I3LEtvYZvcitM02u0xIyBKQ2vrKTncinpC6/6Ypj3zXQC7tKMl/bv4Z7rtozXuR4jQTKt2OYN7q+UhhdifEHNy3v+G3nXolybpE1xEfN1DS+WRTpdjBZ3Rynm/QveM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793564; c=relaxed/simple;
	bh=L+2CqPqgje734jG9cTAM0aBctV3Qsf3UI/4XXw3qqX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdzJFV/xu0g+vRN+F3IJZ7i0/HMSoLrODktjxmb5cai1VvvKyoTjClTpk+VFSyUcjkGz5yO4AUN488SwqmOjCfJUGHAlvDj7Yh/Iz0GNsNLJMURGGck1fiui8G0YCtS0kghaNmzS5w1nL/NymndF0H9R+RE7TFGc8CGy/k+mhGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HY/vFbI9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so30048765e9.2;
        Tue, 29 Jul 2025 05:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753793560; x=1754398360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ge53nH6bitDeZFkLEZL9rCwm7z9pJHAxRUvM4zc8acE=;
        b=HY/vFbI9pwQ+WWC0YoxX6wvvebRKJNsZC81NaeD2ehCIuWRV/r5VsQD5Qts4kUMMaH
         /o0IYpEXZWv5dYdFTEHyJNo4WIAfs85Oxoufq609+iUNdAm0WoBLjfez+g0jcItO0IBf
         ptFWsuvPhD90bXfzHvturmH88vatNX0qIcjYB+EoDK82QTy/AaeNk0Xc3nefQgj5U4MZ
         771m50aWcwWq+sBoOxg48ZL46QKZOgfLWtxVZog/8tE7mpH+HvNY8NNBy/sPMaxlKAVm
         5NfR2xt9Y68/HA650A0T3p5L9q4onAjDqYsXLrCxUPhS0Ie5bVwHdYWp6Ao6HqPJQ7aV
         0b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753793560; x=1754398360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ge53nH6bitDeZFkLEZL9rCwm7z9pJHAxRUvM4zc8acE=;
        b=C1c5akNY/jeA3MzhPkoSR3vtgkHwg5p0oiKZ4v0L+J6shE+6yE9R23f2rS3SrbTLfN
         FnvdpjnCP2QkJN+JFRNI2eEuUqCtRXTGSV+OA5iDkpH/jXghaVKNtRe6ci4inObojke2
         2h+0Td7xZssFzm9Lbo0/5c+B9P5/+SzVj54bcF8nWPDvCIlDopVDoMmsJoTgMHgJmNtG
         wuzHPaKbt5fo6Q9ktd1+oBcHCLqawmF/9C+lpwRtZxWT9nAacxfjJK+8z4x06qKkxrE3
         ay2BXEBWYUbPqCmu/vFX+oQ7yFyMinaHglSxMR/hkUdCHJJv0P+12RiFOmhk8yMwue+4
         rkyw==
X-Forwarded-Encrypted: i=1; AJvYcCURlgGcz3TOAN4KDEE44G0jVbwL/w6rj4u8CvEpCZN4iEx8TBW9kNFncYbCpUGKIdpEsZDdAkdv2EmIeA==@vger.kernel.org, AJvYcCVdjRUx52yUWxiRbeYjN1zqNlAvH27Q46MomosYPSnuXEv8nhxY2wK3lUGJjy9TUum0ozgm2/ro3ZftUMZfvk/m7do=@vger.kernel.org, AJvYcCWmnuLXUox4Dm7aRhdzzIO/UownG7rzNV8byGPcox+rFpz/3EBdsUydzV5RIUVyimkBZRjCMd7G4rDjJvaS@vger.kernel.org, AJvYcCXPibs6MW7tMTc0acqwLzU+LbGHrauA3zN4hfzs4kpiUZEOb+2DFgDAvC6KbEtLuJRAdRbUUIVeTri2@vger.kernel.org
X-Gm-Message-State: AOJu0YxEHopvWFeNWQgONMCI65PdAuwPhLepW7Gt4cTkF+eDcdqHYtB4
	LlruQ4yesuCLhEODcTypAzsLclm3trnYwIklzvmbZP7nxkN6maCMtQEjdzBGuuWqH4uxeuJGM6b
	D0nXNLsF9He6ybUkAZmC4GZ5SAiPUsjY=
X-Gm-Gg: ASbGnctn1C90aSIOZsSRrJzlOGFeGO695Nx6XAIpgDZNGCUBnDNARVzeo3OMO9MB9PI
	VSxgX1OEgjePY9HYQLf2OYXQsiczylKdcmIqvXrg8q+V7m6zUk8NMwTDb8jUt0jyXaFoTz+57Vd
	PTicmKhoCrxxYqdlVE+gxQ1Wxv4TzcuW9Ushtgc6xDV0EBn6cbNNXW45OKFIv3s2nhKwfFwf+3b
	/czfYM3
X-Google-Smtp-Source: AGHT+IHmEUgNsJikVSSexxqE0aywDjib3TMIMbiD91jDYyEh7mEsKxVANsUY+seER0D+k/5lZvToKu18Lu8GlkV1Vik=
X-Received: by 2002:a05:600c:3144:b0:456:1b6b:daaa with SMTP id
 5b1f17b1804b1-4587644b039mr111782445e9.29.1753793559984; Tue, 29 Jul 2025
 05:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707141848.279528-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250707141848.279528-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250708195525.GA837365-robh@kernel.org>
In-Reply-To: <20250708195525.GA837365-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 29 Jul 2025 13:52:14 +0100
X-Gm-Features: Ac12FXz5MzaASfnpCMMl_wfutARfPO-Vh4VPM0-wY1hf9tSQHkTFrMmEzgmlqUg
Message-ID: <CA+V-a8tiNRontyNLXEZEtj+SyCm+gKe+0e1aV=pboWJHPOvDfw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and
 RZ/N2H SoCs
To: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review, sorry for the late reply.

On Tue, Jul 8, 2025 at 8:55=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jul 07, 2025 at 03:18:46PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the pin and GPIO controller IP for the Renesas RZ/T2H
> > (R9A09G077) and RZ/N2H (R9A09G087) SoCs, and add the shared DTSI
> > header file used by both the bindings and the driver.
> >
> > The RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins.
> > Both share the same controller architecture; separate compatible
> > strings are added for each SoC to distinguish them.
> >
> > Co-developed-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Dropped refference to gpio.txt instead pointed to
> >   in include/dt-bindings/gpio/gpio.h.
> >
> > v1->v2:
> > - Added a new DT binding file
> > ---
> >  .../pinctrl/renesas,rzt2h-pinctrl.yaml        | 132 ++++++++++++++++++
> >  .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +++
> >  2 files changed, 154 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,r=
zt2h-pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinct=
rl.h
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctr=
l.yaml
> > new file mode 100644
> > index 000000000000..ead5ab7e7ebb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.y=
aml
> > @@ -0,0 +1,132 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/renesas,rzt2h-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/T2H Pin and GPIO controller
> > +
> > +maintainers:
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +description:
> > +  The Renesas RZ/T2H SoC features a combined Pin and GPIO controller.
> > +  Pin multiplexing and GPIO configuration is performed on a per-pin ba=
sis.
> > +  Each port features up to 8 pins, each of them configurable for GPIO =
function
> > +  (port mode) or in alternate function mode.
> > +  Up to 8 different alternate function modes exist for each single pin=
.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,r9a09g077-pinctrl # RZ/T2H
> > +      - renesas,r9a09g087-pinctrl # RZ/N2H
> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: Non-safety I/O Port base
> > +      - description: Safety I/O Port safety region base
> > +      - description: Safety I/O Port Non-safety region base
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: nsr
> > +      - const: srs
> > +      - const: srn
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +    description:
> > +      The first cell contains the global GPIO port index, constructed =
using the
> > +      RZT2H_GPIO() helper macro from <dt-bindings/pinctrl/renesas,r9a0=
9g077-pinctrl.h>
> > +      (e.g. "RZT2H_GPIO(3, 0)" for P03_0). The second cell represents =
the consumer
> > +      flag. Use the macros defined in include/dt-bindings/gpio/gpio.h.
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +additionalProperties:
> > +  anyOf:
> > +    - type: object
> > +      additionalProperties: false
> > +      allOf:
> > +        - $ref: pincfg-node.yaml#
> > +        - $ref: pinmux-node.yaml#
> > +
> > +      description:
> > +        Pin controller client devices use pin configuration subnodes (=
children
> > +        and grandchildren) for desired pin configuration.
> > +        Client device subnodes use the below standard properties.
> > +
> > +      properties:
> > +        pinmux:
> > +          description:
> > +            Values are constructed from GPIO port number, pin number, =
and
> > +            alternate function configuration number using the RZT2H_PO=
RT_PINMUX()
> > +            helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-p=
inctrl.h>.
> > +        pins: true
> > +        gpio-hog: true
> > +        gpios: true
> > +        input: true
> > +        input-enable: true
> > +        output-enable: true
> > +        output-high: true
> > +        output-low: true
> > +        line-name: true
> > +
> > +    - type: object
> > +      additionalProperties:
> > +        $ref: "#/additionalProperties/anyOf/0"
>
> Again, please define some common suffix or prefix for the node names.
> Any name is for existing bindings *only*.
>
> patternProperties:
>   '-pins$':
>      type: object
>      ...
>
>   '-state$':
>      type: object
>      additionalProperties:
>        $ref: '#/patternProperties/-pins$'
>
> I don't care what prefixes you use here...
>
> (Note some regex's don't work as JSON pointers and then you would have
> to use a $defs section.)
>
Ok, I'll switch to patter properties like below. Ive added properties
for group/pins/hog

- group pattern, will include nodes with multiple pins node
- pins pattern, will contain single node
- hog pattern, will contain gpio hog node


Please let me know if the below approach is OK.

patternProperties:
  '.*-group$':
    type: object
    description:
      Pin controller client devices can organize pin configuration entries =
into
      grouping nodes ending in "-group". These group nodes may contain mult=
iple
      child nodes each ending in "-pins" to configure distinct sets of pins=
.
    additionalProperties: false
    patternProperties:
      '-pins$':
        type: object
        description: >-
          Pin configuration subnodes of a "-group" for desired pin settings=
.
        allOf:
          - $ref: pincfg-node.yaml#
          - $ref: pinmux-node.yaml#
        properties:
          pinmux: true
          pins: true
          gpio-hog: true
          gpios: true
          input: true
          input-enable: true
          output-enable: true
          output-high: true
          output-low: true
          line-name: true
        additionalProperties: false

  '-pins$':
    type: object
    description:
      Pin controller client devices use pin configuration subnodes (childre=
n
      and grandchildren) for desired pin configuration.
      Client device subnodes use the below standard properties.
    allOf:
      - $ref: pincfg-node.yaml#
      - $ref: pinmux-node.yaml#

    properties:
      pinmux:
        description:
          Values are constructed from GPIO port number, pin number, and
          alternate function configuration number using the RZT2H_PORT_PINM=
UX()
          helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.=
h>.
      pins: true
      gpio-hog: true
      gpios: true
      input: true
      input-enable: true
      output-enable: true
      output-high: true
      output-low: true
      line-name: true

    additionalProperties: false

  '-hog$':
    type: object
    description: GPIO hog node
    required:
      - gpio-hog
      - gpios
    properties:
      gpio-hog: true
      gpios: true
      input: true
      input-enable: true
      output-enable: true
      output-high: true
      output-low: true
      line-name: true
    additionalProperties: false

allOf:
  - $ref: pinctrl.yaml#

required:
  - compatible
  - reg
  - reg-names
  - gpio-controller
  - '#gpio-cells'
  - gpio-ranges
  - clocks
  - power-domains

unevaluatedProperties: false

examples:
  - |
    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
    #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>

    pinctrl@802c0000 {
        compatible =3D "renesas,r9a09g077-pinctrl";
        reg =3D <0x802c0000 0x2000>,
              <0x812c0000 0x2000>,
              <0x802b0000 0x2000>;
        reg-names =3D "nsr", "srs", "srn";
        clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
        gpio-controller;
        #gpio-cells =3D <2>;
        gpio-ranges =3D <&pinctrl 0 0 288>;
        power-domains =3D <&cpg>;

        sci_pins: serial0-pins {
            pinmux =3D <RZT2H_PORT_PINMUX(38, 0, 1)>, /* Tx */
                     <RZT2H_PORT_PINMUX(38, 1, 1)>; /* Rx */
        };

        sd1-pwr-en-hog {
            gpio-hog;
            gpios =3D <RZT2H_GPIO(39, 2) 0>;
            output-high;
            line-name =3D "sd1_pwr_en";
        };

        i2c0_pins: i2c0-pins {
            pins =3D "RIIC0_SDA", "RIIC0_SCL";
            input-enable;
        };

        sdhi0_sd_pins: sd0-sd-group {
            sd0-sd-ctrl-pins {
                pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
            };

            sd0-sd-data-pins {
                pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
            };

            sd0-sd-tmp-pins {
                pins =3D "RIIC0_SDA", "RIIC0_SCL";
                input-enable;
            };
        };
    };

Cheers,
Prabhakar


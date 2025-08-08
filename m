Return-Path: <linux-gpio+bounces-24102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A46B1F030
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 23:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EE52A07F9D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 21:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E48261593;
	Fri,  8 Aug 2025 21:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx1n3RPn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756D1230D08;
	Fri,  8 Aug 2025 21:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754687637; cv=none; b=Ln+u4YelIPyB/oWagXn2QwUMG/BtozEuIQKKXKzB9xwMVIJ42O5f7jxnc2xtMeLoVZR4qO5hGWyhh7jlxiOp15uV6WbtjNM4lW53RA1rzhdFqKFKmoRHsZ4G0IhoUB8iX0jCiEx9GVFPvb72UQ5ZjawOxE7+C4Ua9EKzOq6bx2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754687637; c=relaxed/simple;
	bh=mRuCtcvgDwL/i8mQeda3yTLf+hBviZW7cVtfbYoeA7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxGjiEzvhOCqAAkS2taVVLfEYGHLnz+61yUDUWQFZ9EjL59DQo4sOCmwOlmom8LBYs9BzgD12UAR+O6yK+otv/WbTIpDR24GRw3LMFa8NLFtKo3ZvOIeAI0+0Qn6rCgWFZVsGiQAjFFDhk6epjztjH0NVriYBTSl5ishY+qeoz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx1n3RPn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-459e1338565so23871785e9.2;
        Fri, 08 Aug 2025 14:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754687634; x=1755292434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tp3+FIllYsWJUlYv0jAaKS6vHtG9mL5wynm3GQy29D4=;
        b=Lx1n3RPnk9a4g4bGgkk9ojAGSI/EdzzB+k9BlPOwpNW/WxhRpAYIOaG7y7PMlQhmAS
         aa4MPuQHFgy9fu+ZfY7PCOyNy2aObDE4f/c7Uiibcqdmi0FnEGVyKy8ySa/qvwlBECcU
         +vJCsHOHQ3f3AnQR7O2cSJvM+uC8PIF0p/7ZST+l224I22FahbvbR/jF65EtlTvh6ka2
         4UlZIknCj6lpbuXVtTSSW2PWQUpTj896bu7qZEB6wtOfnbQtnLKh3lKURCtxpl3xLC5C
         mZWSqTHdau8ArvD7XrukkMPLjaRwuE1xh067DxWnzTjUqb+ZeZxXi0Fyc0ofYgtquORk
         RCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754687634; x=1755292434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tp3+FIllYsWJUlYv0jAaKS6vHtG9mL5wynm3GQy29D4=;
        b=N5W4JAufHPfufqJvG5dVqKu4Yx4Z1D0bLYp1a2znfLZGz7dQZilu3dgux6suzo12Nd
         74AEx3S9aQG0xqJeX5Or/o3OLHRRKhotwYJTfO5L3LNA1NVsnnX5mAo/NNwN2KIED/l6
         JGQxUrZrMBbMevh+5L+luwKq6RmNG/dxch7g06CKCWbn57RK4Jrc6IQPkDyCzMAKI8Xy
         JpV/alZfnUw8o9Hr2jk7f3L9Vp+TTXnAjquP1V4F57bSZqE1rS0o70CZOpJZqY/rFOsE
         tvzwxZ75ERDm+u8R+4b1NFm/WoqgVJrCXeG5BKO9kkGuWuFF8UgQC3el40LqcOVYpNM3
         l0/g==
X-Forwarded-Encrypted: i=1; AJvYcCUdZ3Mu5K42QHJgJlP4Opoaw9IniOYCPG47WbYqs8rVnXNKzPRbq3neDb2f18Yjkzj7Divo3eME4kzVlGCt@vger.kernel.org, AJvYcCVRGrMT5+Ap4Qn0fIMiqerOHLfM8olwRMNq0XC7ZoPR5EjwtEoVBWG+wVIoNVx/qzUvexWoQwUcDgigNg==@vger.kernel.org, AJvYcCWT/qxlhkOJcNCaipNfnSkStPU/aDRDwZ8DDlTqn4vMEh+q2/MZiydkJGuU3AqkambI/ozHrEnoSCXW@vger.kernel.org, AJvYcCWeirXFcwl3cKE7cGMiipqiug4DGgF/sySTj8tWDlLiNt299OLflXdPRycR/Z3azZCRzC51eq7oo+gEyYEprIIEJac=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTjigs6EiUqktDqEcNLW7lu7DjgNMJtfbJgbGKxevngHt2Y7t4
	INCUYvbQLYUBYf/7ZftyJZhMdmF9ObAfPHhAVjgfH8BYZvUl8ZM2+v2/9czUSFqN+Z9XO70kOxp
	4cgF3VsNlda0vtbGJUWKus2qGX93TEwk=
X-Gm-Gg: ASbGnctSlwt50nB/eHst299CGwjQHuH9ODD1/4y52qF0EJEnAY+iGaSYhcW1nMoID3S
	DQIeT+51BdCyt83yCOcfe2rxuHsV2zgL/ordN5Z3QRJe26sLBWxdz4uKR/J85e920B2moDrrBVl
	ZYfieczG1xIDY+uuxyTOZNfz/LHzvWEqaHI9XoQ9uqRPZ3xu4zZIJyU8FT45KLuweLc1AufbZdn
	MOCUfUlVgGl8NnN
X-Google-Smtp-Source: AGHT+IG8woTmUyThhcGiDjaAjZYzzo4aJ2GfJ4j2sp6SNmByrXFVMEhoU5BL7fQy/oyGmdlzP66K1NMKCtWfc/a6Fjs=
X-Received: by 2002:a05:6000:310b:b0:3a4:fea6:d49f with SMTP id
 ffacd0b85a97d-3b900b7a325mr3724851f8f.49.1754687633270; Fri, 08 Aug 2025
 14:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250801154550.3898494-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWApWhAzjJ9K9-SFvZYtPArZ9aFQJvMdMyW=ke+1sj5CA@mail.gmail.com>
In-Reply-To: <CAMuHMdWApWhAzjJ9K9-SFvZYtPArZ9aFQJvMdMyW=ke+1sj5CA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 8 Aug 2025 22:13:26 +0100
X-Gm-Features: Ac12FXzA-p2NBSMp2Ye_voip0aySzQE6rZqoL7WDMXbODc7_TBLnX-TEiOKaE5U
Message-ID: <CA+V-a8u0GkeFS+t_GDj1ku9rqjH_oGhJ19=EkNGP0m-vzAD=fg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and
 RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Aug 8, 2025 at 8:51=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 1 Aug 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
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
> > v3->v4:
> > - Used patternProperties for pin configuration nodes
> > - Expanded example nodes
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.y=
aml
> > @@ -0,0 +1,177 @@
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
> > +definitions:
> > +  renesas-rzt2h-n2h-pins-node:
> > +    type: object
> > +    allOf:
> > +      - $ref: pincfg-node.yaml#
> > +      - $ref: pinmux-node.yaml#
> > +    properties:
> > +      pinmux:
> > +        description:
> > +          Values are constructed from I/O port number, pin number, and
> > +          alternate function configuration number using the RZT2H_PORT=
_PINMUX()
> > +          helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pin=
ctrl.h>.
> > +      pins: true
> > +      phandle: true
> > +      input: true
> > +      input-enable: true
> > +      output-enable: true
> > +    oneOf:
> > +      - required: [pinmux]
> > +      - required: [pins]
> > +    additionalProperties: false
> > +
> > +patternProperties:
> > +  # Grouping nodes: allow multiple "-pins" subnodes within a "-group"
> > +  '.*-group$':
> > +    type: object
> > +    description:
> > +      Pin controller client devices can organize pin configuration ent=
ries into
> > +      grouping nodes ending in "-group". These group nodes may contain=
 multiple
> > +      child nodes each ending in "-pins" to configure distinct sets of=
 pins.
> > +    additionalProperties: false
> > +    patternProperties:
> > +      '-pins$':
> > +        $ref: '#/definitions/renesas-rzt2h-n2h-pins-node'
> > +
> > +  # Standalone "-pins" nodes under client devices or groups
> > +  '-pins$':
> > +    $ref: '#/definitions/renesas-rzt2h-n2h-pins-node'
> > +
> > +  '-hog$':
> > +    type: object
> > +    description: GPIO hog node
> > +    properties:
> > +      gpio-hog: true
> > +      gpios: true
> > +      input: true
> > +      output-high: true
> > +      output-low: true
> > +      line-name: true
> > +    required:
> > +      - gpio-hog
> > +      - gpios
> > +    additionalProperties: false
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +  - gpio-ranges
> > +  - clocks
> > +  - power-domains
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
> > +    #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> > +
> > +    pinctrl@802c0000 {
> > +        compatible =3D "renesas,r9a09g077-pinctrl";
> > +        reg =3D <0x802c0000 0x2000>,
> > +              <0x812c0000 0x2000>,
> > +              <0x802b0000 0x2000>;
> > +        reg-names =3D "nsr", "srs", "srn";
> > +        clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
> > +        gpio-controller;
> > +        #gpio-cells =3D <2>;
> > +        gpio-ranges =3D <&pinctrl 0 0 288>;
> > +        power-domains =3D <&cpg>;
> > +
> > +        serial0-pins {
> > +            pinmux =3D <RZT2H_PORT_PINMUX(38, 0, 1)>, /* Tx */
> > +                     <RZT2H_PORT_PINMUX(38, 1, 1)>; /* Rx */
> > +        };
> > +
> > +        sd1-pwr-en-hog {
> > +            gpio-hog;
> > +            gpios =3D <RZT2H_GPIO(39, 2) 0>;
> > +            output-high;
> > +            line-name =3D "sd1_pwr_en";
> > +        };
> > +
> > +        i2c0-pins {
> > +            pins =3D "RIIC0_SDA", "RIIC0_SCL";
> > +            input-enable;
> > +        };
> > +
> > +        sdhi0_sd_pins: sd0-sd-group {
>
> No need for unused labels in examples.
>
Agreed, I will drop it.
> > +            sd0-sd-ctrl-pins {
>
> Drop the "sd0-sd-" prefix?
>
ditto.

> > +                pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CL=
K */
> > +                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD =
*/
> > +            };
> > +
> > +            sd0-sd-data-pins {
>
> Likewise.
>
ditto.

> > +                pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CL=
K */
> > +                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD =
*/
> > +            };
> > +
> > +            sd0-sd-tmp-pins {
> > +                pins =3D "RIIC0_SDA", "RIIC0_SCL";
> > +                input-enable;
> > +            };
>
> Please drop this subnode? It totally confuses me ;-)
>
I did drop this in the v5 series [0].

https://lore.kernel.org/all/20250808133017.2053637-2-prabhakar.mahadev-lad.=
rj@bp.renesas.com/

> > +        };
> > +    };
>
> The rest LGTM, so with the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Cheers,
Prabhakar


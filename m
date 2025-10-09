Return-Path: <linux-gpio+bounces-26920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD58BC7717
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 07:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA4134F1A0C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 05:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C602627EC;
	Thu,  9 Oct 2025 05:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpCU7CrJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384CB2609D9
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 05:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759988139; cv=none; b=MPGbP7nqaNg2jIjdnjeDvU8J105EkgbtKhtCDtgJ1oZn0AoD28EGZvzEdiObXD/iTrHmfDaRRVWmR5CJgQ3KyHHRtasqcBpt1eKVQzILyggSN4CyD1QNZixztMpolm6kGtuaAD4ihrheY3oDK2HefyKQuj1Q962oO2XsX1ksvUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759988139; c=relaxed/simple;
	bh=BTgTHwCRBA2rpvydRjKgExKMcfvUeqSUe1HHihN2Z4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIAtYSzlEWwAj6HvLUI8DTSZu1j3PWLen/42ulKu/7OYW3zEBDBNVXWJke5olG0n78l8QPGfgO5uPnShHGUbBetAQkxubGb1WoTKSsvJKY+NhnByuGPZel1KKKhrkGJrr7q/EfdKbbBhkXBSaN3OoJvOEUC4lIyl/B5W+79suA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpCU7CrJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso470050f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 22:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759988134; x=1760592934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wojdy8oISaReFb3V/aujCr+dYfQppmzTEbdq6Sq+uyc=;
        b=cpCU7CrJ7ZCcqy9vu7RSEA/EpVmHnNGwO6NIeZCA8ztS+5lbdoH4JA7bFKb+0oApst
         ZCtXvd5fJSDdLB6SEfhvxzC/NbKNyEfUNCJoJ2Iz4C/xmF9fvTfZcZvZ5kkFdZ7Y240k
         5TNrE4EmjSTu+C4FuqTnM1vOeb/bzLjORBXK1gaAlYg438cYaxwcNGRCoTo3hl+YWeEn
         zssYQh7Lf3mfbVwx9ydOrWwqtN+waicwF1cPc5R25akkudcHxIutk1d9uBVyeAzV/Ktc
         2H9sYaeK05mRMg00zrqm86840MjZRMarvk5q8XSyrHfsLN8ZxODio1RGzPGEbvCCfyOz
         u8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759988134; x=1760592934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wojdy8oISaReFb3V/aujCr+dYfQppmzTEbdq6Sq+uyc=;
        b=gIQHwhSH5N3AE7wZaUAWPLZvfXQzkHCUQJVfk6zlMdmr0i7RssuGQmN+q1coHHGWEb
         JefB4J0Z2xOsM2UT8mK6A0SjRAUp6DLPEYCCNd8h/3mxy2BiRvs8sKKh587sTDyWFahB
         d4MHetKCEVlIWgliL3KN664EBPyIePgUDNk1Pzab7BteBsF/zUCwkeM9t0xcvyiwBvgl
         sbkR6R/5xrMYeM3o3kjc5t5Mz0Ru+4NRPm7xyJo44snDNt8tb9IQys29U8HZ1sQZzsPh
         LKRfQ1X+wqOxf+k3yOAsSIW/12vFGjhobeDOvzx0kzIY1ubFO5WaYppPh+9OQWxHqn9q
         eJrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrSWCZ7Pz7LI8WCKJ7bjW+ZaUERLVbJmgDruXgBPLStMeeSGeDpKEMX6oMxhONxdlB20oLnWdJ4RKj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61UAukvFXxTUU3YypbqhsavYIyZk1fb40RKJz7CdQL1LoCN0d
	zsDI0NWVlvgG/tSm/VlqffZi1s3k28zY0/QVnXgU4lJIJlemeY3OrE2/LEneO2q8LGFzsgtq8P2
	N9OopGkaWW1oHXcznc96UaFjaeJeXb4E=
X-Gm-Gg: ASbGnct5zOqwEeJUD4CFNaAWAr1QbR04MQTD2lNfX42YMjptXD3Kpo6oLDX0QTNearX
	XPb6XbYkbXLnuWuOfh2yWQpdRfvqUeuH7ir1jOHTUDUTGeO5/hjgNz48qpINggg3V4CcqyPGNJC
	3BW7T+xQcd86+4tWVcDTf3Cda79MOFHkVKYnM3UUu4Zv1HxMlXZz47e4c2HM2OKVik+z9yX39of
	MW1y/+1pAjsmw6kLbkxBu/toQ336m2tB2CrdRPeKVQ=
X-Google-Smtp-Source: AGHT+IGSKa0WWY8sQb7NirdhuUY9zlBVWAF8olfr4D2aOoKgmjKIIKXTBxs4oAP40QHdR3v89s2ItSY5dd09ZKpNd5w=
X-Received: by 2002:a05:6000:186c:b0:3ed:e1d8:bd68 with SMTP id
 ffacd0b85a97d-42666ac6107mr3102943f8f.7.1759988134193; Wed, 08 Oct 2025
 22:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-23-clamor95@gmail.com>
 <20251008-canopener-marsupial-a92355b656ef@spud> <20251008-broaden-antennae-02de66094ad3@spud>
In-Reply-To: <20251008-broaden-antennae-02de66094ad3@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 9 Oct 2025 08:35:22 +0300
X-Gm-Features: AS18NWAoEWc39K5OD4GIBOR3Awt1LVDq6NQUxGEQwh6PoTXJKtyEajbgSJmBgBo
Message-ID: <CAPVz0n1NYL+t-KC1FwHYXuQ0C483ay3g8zP4SmBKVC2rh=x4Bg@mail.gmail.com>
Subject: Re: [PATCH v4 22/24] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
To: Conor Dooley <conor@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:22=
 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Oct 08, 2025 at 10:21:06PM +0100, Conor Dooley wrote:
> > On Wed, Oct 08, 2025 at 10:30:44AM +0300, Svyatoslav Ryhel wrote:
> > > Document CSI HW block found in Tegra20 and Tegra30 SoC.
> > >
> > > The #nvidia,mipi-calibrate-cells is not an introduction of property, =
such
> > > property already exists in nvidia,tegra114-mipi.yaml and is used in
> > > multiple device trees. In case of Tegra30 and Tegra20 CSI block combi=
nes
> > > mipi calibration function and CSI function, in Tegra114+ mipi calibra=
tion
> > > got a dedicated hardware block which is already supported. This prope=
rty
> > > here is used to align with mipi-calibration logic used by Tegra114+.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++=
++
> > >  1 file changed, 135 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/tegra/n=
vidia,tegra20-csi.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra20-csi.yaml
> > > new file mode 100644
> > > index 000000000000..817b3097846b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
csi.yaml
> > > @@ -0,0 +1,135 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.=
yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NVIDIA Tegra20 CSI controller
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - nvidia,tegra20-csi
> > > +      - nvidia,tegra30-csi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks: true
> > > +  clock-names: true
> > > +
> > > +  avdd-dsi-csi-supply:
> > > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  "#nvidia,mipi-calibrate-cells":
> > > +    description:
> > > +      The number of cells in a MIPI calibration specifier. Should be=
 1.
> > > +      The single cell specifies an id of the pad that need to be
> > > +      calibrated for a given device. Valid pad ids for receiver woul=
d be
> > > +      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    const: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^channel@[0-1]$":
> > > +    type: object
> > > +    description: channel 0 represents CSI-A and 1 represents CSI-B
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        maximum: 1
> > > +
> > > +      nvidia,mipi-calibrate:
> > > +        description: Should contain a phandle and a specifier specif=
ying
> > > +          which pad is used by this CSI channel and needs to be cali=
brated.
> > > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: port receiving the video stream from the sensor
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            required:
> > > +              - data-lanes
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: port sending the video stream to the VI
> > > +
> > > +    required:
> > > +      - reg
> > > +      - "#address-cells"
> > > +      - "#size-cells"
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra20-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +
> > > +        clock-names: false
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra30-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +            - description: PAD A clock
> > > +            - description: PAD B clock
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: csi
> > > +            - const: csia-pad
> > > +            - const: csib-pad
> >
> > This clocks section seems like it could get simpler. Since the clock
> > descriptions are shared, and tegra20 has no clock-names, you could just
> > move the detail of the properties out to where you have the ": true"
> > stuff (we prefer that properties are defined outside of if/then/else
> > blocks) and just restrict them here. For tegra20 that'd be
> >
> > if:
> >   properties:
> >     compatible:
> >       contains:
> >         enum:
> >           - nvidia,tegra20-csi
> > then:
> >   properties:
> >     clocks:
> >       maxItems: 1
> >
> >     clock-names: false
> >
> > (although it could easily be maxItems: 1 ?)
> > and for tegra30
> >
> > if:
> >   properties:
> >     compatible:
> >       contains:
> >         enum:
> >           - nvidia,tegra30-csi
> > then:
> >   properties:
> >     clocks:
> >       minItems: 3
> >
> >     clock-names:
> >       maxItems: 3
> >
> > Of course you'd then have to add minItems: 1 and maxItems: 3 to the
> > extracted definitions.

What do you mean by your last statement? Add minItems: 1 and maxItems:
3 like this?

This does to common properties
  clocks:
    minItems: 1
    maxItems: 3
    items:
      - description: module clock
      - description: PAD A clock
      - description: PAD B clock

  clock-names:
    minItems: 1
    maxItems: 3
    items:
      - const: csi
      - const: csia-pad
      - const: csib-pad

This goes to conditional
 if:
   properties:
     compatible:
       contains:
         enum:
           - nvidia,tegra20-csi
 then:
   properties:
     clocks:
       maxItems: 1

     clock-names: false

 if:
   properties:
     compatible:
       contains:
         enum:
           - nvidia,tegra30-csi
 then:
   properties:
     clocks:
       minItems: 3

     clock-names:
       maxItems: 3

>
> Oh, also: if you want clock-names to ever actually be usable, you have
> to require it. Otherwise a driver must be written to handle it not being
> there.
>

Yes, driver takes this into account and handles it.

> > > +additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - power-domains
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +
> > > +# see nvidia,tegra20-vi.yaml for an example
> > > --
> > > 2.48.1
> > >
>
>


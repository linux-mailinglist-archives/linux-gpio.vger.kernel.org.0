Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44892569351
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 22:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234048AbiGFU2n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 16:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbiGFU2m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 16:28:42 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006C822B15;
        Wed,  6 Jul 2022 13:28:38 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m184so9482755wme.1;
        Wed, 06 Jul 2022 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tOoOhn8FVmzQ+tkrFYCMOF0p2TSkQpgRDmFh2oDbjpw=;
        b=fmdWbQGSc7cb/L7N7BiGwVipk+8dnxBzQ14j+QjrFct8Gvzhyy3RAYSzNzUI9jZxDf
         M8BE9UsWRCd4qpfIu2rUl0twgPDLf7p/ur6eN5AxPAVkZbHzW+3hhSdhxF3XUEwIOKX/
         tsYIN10xVohb/p9NAlbK8k0Ul6ilSDnMf4ffEzT0OjZFCCfIDCBLi9Ct6AIXtS7iRfRt
         yJFJL5APCP9lC/8Lu0OPrWtAJQeN7H8Zdt8zq09K+B19sPrHIoOPh5zUQpVvXOtrxuZF
         VmE7fGs7Z303Rt3RyWFsXe1L12ub0C04zY34P4CIifsClAVHrRWe/vF5tkInxYUkRyaD
         vvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tOoOhn8FVmzQ+tkrFYCMOF0p2TSkQpgRDmFh2oDbjpw=;
        b=fV6mTjYv1RM4qWWot0YIVrgfWdgsMJLHeiUQZ1lRCGedMCl54efe6xG/pFGUn/K39q
         x2v0ZZRrZVfGX/wnnP4TGh6GHUxAPra/Dv73xAwywWMIHz4B/d3qzOncUcfazjRgvbMA
         1shrm77csbVTxUTVHlJDPQtha29LRrG8KBCvO5M9Flm3nWbGjvwz9VXyPt43vrEoL5d3
         lnSyDcUzHqtMbYsdN0kCZe6u5MnUPtWeuUMu12uNcey7mNED2COo8zmst1fnaei28imM
         SaNx6I36wq8yvL9rG9X8uqYEdZKlmRtQZrzmLIEU6wnHvXL9JGONSwIAxYxc0aL8Sdxd
         lKew==
X-Gm-Message-State: AJIora9Klmu8iDvdELDqiO9vMvADaPLtRSH7zHdTxNZ6FJvpFIczy+1Q
        TZeRIo7qZ9y65a9jpr6cbhA=
X-Google-Smtp-Source: AGRyM1sFcg/GRX43vWxYglyLGvVR+Qr0fBW6KjZebryNWIG4jl+w4LTbEowP66erFClbWu4doh2NwA==
X-Received: by 2002:a7b:c4c5:0:b0:3a1:8f28:4f4 with SMTP id g5-20020a7bc4c5000000b003a18f2804f4mr389123wmk.173.1657139317131;
        Wed, 06 Jul 2022 13:28:37 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c020d00b0039c362311d2sm27114755wmi.9.2022.07.06.13.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 13:28:36 -0700 (PDT)
Date:   Wed, 6 Jul 2022 22:28:34 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: tegra: Convert to
 json-schema
Message-ID: <YsXwchhxAdSRPFzD@orome>
References: <20220704165802.129717-1-thierry.reding@gmail.com>
 <20220704165802.129717-2-thierry.reding@gmail.com>
 <20220706153822.GA54439-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ReY3aQ5DI/HmvsV0"
Content-Disposition: inline
In-Reply-To: <20220706153822.GA54439-robh@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ReY3aQ5DI/HmvsV0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 09:38:22AM -0600, Rob Herring wrote:
> On Mon, Jul 04, 2022 at 06:57:59PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the NVIDIA Tegra pinmux controller bindings from the free-form
> > text format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - wrap lines at 80 characters instead of the standard 100 characters in=
 Linux
> > - use GPL-2.0-only instead of GPL-2.0+ license for DT bindings
> > - reorder additionalProperties for better readability
> > - move common definitions into a shared schema
> > - remove consumer snippets from examples
> >=20
> >  .../bindings/clock/nvidia,tegra124-dfll.yaml  |   2 +-
> >  .../pinctrl/nvidia,tegra-pinmux-common.yaml   | 195 ++++++++++++++++++
> >  .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 ------------
> >  .../pinctrl/nvidia,tegra114-pinmux.yaml       | 162 +++++++++++++++
> >  .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 --------------
> >  .../pinctrl/nvidia,tegra124-pinmux.yaml       | 182 ++++++++++++++++
> >  .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 ----------
> >  .../pinctrl/nvidia,tegra194-pinmux.yaml       |  88 ++++++++
> >  .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 -------------
> >  .../pinctrl/nvidia,tegra20-pinmux.yaml        | 107 ++++++++++
> >  .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ---------------
> >  .../pinctrl/nvidia,tegra210-pinmux.yaml       | 146 +++++++++++++
> >  .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 -------------
> >  .../pinctrl/nvidia,tegra30-pinmux.yaml        | 176 ++++++++++++++++
> >  14 files changed, 1057 insertions(+), 845 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra-pinmux-common.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra114-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra114-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra124-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra124-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra194-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra194-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra20-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra20-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra210-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra210-pinmux.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra30-pinmux.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra30-pinmux.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-df=
ll.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> > index 85234a48b590..96c54c215f77 100644
> > --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> > +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> > @@ -219,7 +219,7 @@ examples:
> > =20
> >      /*
> >       * pinmux nodes added for completeness. Binding doc can be found i=
n:
> > -     * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmu=
x.txt
> > +     * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmu=
x.yaml
> >       */
> > =20
> >      pinmux: pinmux@700008d4 {
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pin=
mux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pi=
nmux-common.yaml
> > new file mode 100644
> > index 000000000000..cb6b722b89af
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-com=
mon.yaml
> > @@ -0,0 +1,195 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra-pinmux-common.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra Pinmux Controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jonathan Hunter <jonathanh@nvidia.com>
> > +
> > +definitions:
>=20
> This likely doesn't work because 'definitions' doesn't get fixups=20
> applied. '$defs' would, but in general I prefer avoiding this pattern=20
> except when really needed. I don't think it helps here. More below.
>=20
> > +  pinconf-node:
> > +    type: object
> > +    description: |
> > +      Please refer to pinctrl-bindings.txt in this directory for detai=
ls of the
> > +      common pinctrl bindings used by client devices, including the me=
aning of
> > +      the phrase "pin configuration node".
> > +
> > +      Tegra's pin configuration nodes act as a container for an arbitr=
ary number
> > +      of subnodes. Each of these subnodes represents some desired conf=
iguration
> > +      for a pin, a group, or a list of pins or groups. This configurat=
ion can
> > +      include the mux function to select on those pin(s)/ group(s), an=
d various
> > +      pin configuration parameters, such as pull-up, tristate, drive s=
trength,
> > +      etc.
> > +
> > +      The name of each subnode is not important; all subnodes should be
> > +      enumerated and processed purely based on their content.
> > +
> > +      Each subnode only affects those parameters that are explicitly l=
isted. In
> > +      other words, a subnode that lists a mux function but no pin conf=
iguration
> > +      parameters implies no information about any pin configuration pa=
rameters.
> > +
> > +      Similarly, a pin subnode that describes a pullup parameter impli=
es no
> > +      information about e.g.  the mux function or tristate parameter. =
For this
> > +      reason, even seemingly boolean values are actually tristates in =
this
> > +      binding: unspecified, off, or on. Unspecified is represented as =
an absent
> > +      property, and off/on are represented as integer values 0 and 1.
> > +
> > +      Note that many of these properties are only valid for certain sp=
ecific pins
> > +      or groups. See the Tegra TRM and various pinmux spreadsheets for=
 complete
> > +      details regarding which groups support which functionality. The =
Linux
> > +      pinctrl driver may also be a useful reference, since it consolid=
ates,
> > +      disambiguates, and corrects data from all those sources.
> > +
> > +    patternProperties:
> > +      "^pinmux(-[a-z0-9-_]+)?$":
>=20
> Drop this and make all the below be at the top level (i.e. no indent).

The intention was to include the general structure as well as the
description in each of the derived schemas. Some of the description
could perhaps be dropped, but especially the bit about the tristate
nature of some of these properties should stay in because it has caused
confusion in the past.

Is there any other way that the description can be shared with your
proposal (other than duplicating it in each binding document).

>=20
> > +        type: object
> > +        properties:
> > +          nvidia,pins:
> > +            $ref: /schemas/types.yaml#/definitions/string-array
> > +            description: An array of strings. Each string contains the=
 name of
> > +              a pin or group.  Valid values for these names are listed=
 below.
> > +
> > +          nvidia,function:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            description: A string containing the name of the function =
to mux to
> > +              the pin or group. Valid values for function names are li=
sted
> > +              below. See the Tegra TRM to determine which are valid fo=
r each
> > +              pin or group.
> > +
> > +          nvidia,pull:
> > +            description: Pull-down/up setting to apply to the pin.
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            oneOf:
> > +              - description: none
> > +                const: 0
> > +              - description: down
> > +                const: 1
> > +              - description: up
> > +                const: 2
> > +
> > +          nvidia,tristate:
> > +            description: Tristate setting to apply to the pin.
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            oneOf:
> > +              - description: drive
> > +                const: 0
> > +              - description: tristate
> > +                const: 1
> > +
> > +          nvidia,schmitt:
> > +            description: Enable Schmitt trigger on the input.
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            oneOf:
> > +              - description: disable Schmitt trigger on the input
> > +                const: 0
> > +              - description: enable Schmitt trigger on the input
> > +                const: 1
> > +
> > +          nvidia,pull-down-strength:
> > +            description: Controls drive strength. 0 is weakest. The ra=
nge of
> > +              valid values depends on the pingroup. See "CAL_DRVDN" in=
 the
> > +              Tegra TRM.
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +          nvidia,pull-up-strength:
> > +            description: Controls drive strength. 0 is weakest. The ra=
nge of
> > +              valid values depends on the pingroup. See "CAL_DRVUP" in=
 the
> > +              Tegra TRM.
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  high-speed-mode:
>=20
> Why do all these need to be definitions? They all have the same name and=
=20
> apply to the pinmux nodes. Just move them there with the right name.

All of the ones that are separate definitions are properties that appear
for only a subset of the IP generations. So the idea was to create a
definition and then derived bindings could cherry-pick these as
necessary to complement the pinconf-node definition.

If I move these definitions to the top level, then they'll end up
validating properly on devices where they shouldn't exist. Alternatively
I'd have to duplicate all of these across various derivative bindings
which gets us mostly back to the previous version of the patch (i.e. we
don't save very much by only factoring out the truly common properties).

> > +    description: Enable high speed mode the pins.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    oneOf:
> > +      - description: normal speed mode
> > +        const: 0
> > +      - description: high speed mode
> > +        const: 1
> > +
> > +  low-power-mode:
> > +    description: Controls the drive power or current. Valid values are
> > +      from 0 through 3, where 0 specifies the least power and 3 specif=
ies
> > +      the most power. See "Low Power Mode" or "LPMD1" and "LPMD0" in t=
he
> > +      Tegra TRM.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1, 2, 3 ]
> > +
> > +  enable-input:
> > +    description: Enable the pin's input path.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    oneOf:
> > +      - description: disable input (i.e. output only)
> > +        const: 0
> > +      - description: enable input
> > +        const: 1
> > +
> > +  open-drain:
> > +    description: Open-drain configuration for the pin.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    oneOf:
> > +      - description: disable open-drain
> > +        const: 0
> > +      - description: enable open-drain
> > +        const: 1
> > +
> > +  lock:
> > +    description: Lock the pin configuration against further changes un=
til
> > +      reset.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    oneOf:
> > +      - description: disable pin configuration lock
> > +        const: 0
> > +      - description: enable pin configuration lock
> > +        const: 1
> > +
> > +  io-reset:
> > +    description: reset the I/O path
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +
> > +  rcv-sel:
> > +    description: select VIL/VIH receivers
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    oneOf:
> > +      - description: normal receivers
> > +        const: 0
> > +      - description: high-voltage receivers
> > +        const: 1
> > +
> > +  drive-type:
> > +    description: Drive type to configure for the pin.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1, 2, 3 ]
> > +
> > +  io-hv:
> > +    description: Select high-voltage receivers.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    oneOf:
> > +      - description: Use normal receivers.
> > +        const: 0
> > +      - description: Use high-voltage receivers.
> > +        const: 1
> > +
> > +  slew-rate-rising:
> > +    description: Controls rising signal slew rate. 0 is fastest. The
> > +      range of valid values depends on the pingroup. See "DRVDN_SLWR" =
in
> > +      the Tegra TRM.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  slew-rate-falling:
> > +    description: Controls falling signal slew rate. 0 is fastest. The
> > +      range of valid values depends on the pingroup. See "DRVUP_SLWF" =
in
> > +      the Tegra TRM.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +properties:
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 4
>=20
> This doesn't get used anywhere.

I think I needed the properties keyword here because the tooling would
otherwise consider this schema invalid. Perhaps if I restructure this
that error will go away as well.

> > +
> > +additionalProperties: true
> > +...
>=20
>=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-=
pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pin=
mux.yaml
> > new file mode 100644
> > index 000000000000..e0a3f58b5535
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.=
yaml
> > @@ -0,0 +1,162 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-pinmux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra114 pinmux Controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra114-pinmux
> > +
> > +  reg:
> > +    items:
> > +      - description: pad control registers
> > +      - description: mux registers
> > +
> > +additionalProperties:
> > +  $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/pinconf-node'
> > +  patternProperties:
> > +    "^pinmux(-[a-z0-9-_]+)?$":
> > +      additionalProperties: false
>=20
> The reference to the common schema should then be here.
>=20
> If you want to keep which properties apply, then keep=20
> 'additionalProperties' and just list them out:
>=20
> nvidia,enable-input: true

But then if I define the schema for nvidia,enable-input in the common
schema, it'll validate for all derivative schemas as well, won't it? Or
would I have to explicitly exclude those that aren't applicable to a
given derivative schema using something like:

	nvidia,enable-input: false

>=20
> > +      properties:
> > +        nvidia,pins:
> > +          items:
> > +            enum: [ ulpi_data0_po1, ulpi_data1_po2, ulpi_data2_po3,
> > +                    ulpi_data3_po4, ulpi_data4_po5, ulpi_data5_po6,
> > +                    ulpi_data6_po7, ulpi_data7_po0, ulpi_clk_py0, ulpi=
_dir_py1,
> > +                    ulpi_nxt_py2, ulpi_stp_py3, dap3_fs_pp0, dap3_din_=
pp1,
> > +                    dap3_dout_pp2, dap3_sclk_pp3, pv0, pv1, sdmmc1_clk=
_pz0,
> > +                    sdmmc1_cmd_pz1, sdmmc1_dat3_py4, sdmmc1_dat2_py5,
> > +                    sdmmc1_dat1_py6, sdmmc1_dat0_py7, clk2_out_pw5,
> > +                    clk2_req_pcc5, hdmi_int_pn7, ddc_scl_pv4, ddc_sda_=
pv5,
> > +                    uart2_rxd_pc3, uart2_txd_pc2, uart2_rts_n_pj6,
> > +                    uart2_cts_n_pj5, uart3_txd_pw6, uart3_rxd_pw7,
> > +                    uart3_cts_n_pa1, uart3_rts_n_pc0, pu0, pu1, pu2, p=
u3, pu4,
> > +                    pu5, pu6, gen1_i2c_sda_pc5, gen1_i2c_scl_pc4, dap4=
_fs_pp4,
> > +                    dap4_din_pp5, dap4_dout_pp6, dap4_sclk_pp7, clk3_o=
ut_pee0,
> > +                    clk3_req_pee1, gmi_wp_n_pc7, gmi_iordy_pi5, gmi_wa=
it_pi7,
> > +                    gmi_adv_n_pk0, gmi_clk_pk1, gmi_cs0_n_pj0, gmi_cs1=
_n_pj2,
> > +                    gmi_cs2_n_pk3, gmi_cs3_n_pk4, gmi_cs4_n_pk2, gmi_c=
s6_n_pi3,
> > +                    gmi_cs7_n_pi6, gmi_ad0_pg0, gmi_ad1_pg1, gmi_ad2_p=
g2,
> > +                    gmi_ad3_pg3, gmi_ad4_pg4, gmi_ad5_pg5, gmi_ad6_pg6,
> > +                    gmi_ad7_pg7, gmi_ad8_ph0, gmi_ad9_ph1, gmi_ad10_ph=
2,
> > +                    gmi_ad11_ph3, gmi_ad12_ph4, gmi_ad13_ph5, gmi_ad14=
_ph6,
> > +                    gmi_ad15_ph7, gmi_a16_pj7, gmi_a17_pb0, gmi_a18_pb=
1,
> > +                    gmi_a19_pk7, gmi_wr_n_pi0, gmi_oe_n_pi1, gmi_dqs_p=
_pj3,
> > +                    gmi_rst_n_pi4, gen2_i2c_scl_pt5, gen2_i2c_sda_pt6,
> > +                    sdmmc4_clk_pcc4, sdmmc4_cmd_pt7, sdmmc4_dat0_paa0,
> > +                    sdmmc4_dat1_paa1, sdmmc4_dat2_paa2, sdmmc4_dat3_pa=
a3,
> > +                    sdmmc4_dat4_paa4, sdmmc4_dat5_paa5, sdmmc4_dat6_pa=
a6,
> > +                    sdmmc4_dat7_paa7, cam_mclk_pcc0, pcc1, pbb0,
> > +                    cam_i2c_scl_pbb1, cam_i2c_sda_pbb2, pbb3, pbb4, pb=
b5, pbb6,
> > +                    pbb7, pcc2, pwr_i2c_scl_pz6, pwr_i2c_sda_pz7, kb_r=
ow0_pr0,
> > +                    kb_row1_pr1, kb_row2_pr2, kb_row3_pr3, kb_row4_pr4,
> > +                    kb_row5_pr5, kb_row6_pr6, kb_row7_pr7, kb_row8_ps0,
> > +                    kb_row9_ps1, kb_row10_ps2, kb_col0_pq0, kb_col1_pq=
1,
> > +                    kb_col2_pq2, kb_col3_pq3, kb_col4_pq4, kb_col5_pq5,
> > +                    kb_col6_pq6, kb_col7_pq7, clk_32k_out_pa0, sys_clk=
_req_pz5,
> > +                    core_pwr_req, cpu_pwr_req, pwr_int_n, owr, dap1_fs=
_pn0,
> > +                    dap1_din_pn1, dap1_dout_pn2, dap1_sclk_pn3, clk1_r=
eq_pee2,
> > +                    clk1_out_pw4, spdif_in_pk6, spdif_out_pk5, dap2_fs=
_pa2,
> > +                    dap2_din_pa4, dap2_dout_pa5, dap2_sclk_pa3, dvfs_p=
wm_px0,
> > +                    gpio_x1_aud_px1, gpio_x3_aud_px3, dvfs_clk_px2,
> > +                    gpio_x4_aud_px4, gpio_x5_aud_px5, gpio_x6_aud_px6,
> > +                    gpio_x7_aud_px7, sdmmc3_clk_pa6, sdmmc3_cmd_pa7,
> > +                    sdmmc3_dat0_pb7, sdmmc3_dat1_pb6, sdmmc3_dat2_pb5,
> > +                    sdmmc3_dat3_pb4, hdmi_cec_pee3, sdmmc1_wp_n_pv3,
> > +                    sdmmc3_cd_n_pv2, gpio_w2_aud_pw2, gpio_w3_aud_pw3,
> > +                    usb_vbus_en0_pn4, usb_vbus_en1_pn5, sdmmc3_clk_lb_=
in_pee5,
> > +                    sdmmc3_clk_lb_out_pee4, reset_out_n,
> > +                    # drive groups
> > +                    drive_ao1, drive_ao2, drive_at1, drive_at2, drive_=
at3,
> > +                    drive_at4, drive_at5, drive_cdev1, drive_cdev2, dr=
ive_dap1,
> > +                    drive_dap2, drive_dap3, drive_dap4, drive_dbg, dri=
ve_sdio3,
> > +                    drive_spi, drive_uaa, drive_uab, drive_uart2, driv=
e_uart3,
> > +                    drive_sdio1, drive_ddc, drive_gma, drive_gme, driv=
e_gmf,
> > +                    drive_gmg, drive_gmh, drive_owr, drive_uda ]
> > +
> > +        nvidia,function:
> > +          enum: [ blink, cec, cldvfs, clk12, cpu, dap, dap1, dap2, dev=
3,
> > +                  displaya, displaya_alt, displayb, dtv, emc_dll, extp=
eriph1,
> > +                  extperiph2, extperiph3, gmi, gmi_alt, hda, hsi, i2c1=
, i2c2,
> > +                  i2c3, i2c4, i2cpwr, i2s0, i2s1, i2s2, i2s3, i2s4, ir=
da, kbc,
> > +                  nand, nand_alt, owr, pmi, pwm0, pwm1, pwm2, pwm3, pw=
ron,
> > +                  reset_out_n, rsvd1, rsvd2, rsvd3, rsvd4, sdmmc1, sdm=
mc2,
> > +                  sdmmc3, sdmmc4, soc, spdif, spi1, spi2, spi3, spi4, =
spi5,
> > +                  spi6, sysclk, trace, uarta, uartb, uartc, uartd, ulp=
i, usb,
> > +                  vgp1, vgp2, vgp3, vgp4, vgp5, vgp6, vi, vi_alt1, vi_=
alt3 ]
> > +
> > +        nvidia,enable-input:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/enable-i=
nput'
> > +
> > +        nvidia,open-drain:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/open-dra=
in'
> > +
> > +        nvidia,lock:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/lock'
> > +
> > +        nvidia,io-reset:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/io-reset'
> > +
> > +        nvidia,rcv-sel:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/rcv-sel'
> > +
> > +        nvidia,high-speed-mode:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/high-spe=
ed-mode'
> > +
> > +        nvidia,low-power-mode:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/low-powe=
r-mode'
> > +
> > +        nvidia,drive-type:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/drive-ty=
pe'
> > +
> > +        nvidia,slew-rate-rising:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/slew-rat=
e-rising'
> > +
> > +        nvidia,slew-rate-falling:
> > +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/slew-rat=
e-falling'
> > +
> > +      required:
> > +        - nvidia,pins
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    pinmux@70000868 {
> > +      compatible =3D "nvidia,tegra114-pinmux";
> > +      reg =3D <0x70000868 0x148>, /* Pad control registers */
> > +            <0x70003000 0x40c>; /* PinMux registers */
> > +
> > +      pinmux {
> > +        sdmmc4_clk_pcc4 {
>=20
> Humm, this doesn't even match the schema. The child and grandchild are=20
> swapped. It's saying any child node has only child nodes named=20
> "^pinmux(-[a-z0-9-_]+)?$".
>=20
> Please test your patches. This didn't apply, so no automated checks ran.=
=20
> But that's not a free testing service anyways. :(

I messed this up as I was rebasing, so the fixes for this ended up in an
unrelated patch, but the end result still worked for me... =3D(

Thierry

--ReY3aQ5DI/HmvsV0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLF8G8ACgkQ3SOs138+
s6F/NA/+NVftfCURC3CxaN2J8Aa+xlvfN/9k2Puws4F456cRdWkTPHawffAkOURW
fBZ4Qne/qgt8BFEcVvqxKLTi1StKtI5gnwns8kyqA2gZFxlSd+zw8nATYhLaYMNq
IHoJvS3N5vOWt8t755mjx3CbklBFRpb+Gdd9dQ1FSp9RZ8pp91W5UjH5VFLNqExd
pXexBNbeDj3FatZHqlKLrmjyeCKrW5t5jIrpCEKd38q+acdCXVXAIMZv53Dv+QPE
vS8Eur6AxoURGfemeDhGQ37If5GwBC/nhiqYtmYCSKzmWSwn5CWtlvtArhNu6VFL
ZLOIUBJ0qxG1kexU76lyM5Tpgc3DHctRqQhlRBUSZJ2s6ZETcvkaNTSdQC0a4XfY
stae3bAYBKhnqwwuWB20Nj7b5hGw8BpGZzQ1NgRlHsn/tUXA3sJQdRQWcSV9fZ3t
1d8rv3Q3s3VgteNElg6Yda1j2QXrKJnU/lLEvcXYchLj8kswE6znDbVgXJYwUtug
BLOiO1LFuTIwYMDUop5HkxRhvnr01P4avMYOzdg+iIBnkb5wRYR3kga740wJcl1q
q+wguTUkXCgjpyjmQT2WfIyOo0iVxmqUues161A/1KOo3klPtY4hOHDku/2INaQT
RZ9y7qnU4M5Wrn5Lf5bmzi4R2Vey9dampGql6istNWdYj/w5Nu4=
=V02b
-----END PGP SIGNATURE-----

--ReY3aQ5DI/HmvsV0--

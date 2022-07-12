Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FA35728BC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 23:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbiGLVpL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 17:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiGLVpK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 17:45:10 -0400
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4714A2EE0;
        Tue, 12 Jul 2022 14:45:07 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id a20so5658507ilk.9;
        Tue, 12 Jul 2022 14:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ePtbEiXwYlvkWg0Ag9Bm1oGl7ingDp4ZCOmvX1M6pNI=;
        b=2KciIB9vTflRmDYvQTZ2m3EVq9j7om7MdAXsHMut2CMJMLpQi6B3pVz4b1qej/DxCm
         LUXbLJ19uiahyr/zbq5z/qGnmA2m0e7QpORulzPDO4/yiOUMpVgsHmQDUd6sawPEmgVB
         N94lD+AAJwloHrwEVc6529C9hUQNTy3zMpm6thM7315DWbBZ0fQekCe6kQjFiwDrFnbV
         xA1wv4eBXWmMkePdItVC3XCBp5rl7yzwKWS+pvHjkpIg6kx/71U0hOBQdJj7G1TsJb06
         JzUdrwwJvsFJO0ZuQP3tl3h4o/bQpmoIjj9dXh19mlVQkYhXuWc+zqtJyfxVtfsduns3
         5vlw==
X-Gm-Message-State: AJIora+IT7DFVtTy9XmRqWsLVzI7cyyp0RPoNHLHNeeMAey0AMSaJFl7
        8KUP1OhDkJ+2oRjdAjWocFgnH14/xQ==
X-Google-Smtp-Source: AGRyM1vs4nXiw4f1tuiBUKQsDxdW4uQzJoTcvQ2HSFXT+BSz1UKNJ7AwJozIhVDHyqqWkHVKWWGz3Q==
X-Received: by 2002:a05:6e02:1808:b0:2dc:9f6b:6082 with SMTP id a8-20020a056e02180800b002dc9f6b6082mr151717ilv.262.1657662307014;
        Tue, 12 Jul 2022 14:45:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t8-20020a02c908000000b00332044db2aasm4581828jao.95.2022.07.12.14.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 14:45:06 -0700 (PDT)
Received: (nullmailer pid 2415364 invoked by uid 1000);
        Tue, 12 Jul 2022 21:45:04 -0000
Date:   Tue, 12 Jul 2022 15:45:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: tegra: Convert to
 json-schema
Message-ID: <20220712214504.GR1823936-robh@kernel.org>
References: <20220704165802.129717-1-thierry.reding@gmail.com>
 <20220704165802.129717-2-thierry.reding@gmail.com>
 <20220706153822.GA54439-robh@kernel.org>
 <YsXwchhxAdSRPFzD@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsXwchhxAdSRPFzD@orome>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 06, 2022 at 10:28:34PM +0200, Thierry Reding wrote:
> On Wed, Jul 06, 2022 at 09:38:22AM -0600, Rob Herring wrote:
> > On Mon, Jul 04, 2022 at 06:57:59PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Convert the NVIDIA Tegra pinmux controller bindings from the free-form
> > > text format to json-schema.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v2:
> > > - wrap lines at 80 characters instead of the standard 100 characters in Linux
> > > - use GPL-2.0-only instead of GPL-2.0+ license for DT bindings
> > > - reorder additionalProperties for better readability
> > > - move common definitions into a shared schema
> > > - remove consumer snippets from examples
> > > 
> > >  .../bindings/clock/nvidia,tegra124-dfll.yaml  |   2 +-
> > >  .../pinctrl/nvidia,tegra-pinmux-common.yaml   | 195 ++++++++++++++++++
> > >  .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 ------------
> > >  .../pinctrl/nvidia,tegra114-pinmux.yaml       | 162 +++++++++++++++
> > >  .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 --------------
> > >  .../pinctrl/nvidia,tegra124-pinmux.yaml       | 182 ++++++++++++++++
> > >  .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 ----------
> > >  .../pinctrl/nvidia,tegra194-pinmux.yaml       |  88 ++++++++
> > >  .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 -------------
> > >  .../pinctrl/nvidia,tegra20-pinmux.yaml        | 107 ++++++++++
> > >  .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ---------------
> > >  .../pinctrl/nvidia,tegra210-pinmux.yaml       | 146 +++++++++++++
> > >  .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 -------------
> > >  .../pinctrl/nvidia,tegra30-pinmux.yaml        | 176 ++++++++++++++++
> > >  14 files changed, 1057 insertions(+), 845 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> > > index 85234a48b590..96c54c215f77 100644
> > > --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> > > @@ -219,7 +219,7 @@ examples:
> > >  
> > >      /*
> > >       * pinmux nodes added for completeness. Binding doc can be found in:
> > > -     * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
> > > +     * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
> > >       */
> > >  
> > >      pinmux: pinmux@700008d4 {
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
> > > new file mode 100644
> > > index 000000000000..cb6b722b89af
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
> > > @@ -0,0 +1,195 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra-pinmux-common.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NVIDIA Tegra Pinmux Controller
> > > +
> > > +maintainers:
> > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > +  - Jonathan Hunter <jonathanh@nvidia.com>
> > > +
> > > +definitions:
> > 
> > This likely doesn't work because 'definitions' doesn't get fixups 
> > applied. '$defs' would, but in general I prefer avoiding this pattern 
> > except when really needed. I don't think it helps here. More below.
> > 
> > > +  pinconf-node:
> > > +    type: object
> > > +    description: |
> > > +      Please refer to pinctrl-bindings.txt in this directory for details of the
> > > +      common pinctrl bindings used by client devices, including the meaning of
> > > +      the phrase "pin configuration node".
> > > +
> > > +      Tegra's pin configuration nodes act as a container for an arbitrary number
> > > +      of subnodes. Each of these subnodes represents some desired configuration
> > > +      for a pin, a group, or a list of pins or groups. This configuration can
> > > +      include the mux function to select on those pin(s)/ group(s), and various
> > > +      pin configuration parameters, such as pull-up, tristate, drive strength,
> > > +      etc.
> > > +
> > > +      The name of each subnode is not important; all subnodes should be
> > > +      enumerated and processed purely based on their content.
> > > +
> > > +      Each subnode only affects those parameters that are explicitly listed. In
> > > +      other words, a subnode that lists a mux function but no pin configuration
> > > +      parameters implies no information about any pin configuration parameters.
> > > +
> > > +      Similarly, a pin subnode that describes a pullup parameter implies no
> > > +      information about e.g.  the mux function or tristate parameter. For this
> > > +      reason, even seemingly boolean values are actually tristates in this
> > > +      binding: unspecified, off, or on. Unspecified is represented as an absent
> > > +      property, and off/on are represented as integer values 0 and 1.
> > > +
> > > +      Note that many of these properties are only valid for certain specific pins
> > > +      or groups. See the Tegra TRM and various pinmux spreadsheets for complete
> > > +      details regarding which groups support which functionality. The Linux
> > > +      pinctrl driver may also be a useful reference, since it consolidates,
> > > +      disambiguates, and corrects data from all those sources.
> > > +
> > > +    patternProperties:
> > > +      "^pinmux(-[a-z0-9-_]+)?$":
> > 
> > Drop this and make all the below be at the top level (i.e. no indent).
> 
> The intention was to include the general structure as well as the
> description in each of the derived schemas. Some of the description
> could perhaps be dropped, but especially the bit about the tristate
> nature of some of these properties should stay in because it has caused
> confusion in the past.
> 
> Is there any other way that the description can be shared with your
> proposal (other than duplicating it in each binding document).

The 'description' above? You can move that to top-level too.

> > > +        type: object
> > > +        properties:
> > > +          nvidia,pins:
> > > +            $ref: /schemas/types.yaml#/definitions/string-array
> > > +            description: An array of strings. Each string contains the name of
> > > +              a pin or group.  Valid values for these names are listed below.
> > > +
> > > +          nvidia,function:
> > > +            $ref: /schemas/types.yaml#/definitions/string
> > > +            description: A string containing the name of the function to mux to
> > > +              the pin or group. Valid values for function names are listed
> > > +              below. See the Tegra TRM to determine which are valid for each
> > > +              pin or group.
> > > +
> > > +          nvidia,pull:
> > > +            description: Pull-down/up setting to apply to the pin.
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            oneOf:
> > > +              - description: none
> > > +                const: 0
> > > +              - description: down
> > > +                const: 1
> > > +              - description: up
> > > +                const: 2
> > > +
> > > +          nvidia,tristate:
> > > +            description: Tristate setting to apply to the pin.
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            oneOf:
> > > +              - description: drive
> > > +                const: 0
> > > +              - description: tristate
> > > +                const: 1
> > > +
> > > +          nvidia,schmitt:
> > > +            description: Enable Schmitt trigger on the input.
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            oneOf:
> > > +              - description: disable Schmitt trigger on the input
> > > +                const: 0
> > > +              - description: enable Schmitt trigger on the input
> > > +                const: 1
> > > +
> > > +          nvidia,pull-down-strength:
> > > +            description: Controls drive strength. 0 is weakest. The range of
> > > +              valid values depends on the pingroup. See "CAL_DRVDN" in the
> > > +              Tegra TRM.
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +          nvidia,pull-up-strength:
> > > +            description: Controls drive strength. 0 is weakest. The range of
> > > +              valid values depends on the pingroup. See "CAL_DRVUP" in the
> > > +              Tegra TRM.
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +  high-speed-mode:
> > 
> > Why do all these need to be definitions? They all have the same name and 
> > apply to the pinmux nodes. Just move them there with the right name.
> 
> All of the ones that are separate definitions are properties that appear
> for only a subset of the IP generations. So the idea was to create a
> definition and then derived bindings could cherry-pick these as
> necessary to complement the pinconf-node definition.
> 
> If I move these definitions to the top level, then they'll end up
> validating properly on devices where they shouldn't exist. Alternatively
> I'd have to duplicate all of these across various derivative bindings
> which gets us mostly back to the previous version of the patch (i.e. we
> don't save very much by only factoring out the truly common properties).

Not if you use 'additionalProperties: false'. Since it doesn't see into 
$ref's like unevaluatedProperties does, you have to list out which 
properties you are using in the derived binding:

$ref: list-of-common-props.yaml#

properties:
  high-speed-mode: true

additionalProperties: false

list-of-common-props.yaml could have a gazillion properties in 
it, but anything not listed locally will be disallowed.


> > > +    description: Enable high speed mode the pins.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    oneOf:
> > > +      - description: normal speed mode
> > > +        const: 0
> > > +      - description: high speed mode
> > > +        const: 1
> > > +
> > > +  low-power-mode:
> > > +    description: Controls the drive power or current. Valid values are
> > > +      from 0 through 3, where 0 specifies the least power and 3 specifies
> > > +      the most power. See "Low Power Mode" or "LPMD1" and "LPMD0" in the
> > > +      Tegra TRM.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [ 0, 1, 2, 3 ]
> > > +
> > > +  enable-input:
> > > +    description: Enable the pin's input path.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    oneOf:
> > > +      - description: disable input (i.e. output only)
> > > +        const: 0
> > > +      - description: enable input
> > > +        const: 1
> > > +
> > > +  open-drain:
> > > +    description: Open-drain configuration for the pin.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    oneOf:
> > > +      - description: disable open-drain
> > > +        const: 0
> > > +      - description: enable open-drain
> > > +        const: 1
> > > +
> > > +  lock:
> > > +    description: Lock the pin configuration against further changes until
> > > +      reset.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    oneOf:
> > > +      - description: disable pin configuration lock
> > > +        const: 0
> > > +      - description: enable pin configuration lock
> > > +        const: 1
> > > +
> > > +  io-reset:
> > > +    description: reset the I/O path
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [ 0, 1 ]
> > > +
> > > +  rcv-sel:
> > > +    description: select VIL/VIH receivers
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    oneOf:
> > > +      - description: normal receivers
> > > +        const: 0
> > > +      - description: high-voltage receivers
> > > +        const: 1
> > > +
> > > +  drive-type:
> > > +    description: Drive type to configure for the pin.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [ 0, 1, 2, 3 ]
> > > +
> > > +  io-hv:
> > > +    description: Select high-voltage receivers.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    oneOf:
> > > +      - description: Use normal receivers.
> > > +        const: 0
> > > +      - description: Use high-voltage receivers.
> > > +        const: 1
> > > +
> > > +  slew-rate-rising:
> > > +    description: Controls rising signal slew rate. 0 is fastest. The
> > > +      range of valid values depends on the pingroup. See "DRVDN_SLWR" in
> > > +      the Tegra TRM.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +  slew-rate-falling:
> > > +    description: Controls falling signal slew rate. 0 is fastest. The
> > > +      range of valid values depends on the pingroup. See "DRVUP_SLWF" in
> > > +      the Tegra TRM.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +properties:
> > > +  reg:
> > > +    minItems: 1
> > > +    maxItems: 4
> > 
> > This doesn't get used anywhere.
> 
> I think I needed the properties keyword here because the tooling would
> otherwise consider this schema invalid. Perhaps if I restructure this
> that error will go away as well.

Probably so. All part of keeping people within the lines. :)

Rob

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59017568E07
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 17:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbiGFPpM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 11:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234529AbiGFPo7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 11:44:59 -0400
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAAD624B;
        Wed,  6 Jul 2022 08:38:26 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id n9so5256008ilq.12;
        Wed, 06 Jul 2022 08:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GuggSLar273DVppqlWh9H7nqMvNYN/Y0EXwfGbRrjSA=;
        b=OH3odLmDOqBJ00trYzZe9M67wHr4rqgXFG+mCKNOwRliVu66u9wXp+MwMK82ZVm1az
         mXN/5XK9AFxfN2WJW6hT6CxG+q8Fa8NZ30iEK1cEn/0oYQOOX47kEGFhM95haxI4cO0v
         T9FMk7bVWftZEbX+x3wel7ePULGiiIERkneQj7x+zuaE7f3bAXEG2wWrA+4Ca/YNZf5r
         1KMOlf6JvDpUsG9G8mzXmT3/npn1eqHSadCxbkzqVLx4CUDTJpAikxTkk7z8NmUmuMkc
         cmPH2j/xYsLFMZ/ZbBSyYJOYFE+pl9jM2NhUd7IA6zLxQzWxoMonlvklWQBXG70dPpgn
         Bp3g==
X-Gm-Message-State: AJIora/50GMbtqK+GYwfrhDBkyOtcikHrukLwIkTV7vjM7p2NdvPU8Iy
        xdkjuZFbq2Fw4H0mmab+DMJgafeovw==
X-Google-Smtp-Source: AGRyM1sAOMSz5drQZLxQt4mlS3lrMLfHdRDzONfQoy20QivVCpYrHw6XcwQXynjLe61+HlB9ecIT6w==
X-Received: by 2002:a92:d690:0:b0:2dc:13ca:4dfa with SMTP id p16-20020a92d690000000b002dc13ca4dfamr9551903iln.48.1657121905256;
        Wed, 06 Jul 2022 08:38:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k12-20020a6b7a4c000000b0067411d7f769sm16993818iop.5.2022.07.06.08.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:38:24 -0700 (PDT)
Received: (nullmailer pid 91697 invoked by uid 1000);
        Wed, 06 Jul 2022 15:38:22 -0000
Date:   Wed, 6 Jul 2022 09:38:22 -0600
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
Message-ID: <20220706153822.GA54439-robh@kernel.org>
References: <20220704165802.129717-1-thierry.reding@gmail.com>
 <20220704165802.129717-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704165802.129717-2-thierry.reding@gmail.com>
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

On Mon, Jul 04, 2022 at 06:57:59PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra pinmux controller bindings from the free-form
> text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - wrap lines at 80 characters instead of the standard 100 characters in Linux
> - use GPL-2.0-only instead of GPL-2.0+ license for DT bindings
> - reorder additionalProperties for better readability
> - move common definitions into a shared schema
> - remove consumer snippets from examples
> 
>  .../bindings/clock/nvidia,tegra124-dfll.yaml  |   2 +-
>  .../pinctrl/nvidia,tegra-pinmux-common.yaml   | 195 ++++++++++++++++++
>  .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 ------------
>  .../pinctrl/nvidia,tegra114-pinmux.yaml       | 162 +++++++++++++++
>  .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 --------------
>  .../pinctrl/nvidia,tegra124-pinmux.yaml       | 182 ++++++++++++++++
>  .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 ----------
>  .../pinctrl/nvidia,tegra194-pinmux.yaml       |  88 ++++++++
>  .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 -------------
>  .../pinctrl/nvidia,tegra20-pinmux.yaml        | 107 ++++++++++
>  .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ---------------
>  .../pinctrl/nvidia,tegra210-pinmux.yaml       | 146 +++++++++++++
>  .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 -------------
>  .../pinctrl/nvidia,tegra30-pinmux.yaml        | 176 ++++++++++++++++
>  14 files changed, 1057 insertions(+), 845 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> index 85234a48b590..96c54c215f77 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> @@ -219,7 +219,7 @@ examples:
>  
>      /*
>       * pinmux nodes added for completeness. Binding doc can be found in:
> -     * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
> +     * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
>       */
>  
>      pinmux: pinmux@700008d4 {
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
> new file mode 100644
> index 000000000000..cb6b722b89af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
> @@ -0,0 +1,195 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra-pinmux-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jonathan Hunter <jonathanh@nvidia.com>
> +
> +definitions:

This likely doesn't work because 'definitions' doesn't get fixups 
applied. '$defs' would, but in general I prefer avoiding this pattern 
except when really needed. I don't think it helps here. More below.

> +  pinconf-node:
> +    type: object
> +    description: |
> +      Please refer to pinctrl-bindings.txt in this directory for details of the
> +      common pinctrl bindings used by client devices, including the meaning of
> +      the phrase "pin configuration node".
> +
> +      Tegra's pin configuration nodes act as a container for an arbitrary number
> +      of subnodes. Each of these subnodes represents some desired configuration
> +      for a pin, a group, or a list of pins or groups. This configuration can
> +      include the mux function to select on those pin(s)/ group(s), and various
> +      pin configuration parameters, such as pull-up, tristate, drive strength,
> +      etc.
> +
> +      The name of each subnode is not important; all subnodes should be
> +      enumerated and processed purely based on their content.
> +
> +      Each subnode only affects those parameters that are explicitly listed. In
> +      other words, a subnode that lists a mux function but no pin configuration
> +      parameters implies no information about any pin configuration parameters.
> +
> +      Similarly, a pin subnode that describes a pullup parameter implies no
> +      information about e.g.  the mux function or tristate parameter. For this
> +      reason, even seemingly boolean values are actually tristates in this
> +      binding: unspecified, off, or on. Unspecified is represented as an absent
> +      property, and off/on are represented as integer values 0 and 1.
> +
> +      Note that many of these properties are only valid for certain specific pins
> +      or groups. See the Tegra TRM and various pinmux spreadsheets for complete
> +      details regarding which groups support which functionality. The Linux
> +      pinctrl driver may also be a useful reference, since it consolidates,
> +      disambiguates, and corrects data from all those sources.
> +
> +    patternProperties:
> +      "^pinmux(-[a-z0-9-_]+)?$":

Drop this and make all the below be at the top level (i.e. no indent).

> +        type: object
> +        properties:
> +          nvidia,pins:
> +            $ref: /schemas/types.yaml#/definitions/string-array
> +            description: An array of strings. Each string contains the name of
> +              a pin or group.  Valid values for these names are listed below.
> +
> +          nvidia,function:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            description: A string containing the name of the function to mux to
> +              the pin or group. Valid values for function names are listed
> +              below. See the Tegra TRM to determine which are valid for each
> +              pin or group.
> +
> +          nvidia,pull:
> +            description: Pull-down/up setting to apply to the pin.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            oneOf:
> +              - description: none
> +                const: 0
> +              - description: down
> +                const: 1
> +              - description: up
> +                const: 2
> +
> +          nvidia,tristate:
> +            description: Tristate setting to apply to the pin.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            oneOf:
> +              - description: drive
> +                const: 0
> +              - description: tristate
> +                const: 1
> +
> +          nvidia,schmitt:
> +            description: Enable Schmitt trigger on the input.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            oneOf:
> +              - description: disable Schmitt trigger on the input
> +                const: 0
> +              - description: enable Schmitt trigger on the input
> +                const: 1
> +
> +          nvidia,pull-down-strength:
> +            description: Controls drive strength. 0 is weakest. The range of
> +              valid values depends on the pingroup. See "CAL_DRVDN" in the
> +              Tegra TRM.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          nvidia,pull-up-strength:
> +            description: Controls drive strength. 0 is weakest. The range of
> +              valid values depends on the pingroup. See "CAL_DRVUP" in the
> +              Tegra TRM.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  high-speed-mode:

Why do all these need to be definitions? They all have the same name and 
apply to the pinmux nodes. Just move them there with the right name.

> +    description: Enable high speed mode the pins.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - description: normal speed mode
> +        const: 0
> +      - description: high speed mode
> +        const: 1
> +
> +  low-power-mode:
> +    description: Controls the drive power or current. Valid values are
> +      from 0 through 3, where 0 specifies the least power and 3 specifies
> +      the most power. See "Low Power Mode" or "LPMD1" and "LPMD0" in the
> +      Tegra TRM.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2, 3 ]
> +
> +  enable-input:
> +    description: Enable the pin's input path.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - description: disable input (i.e. output only)
> +        const: 0
> +      - description: enable input
> +        const: 1
> +
> +  open-drain:
> +    description: Open-drain configuration for the pin.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - description: disable open-drain
> +        const: 0
> +      - description: enable open-drain
> +        const: 1
> +
> +  lock:
> +    description: Lock the pin configuration against further changes until
> +      reset.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - description: disable pin configuration lock
> +        const: 0
> +      - description: enable pin configuration lock
> +        const: 1
> +
> +  io-reset:
> +    description: reset the I/O path
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +
> +  rcv-sel:
> +    description: select VIL/VIH receivers
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - description: normal receivers
> +        const: 0
> +      - description: high-voltage receivers
> +        const: 1
> +
> +  drive-type:
> +    description: Drive type to configure for the pin.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2, 3 ]
> +
> +  io-hv:
> +    description: Select high-voltage receivers.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - description: Use normal receivers.
> +        const: 0
> +      - description: Use high-voltage receivers.
> +        const: 1
> +
> +  slew-rate-rising:
> +    description: Controls rising signal slew rate. 0 is fastest. The
> +      range of valid values depends on the pingroup. See "DRVDN_SLWR" in
> +      the Tegra TRM.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  slew-rate-falling:
> +    description: Controls falling signal slew rate. 0 is fastest. The
> +      range of valid values depends on the pingroup. See "DRVUP_SLWF" in
> +      the Tegra TRM.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +properties:
> +  reg:
> +    minItems: 1
> +    maxItems: 4

This doesn't get used anywhere.

> +
> +additionalProperties: true
> +...


> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
> new file mode 100644
> index 000000000000..e0a3f58b5535
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-pinmux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra114 pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra114-pinmux
> +
> +  reg:
> +    items:
> +      - description: pad control registers
> +      - description: mux registers
> +
> +additionalProperties:
> +  $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/pinconf-node'
> +  patternProperties:
> +    "^pinmux(-[a-z0-9-_]+)?$":
> +      additionalProperties: false

The reference to the common schema should then be here.

If you want to keep which properties apply, then keep 
'additionalProperties' and just list them out:

nvidia,enable-input: true

> +      properties:
> +        nvidia,pins:
> +          items:
> +            enum: [ ulpi_data0_po1, ulpi_data1_po2, ulpi_data2_po3,
> +                    ulpi_data3_po4, ulpi_data4_po5, ulpi_data5_po6,
> +                    ulpi_data6_po7, ulpi_data7_po0, ulpi_clk_py0, ulpi_dir_py1,
> +                    ulpi_nxt_py2, ulpi_stp_py3, dap3_fs_pp0, dap3_din_pp1,
> +                    dap3_dout_pp2, dap3_sclk_pp3, pv0, pv1, sdmmc1_clk_pz0,
> +                    sdmmc1_cmd_pz1, sdmmc1_dat3_py4, sdmmc1_dat2_py5,
> +                    sdmmc1_dat1_py6, sdmmc1_dat0_py7, clk2_out_pw5,
> +                    clk2_req_pcc5, hdmi_int_pn7, ddc_scl_pv4, ddc_sda_pv5,
> +                    uart2_rxd_pc3, uart2_txd_pc2, uart2_rts_n_pj6,
> +                    uart2_cts_n_pj5, uart3_txd_pw6, uart3_rxd_pw7,
> +                    uart3_cts_n_pa1, uart3_rts_n_pc0, pu0, pu1, pu2, pu3, pu4,
> +                    pu5, pu6, gen1_i2c_sda_pc5, gen1_i2c_scl_pc4, dap4_fs_pp4,
> +                    dap4_din_pp5, dap4_dout_pp6, dap4_sclk_pp7, clk3_out_pee0,
> +                    clk3_req_pee1, gmi_wp_n_pc7, gmi_iordy_pi5, gmi_wait_pi7,
> +                    gmi_adv_n_pk0, gmi_clk_pk1, gmi_cs0_n_pj0, gmi_cs1_n_pj2,
> +                    gmi_cs2_n_pk3, gmi_cs3_n_pk4, gmi_cs4_n_pk2, gmi_cs6_n_pi3,
> +                    gmi_cs7_n_pi6, gmi_ad0_pg0, gmi_ad1_pg1, gmi_ad2_pg2,
> +                    gmi_ad3_pg3, gmi_ad4_pg4, gmi_ad5_pg5, gmi_ad6_pg6,
> +                    gmi_ad7_pg7, gmi_ad8_ph0, gmi_ad9_ph1, gmi_ad10_ph2,
> +                    gmi_ad11_ph3, gmi_ad12_ph4, gmi_ad13_ph5, gmi_ad14_ph6,
> +                    gmi_ad15_ph7, gmi_a16_pj7, gmi_a17_pb0, gmi_a18_pb1,
> +                    gmi_a19_pk7, gmi_wr_n_pi0, gmi_oe_n_pi1, gmi_dqs_p_pj3,
> +                    gmi_rst_n_pi4, gen2_i2c_scl_pt5, gen2_i2c_sda_pt6,
> +                    sdmmc4_clk_pcc4, sdmmc4_cmd_pt7, sdmmc4_dat0_paa0,
> +                    sdmmc4_dat1_paa1, sdmmc4_dat2_paa2, sdmmc4_dat3_paa3,
> +                    sdmmc4_dat4_paa4, sdmmc4_dat5_paa5, sdmmc4_dat6_paa6,
> +                    sdmmc4_dat7_paa7, cam_mclk_pcc0, pcc1, pbb0,
> +                    cam_i2c_scl_pbb1, cam_i2c_sda_pbb2, pbb3, pbb4, pbb5, pbb6,
> +                    pbb7, pcc2, pwr_i2c_scl_pz6, pwr_i2c_sda_pz7, kb_row0_pr0,
> +                    kb_row1_pr1, kb_row2_pr2, kb_row3_pr3, kb_row4_pr4,
> +                    kb_row5_pr5, kb_row6_pr6, kb_row7_pr7, kb_row8_ps0,
> +                    kb_row9_ps1, kb_row10_ps2, kb_col0_pq0, kb_col1_pq1,
> +                    kb_col2_pq2, kb_col3_pq3, kb_col4_pq4, kb_col5_pq5,
> +                    kb_col6_pq6, kb_col7_pq7, clk_32k_out_pa0, sys_clk_req_pz5,
> +                    core_pwr_req, cpu_pwr_req, pwr_int_n, owr, dap1_fs_pn0,
> +                    dap1_din_pn1, dap1_dout_pn2, dap1_sclk_pn3, clk1_req_pee2,
> +                    clk1_out_pw4, spdif_in_pk6, spdif_out_pk5, dap2_fs_pa2,
> +                    dap2_din_pa4, dap2_dout_pa5, dap2_sclk_pa3, dvfs_pwm_px0,
> +                    gpio_x1_aud_px1, gpio_x3_aud_px3, dvfs_clk_px2,
> +                    gpio_x4_aud_px4, gpio_x5_aud_px5, gpio_x6_aud_px6,
> +                    gpio_x7_aud_px7, sdmmc3_clk_pa6, sdmmc3_cmd_pa7,
> +                    sdmmc3_dat0_pb7, sdmmc3_dat1_pb6, sdmmc3_dat2_pb5,
> +                    sdmmc3_dat3_pb4, hdmi_cec_pee3, sdmmc1_wp_n_pv3,
> +                    sdmmc3_cd_n_pv2, gpio_w2_aud_pw2, gpio_w3_aud_pw3,
> +                    usb_vbus_en0_pn4, usb_vbus_en1_pn5, sdmmc3_clk_lb_in_pee5,
> +                    sdmmc3_clk_lb_out_pee4, reset_out_n,
> +                    # drive groups
> +                    drive_ao1, drive_ao2, drive_at1, drive_at2, drive_at3,
> +                    drive_at4, drive_at5, drive_cdev1, drive_cdev2, drive_dap1,
> +                    drive_dap2, drive_dap3, drive_dap4, drive_dbg, drive_sdio3,
> +                    drive_spi, drive_uaa, drive_uab, drive_uart2, drive_uart3,
> +                    drive_sdio1, drive_ddc, drive_gma, drive_gme, drive_gmf,
> +                    drive_gmg, drive_gmh, drive_owr, drive_uda ]
> +
> +        nvidia,function:
> +          enum: [ blink, cec, cldvfs, clk12, cpu, dap, dap1, dap2, dev3,
> +                  displaya, displaya_alt, displayb, dtv, emc_dll, extperiph1,
> +                  extperiph2, extperiph3, gmi, gmi_alt, hda, hsi, i2c1, i2c2,
> +                  i2c3, i2c4, i2cpwr, i2s0, i2s1, i2s2, i2s3, i2s4, irda, kbc,
> +                  nand, nand_alt, owr, pmi, pwm0, pwm1, pwm2, pwm3, pwron,
> +                  reset_out_n, rsvd1, rsvd2, rsvd3, rsvd4, sdmmc1, sdmmc2,
> +                  sdmmc3, sdmmc4, soc, spdif, spi1, spi2, spi3, spi4, spi5,
> +                  spi6, sysclk, trace, uarta, uartb, uartc, uartd, ulpi, usb,
> +                  vgp1, vgp2, vgp3, vgp4, vgp5, vgp6, vi, vi_alt1, vi_alt3 ]
> +
> +        nvidia,enable-input:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/enable-input'
> +
> +        nvidia,open-drain:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/open-drain'
> +
> +        nvidia,lock:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/lock'
> +
> +        nvidia,io-reset:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/io-reset'
> +
> +        nvidia,rcv-sel:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/rcv-sel'
> +
> +        nvidia,high-speed-mode:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/high-speed-mode'
> +
> +        nvidia,low-power-mode:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/low-power-mode'
> +
> +        nvidia,drive-type:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/drive-type'
> +
> +        nvidia,slew-rate-rising:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/slew-rate-rising'
> +
> +        nvidia,slew-rate-falling:
> +          $ref: 'nvidia,tegra-pinmux-common.yaml#/definitions/slew-rate-falling'
> +
> +      required:
> +        - nvidia,pins
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    pinmux@70000868 {
> +      compatible = "nvidia,tegra114-pinmux";
> +      reg = <0x70000868 0x148>, /* Pad control registers */
> +            <0x70003000 0x40c>; /* PinMux registers */
> +
> +      pinmux {
> +        sdmmc4_clk_pcc4 {

Humm, this doesn't even match the schema. The child and grandchild are 
swapped. It's saying any child node has only child nodes named 
"^pinmux(-[a-z0-9-_]+)?$".

Please test your patches. This didn't apply, so no automated checks ran. 
But that's not a free testing service anyways. :(

Rob

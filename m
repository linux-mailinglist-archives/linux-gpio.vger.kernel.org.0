Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A43242FB5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Aug 2020 21:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgHLT4z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Aug 2020 15:56:55 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:37443 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbgHLT4z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Aug 2020 15:56:55 -0400
Received: by mail-il1-f196.google.com with SMTP id p13so3109435ilh.4;
        Wed, 12 Aug 2020 12:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YIQuywmZQYv8nyctUY+U6cxLonQFim+3ucoy16oAg5E=;
        b=sXI4xS9k+RkXmQdIxElfTLnh8VM2URFL9J5gI6yWtXj1NHWxNMPVO88r2VL5spaQOA
         E5qx2bO8QHCmJuQtdEawY4kXz4fNrUXilg7nMe18dym3udT9rQgiVz328MZBfM3c1sbo
         OU1ivtkctcOMQVZqkWRl8n9eOT5BwfYXdMjtj74uGvf3SoH4Thq7m04NITA4WcdTfSM3
         JA9t024h1mOVVVQRWYi1iw5RLOrXcfYXrc78oFaRymVTbdKyDSI1KGr4W3I//zsyuK9I
         V5MkvV9Z7iK/Bne7wNg3OOH5PxlpC0eNyIH7U2MVumOQJXFOpZ7qpB9273hL7Idczgwt
         u8qQ==
X-Gm-Message-State: AOAM5339JIBUVUzcpk3O4320kP87pptflnZJ2IKktPrTmakcoISMDzVt
        nL2/B1+Vv0YcaaJrYomCAnCJRAs=
X-Google-Smtp-Source: ABdhPJxVCRXI3N3t993pSKM8QYlIlG++ktvmTWomoa62tpqh6WpR7KC0C2GYt2I5dRRii412nb1enA==
X-Received: by 2002:a05:6e02:1207:: with SMTP id a7mr1222991ilq.303.1597262213414;
        Wed, 12 Aug 2020 12:56:53 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x2sm1426228iom.14.2020.08.12.12.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 12:56:52 -0700 (PDT)
Received: (nullmailer pid 2604347 invoked by uid 1000);
        Wed, 12 Aug 2020 19:56:51 -0000
Date:   Wed, 12 Aug 2020 13:56:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add bindings for Actions
 S500 SoC
Message-ID: <20200812195651.GA2594940@bogus>
References: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
 <7abf618c446b7b648f512afe72e46704156e9912.1596461275.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7abf618c446b7b648f512afe72e46704156e9912.1596461275.git.cristian.ciocaltea@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 03, 2020 at 05:20:54PM +0300, Cristian Ciocaltea wrote:
> Add pinctrl and gpio bindings for Actions Semi S500 SoC.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> ---
> Changes in v2:
>  - Added myself to the list of maintainers, per Mani's suggestion
>  - Added a description item for each of the four register ranges,
>    per Rob's feedback
>  - Renamed the pin nodes and got rid of the if/then hack in the
>    patternProperties,according to Rob's suggestion
>  - Added a missing 'additionalProperties: false' line
>  - Updated the example with the new node names and the split
>    register range
> 
>  .../pinctrl/actions,s500-pinctrl.yaml         | 240 ++++++++++++++++++
>  1 file changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> new file mode 100644
> index 000000000000..33391d30c00c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> @@ -0,0 +1,240 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/actions,s500-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Actions Semi S500 SoC pinmux & GPIO controller
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +  - Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> +
> +description: |
> +  Pinmux & GPIO controller manages pin multiplexing & configuration including
> +  GPIO function selection & GPIO attributes configuration. Please refer to
> +  pinctrl-bindings.txt in this directory for common binding part and usage.
> +
> +properties:
> +  compatible:
> +    const: actions,s500-pinctrl
> +
> +  reg:
> +    items:
> +      - description: GPIO Output + GPIO Input + GPIO Data
> +      - description: Multiplexing Control
> +      - description: PAD Pull Control + PAD Schmitt Trigger Enable + PAD Control
> +      - description: PAD Drive Capacity Select
> +    minItems: 1
> +    maxItems: 4
> +
> +  clocks:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  '#gpio-cells':
> +    description:
> +      Specifies the pin number and flags, as defined in
> +      include/dt-bindings/gpio/gpio.h
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description:
> +      Specifies the pin number and flags, as defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2
> +
> +  interrupts:
> +    description:
> +      One interrupt per each of the 5 GPIO ports supported by the controller,
> +      sorted by port number ascending order.
> +    minItems: 5
> +    maxItems: 5
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    patternProperties:
> +      '^(.*-)?pinmux$':
> +        type: object
> +        description:
> +          Pinctrl node's client devices specify pin muxes using subnodes,
> +          which in turn use the standard properties below.
> +        $ref: pinmux-node.yaml#
> +
> +        properties:
> +          groups:
> +            description:
> +              List of gpio pin groups affected by the functions specified in
> +              this subnode.
> +            items:
> +              oneOf:

You don't need oneOf with only 1 entry.

With that and the other 2 cases fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +                - enum: [lcd0_d18_mfp, rmii_crs_dv_mfp, rmii_txd0_mfp,
> +                    rmii_txd1_mfp, rmii_txen_mfp, rmii_rxen_mfp, rmii_rxd1_mfp,
> +                    rmii_rxd0_mfp, rmii_ref_clk_mfp, i2s_d0_mfp, i2s_pcm1_mfp,
> +                    i2s0_pcm0_mfp, i2s1_pcm0_mfp, i2s_d1_mfp, ks_in2_mfp,
> +                    ks_in1_mfp, ks_in0_mfp, ks_in3_mfp, ks_out0_mfp,
> +                    ks_out1_mfp, ks_out2_mfp, lvds_o_pn_mfp, dsi_dn0_mfp,
> +                    dsi_dp2_mfp, lcd0_d17_mfp, dsi_dp3_mfp, dsi_dn3_mfp,
> +                    dsi_dp0_mfp, lvds_ee_pn_mfp, spi0_i2c_pcm_mfp,
> +                    spi0_i2s_pcm_mfp, dsi_dnp1_cp_mfp, lvds_e_pn_mfp,
> +                    dsi_dn2_mfp, uart2_rtsb_mfp, uart2_ctsb_mfp, uart3_rtsb_mfp,
> +                    uart3_ctsb_mfp, sd0_d0_mfp, sd0_d1_mfp, sd0_d2_d3_mfp,
> +                    sd1_d0_d3_mfp, sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_mfp,
> +                    uart0_rx_mfp, clko_25m_mfp, csi_cn_cp_mfp, sens0_ckout_mfp,
> +                    uart0_tx_mfp, i2c0_mfp, csi_dn_dp_mfp, sen0_pclk_mfp,
> +                    pcm1_in_mfp, pcm1_clk_mfp, pcm1_sync_mfp, pcm1_out_mfp,
> +                    dnand_data_wr_mfp, dnand_acle_ce0_mfp, nand_ceb2_mfp,
> +                    nand_ceb3_mfp]
> +            minItems: 1
> +            maxItems: 32
> +
> +          function:
> +            description:
> +              Specify the alternative function to be configured for the
> +              given gpio pin groups.
> +            enum: [nor, eth_rmii, eth_smii, spi0, spi1, spi2, spi3, sens0,
> +              sens1, uart0, uart1, uart2, uart3, uart4, uart5, uart6, i2s0,
> +              i2s1, pcm1, pcm0, ks, jtag, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5,
> +              p0, sd0, sd1, sd2, i2c0, i2c1, i2c3, dsi, lvds, usb30, clko_25m,
> +              mipi_csi, nand, spdif, ts, lcd0]
> +
> +        required:
> +          - groups
> +          - function
> +
> +        additionalProperties: false
> +
> +      '^(.*-)?pinconf$':
> +        type: object
> +        description:
> +          Pinctrl node's client devices specify pin configurations using
> +          subnodes, which in turn use the standard properties below.
> +        $ref: pincfg-node.yaml#
> +
> +        properties:
> +          groups:
> +            description:
> +              List of gpio pin groups affected by the drive-strength property
> +              specified in this subnode.
> +            items:
> +              oneOf:
> +                - enum: [sirq_drv, rmii_txd01_txen_drv, rmii_rxer_drv,
> +                    rmii_crs_drv, rmii_rxd10_drv, rmii_ref_clk_drv,
> +                    smi_mdc_mdio_drv, i2s_d0_drv, i2s_bclk0_drv, i2s3_drv,
> +                    i2s13_drv, pcm1_drv, ks_in_drv, ks_out_drv, lvds_all_drv,
> +                    lcd_dsi_drv, dsi_drv, sd0_d0_d3_drv, sd1_d0_d3_drv,
> +                    sd0_cmd_drv, sd0_clk_drv, sd1_cmd_drv, sd1_clk_drv,
> +                    spi0_all_drv, uart0_rx_drv, uart0_tx_drv, uart2_all_drv,
> +                    i2c0_all_drv, i2c12_all_drv, sens0_pclk_drv,
> +                    sens0_ckout_drv, uart3_all_drv]
> +            minItems: 1
> +            maxItems: 32
> +
> +          pins:
> +            description:
> +              List of gpio pins affected by the bias-pull-* and
> +              input-schmitt-* properties specified in this subnode.
> +            items:
> +              oneOf:
> +                - enum: [dnand_dqs, dnand_dqsn, eth_txd0, eth_txd1, eth_txen,
> +                    eth_rxer, eth_crs_dv, eth_rxd1, eth_rxd0, eth_ref_clk,
> +                    eth_mdc, eth_mdio, sirq0, sirq1, sirq2, i2s_d0, i2s_bclk0,
> +                    i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1, i2s_lrclk1,
> +                    i2s_mclk1, ks_in0, ks_in1, ks_in2, ks_in3, ks_out0, ks_out1,
> +                    ks_out2, lvds_oep, lvds_oen, lvds_odp, lvds_odn, lvds_ocp,
> +                    lvds_ocn, lvds_obp, lvds_obn, lvds_oap, lvds_oan, lvds_eep,
> +                    lvds_een, lvds_edp, lvds_edn, lvds_ecp, lvds_ecn, lvds_ebp,
> +                    lvds_ebn, lvds_eap, lvds_ean, lcd0_d18, lcd0_d17, dsi_dp3,
> +                    dsi_dn3, dsi_dp1, dsi_dn1, dsi_cp, dsi_cn, dsi_dp0, dsi_dn0,
> +                    dsi_dp2, dsi_dn2, sd0_d0, sd0_d1, sd0_d2, sd0_d3, sd1_d0,
> +                    sd1_d1, sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd, sd1_clk,
> +                    spi0_sclk, spi0_ss, spi0_miso, spi0_mosi, uart0_rx,
> +                    uart0_tx, i2c0_sclk, i2c0_sdata, sensor0_pclk,
> +                    sensor0_ckout, dnand_ale, dnand_cle, dnand_ceb0, dnand_ceb1,
> +                    dnand_ceb2, dnand_ceb3, uart2_rx, uart2_tx, uart2_rtsb,
> +                    uart2_ctsb, uart3_rx, uart3_tx, uart3_rtsb, uart3_ctsb,
> +                    pcm1_in, pcm1_clk, pcm1_sync, pcm1_out, i2c1_sclk,
> +                    i2c1_sdata, i2c2_sclk, i2c2_sdata, csi_dn0, csi_dp0,
> +                    csi_dn1, csi_dp1, csi_dn2, csi_dp2, csi_dn3, csi_dp3,
> +                    csi_cn, csi_cp, dnand_d0, dnand_d1, dnand_d2, dnand_d3,
> +                    dnand_d4, dnand_d5, dnand_d6, dnand_d7, dnand_rb, dnand_rdb,
> +                    dnand_rdbn, dnand_wrb, porb, clko_25m, bsel, pkg0, pkg1,
> +                    pkg2, pkg3]
> +            minItems: 1
> +            maxItems: 64
> +
> +          bias-pull-up: true
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            description:
> +              Selects the drive strength for the specified pins, in mA.
> +            enum: [2, 4, 8, 12]
> +
> +          input-schmitt-enable: true
> +          input-schmitt-disable: true
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - gpio-controller
> +  - gpio-ranges
> +  - '#gpio-cells'
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pinctrl: pinctrl@b01b0000 {
> +        compatible = "actions,s500-pinctrl";
> +        reg = <0xb01b0000 0x40>, <0xb01b0040 0x10>,
> +              <0xb01b0060 0x18>, <0xb01b0080 0xc>;
> +        clocks = <&cmu 55>;
> +        gpio-controller;
> +        gpio-ranges = <&pinctrl 0 0 132>;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        mmc0_pins: mmc0-pins {
> +            pinmux {
> +                groups = "sd0_d0_mfp", "sd0_d1_mfp", "sd0_d2_d3_mfp",
> +                         "sd0_cmd_mfp", "sd0_clk_mfp";
> +                function = "sd0";
> +            };
> +
> +            drv-pinconf {
> +                groups = "sd0_d0_d3_drv", "sd0_cmd_drv", "sd0_clk_drv";
> +                drive-strength = <8>;
> +            };
> +
> +            bias-pinconf {
> +                pins = "sd0_d0", "sd0_d1", "sd0_d2",
> +                       "sd0_d3", "sd0_cmd";
> +                bias-pull-up;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.28.0
> 

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B52243701
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 10:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgHMI61 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 04:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgHMI61 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 04:58:27 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1836EC061757;
        Thu, 13 Aug 2020 01:58:27 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id c16so5306769ejx.12;
        Thu, 13 Aug 2020 01:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sJq2bJZJVAv38PUDY/kn6nMzmALr7+D0J2holnZdUPw=;
        b=eabUjEWZVUjDlZEiSdqLsVtFwlrAKO2TC6lot5iXzFwtwZm9mypf1bTscyMIbIlwzQ
         6B2577Bp0yRpb+KFyNfbi0jTIuJorbJglTurffHmI6fHJ3IBCtwmfi52Gu8L6OX5KmJK
         anSXdgndLUemoovz+5nXmJ1t7YC3tC1sPfMHU0Hw9hEGEwZJ2OFCh2M9x2kDbYwMEroe
         0TCTmgecGG1GhQ4K4tPrfp+kUvh7DqWbMiKeEV3GTzETv2I2aLLq0sujT33ILDA3h5As
         HhpjIDGNl9ZekNAFcoG12m76n2skyZapvODuo6tVPtlpShp6MaE/XgYUgevMYqkgDCkJ
         /dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sJq2bJZJVAv38PUDY/kn6nMzmALr7+D0J2holnZdUPw=;
        b=KatCgeBnn4oZ1yTXP6xo0SMnJgQ+aHW+lF+IODV51zkymaVsFv72ahH1l1T2igTtpj
         NckJWxAFPMhhGEd+huRuJEyftFoyAG35znRmFu7Gx7E8WPC7njTNwmHAKlHgs2f1xwfS
         fM+VDpqpGXEkVvAq+0LtB2EDhiJ9qdXoKMfbju+kxIs3oXZO6FHdNLVUUpUMNAis7uga
         XTtfSSrEmewUa79tlUy6iSMt428G05WIXcYe+Ffr7+0vPsUxvORlZFGXeBlUIu7K1sQY
         GCgMNNCzfhIi/KFuKjektEil1r4vN5MrhHtocnMSNeOjE2BKEaEKpgyTx0e4x+EOQies
         VHHA==
X-Gm-Message-State: AOAM533PFloCHAKRQOZNyVdGyp5tWuhgYetAIwajlD2BsV1vCLN/aS7k
        T5oKbId9JGhkHItbyg+MblY=
X-Google-Smtp-Source: ABdhPJybp7ey6pANRZ8RPt1pPlzPz0bYzygcBfM9Wzxo6RK+Z129KPtLirWbgDQwhMPXllAyWizhbQ==
X-Received: by 2002:a17:906:ce39:: with SMTP id sd25mr4003327ejb.80.1597309105699;
        Thu, 13 Aug 2020 01:58:25 -0700 (PDT)
Received: from BV030612LT ([86.121.43.21])
        by smtp.gmail.com with ESMTPSA id t18sm3376220ejf.38.2020.08.13.01.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 01:58:25 -0700 (PDT)
Date:   Thu, 13 Aug 2020 11:58:22 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add bindings for Actions
 S500 SoC
Message-ID: <20200813085822.GA1705514@BV030612LT>
References: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
 <7abf618c446b7b648f512afe72e46704156e9912.1596461275.git.cristian.ciocaltea@gmail.com>
 <20200812195651.GA2594940@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812195651.GA2594940@bogus>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 12, 2020 at 01:56:51PM -0600, Rob Herring wrote:
> On Mon, Aug 03, 2020 at 05:20:54PM +0300, Cristian Ciocaltea wrote:
> > Add pinctrl and gpio bindings for Actions Semi S500 SoC.
> > 
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > ---
> > Changes in v2:
> >  - Added myself to the list of maintainers, per Mani's suggestion
> >  - Added a description item for each of the four register ranges,
> >    per Rob's feedback
> >  - Renamed the pin nodes and got rid of the if/then hack in the
> >    patternProperties,according to Rob's suggestion
> >  - Added a missing 'additionalProperties: false' line
> >  - Updated the example with the new node names and the split
> >    register range
> > 
> >  .../pinctrl/actions,s500-pinctrl.yaml         | 240 ++++++++++++++++++
> >  1 file changed, 240 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..33391d30c00c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > @@ -0,0 +1,240 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/actions,s500-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Actions Semi S500 SoC pinmux & GPIO controller
> > +
> > +maintainers:
> > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +  - Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > +
> > +description: |
> > +  Pinmux & GPIO controller manages pin multiplexing & configuration including
> > +  GPIO function selection & GPIO attributes configuration. Please refer to
> > +  pinctrl-bindings.txt in this directory for common binding part and usage.
> > +
> > +properties:
> > +  compatible:
> > +    const: actions,s500-pinctrl
> > +
> > +  reg:
> > +    items:
> > +      - description: GPIO Output + GPIO Input + GPIO Data
> > +      - description: Multiplexing Control
> > +      - description: PAD Pull Control + PAD Schmitt Trigger Enable + PAD Control
> > +      - description: PAD Drive Capacity Select
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  '#gpio-cells':
> > +    description:
> > +      Specifies the pin number and flags, as defined in
> > +      include/dt-bindings/gpio/gpio.h
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    description:
> > +      Specifies the pin number and flags, as defined in
> > +      include/dt-bindings/interrupt-controller/irq.h
> > +    const: 2
> > +
> > +  interrupts:
> > +    description:
> > +      One interrupt per each of the 5 GPIO ports supported by the controller,
> > +      sorted by port number ascending order.
> > +    minItems: 5
> > +    maxItems: 5
> > +
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> > +    patternProperties:
> > +      '^(.*-)?pinmux$':
> > +        type: object
> > +        description:
> > +          Pinctrl node's client devices specify pin muxes using subnodes,
> > +          which in turn use the standard properties below.
> > +        $ref: pinmux-node.yaml#
> > +
> > +        properties:
> > +          groups:
> > +            description:
> > +              List of gpio pin groups affected by the functions specified in
> > +              this subnode.
> > +            items:
> > +              oneOf:
> 
> You don't need oneOf with only 1 entry.
> 
> With that and the other 2 cases fixed,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
 
Hi Rob,

Thanks for reviewing!

I tried to drop the first occurrence of the indicated 'oneOf' nodes,
but I get the following error when checking the example:

actions,s500-pinctrl.example.dt.yaml: pinctrl@b01b0000: mmc0-pins:pinmux:groups: 
 Additional items are not allowed ('sd0_d1_mfp', 'sd0_d2_d3_mfp', 
 'sd0_cmd_mfp', 'sd0_clk_mfp' were unexpected)

It seems this only allows one value item to be provided:
  groups = "sd0_d0_mfp";

instead of the required:
  groups = "sd0_d0_mfp", "sd0_d1_mfp", "sd0_d2_d3_mfp",
           "sd0_cmd_mfp", "sd0_clk_mfp";

Kind regards,
Cristi

> > +                - enum: [lcd0_d18_mfp, rmii_crs_dv_mfp, rmii_txd0_mfp,
> > +                    rmii_txd1_mfp, rmii_txen_mfp, rmii_rxen_mfp, rmii_rxd1_mfp,
> > +                    rmii_rxd0_mfp, rmii_ref_clk_mfp, i2s_d0_mfp, i2s_pcm1_mfp,
> > +                    i2s0_pcm0_mfp, i2s1_pcm0_mfp, i2s_d1_mfp, ks_in2_mfp,
> > +                    ks_in1_mfp, ks_in0_mfp, ks_in3_mfp, ks_out0_mfp,
> > +                    ks_out1_mfp, ks_out2_mfp, lvds_o_pn_mfp, dsi_dn0_mfp,
> > +                    dsi_dp2_mfp, lcd0_d17_mfp, dsi_dp3_mfp, dsi_dn3_mfp,
> > +                    dsi_dp0_mfp, lvds_ee_pn_mfp, spi0_i2c_pcm_mfp,
> > +                    spi0_i2s_pcm_mfp, dsi_dnp1_cp_mfp, lvds_e_pn_mfp,
> > +                    dsi_dn2_mfp, uart2_rtsb_mfp, uart2_ctsb_mfp, uart3_rtsb_mfp,
> > +                    uart3_ctsb_mfp, sd0_d0_mfp, sd0_d1_mfp, sd0_d2_d3_mfp,
> > +                    sd1_d0_d3_mfp, sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_mfp,
> > +                    uart0_rx_mfp, clko_25m_mfp, csi_cn_cp_mfp, sens0_ckout_mfp,
> > +                    uart0_tx_mfp, i2c0_mfp, csi_dn_dp_mfp, sen0_pclk_mfp,
> > +                    pcm1_in_mfp, pcm1_clk_mfp, pcm1_sync_mfp, pcm1_out_mfp,
> > +                    dnand_data_wr_mfp, dnand_acle_ce0_mfp, nand_ceb2_mfp,
> > +                    nand_ceb3_mfp]
> > +            minItems: 1
> > +            maxItems: 32
> > +
> > +          function:
> > +            description:
> > +              Specify the alternative function to be configured for the
> > +              given gpio pin groups.
> > +            enum: [nor, eth_rmii, eth_smii, spi0, spi1, spi2, spi3, sens0,
> > +              sens1, uart0, uart1, uart2, uart3, uart4, uart5, uart6, i2s0,
> > +              i2s1, pcm1, pcm0, ks, jtag, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5,
> > +              p0, sd0, sd1, sd2, i2c0, i2c1, i2c3, dsi, lvds, usb30, clko_25m,
> > +              mipi_csi, nand, spdif, ts, lcd0]
> > +
> > +        required:
> > +          - groups
> > +          - function
> > +
> > +        additionalProperties: false
> > +
> > +      '^(.*-)?pinconf$':
> > +        type: object
> > +        description:
> > +          Pinctrl node's client devices specify pin configurations using
> > +          subnodes, which in turn use the standard properties below.
> > +        $ref: pincfg-node.yaml#
> > +
> > +        properties:
> > +          groups:
> > +            description:
> > +              List of gpio pin groups affected by the drive-strength property
> > +              specified in this subnode.
> > +            items:
> > +              oneOf:
> > +                - enum: [sirq_drv, rmii_txd01_txen_drv, rmii_rxer_drv,
> > +                    rmii_crs_drv, rmii_rxd10_drv, rmii_ref_clk_drv,
> > +                    smi_mdc_mdio_drv, i2s_d0_drv, i2s_bclk0_drv, i2s3_drv,
> > +                    i2s13_drv, pcm1_drv, ks_in_drv, ks_out_drv, lvds_all_drv,
> > +                    lcd_dsi_drv, dsi_drv, sd0_d0_d3_drv, sd1_d0_d3_drv,
> > +                    sd0_cmd_drv, sd0_clk_drv, sd1_cmd_drv, sd1_clk_drv,
> > +                    spi0_all_drv, uart0_rx_drv, uart0_tx_drv, uart2_all_drv,
> > +                    i2c0_all_drv, i2c12_all_drv, sens0_pclk_drv,
> > +                    sens0_ckout_drv, uart3_all_drv]
> > +            minItems: 1
> > +            maxItems: 32
> > +
> > +          pins:
> > +            description:
> > +              List of gpio pins affected by the bias-pull-* and
> > +              input-schmitt-* properties specified in this subnode.
> > +            items:
> > +              oneOf:
> > +                - enum: [dnand_dqs, dnand_dqsn, eth_txd0, eth_txd1, eth_txen,
> > +                    eth_rxer, eth_crs_dv, eth_rxd1, eth_rxd0, eth_ref_clk,
> > +                    eth_mdc, eth_mdio, sirq0, sirq1, sirq2, i2s_d0, i2s_bclk0,
> > +                    i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1, i2s_lrclk1,
> > +                    i2s_mclk1, ks_in0, ks_in1, ks_in2, ks_in3, ks_out0, ks_out1,
> > +                    ks_out2, lvds_oep, lvds_oen, lvds_odp, lvds_odn, lvds_ocp,
> > +                    lvds_ocn, lvds_obp, lvds_obn, lvds_oap, lvds_oan, lvds_eep,
> > +                    lvds_een, lvds_edp, lvds_edn, lvds_ecp, lvds_ecn, lvds_ebp,
> > +                    lvds_ebn, lvds_eap, lvds_ean, lcd0_d18, lcd0_d17, dsi_dp3,
> > +                    dsi_dn3, dsi_dp1, dsi_dn1, dsi_cp, dsi_cn, dsi_dp0, dsi_dn0,
> > +                    dsi_dp2, dsi_dn2, sd0_d0, sd0_d1, sd0_d2, sd0_d3, sd1_d0,
> > +                    sd1_d1, sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd, sd1_clk,
> > +                    spi0_sclk, spi0_ss, spi0_miso, spi0_mosi, uart0_rx,
> > +                    uart0_tx, i2c0_sclk, i2c0_sdata, sensor0_pclk,
> > +                    sensor0_ckout, dnand_ale, dnand_cle, dnand_ceb0, dnand_ceb1,
> > +                    dnand_ceb2, dnand_ceb3, uart2_rx, uart2_tx, uart2_rtsb,
> > +                    uart2_ctsb, uart3_rx, uart3_tx, uart3_rtsb, uart3_ctsb,
> > +                    pcm1_in, pcm1_clk, pcm1_sync, pcm1_out, i2c1_sclk,
> > +                    i2c1_sdata, i2c2_sclk, i2c2_sdata, csi_dn0, csi_dp0,
> > +                    csi_dn1, csi_dp1, csi_dn2, csi_dp2, csi_dn3, csi_dp3,
> > +                    csi_cn, csi_cp, dnand_d0, dnand_d1, dnand_d2, dnand_d3,
> > +                    dnand_d4, dnand_d5, dnand_d6, dnand_d7, dnand_rb, dnand_rdb,
> > +                    dnand_rdbn, dnand_wrb, porb, clko_25m, bsel, pkg0, pkg1,
> > +                    pkg2, pkg3]
> > +            minItems: 1
> > +            maxItems: 64
> > +
> > +          bias-pull-up: true
> > +          bias-pull-down: true
> > +
> > +          drive-strength:
> > +            description:
> > +              Selects the drive strength for the specified pins, in mA.
> > +            enum: [2, 4, 8, 12]
> > +
> > +          input-schmitt-enable: true
> > +          input-schmitt-disable: true
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - gpio-controller
> > +  - gpio-ranges
> > +  - '#gpio-cells'
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    pinctrl: pinctrl@b01b0000 {
> > +        compatible = "actions,s500-pinctrl";
> > +        reg = <0xb01b0000 0x40>, <0xb01b0040 0x10>,
> > +              <0xb01b0060 0x18>, <0xb01b0080 0xc>;
> > +        clocks = <&cmu 55>;
> > +        gpio-controller;
> > +        gpio-ranges = <&pinctrl 0 0 132>;
> > +        #gpio-cells = <2>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        mmc0_pins: mmc0-pins {
> > +            pinmux {
> > +                groups = "sd0_d0_mfp", "sd0_d1_mfp", "sd0_d2_d3_mfp",
> > +                         "sd0_cmd_mfp", "sd0_clk_mfp";
> > +                function = "sd0";
> > +            };
> > +
> > +            drv-pinconf {
> > +                groups = "sd0_d0_d3_drv", "sd0_cmd_drv", "sd0_clk_drv";
> > +                drive-strength = <8>;
> > +            };
> > +
> > +            bias-pinconf {
> > +                pins = "sd0_d0", "sd0_d1", "sd0_d2",
> > +                       "sd0_d3", "sd0_cmd";
> > +                bias-pull-up;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.28.0
> > 

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC9A2352CD
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Aug 2020 16:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgHAOqS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Aug 2020 10:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgHAOqR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Aug 2020 10:46:17 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB52CC06174A
        for <linux-gpio@vger.kernel.org>; Sat,  1 Aug 2020 07:46:16 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id x6so2317733pgx.12
        for <linux-gpio@vger.kernel.org>; Sat, 01 Aug 2020 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YNZdogWNHMFlanhhxelHezDj/qACSrsdODf21xb/oMs=;
        b=ozsab+oMiH4hfo3/MSxmhc9D6ktNiVFvEWSqTI7f/Q0cr1ME/fwXq7XhiwoxKlGzRx
         1c+s+Zaybgdpqvox3RPo0dIYyhrEVo4P6vVgafSsQn6bmDyii0OXe91hk9WqR1Ve62YJ
         VAW6XPs4MQaHS0o4/EhOYZVPD35GY+FvIO1P/eMY0QNUbeJXhZJMg4vvvkBJ40fWCOlZ
         4L8FPzbhypTMoEAUzofq4rtmAixm/GeMoibfH19R8xbXuLvqOhohftE1nM6I1hXNhcBh
         cl20ax6i9nMmNcNd8ozOOz/Dr1SrDGt5VDEHQ6z5owuocI89UxhaI+j/LO1UIHJY5mNC
         dWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YNZdogWNHMFlanhhxelHezDj/qACSrsdODf21xb/oMs=;
        b=AIup4CYoUwZMCNgCi1xF9pXkVbXEQ+v4BtvUjSVWkSiunhcXd1WpwcOMbBtlUD1GGv
         fTHpaxcSGqlGkYjPe/11P/CHRIAjGMLpG+GWS8RSYYoi4UFXXdND2st/zscnBqNTOpCx
         XmOVwadXvplGme9+XvbI6c5aU01zwDuyDK2+iGIrjQJF06lRWemxJ9WL+OxHD5TdTW5o
         UzMi0Cmz2JPHRnGoZyvsdr4dcHZJuSfrnb1p8ob9UPQngcwYKH9PyTb3J5Xipaa45F3O
         Lk3kXwcZKb7FEcQqx0y7fK3JKMqFSKbxXSeCN62YipbLJ4DP2jfVxkMlzPJRCVU9PcqK
         xyjg==
X-Gm-Message-State: AOAM532hOtN3cuSG9sq/nzkrJyjboE+EA6A1lOYzbW7bgLpoDCkl2KqJ
        IzoO+b1zXDBtB2QuprRBR7W7
X-Google-Smtp-Source: ABdhPJzNwJo0nbRjLr7dHcN/4F2Q0oiyovLYWWuV7usiYUoljXGFInisRynYPOwuHtiSXuX7IRZVtw==
X-Received: by 2002:a63:ac53:: with SMTP id z19mr7911537pgn.181.1596293175927;
        Sat, 01 Aug 2020 07:46:15 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e95:ffd1:f06a:645f:768f:f3c5])
        by smtp.gmail.com with ESMTPSA id k23sm13493925pgb.92.2020.08.01.07.46.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Aug 2020 07:46:15 -0700 (PDT)
Date:   Sat, 1 Aug 2020 20:16:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add bindings for Actions S500
 SoC
Message-ID: <20200801144606.GA20252@Mani-XPS-13-9360>
References: <cover.1593112402.git.cristian.ciocaltea@gmail.com>
 <2a7610ff9f33cf72d9df6fc4598741fb6d7836e0.1593112402.git.cristian.ciocaltea@gmail.com>
 <B6ED9520-2945-4181-8C3D-A1AA519248D9@linaro.org>
 <20200626130641.GA21994@BV030612LT>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626130641.GA21994@BV030612LT>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Jun 26, 2020 at 04:06:41PM +0300, Cristian Ciocaltea wrote:
> On Fri, Jun 26, 2020 at 12:50:46PM +0530, Manivannan Sadhasivam wrote:
> > 
> > 
> > On 26 June 2020 1:46:18 AM IST, Cristian Ciocaltea <cristian.ciocaltea@gmail.com> wrote:
> > >Add pinctrl and gpio bindings for Actions Semi S500 SoC.
> > >
> > >Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > >---
> > > .../pinctrl/actions,s500-pinctrl.yaml         | 228 ++++++++++++++++++
> > > 1 file changed, 228 insertions(+)
> > >create mode 100644
> > >Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > >
> > >diff --git
> > >a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > >b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > >new file mode 100644
> > >index 000000000000..856947c70844
> > >--- /dev/null
> > >+++
> > >b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> > >@@ -0,0 +1,228 @@
> > >+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >+%YAML 1.2
> > >+---
> > >+$id: http://devicetree.org/schemas/pinctrl/actions,s500-pinctrl.yaml#
> > >+$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >+
> > >+title: Actions Semi S500 SoC pinmux & GPIO controller
> > >+
> > >+maintainers:
> > >+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Feel free to add yourself as co-maintainer since you are the one contributing S500 support. 
> 
> Ok, thanks!
> 
> > 
> > >+
> > >+description: |
> > >+  Pinmux & GPIO controller manages pin multiplexing & configuration
> > >including
> > >+  GPIO function selection & GPIO attributes configuration. Please
> > >refer to
> > >+  pinctrl-bindings.txt in this directory for common binding part and
> > >usage.
> > >+
> > >+properties:
> > >+  compatible:
> > >+    const: actions,s500-pinctrl
> > >+
> > >+  reg:
> > >+    minItems: 1
> > >+    maxItems: 4
> > 
> > 4?
> > 
> > Thanks, 
> > Mani
> 
> The pinctrl node in the owl-s500 DTS has a more granular specification
> for the reg property, in order to exclude the unused ranges (i.e. PWM):
> 
>   reg = <0xb01b0000 0x40>, /* GPIO */
>         <0xb01b0040 0x10>, <0xb01b0060 0x18>, <0xb01b0080 0xc>;
> 
> The complete node description is available in the related patch:
> https://lore.kernel.org/lkml/b43c9d1a1ef689403bc17b2474aff20629b58263.1593124368.git.cristian.ciocaltea@gmail.com/
> 
> For the sake of simplicity, in the example below I used the contiguous
> range. However, I've just noticed a copy/paste issue there, the correct
> range should be <0xb01b0000 0x8c> - will be fixed in the next revision.
> 

Hmm, okay. We don't have a better solution _yet_ for this issue and I'm okay
with specifying split ranges in the meantime.

Thanks,
Mani

> Thanks for reviewing,
> Cristi
> 
> > 
> > >+
> > >+  clocks:
> > >+    maxItems: 1
> > >+
> > >+  gpio-controller: true
> > >+
> > >+  gpio-ranges:
> > >+    maxItems: 1
> > >+
> > >+  '#gpio-cells':
> > >+    description:
> > >+      Specifies the pin number and flags, as defined in
> > >+      include/dt-bindings/gpio/gpio.h
> > >+    const: 2
> > >+
> > >+  interrupt-controller: true
> > >+
> > >+  '#interrupt-cells':
> > >+    description:
> > >+      Specifies the pin number and flags, as defined in
> > >+      include/dt-bindings/interrupt-controller/irq.h
> > >+    const: 2
> > >+
> > >+  interrupts:
> > >+    description:
> > >+      One interrupt per each of the 5 GPIO ports supported by the
> > >controller,
> > >+      sorted by port number ascending order.
> > >+    minItems: 5
> > >+    maxItems: 5
> > >+
> > >+patternProperties:
> > >+  '^.*$':
> > >+    if:
> > >+      type: object
> > >+    then:
> > >+      patternProperties:
> > >+        'pinmux$':
> > >+          type: object
> > >+          description:
> > >+            Pinctrl node's client devices specify pin muxes using
> > >subnodes,
> > >+            which in turn use the standard properties below.
> > >+          $ref: pinmux-node.yaml#
> > >+
> > >+          properties:
> > >+            groups:
> > >+              description:
> > >+                List of gpio pin groups affected by the functions
> > >specified in
> > >+                this subnode.
> > >+              items:
> > >+                oneOf:
> > >+                  - enum: [lcd0_d18_mfp, rmii_crs_dv_mfp,
> > >rmii_txd0_mfp,
> > >+                      rmii_txd1_mfp, rmii_txen_mfp, rmii_rxen_mfp,
> > >+                      rmii_rxd1_mfp, rmii_rxd0_mfp, rmii_ref_clk_mfp,
> > >+                      i2s_d0_mfp, i2s_pcm1_mfp, i2s0_pcm0_mfp,
> > >i2s1_pcm0_mfp,
> > >+                      i2s_d1_mfp, ks_in2_mfp, ks_in1_mfp, ks_in0_mfp,
> > >+                      ks_in3_mfp, ks_out0_mfp, ks_out1_mfp,
> > >ks_out2_mfp,
> > >+                      lvds_o_pn_mfp, dsi_dn0_mfp, dsi_dp2_mfp,
> > >lcd0_d17_mfp,
> > >+                      dsi_dp3_mfp, dsi_dn3_mfp, dsi_dp0_mfp,
> > >lvds_ee_pn_mfp,
> > >+                      spi0_i2c_pcm_mfp, spi0_i2s_pcm_mfp,
> > >dsi_dnp1_cp_mfp,
> > >+                      lvds_e_pn_mfp, dsi_dn2_mfp, uart2_rtsb_mfp,
> > >+                      uart2_ctsb_mfp, uart3_rtsb_mfp, uart3_ctsb_mfp,
> > >+                      sd0_d0_mfp, sd0_d1_mfp, sd0_d2_d3_mfp,
> > >sd1_d0_d3_mfp,
> > >+                      sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_mfp,
> > >uart0_rx_mfp,
> > >+                      clko_25m_mfp, csi_cn_cp_mfp, sens0_ckout_mfp,
> > >+                      uart0_tx_mfp, i2c0_mfp, csi_dn_dp_mfp,
> > >sen0_pclk_mfp,
> > >+                      pcm1_in_mfp, pcm1_clk_mfp, pcm1_sync_mfp,
> > >pcm1_out_mfp,
> > >+                      dnand_data_wr_mfp, dnand_acle_ce0_mfp,
> > >nand_ceb2_mfp,
> > >+                      nand_ceb3_mfp]
> > >+              minItems: 1
> > >+              maxItems: 32
> > >+
> > >+            function:
> > >+              description:
> > >+                Specify the alternative function to be configured for
> > >the
> > >+                given gpio pin groups.
> > >+              enum: [nor, eth_rmii, eth_smii, spi0, spi1, spi2, spi3,
> > >sens0,
> > >+                sens1, uart0, uart1, uart2, uart3, uart4, uart5,
> > >uart6, i2s0,
> > >+                i2s1, pcm1, pcm0, ks, jtag, pwm0, pwm1, pwm2, pwm3,
> > >pwm4, pwm5,
> > >+                p0, sd0, sd1, sd2, i2c0, i2c1, i2c3, dsi, lvds, usb30,
> > >clko_25m,
> > >+                mipi_csi, nand, spdif, ts, lcd0]
> > >+
> > >+          required:
> > >+            - groups
> > >+            - function
> > >+
> > >+          additionalProperties: false
> > >+
> > >+        'pinconf$':
> > >+          type: object
> > >+          description:
> > >+            Pinctrl node's client devices specify pin configurations
> > >using
> > >+            subnodes, which in turn use the standard properties below.
> > >+          $ref: pincfg-node.yaml#
> > >+
> > >+          properties:
> > >+            groups:
> > >+              description:
> > >+                List of gpio pin groups affected by the drive-strength
> > >property
> > >+                specified in this subnode.
> > >+              items:
> > >+                oneOf:
> > >+                  - enum: [sirq_drv, rmii_txd01_txen_drv,
> > >rmii_rxer_drv,
> > >+                      rmii_crs_drv, rmii_rxd10_drv, rmii_ref_clk_drv,
> > >+                      smi_mdc_mdio_drv, i2s_d0_drv, i2s_bclk0_drv,
> > >i2s3_drv,
> > >+                      i2s13_drv, pcm1_drv, ks_in_drv, ks_out_drv,
> > >lvds_all_drv,
> > >+                      lcd_dsi_drv, dsi_drv, sd0_d0_d3_drv,
> > >sd1_d0_d3_drv,
> > >+                      sd0_cmd_drv, sd0_clk_drv, sd1_cmd_drv,
> > >sd1_clk_drv,
> > >+                      spi0_all_drv, uart0_rx_drv, uart0_tx_drv,
> > >uart2_all_drv,
> > >+                      i2c0_all_drv, i2c12_all_drv, sens0_pclk_drv,
> > >+                      sens0_ckout_drv, uart3_all_drv]
> > >+              minItems: 1
> > >+              maxItems: 32
> > >+
> > >+            pins:
> > >+              description:
> > >+                List of gpio pins affected by the bias-pull-* and
> > >+                input-schmitt-* properties specified in this subnode.
> > >+              items:
> > >+                oneOf:
> > >+                  - enum: [dnand_dqs, dnand_dqsn, eth_txd0, eth_txd1,
> > >eth_txen,
> > >+                      eth_rxer, eth_crs_dv, eth_rxd1, eth_rxd0,
> > >eth_ref_clk,
> > >+                      eth_mdc, eth_mdio, sirq0, sirq1, sirq2, i2s_d0,
> > >i2s_bclk0,
> > >+                      i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1,
> > >i2s_lrclk1,
> > >+                      i2s_mclk1, ks_in0, ks_in1, ks_in2, ks_in3,
> > >ks_out0,
> > >+                      ks_out1, ks_out2, lvds_oep, lvds_oen, lvds_odp,
> > >lvds_odn,
> > >+                      lvds_ocp, lvds_ocn, lvds_obp, lvds_obn,
> > >lvds_oap,
> > >+                      lvds_oan, lvds_eep, lvds_een, lvds_edp,
> > >lvds_edn,
> > >+                      lvds_ecp, lvds_ecn, lvds_ebp, lvds_ebn,
> > >lvds_eap,
> > >+                      lvds_ean, lcd0_d18, lcd0_d17, dsi_dp3, dsi_dn3,
> > >dsi_dp1,
> > >+                      dsi_dn1, dsi_cp, dsi_cn, dsi_dp0, dsi_dn0,
> > >dsi_dp2,
> > >+                      dsi_dn2, sd0_d0, sd0_d1, sd0_d2, sd0_d3, sd1_d0,
> > >sd1_d1,
> > >+                      sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd,
> > >sd1_clk,
> > >+                      spi0_sclk, spi0_ss, spi0_miso, spi0_mosi,
> > >uart0_rx,
> > >+                      uart0_tx, i2c0_sclk, i2c0_sdata, sensor0_pclk,
> > >+                      sensor0_ckout, dnand_ale, dnand_cle, dnand_ceb0,
> > >+                      dnand_ceb1, dnand_ceb2, dnand_ceb3, uart2_rx,
> > >uart2_tx,
> > >+                      uart2_rtsb, uart2_ctsb, uart3_rx, uart3_tx,
> > >uart3_rtsb,
> > >+                      uart3_ctsb, pcm1_in, pcm1_clk, pcm1_sync,
> > >pcm1_out,
> > >+                      i2c1_sclk, i2c1_sdata, i2c2_sclk, i2c2_sdata,
> > >csi_dn0,
> > >+                      csi_dp0, csi_dn1, csi_dp1, csi_dn2, csi_dp2,
> > >csi_dn3,
> > >+                      csi_dp3, csi_cn, csi_cp, dnand_d0, dnand_d1,
> > >dnand_d2,
> > >+                      dnand_d3, dnand_d4, dnand_d5, dnand_d6,
> > >dnand_d7,
> > >+                      dnand_rb, dnand_rdb, dnand_rdbn, dnand_wrb,
> > >porb,
> > >+                      clko_25m, bsel, pkg0, pkg1, pkg2, pkg3]
> > >+              minItems: 1
> > >+              maxItems: 64
> > >+
> > >+            bias-pull-up: true
> > >+            bias-pull-down: true
> > >+
> > >+            drive-strength:
> > >+              description:
> > >+                Selects the drive strength for the specified pins, in
> > >mA.
> > >+              enum: [2, 4, 8, 12]
> > >+
> > >+            input-schmitt-enable: true
> > >+            input-schmitt-disable: true
> > >+
> > >+          additionalProperties: false
> > >+
> > >+required:
> > >+  - compatible
> > >+  - reg
> > >+  - clocks
> > >+  - gpio-controller
> > >+  - gpio-ranges
> > >+  - '#gpio-cells'
> > >+  - interrupt-controller
> > >+  - '#interrupt-cells'
> > >+  - interrupts
> > >+
> > >+additionalProperties: false
> > >+
> > >+examples:
> > >+  - |
> > >+    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > >+    pinctrl: pinctrl@b01b0000 {
> > >+        compatible = "actions,s500-pinctrl";
> > >+        reg = <0xe01b0000 0x1000>;
> > >+        clocks = <&cmu 20>;
> > >+        gpio-controller;
> > >+        gpio-ranges = <&pinctrl 0 0 132>;
> > >+        #gpio-cells = <2>;
> > >+        interrupt-controller;
> > >+        #interrupt-cells = <2>;
> > >+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> > >+                     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
> > >+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
> > >+                     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> > >+                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > >+
> > >+        i2c0_default: i2c0_default {
> > >+            pinmux {
> > >+                groups = "i2c0_mfp";
> > >+                function = "i2c0";
> > >+            };
> > >+
> > >+            pinconf {
> > >+                pins = "i2c0_sclk", "i2c0_sdata";
> > >+                bias-pull-up;
> > >+            };
> > >+        };
> > >+    };
> > >+
> > >+...
> > 
> > -- 
> > Sent from my Android device with K-9 Mail. Please excuse my brevity.

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7257120ACEC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 09:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgFZHUy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 03:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbgFZHUx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 03:20:53 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1EAC08C5DC
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 00:20:53 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id d6so4576628pjs.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 00:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=4C0lujFRmWBeseksoVTiCQffRV1QqfNJE+9Of8mBNbM=;
        b=EaSaX8BW1+9fhDEGP3nqbG2TwSRXrLAdDp7jgY7DrfppO6z5Ro3RPrGC+pnUSj6XAh
         u5K7cDlFj36M4lnharzjIBiPUZsYOPhcRCwCsNpGN/UeAvpA1prGPL7PUVbDMxI8Xseu
         g5/AMn6ofc0fuKPSca3l1/UNseJUVeMIGRdNfA+usBeNWXZdzQYuLiULAyAQaWGkY10T
         JMJCMpvq3RKtlwI7FxxuPwYMISfXZpZcufiMHnb3KrFeXXflwOHuwOQyJldKDKvmsAg+
         9PVJOn9seMWCI7UCP8Sr2JKOFxVbjxzVUPX4BGwxUWJ81jiZN51ES8zoXHnIWDVB3ybn
         rx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=4C0lujFRmWBeseksoVTiCQffRV1QqfNJE+9Of8mBNbM=;
        b=eVY00ZpDiOeP+ZMVAG7tB9eeWcrhcOLTntH4o3eWU8iE0ba4mt0tPR61TW3//UnXRy
         e0oBwqazJa0R9UvVi5gtWW3t/HPprh2MKslZKlqti97D7fr45alXvc+rE2RNmgJSCg0c
         jFqrYCQc1SBqJMh9M+e87GVhkeID9TpcVZdhSGoc5T23mkD8ma/IcAi6YCRXGxSWNiCG
         qoVUIYvOeGuygrMgfpi/Dgth+PFB4WlHeIDsiclB4UloCiPnpYD3Jspr9I35hQeuC7Xl
         RBI+LNiABfSeNu8lINaHUtX/VRUidEhXzzE2b1a/B5QU9RXmiu9aBnJPBuj5M9QRju27
         yGaA==
X-Gm-Message-State: AOAM533Ry1D0wk1n0ZG9D+zpvzKoryAQizH6bpHkNEWTcFiVwCE8SlKw
        m6Lgz8B8ZbtjTzbpfe1hMt6m
X-Google-Smtp-Source: ABdhPJwnPlznA2XN8MT4pd0zHmBQpHo79RM3TCYf9B5s+9Gpb1hzUWATjrwfH65faK0DyLRhr8iWPQ==
X-Received: by 2002:a17:90a:c985:: with SMTP id w5mr2064226pjt.154.1593156052924;
        Fri, 26 Jun 2020 00:20:52 -0700 (PDT)
Received: from ?IPv6:2409:4072:8f:e5bc:398d:eac0:43d5:2c47? ([2409:4072:8f:e5bc:398d:eac0:43d5:2c47])
        by smtp.gmail.com with ESMTPSA id u8sm24605056pfh.215.2020.06.26.00.20.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 00:20:52 -0700 (PDT)
Date:   Fri, 26 Jun 2020 12:50:46 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <2a7610ff9f33cf72d9df6fc4598741fb6d7836e0.1593112402.git.cristian.ciocaltea@gmail.com>
References: <cover.1593112402.git.cristian.ciocaltea@gmail.com> <2a7610ff9f33cf72d9df6fc4598741fb6d7836e0.1593112402.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add bindings for Actions S500 SoC
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <B6ED9520-2945-4181-8C3D-A1AA519248D9@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 26 June 2020 1:46:18 AM IST, Cristian Ciocaltea <cristian=2Eciocaltea@g=
mail=2Ecom> wrote:
>Add pinctrl and gpio bindings for Actions Semi S500 SoC=2E
>
>Signed-off-by: Cristian Ciocaltea <cristian=2Eciocaltea@gmail=2Ecom>
>---
> =2E=2E=2E/pinctrl/actions,s500-pinctrl=2Eyaml         | 228 ++++++++++++=
++++++
> 1 file changed, 228 insertions(+)
>create mode 100644
>Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl=2Eyaml
>
>diff --git
>a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl=2Eyaml
>b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl=2Eyaml
>new file mode 100644
>index 000000000000=2E=2E856947c70844
>--- /dev/null
>+++
>b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl=2Eyaml
>@@ -0,0 +1,228 @@
>+# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>+%YAML 1=2E2
>+---
>+$id: http://devicetree=2Eorg/schemas/pinctrl/actions,s500-pinctrl=2Eyaml=
#
>+$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>+
>+title: Actions Semi S500 SoC pinmux & GPIO controller
>+
>+maintainers:
>+  - Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eorg>

Feel free to add yourself as co-maintainer since you are the one contribut=
ing S500 support=2E=20

>+
>+description: |
>+  Pinmux & GPIO controller manages pin multiplexing & configuration
>including
>+  GPIO function selection & GPIO attributes configuration=2E Please
>refer to
>+  pinctrl-bindings=2Etxt in this directory for common binding part and
>usage=2E
>+
>+properties:
>+  compatible:
>+    const: actions,s500-pinctrl
>+
>+  reg:
>+    minItems: 1
>+    maxItems: 4

4?

Thanks,=20
Mani

>+
>+  clocks:
>+    maxItems: 1
>+
>+  gpio-controller: true
>+
>+  gpio-ranges:
>+    maxItems: 1
>+
>+  '#gpio-cells':
>+    description:
>+      Specifies the pin number and flags, as defined in
>+      include/dt-bindings/gpio/gpio=2Eh
>+    const: 2
>+
>+  interrupt-controller: true
>+
>+  '#interrupt-cells':
>+    description:
>+      Specifies the pin number and flags, as defined in
>+      include/dt-bindings/interrupt-controller/irq=2Eh
>+    const: 2
>+
>+  interrupts:
>+    description:
>+      One interrupt per each of the 5 GPIO ports supported by the
>controller,
>+      sorted by port number ascending order=2E
>+    minItems: 5
>+    maxItems: 5
>+
>+patternProperties:
>+  '^=2E*$':
>+    if:
>+      type: object
>+    then:
>+      patternProperties:
>+        'pinmux$':
>+          type: object
>+          description:
>+            Pinctrl node's client devices specify pin muxes using
>subnodes,
>+            which in turn use the standard properties below=2E
>+          $ref: pinmux-node=2Eyaml#
>+
>+          properties:
>+            groups:
>+              description:
>+                List of gpio pin groups affected by the functions
>specified in
>+                this subnode=2E
>+              items:
>+                oneOf:
>+                  - enum: [lcd0_d18_mfp, rmii_crs_dv_mfp,
>rmii_txd0_mfp,
>+                      rmii_txd1_mfp, rmii_txen_mfp, rmii_rxen_mfp,
>+                      rmii_rxd1_mfp, rmii_rxd0_mfp, rmii_ref_clk_mfp,
>+                      i2s_d0_mfp, i2s_pcm1_mfp, i2s0_pcm0_mfp,
>i2s1_pcm0_mfp,
>+                      i2s_d1_mfp, ks_in2_mfp, ks_in1_mfp, ks_in0_mfp,
>+                      ks_in3_mfp, ks_out0_mfp, ks_out1_mfp,
>ks_out2_mfp,
>+                      lvds_o_pn_mfp, dsi_dn0_mfp, dsi_dp2_mfp,
>lcd0_d17_mfp,
>+                      dsi_dp3_mfp, dsi_dn3_mfp, dsi_dp0_mfp,
>lvds_ee_pn_mfp,
>+                      spi0_i2c_pcm_mfp, spi0_i2s_pcm_mfp,
>dsi_dnp1_cp_mfp,
>+                      lvds_e_pn_mfp, dsi_dn2_mfp, uart2_rtsb_mfp,
>+                      uart2_ctsb_mfp, uart3_rtsb_mfp, uart3_ctsb_mfp,
>+                      sd0_d0_mfp, sd0_d1_mfp, sd0_d2_d3_mfp,
>sd1_d0_d3_mfp,
>+                      sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_mfp,
>uart0_rx_mfp,
>+                      clko_25m_mfp, csi_cn_cp_mfp, sens0_ckout_mfp,
>+                      uart0_tx_mfp, i2c0_mfp, csi_dn_dp_mfp,
>sen0_pclk_mfp,
>+                      pcm1_in_mfp, pcm1_clk_mfp, pcm1_sync_mfp,
>pcm1_out_mfp,
>+                      dnand_data_wr_mfp, dnand_acle_ce0_mfp,
>nand_ceb2_mfp,
>+                      nand_ceb3_mfp]
>+              minItems: 1
>+              maxItems: 32
>+
>+            function:
>+              description:
>+                Specify the alternative function to be configured for
>the
>+                given gpio pin groups=2E
>+              enum: [nor, eth_rmii, eth_smii, spi0, spi1, spi2, spi3,
>sens0,
>+                sens1, uart0, uart1, uart2, uart3, uart4, uart5,
>uart6, i2s0,
>+                i2s1, pcm1, pcm0, ks, jtag, pwm0, pwm1, pwm2, pwm3,
>pwm4, pwm5,
>+                p0, sd0, sd1, sd2, i2c0, i2c1, i2c3, dsi, lvds, usb30,
>clko_25m,
>+                mipi_csi, nand, spdif, ts, lcd0]
>+
>+          required:
>+            - groups
>+            - function
>+
>+          additionalProperties: false
>+
>+        'pinconf$':
>+          type: object
>+          description:
>+            Pinctrl node's client devices specify pin configurations
>using
>+            subnodes, which in turn use the standard properties below=2E
>+          $ref: pincfg-node=2Eyaml#
>+
>+          properties:
>+            groups:
>+              description:
>+                List of gpio pin groups affected by the drive-strength
>property
>+                specified in this subnode=2E
>+              items:
>+                oneOf:
>+                  - enum: [sirq_drv, rmii_txd01_txen_drv,
>rmii_rxer_drv,
>+                      rmii_crs_drv, rmii_rxd10_drv, rmii_ref_clk_drv,
>+                      smi_mdc_mdio_drv, i2s_d0_drv, i2s_bclk0_drv,
>i2s3_drv,
>+                      i2s13_drv, pcm1_drv, ks_in_drv, ks_out_drv,
>lvds_all_drv,
>+                      lcd_dsi_drv, dsi_drv, sd0_d0_d3_drv,
>sd1_d0_d3_drv,
>+                      sd0_cmd_drv, sd0_clk_drv, sd1_cmd_drv,
>sd1_clk_drv,
>+                      spi0_all_drv, uart0_rx_drv, uart0_tx_drv,
>uart2_all_drv,
>+                      i2c0_all_drv, i2c12_all_drv, sens0_pclk_drv,
>+                      sens0_ckout_drv, uart3_all_drv]
>+              minItems: 1
>+              maxItems: 32
>+
>+            pins:
>+              description:
>+                List of gpio pins affected by the bias-pull-* and
>+                input-schmitt-* properties specified in this subnode=2E
>+              items:
>+                oneOf:
>+                  - enum: [dnand_dqs, dnand_dqsn, eth_txd0, eth_txd1,
>eth_txen,
>+                      eth_rxer, eth_crs_dv, eth_rxd1, eth_rxd0,
>eth_ref_clk,
>+                      eth_mdc, eth_mdio, sirq0, sirq1, sirq2, i2s_d0,
>i2s_bclk0,
>+                      i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1,
>i2s_lrclk1,
>+                      i2s_mclk1, ks_in0, ks_in1, ks_in2, ks_in3,
>ks_out0,
>+                      ks_out1, ks_out2, lvds_oep, lvds_oen, lvds_odp,
>lvds_odn,
>+                      lvds_ocp, lvds_ocn, lvds_obp, lvds_obn,
>lvds_oap,
>+                      lvds_oan, lvds_eep, lvds_een, lvds_edp,
>lvds_edn,
>+                      lvds_ecp, lvds_ecn, lvds_ebp, lvds_ebn,
>lvds_eap,
>+                      lvds_ean, lcd0_d18, lcd0_d17, dsi_dp3, dsi_dn3,
>dsi_dp1,
>+                      dsi_dn1, dsi_cp, dsi_cn, dsi_dp0, dsi_dn0,
>dsi_dp2,
>+                      dsi_dn2, sd0_d0, sd0_d1, sd0_d2, sd0_d3, sd1_d0,
>sd1_d1,
>+                      sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd,
>sd1_clk,
>+                      spi0_sclk, spi0_ss, spi0_miso, spi0_mosi,
>uart0_rx,
>+                      uart0_tx, i2c0_sclk, i2c0_sdata, sensor0_pclk,
>+                      sensor0_ckout, dnand_ale, dnand_cle, dnand_ceb0,
>+                      dnand_ceb1, dnand_ceb2, dnand_ceb3, uart2_rx,
>uart2_tx,
>+                      uart2_rtsb, uart2_ctsb, uart3_rx, uart3_tx,
>uart3_rtsb,
>+                      uart3_ctsb, pcm1_in, pcm1_clk, pcm1_sync,
>pcm1_out,
>+                      i2c1_sclk, i2c1_sdata, i2c2_sclk, i2c2_sdata,
>csi_dn0,
>+                      csi_dp0, csi_dn1, csi_dp1, csi_dn2, csi_dp2,
>csi_dn3,
>+                      csi_dp3, csi_cn, csi_cp, dnand_d0, dnand_d1,
>dnand_d2,
>+                      dnand_d3, dnand_d4, dnand_d5, dnand_d6,
>dnand_d7,
>+                      dnand_rb, dnand_rdb, dnand_rdbn, dnand_wrb,
>porb,
>+                      clko_25m, bsel, pkg0, pkg1, pkg2, pkg3]
>+              minItems: 1
>+              maxItems: 64
>+
>+            bias-pull-up: true
>+            bias-pull-down: true
>+
>+            drive-strength:
>+              description:
>+                Selects the drive strength for the specified pins, in
>mA=2E
>+              enum: [2, 4, 8, 12]
>+
>+            input-schmitt-enable: true
>+            input-schmitt-disable: true
>+
>+          additionalProperties: false
>+
>+required:
>+  - compatible
>+  - reg
>+  - clocks
>+  - gpio-controller
>+  - gpio-ranges
>+  - '#gpio-cells'
>+  - interrupt-controller
>+  - '#interrupt-cells'
>+  - interrupts
>+
>+additionalProperties: false
>+
>+examples:
>+  - |
>+    #include <dt-bindings/interrupt-controller/arm-gic=2Eh>
>+    pinctrl: pinctrl@b01b0000 {
>+        compatible =3D "actions,s500-pinctrl";
>+        reg =3D <0xe01b0000 0x1000>;
>+        clocks =3D <&cmu 20>;
>+        gpio-controller;
>+        gpio-ranges =3D <&pinctrl 0 0 132>;
>+        #gpio-cells =3D <2>;
>+        interrupt-controller;
>+        #interrupt-cells =3D <2>;
>+        interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
>+                     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
>+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
>+                     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
>+                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>+
>+        i2c0_default: i2c0_default {
>+            pinmux {
>+                groups =3D "i2c0_mfp";
>+                function =3D "i2c0";
>+            };
>+
>+            pinconf {
>+                pins =3D "i2c0_sclk", "i2c0_sdata";
>+                bias-pull-up;
>+            };
>+        };
>+    };
>+
>+=2E=2E=2E

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

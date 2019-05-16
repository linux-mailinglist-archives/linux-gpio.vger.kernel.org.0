Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E487620665
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 14:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfEPLxd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 07:53:33 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4741 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfEPLxd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 07:53:33 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd4f410000>; Thu, 16 May 2019 04:53:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 16 May 2019 04:53:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 16 May 2019 04:53:30 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 11:53:30 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 11:53:30 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 11:53:30 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdd4f370000>; Thu, 16 May 2019 04:53:29 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <pdeschrijver@nvidia.com>, <josephl@nvidia.com>,
        <smangipudi@nvidia.com>, <ldewangan@nvidia.com>,
        <vidyas@nvidia.com>, Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH V3 1/4] dt-binding: Tegra194 pinctrl support
Date:   Thu, 16 May 2019 17:23:11 +0530
Message-ID: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558007617; bh=c+YpXF05rlm4EMkpRgTcr8+uuVrXJmn3e/VNxp+q8K0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=hStxZEjuc3HtPn+RNYp/FlLmA5aiXzvfl40GFhxhJzH2OHKQojMk80M0YXyQX6Usv
         u+a+19XekCQjd5cX4VTgcmuKpIDznipvQJqdylc8hkfcsoME/15GEUGR/KmubpbjTI
         zkQPPNXPv1Hos2brOD0FAXOIWVTrHCbllb/KEtEIcb4lQDSdhGzIR/36QqE+UnGMmi
         sMELqBVaA7VZyFETvFDRLnuNcgy0xTrdQEd+VV/xUc5bhH2f0Hmi0/WF4dkPYZNmze
         TajUNNJ//gys0OacT21HxFT+Us7ksYFdYDl1omiRWCEMzDlztNYZXonncNfxbppOzE
         3TePwyw7UsssA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding doc for Tegra 194 pinctrl driver

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
Changes in V3:
remove optional fields not supported by pins published here

 .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
new file mode 100644
index 0000000..8763f44
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
@@ -0,0 +1,107 @@
+NVIDIA Tegra194 pinmux controller
+
+Required properties:
+- compatible: "nvidia,tegra194-pinmux"
+- reg: Should contain a list of base address and size pairs for:
+  - first entry: The APB_MISC_GP_*_PADCTRL registers (pad control)
+  - second entry: The PINMUX_AUX_* registers (pinmux)
+
+Please refer to pinctrl-bindings.txt in this directory for details of the
+common pinctrl bindings used by client devices, including the meaning of the
+phrase "pin configuration node".
+
+Tegra's pin configuration nodes act as a container for an arbitrary number of
+subnodes. Each of these subnodes represents some desired configuration for a
+pin, a group, or a list of pins or groups. This configuration can include the
+mux function to select on those pin(s)/group(s), and various pin configuration
+parameters, such as pull-up, tristate, drive strength, etc.
+
+See the TRM to determine which properties and values apply to each pin/group.
+Macro values for property values are defined in
+include/dt-binding/pinctrl/pinctrl-tegra.h.
+
+Required subnode-properties:
+- nvidia,pins : An array of strings. Each string contains the name of a pin or
+    group. Valid values for these names are listed below.
+
+Optional subnode-properties:
+- nvidia,function: A string containing the name of the function to mux to the
+    pin or group.
+- nvidia,pull: Integer, representing the pull-down/up to apply to the pin.
+    0: none, 1: down, 2: up.
+- nvidia,tristate: Integer.
+    0: drive, 1: tristate.
+- nvidia,enable-input: Integer. Enable the pin's input path.
+    enable :TEGRA_PIN_ENABLE and
+    disable or output only: TEGRA_PIN_DISABLE.
+- nvidia,open-drain: Integer.
+    enable: TEGRA_PIN_ENABLE.
+    disable: TEGRA_PIN_DISABLE.
+- nvidia,lock: Integer. Lock the pin configuration against further changes
+    until reset.
+    enable: TEGRA_PIN_ENABLE.
+    disable: TEGRA_PIN_DISABLE.
+- nvidia,io-hv: Integer. Select high-voltage receivers.
+    normal: TEGRA_PIN_DISABLE
+    high: TEGRA_PIN_ENABLE
+- nvidia,schmitt: Integer. Enables Schmitt Trigger on the input.
+    normal: TEGRA_PIN_DISABLE
+    high: TEGRA_PIN_ENABLE
+- nvidia,drive-type: Integer. Valid range 0...3.
+- nvidia,pull-down-strength: Integer. Controls drive strength. 0 is weakest.
+    The range of valid values depends on the pingroup. See "CAL_DRVDN" in the
+    Tegra TRM.
+- nvidia,pull-up-strength: Integer. Controls drive strength. 0 is weakest.
+    The range of valid values depends on the pingroup. See "CAL_DRVUP" in the
+    Tegra TRM.
+
+Valid values for pin and group names (nvidia,pin) are:
+
+    These correspond to Tegra PADCTL_* (pinmux) registers.
+
+  Mux groups:
+
+    These correspond to Tegra PADCTL_* (pinmux) registers. Any property
+    that exists in those registers may be set for the following pin names.
+
+    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
+
+  Drive groups:
+
+    These registers controls a single pin for which a mux group exists.
+    See the list above for the pin name to use when configuring the pinmux.
+
+    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
+
+Valid values for nvidia,functions are:
+
+    pe5
+
+Power Domain:
+    pex_l5_clkreq_n_pgg0 and pex_l5_rst_n_pgg1 are part of PCIE C5 power
+    partition. Client devices must enable this partition before accessing
+    these pins here.
+
+
+Example:
+
+		tegra_pinctrl: pinmux: pinmux@2430000 {
+			compatible = "nvidia,tegra194-pinmux";
+			reg = <0x2430000 0x17000
+			       0xc300000 0x4000>;
+
+			pinctrl-names = "pex_rst";
+			pinctrl-0 = <&pex_rst_c5_out_state>;
+
+			pex_rst_c5_out_state: pex_rst_c5_out {
+				pex_rst {
+					nvidia,pins = "pex_l5_rst_n_pgg1";
+					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
+					nvidia,tristate = <TEGRA_PIN_DISABLE>;
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				};
+			};
+		};
-- 
2.7.4


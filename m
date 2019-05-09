Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB111869F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 10:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfEIIOh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 04:14:37 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15130 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfEIIOh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 04:14:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd3e1730000>; Thu, 09 May 2019 01:14:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 May 2019 01:14:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 May 2019 01:14:35 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 May
 2019 08:14:34 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 May
 2019 08:14:23 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 9 May 2019 08:14:23 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd3e0230000>; Thu, 09 May 2019 01:09:09 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <pdeschrijver@nvidia.com>, <josephl@nvidia.com>,
        <smangipudi@nvidia.com>, <ldewangan@nvidia.com>,
        <vidyas@nvidia.com>, Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [Patch-V2 1/4] dt-binding: Tegra194 pinctrl support
Date:   Thu, 9 May 2019 13:38:13 +0530
Message-ID: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557389683; bh=sB+iNXK22PqlMOrwAHWKGUHwkQpr8r09L+/nsBMb4Sc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=GA0bAGEL/DAPS78zX5a367cWB8RdvvBw6tWe/9m6LlC9zib6Q24SBDrVMm93RYtIB
         BYe6kZ9ljbw/36gmgTRWe5R4g2gJKgRAXYmnYImmwsWRMrSBIFrhHE6X2H8Zvtsgbk
         oDsTmApIIT0rj5ZvR4bYXVtPyWf7/jldKzAJbRpOjmtju/oi+wNXidJe4ETA6YfxGw
         xhi2Lbu0JJFK4awN/Qk8VBDP8QyQa1FCoqhENDZNg03Kc/9ytl7wB15MUM1dBujcDY
         FHHb+GG/mBROKlF65R6khL9Ifz9vo/zy4JctqZLqoZDExh0+mzZxvJjHAlAL2kXVHb
         xYpmKmbu42gBw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding doc for Tegra 194 pinctrl driver

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
Changes in V2:
created new binding doc to handle Tegra194 pinctrl driver

 .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
new file mode 100644
index 0000000..80e36c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
@@ -0,0 +1,116 @@
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
+- nvidia,high-speed-mode: Integer. Enable high speed mode the pins.
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
+- nvidia,slew-rate-rising: Integer. Controls rising signal slew rate. 0 is
+    fastest. The range of valid values depends on the pingroup. See
+    "DRVDN_SLWR" in the Tegra TRM.
+- nvidia,slew-rate-falling: Integer. Controls falling signal slew rate. 0 is
+    fastest. The range of valid values depends on the pingroup. See
+    "DRVUP_SLWF" in the Tegra TRM.
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


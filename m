Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F20E48581
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 16:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbfFQOdm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 10:33:42 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:35982 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbfFQOdl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 10:33:41 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id RqZQ200023XaVaC06qZQyw; Mon, 17 Jun 2019 16:33:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcshH-0002Hv-01; Mon, 17 Jun 2019 16:33:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcshG-000190-V2; Mon, 17 Jun 2019 16:33:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     openbmc@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: Add missing newline at end of file
Date:   Mon, 17 Jun 2019 16:33:22 +0200
Message-Id: <20190617143322.4332-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

"git diff" says:

    \ No newline at end of file

after modifying the files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt      | 2 +-
 .../devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt     | 2 +-
 Documentation/devicetree/bindings/regulator/pv88060.txt         | 2 +-
 Documentation/devicetree/bindings/sound/cs42l73.txt             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
index 3538a214fff156d4..352f5e9c759bc3f5 100644
--- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
+++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
@@ -36,4 +36,4 @@ Example:
             kcs_chan = <2>;
             status = "disabled";
         };
-    };
\ No newline at end of file
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
index 83f4bbac94bb19db..a1264cc8660dcd59 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
@@ -213,4 +213,4 @@ pinctrl: pinctrl@f0800000 {
 		groups = "clkreq";
 		function = "clkreq";
 	};
-};
\ No newline at end of file
+};
diff --git a/Documentation/devicetree/bindings/regulator/pv88060.txt b/Documentation/devicetree/bindings/regulator/pv88060.txt
index 10a6dadc008eb38d..6a7c8a92fdb0bf1c 100644
--- a/Documentation/devicetree/bindings/regulator/pv88060.txt
+++ b/Documentation/devicetree/bindings/regulator/pv88060.txt
@@ -121,4 +121,4 @@ Example
 				regulator-max-microvolt = <5000000>;
 			};
 		};
-	};
\ No newline at end of file
+	};
diff --git a/Documentation/devicetree/bindings/sound/cs42l73.txt b/Documentation/devicetree/bindings/sound/cs42l73.txt
index 80ae910dbf6c3880..47b868b5ab011470 100644
--- a/Documentation/devicetree/bindings/sound/cs42l73.txt
+++ b/Documentation/devicetree/bindings/sound/cs42l73.txt
@@ -19,4 +19,4 @@ codec: cs42l73@4a {
 	reg = <0x4a>;
 	reset_gpio = <&gpio 10 0>;
 	chgfreq = <0x05>;
-};
\ No newline at end of file
+};
-- 
2.17.1


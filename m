Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2714538C110
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 09:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235367AbhEUHzm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 03:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbhEUHzl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 03:55:41 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440EAC06138E
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 00:54:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:18b5:4195:d4ed:57e1])
        by albert.telenet-ops.be with bizsmtp
        id 7KuD2500646MpxJ06KuDnv; Fri, 21 May 2021 09:54:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljzz2-007iyc-M8; Fri, 21 May 2021 09:54:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljzz2-00A3uu-8r; Fri, 21 May 2021 09:54:12 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: dts: imx: emcon-avari: Fix nxp,pca8574 #gpio-cells
Date:   Fri, 21 May 2021 09:54:07 +0200
Message-Id: <6cd916fc8c0a133cd216eee06cac86716b66eff4.1621583562.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621583562.git.geert+renesas@glider.be>
References: <cover.1621583562.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to the DT bindings, #gpio-cells must be two.

Fixes: 63e71fedc07c4ece ("ARM: dts: Add support for emtrion emCON-MX6 series")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi b/arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi
index 828cf3e39784afd6..c4e146f3341bb85d 100644
--- a/arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi
@@ -126,7 +126,7 @@ boardid: gpio@3a {
 		compatible = "nxp,pca8574";
 		reg = <0x3a>;
 		gpio-controller;
-		#gpio-cells = <1>;
+		#gpio-cells = <2>;
 	};
 };
 
-- 
2.25.1


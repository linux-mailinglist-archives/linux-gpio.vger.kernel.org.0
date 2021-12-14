Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3E5473ACA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Dec 2021 03:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244456AbhLNCgJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 21:36:09 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:20270 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244169AbhLNCgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 21:36:08 -0500
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Dec 2021 21:36:06 EST
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Tue, 14 Dec 2021
 10:21:03 +0800
From:   Qianggui Song <qianggui.song@amlogic.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Qianggui Song <qianggui.song@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: pinctrl: meson: Add compatible for S4
Date:   Tue, 14 Dec 2021 10:20:58 +0800
Message-ID: <20211214022100.14841-2-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214022100.14841-1-qianggui.song@amlogic.com>
References: <20211214022100.14841-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.8.19]
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add new compatible for Amlogic's Meson-S4 pin controller

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 0aff1f28495c..8146193bd8ac 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -16,6 +16,7 @@ Required properties for the root node:
 		      "amlogic,meson-g12a-periphs-pinctrl"
 		      "amlogic,meson-g12a-aobus-pinctrl"
 		      "amlogic,meson-a1-periphs-pinctrl"
+		      "amlogic,meson-s4-periphs-pinctrl"
  - reg: address and size of registers controlling irq functionality
 
 === GPIO sub-nodes ===
-- 
2.34.1


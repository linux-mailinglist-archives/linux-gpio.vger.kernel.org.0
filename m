Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19F038879
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 13:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbfFGLGQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 07:06:16 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:49584 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfFGLGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 07:06:16 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Mn6D2000c3XaVaC06n6EVC; Fri, 07 Jun 2019 13:06:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZChJ-00048l-SV; Fri, 07 Jun 2019 13:06:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZChJ-0003IN-QH; Fri, 07 Jun 2019 13:06:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <trivial@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] dt-bindings: pinctrl: pic32: Spelling s/configuraion/configuration/
Date:   Fri,  7 Jun 2019 13:06:12 +0200
Message-Id: <20190607110612.12625-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
index 29b72e303ebf938f..51efd2085113eb53 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
@@ -5,7 +5,7 @@ Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
 pin controller, GPIO, and interrupt bindings.
 
 PIC32 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configuraions of
+used for a specific device or function. This node represents configurations of
 pins, optional function, and optional mux related configuration.
 
 Required properties for pin controller node:
-- 
2.17.1


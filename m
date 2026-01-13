Return-Path: <linux-gpio+bounces-30491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ADAD19766
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 15:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B464F300B98F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 14:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8BA299922;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAj+OHye"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5E287265;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314589; cv=none; b=NnxUwLlupyAozLHtEY/ax/MFeWJPoTaVsXQZjfBRd1DeaYwwQiZ3ns8GdB2Q/sbq6cZ/U9YjjbLbKc4DYT3FZE2Ul5jf3Sz0r+l3zNecFTDTNRSyyhqCHDlWBBpqPbACNBY53JLCC74Fj9f+s5vxzagMSs4nhaS3mokBgaM271A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314589; c=relaxed/simple;
	bh=katoJtnGmhfI5/dQMVH816ZKjZm8QznW+SkAGqT2RmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiAPKnAPk4/okckCa2yAe1XdtbmSN4+/YUnaCBixTyTSJ3ANmGgnnAdVdASR3eofZ5pOF2AGJToZQ6abXfbI5CEstNfztRzadBG8zUmS2lpIc2qtpO/GE83YTb7QZVaHW1ua0W/mNMYxg3bIkTmz/azchlxLu3eStV0HvJFX3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAj+OHye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54D65C16AAE;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768314589;
	bh=katoJtnGmhfI5/dQMVH816ZKjZm8QznW+SkAGqT2RmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KAj+OHyeAt/VpcGtpdrlTgxOARxoywl8PqTggyoJatp/AwUkXZWxYojllx/RQxVpt
	 np/bsTyGhKY3LXtztYDoelt6EGQl+Ixrk7+fKRZ5Ttt+wYI0OsvpbsDjChhpN6OAbT
	 AlTYuez2kAHjasONjzLQcgote0ZtUWhC3F8PaerY2vIFFaejczzj+c5ydckufWojgd
	 z93zQV1vD/Q/I8i5ft+ppdXMY71rxGUXJkhLjKIWGYBgiYiGcR2MMq7AYzIZiCFOZu
	 OiY82mSdEyUfpX9se75Z/h7An37gq+zHqnJOx1Iy/+kjHHv/8pmBgjQCuP2kXf6eMm
	 fcq7CRr5fsP4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42503D2D111;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
From: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Date: Tue, 13 Jan 2026 15:29:48 +0100
Subject: [PATCH 2/2] dt-bindings: pinctrl: mcp23s08: Add multi-chip example
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-mcp23s17-multiple-addr-names-v1-2-f14b60f92c82@yoseli.org>
References: <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
In-Reply-To: <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768314588; l=2399;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=vD/F25SfezAejm8BqlJHgIvltMMe6SW7utp1RO4apSA=;
 b=SJyU0kBOEkWdKLZeURIaGnlMhZb8uEgNvqdqqHlrCYmi5t46OXmtGVKaVb9LN9FI+u+JNqk+6
 TZf3miIOMVEA80L/Sz2IqTGhGktBF9I2T/6ocwqY7IVDrSxb/+a5FlT
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-Endpoint-Received: by B4 Relay for
 jeanmichel.hautbois@yoseli.org/20240925 with auth_id=570
X-Original-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Reply-To: jeanmichel.hautbois@yoseli.org

From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Enable gpio-line-names property in the schema and add example showing
how to use it with multiple MCP23S08/17/18 chips sharing the same SPI
chip select. Names are assigned sequentially in hardware address order.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 .../bindings/pinctrl/microchip,mcp23s08.yaml       | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
index e07f4723de17..667be31b6da3 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
@@ -42,6 +42,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  gpio-line-names: true
+
   reset-gpios:
     description: GPIO specifier for active-low reset pin.
     maxItems: 1
@@ -159,3 +161,34 @@ examples:
             microchip,spi-present-mask = /bits/ 8 <0x01>;
         };
     };
+
+  - |
+    /* Multiple chips sharing same SPI CS with gpio-line-names */
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@0 {
+            compatible = "microchip,mcp23s17";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            spi-max-frequency = <10000000>;
+            /* Two chips at hardware addresses 0 and 1 */
+            microchip,spi-present-mask = /bits/ 8 <0x03>;
+            /*
+             * Names assigned sequentially in address order.
+             * First 16 names for chip at address 0 (GPA0-7, GPB0-7).
+             * Next 16 names for chip at address 1 (GPA0-7, GPB0-7).
+             */
+            gpio-line-names =
+                "EXP0_GPA0", "EXP0_GPA1", "EXP0_GPA2", "EXP0_GPA3",
+                "EXP0_GPA4", "EXP0_GPA5", "EXP0_GPA6", "EXP0_GPA7",
+                "EXP0_GPB0", "EXP0_GPB1", "EXP0_GPB2", "EXP0_GPB3",
+                "EXP0_GPB4", "EXP0_GPB5", "EXP0_GPB6", "EXP0_GPB7",
+                "EXP1_GPA0", "EXP1_GPA1", "EXP1_GPA2", "EXP1_GPA3",
+                "EXP1_GPA4", "EXP1_GPA5", "EXP1_GPA6", "EXP1_GPA7",
+                "EXP1_GPB0", "EXP1_GPB1", "EXP1_GPB2", "EXP1_GPB3",
+                "EXP1_GPB4", "EXP1_GPB5", "EXP1_GPB6", "EXP1_GPB7";
+        };
+    };

-- 
2.39.5




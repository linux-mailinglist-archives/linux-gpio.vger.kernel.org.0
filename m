Return-Path: <linux-gpio+bounces-30040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0285CEDC40
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 08:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 793CA3030D88
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 07:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCBC1C84D7;
	Fri,  2 Jan 2026 07:01:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298902D1F5E;
	Fri,  2 Jan 2026 07:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337280; cv=none; b=SSH0CKrQRB5eVzvHjlxll3kSMnvZ1GM22HcF9XNBR6JHbYkmNfTh/iBSTh2XpesKDrvuM1oIxlSEZkjmONdYja/0DkgxQrL/yuNgrNgoI5b/Bb1Inuelak7/cJubLKLeR28ly62vrrpqR/g7uaKxNZYWejIX+4SCNIaQTY0owbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337280; c=relaxed/simple;
	bh=CkrLUVXxpWysujkEFBNhXJWBIS5qj4KiudgLlB1FfKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ST6vycHFETXrFRmjnRS4XT2znXG9sKTXhGcPldNH99zt4OhIejFGWWbPIeoSBq/jAnpc3Y1uLn5uEeBQmP0U6HYQXx1yPX/ZVYGBfp3CBHntNI6+iUw7x87U/EPNo9iq7+CtVgdaMDNNUwfzugozmn92ZKYVYaxGj0MC3Pj6bbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C2BCA341EA2;
	Fri, 02 Jan 2026 07:01:14 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 02 Jan 2026 15:00:23 +0800
Subject: [PATCH v3 2/4] dt-bindings: pinctrl: spacemit: add K3 SoC support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=CkrLUVXxpWysujkEFBNhXJWBIS5qj4KiudgLlB1FfKs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpV20mEQe9Qt3KK1/XJlVuHSxuLm6AvIFghLmhd
 06pN3cgbRyJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVdtJhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0GwhAAka9VP676eVFbawkMbsAryQtqgduKkgr27PobGT1snFQLceg6Q1c9A
 4Q2J/25Buwr4plkGKBx2QLJEtLT+DqZToB2qB+JWhXFB/BaUf/XsmclCvadNsFjbDZvh8O5Zehr
 Aosz7dHGOvRBvxFmA4RiFYJP1n8KSEpCF65IzMt3jJGysTfBp6isezPBmQ6ukUWphIdeJw+cwA3
 6RGTnyFueM4F67Y8a36clpbiKSTSMUswbEqULpY1T0bgQc3mm2/pvH1CUNzPOeS+jnPc1YoxHZv
 evQH7jWwUhEBn8SgqR7tWHNethYPPRWwqG4v0gnHJCuaXhGWxjyhJjjogLH4kwRM1orU3A1L6rK
 kucuMGwZaaBiDlb15pLV3NWVOM08CXRkoBbysRYujG6f5C/BxI3+jUx1ygVizu5U4DwA136R+TZ
 4Emh7+oxCMDiIS6EMH853srL9D3sD6JNUe5ou1c61r8ckHLjgCMGGgqFTW8ju6SEdI8AMSNOG7G
 7eq+MbdgdIfLlYNv0JgIADTrdkcCJVt1+SadJzvMBIMmSIYWPyEwUPXQRCZQ3HDIIlIDUjbLXfj
 36eCDjZQdhp0dEHXDybAWTpHDcTvpCY1d2ACwcClcaOSO7YgP59XbhqQ6h4ypwyoek76aAdD08z
 4j5a5/4sIjzpPzWrGan3aq0sIqgo20=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
almost same logic with previous K1 generation, but has different register
offset and pin configuration, for example the drive strength and
schmitter trigger settings has been changed.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml       | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index 609d7db97822..9a76cffcbaee 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: spacemit,k1-pinctrl
+    enum:
+      - spacemit,k1-pinctrl
+      - spacemit,k3-pinctrl
 
   reg:
     items:
@@ -81,6 +83,12 @@ patternProperties:
               - enum: [ 7, 10, 13, 16, 19, 23, 26, 29 ]
                 description: For K1 SoC, 3.3V voltage output
 
+              - enum: [ 2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33 ]
+                description: For K3 SoC, 1.8V voltage output
+
+              - enum: [ 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 ]
+                description: For K3 SoC, 1.8V voltage output
+
           input-schmitt:
             description: |
               typical threshold for schmitt trigger.

-- 
2.52.0



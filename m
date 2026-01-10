Return-Path: <linux-gpio+bounces-30384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB22AD0D600
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 13:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B710301894F
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 12:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694A8343D6E;
	Sat, 10 Jan 2026 12:21:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B2D3191C2;
	Sat, 10 Jan 2026 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768047672; cv=none; b=TgpwrpkdzJElIRFFACifyRhp6LRjJj6aUAPrwbPaD4i9CIZEGbj6hmAOc4N+qhXERtX5OHD2KadWyvd3Eb3cajXVsUXp3WTrN5x+npyS8SoxeMHPiUW6WqbU2tNb7FATqH2WMfreaCMFLT9tiuRU2K8cvXCG54erFCu+f0YDakc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768047672; c=relaxed/simple;
	bh=QEkMOPUSiXrsltFd8l91d2pXVD0beckR7SwBr+HLR1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QZBzMuCyMScWpcytETRLJrJv4OjxLp0ithZBMlomWEGrCcryu5Qlv77ViBiqQFDCpd8GaNvTY/g2APKVI4dt97ae48l4lokK4Z0zWUzG7cjxpakYeuNs7ZEzJimfrv0sPtFC8BNhwGkjLHVPv+ZLm3zpkUaMs7Lc+8QyhN+P+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EE425340DF9;
	Sat, 10 Jan 2026 12:21:06 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 10 Jan 2026 20:20:59 +0800
Subject: [PATCH] dt-bindings: pinctrl: spacemit: k3: fix drive-strength doc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-pinctrl-io-doc-fix-v1-1-7872fe6efb80@gentoo.org>
X-B4-Tracking: v=1; b=H4sIACpEYmkC/x2MWwqAIBAAryL73YKPCOwq0YfoVkuhohFBdPekz
 xmYeaBSYaowigcKXVw5xQaqE+A3F1dCDo1BSz1IpSTuBjNHf5YDOWFIHhe+0Vkne0O6H5SF1uZ
 CTf/faX7fD9jFAMFnAAAA
X-Change-ID: 20260110-k3-pinctrl-io-doc-fix-a9a043e24619
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong@riscstar.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=QEkMOPUSiXrsltFd8l91d2pXVD0beckR7SwBr+HLR1o=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpYkQv6HD00Az30tkvVGPLJJDti8oa9SNNOlSg8
 cmLqPEiJl6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaWJELxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0nHA/+IOdwYROOiP/Swt1yt4Sa/fBACzM+GHOPsYxfPrBj3bie5dmkddB6W
 eZUddUssihaeNSUufi6hbgVMorGwT6R0fyWK/jWF4CaUVgPklT+7iloKdBlrLgfYtKo4iyD254g
 6bFIgWGy797OUVWdY+7K5cU41N31m5EiyvI5KKih6MfoHdDR0QcBuqwEiyTbtiqqlMzy6/5uSPT
 k69UuwT91pndJkzCSvogG7Zx8dbpbQcBv+2Td727uDEATINOf3Opd1WYo97yP7DBvM92Rh9kXpY
 smB0kkDBu5Ak+mRj7TELRxVMraejYe1hIVRJlUoD6Hmfsp/FN+qhCdDEQLGYC0iDtQ3X4/upuW4
 MVBX0iwW7ZkPxtFnNY6gq4DKHx+PH53IxtdpR+Q3y86Bg8b2dFycoQU7okzbjO2JMp+zy8EL+96
 cbem+WlGea8Slbq5rY5qtBs9e+QGSFiuDZ8uIikDkvbH4nInQ1MjP29Xf2p7BdE5HdMXVS/EFu3
 gaxAB+blEJYU961cg8WjyVm4k2Ymc6nZRbqu+OaGJFjnPRW+yGywQcBXGKXa4qBZJY6gbtvDn7o
 eQC2Ys9blqcwlYqytkqVSp+HJlFjqVrWXAO4YCb/VH60OpWpVgOH10oT6IYh/RhjggXiLHEhIdL
 oAAYqJ202DDpxmidheg0GAOHdWsjOo=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Fix a typo in the documentation, it should be the 3.3V drive strength table.

Fixes: 5adaa1a8c088 ("dt-bindings: pinctrl: spacemit: add K3 SoC support")
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Hi Linus,
  Can you also queue this for-next? thanks
---
 Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index 9a76cffcbaee..f009fed87e6b 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -87,7 +87,7 @@ patternProperties:
                 description: For K3 SoC, 1.8V voltage output
 
               - enum: [ 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 ]
-                description: For K3 SoC, 1.8V voltage output
+                description: For K3 SoC, 3.3V voltage output
 
           input-schmitt:
             description: |

---
base-commit: 3f20bdf7151834547a85231c28538f49601481ee
change-id: 20260110-k3-pinctrl-io-doc-fix-a9a043e24619

Best regards,
-- 
Yixun Lan



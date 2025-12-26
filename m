Return-Path: <linux-gpio+bounces-29906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50BCDEB5A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 13:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F85A301619E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32A5320CBC;
	Fri, 26 Dec 2025 12:58:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A231C597;
	Fri, 26 Dec 2025 12:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766753935; cv=none; b=ciWGfh5Sd9L2AW/u+ap2dIvFRCLp017wR0AYwvZd9PwBMoq6ndKO1S31OtjufkhiD/CmO5kfG3x6lWf/Ezyfu79hcI/wGKqR6Vxo8MeIifv4cYVtyyCFaJba5dUINQ/5INh4VtEW3DySOz0ar710VMYqX5c/XBPKWkkSVa8Y+TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766753935; c=relaxed/simple;
	bh=SutOUYsKHnB32xSj1pZ5Xcaf2Z88gPgTQ32lxI4PKBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jg5QzP0fEZTSRupJTp9tqxq+O4zfmUY9y2oB7wXR4z1kYx22jM9rZCxrMrA3RdEufUsD9EyiUY9+yhBWZ+zXhXtPI9ivHlYpsmLNThJiNvM5HZoLJK8yK0v4xn1JDy4+MoVy8oRv8bvk9sWw4y7qRVqSwoOlKi0gVBifNGvnUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0764A3415F1;
	Fri, 26 Dec 2025 12:58:47 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 26 Dec 2025 20:58:24 +0800
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-02-k3-pinctrl-v2-1-5172397e6831@gentoo.org>
References: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
In-Reply-To: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=SutOUYsKHnB32xSj1pZ5Xcaf2Z88gPgTQ32lxI4PKBU=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpToZ5whC2XNQ/3Z3VOI/IZvPTC5NovxvPin3gp
 WobKUNbOX+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU6GeRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2byA/+IrrABW5FF4g8zsEFUxQNxwuN3ET8VTxa0iyVa17eEFumYfGgOjAKD
 4eh1p+mtngZBWOtDiYo8T/8qTaietVmKfz/Ak7/RJwRwVonwb5B0K1HEgxDxURpAvJ3vTwA2fPo
 XHdUQ63nRHOaHzxODos7OAMWWsQEcye+1ccFvc7nHaGWA5vzbIdSKYnKsd4kTNm2ppBSvlcXwwL
 N+okN/B6qR5Ry7arV5hLHRb/lLghd3QaZ8Q43kA8PjjqziiD0GmZzfMm+2KPd1EBzqiYkvuWKEL
 8TWVNquC7vIKr0l1r/sDByUtDExz1dXfaK2A9nkD3hkFsLTrJy+o9yJorAvNu6Rdbtt7QlKZyyI
 v1IF1q/anWFMnnB49RfafeU4davhPx+3VdQLaMA8M0UfzJ9nxtwRe1VQqXlR4HoyjOI9Dg8sQPD
 7587C/t0bxSi2OH8BqzYBBzfIvmKP4vJcIlb8A3EXl31rMdnQGgvm4K06n0cA/VsrMgZE61kcF+
 j0DUOHN6T99YMCgMSHiXZ/UCePCn5jOyH/h/eFQM/pPRrpSv5TK28D/6uNQ8PvSk1pzNX9gA2OF
 XsQvnopet1I3L2ScF/b4/TxZTFnMyjJ53AzhoEeVNjyo13QAP/To7LjeNp1UvM4AC58AMhklezY
 NyT5c78grhijooVBvzh9i/gDwlkqig=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
almost same logic with previous K1 generation, but has different register
offset and pin configuration, for example the drive strength and
schmitter trigger settings has been changed.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml     | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index d80e88aa07b4..d2cb994e30c1 100644
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
@@ -74,8 +76,12 @@ patternProperties:
           drive-strength:
             description: |
               typical current when output high level.
-              1.8V output: 11, 21, 32, 42 (mA)
-              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
+              For K1 SoC, the settings show as below:
+                1.8V output: 11, 21, 32, 42 (mA)
+                3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
+              For K3 SoC, the settings show as below:
+                1.8V output: 2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33 (mA)
+                3.3V output: 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 (mA)
 
           input-schmitt:
             description: |

-- 
2.52.0



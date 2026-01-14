Return-Path: <linux-gpio+bounces-30510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D80D1BCA1
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 01:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7DFA3025F81
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 00:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9D31C3BEB;
	Wed, 14 Jan 2026 00:17:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EFE3B2BA;
	Wed, 14 Jan 2026 00:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768349879; cv=none; b=hg7m6ZzaQm0+YuajUEa+hjKeetQeOQhth5BaMMTjyFrvmRyK14ulC75x5ucMTx7YGaeSFjeH6dsqlyi16DPQP5QsVpQOiKrSIkEAq1p1tZx8rdBi9rmEvO/scXg5szeKCP0k+G389FDAdtMruIx7PZBK42oIrP+bF7mVHjlUHfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768349879; c=relaxed/simple;
	bh=orpaLPZIhB6o0YIirbSoKahJaSFWRpyVsDsGAJa9c/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f6wGa9ygOqw0hBSMR7Qhi3/pPuU/DQLxC42sQK2uNKnU49RIKJgdRcPx2LwC23uTBYDedpjtB6anr1jtUKy9hcEZwInmJK5brDv7LSfjIX6EtBnPO+xygUAfQIK8gaQyQYY5te5pFcgxpvMDKs9GiR7iWJM7KMVfK9IiWYfH3ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AAA5034102F;
	Wed, 14 Jan 2026 00:17:52 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 14 Jan 2026 08:17:42 +0800
Subject: [PATCH v2] dt-bindings: pinctrl: spacemit: k3: fix drive-strength
 doc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-k3-pinctrl-io-doc-fix-v2-1-025b05f9e65a@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAKbgZmkC/4WNTQqDMBBGryKz7pQkij9deY/iwsZJHFoykoi0i
 Hdv6gW6fA++9+2QKDIluBU7RNo4sYQM5lKAncfgCXnKDEaZWmmt8FniwsGu8YUsOIlFx28cu1F
 VJZmq1h3k7RIp67N7HzLPnFaJn/Nm0z/7r7hp1Ni0jXFUk3u0qvcUVpGrRA/DcRxfabMNz7sAA
 AA=
X-Change-ID: 20260110-k3-pinctrl-io-doc-fix-a9a043e24619
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong@riscstar.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=orpaLPZIhB6o0YIirbSoKahJaSFWRpyVsDsGAJa9c/s=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpZuCtbNOFt9HYFmHL9qwVSgNlpjEqetUNg9x3H
 gGAVmMeiriJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaWbgrRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1uyw//T+tPDn0Hytjj/Xe+0H0zwyDbgdSccSl8FQSBfkZsQu6mX7h/MHcdx
 km4joFbr/IyCqdfXGJRuYZS0Ex4mUeCap/PM3x40sYp11cfdOmlElypq1s25wFKOUXyP2We1HQn
 VLzNbXwC1s4pki0lrtwqCHhRYdJGyqJsi6C1F5nVN2N5hYdQ7jc4TJMFm6EE4vqVz31F31MXea1
 jg1tZfp1qXqoZTjVljGXveEderwTvf9fB8JdNg0f/UF7C1FNDB0HD0RMImso8LTBmdWqvmLAr70
 fOhD4qMO4rjmphaGIUK+Zi1Xl+1TpPhTHgJlZFqL5nGQ+bExlhbFK7jcyAEXRoxbDefFBvknyfr
 /3QY4h+eHkCkyrjldWkQ+4F5Fpqmq8qkhi+5HIGQ5bMiTb3//3rivdoPnlQrX41hdQjoisN3gpK
 pXaiOXQRPABTaR3mOlu98bLac/fw6Y4hZRfFZ2y/Ws95i9yRCQhFCvmf78mWe8ynf6QXauxWkep
 CBTBmKueOubvgEqOieoepK5zf5OU3qRhyF1U5Aa5Z3VZtwEvjbU4LlYal87caZ+rUdcCvbfDW+V
 T1TnMpp9Ei32EqyVdkEiu5PsTFfwR8i2I+v+7r7E9dk27qzZDGRqpf6sezZvnBex32iRSeQA0EP
 QJ0yuJF7sVN5zNZQBlrve5SJmkZdYU=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Fix a typo in DT documentation, it should describe the 3.3V drive strength
table of SpacemiT k3 SoC.

Fixes: 5adaa1a8c088 ("dt-bindings: pinctrl: spacemit: add K3 SoC support")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Hi Linus,
  Can you also queue this for-next? thanks
---
Changes in v2:
- fix >75 lines of commit message
- collect Ack tags
- Link to v1: https://lore.kernel.org/r/20260110-k3-pinctrl-io-doc-fix-v1-1-7872fe6efb80@gentoo.org
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
Yixun Lan <dlan@gentoo.org>



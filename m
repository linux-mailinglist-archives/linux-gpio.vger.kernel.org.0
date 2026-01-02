Return-Path: <linux-gpio+bounces-30039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 826A5CEDC10
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 08:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9A8D300B801
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 07:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36302D2384;
	Fri,  2 Jan 2026 07:01:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EB42D0C97;
	Fri,  2 Jan 2026 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337275; cv=none; b=K0122LCN8hiQ9AqOo4W7QUconBCThyo2RUqi8lqcHJeKoPpbHxpELW+n626RCNQsoN+9ujVlBnBsUAQ6QQo0ZjCyowTlbJ6AqyAMkBbpq/gAq4i2CJSNghro16sv+hCLfUZqoQ6UdE4E0o+0baJ23Q6GlXl9WYgAxcDqR/dsxAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337275; c=relaxed/simple;
	bh=w4+TikoZ5t0f91gGepLrdqB1S7dJ+SqAQScF36N4zZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoUn/n7URvnpSQRZm0VGUZjze6HAECFPqK1K+aZqAAcmmJR2MzjwK8F980dX6Rs4QiA0G5zptXKSnVCwVO8/6qTrAcW6e7nObiokWjvm6vMSjqW2Qq/TAEb8sifv9ZFobVCoKCx3fwkkLjaAhj/3pP/txV/ULsHuee+D/Idp3nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3B2DD341EA1;
	Fri, 02 Jan 2026 07:01:08 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 02 Jan 2026 15:00:22 +0800
Subject: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: convert drive
 strength to schema format
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-02-k3-pinctrl-v3-1-30aa104e2847@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=w4+TikoZ5t0f91gGepLrdqB1S7dJ+SqAQScF36N4zZ8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpV20i/9eyy5Fsg6kEF2a/ddQjDdHvB4zp+J7PR
 XKa+RBFgViJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVdtIhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1v2g//ZuuVsJvH6dHkmVgAww27piFw2j/bycWWBmLIw/Gis/wCSR1dTYyXd
 hm4XxGWDxENRpDMKhxaUfW9qSHCfsgrvA412yxQ/trauD5Cd2FFyG17o8tXtOSxVTxcOQEd8jUy
 vQEcDmj7+hrQdBD3V3pX1OBIgJMrYXcA1fl/c0f8dBRQjOVsyKmheUc5Fnmqghds159bH3JFEfp
 g4FVBU7UDGc+ZNKyjNrOA+KBt6f+Xk0avc5OwzEPmPqbGu63udDZlMkbhTydVYNeV6WQhfiwhJx
 fhvHAav3cCNNU4lH3SFmTmFelW5QGmT1mn9EvERCjlXscCe4SBXP9h1TwWbfO83HePLjuU4X41P
 6cMofsKNRy0FlQO3u1RLXONThsbHT4dbUwZr0Rhbvj89URid3RtTZLaFAXDZ1axH0hezxwnFkpj
 I+Z8rAA0PCwAXn0nM6DxrAuvjg6yad366AqSnnh02uPAMWjsfFWWOobu+xjhIoXzeZmB+J+b5eh
 yRJm6z0zTk5mBAbZvSYfn8bLLrkZHQxhgTG6TRAyNSWVI83hdWFzOripLsI7YS4wb6zSL6KcT+y
 xvOs/qy5DXsqsZH4KCW2knzlkpHs2cdYaMWg+ipWEKe9PF4arkaUB19IDzl0Fb+HX2SigLC9gBO
 Q+IqbU+KhL+0GLfdsekP5RwIHN/c/A=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

In order to better extend the pinctrl support for future new SoC, convert
drive strength setting from free form text to more standard schema format.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml     | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index d80e88aa07b4..609d7db97822 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -72,10 +72,14 @@ patternProperties:
             enum: [ 0, 1 ]
 
           drive-strength:
-            description: |
-              typical current when output high level.
-              1.8V output: 11, 21, 32, 42 (mA)
-              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
+            description:
+              typical current (in mA) when the output at high level.
+            oneOf:
+              - enum: [ 11, 21, 32, 42 ]
+                description: For K1 SoC, 1.8V voltage output
+
+              - enum: [ 7, 10, 13, 16, 19, 23, 26, 29 ]
+                description: For K1 SoC, 3.3V voltage output
 
           input-schmitt:
             description: |

-- 
2.52.0



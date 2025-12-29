Return-Path: <linux-gpio+bounces-29979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD8CE6C65
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 13:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 633C63002A41
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 12:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1BB313554;
	Mon, 29 Dec 2025 12:47:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5A031327E;
	Mon, 29 Dec 2025 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012446; cv=none; b=rTaImbkygea3LOoWmXxR9/kRvN4UOf430z2M8pJ5D1Kk31H744GSSMnQATwXV6wKRZtY0KO1V0NLOpeeVKoSEDcxSSbD8Ph8WfS02IXsRIk4GsVU3nCS3o77CkbhdUVkthhya08KgGTIWDd3Cqa2QjuAUBmycXJzwqkT01LYsjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012446; c=relaxed/simple;
	bh=3Gk6q/GnszEdN5C4ic9teAA1/nlkqjFF8harrMGyQTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eG7rn22JdqUYXXUkaLbdXzDFM0biH5xXP6i12P3Tf28ajLdpM7AkUc3bCxt5y+t85nw9NRtdpFcYJCrcFxB+vAiB7ofv+fWQrHDoDEaz4Y8lcHJdy6b/n5nYTZNmp4TOYaQhLu8lYcH4fSs9AgslT+El4Php7UkP5WGjE1hHPs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 12006340E2A;
	Mon, 29 Dec 2025 12:47:19 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 29 Dec 2025 20:46:38 +0800
Subject: [PATCH 1/2] dt-bindings: gpio: spacemit: add compatible name for
 K3 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-02-k3-gpio-v1-1-269e76785abb@gentoo.org>
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
In-Reply-To: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=780; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=3Gk6q/GnszEdN5C4ic9teAA1/nlkqjFF8harrMGyQTg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpUnhMjHomYPwXglxIczDQWC8aDotR/ybUJNN4w
 I38SmUU7WCJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVJ4TBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0iJA/7BTCBPNPm1sPBLl0v4cH2cc0djOiTaVFPUxBfpebvvPrvQvRski0vN
 i4R1m3b0AWXJGcsJmrQ5Xkf0ELpFkJOs4/GbAJHUyIvDcaxgNo9Wy35oKQpSxsVAi1lfpFoCUtt
 pSW9Q1nh1QcawWLNs/dQ9rSYcSbs8NjcbvCcFppdZwq2E8QmgiLlw881h6iaScYd2w71EjjChS6
 w0i1m4xmz8GxdwZ2frb0/3qkwLI591DHdsUz57SBwJPimp5x14e9vCz8SZDLOPcu0lKmDQUe8UX
 BYpiIJRnYkd13pzTf4WJ0zBiTZF/4HkhI4sGpZEx6lv9Yb7Xh+6ITFGqIKfQPHHB0MvYsrzDRXk
 uFVKXRTdvLVU5xmSZUAb1ySW/ak8eQKvgHON1tzuiJaTDYOGEiYWNeRIYFWS3jf0zDGboUt4xax
 fZi9VheGSbY83oF+oNGkzlCq8DXDbRzW83nnC3fu+k/3zvZtJsnOkS4gbz5hbP3iWZsTuT/8eYn
 faJ+tDLwLxwc570LMQnVwArnlHc7rYrb4UI9JPGGgXaD+S/lsbCX0FbEkofhELdCx+9TSVw38Do
 8Exc3pcS0L09CXWR5ZqDYpC/XEruIBvuvF0K/a40lMhsvKp91AEgZvekFzT+tTbn3kAMZZG4aZA
 AIImMbRw81dx50gE5XmEZdZDN1tgII=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add new compatible string for SpacemiT K3 SoC's GPIO controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
index 83e0b2d14c9f..24d22d95665f 100644
--- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -19,7 +19,9 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    const: spacemit,k1-gpio
+    enum:
+      - spacemit,k1-gpio
+      - spacemit,k3-gpio
 
   reg:
     maxItems: 1

-- 
2.52.0



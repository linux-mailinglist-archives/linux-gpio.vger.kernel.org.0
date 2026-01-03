Return-Path: <linux-gpio+bounces-30096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F98CF0678
	for <lists+linux-gpio@lfdr.de>; Sat, 03 Jan 2026 22:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D35F13026AAA
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jan 2026 21:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EB02C0268;
	Sat,  3 Jan 2026 21:34:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26C73A1E94;
	Sat,  3 Jan 2026 21:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767476043; cv=none; b=Fxbz9m8yCAPi8TJi3nN+iZCkWgSvViRZEYvggvg9MG9fHj2taYOYle0pmGj43dudY658k4mjm+49ALcd/PfwRW6JyL2KHH5I0UFWQqztUENQesaCAWvnK/2FGYmqdgOOa6mUGxPTr+Yx8HKG1Yj7bokNW/KHGxnW5amDeZ4M0QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767476043; c=relaxed/simple;
	bh=dQLEa7ecvgpS7Ee7d4NqYI+6qr0ttpGStWj+q/XjdRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujt3jdU7bskvC740rbdq5D5WCOpO1dbMTYZQ8vntKl3bcsfbvVJ6tEL39nj9p3eMsgpbXV0QdhqVHO7zUOdu+ZYCixzRISkR6hXPx5IZFrvwS6jIM7Ru/lo6XQqtKxiGwt91BQBMN9rPrrF5z9x0l3/f/o0C90Sv+bdwCKrZe+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 17127340E73;
	Sat, 03 Jan 2026 21:33:57 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 04 Jan 2026 05:33:38 +0800
Subject: [PATCH v2 1/2] dt-bindings: gpio: spacemit: add compatible name
 for K3 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260104-02-k3-gpio-v2-1-07377739581a@gentoo.org>
References: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
In-Reply-To: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=dQLEa7ecvgpS7Ee7d4NqYI+6qr0ttpGStWj+q/XjdRI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWYs7OKJxQ+GLwdCalTvgO2NvxHDJZvgzeO6Ai
 2otDtDkAZmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVmLOxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0qpg/+NA9oNETUwVZLqCxAW2GcZ4luKHnasG3wtplZKLO20nm+v+n55avq4
 4m7BG84VOCkVNI1ZxtbIv0uvAUoKNJQGhemcMQxZIne4CSvAC1JQxKzTY4nN80z7eQzUD6KTXuc
 9M8tn3wF0FZmzcQJNBqzowWORlk/x3qGpKJk2AOJl62ZcMJp+Gctj7hIvfTeqS3oWdOr9ADrrVe
 SH/5JMxBn14hRnQIMtXf10Cqtks210L8oFxLT5ejryoVEvY1RHdFJzcXCtRkT8nrwFPtmDRwooy
 36C5YVO8GQYmPcz586Rn99Iwj+Rd6F/MgkyNfyiyRDKuItDSTSq7PoGd0lsoXg2iTzFVpgCeGIX
 aQzlbENYs5QMf+8NkafHTLWQFsOkK237zYFNHeltq81GOqiwCypbpV8pfzE8Kn52Jp0z6OfwrQr
 mN+mLkM2zSZBn2oGU1R9K2gpzTFjFpUvrzQ8qyP9N+eugx9mfAFjqKlAhJTP2LPN/FI42Znh0a1
 6Xkk3/fp2TXLjNF/g/ZcTa5lcjAaQmEZs6aMWc0NQLST1AAD+/WcGhidYKnL7b2JOQ/36N9lZs+
 bjO+QWxwTC6eHIR3+SakdIhjhtq9yvWMCgdc0MkRnEXTqJhty3fJY7fQ4y5biSUys4Xq2aSa0EN
 HoDoMYtTAq5s2pNeA4sc8GaC5klB+c=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add new compatible string for SpacemiT K3 SoC's GPIO controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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



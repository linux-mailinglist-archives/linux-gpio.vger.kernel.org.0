Return-Path: <linux-gpio+bounces-29777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5ECCD2D1A
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 11:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67B64300C521
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 10:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E3E3090F5;
	Sat, 20 Dec 2025 10:15:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38199307494;
	Sat, 20 Dec 2025 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766225741; cv=none; b=dm5Vw1wONJTJ6PXVODBE7S7zwrQ7K2AHmnq93BV6dz3nFVpmqW8/eOhY+kfJ4zrxWAWfy+Q4xQe7ng0L68Bq/5tnGxR1MeWuOWAcsWqF4r6uIKss62L1yXoQZJrIgcLuAujfCUtlThY70HHGZ5nbaBl9MH80irH0alF4KunEenk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766225741; c=relaxed/simple;
	bh=GWiPPTqo39BTFGNzQ0XUDmlNacTF8yHfn5Ywnij6LGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHsIhVrG+XvU9W76TTfg+BhZeO9Q5oSnjPEg/NE5RM0REB3OxeJ580eLAHYq/jUKt24NPCkgFF8tY1IbfVX2Xed8mgQI6VwCmrHicg/U0xD/Y5UwmBdrdvDkzIEvVoeEAP1lH9/Syac2yfMou+hArzgmfqGwPgLAgve66yU/km0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DA0DA340E92;
	Sat, 20 Dec 2025 10:15:35 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 20 Dec 2025 18:14:53 +0800
Subject: [PATCH RFC 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
In-Reply-To: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=986; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=GWiPPTqo39BTFGNzQ0XUDmlNacTF8yHfn5Ywnij6LGA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRnc4IsqSpKa8rIBplRoSkYMD41jQazKD9MjBy
 wSgD6dwQuqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUZ3OBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1zSA//VYPBskgcUfCvoQOif0mr0il/zFJOUaoqH9l1i4BXvGmkN62pgODi4
 7hOqDMBZGz9WvJEEZATBPjYNBsa5RhlrTvflE2wiwO8qBE+4THj94FA+fIgTI4yaMmTRHvqkIg5
 3ulMLTPkBUMek8Jn1JViL+cPczREaLrwnhPK0hMFcsAEkYzSD9CRq5F6dbsDDq5oJJiRJJIVtEC
 Dp9OduwZR/YP+gX7TZDD4mHRsaFx25kFNNmuC8zNjt5oSenO8wzNuVyAm7yFNgmAq6PmNTss0SR
 +T3si5te1j74h5CIZh5j/x+ZuaFpHurkB5XY7YCSfnBrkO7NsiT/mMsbTJVyVi65zzIh+hyZNoi
 6HaN3CynaMUOOOwDvBA+/I3Rjayj8lI67Tdnm7HJ+mNpQGOtvoPHzcRlE070eiJCrA5hIz4qw2/
 UE8dNuP7fCTifdxutN2vVKFDby32X0hGi9JTgCB4ygnhhrZ8jsgwx4+QExJ/ddyiP+/39f6mKx7
 H967/yBoRvsRfC1gC3KspEw7d7jKLGHSZhc0QnToGVREvQiW+8kNKHt7QEZ6XgCpgOJibzhV6sh
 n1hi6FnWHOaKgzPU3abaPKSb1xKecIZouwQwKwp3YzvWp3vGzMx8flJrHxRGUL8FIzOm6Y9aQB0
 6RAN6G0NEll2dVXpdEiq9TNAPi9PKU=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
almost same logic with previous K1 generation, but has different register
offset and pin configuration, for example the drive strength and
schmitter trigger settings has been changed.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index d80e88aa07b4..c5b0218ad625 100644
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

-- 
2.52.0



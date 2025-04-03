Return-Path: <linux-gpio+bounces-18192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7515A79E3A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 10:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96D1174ADA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 08:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836E523F404;
	Thu,  3 Apr 2025 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqP437Ge"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381DC5D8F0;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669200; cv=none; b=lwfHb8TTxP9nqP51dmzxZnMNJMIGT8X8c8TBQibN9Pfj1smbG/l2ZwzG6WK0u8vp10/PW2HvoYkcU58khuGwaeaV+32p6wfcATVvJxmwVmu6a320Z91KR8WMTE0VWBJGYbVUFUvVXP51ygczubFobrBClaSM5aaIZLdZj9rcBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669200; c=relaxed/simple;
	bh=8/FN1zqyHe1w6YEiI4W7vdYpA+b+1N7dG+zmuQASP1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxY7e/KYNtJe5KGSq+jcduYUVz3pi1uIepmWEqhwFwB9wUeWymRiEBcj0qLFBBHT097sgnHN1srGxA/0QinCDlBCI8EEXTPVaoVlybrFgAtEWZGcLttebHiRWI+7llCdkYff+fW9sGZffsU72RL1/UgDJEKG4I2qW4qcJhwmjTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqP437Ge; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1C6AC4CEE8;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743669199;
	bh=8/FN1zqyHe1w6YEiI4W7vdYpA+b+1N7dG+zmuQASP1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kqP437Gelc3cAzRDInSrIIfnOLSrjIMy3cL0ZCF3i3he9Tmtt0iNxvMsVCqmWYzWe
	 TDS1GtGByFfCgsXD8TYaV4850qhxXCtkC354RTYYsmRc8HaiyIhcpIv6xEnell6gKn
	 csOLJwDLu+h5NZIL1uskUvQx0Akrv/ZFKmShmbpN7vVWcmGinZvBdMx0sAhxNoYJmD
	 a1woOzMEAZwZCtxr2uzyaeIuLCB+jtOPvCQ2m1cv/EbiG5SDOgtRx6NX0x0PuiFBcc
	 2gXkXXDF5DwIdY0VEgUMmEq6DNP5P2iUWFXH0QS05h84pmF7GeoRQR8VYFkwHfqBEp
	 t+4EMwIHM1zSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0432C3601E;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 03 Apr 2025 16:33:14 +0800
Subject: [PATCH v3 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
In-Reply-To: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743669198; l=1062;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=BWo0VhjwdkuWVuu93AEWJoUlmI8svtytfB8s9yS/fWs=;
 b=Y8iZKQNrlQXT7t3bfaAv792FEp3deYm8sjOkAjlKZFKSWkoCOfS/em4OtxlGve4hrA4NkVjzK
 qk8ECFovX8dBtiWuBI1RUFKU5gekhm+5gaSJcJ2vLkNXo30awxePjF8
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
no need for an extra compatible line in the driver, but add A5
compatible line for documentation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8eb50cad61d5..c36b6fe377ad 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,pinctrl-a4
+    oneOf:
+      - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-a5
+          - const: amlogic,pinctrl-a4
 
   "#address-cells":
     const: 2

-- 
2.37.1




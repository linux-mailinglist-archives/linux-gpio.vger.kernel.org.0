Return-Path: <linux-gpio+bounces-20115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB897AB639F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 09:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62FDF188D47E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 07:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E61A20766C;
	Wed, 14 May 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otJpfrzN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7B32036F3;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206102; cv=none; b=mxvQLAP4BpBVXgE9svRyOkEiabkFtQ4XEiDnC9oGn4R3UvAbHIczt3Cm9ltEb2g07fzY2Kzu6X9AfvUSCP43gHCTA9W91ZD/W9EyIemYigNx4d74vsAli+C7ERGh8YEzSaP+5EUWTW6o+9SwAfkGdtu3VD+qIxANLhbeiL1HMZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206102; c=relaxed/simple;
	bh=byLh/bsiv/fh1hzyDOXgi4uR68X6jhJgLI5muBJNEqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgCaIxIJ3776X6u8548WMtO7O8+CWoOSP3Q2Av6S5OJxdFtVcKKKsrZDNfumQ8TPUwQNO7xbNgeoAwCyq/NIMkYE9ciTG1rnubSC5WNTwtghYrObqddXMhFXYsMCVcGvKW7yh47gNF10gnpZj49HeQAGuXAoR7isG+zZDoPmab0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otJpfrzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30A6BC4CEE9;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206102;
	bh=byLh/bsiv/fh1hzyDOXgi4uR68X6jhJgLI5muBJNEqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=otJpfrzN4sAQT2ytf8z6fW020uvqNP9h04UWaVVjgtgbv9mpVLikBN0rkvCwN318c
	 Z0BL9wASYF5r9hPCB2l9JRn3b8WjWgXeYfWk9ZNPcHn8UDlxmFB2QZSq8dy6KDaX1p
	 VxRoUXxw2qfXKA9R805Oc3BaieU+RLhqZ3hzDF6xdqhkLhIGb58Ux66Yry92kOTRhq
	 mFyLv48vlCjqkODrxFM8r29SFKNp7bVJ1A2AsIK/Ra86nhNtedR7nGQ8q/gNhU1CZZ
	 f+Y3W0JTAM+nYRlvtFN2ldmSpj0hDAD+c+r9rQxqYRa+tNyqIMARZ9/LeYwMFd1sLp
	 uwYj04k7eihBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E488C3ABDA;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 14 May 2025 15:01:28 +0800
Subject: [PATCH 1/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-s6-s7-pinctrl-v1-1-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=857;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=GTxtiAQGmCYOsgbEQ6EOKgzNKF5l16qDKM+F3b/U1zI=;
 b=Tss7kkbHInMJD70OvuMcwhicWga68wC2NtehbOPKsGQ2z8FEc6GRKYVYIE88fkviKSXt9HCpG
 9Oe4CQ+Je/1AWPaRSy0cahmKIGRXxbF94t7lAUnZmL4+Dlvb1L4NChm
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for pinctrl of Amlogic S7.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index c36b6fe377ad..8a6981e9f873 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -15,7 +15,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: amlogic,pinctrl-a4
+      - enum:
+          - amlogic,pinctrl-a4
+          - amlogic,pinctrl-s7
       - items:
           - enum:
               - amlogic,pinctrl-a5

-- 
2.37.1




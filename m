Return-Path: <linux-gpio+bounces-20116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0448AB63A6
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 09:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F15D3AF8B2
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 07:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2398220A5E1;
	Wed, 14 May 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2OHsTUQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF823203706;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206102; cv=none; b=SFFLAtZiIMrwJZQmkaiiFlbIAkojLSRn6WC0dUAPoV0iOkFglibUJysSqlhynV8SZ2GTfkliQSVIYPSVi7Rjh+lDp6zph4Wk36V3yaALmBwRTqNBPq+bud2uFo9CStkqHHGmEM7XfVmzt+b/nWy7RU02oKLcppMw2l+Kw9F2Fwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206102; c=relaxed/simple;
	bh=SqXI1uvoCkhyqkrY5xjtQtfDKxNrvjB2D2HwRduTNGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SejN4XeP/sqyMZdoQL/KxSgcKW9G1y5Ojx32azkyRoZBWdFH2oVicclgq1u5hKSuRAyLPCLSgbIDS29hPPwytM3kFg+fYfo+xhmjFUh+SDI6QYQo+j+KU9w8mf5/sAZ9rvXgYL8h1Xr0t0pauUKxQabeiEHuZnca4/SN5eZ2Vi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2OHsTUQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F87EC4CEF0;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206102;
	bh=SqXI1uvoCkhyqkrY5xjtQtfDKxNrvjB2D2HwRduTNGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K2OHsTUQNkDEkSSMUAjk/aeXAhC6BLnwtb/0xF6Z5ExttzehGBwqkkPM/W6VlW0tQ
	 nhQ414J24WnwQkTGAn22KMNF2vfCWUlTK+9mLoFc2JKex1wU05/R1z+a99mvCwlKF8
	 Ki3QbEnnnNuuTOx0FPGegaG1o53H3aZOQ9DYDjMLSdiLmSdYUEwl3ijYdK3f+qNJRW
	 uPqvKeHgoWP3six4emWbwFSctczNr4HA6zlCE+tlxoUAq9erlfho2OMKn+UnKb1moY
	 AyNkJ2Qj9b1IbqwAPNhaLbZynzRwWHdD9kHPiEqAMzP2YOqnjPA1sQO+hKzN5KgCXe
	 yzQhXExOX0TTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E97DC3ABDD;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 14 May 2025 15:01:29 +0800
Subject: [PATCH 2/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7D
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-s6-s7-pinctrl-v1-2-39d368cad250@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=1044;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SRGfN0xHu7rPLyCZFtaZT28fxmetKbOy0Gk6C4ftPKQ=;
 b=3PHyXSoGV95skhliBDZMXH0l8EuvpG+EqyHCmUwBq2UV0lVqWG3FLCfhsTMVqMVVP8Ru2jAVz
 s83N7u82Sp/A5O1bSI4WQMyrSDP8znh40QyaIPL9cu/bGH2f6sCQB/K
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for pinctrl of Amlogic S7D SoC.

Amlogic S7D SoCs uses the same pintrl controller as S7 SoCs. There is
no need for an extra compatible line in the driver, but add S7D
compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8a6981e9f873..96a7c5646c13 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -22,6 +22,10 @@ properties:
           - enum:
               - amlogic,pinctrl-a5
           - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-s7d
+          - const: amlogic,pinctrl-s7
 
   "#address-cells":
     const: 2

-- 
2.37.1




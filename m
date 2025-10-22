Return-Path: <linux-gpio+bounces-27435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E7BFB558
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 12:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73288189E945
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 10:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9A4326D55;
	Wed, 22 Oct 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8gNPWJZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8493254A4;
	Wed, 22 Oct 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127838; cv=none; b=rPi9kppr1SbL0MTHZL7O1wpEkQUqa2GTtxqiSeJUxtcFfENwduBEP6GHGMJnodHPviONh+q1fvItWtrqOdPYlEac473rLNlmcm0HOv1tGWGPeu69g6cL2E+v99SB844BLnrLOdH07mzIy1N+I3S12am6R46D52lNuwTW27FDy8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127838; c=relaxed/simple;
	bh=OUQyFuTsycRdDJyc4s7jio9r2I2Q187UaqN1mLSvjPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FdcRqWqT3rP0J7F6neBQwXqhNbSfqJvqPLhuyu9MOVYumsx1FxeYuzKFbkd7JGxb/b+q/fLRmxAc8KtHTNZGScjMzIMtZ9b4UQWPk2DkbEB+5m7rheXqq1ObSzb4UqgDrd1FjJImGxdCTmNPCVmHHvBfhOuMEt2uaogHC5gpQjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8gNPWJZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653B8C116B1;
	Wed, 22 Oct 2025 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761127837;
	bh=OUQyFuTsycRdDJyc4s7jio9r2I2Q187UaqN1mLSvjPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H8gNPWJZQwBKzvcP4FnCj4hHExxhZSd0spquS9jzC8mjck+Ii1bd4jZj6ZyKq6S15
	 0NnolWXnlgQB3zDO6jUXkQdFuZpCM7uBNA3i15aXr8n3rpLMePClx+GIN1g8MlVZ/z
	 FjnufKVZBMtHmao34aUXg/4jjFYt1ee9LIKLtyBawyyH6rr5iCNaDahHPJnFV48h1P
	 ox2wRhdc3DAEUl+3IT8gKetCO0V+6AJU0Ao35+AFyq+pSN29+jk9m3CoPx0cZOEW2v
	 sR1PqkcAMaITkI+E1LnfvWfyR0IzWtAS6sJCu+IaS/hwL6NDKl6bX8ySzHSuyiP1Pk
	 LlI2vJgCzqonQ==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v3 5/5] MAINTAINERS: add Microchip RISC-V pinctrl drivers/bindings to entry
Date: Wed, 22 Oct 2025 11:09:13 +0100
Message-ID: <20251022-bobbed-ladylike-49a4d9b87c54@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022-dash-refinance-ac3387657ae4@spud>
References: <20251022-dash-refinance-ac3387657ae4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yIOJ8zWE39Nk9VFv1VjhPf9MABofVWCX3ryvpaofjMU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBk/1sYsL/hY1fCpf1m70F8fvgcn55x9MO/bXWuV7WXn3 q/bE3ZXuqOUhUGMi0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATUfnA8N9R94/9imv9wY+1 NFoebDKZvc1xxmPTc4tvrns166rLFOX7DP8UNv6I3ei7VU9x/b7+6AKvZMWumJ66v1pceZFMz/f GqfEDAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Add the new gpio2 and iomux0 drivers and bindings to the existing entry
for Microchip RISC-V devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..5d4825073fcd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22089,6 +22089,8 @@ F:	Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
+F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
+F:	Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 F:	Documentation/devicetree/bindings/riscv/microchip.yaml
 F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -22102,6 +22104,8 @@ F:	drivers/gpio/gpio-mpfs.c
 F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/plda/pcie-microchip-host.c
+F:	drivers/pinctrl/pinctrl-mpfs-iomux0.c
+F:	drivers/pinctrl/pinctrl-pic64gx-gpio2.c
 F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
-- 
2.51.0



Return-Path: <linux-gpio+bounces-29132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C7C8DE03
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 11:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2D394E874A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 10:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7B932D43F;
	Thu, 27 Nov 2025 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uig3HqGg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6315232B9AA;
	Thu, 27 Nov 2025 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764241098; cv=none; b=hqVDjiYFFaQzL4F2D1hgmjLWY3orvn6PUAloWOeWjFzwQLNvVleTnBkOILL8khlSmu3iop+i0W9RGUeF3IzYKIOrOkmTGwTs4N460j10ATDaLHrOommRWmTlR1e9G4CMxAlxssNivY5xHthhaZeRGvj3HFRzxyiYITMjrH3lWs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764241098; c=relaxed/simple;
	bh=WCTVp6YyrZb1HeS7GoDyJOELy1+STwBon/GVCLDwpZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avpyautkNL9qhykvAiIiCSwMpjeuPtbpp2TYZwWBF/1/6Q3NQPqfR+9fsq6aDwHs7Lmfnp6Q5l8WB1BazRM46I5N57duJ4FVvv5COeWFGRzYFT8tX6Hqpumwzr0f3NtXjU17lp7Y9GsxU2RNdRxCDqQ/R0OUzrAyDyICtGqCmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uig3HqGg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C6FC116D0;
	Thu, 27 Nov 2025 10:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764241096;
	bh=WCTVp6YyrZb1HeS7GoDyJOELy1+STwBon/GVCLDwpZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uig3HqGgVd2SLMhXEbfZupKmk6/6C263tmuk9bMa7ETI8IgRerow9mhlekKPcARd1
	 plGIu2ktgH0kjupuxmN2jzFIKGgxXyHMvRpy8qkXel0KElbjzLMvmvy1N47/Q2zvSc
	 slJACJOjMpwdjNOYSMLOEuKzKFxIvoHPb0ouJZyTdv1gHvjUZgAKdVw5DMt+ygSCtQ
	 o8SdxPzhBTzYtxNRhpFzPVBh7Lc2ORo3XGQLWn7L1rEiptIYgZ3MsOus5viXt5v/xS
	 5o7rLaJjTmTDymVHP5X7QmaY/Y2/DIglce9T1u1SmhsS9kHe+SOfmnh62ff775Mkfq
	 BG2c+4mK32LCw==
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
Subject: [RFC v2 4/5] MAINTAINERS: add Microchip mpfs mssio driver/bindings to entry
Date: Thu, 27 Nov 2025 10:58:00 +0000
Message-ID: <20251127-endnote-lavish-8daf82a82c35@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127-bogged-gauze-74aed9fdac0e@spud>
References: <20251127-bogged-gauze-74aed9fdac0e@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=SYXxlq6CpuOEhhmDtAirN//eVcTIugoL6YBJ+hoXwBY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkaels728tjSz9eZt0QobHNr7yeuZRz/v8vLIdu5hxf8 yyAPfF0RykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbyO5Hhf72d7t09z77cdttt +miBy+qOyujqs/ef73iy8JOd5CSz9BCG/4XP3R3KC8OnfgnJOn53p9H08+VpDa9amaJtulS8LZI cGAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Add the new mssio driver and bindings to the existing entry
for Microchip RISC-V devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d4825073fcd..380970935407 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22090,6 +22090,7 @@ F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
 F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
+F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 F:	Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 F:	Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -22105,6 +22106,7 @@ F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/plda/pcie-microchip-host.c
 F:	drivers/pinctrl/pinctrl-mpfs-iomux0.c
+F:	drivers/pinctrl/pinctrl-mpfs-mssio.c
 F:	drivers/pinctrl/pinctrl-pic64gx-gpio2.c
 F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
-- 
2.51.0



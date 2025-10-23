Return-Path: <linux-gpio+bounces-27563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F49C02B46
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 19:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 586CD1A650D3
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 17:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0CD347BB7;
	Thu, 23 Oct 2025 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrpkYfcJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01969346797;
	Thu, 23 Oct 2025 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761239764; cv=none; b=UMLXGvTJqcZIlnfp1WqEc/UWCJZCUywxF8ewHxHSeET7SkW+vlWSa2yzDQOJrca0yd2KPgWUzqDGS6ccmWWrlOFAeaRA4TEpaxh/yGHFqNsfLmaHQWxNalVtl+B7TpHeL17ojLzXMYoPVraoU6YoKQyK7HH6kMCTzBKsQ8QV8js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761239764; c=relaxed/simple;
	bh=OUQyFuTsycRdDJyc4s7jio9r2I2Q187UaqN1mLSvjPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgz7ZcJAHiI+mgHW2rkx20mBMEu4z4D7v3xXsPSv4dVkmlMzftg9HtT3CKXxULzJZKVK52WcR/ixArR3DegeCqt2ZoRjeMIvY5At+3lCHB2zdwcmmWImKHGEi/kX8L8SORAXIh/2g4soF2npEx4UOY7LE1YCr2Udk0x1ZuCrvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrpkYfcJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFD4C116B1;
	Thu, 23 Oct 2025 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761239763;
	bh=OUQyFuTsycRdDJyc4s7jio9r2I2Q187UaqN1mLSvjPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LrpkYfcJ0XaHZv+npKsnZvpSxmMXlkAuGd+5ayAAY78rw2S+aliNApv3vf3RgLbiT
	 nlf6ZhOhblexQzwhPrzuWdpng4OjFsM0opsXhzOo+gMcEwB0SPV9g2uLhE1wCUpnwA
	 qZKzcGNHQCwHlU3PyZA8BmbnXvzyoC9yWjeKw7qbJRXBg//ZBMjA8ZH9XtWgm66ca0
	 digOVgEszw1qgAI1nfJb/FntE/UGpDhqUsuVZxZXMXN5rnWcrrbGMJ69FcdJ/yJuQc
	 jLZzdGfCdn4RbC/qtNc0VeGdPrUm0z4ka/8CTq3RcM/qdRysbGaJRqQgzh75/FIaXF
	 fKQoLhwUuHxkw==
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
Subject: [PATCH v4 5/5] MAINTAINERS: add Microchip RISC-V pinctrl drivers/bindings to entry
Date: Thu, 23 Oct 2025 18:15:01 +0100
Message-ID: <20251023-footing-tiger-61835aac1321@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023-stopwatch-cough-47d5497be5aa@spud>
References: <20251023-stopwatch-cough-47d5497be5aa@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yIOJ8zWE39Nk9VFv1VjhPf9MABofVWCX3ryvpaofjMU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBm/kibuXMJzncUhek3nqunTeZ/tW/7Cco/N6qoXwSebD vO216rN7yhlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEtDYxMnwSurz6WtQy7U6p 0NZgy5x5v9nln++rPbH4P3f3tAcyVdsYGS45vVjkevW18xc3Z6VFsm9mvnJsjMp84LVa5GL4m40 x9uwA
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



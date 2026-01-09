Return-Path: <linux-gpio+bounces-30359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EF1D0AB41
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A3133017664
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4E03612C0;
	Fri,  9 Jan 2026 14:40:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A3F35E529;
	Fri,  9 Jan 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969609; cv=none; b=TMPUUBaS6rLePYEuS+GecrLb5hl4vUShLIGtDsJDN0QBoI83cy43JSGaBeydUqQKJj303HkXPp89gma1v7GYEyNhBDQQVTRh2d2hbc6ICvSsuQuC7i3/vGmBUTJDu648+jKkL6v1oUNcd1HdeCvO4YpTstFZQ2JJ9t/Y+zL1coM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969609; c=relaxed/simple;
	bh=3LWMfI3x+JkOn2l6nAvupQALgOj1WPrtY9CGlKE4G4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n9J0RJTdZ2iSRMU2AwnlkzMmxmNg7f1VBc2OQP/6QX9Q2LKn1FME5PHWfTUKa8pB+h712bPiSVWvocqJhFH+CQLb3HbX1Pra97yOkgEHEJh+UdkpbAQrCOR/xumJKN0DtMv13XRmyR5EQ4Pvi8XbQH1oDUziRTPgdYl9mvUTWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: EBXeXghNQnCXItreDSb9ng==
X-CSE-MsgGUID: ZvoFqo/PR5CELB8JoGXBrQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jan 2026 23:40:05 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.195])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B8B744027257;
	Fri,  9 Jan 2026 23:40:03 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v3 0/1] Add support for GPIO IRQs for RZ/T2H and RZ/N2H
Date: Fri,  9 Jan 2026 16:39:09 +0200
Message-ID: <20260109143910.645628-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/T2H and RZ/N2H SoCs have IRQ-capable pins handled by the
ICU, which forwards them to the GIC.

The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
and the mapping is not configurable.

Add a GPIO IRQ chip that can be used to configure these pins as IRQ
lines, and add the user switches present on the board.

V3:
 * drop patches queued up by Geert
 * adjust comment describing the source of truth for the data inside
   rzt2h_gpio_irq_map
 * check if interrupt-controller property is present before populating
   GPIO's IRQ chip
 * move rzt2h_pinctrl_suspend_noirq() above rzt2h_pinctrl_pm_ops

V2:
 * drop interrupt-controller and #interrupt-cells from required to keep
   compatibility
 * select GPIOLIB_IRQCHIP
 * select IRQ_DOMAIN_HIERARCHY
 * add comment to clarify wakeup_path atomic usage
 * add more details to the commit message, including usage of the
   hierarchical IRQ domain and wakeup capability implementation

Cosmin Tanislav (1):
  pinctrl: renesas: rzt2h: add GPIO IRQ chip to handle interrupts

 drivers/pinctrl/renesas/Kconfig         |   2 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 203 ++++++++++++++++++++++++
 2 files changed, 205 insertions(+)

-- 
2.52.0



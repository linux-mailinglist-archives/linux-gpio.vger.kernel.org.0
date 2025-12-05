Return-Path: <linux-gpio+bounces-29287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D64CA820F
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 16:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3652C304A1FD
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 15:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2E133DEC4;
	Fri,  5 Dec 2025 15:03:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121E33D6CC;
	Fri,  5 Dec 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947014; cv=none; b=AoND2wrtKZABrcarC2j41ih8SCUdYBaOcaj6lpjqvrJQNPRPhjTc2YCeon1935i/wO8H8kP7TTum2a9KF4TTkLnJIli6PQezstQUTCB+kgs8xjFOb5EKCRF70f10FPoKVMbhsPoJv86JhL0i3HR2RYOkRlrbnsqfeBcUy/MPvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947014; c=relaxed/simple;
	bh=Y/M3N5HNOifqeDWbZssv82d6uTXWJAUjySxUzQeErjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lI8SYsRtab5rBQLP9mqLrDmYvnL+YgZzc56CplCix+4wOzamclOdEe/ZT6A+8sXi9usBIdh9vZilNXwq1zpNeOGi/SZzZmlpNgNO0Fb9B90nhxjJa8nkMlkJfLctBC8p9BS4NDPd/jwtrwwLrXl2jq1cwt3P9xpMIVnhv+uYiMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: FrUPShMmRrWpQ+SyJqIfHg==
X-CSE-MsgGUID: BcvE0ed5RJiR+YvLjkDsmQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Dec 2025 00:03:25 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.202])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C9CF3427BFEE;
	Sat,  6 Dec 2025 00:03:21 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 0/8] Add support for GPIO IRQs for RZ/T2H and RZ/N2H
Date: Fri,  5 Dec 2025 17:02:26 +0200
Message-ID: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
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

The ICU driver has been submitted as part of a separate series [1].

[1]: https://lore.kernel.org/lkml/20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com/

V2:
 * drop interrupt-controller and #interrupt-cells from required to keep
   compatibility
 * select GPIOLIB_IRQCHIP
 * select IRQ_DOMAIN_HIERARCHY
 * add comment to clarify wakeup_path atomic usage
 * add more details to the commit message, including usage of the
   hierarchical IRQ domain and wakeup capability implementation

Cosmin Tanislav (8):
  pinctrl: renesas: rzt2h: move GPIO enable/disable into separate
    function
  pinctrl: renesas: rzt2h: allow .get_direction() for IRQ function GPIOs
  dt-bindings: pinctrl: renesas,r9a09g077-pinctrl: Document GPIO IRQ
  pinctrl: renesas: rzt2h: add GPIO IRQ chip to handle interrupts
  arm64: dts: renesas: r9a09g077: add GPIO IRQ support
  arm64: dts: renesas: r9a09g087: add GPIO IRQ support
  arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add GPIO keys
  arm64: dts: renesas: r9a09g087m44-rzn2h-evk: add GPIO keys

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml    |  13 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |   3 +
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  33 +++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |   3 +
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  30 +++
 drivers/pinctrl/renesas/Kconfig               |   2 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 245 +++++++++++++++++-
 7 files changed, 320 insertions(+), 9 deletions(-)

-- 
2.52.0



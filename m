Return-Path: <linux-gpio+bounces-28941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E503DC78CD2
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C4C04EEF97
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF6134AAF0;
	Fri, 21 Nov 2025 11:27:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AC3345756;
	Fri, 21 Nov 2025 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724436; cv=none; b=k5goxP/OzdQIywcMXMy7CbsHmyWEmvlP0fcn+nphQj6ZIVzVA9Lho1oJZomf3tMq3gDpyQx52wV/8JqRffD7eTU0upIw+VZqS1ssSPmBPpm6QKjgrA6QKhQOSwshRknovls+iFG27Xzp6c2we0Wbq8uiRV4m+s+NSZ5njvjYZZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724436; c=relaxed/simple;
	bh=k+cblkPsvI3zrPdHJzEoe/60V/WB43tmivEz3AqUgR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qW6Tv7xZbYxPZWVLkLZl2nJkInGmwf/1T4nfy3ZAOB7QWfWfv5xtaAQOeQsIHXPjBjD7yUTmhJT8RW1RYbJgJZqDOb+wnDEnVjsxoZDPiN3XrAqig4g+Tpkxj1Q+2m/aoANOoyZqKP35/rs7fkeroOcNtlWYpAjv2sK9hV3yqN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: UjQs0x8XTTOR6TdnkLEpdQ==
X-CSE-MsgGUID: tcctl0klRlO2h064+ixElA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2025 20:27:11 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 90DD5437C1A2;
	Fri, 21 Nov 2025 20:27:07 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH 0/8] Add support for GPIO IRQs for RZ/T2H and RZ/N2H
Date: Fri, 21 Nov 2025 13:26:18 +0200
Message-ID: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
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

[1]: https://lore.kernel.org/lkml/20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com/

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

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml    |  15 ++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |   3 +
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  33 +++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |   3 +
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  30 +++
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 241 +++++++++++++++++-
 6 files changed, 316 insertions(+), 9 deletions(-)

-- 
2.52.0



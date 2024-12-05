Return-Path: <linux-gpio+bounces-13560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 489919E5E04
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 19:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0203188577C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 18:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA52226EF5;
	Thu,  5 Dec 2024 18:09:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6078F1922FB;
	Thu,  5 Dec 2024 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733422189; cv=none; b=WW/Ev8KSlz0vFgtiUlEEYpiIfUrkuMdJe1JbAJp+2THuBVIVMTjsEyed/0UOMQUSoJLNscDmSh48kAtSvanHHdb81SSxB8uRDWhrR0OIuey1Qac8yg6nof+h6AQ3/hH39gdRgftGize62FyRze5nWCxN8F/5UXX/9XwjJZpQans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733422189; c=relaxed/simple;
	bh=cGplkBRlHMixFcgnF1iuyjDkJ/lNoGy2lm8wtVcWSHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ld6SGFzOM/7DTyqJbAoIWvJv4GSrbJRaoTNjWGvriFYmZ9RwmW591DO9q/sqJmKZNp4xfvFOKhdeivIgNrhXTInG3Q0hc7BiGG5JAjL6OVpnl1d9ammlkD4jMmwLmGfN2bcb9Du+mRAB8IYErmRV/mhJn/qWKTrK9Ob/KIGtvd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: cStG/LM8Qp+Jvg/lWPfG6g==
X-CSE-MsgGUID: SGaf6v3KTbWcttHbCbUThA==
X-IronPort-AV: E=Sophos;i="6.12,211,1728918000"; 
   d="scan'208";a="231007740"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2024 03:09:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.141])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AE3D64049DA1;
	Fri,  6 Dec 2024 03:09:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/4] Add RZ/G2L pinctrl support
Date: Thu,  5 Dec 2024 18:09:16 +0000
Message-ID: <20241205180924.154715-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pin controller support for the Renesas RZ/G3E(R9A09G047) SoC. The
RZ/G3E PFC is similar to the RZ/V2H SoC but has more pins(P00-PS3).
The port number is alpha-numeric compared to the number on
the other SoCs.

This patch series depend upon [1]
[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914097

Biju Das (4):
  dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
  pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add pincontrol node
  arm64: dts: renesas: r9a09g047: Add scif pincontrol

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   4 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  13 ++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  13 ++
 drivers/pinctrl/renesas/Kconfig               |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 158 ++++++++++++++++++
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  25 +++
 6 files changed, 213 insertions(+), 1 deletion(-)

-- 
2.43.0



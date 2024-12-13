Return-Path: <linux-gpio+bounces-13876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766FB9F13F3
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 341B5284200
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5F51E570D;
	Fri, 13 Dec 2024 17:39:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDEB17B505;
	Fri, 13 Dec 2024 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111559; cv=none; b=ktdRHyNKtV4Nn0M2JPnC26ClhPgXPd0i2oLIHlP/eIwWYLEkJcZwUsGImov0b20LK38KHGzgl8LNDqCqc74KHCwTGBi+JH8ds0PPvgty2zCWDZ597NgRKXf8udK9pYICnq6DwlJCD+WkVnIJQyYXLvUK9DggXDu8ayCbCr/TG6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111559; c=relaxed/simple;
	bh=Ws/7Am5K7cyepwnjFT3mti3UcM8KC0aPu8xpWxzmQ9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWwVQ4usO5Ndbq4rcY8I6zdWkvs549w9SK6qGk1xfzPhvm2/SPGkgbuyRtMTnQVUg6gKfwDhiYS4HiZ1P/psp+zv/NL418EZsw6jsYuJtRcxpn/vUW0d5fPSyQ1lT76sMeuriwip+L47keogbKWEhqgbo7DL9TaufU90LEm9VnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Q5TLRZVgTXmkd4RpQwQdCg==
X-CSE-MsgGUID: 0lnk1peeSeK4kxvD/pj5zA==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="231774190"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Dec 2024 02:39:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 605704004BB9;
	Sat, 14 Dec 2024 02:39:04 +0900 (JST)
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
Subject: [PATCH v3 0/7] Add RZ/G3E pinctrl support
Date: Fri, 13 Dec 2024 17:38:46 +0000
Message-ID: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
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
The port number on both RZ/V2H and RZ/G3E is alpha-numeric compared to
the number on the other SoCs. So added support for defining alpha-numeric
port names.

v2->v3:
 * Added alpha-numerical port name support to both RZ/V2H and RZ/G3E.
 * Added PORT_P* macros based on PFC_P_mn offset and RZ{G3E,V2H}_*
   macros for defining port names in DT.  
 * Collected tags.
 * Updated r9a09g057_variable_pin_cfg table replacing port 11 with PORT_PB.
 * Replaced macros WDTUDF_CA->WDTUDFCA and WDTUDF_CM->WDTUDFCM.
 * Replaced macro QSD0_*->SD0*.
 * Updated gpio range from 176->232 to match the port number based
   on hardware indices.
v1->v2:
 * Updated typo of the patch header RZ/G2L->RZ/G3E
 * Fixed the binding warnings reported by bot.

Biju Das (7):
  dt-bindings: pinctrl: renesas: Add alpha-numerical port support for
    RZ/V2H
  dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
  pinctrl: renesas: rzg2l: Update r9a09g057_variable_pin_cfg table
  pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Replace RZG2L macros
  arm64: dts: renesas: r9a09g047: Add pincontrol node
  arm64: dts: renesas: r9a09g047: Add scif pincontrol

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   7 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  13 ++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  13 ++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  34 ++--
 drivers/pinctrl/renesas/Kconfig               |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 184 +++++++++++++++++-
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  35 ++++
 7 files changed, 262 insertions(+), 25 deletions(-)

-- 
2.43.0



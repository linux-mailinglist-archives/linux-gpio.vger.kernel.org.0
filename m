Return-Path: <linux-gpio+bounces-13924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1160E9F3A3F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 20:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 539B71634E0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 19:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D172C20C497;
	Mon, 16 Dec 2024 19:53:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29B920765F;
	Mon, 16 Dec 2024 19:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378815; cv=none; b=UFBma2ERcZ+9VkKc81Y/exLVBsOSsEu0+5Rvy0suc3+46MYmPGgCOq4IhcRxJdcmknq/7sn4jo1ZBiNAYc+tYWJ397PrTRY8fTJFrReEVL/GqUOGOj93cNlqXMMnT8eEIzQZQ2lzdpXxMHUJUPGLvUUStHULY48M6VZrpqeYV50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378815; c=relaxed/simple;
	bh=bJCxwzCkOalmOB+fQ4vfqHwlhogOz8Zoy9CMaVXnzeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N+UTAbtwFAhQ0IIP8OWWWukPGUwvEKSCzOs/R4eMkcHjZghVQRcyTUfmFtiD2HS3IggMfK1u2JMzL//8e5yMESplfj61Y/G4QvFHGMcCr/5IBsI6qgTbSyKuGWuyICcIUwZMgpKFYOwWJgWk2mGaVIV6oEr4I6rUCNVPG+VaNZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: OCuJ0kFxSRGPvfhRyOUh0g==
X-CSE-MsgGUID: sF9OZIUOQ1ybjCj+GITxrQ==
X-IronPort-AV: E=Sophos;i="6.12,239,1728918000"; 
   d="scan'208";a="231992149"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Dec 2024 04:53:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B642E40638CD;
	Tue, 17 Dec 2024 04:53:27 +0900 (JST)
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
Subject: [PATCH v4 0/7] Add RZ/G3E pinctrl support
Date: Mon, 16 Dec 2024 19:53:10 +0000
Message-ID: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
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

v3->v4:
 * Added new header file with separate RZV2H_P* and RZG3E_P* definitions.
 * Dropped ack tag from Conor for patch#2 as there is separate file for
   RZG3E_P* definitions.
 * Included header file renesas,r9a09g057-pinctrl.h
 * Updated r9a09g057_variable_pin_cfg table replacing PORT_PB->RZV2H_PB
   macro.
 * Included header file renesas,r9a09g047-pinctrl.h
 * Replaced macros PORT_P*->RZG3E_P* 
 * Updated rzg3e_gpio_names table with NULL port names for ports
   corresponding to unsupported hardware indices.
 * Updated r9a09g047_gpio_configs table with NULL value for ports
   corresponding to unsupported hardware indices.
 * Collected Rb tag from Geert for dts changes.
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
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  36 ++--
 drivers/pinctrl/renesas/Kconfig               |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 186 +++++++++++++++++-
 .../pinctrl/renesas,r9a09g047-pinctrl.h       |  41 ++++
 .../pinctrl/renesas,r9a09g057-pinctrl.h       |  31 +++
 8 files changed, 302 insertions(+), 26 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h

-- 
2.43.0



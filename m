Return-Path: <linux-gpio+bounces-13579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 882BB9E6C2F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 11:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A85A1887F13
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 10:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F014B20010E;
	Fri,  6 Dec 2024 10:23:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22651FF7D3;
	Fri,  6 Dec 2024 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480628; cv=none; b=CRXXYsFTEcKCRLh+revDO9SBtVU1gmCk2Dwo1wiViwcKaU1Ir38yc0WRJ3Lyy1+zSFgXF2HBRhO7vqOGzPMiFm94I31962/bzJRMvzDvEol5epEUEiWHnyTtl2OeZe/4PtpUqCr/r/Ry44MEB/htiq8H2ZcgC6fYcAVk7kAii2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480628; c=relaxed/simple;
	bh=u7pU998kFu/anjEgJWFiWqXFbryDTzsDZcgSYSEZpDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HofdV6Oj16nm+IH3PksqsgmyE1z+/jNf2BH4yAxVuQnxflpShnPhZvxDCl7Tprd36Uej7MpOT03A8B2kBq6/cmTbKHE0T4TNg8K/wnA9EfvsmfhyUab6SN722wowPE7caZI4xSBY+9Sn8Pd1QA8UkpJD9frctwsFJFsxFsMwXKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: PTyBnPrXSRCuoMd337L2Dg==
X-CSE-MsgGUID: hIqmOJyYRlOeuX1Hp55NGg==
X-IronPort-AV: E=Sophos;i="6.12,213,1728918000"; 
   d="scan'208";a="227116241"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Dec 2024 19:23:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0A8724011F78;
	Fri,  6 Dec 2024 19:23:29 +0900 (JST)
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
Subject: [PATCH v2 0/4] Add RZ/G3E pinctrl support
Date: Fri,  6 Dec 2024 10:23:05 +0000
Message-ID: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
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

v1->v2:
 * Updated typo of the patch header RZ/G2L->RZ/G3E
 * Fixed the binding warnings reported by bot.

Biju Das (4):
  dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
  pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add pincontrol node
  arm64: dts: renesas: r9a09g047: Add scif pincontrol

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   7 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  13 ++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  13 ++
 drivers/pinctrl/renesas/Kconfig               |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 158 ++++++++++++++++++
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  25 +++
 6 files changed, 215 insertions(+), 2 deletions(-)

-- 
2.43.0



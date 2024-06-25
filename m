Return-Path: <linux-gpio+bounces-7682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7348917220
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 22:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FA93288AA1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 20:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F181017CA16;
	Tue, 25 Jun 2024 20:03:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF4716F91E;
	Tue, 25 Jun 2024 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345815; cv=none; b=VpMWWf91KFRbEElJFAmQEAXM1HrG9B3cav0ZjhOCLjBg1XXSkRhmqitmDnYykWmmS5ltNe8FyMc3+6q/hMOnZ42M3qLIGkrk38I6ZUGzxwvt1mZy6SaRCP6O8xUbSP671fS7JOWLoy8Dux0mbfxEmcV9ee9pIQZWEAnKkcwbTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345815; c=relaxed/simple;
	bh=4UVf1UVVwc6tmEsCVDODxuqOSrAHNdNQJVlRuCSl4Zo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dvXuZ/g7mV5UGEeDaDhzKE06H6f70E6eaIa3w4gxxjnYSlZWdiXa3ZZyYBMaydP/uz3m48yOE7Vsm8ZGFE2JxCWWWq3KMqB0Y714LWc8baABwIKJgZi5I6w0zHzLFUWIeRZwNAEGJ8nkU3TtKTlYRQ0mPyPLzDrohfcK0x03CN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,264,1712588400"; 
   d="scan'208";a="209263956"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2024 05:03:31 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 44A1B40078B4;
	Wed, 26 Jun 2024 05:03:26 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] Configure GbEth for RGMII on RZ/G2L family
Date: Tue, 25 Jun 2024 21:03:07 +0100
Message-Id: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For devices in the RZ/G2L family, we have so far relied on U-Boot
correctly configuring the Ethernet interfaces in RGMII mode with
PVDD=1.8V before the kernel is booted. Instead, the required
configuration should be described in the device tree and activated
within the pinctrl driver.

Changes v2->v3:
  * Picked up Linus W's Acked-by tags & Geert's Reviewed-by tags.
  * Renamed rzg3s oen functions to match the callback names.
  * Check pin caps before calling oen_{read,write}() so we can drop the
    caps argument to those functions.
  * Simplify arguments to rzg{2l,3s}_pin_to_oen_bit() and decode
    required variables inside this function.
  * Check for dedicated pin before calling RZG2L_PIN_ID_TO_{PORT,PIN}()
    in rzg3s_pin_to_oen_bit().

Changes v1->v2:
  * Rebased on next-20240611.
  * Changed the approach taken in the pinctrl patches to be compatible
    with changes made by Prabhakar for RZ/V2H support. I haven't picked
    up Reviewed-by tags on these patches as they've changed a lot.
  * Clarified that patch 6/9 also affects RZ/Five.
  * No major changes to the dts patches so I've picked up Geert's
    Reviewed-by tags for these.

Paul Barker (9):
  pinctrl: renesas: rzg2l: Clarify OEN read/write support
  pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write
    functions
  pinctrl: renesas: rzg2l: Support output enable on RZ/G2L
  arm64: dts: renesas: rzg2l: Enable Ethernet TXC output
  arm64: dts: renesas: rzg2lc: Enable Ethernet TXC output
  arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
  arm64: dts: renesas: rzg2l: Set Ethernet PVDD to 1.8V
  arm64: dts: renesas: rzg2lc: Set Ethernet PVDD to 1.8V
  arm64: dts: renesas: rzg2ul: Set Ethernet PVDD to 1.8V

 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     |  86 ++++++----
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    |  43 +++--
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    |  86 ++++++----
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 155 ++++++++++++------
 4 files changed, 237 insertions(+), 133 deletions(-)

-- 
2.39.2



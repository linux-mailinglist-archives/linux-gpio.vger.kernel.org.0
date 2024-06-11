Return-Path: <linux-gpio+bounces-7351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16509903A35
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 13:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A2E71C21E24
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FAC17B43F;
	Tue, 11 Jun 2024 11:32:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCCE17B41D;
	Tue, 11 Jun 2024 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105573; cv=none; b=NXwGuvnPPL10OLfkbgmuW/k5KK1HhWxItQTbgy5EsiBEFom1AoHXsk0Mfap2wU+NB/brsZ1cgbPt6o2c+9qT7tmpp4UtIx9mgfNOvY5mioHdmsVzpbact1769mLlbEUw6ZPJEAVPAj5K5MzbG5+VsMqSwp1lfpagVX2gsmRwkBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105573; c=relaxed/simple;
	bh=fv2vFQ9zsD9csPzAwCP8Af0+dR8nurRiUYyvu5jh/io=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qceyF3AZs7U9FV+j231n8Qg+wWfRMF1JfZxejqkhcshUT7Ihf8C4WtXRQdvJgQVHNd2pR+M9U/I3QcnXk2CHCjjOpXKFwQwQYWdJ5nONUftfZ12jOqzxn7NAjxUzTWavQqe/uSyWHgS0WpsiUoE/G3nxz5C30ThH8wIRg+3bE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="211449611"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2024 20:32:49 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.82])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DEF774008C4F;
	Tue, 11 Jun 2024 20:32:44 +0900 (JST)
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
Subject: [PATCH v2 0/9] Configure GbEth for RGMII on RZ/G2L family
Date: Tue, 11 Jun 2024 12:31:54 +0100
Message-Id: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
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

Changes v1-v2:
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
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 150 ++++++++++++------
 4 files changed, 235 insertions(+), 130 deletions(-)

-- 
2.39.2



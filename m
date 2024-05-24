Return-Path: <linux-gpio+bounces-6596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E18CE3BB
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 11:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F1691C21819
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 09:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAA385633;
	Fri, 24 May 2024 09:46:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3E342067;
	Fri, 24 May 2024 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716544014; cv=none; b=LqUPbMkZR6UbcG1bnKD/fvNJgEpdhmT5oQav66QiTt1Hjy230RUnjo8tel0F6MInPBFq/QLAb3xHO6fBHr41/K+fxGj+JYaFlZiWSdXmBxH2DrC7YSHl3nwyssIlYWu2gexDlD24GXhDRePp2wy+EbVcCVQPm3pWdTHyPPVpneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716544014; c=relaxed/simple;
	bh=scV16I7S0smAdJpge2lvj7tLR+MMYrxI9eFUzY/Jfgg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pKNWXkE2MxsUtMQDR5RZIzBu2SgC9Io+seciw/Cq65GkYHI1x6H1s1qqefR5lOeOt848l4fFOtyDlcoxKO5hi5Qjt6NT7euNRbFimFs16w9nMViDtp3IcMZ8G+jgrMLsuW9QFGzNGZl5BjiQdEcQMV5nvw2JkeoP6Km6zOVcHKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,185,1712588400"; 
   d="scan'208";a="205579804"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 May 2024 18:46:44 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.196])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 49D534006CD0;
	Fri, 24 May 2024 18:46:40 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] Configure GbEth for RGMII on RZ/G2L family
Date: Fri, 24 May 2024 10:45:54 +0100
Message-Id: <20240524094603.988-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For devices in the RZ/G2L family, we have so far relied on U-Boot correctly
configuring the Ethernet interfaces in RGMII mode with PVDD=1.8V before the
kernel is booted. Instead, the required configuration should be described in the
device tree and activated within the pinctrl driver.

Paul Barker (9):
  pinctrl: renesas: rzg2l: Fix variable names in OEN functions
  pinctrl: renesas: rzg2l: Refactor pin to OEN bit translation
  pinctrl: renesas: rzg2l: Support output enable on RZ/G2L
  arm64: dts: renesas: rzg2l: Enable Ethernet TXC output
  arm64: dts: renesas: rzg2lc: Enable Ethernet TXC output
  arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
  arm64: dts: renesas: rzg2l: Set Ethernet PVDD to 1.8V
  arm64: dts: renesas: rzg2lc: Set Ethernet PVDD to 1.8V
  arm64: dts: renesas: rzg2ul: Set Ethernet PVDD to 1.8V

 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 86 ++++++++++++-------
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    | 43 ++++++----
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 86 ++++++++++++-------
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 78 ++++++++++-------
 4 files changed, 182 insertions(+), 111 deletions(-)

-- 
2.39.2



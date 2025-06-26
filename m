Return-Path: <linux-gpio+bounces-22247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2716AE97A5
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 10:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 140685A2B39
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 08:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C9F25C70D;
	Thu, 26 Jun 2025 08:10:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A66A25B693;
	Thu, 26 Jun 2025 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925451; cv=none; b=DWNoIqqqBdD/aRn0fRW4HAJf8iCSiE18uGmtpUHCLJCRVSvOohFmg90bDMexX5TcDutaRorMG6WV2cgwOeZJE3NSCde+aOKQ3kdbBtWSQqdEu7nTkWwLj/uPXaJsN2iq+yRB6wyvo0U6n5JTrQ0I7/yVA0uoMQoEK8ayv6PcuRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925451; c=relaxed/simple;
	bh=5kPFPNPSF57v8asqh+vVTCyktQ+xIYKtEmLuOa6VCVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YjWjq7V9sW5/LtW+BrMGPIdDm5U7gqYphtmHsZi0mZONE7n/Naz4gIwTcIrY1L9+SVZdUHhIguK00E3blwCOn6lGNGAhzmezwk8MJ7dN5AstqzfWk7f/jDxKitdtckWnNat88e2OqkQdRXfmxnGVPVUldk/FLiw172+oew5+96k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 366481F0004B;
	Thu, 26 Jun 2025 08:10:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 84E01AC7F75; Thu, 26 Jun 2025 08:10:46 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id EA652AC7F75;
	Thu, 26 Jun 2025 08:09:37 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 0/5] Allwinner A100/A133 Ethernet MAC (EMAC) Support
Date: Thu, 26 Jun 2025 10:09:18 +0200
Message-ID: <20250626080923.632789-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC)
and uses it in the Liontron H-A133L board.

Paul Kocialkowski (5):
  pinctrl: sunxi: Fix a100 emac pin function name
  arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
  dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
  arm64: dts: allwinner: a100: Add EMAC support
  arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support

 .../net/allwinner,sun8i-a83t-emac.yaml        |  1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 35 +++++++++++++++++++
 .../sun50i-a133-liontron-h-a133l.dts          | 19 ++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c   | 32 ++++++++---------
 4 files changed, 71 insertions(+), 16 deletions(-)

-- 
2.49.0



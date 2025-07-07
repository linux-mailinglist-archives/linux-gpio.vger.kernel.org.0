Return-Path: <linux-gpio+bounces-22894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7EAAFB929
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 18:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 652F44A7539
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 16:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5788422CBD3;
	Mon,  7 Jul 2025 16:52:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B116F224220;
	Mon,  7 Jul 2025 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907178; cv=none; b=t9jwyMhx9DaAREHQ4kN/CoGiqY5DFYujRl/XbWa2KVsOoi3XmfdBTApDHjqRiAGGGlS7216knqQqrAht4yomKWfQCp5X905eTdzLmAd4x9C8gs60+zuHdKBRxHNrR6ewb01bzHikvYB1kWS26XlI+mzNJWPMUjv0XJSqe/ZE1S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907178; c=relaxed/simple;
	bh=Lizooeyd51qbmPIGSbyVqtfzNGJ1X/J8tOh/qkk5VbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MmQzQSaesS7LreIjs1908Lr19S80MA2SnzltTUHtuzXhtqLHQH2CLPPQbG+NefO2hrJYGt0n3Me4iHO6FFqFqP6xso7n0VgeSnvmrLj4K0M0oWTExQq7Qaf1/YouAoh3XRL2qnrHDLc4Yfmv7jrtwASDJbAZc4hRA5sAX8/9dxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E02641F0003D;
	Mon,  7 Jul 2025 16:52:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7848EACAEEC; Mon,  7 Jul 2025 16:52:53 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 2C0B8ACAEE0;
	Mon,  7 Jul 2025 16:52:08 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 0/4] Allwinner A100/A133 Ethernet MAC (EMAC0) Support
Date: Mon,  7 Jul 2025 18:51:51 +0200
Message-ID: <20250707165155.581579-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC0)
and uses it in the Liontron H-A133L board.

Changes since v1:
- Reverted the emac0 to emac rename;
- Added collected tags.

Paul Kocialkowski (4):
  Revert "pinctrl: sunxi: Fix a100 emac pin function name"
  arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
  arm64: dts: allwinner: a100: Add EMAC support
  arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support

 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 35 +++++++++++++++++++
 .../sun50i-a133-liontron-h-a133l.dts          | 19 ++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c   | 32 ++++++++---------
 3 files changed, 70 insertions(+), 16 deletions(-)

-- 
2.49.0



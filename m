Return-Path: <linux-gpio+bounces-10982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10932993382
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8107284C19
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F69F1DC756;
	Mon,  7 Oct 2024 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="UK1er1sL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C821DC73A;
	Mon,  7 Oct 2024 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318973; cv=none; b=Zbi90ZgPiunNXlatFGEtLMwU4xe0lxzCuXEyYhAK5ZuJcgFVbkn5+cyPOX1cBypJZLFXvtYn1Q953koBBGYuN6GLqSIw735aYYMTsRYPNNd/Q20GBIjJotb2o5D/wDHrnuSoUq5v7qB2DwqnTlc/mDSmT0+HSVUk37YAOqF6ha4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318973; c=relaxed/simple;
	bh=qgs6djftKMsHaoIbJPCzIEn9PiUmxfooSvy4LW9HDeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhAQEWNZlnwz5/kXQgSxx0wly7U9HCxaJTipj3GjGbwchgg05Wv1MK33N4UO3+30HUKNTQQjXKLLI2TiVgW3D2RzXCUzPjmDGYgrgx9ubjX7cACr+75HSPcEKcO4xLyH2PB+/ralnPVMQ510k+RQ5x5UL93jchTSJ3MbhENdr30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=UK1er1sL; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0C9B023F20;
	Mon,  7 Oct 2024 18:36:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWkq9wvynVqm; Mon,  7 Oct 2024 18:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728318969;
	bh=qgs6djftKMsHaoIbJPCzIEn9PiUmxfooSvy4LW9HDeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UK1er1sLrFZL6z2v8psaTd7elv1uOAjOY5KF+Q13ynWGZCILbtIkFjC8JoRbKY7vx
	 ux2lMsS145kQogdpABgARonVYoFCPwLS6kNPfMdDT4UTNLDPtJ1z1mmL78GXxx8JLt
	 NHI7SrswHcw++B4ToPWjb+6kLGsmyojFCJE5kxM08IjwLnse6acZunh4MdDAVavLX6
	 apBwMFLGEnP8Ngqj89GxvnbZAiWc0eDMe1RhmXboNbgfa+vYcpxRfiXowDx57HwgFr
	 xyYCKPjhb2k+TEmBMFRkPPcgBl2phasyYBZe6p/dEHHcoGQQhpSlrOpE3O962Z7E2A
	 Af0Qxx57sgTdQ==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v6 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64
Date: Tue,  8 Oct 2024 00:34:14 +0800
Message-ID: <20241007163414.32458-6-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original firmware of EA9350V3 from Linksys can only boot ARM32 kernels
and there are seems to be no way to boot ARM64 kernels on EA9350.
It is possible to use this device tree by compiling an ARM32 kernel
for getting the kernel to boot on EA9350 V3 firmware however.

Building the Linksys EA9350 V3 device trees from the arm64 tree together
with the ARM32 include to allow booting this device on ARM32.

The approach to include device tree files from other architectures is
inspired from e.g. the Raspberry Pi (bcm2711-rpi-4-b.dts) where this is
used to build the device tree for both ARM32 and ARM64.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 arch/arm/boot/dts/qcom/Makefile                         | 1 +
 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index f06c6d425e91..147dbeb30a6a 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk04.1-c3.dtb \
 	qcom-ipq4019-ap.dk07.1-c1.dtb \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
+	qcom-ipq5018-linksys-jamaica.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
 	qcom-msm8226-microsoft-dempsey.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts b/arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
new file mode 100644
index 000000000000..9a6ad767ebd7
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+#include <arm64/qcom/ipq5018-linksys-jamaica.dts>
-- 
2.46.2



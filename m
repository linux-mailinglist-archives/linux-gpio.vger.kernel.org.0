Return-Path: <linux-gpio+bounces-10759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5676A98E6EF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 01:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 856E71C22AB2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 23:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CE91BFE0C;
	Wed,  2 Oct 2024 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="AvslTyRa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D11BD03B;
	Wed,  2 Oct 2024 23:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727911790; cv=none; b=BG1bIv1HvwGKfZOZO3dX3GCnT/4rndgidJmXkORRMgbtPkBNs1VyBi28zUA6uavTdHHFGXion0iDm0aO4K5pMuxSCc+RVlifodOKq3qzSAyfkovotHnW2V2B/8VZBpJb4xI0ESH0O2LXulfqR5Yo4adaPVwng373a8o2x+Qh/Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727911790; c=relaxed/simple;
	bh=vlT6BUE0i0bCZYlq2mO18x7e5FjTZyQeszvJG4JrHMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8gC4OPFlrNK4CLsANtRhBvpL2F0vbtzCorPPv5xame3+k7+DxbN/DtFBLhb6c1fq0xcDoTDftWcmZNs2VnG4t2TNA9jwdwueMg2q/NQVzgzHMq4r3+zZGCJQvgFWfDsyr7+dlce6mdVkCIYZUUcSK+iGJ+U9LJDEJi7xwp/974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=AvslTyRa; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C124523D68;
	Thu,  3 Oct 2024 01:29:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kk32f1i4-bQ0; Thu,  3 Oct 2024 01:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727911787;
	bh=vlT6BUE0i0bCZYlq2mO18x7e5FjTZyQeszvJG4JrHMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AvslTyRaiNSOSrD4XVhc0KuthPRVB8YSuDnwWIqRDA5zGZh4fxh9gxpgA/0623h8H
	 R7qfh3+Y2MbqKd1902EKAgcgItkouVCT/mbPJoQ/7A8lBfil2y7XnZofAQxPnZkQoB
	 hUtDzya1ncyIaEWEffs3Zufl1PlLxVXcvzYq3fTfFXj7EsbAtlwttvxvVw+oti7Ekl
	 urbgfY1zJrmWqo6mDDBsnUrfXydjpKDxB7sslb54svTsFjUa4T2bRDh/NUfxgBjrp/
	 6LkLjNsmvWxYCPX9rJX3ZMX9fgNEawYbZJD7mi9Yk4MYTQQQefxvc2RwiLhrPlVLgx
	 27vr2CUUczPmA==
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
Subject: [PATCH v5 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64
Date: Thu,  3 Oct 2024 07:28:04 +0800
Message-ID: <20241002232804.3867-6-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Build the Linksys EA9350 V3 device trees from the arm64 tree together with the ARM32 include to allow booting this device on ARM32.

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
2.46.1



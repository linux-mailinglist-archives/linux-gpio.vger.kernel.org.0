Return-Path: <linux-gpio+bounces-10732-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C112F98DF12
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A691C25217
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CE91D1731;
	Wed,  2 Oct 2024 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="TWpgOz8/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FB51D1516;
	Wed,  2 Oct 2024 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882767; cv=none; b=QECv6Gx9sPoHV2k4+71Z/Szqx9whhkF3zazRTXAbKR2fIUzir7Kdrtl9c+v4iVg5BsAYOA8G9CvbWsOev9//Uet/DbRhj2HPMRJK14Q9vCmMY7hqWl168RyipqKKHM6HQDzZJS+m3o6gVUg+IE+48MnsCAUiJcXksArLfr6wV50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882767; c=relaxed/simple;
	bh=UUNAgAv1R6DLPtknbTLKqD48NRSgGCvWXZNp6Cu8omw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPWUHiOZtW/pYAjh6E1CNEyIQe/PFrNrrrkoRzBFB0KkMRDQpa4lnCdyMSJsHVzm/KDa2hbY0fFTJtJ9DFZPJnPj9BrSD0pPPzXZzg3AsajXWG4sj9YthtnYOWCFNCbDg0TxCp8yyRbxY4WSkZaCZ2WOPyw3gQkVYuOPS0VnOTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=TWpgOz8/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D321C23CFC;
	Wed,  2 Oct 2024 17:26:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAgeXao0KEt7; Wed,  2 Oct 2024 17:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727882764;
	bh=UUNAgAv1R6DLPtknbTLKqD48NRSgGCvWXZNp6Cu8omw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TWpgOz8/e+xXXqWT8xZIektJSbGqGBBX9jNcKz7HWicYDdRKJZGydsNNJCjLQ5+5d
	 3fpoty6M7ghz6RxiKoTM/eOVfiX/vUhv47tOStEtJRkC9ichfrJMgJGeDspkmbFBzY
	 i/F+gVdAI7Jwiz6FujPhbt9kDYNffO49c60I8lkGyhA+WgC6jZNYWhmUmEcn3e/oRR
	 BVllIytbNaaKdIr9EiD4jzdhcvQLvt0SqamOplFO8dqg9xKudcpYNFzIph3jxprBFo
	 /DN5ziIdPzo/FS1w6N6L8LKGsf0CLtHiqO5JsZkf/H4V9AO7s3K4iSlS9pbguzm+0S
	 3B78w3mKzBKFw==
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
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64
Date: Wed,  2 Oct 2024 23:24:19 +0800
Message-ID: <20241002152419.30364-6-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
References: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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



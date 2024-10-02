Return-Path: <linux-gpio+bounces-10758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17C98E6E9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 01:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09D62826FB
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 23:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D047D1A7042;
	Wed,  2 Oct 2024 23:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="h2HkQnxJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2505A1A256F;
	Wed,  2 Oct 2024 23:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727911787; cv=none; b=nbnxFp/DP4We+0YAGxtQggVq3Sqoer11yKysmW0en5gkK96Qy/TejNIwrMJTTVwcRPJ8zhadL7ca0Wap9IO+4yl0fvs9V8LFDiXd87EyVvueJyGbSElUcidRLW5AeGHzwGo3fj7pDQfCLAxCwqPsC6cyWpwL9+e+tLQq1f3f7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727911787; c=relaxed/simple;
	bh=wUi5FazQh9l5954YKYfpIcL7gMt40vrjwoWJyXerfzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSNK9+lzbo8PnRV0WrIUjMxInGIF0OeM/WIChXL6iw8yJ5p0tVfAw7sW7+cO3vCp9eNF48QXkN/O5bqL9Febx/hnxuwnuh1bsJp+74r3v14P6fuSSS48Uu/NQJkI7821w+k0tt3uVEVximAPI6rLo6APX6c+fqPlZ23Qp0Z2ZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=h2HkQnxJ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C718A23D68;
	Thu,  3 Oct 2024 01:29:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvM71xnTMZk3; Thu,  3 Oct 2024 01:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727911784;
	bh=wUi5FazQh9l5954YKYfpIcL7gMt40vrjwoWJyXerfzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h2HkQnxJw0ISGRG5GSGOhz4ttci8Uv8j6bEt5ZYeQax6gEJeRw0Po+Nw8+Gtqb+y7
	 PGMr7o7XE9oApQqE5lwZAvlmrNgH7fXrPmZkZkYLeqH5s+8RZ6AACualgSlfAqY6+G
	 EaOw1CgBU2OCXSSQN/IxW36mgbqXh/JVrju2abAs9yLt3Hm24/Nc3btRDcXNI1xNxY
	 UbE91PDvsotBvKgErqT2ohEZP5/5Xv0afIKTkQvvvuCiuipXRBA1YQHQxyX6nspkjC
	 mhLxwxUbrAAILacWM4jPwnUoucFEX5IaqoSe+rOmZEcIi6fq0fA7GARczgrK8PDAoA
	 y1xzKdFpSfxyQ==
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
Subject: [PATCH v5 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on arm32
Date: Thu,  3 Oct 2024 07:28:03 +0800
Message-ID: <20241002232804.3867-5-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some ipq5018 based device's firmware only can able to boot
arm32 but the pinctrl driver dont allow it to be compiled on
arm32.Therefore this patch needed for those devices.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 drivers/pinctrl/qcom/Kconfig.msm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 8fe459d082ed..65cec6c50994 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -24,7 +24,7 @@ config PINCTRL_IPQ4019
 
 config PINCTRL_IPQ5018
 	tristate "Qualcomm Technologies, Inc. IPQ5018 pin controller driver"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM || ARM64 || COMPILE_TEST
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
-- 
2.46.1



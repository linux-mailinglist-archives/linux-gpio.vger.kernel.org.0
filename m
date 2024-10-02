Return-Path: <linux-gpio+bounces-10731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6D198DF06
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBD4F1C24F30
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7B21D150E;
	Wed,  2 Oct 2024 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="vqzZjQ3a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5441D0E35;
	Wed,  2 Oct 2024 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882764; cv=none; b=fobcl41UlrSzfZ04l5aIbjmx5GWotNXWMCDOAdkkqMueLIkJ23d47WCh1STsNB21ivY5d/UlHLu5GKAXtaKWNUKPfgdrpUNxISLsRTo3oCpvPvNhr+0b5bn4uPVZ2BxBfEm6LXhLHWCXVINx6ruy0Xzc8y6YLJU9hZVHaZVopCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882764; c=relaxed/simple;
	bh=wUi5FazQh9l5954YKYfpIcL7gMt40vrjwoWJyXerfzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nw84TQKRDm8xMP9cypqVkI5+IEfG6+q/WpuyP3LTWUaeOOv2P+7Z8peY1lsrjT/JCTpZx3gLRGHkdcLITjnhj2IH5pg9Y388DyJ3AJxutP9v/XVm0UxBITYP1zr/gYubX3Y6x5KVGKTuMZ0k41DWElnsy4f/hJ+fRe2B1gjAo20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=vqzZjQ3a; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E19E323DE0;
	Wed,  2 Oct 2024 17:26:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkpAyBOORHPh; Wed,  2 Oct 2024 17:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727882761;
	bh=wUi5FazQh9l5954YKYfpIcL7gMt40vrjwoWJyXerfzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vqzZjQ3asJSPPcfbKxCW/TjPl4cCi4Aih+dpIwlrBfaY9NOWyojTe0COd4xjUqdmo
	 anBez1TSiO2axVSqKngKz+QxGOqs6ve+aEZwgLD7d5MqIgRWK+xyA3fJyBubc727Sx
	 7SAqJx7XG5QSfwrmRC+GrhSvMXtf5p/RnI6oO70eiL6IVgXFfO3ziygYHzjcb7UWZa
	 7h/ToFh8XP8HC95vY6zL4k6I4QslQiQ7ULm59xmFU1RxGgpkluTI/YHwKQhg8jbsDk
	 b03NhEYTC5VUGv/hVYSWRx8Z45c8AhyW9MpQYi/8oBar8qlEOBmqrzEFbdg/UpV9ME
	 O1P0pN6k+BdXQ==
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
Subject: [PATCH v3 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on arm32
Date: Wed,  2 Oct 2024 23:24:18 +0800
Message-ID: <20241002152419.30364-5-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
References: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
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



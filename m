Return-Path: <linux-gpio+bounces-10743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF00698E0E6
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 18:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEBEE1C23E87
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5914A1D3575;
	Wed,  2 Oct 2024 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="t4pJARMh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67301D3567;
	Wed,  2 Oct 2024 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727886602; cv=none; b=kdT76KBIwp74gKA6ec+CmxOS62r9mn07+zeiFFRlGkCYsHX9KW90fie0zDw4E3YP2zS9gBsoYuTkQGjfz3BJLQb2QU0sC13rHgu+z+0Rv3aymADaINTMGlg0126NIhITo9VDD5eZ1CZ4kgo0eK2vyUChTC2K8Hr01Bdg8b4VeJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727886602; c=relaxed/simple;
	bh=wUi5FazQh9l5954YKYfpIcL7gMt40vrjwoWJyXerfzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUX13i9upjXSlRPizOuE+FYy8fQ6h4Z9b+D+01uE16IXkkWtjHyZgODufZ3XXYSttiZS6ZDObv8fnn/Xz7t5p9DVuAMHXA3LEVTqJ28/LNounJpxI3xV1rbrme/XwpVDlt+hc/xHamHCt5B9Fv8SLodCTYcduCkL9C584Ejbx3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=t4pJARMh; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 36EA623D4B;
	Wed,  2 Oct 2024 18:29:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hunYhhxkS--D; Wed,  2 Oct 2024 18:29:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727886598;
	bh=wUi5FazQh9l5954YKYfpIcL7gMt40vrjwoWJyXerfzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=t4pJARMhD6fJ2QyknBTsJnRdQLglg5FKA0OnuJUQuhcKILwn5tPcT1meEgZFkhO9A
	 e2GA5XObBTSSt/0Ql6n3BhblaMv+dMuDkqM0bzt/zyRDC+pB7S4NdaT0T0FwcvqU6c
	 Z0HEs9ui2d2PehMzrsq/coqF1Kcd7J++2cmRd1auhkFrza88PJRA1RuZvNRrtgetYq
	 uvFtr7knPbhuChozxlx5qBfRRROxp28Udi9zTd497dyJBrTmj/5UsvFN2wqOV0M6I3
	 hUF3UwG40XQmQCfasJcJP+nEMaMkfYKHleTJGloxu0p78ZjaK8OXr6jqsjage+IRcv
	 QxQ8/8OJ646UQ==
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
Subject: [PATCH v4 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on arm32
Date: Thu,  3 Oct 2024 00:28:11 +0800
Message-ID: <20241002162812.31606-5-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002162812.31606-1-exxxxkc@getgoogleoff.me>
References: <20241002162812.31606-1-exxxxkc@getgoogleoff.me>
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



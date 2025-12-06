Return-Path: <linux-gpio+bounces-29311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF203CAA104
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 06:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1236D30BF805
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 05:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45499256C61;
	Sat,  6 Dec 2025 05:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="bG+/oVHC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m15574.qiye.163.com (mail-m15574.qiye.163.com [101.71.155.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEB022D9ED;
	Sat,  6 Dec 2025 05:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764997742; cv=none; b=pN1BZSYCpsPhZU7XqsTHiK4Mwb9Yel/hbdLmzQS6q/EYZrQgdwd7zZfB3SV7mQkxgu2tqzkI28kltzio8N4GtZD984ZVqyV/kT0zUglsm3z3krJISqBf06uqs2VostbIiWQxYlW7yfikAhH45j4qa2/N2AAaoajxdSw6QVYLy24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764997742; c=relaxed/simple;
	bh=VM4qK9hHgsGIsMvb0AelsdSMqjgiki/P53bECjcqn3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nEB7hY5I4CS4Ajkm3jmMU1dlwbPoT4KGKQI9H0goOaLwU13DoYCLQIlVUAy1xmgfMULdbPdG+seALBiDrUNy8TFlGnZhxPT7rlYtGzLQMjtSq91U6SlqsWimiomyXh3uFaB6OxFJdWHQ+h05ptihdV6sBe+paMrHVd00OciXFAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=bG+/oVHC; arc=none smtp.client-ip=101.71.155.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c3493a61;
	Sat, 6 Dec 2025 13:08:47 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/8] dt-bindings: pinctrl: Add rk3506 pinctrl support
Date: Sat,  6 Dec 2025 13:08:37 +0800
Message-Id: <20251206050844.402958-2-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206050844.402958-1-ye.zhang@rock-chips.com>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af21006a009d8kunmae94618c4ed3ae7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRkdHVZJGBhDGU9MQk1IGE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bG+/oVHC+FD2dNeKBHi7ZwwuxQRf9EpErKon41AD7ic+dUl+vm7z44dwS/EnRlYYtxLLGWyrErjWN0O2iH6pJ+20tb1tlfYNuJ+vVmIQRiQLQyYfZHHz3DK3JlhmWwr9ZleG1iyr1xA5+bDGNX0pRX5lXQurCrOCcBL+j292TRs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=0Db2q6dT/j6RKhINW0J1Xu2aTYUEmZfbY9ZOLYGcFW8=;
	h=date:mime-version:subject:message-id:from;

Add the compatible string for the rk3506 SoC.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 125af766b992..76e607281716 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -44,6 +44,7 @@ properties:
       - rockchip,rk3328-pinctrl
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
+      - rockchip,rk3506-pinctrl
       - rockchip,rk3528-pinctrl
       - rockchip,rk3562-pinctrl
       - rockchip,rk3568-pinctrl
-- 
2.34.1



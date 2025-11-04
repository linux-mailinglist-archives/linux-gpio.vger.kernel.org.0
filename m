Return-Path: <linux-gpio+bounces-27997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D030C2EF05
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 03:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E0E1897095
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 02:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E42244679;
	Tue,  4 Nov 2025 02:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="HrOyhuTO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m15579.qiye.163.com (mail-m15579.qiye.163.com [101.71.155.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A9225A34;
	Tue,  4 Nov 2025 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762222671; cv=none; b=jab/t0dqImZ7i9GRRWv7mfrhdbQeaLMJiNNqyzixzob4N5YOkRjluaXXqyQwCEn//95GVPQf2SdwB0f2sjlFbldW4WUN7PNQ+1Juyg02Q6XviMLcZ4sdQzFNaLcwkSP4j/LhBTCGTHQ3m7d5yX84BArdmfq3pKGmqvR67gtAw00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762222671; c=relaxed/simple;
	bh=RsxIjhNN4uPtmXDWPB/ZiVaEArVaJySjVy+lRL4cDMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gJ9ePaAakSca3BXuO3w/AYVMr8TamR/Kn2NOglQTczS/KCUV6oEc7hkTt5Lpd7dq3EyC69XAyN09fd72gmznBtxK+NOu9JkQlA5o94iHLOOdvW0A0edvKVjNG1Q0/wsU3MJ0iPsGmOcDlgiZySy6tyeBJ41wB7ozL0cosgqPrsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=HrOyhuTO; arc=none smtp.client-ip=101.71.155.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2842e982a;
	Tue, 4 Nov 2025 10:12:30 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v1 1/3] dt-bindings: pinctrl: Add rk3506 pinctrl support
Date: Tue,  4 Nov 2025 10:12:21 +0800
Message-Id: <20251104021223.2375116-2-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
References: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a4ca3203109d8kunm1bdc99775fc3a91
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkIZH1ZNT0wYSxpCTkgeQklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=HrOyhuTO7iviPCjMfMdD4/AjcqHPrg7uoX9MATp4b+ePgwbqsCXwFH8/oiQ9T4B4xs3sSdzZdckf8wsIbhpmZnbGHvMjvmvBDUoTFicE5eEZTZxwKkIKJew9AkYisN+GN+Lmaxf0rhDZp3aI0+brumC3vBHjgi2ervPxJofVxIg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=JZ6RpDVyj0dWnJPXPNhJZWiSuXXFg+je9l2T/ldJgjk=;
	h=date:mime-version:subject:message-id:from;

Add the compatible string for the rk3506 SoC.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
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



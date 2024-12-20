Return-Path: <linux-gpio+bounces-14054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CB9F9060
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 11:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B80F97A1D41
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 10:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AF61C4A16;
	Fri, 20 Dec 2024 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="QvguwkaR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1973177.qiye.163.com (mail-m1973177.qiye.163.com [220.197.31.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301481C3027;
	Fri, 20 Dec 2024 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691128; cv=none; b=bn4AxClHLVLBfMhMcLUo940nskY5BhojHrskIQY4ERC753h7jpeUoKoV4IiztNEFpuQeAhOYMzVi8gOCaSEV8NF9phc9qLNK3EENmOymCMEaiPvkRvK8s5wAc/4pE31rD6fvgLgIRqf4uX2qoMIv2XtOMleWC4awaeSroJPOMyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691128; c=relaxed/simple;
	bh=ZBLCYhCSoD7pW+Ub0/1s0qdW9maOConMFHDfc0YErXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F+TKt0EIO2U7bTc7eZpSPi2wW6qI3ydxlqDUUN86LKfMTp9++fgiBqDAgEheuQUh4v4c6wHco49PGXHlAG+7RobmKNJ7aRdoqrmKx7su5A7eWA/OCV0IuqL5t4+X3XeOQ2WlQctrwD17Fd3xX1YXQSMF+I+J9ixiEGVMptlR/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=QvguwkaR; arc=none smtp.client-ip=220.197.31.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 65699807;
	Fri, 20 Dec 2024 18:38:36 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/38] dt-bindings: pinctrl: Add rk3562 pinctrl support
Date: Fri, 20 Dec 2024 18:37:50 +0800
Message-Id: <20241220103825.3509421-5-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220103825.3509421-1-kever.yang@rock-chips.com>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0kfTVYdQ0hCQ0xLH0JKTUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e3a5d73a03afkunm65699807
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nj46HBw5PDIKKgg1ThwIMSgP
	TiEKCkNVSlVKTEhPTUJKSkpMQkJCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDSUI3Bg++
DKIM-Signature:a=rsa-sha256;
	b=QvguwkaRAR+DxhHrWtFUyQq5fDOxONOwftlH9eTUC3KB/+D29ccZfPKoN+FX9tLmHZzUwDQjhnx5JvgqYSLv219I+keluYqIaY7e4yCUh3IpPO8QPI/ozAtd5kVmZKtFN7C+VzZLrZB1JY1Ic+lFoquYvW2QrAdbLmxDH14uoGc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Xsz5HN/Gm6vz86vevKnGFWkVhhUxca+JtK1d2I18t4M=;
	h=date:mime-version:subject:message-id:from;

Add the compatible string for the rk3562 SoC.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 6a23d845f1f2..80a2b1934849 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -44,6 +44,7 @@ properties:
       - rockchip,rk3328-pinctrl
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
+      - rockchip,rk3562-pinctrl
       - rockchip,rk3568-pinctrl
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
-- 
2.25.1



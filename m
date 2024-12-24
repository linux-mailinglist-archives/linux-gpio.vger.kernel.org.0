Return-Path: <linux-gpio+bounces-14195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B429FBB48
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 10:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332EC16329D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 09:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1811AF4E9;
	Tue, 24 Dec 2024 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EvYTmyXb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1973170.qiye.163.com (mail-m1973170.qiye.163.com [220.197.31.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44BF8F66;
	Tue, 24 Dec 2024 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735032933; cv=none; b=HkKDFeKdDbWCWOIFX/YVPRS+ScfD3mnO6SLDbj2eosPzN0CER1BiwlmOw8G0CBhw+u8frCknSzqa+XkpbdzOHQc5S785ILpoUg4IGjwyG7xEckmz5jIao6YfFumy+l2+fmbA0cpbjiuNPtQeF3wmZT/d1FxqTWn7tJvpqTS7dpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735032933; c=relaxed/simple;
	bh=wU8Mto4kUdAB7zsUjq2LlOAu+AdMs9RPtHmZTlheWa0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c+tYwyhCP8ycTxZ4FqBpg/niUgD1B7F0It7zPJ3/gsaGmrkbFfOn4oYc9dEFerGkS1nZ/4E2o23rQik6fgbqu0UAj7XtnYEX1SL/AvvTjTSX+mzHgjkKYLuEp2zLce62K/sTHqEIafi/0s1U0gefLKUStE5rekDsSQ4iMLqTWUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EvYTmyXb; arc=none smtp.client-ip=220.197.31.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aa61eda;
	Tue, 24 Dec 2024 17:35:26 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: Add rk3562 pinctrl support
Date: Tue, 24 Dec 2024 17:35:22 +0800
Message-Id: <20241224093522.3815562-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkIaQlZCGhpOQ0hDT09LGk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f805708e03afkunm6aa61eda
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCo6ORw5ITIQLkoULRcSHywO
	Tg0KCjxVSlVKTEhOS0hJQklMTkhPVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCTEw3Bg++
DKIM-Signature:a=rsa-sha256;
	b=EvYTmyXbZro3IeFOyCmPtgX1IanyQr3iP/c29QVqhnRNoSliEFck8j3Ks3bBK/Db4vTgBUnw0eLC0euTDxm17CuYnnALSKA1MrR6O7KfSRieE9B5ka6XD7+fK4U22ZFj5rWDqsIg9RmCU0BvYH/MjQhnIlF7Gf2yUiznfuuvsGQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=rtJBZYupoCo2RnfjzdA4ZjMJUUTzMcKgN9dhJSGNSh4=;
	h=date:mime-version:subject:message-id:from;

Add the compatible string for the rk3562 SoC.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- collect review and ack tag

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



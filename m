Return-Path: <linux-gpio+bounces-29612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E255CCC2433
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 12:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0A97309AF33
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 11:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1861C34251F;
	Tue, 16 Dec 2025 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="kvt+IW1J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155110.qiye.163.com (mail-m155110.qiye.163.com [101.71.155.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2067D341645;
	Tue, 16 Dec 2025 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765884371; cv=none; b=b5nrwronTLmyzbR3sIg7i6PRlcZniW9mw2TDwRp6Cl9JZCYKj8XISDn5fSwD5FS68hvlFQKbgjhdctPVX5C0NGHBJ6hHzbOFkDEQzsKaGWTm1KpWYJwNm0cCZY8z/ZX9jBUJkZAoWDPTCFKnyNpJ3tDa3oIXoaDnqOV/DNiPVuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765884371; c=relaxed/simple;
	bh=2CgpCkR4mFQnMg1tfTDtO1yhqQD4dN15efwWgXvrz2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7P6jUC1XqweQFqnIndDgHaQAaZZb9zIGjgUBYh89VEUugMySCTH2ZHOjFTCU4lwyNg321ApigaOJF/vG4Ruqg8mR1uBQziWUhOYb08jHMjpIGgizsikeq/R6imINJa1y91Weya1VZF5Rl7hJZuM8tyowqlIwRAFztbuQuwCMiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=kvt+IW1J; arc=none smtp.client-ip=101.71.155.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d6ee1f91;
	Tue, 16 Dec 2025 19:20:56 +0800 (GMT+08:00)
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
	tao.huang@rock-chips.com
Subject: [PATCH v3 2/7] dt-bindings: pinctrl: Add rv1126b pinctrl support
Date: Tue, 16 Dec 2025 19:20:48 +0800
Message-Id: <20251216112053.1927852-3-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b26e4548009d8kunm7ab62e1d2a7b1de
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxpDHVZIQx0fTkpCHk8YTx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kvt+IW1JXAl2icndDqEAHXjNFQHLqvWLZZeqkPZgHKxUVkqQ9t6aJg6mdzGl/68nk37KMcepkJ7P8FQw210YZIG4rMLd9/7dxsM8UGN0o+Y85zTpG4JSc54iVAz7mvPoU5RRsa7SA8R9kdKdBVOEPIt5UUZBROAlRu6jrmBQu+M=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=NVZd4LbAX/ESPe6p2DZyRdPbrAlNEDUy2MXVhXGH2V4=;
	h=date:mime-version:subject:message-id:from;

The RV1126B is a new SoC that is the successor of the RV1126. It has
different pinctrl registers and is not compatible with the RV1126.
Therefore, add a new compatible string for it.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 125af766b992..97960245676d 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3588-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
+      - rockchip,rv1126b-pinctrl
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.34.1



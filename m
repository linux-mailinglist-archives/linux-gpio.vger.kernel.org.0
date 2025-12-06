Return-Path: <linux-gpio+bounces-29312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B6214CAA0F9
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 06:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B578302B955
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 05:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CBF26FD9A;
	Sat,  6 Dec 2025 05:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="j0DLJk/l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49229.qiye.163.com (mail-m49229.qiye.163.com [45.254.49.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E4E22D4DC;
	Sat,  6 Dec 2025 05:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764997749; cv=none; b=kr3DlkW6MwkXBxdwwHOspHMpVqtYNSqwsPUovolHfvlc8XPU5CqIvP6OCMKIC4GVhXhidtQqnGaYT/8Vv3TO+hJTEOCghSiyMi93Qw+op+jzHREG9036x5O3fW7xvMvqgAYjCp4heIKgYwYXtEchbEzW2UiCxyp8PTXOdxeIJmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764997749; c=relaxed/simple;
	bh=hqOrvbSQtqVNrBdE/mE2ZulISQKABmz8cTxz8v0MsiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PRbW/afD6WOGj9UNxigWk58RRlQxREId9wKfFJGIZeE05qiXduljJoLfaCH3nXS1pptaJSLx36U5PhrKVOzPBkE6O/xqAbZ095P9BdzSbLA246rHclwJCzpDEeVggKtPmKa94RUUTP7oZlkyC77Iqj+KxYGDSvwkdz3EJoS6G68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=j0DLJk/l; arc=none smtp.client-ip=45.254.49.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c3493a67;
	Sat, 6 Dec 2025 13:08:50 +0800 (GMT+08:00)
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
Subject: [PATCH v2 3/8] dt-bindings: pinctrl: Add rv1126b pinctrl support
Date: Sat,  6 Dec 2025 13:08:39 +0800
Message-Id: <20251206050844.402958-4-ye.zhang@rock-chips.com>
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
X-HM-Tid: 0a9af2100fed09d8kunmae94618c4ed3c65
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRoaHlYaShgfSh8ZSk5OTx1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=j0DLJk/ldHyUNN1Lze38fkhfQWx2G4XeWPjZ5OjSM0RYbHcXbX4h3Ij3/bceXUt8wxI41y2S0+XQM1sjkgk9ol1pH+noROEq8YtQ1h+S0BnBqRAtpFI2PB+9PAO3HDlDQzpZxLABrV2vYPFl/6FJnxYbU34cM+D5ou7UgzKWSBE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=peBVdRDCYMluVzoh6VCOVP/33y4SVuD35nSziJTXUi8=;
	h=date:mime-version:subject:message-id:from;

Add the compatible string for the rv1126b SoC.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 76e607281716..93bf8f352e48 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -52,6 +52,7 @@ properties:
       - rockchip,rk3588-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
+      - rockchip,rv1126b-pinctrl
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.34.1



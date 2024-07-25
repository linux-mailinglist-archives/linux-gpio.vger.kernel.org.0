Return-Path: <linux-gpio+bounces-8379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364993BF79
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 11:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D75CC2833CF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 09:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27F3198E63;
	Thu, 25 Jul 2024 09:56:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231BB19885B;
	Thu, 25 Jul 2024 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901377; cv=none; b=LOgs8WqrmqoF615QFcNrZcgZ+/G7RElyKOVNR2pV2HL2FdIhb7iuPptw7meTjNy/sYepvyUnpFCkkNXEHHvaNFL/XaZv28N6pBt4kl/XUq+jMpGSS/HztY/rkrjzMyQSh8NTrRqYc/Wa4+xCS7U/pp9rfLbcyr66k+YS6U6kuI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901377; c=relaxed/simple;
	bh=bf2ETZekMzuFKL15tL0ufU55ytWDYt64917d2gw7GhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d1K/4j/nhM7VdHbcBwqhoCM8OnprCmvFfdap68sapjMhuSn9BIzmFWECbP3RfrfHS2rgpDzf7C26ENuMjKg+Qw8kn3Z/IlcXk5dJHwOtWFd7ROFRH2Z6rz/yIKaNIq90Me8VxYYk23wpYOtsWpyCKz0jXY5sWR5F2y7QBxQiC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="216707656"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jul 2024 18:56:15 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B7024007F33;
	Thu, 25 Jul 2024 18:56:10 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V2 6/6] dt-bindings: pinctrl: renesas: Document RZ/G2M v3.0 (r8a774a3) PFC support
Date: Thu, 25 Jul 2024 10:55:30 +0100
Message-Id: <20240725095530.5199-7-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725095530.5199-1-oliver.rhodes.aj@renesas.com>
References: <20240725095530.5199-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document PFC support for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
v1 resend->v2:
* No change.
v1->v1 resend:
* No change.
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index 5d84364d1358..cfe004573366 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -25,6 +25,7 @@ properties:
       - renesas,pfc-r8a7745     # RZ/G1E
       - renesas,pfc-r8a77470    # RZ/G1C
       - renesas,pfc-r8a774a1    # RZ/G2M
+      - renesas,pfc-r8a774a3    # RZ/G2M v3.0
       - renesas,pfc-r8a774b1    # RZ/G2N
       - renesas,pfc-r8a774c0    # RZ/G2E
       - renesas,pfc-r8a774e1    # RZ/G2H
-- 
2.34.1



Return-Path: <linux-gpio+bounces-8354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CF939F71
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2304C1F230C7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 11:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8B214F9DC;
	Tue, 23 Jul 2024 11:08:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156BD14D29C;
	Tue, 23 Jul 2024 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721732902; cv=none; b=prh/Vg8x2osLlJ91N9e0CRN8SDynQC0Rc10wbHAnxekIsoST6+qRwSPoLR6JTepcbFBcX0cQVrHUcjSj07bZtd7rslZsrmNx2190Dr1Fa0+R8RUA1o/QqcEtYiJUSnndwqFJFvlCfCZPu7HyMZbZVDVCX4rAwvYSEk0w8aQ/OYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721732902; c=relaxed/simple;
	bh=UD+CUiNDbBhUvznD+O3qLj2i1Dk0CGEq12ZzBvceWvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jAJOOGei1auejxYacmArz9AzdBsBKLcW2fjR1EFUuwteLkuC7J6gvzj/UgdP7PzzmybUfMRoI/sdPNluQ/M1cQr01m9BG3Ya2Fnwo3Ummp0j3t6JDyk8iCeUOBL852Z7pyitrPUhnK7qwnnbTJF0ZCYsocmyzqDS3ash6YgIlps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,230,1716217200"; 
   d="scan'208";a="216331991"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jul 2024 20:08:19 +0900
Received: from localhost.localdomain (unknown [10.226.93.79])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6592342F3F16;
	Tue, 23 Jul 2024 20:08:14 +0900 (JST)
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
Subject: [PATCH V1 resend 6/6] dt-bindings: pinctrl: renesas: Document RZ/G2M v3.0 (r8a774a3) PFC support
Date: Tue, 23 Jul 2024 12:07:33 +0100
Message-Id: <20240723110733.10988-7-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
References: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
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



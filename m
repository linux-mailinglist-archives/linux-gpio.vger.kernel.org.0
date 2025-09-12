Return-Path: <linux-gpio+bounces-26084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B71FB553EF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 17:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A07831D65177
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 15:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14B731DD83;
	Fri, 12 Sep 2025 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q9z7mQDi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A6231D364;
	Fri, 12 Sep 2025 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757691674; cv=none; b=EwkfhPAUwWzys0qAI8c4LO4YL6urBozPByE56pbTNYBSiM4EPIGFQWxEtw5M9cPpClkRQKsh4l/To8YOCkWIvanucInfCfdD3OLFPt0tme0ls5D8wF4DT+VH08yDL9sJZZFG5f7J0LShlEVhhV8HEjRVW1nu0KLk0us+V6yjPh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757691674; c=relaxed/simple;
	bh=qmMFYrd/PSzL8e6/VRTNiSiKrwxX8Xq6GZVbqDFar5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JeQ+nbnAD0n42RD/ibsD2UmZAU5SMXeIQKu86YCDuTAeDX05NkXvZuwuob8+iOyz9dt0F/Ic6SK+0cWzqOct2PXf2lR3N+LGDJmKE4xtk6C320Rk4/hODEYJxPJkMSIKoPd3HZM/8YFYh74ptcN+kh/4VlnrBTUMVy/sRlcPWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Q9z7mQDi; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CFeiZC634623;
	Fri, 12 Sep 2025 10:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757691644;
	bh=HD3ANW+/BT63gkCknofN+lfkL9Q8HADeIknYUxJB2Y8=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=Q9z7mQDiu/Y1+5kPT2vQkApITYc+PsSuS7VEcgtCuQBLs+8cUygYM++dNCe5BDfJY
	 fBdA2Bx1ZaOPlVmG+ykab/+3FoQJwJ28kj9HUvYTyPYDqC9rCeuca9zrczn00WlmBt
	 OjfSvn+pB178Vx24b0PlJgg5pfrQf1ceeQ4Dfkqc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CFehXK1398277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 10:40:43 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 10:40:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 10:40:43 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CFehca4123678;
	Fri, 12 Sep 2025 10:40:43 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Fri, 12 Sep 2025 10:40:40 -0500
Subject: [PATCH v6 1/4] dt-bindings: arm: ti: Add binding for AM62L SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-am62lx-v6-1-29d5a6c60512@ti.com>
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
In-Reply-To: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew
 Davis <afd@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony
 Lindgren <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=bb@ti.com;
 h=from:subject:message-id; bh=qmMFYrd/PSzL8e6/VRTNiSiKrwxX8Xq6GZVbqDFar5E=;
 b=owNCWmg5MUFZJlNZSfnnCAAAXH///7/vn7v2/f/xMC6b/d437xU26o+P/me3X+38v178/tewA
 Rss2Q9Q0aNGjRoANDRptINABoNAMQ0DEAaAMgBkGgAyA0wEaNNMmRgjaaQyPUDJNA0NAAGhoBoa
 A0AepkAAaaDAEaaAeoD1DTQ0ABp6j1GgGQBpo0ZNNMh6n6kQ0YmJkGjQMjIGgNAMmQxNGhphAAM
 gyaMjTJkAZAyAAMmjJoaNBoaNAaY9UDBn0QgDpwsUlFvARtKmsiYq+F6chzhY8b4wrdEjchC61w
 Tl3xp0wdhMnkLeDRYZhxuQ4oQj08KKWsBDXc+GMCRdOeU/tHmDlfsKhzhoR+U5WgMgWs2LTcacI
 A/EJ9H12SANOzexSysNMqiQtWygF3SYQ5d+n64NisX5hHG78wxSYKHTrAmuhhLSLWd1QQ0ZnShO
 9kAEO/Hapbo1OH6ETo3rlXNS8x0QpuVdSzN2JMJ7v8/twd2hNYSTBxGq08rzXxqBDEYMmDoJaB4
 U3UD96vpa+RNO9KpmQTqaaG5Wth+Zsf+ZRJr7CRo7PzIYUB+HNLr+kryGBEKq422GiWT+RN/1K9
 J6YHxbgcL5/R+NSHivKMWuBG/xKSw8QRStSpogn7hFUvbIKC/weZEFYy9A6Lx/AAEr87/ErPknY
 jyBOHxAM4AyU/xdyRThQkEn55wg
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add the binding for TI's AM62L family of devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v1:
 - separated out devicetree bindings
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index e80c653fa4382acef964e182ecc4ae5445088936..d916c627eb619d16124772df5aacac9354126808 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -37,6 +37,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62L3 SoC and Boards
+        items:
+          - enum:
+              - ti,am62l3-evm
+          - const: ti,am62l3
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:

-- 
2.50.1



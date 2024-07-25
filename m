Return-Path: <linux-gpio+bounces-8380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FAE93BFAF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 12:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F20D5B22168
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 10:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BFC198A3B;
	Thu, 25 Jul 2024 10:06:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C6D198A10;
	Thu, 25 Jul 2024 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901982; cv=none; b=KRfoaAv5x1T1RiHqUT9oWCEJmAKBAn5fE/3hs6ltEa/ThEerJHPVjdYWDSS7MUx0t9PwcnYvfi+6uI6KFCqnU6QKz+ZEbAPf+0IyPw+j02CoK2M4LWbSvu2w768xYdCBImjeYZu/eS00BJqGoNjtVpDNazlhFTI7VFO+wkA8edM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901982; c=relaxed/simple;
	bh=X+4SRXB1ucuNvSVmZVzTx9uQS0D3XiGJcVsJmonr3Lo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K5MGWzitNKO/BD0xn+PiTAjPItP1YUctnDUT5isa1B8Trl6L0MEx5xhCAXzId0moyrvdH6YtVWT4WU7hBpWunoaTNbiCTrzUbJFsK5+MNumFObdt6MuKFYb0LhnUg3yI4KCbjumHBG6jiwtV7TCgZLPNhjZwv+r+X9NXe6DzS+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="212750899"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jul 2024 19:06:19 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 22D7241F6EAC;
	Thu, 25 Jul 2024 19:06:14 +0900 (JST)
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
Date: Thu, 25 Jul 2024 11:05:34 +0100
Message-Id: <20240725100534.5374-7-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
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
v2->v2 resend:
* No change.
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



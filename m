Return-Path: <linux-gpio+bounces-8353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3E939ED8
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 12:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16D192835C0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 10:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CF114EC42;
	Tue, 23 Jul 2024 10:37:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C41213B2B6;
	Tue, 23 Jul 2024 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721731058; cv=none; b=emEdbqvfv0OsK/xibtjRq79RnCxbfzRzl5yk1VDvtc8lNBx4/awxOFa6LCSn9mxon70tJaGVaUJK8fxI+8Bs7hXwWBzNu2mlGiTowumtWg+TD+3deE/XdYzQuUUtax+FFX/yBu5VuSCYEst8V88ODLWkhh4tR3JBhJqqwopm4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721731058; c=relaxed/simple;
	bh=pYAQgXHqfGoNecgufy6PEoqACfymqP7TbUgEagpXDSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BC+XMy18eFMFHnUYcOiVIv8mGVVQ3sXOtwIOiLCQ7TBCbgib33BdQdaR/ll5HcYPwVEIXSa+6Qjkn+xi81Yvfyu87lP04cqyqcCdODwU7MDDgdq3NqTjVRevW9gWV+JCoIN6oPVSBzkk5lFXGv7z2ah7OTZDKak4IFRPMy37OV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,230,1716217200"; 
   d="scan'208";a="212369766"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jul 2024 19:37:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.79])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A498840065AD;
	Tue, 23 Jul 2024 19:37:31 +0900 (JST)
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
Subject: [PATCH 6/6] dt-bindings: pinctrl: renesas: Document RZ/G2M v3.0 (r8a774a3) PFC support
Date: Tue, 23 Jul 2024 11:37:05 +0100
Message-Id: <20240723103705.9774-7-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723103705.9774-1-oliver.rhodes.aj@renesas.com>
References: <20240723103705.9774-1-oliver.rhodes.aj@renesas.com>
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



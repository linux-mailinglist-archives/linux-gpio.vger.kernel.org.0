Return-Path: <linux-gpio+bounces-26080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4BB553E1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 17:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AC987A89FE
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 15:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83C23191B1;
	Fri, 12 Sep 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rWbkDxrY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73E831353D;
	Fri, 12 Sep 2025 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757691668; cv=none; b=kHcNVVl0KpAmKN+upmO94PaPlIzbZL8mkAoNxr+J1dVswYsxxr7F+hn5dLeOeagJtXxfXJCKXwLZY0Un/Io78e2mrlvdrmiVplvyXVfJQFzNQLL8hrlIL+lq1O7wIntzucspkK1KXstQArrS1sfdCdVJ9U7ECzzoUO5+W4g+TBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757691668; c=relaxed/simple;
	bh=2H39zuVJpyFOu6Xo/z1qSGVvhDWeC4HP87orq5jKUb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RvZ/SBJwbwq46KCXsp8SZtR1yhLXCSFl+ioNhVR6FZO6jGFakIZT9w66mKEgnAnqZLbtdDhci65Z8NVp5r7vFJMbJgkuQ/5UVrAvh7lOrMhmGy2VEZXwB7Gh/6XBADzfBo8hoNRIvy61IkrsmGp0nMzDchRxlxj0k8JFXsWekPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rWbkDxrY; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CFeiwC1062312;
	Fri, 12 Sep 2025 10:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757691644;
	bh=6uzcexzhDJxBbD4uFG81aBzj+0YqbB9UwS45ynsElDI=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=rWbkDxrY/iv6LjOoOLH7iBVw+WMMGkWf5hNMlSkUNa2MLDlFlhvWTBviTg0NRRTW6
	 H0cDYCgLMAfLt2cfngcxQh8+SRQlwXjwPEgraDOG2ZaPj/QDNbypW7b3+4oQWd6A8p
	 If2wtSrATGSyg8sz++AB4fxtjF2apUHpJB4BQzdQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CFehJ62079624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 10:40:44 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 10:40:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 10:40:43 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CFehjK3820085;
	Fri, 12 Sep 2025 10:40:43 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Fri, 12 Sep 2025 10:40:41 -0500
Subject: [PATCH v6 2/4] dt-bindings: pinctrl: pinctrl-single: add
 ti,am62l-padconf compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-am62lx-v6-2-29d5a6c60512@ti.com>
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
        <linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=bb@ti.com;
 h=from:subject:message-id; bh=2H39zuVJpyFOu6Xo/z1qSGVvhDWeC4HP87orq5jKUb4=;
 b=owNCWmg5MUFZJlNZMxwjSwAAaP////fb2/8u/y371um//nN6x/r/1f63n+9r7v/907j/+fawA
 RtqB2oBo0AaaGjTQ0AyABoA0aANGgBpkaMhoABoABoaaaAGgDQehNAaGmR6QehqIA000aGgDQAN
 NA00NNNAA0NANA0A00D0mQ9RoA0AeoHoE00A0xA0aGmjTJkaAAGU0aNMQyDQ000aANDQBiMQZAA
 GTE0xGE0AANDAQNAZA0AA0ADIAaNAADB/Qenc7RyeMgOPeYOPnYZ1Ano0xirqqc+z8BoPnBAv4H
 OA7AurZUXvpM/hgek7mup95eeUtErojmFb7TkJUQbEmQVNesvslQZDBwQv21cl8sQsSx7gDKcIQ
 FzoDzZZSaUClBtLYXacmO3BEKo0U0liReSbI0wC+/1zCitc/1lUHp9IlvPml1POy4S8RprxwpYC
 BVh0uYFufiAnKNpTDA7E5zwUfycRHMowqbJpVsCgpGnN57CsqeecRrXuvlyZ6UayapFNtdBFG7j
 OJMWOggvDE4p71uOrOjTJwN+egDKiPTr0kwGeVrypAjMHjIiNWT7IfUzAgQjw68WCj4f4P/gvJz
 GW0N7fS4Wz+Ag8dkl+wwL+ZgFwEuwCEILVTAwBQzyIpPke/FHsWf6q0Q6CL5C4jMtFxjehW+eyT
 EAe7Fo32eULEQCURLA/xdyRThQkDMcI0sA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add the "ti,am62l-padconf" compatible to allow for some changes in the
driver in the future when needed.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index f83dbf32ad1838f25429e22bae14f6c74cb38d96..9135788cf62ec4455e36c58276a6875dc6dd08b2 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - enum:
               - ti,am437-padconf
+              - ti,am62l-padconf
               - ti,am654-padconf
               - ti,dra7-padconf
               - ti,omap2420-padconf

-- 
2.50.1



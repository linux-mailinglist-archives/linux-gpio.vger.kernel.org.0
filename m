Return-Path: <linux-gpio+bounces-34219-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN2oARdoxWl1+AQAu9opvQ
	(envelope-from <linux-gpio+bounces-34219-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 18:08:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 591C5338EB1
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 18:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B48A30CCFB2
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 17:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF35D4218A9;
	Thu, 26 Mar 2026 17:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+mF8fug"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC3A42188F;
	Thu, 26 Mar 2026 17:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774544571; cv=none; b=M5fkYDZbKTxVN/XNBTfiw9L4ghVq06tWwra9/iMZFMK1JGXg0pJWT4yC2ZLP7xtX22YMFsU4jQKVNu4GJZ17bFjIBnXmlVBIC2ZTFKnRtTtZYXXe2CTCM00REgNnOLyrQKRaeQbENd2sdDOGoU5auo2G5KK+Rb/VaNeMVnOYYt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774544571; c=relaxed/simple;
	bh=dVK9j2dBgt2rWRKVq4X+sMB8nBupf/jgz1nEm/jYh+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLx49RUfyiCx3FEq4T/5rg4RRsxbXdyIMjNJiUX1ddiNuxQPggQ1Lv1lahFjrIH/f/LCG0y91ZCx/pstExnw7xBSYpXG4KOQBcb7ttQM03uY8I38WZeMWi+o65AVJvzAYdXWPh2ze+IvG2+Hr9QhsErzyVg07chWiUFbkuTPAoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+mF8fug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20105C116C6;
	Thu, 26 Mar 2026 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774544571;
	bh=dVK9j2dBgt2rWRKVq4X+sMB8nBupf/jgz1nEm/jYh+Q=;
	h=From:To:Cc:Subject:Date:From;
	b=o+mF8fugnCRjiIoIWOsAi+qqtDanUGAWYaaSLZ7minURwrmWLQEbfzH0IQc+4qASB
	 54V/N7ntiGcwLMsjMQAtDig3iJ30hvLsKqf6NjZbI6IVL5j/6NFd+lyj+m7XzMjia3
	 R/QM4Rn5Dp944y+EUwKSKfCc5bWqCnZ/+iNLGobMdyBcqFxIxIGyLYtCKHkILlvm2o
	 1FdhlD45QYLHRaQux04zpmMWkljCOpj63eAWoUcPaj8yIv0sx/n/ysP5csl2G2jRYJ
	 V6iF9qyfXndlKwUI4p+WNvTQbcdVMOwKX6SQAdUM94fD/UVONVHhg5tZCmwuP3aDX3
	 6qeZ+9VhBLkWA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: fix microchip #interrupt-cells
Date: Thu, 26 Mar 2026 17:02:34 +0000
Message-ID: <20260326-wise-gumdrop-49217723a72a@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6D0hevyQa5hkS84rTtM1KHPP+BS+Br9eSGd70Vnci7k=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlH01YFMTAwcQakFc1WLH6inPMse2rKviCf+gfdRts4K 6O2L37VUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInUqjMy/NF7MLdy3brIEw3c 1ubSotnTH+877tjgkDVj6i+tw9NzfjL8FeDe88X3XeoNEaPlZ9rvnHijeDjFzVnDiq3p+4+y30q RbAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34219-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 591C5338EB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jamie Gibbons <jamie.gibbons@microchip.com>

The GPIO controller on PolarFire SoC supports more than one type of
interrupt and needs two interrupt cells.

Fixes: 735806d8a68e9 ("dt-bindings: gpio: add bindings for microchip mpfs gpio")
Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This has been downstream for ages, only noticed it was missing recently
when trying to add consumers.
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index 184432d24ea18..f42c54653d521 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -37,7 +37,7 @@ properties:
     const: 2
 
   "#interrupt-cells":
-    const: 1
+    const: 2
 
   ngpios:
     description:
@@ -86,7 +86,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         interrupt-controller;
-        #interrupt-cells = <1>;
+        #interrupt-cells = <2>;
         interrupts = <53>, <53>, <53>, <53>,
                      <53>, <53>, <53>, <53>,
                      <53>, <53>, <53>, <53>,
-- 
2.53.0



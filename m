Return-Path: <linux-gpio+bounces-32134-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI2tL56rnWmgQwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32134-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:46:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 401AB187F3A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3990931250AF
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 13:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F7239E6C6;
	Tue, 24 Feb 2026 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="i3PXrDlr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B6839E178;
	Tue, 24 Feb 2026 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940489; cv=none; b=MNgc+ApYvk99CAT8nlpXPpFaRYOf6b3em8613EUUnKM2+dW6AOEssjVOmlDQ3sQlvgBQstYJ1/tXFeH0msJkXfsqpKlbpB+9c5rmRe30aakaQFi2ctQD3DIeO6v2puJCR2AQ+5tzOYSJsV4OrETas03QnTfDZkKHLhTWJpSlNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940489; c=relaxed/simple;
	bh=6JeRuviJmVc8kE9e5sqwEAT0JL3BGZvdA3rcb8DyIAY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i8G5aCgbbzInqIkx/+qEkMGZllqrKwjEHufL0MUhpV49VQRuOGOvaMJ7lxCafJn8D24Ln7Tc2hHkz4hwP0nmbGjE7giKsM3u888PFd4A2L3PbM2brRQP8xDdFh38236vGjLE7dfvd1OMXb1LynVKEOzfmhvFGIx1k9+aEbyjq7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=i3PXrDlr; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771940488; x=1803476488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6JeRuviJmVc8kE9e5sqwEAT0JL3BGZvdA3rcb8DyIAY=;
  b=i3PXrDlrEsG2tpwXi0n3TqdAcNgKL/x8uwmXH5OC7M0ceAbft1dEB+z2
   +fOBSqta+QWalF2QkcC3WbXUvjUr5WvDaR8IzCXujfecCM+0Oy/vtCZcJ
   z3yZxn5mGzTwxEvXrqi/7KLrsgyREWrRrJbvgC/F3ZcrpYQNkVsSYHxav
   5UX5wGJ+Xs6iHfvFVNmC8x0CJo5Smq40f23jD2tGwdjqJDcew/pQEQun7
   VDGqmE59QnA80bbiaZfzKRM79Fh/KJKlQhrD0mK+VkTT4cYGLexUOqRpZ
   dvXhDdWywTn/gPpWZsXNpdAhBzvulStXNvPdhMZJyEhwBvAAnDWLckkSp
   g==;
X-CSE-ConnectionGUID: h5zd78iDR/WkeWt83MNjTQ==
X-CSE-MsgGUID: D02WzljKQt+mhgkc5V1mKw==
X-IronPort-AV: E=Sophos;i="6.21,308,1763449200"; 
   d="scan'208";a="53040551"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Feb 2026 06:41:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 24 Feb 2026 06:41:20 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Feb 2026 06:41:19 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linusw@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 2/2] dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting properties
Date: Tue, 24 Feb 2026 13:39:05 +0000
Message-ID: <20260224-salami-divisibly-57447839a0f9@wendy>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
References: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3172; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6JeRuviJmVc8kE9e5sqwEAT0JL3BGZvdA3rcb8DyIAY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDJlzV/7iWCb4Yl9OnZKU46t7p881/7fUWuEm3C8+py6c77// lg3dHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIHl+Gf7rtId+q3hYc+7DW96tJZJ Tg+pj96UvygxZET9u5P+ni0qcM/ys/3H3+cLfL1J9/Wn+v3vVdYvvRcx/P2Je018xPlHgk4skBAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32134-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,microchip.com:dkim]
X-Rspamd-Queue-Id: 401AB187F3A
X-Rspamd-Action: no action

Many of the possible pincfg properties are not compatible with one
another, either because they represent mutually exclusive states for a
pin or because they provide the same information in different units.

Add some simple restrictions to prevent invalid configurations.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pinctrl/pincfg-node.yaml         | 105 ++++++++++++++++--
 1 file changed, 98 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index a916d0fc79a99..fe936ab091040 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -162,12 +162,103 @@ properties:
       this affects the expected delay in ps before latching a value to
       an output pin.
 
-if:
-  required:
-    - skew-delay
-then:
-  properties:
-    skew-delay-input-ps: false
-    skew-delay-output-ps: false
+allOf:
+  - if:
+      required:
+        - skew-delay
+    then:
+      properties:
+        skew-delay-input-ps: false
+        skew-delay-output-ps: false
+
+  - if:
+      required:
+        - input-disable
+    then:
+      properties:
+        input-enable: false
+
+  - if:
+      required:
+        - output-disable
+    then:
+      properties:
+        output-enable: false
+        output-impedance-ohms: false
+
+  - if:
+      required:
+        - output-low
+    then:
+      properties:
+        output-high: false
+
+  - if:
+      required:
+        - low-power-enable
+    then:
+      properties:
+        low-power-disable: false
+
+  - if:
+      required:
+        - input-schmitt-disable
+    then:
+      properties:
+        input-schmitt-enable: false
+        input-schmitt-microvolt: false
+
+  - if:
+      required:
+        - drive-strength
+    then:
+      properties:
+        drive-strength-microamp: false
+
+  - if:
+      anyOf:
+        - required:
+            - drive-open-source
+        - required:
+            - drive-open-drain
+        - required:
+            - drive-push-pull
+    then:
+      oneOf:
+        - required:
+            - drive-open-source
+        - required:
+            - drive-open-drain
+        - required:
+            - drive-push-pull
+
+  - if:
+      anyOf:
+        - required:
+            - bias-disable
+        - required:
+            - bias-high-impedance
+        - required:
+            - bias-bus-hold
+        - required:
+            - bias-pull-up
+        - required:
+            - bias-pull-down
+        - required:
+            - bias-pull-pin-default
+    then:
+      oneOf:
+        - required:
+            - bias-disable
+        - required:
+            - bias-high-impedance
+        - required:
+            - bias-bus-hold
+        - required:
+            - bias-pull-up
+        - required:
+            - bias-pull-down
+        - required:
+            - bias-pull-pin-default
 
 additionalProperties: true
-- 
2.51.0



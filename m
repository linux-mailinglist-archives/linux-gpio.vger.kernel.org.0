Return-Path: <linux-gpio+bounces-33058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCrADwgcsWmOqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:38:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E2125E149
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B31832F9958
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 07:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818653AC0F1;
	Wed, 11 Mar 2026 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8L+d880"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D53A7596;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213457; cv=none; b=KC4gr/H3+/1EZOPSTH9iyQc2wAWDbnG1ZQ2tvb2UmwT+/TgacE3+ntwdH1FhiaNwjzkToefCH6lu34E/ViirA0X9SGrBjT4C/Moxonccwi+8ucrBRvJJ7Mo8Pdi0h+ekLMHIrLFb7kKJT9ldNcVxIXGMwSSJZlIPazazY/P6u8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213457; c=relaxed/simple;
	bh=GGsSB1d2PoY/kuEuTnxLtG47ZzK+g95451GAUdj53K0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ouFFzDpQLajX+i3eGf4G7jSs+E4oFg85rDS0xiSH5LZ5fOp6CmrupIQgwsMP8WSrNcKIEbg2ct5ffnAB5xJrmIviPoM40we5XGYnUWokqkLL0AXKQ8h4lztChJT+yBQ37oQ5H2PHc60c9fPjAxOYacUTfOpEu10kVxkeGzY0nSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8L+d880; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63517C2BCB4;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773213457;
	bh=GGsSB1d2PoY/kuEuTnxLtG47ZzK+g95451GAUdj53K0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d8L+d880MJqwLTpd63V7IxNFCV9QHeLwjUedf+oLurs3o7NQT6iYBnP2ZcIhh9/UC
	 8Vnr9NgKC+pgIENgnqbiTkNQaLwb1ZFMks1AN1Flaf+mlaR2Ojl/g782hZY4jiH1Tp
	 bKqo3U4q5KKT6zl3fOMskX4H/5W1EGRCHGWfitGRmcssDjVRmU9fBjvY+/PR3ofUYS
	 yvSsLtVUP5eVpabI5SfrKAEaFvKATIWGHiAzCP6S0pEEtqFb72bDeSuRWUfmxwIvmb
	 NbrTHSaRO3ffmRKRdt+H4BjUwoVazu8mLuB+QzoOkccmLeYoqaKQnQ1KZLzP+WxOD+
	 QPGxFGgxxk0FA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C856FD0643;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 11 Mar 2026 09:17:19 +0200
Subject: [PATCH v9 07/21] dt-bindings: media: i2c: max96712: add support
 for I2C ATR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-gmsl2-3_serdes-v9-7-41499f09004f@analog.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
In-Reply-To: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Martin Hecht <Martin.Hecht@avnet.eu>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773213453; l=1871;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=RSvh87m8UTUuPKmdiJPBrCURSGQkmSAhRt3cRzeUwAs=;
 b=hfyf6lxDzKT5PPWtV0JbA0XetjWM85gWVvumdqw7rcqiDa5z0KzCDNPCQJaDxFryygq2kV0nU
 zjpq1LWIZZzAANBF2UvpCO38sG2sBB5lWpMk8nvgg1sL9JpclZ+C+7+
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com
X-Rspamd-Queue-Id: B7E2125E149
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33058-lists,linux-gpio=lfdr.de,dumitru.ceclan.analog.com];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.30.226.201:received];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	HAS_REPLYTO(0.00)[dumitru.ceclan@analog.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,analog.com:replyto,analog.com:mid]
X-Rspamd-Action: no action

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml         | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 583bbd60157c..abacc3c874a9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -36,6 +36,30 @@ properties:
 
   enable-gpios: true
 
+  i2c-alias-pool:
+    maxItems: 4
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -78,6 +102,13 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>

-- 
2.51.0




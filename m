Return-Path: <linux-gpio+bounces-37953-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jLl0CUyOIWpVIwEAu9opvQ
	(envelope-from <linux-gpio+bounces-37953-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 16:40:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E33640F73
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 16:40:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="GzSs/Adb";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37953-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37953-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37AAB31B0AC8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 14:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFFF48BD50;
	Thu,  4 Jun 2026 14:14:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F35481221;
	Thu,  4 Jun 2026 14:14:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582444; cv=none; b=jyeuP1j1d+CzWcKZCD2y3AgrpCaSeVWD9kaLhPgP8ldPcBohNLKol59S1MxeaalnCtYNgqmMGAxi7yf+S36RinOT5ZMpYYXK9zCYfIYvQGP0cnCUPnrDZUFZTXkfkMEgEqpq1i6sZgongQ1vJlJZPrT8qD7B6M8wVTjYMoyI+Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582444; c=relaxed/simple;
	bh=oRQbdno+uMhuHFTbdmanYF8cim3BHh4wpJplXog8vQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xr7OX3rNvy2VL6Cn3rYQ/AMFrap1FR5afsu6rODs1evpeo5zEUkJdaKxFMQ6oDOcb1Hi/GXZCfYOARNXGfsbJjHNzeknX4/HOyZyICOX4sGVQV8l4+T3CInody2QPK4WV92hgHjQN0CDA5r5sVTV+bHSKEP2pGXg4aaXxJWhf5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzSs/Adb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAFC6C2BCF6;
	Thu,  4 Jun 2026 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780582443;
	bh=oRQbdno+uMhuHFTbdmanYF8cim3BHh4wpJplXog8vQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GzSs/AdbEX7W0tL012Wf98cs1/dO/+D/ADtvfqNsmHP5ly48CeDQdTeAxbNn4NRY9
	 ukmcFzbMD7fBcw81rkSLj1o2fkxv1SCOIWVHpD+EsmWM/Vpo8Ztv/DfWS6++XgzzUb
	 CmWyYOhh1+knI04Xd3X5OI+UwVLevchxoo895o2E7uCdzncS076ovubSa3p9kjaEY8
	 829vgntBn/yQWH9ALwSP+eC0wjls28y4UEJBfJ1B51OOc/NG3S/LI5Cl8jIdpmtjEu
	 cfENLj7PAEhD/6x7JO2fLsfEP3wWK+YBVt7/L1ySa7I8WPw62mm0dY3h61fsyRpJqh
	 LLZrZxD5BCYHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43D6CD6E6D;
	Thu,  4 Jun 2026 14:14:03 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Thu, 04 Jun 2026 17:13:54 +0300
Subject: [PATCH v13 07/22] dt-bindings: media: i2c: max96712: add support
 for I2C ATR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-gmsl2-3_serdes-v13-7-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
In-Reply-To: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Martin Hecht <Martin.Hecht@avnet.eu>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780582440; l=1871;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=Wtq87WP6HuN2ExCP/a1ucfnQWkLmzlzMjUynofXhUVc=;
 b=7D1lIA/b6cuXbRaSP6zlww9P0Y/yQrtfWU0DZtREZSSJrEUiRK40bIWGT6j9a4ET9RTpGWl5R
 s9jKS4qfF2ZA1B0KSrE3dPT9vkg8R7/Tj0s0feZmikQKZyLuXoy0nIv
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,vger.kernel.org:server fail,analog.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37953-lists,linux-gpio=lfdr.de,dumitru.ceclan.analog.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen+renesas@ideasonboard.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:julien.massot@collabora.com,m:robh@kernel.org,m:niklas.soderlund@ragnatech.se,m:gregkh@linuxfoundation.org,m:mitrutzceclan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:Martin.Hecht@avnet.eu,m:demonsingur@gmail.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[dumitru.ceclan@analog.com];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:mid,analog.com:replyto,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7E33640F73

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
2.53.0




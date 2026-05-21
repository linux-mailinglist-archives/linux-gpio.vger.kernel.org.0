Return-Path: <linux-gpio+bounces-37283-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKHPKKX/DmomEAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37283-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:50:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 384B85A5277
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A46C331282FA
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 12:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CB53D9DDB;
	Thu, 21 May 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8VXVwjF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC63D8913;
	Thu, 21 May 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367461; cv=none; b=nJjNzEcdFEdbWvB9chAG9px9MMFq3rlk3gqA/qsE6McYsUIGoBP3NBtACNWDXeAYeZ3gVPcHWDR3nIzo742SCL/cEpURE7UDN/V8dAmPHvuefvH4v0ROBwGwqJvoHlSCGQjxlzXDm9IPA9uH0HMNf8bPeKLz6baHj7TJS4SHYWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367461; c=relaxed/simple;
	bh=tWwbEs8FGaSWXCHu7fkyMkarjjIYlQ6rEDB4ChST04E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+9gEorT1mqsNaqfXNbIewKpxQDVqf4WL4nl3i1w6kKrjqidrEMt51ZzbHEQy83y5tUvN184RVMp1wxX7PHVt9KPBcjO1cjBc12/SVOA1yHeVo/CpQxIQHID8Gq3a0v3HQsiZT8/lbBLjUyKVwdhuf0vc8O1TkEhhLhsyVTTtLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8VXVwjF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D52FC2BCB4;
	Thu, 21 May 2026 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779367461;
	bh=tWwbEs8FGaSWXCHu7fkyMkarjjIYlQ6rEDB4ChST04E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H8VXVwjF1VTX24td/rx/novEuPc389aP6yEKmLTL0JrBiix2H+MK9YTdJlrcPd3qP
	 TTJyQj3zwSa308afS52QFq7OkqXJCX8W3rAIhjMpxcRMpJuIpXHTf4D5l0tm+s9rUk
	 0SKKCH4dQ0UE5hPYMHPLSdhSN3HBcdPX5vdb1BhZpIF/RN7UabXWdwcOVZFZDYBB9A
	 rq1jWaBhp2+BzOOxfIUi9unwoh1gTdrS4P0pha5XccKJm88ymXT7/L3OjGMbVEIt8v
	 RAyDj8eJiR/PZQyNvsBHprl4oMU1aGll9eFHXil5jKHw3KcGKCfPMXQkgovdKJbgF5
	 Or1YFIdJ4I71w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C12CD5BAC;
	Thu, 21 May 2026 12:44:21 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Thu, 21 May 2026 15:44:16 +0300
Subject: [PATCH v12 10/22] dt-bindings: media: i2c: max96712: add
 control-channel-port property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-gmsl2-3_serdes-v12-10-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-0-b26d92931196@analog.com>
In-Reply-To: <20260521-gmsl2-3_serdes-v12-0-b26d92931196@analog.com>
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
 Vivekananda Dayananda <vivekana@amd.com>, 
 Dumitru Ceclan <dumitru.ceclan@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779367457; l=1192;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=WKlYD0eiVlHNx0Fb7+p6Th7PFjpFBfxW7UWVkEB+CEM=;
 b=MqSTYJY0KmbFDYttBHiDm/N8xv4B8LQa721Z2xTuyDDxXMSgS3DPbOj1BtbhAeIcp+NweRIoK
 Ny9Ni60AklsAqJ3OPNdBawFclJusZlOVVAxPLSyHsTWJsD1eEZL8erh
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37283-lists,linux-gpio=lfdr.de,dumitru.ceclan.analog.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu,amd.com,analog.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	HAS_REPLYTO(0.00)[dumitru.ceclan@analog.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,analog.com:replyto,analog.com:mid,analog.com:email,amd.com:email]
X-Rspamd-Queue-Id: 384B85A5277
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dumitru Ceclan <dumitru.ceclan@analog.com>

Add maxim,control-channel-port property to allow platforms choose which
control-channel port MAX96724 exposes to the upstream I2C host.

Suggested-by: Vivekananda Dayananda <vivekana@amd.com>
Signed-off-by: Dumitru Ceclan <dumitru.ceclan@analog.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 161d40acdd28..538b639d4f54 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -41,6 +41,14 @@ properties:
 
   enable-gpios: true
 
+  maxim,control-channel-port:
+    description:
+      Selects which deserializer control-channel port is connected to the
+      upstream I2C segment when the device resets. 0 selects port 0, 1 selects
+      port 1. Defaults to 0 when omitted.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
   i2c-alias-pool:
     maxItems: 4
 

-- 
2.53.0




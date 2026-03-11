Return-Path: <linux-gpio+bounces-33060-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BOiKmcXsWkZqgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33060-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:19:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 644F125D984
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 058F7303E34E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 07:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8193AC0FF;
	Wed, 11 Mar 2026 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ck4X5IoC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90E83A7597;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213457; cv=none; b=tUDFH0ABxWqN62+5psbJZdgYA8bx3GzxDLQzl71zmZbKZjXGhBT+4QRmdk3GquOhQJI+poy5knH1MhrujvO4diQPRie9Y0nFLrFDArRVH0hznYmdt1byBIFvoqTK5YWVxAQJfFiLl9sqdmemGUprtf0MYfItgKqw2ClH+EKUlbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213457; c=relaxed/simple;
	bh=jdUh6DHiZcC8xmAK/C829JnMcr3ixwqGWi9aHZissgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsu1Z1GAS+Y6BOkd9Qgdq+z4nERT56P/w0BrAjvHOarzgG852pPBW42szeJMwfSzU/eiJuNUAFM9GJCH/laHAdsifpd7jG9Ii8PfbupIBHFHDt9p/XdfBthDaGiepq041hiCTvo1QsOpCvefBQ1O/n2doPSAm9D48bBqmM7oVrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ck4X5IoC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73DA7C2BCB7;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773213457;
	bh=jdUh6DHiZcC8xmAK/C829JnMcr3ixwqGWi9aHZissgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ck4X5IoCpTEV3vXoxrPy4t2duaZXqgJFNCQit0pz6cn4WOq8iMrjthxo9nGQrgbNy
	 6ClV0ugjF3H5sf/wcX7C7xLPz5eNA4pgjOzYa6QHtvWtFsy75s0cwu68BCVyWhslAa
	 zszHLS86tBOd3JQ7iQuzKl4O1nBkX4lK0e8OGb3AWlTCDgPW9jagDAjw0MIkcxH0af
	 chn0hTvg1KPOih4Jnw/cJktvMwF3jhCR+9lwDBu/2XjWDCzV0sunTlIbBhldRwk9/v
	 wfbOsBpIrG21+7B4OYAApJej2S4ui3ETBkgtO2NQsinLXnyMLAgkvWdiIecusFLKX7
	 gbxT6B0SL+ASQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCBFFD063C;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 11 Mar 2026 09:17:20 +0200
Subject: [PATCH v9 08/21] dt-bindings: media: i2c: max96712: add support
 for POC supplies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260311-gmsl2-3_serdes-v9-8-41499f09004f@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773213453; l=998;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=qHuwnHnH5Gp9JKhOtp7Ej/Lg9rykd9GgxcARp32ip7E=;
 b=QLWZekCZT+kHt/BQARnKWqd5alXuUERovT+LlHnVIwz+axIY7Kps2ol0IOCRHDucO/KeHm2HH
 w+XeceoomdFA7GaSXUUD1tXRfRzrmh2LGErqdSG0t7sCYcla+q+PEi/
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com
X-Rspamd-Queue-Id: 644F125D984
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33060-lists,linux-gpio=lfdr.de,dumitru.ceclan.analog.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[dumitru.ceclan@analog.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.6:email,0.0.0.7:email];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:replyto,analog.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ragnatech.se:email]
X-Rspamd-Action: no action

From: Cosmin Tanislav <demonsingur@gmail.com>

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index abacc3c874a9..d2dd72f2e924 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -95,6 +95,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg

-- 
2.51.0




Return-Path: <linux-gpio+bounces-37946-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id frNrMK2MIWrYIgEAu9opvQ
	(envelope-from <linux-gpio+bounces-37946-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 16:33:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FBD640E98
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 16:33:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="YAAIe/gP";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37946-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37946-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC745308C807
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 14:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2027B48A2B8;
	Thu,  4 Jun 2026 14:14:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFFD481675;
	Thu,  4 Jun 2026 14:14:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582444; cv=none; b=pFPDr8hE/TGEu6Xu3CnrxGe+8dpHHT79gVp5oqzh5Knr2TiXIXQPdd+wFa7TUnioNXmJ2crAX9Edj78eSpsTkLP5YKcq3BLqKuZ9HsRSu+jAbpoab3UBaQgLsInsEplTQIIgacyAfwRqwdBEk2AQ9BVh3mOp6aNPzKDp0aeqc7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582444; c=relaxed/simple;
	bh=0LRurGs30izWp59o8FPmIaT+p/OC5LyJScZ6dv8wqHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxutAPsYl/kn17Msw68Q6bsLsA9R4roJsNMThQgk3JvX6HmQ6Bm6fcRLrFTeMUUrgD7UsiLioFdeMTUaVTo5qdZrOOF5KHts9Q6oAm6BykPKsVuHCSi2a51E2VfXKQXF7+hko9ud1jLu9jzWx8sociQ8TmLASFKXhFDL/n9++eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAAIe/gP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C11BC4AF0C;
	Thu,  4 Jun 2026 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780582443;
	bh=0LRurGs30izWp59o8FPmIaT+p/OC5LyJScZ6dv8wqHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YAAIe/gPz6TtMvL0y/2A/oReHlHqLBMi29WJfrTEx1cPg84lpfPS+yuP+Toi6Q59f
	 R6vUkvfy5OaAyEWUoNJkKEDDK42RF9nPSc3qOEAl+zj7plQgTzDtRDmCnRpeiCowvR
	 4YlYzkHFj9ShJLqUAesJdCvvxvH6LSqM0fbimY8xizK2QDyY/mQO2dkU21MEV8w+Cx
	 BsN+wW6Zq9YOlbSSs2l5w/wSgg3juMz+Is3hJvDhX4mDtPJy1/EtIsOon5iMTlLna1
	 m09pKD3s7MIxIy7PnA+jEMCxs0ha+C+Ba5TkvGtiNurHvK2RadkiDSO8/wkkR+lBAR
	 no2Us9CwGUdZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91497CD6E76;
	Thu,  4 Jun 2026 14:14:03 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Thu, 04 Jun 2026 17:13:51 +0300
Subject: [PATCH v13 04/22] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-gmsl2-3_serdes-v13-4-9d8a4919983b@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780582440; l=1215;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=vJv87PlKhZ/JJOLIT/BDLODjizDSGOosxrrf6SXpE7Q=;
 b=J3JHuBrdRKrgaMCxrwcCGJKFw0AUILiD+53InJ7izsZ/Bb7dX//PDlzVluevcP9fVjgvd5VBh
 XHIMqPV3812DsqD2RRzBTuTFAclAJkbHo6VeQOL0As2H14TvnCAj3pE
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37946-lists,linux-gpio=lfdr.de,dumitru.ceclan.analog.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen+renesas@ideasonboard.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:julien.massot@collabora.com,m:robh@kernel.org,m:niklas.soderlund@ragnatech.se,m:gregkh@linuxfoundation.org,m:mitrutzceclan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:Martin.Hecht@avnet.eu,m:demonsingur@gmail.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[dumitru.ceclan@analog.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,analog.com:mid,analog.com:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6FBD640E98

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d507cad18edc..bbb38b3de7df 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -24,12 +24,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717

-- 
2.53.0




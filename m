Return-Path: <linux-gpio+bounces-37962-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XybRM1SMIWrAIgEAu9opvQ
	(envelope-from <linux-gpio+bounces-37962-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 16:31:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A28F640E82
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 16:31:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=C8AASNme;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37962-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37962-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0238931330FD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 14:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B6B48C8B6;
	Thu,  4 Jun 2026 14:14:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D46481AB7;
	Thu,  4 Jun 2026 14:14:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582444; cv=none; b=pCK/KJkOxW7cg1QVxhZ5AIcWvHRUK2CyCyBvjC8qoPtYwjypR90CAJgIZlYVbrtyNIi6yqNWlSUiIl1QbtSimqlNhKRsZi5+5KyYXdKc0s18zIXy7ZokBQ5s9ZDrg+/i/SoVLJunaXPsQ6TWWJOtXpKYLce7qpwxE7wJEAlCMzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582444; c=relaxed/simple;
	bh=OwrNl+pNAFAGPGuHjWuiWnkMoEjpWW4G2eAfknSupN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWF/ACwkTrByxeku5fVndIBBYiZhyHC6LXMmFNnB32jWbazMK0FSdWAnfAtues5XD0D/s6odA0PYeJGUwQ853alOiMap+pegYK8KPi69pfvEoQCFlTwb7gjWR1pkNbpuCFV/MQfkGSm40luyej0rhHhU0dU+DB7tm7FdE9Nbm/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8AASNme; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C654C2BCFD;
	Thu,  4 Jun 2026 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780582444;
	bh=OwrNl+pNAFAGPGuHjWuiWnkMoEjpWW4G2eAfknSupN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C8AASNmeu7pTTbTlPxGrlNGMYw4Ht9ROhiSXCa3OGB1s3ULcaOqbwuiyI509UJkKZ
	 NiY2X8ZjGHFdAbhhKMHSFuWiOzWX+h2XwGYFwR+527ho5TJbTQlHif4V7VykUi41V2
	 DNnE/SFrgw+JfM4Em/kz/CoyDgqSiAcHaxuaEjSoQ/1dEOpoYCB8HWRgo9cEp50Q8S
	 P9LXRkQ/sxIb4tIwdpoi3Z3J+YTTBE4mmt3V4nw17WGidx9ZD3X87ramzRHoTd5WRN
	 eNATLN4kGO+GTPxug8ZHNh0hXyEiBpXXcHVuNNAAzAfweUUFLAqHalbi+FI6MUlJF2
	 1Upxuuavw/8AQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96948CD6E4A;
	Thu,  4 Jun 2026 14:14:04 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Thu, 04 Jun 2026 17:14:06 +0300
Subject: [PATCH v13 19/22] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-gmsl2-3_serdes-v13-19-9d8a4919983b@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780582440; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=Fm1ZVHBh+33F+3wTU55eZ0SR25F5VMZJ6uZBMy52XOs=;
 b=zUi9X4y2agCBRSOIQ2LaUjsmn69Zzk+P2qxkRFFoYzoFcyZ4R++YNPcO9HRmspAsyo7tXtLSJ
 /MZOY72kUUrBV6GZe851cAIIIYc99bfmOLsfKoijoyCsGgjb7SHEq8i
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37962-lists,linux-gpio=lfdr.de,dumitru.ceclan.analog.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,analog.com:mid,analog.com:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A28F640E82

From: Cosmin Tanislav <demonsingur@gmail.com>

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4c81b721a03a..9d3b284ed9b1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1426,7 +1426,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y

-- 
2.53.0




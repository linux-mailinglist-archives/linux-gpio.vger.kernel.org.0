Return-Path: <linux-gpio+bounces-28496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E903C5DBAC
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 16:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C92DE4F76EB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6810132825E;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwxaSYwH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E491C325727;
	Fri, 14 Nov 2025 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131910; cv=none; b=cYqgWKsTLVmgW7y9rAktfAMfcW2hsyqJtJTXzsM5fLkeq0AkAj8nmHsqgUH2pXuldUsy9KJdMN71HKVKakh09IP5YoESPkVDlG4ZKytveodOogmXCGut4rfOqjyZDcW7bAFGU8hSzERyGpxTl2Z289ai1PYMloMvYvStenTfI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131910; c=relaxed/simple;
	bh=OPt82ZBHchgqRMLxdrE9G+AkTOfdZSAoSGrKziuZV8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEIaCiwfkgfmC6nHD0yeVtPROTF0HOb9TfMN5xue/F1SVj1vZTZyOPwAHeO/bCHmX0awcqqfUINFPWUSW189hx7i9xnB/1jPLmTOg4wR1QTQeDwJ1opRCKiYZ7+7G+AbR/YMjKBAmgKS9P9CgPgz2JPZkXB6zNJ4F43AF4PXLTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwxaSYwH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91F55C116B1;
	Fri, 14 Nov 2025 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131909;
	bh=OPt82ZBHchgqRMLxdrE9G+AkTOfdZSAoSGrKziuZV8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TwxaSYwHmpM37qK9ptJ3IFhvABI5aiwkzD4YfLRbQRXU302qmem0IxoKbv7nAD0aU
	 1IplkEf2MmosSUHHrYpwovl1exS659sl/51D2Km9zpkGaJxD5BMCBWS2OZR62twclK
	 kZ4VuBJ7DcXvb8YxVh0M52KPnvv+g91rpTD1O1BVghvsM/qBzpFxyFXopw6a3xYV+G
	 5Y4eWmywUYfwAh61E7MFn/fa1G7NUmQ64HaKgDeedqxFbJ9PGxMaDCNxAG/tlirBay
	 palbFz8dShBRCauuo61/A1IAYSeov1bVcegx9vXSuB1FFtUk3uPmxdZ6uDXm/s7TwW
	 YaDDAB6SF11Sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85192CE7AEF;
	Fri, 14 Nov 2025 14:51:49 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 14 Nov 2025 16:51:41 +0200
Subject: [PATCH v8 01/21] media: mc: Add INTERNAL pad flag
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-gmsl2-3_serdes-v8-1-47499d907990@analog.com>
References: <20251114-gmsl2-3_serdes-v8-0-47499d907990@analog.com>
In-Reply-To: <20251114-gmsl2-3_serdes-v8-0-47499d907990@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763131906; l=4211;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=oSo9FXS/slxHHe0PZVvfQeDjB+z2quoSfmn/Ud/nCVI=;
 b=O12cgHgIkP+LsPvTk6qpaSt1JoZSKcuorzXBVYDJbSyw3P3yXJPszvLHsrlq6W7D5hTYW2lFC
 KsFmuaV9YQLDk2o3ckb6VszzKw2aHEEJIPUFY2ItPgAqzzoswq2HJ55
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Internal sink pads will be used as routing endpoints in V4L2 [GS]_ROUTING
IOCTLs, to indicate that the stream begins in the entity. Internal sink
pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/mediactl/media-types.rst          |  9 +++++++++
 drivers/media/mc/mc-entity.c                              | 15 ++++++++++++---
 include/uapi/linux/media.h                                |  1 +
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263..200c37a1da26 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -381,6 +382,14 @@ Types and flags used to represent the media graph elements
 	  enabled links even when this flag isn't set; the absence of the flag
 	  doesn't imply there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. As they are internal to entities, internal pads shall not
+	  be connected with links.
+
+	  The internal flag may currently be present only in a sink pad where it
+	  indicates that the :ref:``stream <media-glossary-stream>`` originates
+	  from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 9519a537bfa2..df20356fa98b 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -209,11 +209,16 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		mutex_lock(&mdev->graph_mutex);
 
 	media_entity_for_each_pad(entity, iter) {
+		const u32 pad_flags = iter->flags & (MEDIA_PAD_FL_SINK |
+						     MEDIA_PAD_FL_SOURCE |
+						     MEDIA_PAD_FL_INTERNAL);
+
 		iter->entity = entity;
 		iter->index = i++;
 
-		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+		if (pad_flags != MEDIA_PAD_FL_SINK &&
+		    pad_flags != (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL) &&
+		    pad_flags != MEDIA_PAD_FL_SOURCE) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1118,7 +1123,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1148,6 +1154,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
+	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
+		return -EINVAL;
 
 	link = media_add_link(&source->links);
 	if (link == NULL)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..80cfd12a43fc 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,6 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */

-- 
2.43.0




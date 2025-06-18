Return-Path: <linux-gpio+bounces-21727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E61ADE797
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 11:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C427E1899641
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8062853F3;
	Wed, 18 Jun 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkGPvADh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBE02836A3;
	Wed, 18 Jun 2025 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240774; cv=none; b=mX18MvcdBI1ipCZA7yxPgfGd9VnMKcAeRiMnaZJmyV9VlNn/Lan8ddpR0rYsycjAKQSKoIrJKJA+SWqKqFpASdiyhRYLJ+e9NEKQD95zicsJ84usqkmKkSQbiQh4VTDFwiEqKudCu1nKn58KxLxiONxaRgkmBR82MY7AOPCRIno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240774; c=relaxed/simple;
	bh=467CR6klSO/rABH5qwhEowl4H/h3tmem9X+4qwHlQvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpUNKXd7lIKmJ8PumO7w4nQNOxJOeK5+OkA2zJeMYcCSVvIyyneOtYUWgXpPdthS9IqMa4O7v7MfL3pjrC/89gj7A6j0coz4FKPeGeyyXVulx5yLgGAUOqpBRYGI7SvpB+TngIJu8Z522gACsJ/bcw0Nk7fI0EErMCF16kGxs+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkGPvADh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so10586339a12.1;
        Wed, 18 Jun 2025 02:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240771; x=1750845571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaZUxZfR4LVFlXZ9G/sKKJWMQAC209gl7LEnCa9qfYw=;
        b=FkGPvADhAX8Rd2/W3pgohWwtTrppe332M/TaU12D6ZMY2o4AgZcwExYyMAP/Gp1Eet
         f3NE3qcDcoBKfKd9isCccv1jELK7Kc/hoEJV8X7Qy/yLoZeS6UAGxqZ2xX5Ewn19krax
         VR8G9RYGIPCz/MdQVI6QTkGsitKygIfxEbbRKDnaOvOVKehN9U7THg9hCD9IH2uuRu9G
         mH6mjqlZlCyfY77s5wlNpBSbBAwZaqa/izEYFscWTJYWVtk+ceSrseg1TOwJuLNjUdb8
         n/hektjt0z5F0CQoehcRIg4BwyQu29F64vS4IN/tgeaXUI+/dPp1oI1/tKehS7hAqHfs
         ydLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240771; x=1750845571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaZUxZfR4LVFlXZ9G/sKKJWMQAC209gl7LEnCa9qfYw=;
        b=EuVpnnEMj7rJm8wiFBfIrQyUlO+5OopJyNg9bjDvxDT73ClM3NDGZGXBucM2DPzhhf
         E7u02Mq8OVV7ZPLjQdywgCY3Dw0UCCDTnt8SE4/YL9yFFKuHDO3DPzsc4RlCpdcgYX2e
         4VPwAGzvKiM9jgXggIHC3BQhqyqMPydCqZgY8szpFRnMQmMyKCZI6/NUz5cJAcsmBdhF
         u/Un7qXJli4KgRGJP83L9rz7efM41wQ3EvHDtIZlAf1iiqfirn1zsk+52GiHvbJWBanr
         J1XoBWq4NeHrynVhTFdEyN8SQ2t/lOCZpk/xNjAtyAViFghF2PcMU5Ksbp96eee8kiIz
         zMQw==
X-Forwarded-Encrypted: i=1; AJvYcCU2rjo8O1A7AFsp3LxtNRT5iGHuYxyl+YR4Nm7Wt5pLPeZ6wFbVqW811EBkjnRpBwMWQrEIiKVK+5kTAg==@vger.kernel.org, AJvYcCVqnXs2W8NHppaq4/SoR3k8M9wF4gcKAUxfD+MuhBXeQn4wx9Y7Bk26Tq4xAj5MVV3858+OW6w78SgxHyVM@vger.kernel.org, AJvYcCXXqUCChCqqOqP1NZzjzO/dlJ5uCsXgTdmh+MvvWSg86pFZZ3yGR1dnYimDE3lSMjeJpX32qIL5EsCD@vger.kernel.org
X-Gm-Message-State: AOJu0YysIp5tYlwnTIcV0Umc8IrjRSGW77lOGgJ2E77qkjMEqOBbZXBD
	r7deXXIOTPFzs3l1wnDURg5J/lD/x921Ld2vQ9FMIjX+0cwQaPRw2lyr
X-Gm-Gg: ASbGnctBrNxgOIpxGni48iCZenIeTcS9SuLrZeSTq7CCEmrsj0y4MSAE1SguSRJcJn1
	tWO4cYCA3w9qVP2o5j/Gs4ppP1a/eNJJLy0ePUsI2gjoEO4tyljk8v8Fa+0CskQ53FOBdonERpE
	3+yk3ymva+ATHkV8OKfcpO2Ay0FOQjv9axymIr/CdSyIK/14oSzwRdL1SssorxICci5SF3dVRvt
	rh/ZcUSZL6qPQEkfBonk3AsBOMXXF7n+yonPw6gT5yLKouAiZzMFkEqqhwC+pxuPFeCdTGT7RI1
	NHDWI8kMCbuyX+ROWHfb0tasTLekxx/ig2tOwOMRmoCT3YmKkvtRcGxbfs0QFPAwZYZ8RIF4b8c
	=
X-Google-Smtp-Source: AGHT+IHfnf3VtoJ26EFASDqtQTxgpRHeuZi+Y25r3DCIec5bB40siKeSLecbTcKf5YnOXIgJqGFk+w==
X-Received: by 2002:a05:6402:350e:b0:607:1c07:727d with SMTP id 4fb4d7f45d1cf-608d09b8ec8mr13802281a12.23.1750240770954;
        Wed, 18 Jun 2025 02:59:30 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:30 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: [PATCH v4 01/19] media: mc: Add INTERNAL pad flag
Date: Wed, 18 Jun 2025 12:58:37 +0300
Message-ID: <20250618095858.2145209-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Internal source pads will be used as routing endpoints in V4L2
[GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
Internal source pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/mediactl/media-types.rst       |  8 ++++++++
 drivers/media/mc/mc-entity.c                           | 10 ++++++++--
 include/uapi/linux/media.h                             |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263..f55ef055bcf8 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
 	  enabled links even when this flag isn't set; the absence of the flag
 	  doesn't imply there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. Such a pad shall not be connected with a link.
+
+	  The internal flag may currently be present only in a source pad where
+	  it indicates that the :ref:``stream <media-glossary-stream>``
+	  originates from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582..d1feacc60807 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		iter->index = i++;
 
 		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+					     MEDIA_PAD_FL_SOURCE)) != 1 ||
+		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
+		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1118,7 +1120,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1148,6 +1151,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
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
2.49.0



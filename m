Return-Path: <linux-gpio+bounces-22619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F07AF58A6
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F2974E325B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24A827FD51;
	Wed,  2 Jul 2025 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5+hiz3Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9D927814C;
	Wed,  2 Jul 2025 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462477; cv=none; b=ckqIn6UMAPIRWixZheN8jYxwt0iX9yE4rLnptUQ1bksPaf33li/aHTTXcfotjHHWJXEuNPFwciGRBFlTPJCd0YzK3TzpCGvMKpGKLEl9/aeLcJDDo0l1hWgBZ0atWdZP1/H0uSSbffpJJxOpZB08jSJpqGP/PZbvOAatghSMY44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462477; c=relaxed/simple;
	bh=1IOnYytOsavpbhQCDh7GtasA8b/3W4J2hDQQUeAxvNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bY1wfCgJd8R80ZWUTSwbyLY8wHTIb+Q59lobc7ZXcUrmytDrHVnaFHwl2ZhNemya4GZQF5V8vduKqtxW5UcVMo5yFw5mNEmAowI5RjK6WftiiJfi4RQzUEfcXoRYUDeztZQBY1I6g08OfNCcl+M0pLgVHwFVTLO0u5fG5KquDbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5+hiz3Y; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so11315135a12.3;
        Wed, 02 Jul 2025 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462473; x=1752067273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upG5ePm7BuBMLjhAjxdxOx+e2MDPCegrLyoq3RT+0t8=;
        b=N5+hiz3YoWJlLFDVHYpahawwF1hubMwe3fA244bJqG2gDvmOCHAzdW5kvpnjnMC3Jf
         M4/vQmu3zgw/DBsUJSFSaqCHdWO3ZqOUYFMG/GGL1FdD/+9CSOu3+LlOCEQP+DYB/xou
         aSw/KNYkZm7fewvuoYpH+/GEU+6YuGk0nSCWbTDWkg0Iip4V3moc8hrzt7qxCpxeG4EH
         K1c5BFmF7C28DdgOGMOn0DU9KQDov3USs9/DAlb0FMXPw4cR8AVP4Yl3K/B3RChsqUNi
         0n9FHbEWKfxOIzoGyJfljSNeaIdl6MLFJuO/EJpVccgqn0fywlcNjp43JyT8Xt3UH9tQ
         DryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462473; x=1752067273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upG5ePm7BuBMLjhAjxdxOx+e2MDPCegrLyoq3RT+0t8=;
        b=DvkaFab6mL+9FhmFlB4eCnDq/iEpr4NDC3b2JkcAnI8heA313p5PgkPWSJ58HBxTyR
         580ugrJ2gpZjw617zrBCxk9vHpnbzBaxnLHGSiPHu5aEXLK8v3lRiYzXYYhWpzs2vVOR
         KB0ZxfDkWE8CRkQ4y96p40fMXQ0Wo2QAuWRPboLkY5a75ecai2E1hdVz/MOYE2W3N2WP
         NCKKtcMUueLLFcSq/eOstODmemX8NBNdeaPfQW9xQnJ3nDPEm9hgGvlJn+Y+sMbnIy4r
         1jaqyk+SrzZ3EdMoGHyAWZvtfls1U7EQbjjl13eTwJu7lxjsGKhCOQSaQKl7yEc9eimt
         G+tw==
X-Forwarded-Encrypted: i=1; AJvYcCUq5wXI20xqaGiNgTHZnetbs33y7nyOnWCT+fCV4JjEIzrIO6EoF8H0ZsqcBH72W4WhqtfslXMj/vpq2GB2@vger.kernel.org, AJvYcCVcyJnuKB+ALPJrFeTDKv2r3PlHBZMo7KBb0Dl3pw4RupMUsGAVjp9AA01ALWLvcOzD6Y26ZXF9Ekwhlw==@vger.kernel.org, AJvYcCVmGrcXg0eDhIdEZuVCtyuPX9gqSl/y5K6gfOKYSlRmFWH3twslNs0QsGaTZOU4Dolnp5lSaq4k4P8z@vger.kernel.org
X-Gm-Message-State: AOJu0YzG01DKVN/7t0AUwp+XSOKriMarQiGxah8Q7iKeqIj3djJE577P
	5Eaihj7/W/tPhmY7tvBmv0fKGJDYgj0HOWhkjTiXFMGD3Kh28c0CW3dI
X-Gm-Gg: ASbGncsP2rhbOU5zorv/Lzmb7JYpnBjax6VupH3gkHoaQT9MSJqD1IB5MWoucdliCPC
	DHn4EsFYSNi/3VmhEklxkyc0utDwB6ucTxEeMNfXTI/WdJDxbyTPG57lgYomQOuVKLY6jR/et4R
	6fYoCOGrogoC2U/Yuhe5I69gSh91MM77ncYCNwFCT0rvA7PrE1iULY/61tDCMO3RCc/VVoFqBLB
	/pATNcRx6PSW8DhSXbCo7MsJ8+luLNGad4K18kbkNkcB0nq989zxp8GH15S6xNcGL/GjvmZddig
	+2kUYeCruNhfRD+3K+mn0Q+a2TCjRvaSVnx45I5bOfx2G/GehfEIafiS+3lJSIoetybqoyVD6Tq
	IQYnF8fh75Q==
X-Google-Smtp-Source: AGHT+IF/sKHcXFLP5mxbS49LHMrfftwS95fHZ37EO5GWP/QWfZu/zNbRtWTsJ4YSMtScr/AkwdbI4A==
X-Received: by 2002:a17:907:d15:b0:ae3:65a7:5621 with SMTP id a640c23a62f3a-ae3c2bd9b6fmr296095166b.37.1751462472854;
        Wed, 02 Jul 2025 06:21:12 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:12 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 01/24] media: mc: Add INTERNAL pad flag
Date: Wed,  2 Jul 2025 16:20:27 +0300
Message-ID: <20250702132104.1537926-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
2.50.0



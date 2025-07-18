Return-Path: <linux-gpio+bounces-23471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF02B0A712
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7493AA041
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398D92DEA69;
	Fri, 18 Jul 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq2IOAPm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439642DCF73;
	Fri, 18 Jul 2025 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852320; cv=none; b=HgiKsQe81xmj8D/F+5rcsVakO5QBSfQTAqVUzMZufz3NZhTIcHVsW9lMJAv+jd6GcpMoS3z5MaCeMGvqW8HfD4Aduge3hvAA8d7Lyr6myGwFRmBbHprqRFs3upDPxgRXNStY9mHCFzSI4dMzuUhPz7P/EPeK7jFo6RmHJzbQ4WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852320; c=relaxed/simple;
	bh=GD/LZsxNHLFcQHHnyEVtdV+W9ayAHFLj58BoFvS4TbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKoQsKwFc7ituPZtdB8CFuh90fJn1caGOWsnZvH16uKmCslMYG8XQdKfzmPvDovO5u5hrvr5Jcd9xeS7pb+NJnU/9WMJ3Rf6n8CMb6e4+XkBwwO2evHeEf1Iq1aCdG3PovpyqGtTWXZt8Ls4zcBub04eDqfppjcCn57l0Z+Uhmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oq2IOAPm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso17642425e9.2;
        Fri, 18 Jul 2025 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852314; x=1753457114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=Oq2IOAPmlBVMsFrdmIYMQ6PTnnuHkmm6JXWC2IcldEHOpygwr8idlfKFyPD9fw5Nxj
         eDppYiV3PLmWhIoi7njUVxZMWQxhNlqKSFhfNVGr0ryU08YbrR0xnrsWmKXcU8E5Clkp
         8PUb7EBCSgguJTYzOqS5DNMajive9v8Jnb/a/LsO5tDCTzN3GC+osmvmuFCNlunLQVzN
         QjR/kaPQ9ly+WcjZdeTMp5cAHJ9ozWMynb/28h61QcAyGjO9svl9za1G2Do123ZX5N/7
         YSz1IYjssQPpd8Eiy0JYH977VW2RdE90PfxtJRtZ/eKsAcF0VrflXl1BPmOZ+Xc/GOcA
         GF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852314; x=1753457114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=JuRoT/1XdxyxFIEVOLVMjpFEvyh08TmimnU5/9GldTMio9j4zBCglF8KDq/7L59OeC
         VH2n1QTI7G9Mp0fUKQvGPHIrJk53mPvzivLeqyyU3ZC7V9r/rBiQ/Qp7qDJbiYmwerGu
         Oap5NqbI9YrBZyI+GjC1DwswfnDSNQE00ScSUWLcUgK3Z0VMENp01Pl+1pzdBP8gwGcY
         GqbmEvEVos1oR/VK7qfPPhNUnypj6HUfeofncIgvwhIwdG39TqSIpOAvQuOo1F43eV9Q
         Tv6yEhUC3JcFHTGkH5nxOYLDJq6J7oSmcGRCtETQnpxm7pfPkPXOC/0xUsNorfTP7PZH
         Y0bA==
X-Forwarded-Encrypted: i=1; AJvYcCVMi8XkJsteu1uHpADdB4Nzpnj8XIhEGubXn+cKntB5zDz7tWzkPs/bF3Nj0mTdV5gLys+AHRsP5+ffNA==@vger.kernel.org, AJvYcCVgAUXCgcLEE3/sUdEouc/4K2Lplzpf77CdYFMVk2y9eOGg7B1KY+GMWW9AIg/pa1+O+BR+hk29bwRv@vger.kernel.org, AJvYcCX4xQ41F9ji102j+C5MtWLVCCwDLPPCo7qsX1KRV0VPz4aL2xeR0GB1nTg2Zke0XSTuakV26Fmg37ufoyA7@vger.kernel.org
X-Gm-Message-State: AOJu0YxRpUV92PioMJTtdlF7nrJqFNvEpKoAO7v+Nuq0zYTl20pf5YDo
	4/2HHhl3QZQu/lyILBHvqBvO7EF2b6bQimnb9kuQI8svwewzsNlWiOBj
X-Gm-Gg: ASbGncsSCO/Y2QqXHMcThDoK2ZFyus/8e0HP+EFj6Z/FeJyrMjWBFLL6bsjoVjLU/5K
	scS3BAdnlFGvdcD87x5DTrxSU0hMoqoAdDYbOwWSeauoKfOHJIyYqVm2/xK9L4OR3I5Ot9HBvOI
	W5N0stoLMJP3UE2cxNTZCiQTwAyAi7UJZ/Xnp1JIxNVwgCHOLJiSQqLW+vnZuacF+1GRpEWKADX
	g9CaLAAozJrZ134j8wrLv5UFHVAGAdX/VO9ZeW3WxsgG3sp3F6+9fzqyWFk059ZjlaL/aBGkTzo
	aBBFlCUgM1hvuuAlMTYjo0PsIYpKyYlO74pBIX7g0oLSWvoOo6e+uMAg/lvin+awP6cvyBvb+fc
	k1RxJsRsGFMJXzwJryBSPy/tVfezsh8ZiwifJsOGpuvpQvw==
X-Google-Smtp-Source: AGHT+IEsvECTV9vCQ7lE8o+YTff30hJOsIR9MuRvOH5+iAHoGOCA7S1w2KqX/lPKISemuJT6ZPDrTQ==
X-Received: by 2002:a05:600c:8205:b0:456:2020:165d with SMTP id 5b1f17b1804b1-4563b8fcc48mr35428645e9.31.1752852314107;
        Fri, 18 Jul 2025 08:25:14 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:13 -0700 (PDT)
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
Subject: [PATCH v7 01/24] media: mc: Add INTERNAL pad flag
Date: Fri, 18 Jul 2025 18:24:37 +0300
Message-ID: <20250718152500.2656391-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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
index 6332e8395263b..f55ef055bcf85 100644
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
index 0455909055820..d1feacc608072 100644
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
index 1c80b1d6bbaf3..80cfd12a43fc1 100644
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
2.50.1



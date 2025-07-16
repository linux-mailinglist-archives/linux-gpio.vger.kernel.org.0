Return-Path: <linux-gpio+bounces-23366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B67F0B07DA6
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 033811C215E8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48728218858;
	Wed, 16 Jul 2025 19:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo22e1OU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6BD1D63C7;
	Wed, 16 Jul 2025 19:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694287; cv=none; b=atxlenAItEM0N0uXP1KD5VzsN5tBX7NIq9uJxQd9oTiJIWnRIivrZ21Q+aBQS7DoaKsdF6eXI8XIgJN6EapRcjeix6f6dRqsB+cExk3Hp/4UtOdq87Uwnwhlo1xODLsj9Jjzuu/F0sImNVeXNCu9NMH4QnGg1ANSoGO5lRVjHe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694287; c=relaxed/simple;
	bh=GD/LZsxNHLFcQHHnyEVtdV+W9ayAHFLj58BoFvS4TbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5kR3OgR/vcb72YzaO+SKMS06oWprm4z0h9nIRsUu7swJngIOmEug9FOzRoFwZIc7asIL3zYf6fpWpSkrdJGcPR4lx+6wUtaEVWysDb3t0E+VF6rBQten1UAMEcNNr7BezeS1mgp2V3nuTpDoFFaTK+4UnK+4Dl7K5KY+7oSY1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bo22e1OU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so350300a12.0;
        Wed, 16 Jul 2025 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694284; x=1753299084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=Bo22e1OUG9j1wXpG9nCEbfx6UCgOGhfBcliNa3h+Vnjv09zpi6CtI4atWhMNChg/UU
         VJnA89LCQzaZP5k/C8O2ZIoLrBQxw1ehmPtvWHtf4JSu6XNvIfKr3b0YFQ3xogHA+bUa
         HuzJVVeiNh8Q3JF4Jq+kXn7i13rMWIwF/V6CSyYmoV9fy3Nr8IG9NqBDIdzEKBkysEgK
         k4oroK7p1qVJha/A4bNKiIZ4EMw2lVx/YCXkvycybeFiB/MyNtotdj/0iRuPMzGBTqDY
         qaIAc3MhsL8KaKwSoSjgaZFrGM4UlhJfRpZWulelGnWgEOKUqOW0XCF9ADeARfQpckgF
         jftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694284; x=1753299084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=kNjYNyQeu4iQid6JToQszkuR+FhJ/hcj8GGIK1iMKB/cl+pQMCkTZ31bKuR8L9s7St
         0BCP/kSqZ4pSAqtgablS5q1vhAea7ybqGfF3TN8ErJ2FDwnExAtt0MUoIvLtd/FjHYjs
         INjMlsSeqLxLgaFiLQ47ftFjVxc3qzamWfwPXdOr/z2IWLXI6q2s1h4LBmVpebXEQeoT
         CUBtW8tmQx4m+HHkeywmoA+1QgNjEaaRZnrEqlOYvvPg+OSeKvlXg5rClSZTCvl72PRh
         phy9Q9zpAPr2Xf2fZDXnIxoGDydCMY+Ua3wX9ZO5xJfFjHJSqN0LbX32QYxZSs1sBP71
         2AOw==
X-Forwarded-Encrypted: i=1; AJvYcCUgAqnBG9zvMtMp3i2/HwgqVVE8vHv898NNu6XcSvElahhaVixOOoLEAt3jK0fq7RF5Ebbg5sY80XCtpaTX@vger.kernel.org, AJvYcCW9vLbOUNPQ4HdOXstdBqZO6mgV6hu64K7iTbrOGIkzlkr/AiedG0K0iVxf5Y7gC2UJWb8RzALB4pMQ@vger.kernel.org, AJvYcCWI5GuzL8W4El472hHyvNQlKfP3d1RKL/y6G1ZbpVfZXphcg9Uihl1Hj2dukOc9/jHimhKtRJ9B/AKzTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1JnMjSNoH3LT32oyMv83aJRX8Z3GOHFVE0ZwxCxfbQEEhS24
	nvgIzoGznSd7Y4J1Y0stdgFCKO7Sz/etDaXNBI0lwkH6cXzlNRY2Xsda
X-Gm-Gg: ASbGncvRGwsX13cgHaknm2B2T4tUwjWcNcnIhbbstXMkj6jR2rp9wdlBAHoAiohbmDu
	8vU5oJ5yjF+R+v8HW83OGK28OK9CApMVjyHe7jvCvxVpjVg5ZYbxhCsXxihD6QPFwFUg/QkzDqp
	wodxzdXyGhXJO3Jo6E4x+uxfr/XAtDUcPL+YeAk2S+48/lbk6D6AvEv3S2e/+xfQuZUtxapid2m
	JnvGoTMKTQeXQVMJJ/Rc8GVaEdNem+7j7Hx5kI+/0sjkfkNNsqLrPNbJ1XzFvwuSRtROsdGcD+1
	2n/S4kANkAfjubX2vtQ2x9rVJb9SbEgCvQILDUjfwZixKhCzs3eRVpw28laDLEoUd4AUdLm+7i5
	8EI/5UKV1Z41HVH0jrzw93L4s4jUziYjUC1s=
X-Google-Smtp-Source: AGHT+IF1oWUA1OVfQOx4un1l96swc4j/iudsLCvxwM4vbZlbA9kI9dWlcOanNjxGseag2MN8Zx+TEw==
X-Received: by 2002:a17:907:983:b0:ae0:cde3:4bbd with SMTP id a640c23a62f3a-ae9ce14a5edmr399552966b.44.1752694283416;
        Wed, 16 Jul 2025 12:31:23 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:23 -0700 (PDT)
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
Subject: [PATCH v6 01/24] media: mc: Add INTERNAL pad flag
Date: Wed, 16 Jul 2025 22:30:46 +0300
Message-ID: <20250716193111.942217-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
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



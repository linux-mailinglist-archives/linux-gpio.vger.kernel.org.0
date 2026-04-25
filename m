Return-Path: <linux-gpio+bounces-35520-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O0SEKgb7GkgUgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35520-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 03:40:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE2A464755
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 03:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0799F3007538
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 01:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E9021CFEF;
	Sat, 25 Apr 2026 01:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJvTVP9i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F1C1C5F27
	for <linux-gpio@vger.kernel.org>; Sat, 25 Apr 2026 01:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777081250; cv=none; b=qB9hhrVhLq2B77pYiamWOjJYtTVQ6ZTKiZtxxcTYgcdXoRJc+010hlLrBOv4ZXs/8lpW3HPXmU38nXIUD4Mny0EaO0b2iatqlnWRiNpIZqASRxm0xGxPw4nTqA7KCAxfDaYjr3xtAhWZRZPxrLZXHcLoSURp0U9KVZu/oIprIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777081250; c=relaxed/simple;
	bh=s7xRw2+FvzK5g98p/kRflojZycaFuy0Jd6uptcZKYT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dtj4fGrJ98H2XGXXNmNnoh7xzdKhK6JUqG+x6I8BGWluJ6yfwkzevsGoUU8CTd7j4L92HCm2SDfY/i6zJAL7bxWE2OZgEgHsJQJZy0z2ACFnKFZrMVr9k5LVA4E8AvYEpNehRc26B4MTLukOzl3XGSXeqcjTb6NCspTe53zq10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJvTVP9i; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c70c112cb61so5509582a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 18:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777081248; x=1777686048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxYF7ui2BPFGy0dMMzZR3KyJQqUuOE+azCNCA95w7Vk=;
        b=aJvTVP9irXwPzHfYR8rRujCbjERMNfW0EkjAh7QkYALbudMRPNPX6ftxsiK5/fOG0c
         RqtfwStOZnxirqfIOhwSlWa8sZzTO7e0NMeg6ABZ+ClHUjjOLHDG37MjHDJ5dJlun/Bq
         0aIfTDyexDM7/tNiIspzV6NsPdQsCog3OdAVXqoy8L13c4DH5az9hI6dl2QCZK1gSfZ8
         udG176foGiGoJnzVE3sqh2xs9fhx1xZ4FIeMqBdmXNwh8RmTp+fbPRYDrCB+daWeh8ap
         lX+it7Oxg6BRh7f8ZHFf2F3mr9JyioXrap1keY2ZwHQ33PhN/30E6g2+4gOmq7+vl0JK
         782w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777081248; x=1777686048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxYF7ui2BPFGy0dMMzZR3KyJQqUuOE+azCNCA95w7Vk=;
        b=r7OWZ8TIf03xcyv85Z7t+54S8cZXYXzmPSfwDeObLcAvGEC4Glb+SAxxge9KzLFjwj
         ysbcGwYURmC1zjnhPbKq8lR+0g+5GXnvVwJXhYQmiU9UL7E9n8i0q8lQ5D0WgQoZtZLR
         xKW9ezUlgwwRUZHnm8XwgyePFdvTKMyTjpq4vYZS5I+eFFk9R6g1EFIRrePOBxhwUkMU
         vzqIJ5+IiH/WV5Wz4UA+00tEeZJwYcU5gRIIIRGQQLMFlQBZGtmuRc78BQ59jxdHgSM9
         uLyYskVVG0Utw9sC/0uxt3K1k86ZVHidG+2T/RC17WUtQuXaUEjysxPuLZ9jFc4fUnwY
         J7+w==
X-Gm-Message-State: AOJu0Ywdd36O+ci+U/fOLpUedlOMk5XISI6vUobu2BFERMiRzLEDJ9KA
	n+xSrH+4EMiasYTFnohei3vbKcCihyziakBIhbasEyRlkfFCxNpJkc0Z69nP4g==
X-Gm-Gg: AeBDiesxXof7xx2QhdCOVOwkdInHumGoVUFsvAjp2Y4eSRYF9OETViaL47+DnBOcGut
	CXzRK8wPUuCeD+cWtEFleJPUiLdkJB1Iw4WdUMznoxryfySxI8+A3PxIW53CywQG3QC9VuEGraS
	oVYTd+ahRH/RDW81PvO82J1lGD7Newa91y+cm9fSDa5rcFR9xi7tCs3D45+pg3s/NqsRIi48QHc
	ULIwBoR3FKFHSkOLTBBrjkEODQqFEVzjdVAuTM5QDqPxdK2TdO/YKGAiI4Iy5M14MxKetIyx13U
	YNGafzCugIhbvjC732+B+r+z26ptXMRskv2CUINuqdIITSn2LYumttOCG8uJLY0OfvEf+voA+cS
	P5IokNq9Wd23IldbYfa5V3RDUsQXj73VagICcsq404bhTD8uf2ktlEP0xMtQszxOBy/fSAeM2kL
	bFjpahaPbu0f4xE0nCZP84nCA9Wyi7J1+P685+QtEYRSQs+sQsUQdIjErP6hFqLSqXIEwzvoYkj
	uLZvRsh9CgqYcHNh0BCmTmQkw==
X-Received: by 2002:a05:6a20:6a0d:b0:398:9d1e:1c6 with SMTP id adf61e73a8af0-3a08d28d04fmr37529929637.0.1777081248013;
        Fri, 24 Apr 2026 18:40:48 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f0811fsm18694358a12.0.2026.04.24.18.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 18:40:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: starfive: jh7110: use struct_size
Date: Fri, 24 Apr 2026 18:40:29 -0700
Message-ID: <20260425014029.438186-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2CE2A464755
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35520-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Instead of an extra kcalloc, Use a flexible array member to combine
allocations. Saves a pointer in the struct.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 12 +++++-------
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index e44480e71ea8..3572e8edd9f3 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -857,17 +857,15 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+#if IS_ENABLED(CONFIG_PM_SLEEP)
+	sfp = devm_kzalloc(dev, struct_size(sfp, saved_regs, info->nsaved_regs),
+			GFP_KERNEL);
+#else
 	sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
+#endif
 	if (!sfp)
 		return -ENOMEM;
 
-#if IS_ENABLED(CONFIG_PM_SLEEP)
-	sfp->saved_regs = devm_kcalloc(dev, info->nsaved_regs,
-				       sizeof(*sfp->saved_regs), GFP_KERNEL);
-	if (!sfp->saved_regs)
-		return -ENOMEM;
-#endif
-
 	sfp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sfp->base))
 		return PTR_ERR(sfp->base);
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
index 2da2d6858008..188fc9d96269 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
@@ -21,7 +21,7 @@ struct jh7110_pinctrl {
 	/* register read/write mutex */
 	struct mutex mutex;
 	const struct jh7110_pinctrl_soc_info *info;
-	u32 *saved_regs;
+	u32 saved_regs[];
 };
 
 struct jh7110_gpio_irq_reg {
-- 
2.54.0



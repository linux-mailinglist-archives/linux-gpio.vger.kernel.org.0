Return-Path: <linux-gpio+bounces-16151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5F7A386A9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E64557A04BA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB2F224B1C;
	Mon, 17 Feb 2025 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="u3i9lFTn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529C223324
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802980; cv=none; b=QbwuKm4mNGU9nWb+eaRmNI96JSapWu+OiwaXWO5UUS5piWsZWhyXqSa4AApbAv9JOk7ZsoKOzq1w3p8OBT90/gbq26H6QlbBxoI1dz5nOkZLwYjnRVl4zoxiNb72OWpm65hJI51/cieyxHnB3EfQTosHYql1iPNE7i7yke5k5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802980; c=relaxed/simple;
	bh=iH8P3Qo2jiFyP4RGsTFt/HsQ3VlXvEit9tWzKXSKuck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVGo5L2RDU8S+VwQ6wbfEON+MOBrItdiW2AfnQ5F0AG1hgWMmJuUX13EXX3IrPnXQ4z5VhqeeEK95HnMDeqkzObxkKTxKzjbsYgWf+anhvHrTIj3BM9MvQvrsq+OrT9TOo/0ae83lYsWuKhUfLZS1hxX23s9kUOIgfR1LU85X/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=u3i9lFTn; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D52C140133
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802976;
	bh=FjdYUqaie9BiRKi7ISU7HN1qGBGl47EuEmlrMDzrJcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=u3i9lFTn29dtnRj+nr8uk/jjB+ebZgPXh3m8SibRXu3Uu5mp6D7CqIjgcFEaYAweF
	 KoVUL95j8e/mYKmSIb4D/hYzEdEBWUqEiyAqyLEBT/mrXE0kr0Cagz/+zdWJZIsjTc
	 ZjEgUkYRTLq0GPf30E8u+4LIA+hVBAqhPLltfL546K36oX+ETpqb3889xo/PvyRs8P
	 1E8W0TbVlbEfyIkT/MLTDmsEjiMY0+trneur6LSuvFZ5dMzYmmoOyojsUwPEeV8pGr
	 Nk/H6Fs1LTloJvH5N82wzYYRZmC6uKdcnjn6gpKM7ws8ExfZ9ve5JSc/TpBMT7x20J
	 SzNHbsOqBg8jw==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc0bc05afdso8946060a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802975; x=1740407775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjdYUqaie9BiRKi7ISU7HN1qGBGl47EuEmlrMDzrJcg=;
        b=CMVFx7CiLHEBqw7YUqozUhp/ZDswQuGO4kT6HwRCyUw6l0xf4SsWyg8qJzxvLgNRET
         jNX8liUqO0tw2478vOMv6eB0MW3lmdZLIaugcPDi10Z4lBhbN2c7+lut1+xM8bhaPeq9
         mb1SHFJjXwGy0BHYjljte/X+wXlmr5IN7wZc/CN/3SAPcOTfCKRXZbWJx21VYmM7aWAi
         MIAtwJGzSMAgheoSlEODUX9RsjAotDGBU/oQBXBKAUOyB3SBZu+EL/6VeYZXgOK5eZE3
         F+KC6VlLri881EjiBreTfuAckgMNUExQdRW+pkEicLR28vU1c1vXrXBVDcZr6M6fJwXJ
         UzJA==
X-Gm-Message-State: AOJu0YygifNwQX1lLwgGg0LNfw8SPw8IWNnp/j+zKa+wOPk/Wddsr7GC
	lIcCNVGItDj/RsQHvIIzZPQkTSZazYMH17xpyeS6Boik8LqVd6t31MIYSPFNWwJPIsv7KYFr6M3
	WdX2LegIHV7IqqSZQMSUVFlsuszph5Ca7mzW/lOXUITZQU3+DKSBJVBqztmfmNak/YmAwq0+F9Z
	p81w8w5oU=
X-Gm-Gg: ASbGnctoIctFsNY2YGNjkeXE1q8thiB6ILPHamnnLVhVcMtVCRakAB+cGsq2JRgEAp2
	jtr45hyPC5PmPo9Teka+6NPTh0/hvZeO1QAsADFIiNVdHt1nj3d+WUk0mKkKtNIgfolwpjsp5eC
	RWanX0yuZO9VnnKyvJPINBq9wAAZCni0e8sO+KOZBIA0Odyjtg8FNiyHK+n6AEyrXlzkOUxIMT0
	HCVGbGmgYeGvyTBzdPZeF1s3cwQT1tyTG6pKyl4bSUumgxTnhl+z4CLkhsZC74nopFOklwovC1L
	/KhNRmnlqkP59Yp4Xhq28cI=
X-Received: by 2002:a17:90b:3812:b0:2f4:423a:8fb2 with SMTP id 98e67ed59e1d1-2fc40f21df3mr15661127a91.20.1739802975191;
        Mon, 17 Feb 2025 06:36:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZKsGQGj5NNzfd+iZhP7H4YbLKGbz+dWsQlDfkLsBVAGiKwA+5hq+mhIdi3+Xkw1F8OltQCQ==
X-Received: by 2002:a17:90b:3812:b0:2f4:423a:8fb2 with SMTP id 98e67ed59e1d1-2fc40f21df3mr15661097a91.20.1739802974889;
        Mon, 17 Feb 2025 06:36:14 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm10057757a91.6.2025.02.17.06.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:36:14 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/9] gpio: aggregator: rename 'name' to 'key' in aggr_parse()
Date: Mon, 17 Feb 2025 23:35:28 +0900
Message-ID: <20250217143531.541185-7-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217143531.541185-1-koichiro.den@canonical.com>
References: <20250217143531.541185-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local variable 'name' in aggr_parse() to 'key' because struct
gpio_aggregator_line now uses the 'name' field for the custom line name
and the local variable actually represents a 'key'. This change prepares
for the next but one commit.

No functional change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 692d90246674..2e993c9a7ce5 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -988,7 +988,7 @@ static struct configfs_subsystem gpio_aggr_subsys = {
 static int aggr_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
-	char *name, *offsets, *p;
+	char *key, *offsets, *p;
 	unsigned int i, n = 0;
 	int error = 0;
 
@@ -997,18 +997,18 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 	if (!bitmap)
 		return -ENOMEM;
 
-	args = next_arg(args, &name, &p);
+	args = next_arg(args, &key, &p);
 	while (*args) {
 		args = next_arg(args, &offsets, &p);
 
 		p = get_options(offsets, 0, &error);
 		if (error == 0 || *p) {
 			/* Named GPIO line */
-			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
+			error = aggr_add_gpio(aggr, key, U16_MAX, &n);
 			if (error)
 				return error;
 
-			name = offsets;
+			key = offsets;
 			continue;
 		}
 
@@ -1020,12 +1020,12 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
-			error = aggr_add_gpio(aggr, name, i, &n);
+			error = aggr_add_gpio(aggr, key, i, &n);
 			if (error)
 				return error;
 		}
 
-		args = next_arg(args, &name, &p);
+		args = next_arg(args, &key, &p);
 	}
 
 	if (!n) {
-- 
2.45.2



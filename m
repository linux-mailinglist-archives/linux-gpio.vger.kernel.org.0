Return-Path: <linux-gpio+bounces-15195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5DA2519A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 04:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23CEF1608B4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 03:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0975A1D47AD;
	Mon,  3 Feb 2025 03:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="FTwHTZBu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5BB19938D
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552370; cv=none; b=eYd/K4ac065yzcNl5V4kJfHDig/T9Zo7SVNO4i0l4ul8G7vQHD/QOjG5U0z7POfQ2t7LGqgSBx5ZAPSlSHnET4yJsHrynKDCQgBLmr8U42YDL7JT27ebEfV/YJ8L3g94JCndSwk72zX+ZnjTDaeJ/rpsa+cERDOhHvOyQL8JHMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552370; c=relaxed/simple;
	bh=xUaAXI8fxS5jnD6rs8+ieKbRO/Ilyx8EwwFvd0xi7HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFw3FboXPcn2LcI5tfJJZIOxtIb7Ch6MXDtb0lBNdx/SZed/v9oMWpWQv2cqpuwaodyjOX9a2wxAOZbkO0qX85cpDwBisjS2XFyn7gs1Xzn5hIfiodHFBW8A/1MIk1xOHziucGGhsSCq94gIJCDHQD5zkCVG8XnSJXI29oCUuNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=FTwHTZBu; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C8A5D3FA55
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552366;
	bh=LIuVEkc8rnRPhn+h/+NDwPhAevSLWZ5xYAHN11UW6Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=FTwHTZBuhp0Me9o+b17Fn+pE86cJ62H5v5TNAen6uIhTWs2TLsjXa0sPQNuib+nPN
	 jljtvNU2DI7EloyeYws7cAup/A5IXBILQzFKHm9l8Q/VDxZU1oeEwfDnqQxWHXgHLL
	 cYnPkMONeGC0OAvoqYWI7tSDAYyinEistnjLz3aqwgDs/Uer6I12UgmExI48x8X9or
	 PN/GQVRNuZo1jCu/jxk4ztQlw594KmC+LobgVSb1BQ2XOHaBfKMANX9dI7LF5Bxoyh
	 kwNXQn/i8ktmPa4vsGDOPaPsQ6qWNHkC0YxejFkkES4WyguCysB29Gzc1AzYv/S/v5
	 Df6BHELd51J1w==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216717543b7so32354395ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 02 Feb 2025 19:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552365; x=1739157165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIuVEkc8rnRPhn+h/+NDwPhAevSLWZ5xYAHN11UW6Cw=;
        b=eM+Z8lY8Rn+SIXbcK1ukCr4ixO2JegtM8lRaKNNq/IfLv9M4NJU7leYLFGZW9mCZTi
         m4UOlESoFE3+ttKVkQKQZWq0VPCuUEKciARN2l5oElrH2JE8LNM+9fQlP0D1lprQH77b
         FYRGVkTlYvkYE+vBynyGY1vRkgWCQauT+TVj2xJYzio0oVlp6Z+KipYYPixRxfMvUDuv
         ltZOf3flNNBAc7JCcfI0YqiYt1oZfc2mlz2wWR3qrdnzlcUZ+f8BNl7+rtIYgxUd8RNO
         Tejj/UFjzhVx1Clp2N4dXeOAahHiurVuBn/NMKUOA95BuNB9Z2Qry1QKkYDOGoYEBGs7
         lt5A==
X-Gm-Message-State: AOJu0YyHH45t06bNbkcOZkNlq56ubuvvVrcObJ3GcfCwnxIhm0mqicrd
	WciGhQA9SV7+s37am0lh8ThmrcLgFC2PZ90t3zEd7czpW/cKgbgyvj/AScz0oidkizU7nKRqyAj
	sP2Euj5FxE44SYXAnNd1LEjtoHgbjDW1Of50mTienANycvpYWf/GxxYAZ7fih3QA5uMqaUervhf
	uRLQcQDXI=
X-Gm-Gg: ASbGncuWpHo0iftQjbdf/07hIvt65fmPz7FcZ7Aso5N+bTB2EPP5I5ajDBPJru5HPpu
	gem1dCVoIzw8XKG4YIV8vqES60OwkFmMf8HRbmJIkkeH9+32xgn8wMvO4YdWzZ7o3o1E7dT63q4
	21rn+GCTnfeTkUKq4fsulifgj+9Dj5hyyX3nElMoVWq5NUoQi0WMYN+dnlS61zZbeHkLmDJFk4E
	zVljxFSfBExk2Sm3mwYMZIJ3R6kHxNmajUMT12GIWdPZFlWgkkQH8XGE4ed0DHnLfG15PqBLqQx
	XGeG
X-Received: by 2002:a17:902:d504:b0:216:4e9f:4ec9 with SMTP id d9443c01a7336-21dd7dcb178mr370336815ad.38.1738552365212;
        Sun, 02 Feb 2025 19:12:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJZzJYjztg3YXA5nCzi8TiQrALpMwbavZ1V1gbQ1oxOD5vRmSN40RhAZTUtR00mhvxtHxEpw==
X-Received: by 2002:a17:902:d504:b0:216:4e9f:4ec9 with SMTP id d9443c01a7336-21dd7dcb178mr370336465ad.38.1738552364906;
        Sun, 02 Feb 2025 19:12:44 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:44 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/10] gpio: aggregator: rename 'name' to 'key' in aggr_parse()
Date: Mon,  3 Feb 2025 12:12:09 +0900
Message-ID: <20250203031213.399914-7-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203031213.399914-1-koichiro.den@canonical.com>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
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

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 268b9b580ada..123906c821b1 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1044,7 +1044,7 @@ static struct configfs_subsystem gpio_aggr_subsys = {
 static int aggr_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
-	char *name, *offsets, *p;
+	char *key, *offsets, *p;
 	unsigned int i, n = 0;
 	int error = 0;
 
@@ -1053,18 +1053,18 @@ static int aggr_parse(struct gpio_aggregator *aggr)
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
 
@@ -1076,12 +1076,12 @@ static int aggr_parse(struct gpio_aggregator *aggr)
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



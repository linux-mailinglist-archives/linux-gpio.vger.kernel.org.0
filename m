Return-Path: <linux-gpio+bounces-16082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35EA37455
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 14:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D8E97A355C
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 12:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6833C19F117;
	Sun, 16 Feb 2025 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wNqSMj23"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B121619E7E2
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710741; cv=none; b=qZ+2X9B7eJVhVqAd6cIbtGcy618KDbnBmxmurm+R5loGMr/hPXYQDnpvrZZC2vMwXY2CvEodyqBkx6sfgt5ffWVKHQmwWu1W6Ealjp1fx71i0UPqv+TrTMkUjeJW1ZYg4TmNa+tKQxNVcBeQbeIRuqPgHnxqXUWuFPKNVKd2AEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710741; c=relaxed/simple;
	bh=M027Wka85YHpOsFpEaAyOcm3fQNZIgSRcuqEQ7ncvt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/O2YQCb9+s9MQxa2ydSzCohlhTDRqj82Amy+UGY/ukfUg7PkT3B/4XIU3x3XpW4r38JA/93EHvR5xVVhb/HW9xjQY1dGPtlU7muifrtBgbX9UKpm1sQPpjoYpfK7eQu9Vt58lKNz+YrTtiX+9EeS+ydvCtRnfpcKsWKwmYWTIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=wNqSMj23; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 65C773F85E
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739710737;
	bh=zhY6qp/Hv2zLsONt663fjITCkgKIh4r/C82D6wubct4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=wNqSMj23iVMjMSErcMIQTHg0IOePwM4yMgqH9Q5Hg8Pf7cYdtpamHw2ducKn/9t+j
	 3S2ygAhxJ7jU4TmcSaVUOvoo2QL1dFN+Yrl0RmTGRZ5c/d7HY0ijuvbjd+HScJpKMf
	 el1X9H4dw683g1XOujKaEDNkdqGLkovdsgWdnzc4ZuTViEggOE0OWVdqxMfWqvAtj1
	 1Oc/irnWT4SR66WibAiYd0iDfVWex9QhdqFJuv3XSBB3rwoqsMRrPmbmMOjB5LJDic
	 l39R9AikJjShospqUJkrTCvOrP6VJWfEVf5QZyk4mueKZRD0LeFjvN61JOzldvjzMM
	 dAqbTTWVN7W9Q==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-220f0382404so44830935ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 04:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739710735; x=1740315535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhY6qp/Hv2zLsONt663fjITCkgKIh4r/C82D6wubct4=;
        b=tjZTgr7euhkoIsfVectOlLksTbPUpFQYVytIokK11B/X0W0XPDmq5K2d8xo9jYV7CA
         RtiTS3BkEPrmoJ8LnllmVxanD63ESNeKv9eXpHueOCDoLxwuum3G8F0YUvn1REJONc0M
         lBub9wYyo+w1nkFrUdxt7qsPuRXsvDJXs5UViaBqIhEFRMrER4GQKhBPIfX8bUOPqqY4
         OmD2tGZhhH/ScLfkTVKMWiV2q2HKNkI/VGYOE/9BsdAtVLiMtzeQhoTtYPpC0Ma/9R0w
         ApzPnjO8O2i9nfBMzPVQDVBvvucQ7YJQWhLSJcM+nDXJrNTkUiwvhc6xNZ/AofEZzKhL
         WAhQ==
X-Gm-Message-State: AOJu0YzcLRc9eEeYerYx91d9Ttwyuf+7nHojH3X+joHQskby1jRun8gv
	f9WRkF3rAV8SLYQTT0/LuQdoNeeiDIYl0KP+C68DqOlDU2okKvHkRzWfSZu/Qybb57LmbSbg8r2
	15y9GZ1BjCw8EkbNYvsBEGEPmqFDqehsgvZplcNggEdDIwYlYecK2sPjoTDCSzqyQLcbDfki0eQ
	8Ht677OUQ=
X-Gm-Gg: ASbGncufZ+qSVHiugTVPew02Zu+qXRjQ1fmkO9fVuNrFJIJvNRCF4E5HGfGu5+RTsdI
	LEYzA2T+KxifoVchOO7o9rmLrrAPIrdwZIw0fyOHofBkwWr/PELx2Hhiejl8+VqFi+Rwi/sHSB6
	X2Fb3AJYKw6ifwGqfOEphOovolisy08pFVdfjGyoem7289BamSKJKW+vHQ2VlFSPpOzQ5bjiYV8
	dFNkBfdNQFhWpdPB2V1NU9ckhvgHDzwi8HuaaGkQqwJABA7e4ob1rSpJpA+on0nNptO4wxOIpqk
	bvx0Bw==
X-Received: by 2002:a05:6a21:e8d:b0:1e1:aef4:9ce8 with SMTP id adf61e73a8af0-1ee8cba0fc4mr11535565637.28.1739710735452;
        Sun, 16 Feb 2025 04:58:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuPqNVXjgq1Wr/qoPHQT9LJIyj39hUcdGoEPe0WRrviyP2A3rvxb9A/MoT8qL0lIxtuEIFPA==
X-Received: by 2002:a05:6a21:e8d:b0:1e1:aef4:9ce8 with SMTP id adf61e73a8af0-1ee8cba0fc4mr11535543637.28.1739710735131;
        Sun, 16 Feb 2025 04:58:55 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:eaa9:d394:f21d:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73256fb09e1sm4316545b3a.65.2025.02.16.04.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:58:54 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/13] gpio: aggregator: rename 'name' to 'key' in aggr_parse()
Date: Sun, 16 Feb 2025 21:58:13 +0900
Message-ID: <20250216125816.14430-11-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250216125816.14430-1-koichiro.den@canonical.com>
References: <20250216125816.14430-1-koichiro.den@canonical.com>
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



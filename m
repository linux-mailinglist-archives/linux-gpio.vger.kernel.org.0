Return-Path: <linux-gpio+bounces-17651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2578A6302B
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 17:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1322D176C84
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 16:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D889C205AAB;
	Sat, 15 Mar 2025 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="fR6ggpgt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32EE2054E4
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742056910; cv=none; b=FBOrX7416g5G+1m0fy7gahz1az71LQRZSOxTWfC8epo+JAbtNUI4gzlOq/eB2rhVZNfRshxIfk5lGht1QIAWXRxhOImiD9Irh24uMYGI0uA4aoUK3s6uDQgSkoqTW87SKVtoXBYKqt4c0enxXYkA5fz3SyP/KWg0OlcqC/dfMfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742056910; c=relaxed/simple;
	bh=hcT6Pkv849JRDuuXpPNqMLlmqrx2ytCXKRtqnB9DgRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4civf4miskopIN0W8YXoB2hiJVEBu06yN5UiuSA4awSdGf4oloRknNpON1MnMiR9MxSbltPMi4o6a3AQjMQG6bVnV975sUlgI/HhZC4r1UkeqbHlnxjMnsB4FcjlfdldoJoV+EwFbXcprKKwJeUsFuzq7jAgljJ8Fp2ZV+vvgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=fR6ggpgt; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 062923F29A
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742056906;
	bh=6y2HDbZhaY8Idh2slBQTtYTVvrytnAsA4PhON2tVLMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=fR6ggpgtURA2ZioK2hb1sRUzK3Um8qpLnHR3oGxo+U987TulZKI14q3jVyEu55yPq
	 DhzxICwdSRKvpUScTruchbAF8f3ivvAqJXDqSxxZ0IrM/2NGIHGZCjem4JK44ZWya8
	 LBgwCWlgPNZQEUuQabzNxmERT4/b48R5MUdZ4EgLJgnbKWM+dgw3sp4oKi6xO9XRw0
	 b3jOrgjjy/N3WmI0j/B9MeZ+FhcZ4LmeidYgFFFZXPNd6N84FoVybAznAIdlGgMYPJ
	 wRQQoG7U29TshiPpsxe/oabiHCUZEz5SUIQYrPpfmIGSShgwNkju5DBu0Ej9kiaHrB
	 ITjZQtI9Tu1qA==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-223d86b4df0so67442145ad.3
        for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 09:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742056904; x=1742661704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6y2HDbZhaY8Idh2slBQTtYTVvrytnAsA4PhON2tVLMA=;
        b=lI7dPEuNNDXhp9ZsfcEQcC+UwEKldyacPzUZQlCwDDaEndu1hDowLbRY62BP5NSkTl
         5ZHhbDSUNo/8kK3WWRRljMEMtUMD60z5DFDZn22x84U1vGb+GbYgF+CLWTS8TtfbOO9t
         G6vRDkfGBHS7kahqlcRwrTkZN/MX2y6ADeEo1REka/hovenHEBN4ngHK1MokI6zF9IPl
         pLoj62/LCbncRmNocvRvyhiKESMuHCaHh48bnCC1eIa+PbCQ/6Uos/gGKgwEZzXjA8uh
         X9vN84Xfb1guKS5uTlSlFZAb0jpNqqj6RJNWdAJQaQ6NsAbeB2qm4oYvVjQA85kwuc0y
         H/SQ==
X-Gm-Message-State: AOJu0YzGFVBSbQvxTVHnPxNYAu/fAchhug7HvuazRD0T9uDdlQ5kW1iH
	yeVFY1JH95EkuApIRv+NbFd+t5dDC/ZWeE7As86YuN1fOlVDySJYiDRzrLJ54EVE7nNYoXvMOtE
	WUnEmct5/0uM43J3Yd6OT1BYuee1mNGksWz5S2EDWk2MpY1jyJqSNZ60Ahc9ZpAwi+/cSPrnDS+
	OpAx8lnhA=
X-Gm-Gg: ASbGncuYb0y7hm4b1PACiZhWMblpRipf1lMcGmss1sQBmMrAtyOr5Dl45rmG0a5g9e3
	OoWlONCsg7OduuPAgiJcrUg/POomejZz8lRYGgJYhK0JSHx379XbUrJrlziAQ4q0x7GDSOW3ED0
	/1W1hn5E9YfWTh2ytO2J+vOdHuCOvvsCpz5OQY/bvTUkFaWsgTBeH2gDPJGU4hkQe3pUuWMOi4n
	c5MYsjOsX/9tynt9KfMO0EFQz9bf64zzForr6n0AseKVSsZrSBYHWw4VONVa8TKTd5JpX7m2NW6
	PMf/ld8ny1lukz7+
X-Received: by 2002:a17:902:c411:b0:220:ff3f:6cba with SMTP id d9443c01a7336-225e0ae70b8mr74365845ad.38.1742056904599;
        Sat, 15 Mar 2025 09:41:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMXBdPfzXEyy/Oz7vzl5WYmItCelN4wOI+AARmFHRLdkSNEbkkAQGzuJPH0K7+rDBLiTC1sg==
X-Received: by 2002:a17:902:c411:b0:220:ff3f:6cba with SMTP id d9443c01a7336-225e0ae70b8mr74365755ad.38.1742056904249;
        Sat, 15 Mar 2025 09:41:44 -0700 (PDT)
Received: from z790sl.. ([240f:74:7be:1:83e6:3590:3498:db44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371155e3a9sm4637104b3a.71.2025.03.15.09.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 09:41:43 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/9] gpio: aggregator: rename 'name' to 'key' in aggr_parse()
Date: Sun, 16 Mar 2025 01:41:19 +0900
Message-ID: <20250315164123.1855142-6-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250315164123.1855142-1-koichiro.den@canonical.com>
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
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
index 0afd5d43812b..7087ac599ace 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -996,7 +996,7 @@ static struct configfs_subsystem gpio_aggr_subsys = {
 static int aggr_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
-	char *name, *offsets, *p;
+	char *key, *offsets, *p;
 	unsigned int i, n = 0;
 	int error = 0;
 
@@ -1005,18 +1005,18 @@ static int aggr_parse(struct gpio_aggregator *aggr)
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
 
@@ -1028,12 +1028,12 @@ static int aggr_parse(struct gpio_aggregator *aggr)
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



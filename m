Return-Path: <linux-gpio+bounces-18256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1447DA7D2ED
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 06:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A36F33AD8AC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 04:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285B922259B;
	Mon,  7 Apr 2025 04:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LBPY3WHJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E40A19342F
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000262; cv=none; b=UhlGSQhgGxXoVOH1Nj+PxCYBJ1F1+WmjqYMk4XOBV3IUPD215mKnSepyrxyGZiVqxtvQoUC2aYLaYmF/szNYWldQlCX7bm5kbt9OCU6brL008WVThD3+IVCToH0rqUCAc7uTKwBaJt3OcsJU50uQt7GQQ18BP4TPb+BaluKQnas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000262; c=relaxed/simple;
	bh=topjyXl8cfmVC2wwnmz9rv1A6nyhahSaPg2JtNji6lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKSAbpO+nbeJ8sB/LLRqBZiVM1HIN8ySSa0I9YV9xnu9XuwClAxNcX8TpbTr/jgS0A6E9zzqfHO+fmPE1SaFYvbnY+LB97ngEytH2eNsdm8gEssIMMESe+T8JyrSnAipvTQdLJJmvPT+PwLBD+tdEjdI3M3QRc21BfFKo2sLiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LBPY3WHJ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 603DF3F29A
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000259;
	bh=JN2InJzY9fip1rzot+r5SY6hkXxBlsffh5kl0Mfv5JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=LBPY3WHJdVkXWqtvLgTGv4McIMBqZg3tQiVla209NiMLeT/CBJnBAVAga8HoARSad
	 zlQ/GDfc2lr+ji11vzXC3AW5rWRVAlnhP/dkB6mD8+gnypWUgqwyQTUNfEz0AKvege
	 fBRP7dY3HY0PbFCZdht2QRlB0CZvE1jyJwU7hWqsKOG6vifiAGUwR1DcjjUIQwdlJn
	 vVghKLALleMc+1Jgdz9lMmWcsphwKP1WFhNWOx6CA2sW0wq50hByiaidXey8MkEivm
	 MJEcRAaxbYyUMe9wSP7Z3QPfIrkXOPfEZI0m6+MhJZAzYXUzfqL4tdPP6KTyFCss6i
	 PVeMeqx1oJ5jw==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-229170fbe74so31708145ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 21:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000257; x=1744605057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN2InJzY9fip1rzot+r5SY6hkXxBlsffh5kl0Mfv5JI=;
        b=tt1dmmZLQT0C+nH6KIlmeMDZvui8sSP3BGugt50vdgYFki3P1H1XRQDfdeD12cfdt5
         7FlONx3+KK/Ej3Q/EScUuzn4F3vzYWtOz+s/H6ERKTnvvR/JpdabHlhtwx0Nt+70c3Ub
         2TnSuPK7ofw7+ceMtqpvmdKIw9L3W7b0unDcghdTFlYKvIVzCy95awwrctVNAuGdxTYN
         CUs8ON089a/JkKRcPg7UCGrY17UD2RlAwDf8LoX/YPqBL11qZNI+G+ilJ96XAAbZMYbn
         tgLoBzlGMod0mOv1uBM1DEifm5DK7BUV0QgaAz8cYsH6k5VGVBbdxC0xEfxs0fHiIJHq
         HL2A==
X-Gm-Message-State: AOJu0YyeVXJ97GjGkey2R41G+iVePaseVbQ4WoRUbtsB20dhTpg8W7jW
	4UnT7WxT7ogmJSl4Dogh6u/xy2OZ2ecik2Ce7cm1bkxwLPLMHvjbhaHsJBYnl3clpefEWP/iaHU
	n1HeoRLus4fEoaOHkUww6OLgzVNQl/L4V8DFzB9ZB7NzNnbESfgirWcHPYT+Qz2xOt01jkJGpc3
	9L12Rmc6Y=
X-Gm-Gg: ASbGncsHI4WfPZAyxpqwOrYEsvPmf2e1jygso5R5ICI2RIgJ+8diiEiUi4ytxaJ6Klx
	tUyuuZxH2FWWlY7BqT5SmZcVlDwWUyKxTw3XYxQdn0oiR38WGvKQPqm9k6XunLyrEhPAJrhDy95
	6rqU30w9+zzgXNdTE4ZFyqMzbzUnyhHpsrjjCUlvylqqOar5tIrdZUmrMel/5zULMKfpZaMZl3z
	c2ObAK6+tidbBvFhR3GF5LI0ZqHgY7YQ+VwD8r3YlSLJUZ24dQ0P2+dXxw/fK8Kd0h/gWxZovbw
	Ma9pG+hlJhdvpFiQpecf+VVM3CD+bpClUA==
X-Received: by 2002:a17:903:1948:b0:224:a74:28cd with SMTP id d9443c01a7336-22a8a87d03fmr152760915ad.31.1744000257308;
        Sun, 06 Apr 2025 21:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMJeKHzvUbt+AOJlfEZJCfM9kHhfstRNImHDDwMKHZqjXIMCC7cuk6cmuwqUav1kWPUQTDcQ==
X-Received: by 2002:a17:903:1948:b0:224:a74:28cd with SMTP id d9443c01a7336-22a8a87d03fmr152760695ad.31.1744000257046;
        Sun, 06 Apr 2025 21:30:57 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:56 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/9] gpio: aggregator: rename 'name' to 'key' in gpio_aggregator_parse()
Date: Mon,  7 Apr 2025 13:30:15 +0900
Message-ID: <20250407043019.4105613-6-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407043019.4105613-1-koichiro.den@canonical.com>
References: <20250407043019.4105613-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local variable 'name' in gpio_aggregator_parse() to 'key'
because struct gpio_aggregator_line now uses the 'name' field for the
custom line name and the local variable actually represents a 'key'.
This change prepares for the next but one commit.

No functional change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index d1c837f00ffe..2d8a7019b75e 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -998,7 +998,7 @@ static struct configfs_subsystem gpio_aggregator_subsys = {
 static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
-	char *name, *offsets, *p;
+	char *key, *offsets, *p;
 	unsigned int i, n = 0;
 	int error = 0;
 
@@ -1007,18 +1007,18 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 	if (!bitmap)
 		return -ENOMEM;
 
-	args = next_arg(args, &name, &p);
+	args = next_arg(args, &key, &p);
 	while (*args) {
 		args = next_arg(args, &offsets, &p);
 
 		p = get_options(offsets, 0, &error);
 		if (error == 0 || *p) {
 			/* Named GPIO line */
-			error = gpio_aggregator_add_gpio(aggr, name, U16_MAX, &n);
+			error = gpio_aggregator_add_gpio(aggr, key, U16_MAX, &n);
 			if (error)
 				return error;
 
-			name = offsets;
+			key = offsets;
 			continue;
 		}
 
@@ -1030,12 +1030,12 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
-			error = gpio_aggregator_add_gpio(aggr, name, i, &n);
+			error = gpio_aggregator_add_gpio(aggr, key, i, &n);
 			if (error)
 				return error;
 		}
 
-		args = next_arg(args, &name, &p);
+		args = next_arg(args, &key, &p);
 	}
 
 	if (!n) {
-- 
2.45.2



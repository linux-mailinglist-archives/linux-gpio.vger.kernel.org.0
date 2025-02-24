Return-Path: <linux-gpio+bounces-16499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96BA4237B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2858B3B7917
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAF02561C3;
	Mon, 24 Feb 2025 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Hq76Hsb4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E6425487A
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407526; cv=none; b=su/Tzs/zfc7QYiAvYpmedthXayXUW5t5mhRwxQy5hK7Xhkxz5cHxh+rIjliDVQuE12C9UcSwtwjvzj9RiX3BzDhy+ywiZ5BHh6zpeQRFF23plBvs7VR2P7uKADOaHwqbOt4t74u00mVtjOcS/fOFUV6A6YbcrJEm0SdpD4aowP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407526; c=relaxed/simple;
	bh=mIMrKN5xcM7tpm8rlo5k3zlkRBdN923WRx56grA2Qdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqm4UvtRRock6dsrlqkSxaAfbkZY8VlW2BER7kJ/bgXHlyzmmxUvdkpWquJojsW9y7j72rJs7FtM3jGOLrhRFYfqefnZ1ia3u2xzUgN1blpujAo3SVzdtgxweZ76+sMDrIWE3elqbDHNcTyM7NwxX+Fk1tv/Rvy0xSaiLkJNpcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Hq76Hsb4; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 727E53F84B
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740407521;
	bh=DjlFi9V4c7FKst+EVjkMgygpaoK69o8x/prjnL49xtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Hq76Hsb4XzHKxsg5CFq7XxqWf2fz9LeR35/YER6bBqG/+OeGEeqrscODnz7HaJi4n
	 yYGx/6DCKDCdLCVHrwYSU4fds3UfH8jtoGAqKZccJmImfPNelib9KsjNFQ3R6wvcE2
	 NhEFDHd4i3DwBAfhUGlJ/VtSJ90ygk/+R09PCBMCoGHi9ER7Qrfj8Z3WrNnVt0J5JL
	 5Ij5V/YlfMffKagmzs+hMDNHOscW3shNWWBOHmF2uYlo9kvPi+1ChQYoWtO9mZuX/m
	 IiufKhclew+6s8J3FcDm9e8t0AFhdrTM5pGRPHS8MlU7xqtOmWqEdrVeA6fiZL3EFa
	 ivt1iU7LXkoOw==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220caea15ccso143078685ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 06:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407518; x=1741012318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjlFi9V4c7FKst+EVjkMgygpaoK69o8x/prjnL49xtM=;
        b=ATSP9zplNvsn1u55XGx4/4QD3nFrpPgIMtyqbJY4mTDFZNZC/QTPDEPDezUPVUe5pn
         3NSzPDGTVKiMiaTtB65RIyRgoj17mF248yqx4vasaxl7ZX+15o644AYn2KMpiabJnaHd
         VraMO337J69OsAGMs3shhWeAizCBWEJdmXGKFi135QveAH5SdM4cJkZox/9dpYFClw35
         CHKXUF2IOgXieUZWHhmYcKLr/n+Yf0qYskUrdZJ0lr3zLybS26lJUO9zGV3/NReErpzi
         ++qVjBtK45n90tPxAkUyeD8UidFzlt+N7504SwkTXGZzrL4hCbutbINZ/pFMWMkqmIlk
         rqYA==
X-Gm-Message-State: AOJu0YzfF642XrXehaInz5ALhzvDoFDt/njHmxPVGoWWKTWJ05U5yDh+
	lLhTnhWCl0TfdMxX76KtIY6SeBEOJHuhoY3L8OjzCXqbQn/PEjeOW7wVKFqk1nCoHSW/zRpePpN
	6DEG5HGrpFN8S3gTmqOYos0apUpcesEppF7N2OfVa2gKaeERbFO9DbqOpYgUC8hgAEwoNispfhX
	qQSanzo2g=
X-Gm-Gg: ASbGncuIXxPhP09mO6yYxxCnJ5oTVOePdnPZF52XkGD7nrz3CGgTqgrNg97eZon4OsJ
	24UdL34SBHGcrrbp035b2GSv84I7aZDZ2cG37DaWsUHc0KXyJM7+sQKgr8XGTTXZWO2f8Ak4VQv
	3pdDoq5SdTQz2Ddbj6SwUJCeeHkChJ/I2ex6jwgufjbLFpJYWU9f03+HSTspL6Hvy/RtmSYQmAb
	qvWrVMAoVxzP4I2/3ZUri0qlFntVWcFKmM65zubcQKlUyWqrcITbpcKTqP9jg3KSQPz49NaNkE5
	eBcIwHKo7nDwMxXs
X-Received: by 2002:a17:902:b205:b0:220:ff3f:6cbc with SMTP id d9443c01a7336-221a1148e8emr166230395ad.34.1740407518619;
        Mon, 24 Feb 2025 06:31:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz9BZWNkOBscqruU/pzCAxXMyOaiitRO4f6iCRddeVjQzMWCXFfzbSgjTM0tjnPfmZXCi17A==
X-Received: by 2002:a17:902:b205:b0:220:ff3f:6cbc with SMTP id d9443c01a7336-221a1148e8emr166230025ad.34.1740407518240;
        Mon, 24 Feb 2025 06:31:58 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:de7b:58db:ab85:24ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d067sm177613895ad.109.2025.02.24.06.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 06:31:58 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/9] gpio: aggregator: rename 'name' to 'key' in aggr_parse()
Date: Mon, 24 Feb 2025 23:31:31 +0900
Message-ID: <20250224143134.3024598-7-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250224143134.3024598-1-koichiro.den@canonical.com>
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
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
index e6d455089a27..0c30153ce9ab 100644
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



Return-Path: <linux-gpio+bounces-18732-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC06A86C70
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 12:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5895E7B7281
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 10:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6DE1DB125;
	Sat, 12 Apr 2025 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBYzzEhz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6A71C84A5
	for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452916; cv=none; b=OxG2l1GqISYwre3OQ/KzQdtB7n5d4WNxPjLf3Z2CdLwZtiET7h8NaHKNptnUqMEr+NhJ01x8EuKkttLlFXBTi2Tc5GUscFBI6TGpqJgFvIBVbttqo2qpRh+SqPpLKo6jTbPcoZsEsh3PEtCLV6iu8MGQEZ6u5p5JsH9yyMASa0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452916; c=relaxed/simple;
	bh=nBOw1K56zx+FMK3TMKr5Btqqg5rXK/cv3N2NaH/vMdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtY2k3GfmR82+CRgd22y3dMFoGhnoGhcJ7cntlOyb1Rdum4CMJmCcZtNjTzKhSS9S8QmHaIv9S8dH3gWPkjKwzYpCd52aZY+eHPVClQ6RK/6OE3sxSFKrtY4KF4HIgi5FHU10tW7d20M6FEsbLKxEzW7Xodww3uIMlLyYJDdPiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBYzzEhz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so24649185e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 12 Apr 2025 03:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452912; x=1745057712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5GJrIXgOBYoDItQRMyP/MgpEpQGYcUrfGmxOpH/blcs=;
        b=xBYzzEhzHFXcpcBzJmq0B9IAYznTalMzCksRN5T1D+7wOGD8Yk7zpc0JAAS6vxeEou
         XIzfSJBTuvxft7dI7QcfDjQB8OEXKjDIPhhBr25VXWUygk2/sMGnDKDlCpzX7U7i0kiD
         M2AeV6F/QkGytkaed0SAap/Qhi7cGxw8MJCstBUqzDiZ6nefxYt2UVd49VL/xhaasWFv
         UqO2IlJyU6s81bEe7x/35Yvp+SfmGpaluhM1UeLZ0idF3l4XECqglH+YgchNQ4+QlHqc
         6JheP36meuxqvx4X9NJ0fS8mahHr9UaakLVtPFVHEj8IC/n4qq9yfPlXtE2dIj1HTYnq
         erag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452912; x=1745057712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GJrIXgOBYoDItQRMyP/MgpEpQGYcUrfGmxOpH/blcs=;
        b=ccNGhyYRSvElitz+OshTPIrztzv8UTgrwdtr8AwGPjpZCTrN2YVwad/rAQAoqQ3M+D
         ufFlJJZVNNKn3WUhvG+Irkt1Jv5xtgkRqYcqS0q45Ki+YB/9zAb1vCxghCWmMZVUKXY4
         ycrzIflXw0FppnhaDFJfQ7652A3jfFsWSl3opM8w0O1oJxlFZH+pktJp9ssZ7W4T7CPr
         /bV9zZLhMcpDWcIIJ5evwzZ2oaNJSKD2FFniw7EVIUhhoFf/mJ+hl+YEyN43GMbY+is8
         ciT06X+E1V9qsSW2gIySfzuQQUrTzEID5PGp0KO1ghEsHeDamE3/gqW/pMZIXxcBT+NO
         43ww==
X-Forwarded-Encrypted: i=1; AJvYcCUkW7JnR+cAROIH1ZX4nvIzRXUhkfyF4RB2Jwls0d6K394ZVjAj3CJJ4KhFt4d16qsqgAStIMm076Pa@vger.kernel.org
X-Gm-Message-State: AOJu0YzPsL/1EV+TP0eMW7tqZZtfqV+FtEo6Pdo6mnWRfz2HrZ9TfkVf
	5LdeZChoDJa75HwzX1clShPS8c686A/1rJuUh+0bUbKDWtnHpHwltVRADMTZ91I=
X-Gm-Gg: ASbGncs5dXeb32ld8WVLZmLquEBYSRPYD2WPo4AVC50LTdDJvxlZ/+r66suNMG4UK/c
	efMTKp0roxHs9eTc0e2gjoHOUDpxB6BOyxUs38jIJUHZYcAD1S2WA31k8EHowxCHucjvvAG89sx
	xIhhV9I0LKtdaNxd48GDZA++R5LbSoQCpuyf9YRxZgQNv/vGphtg7WJ3LDvzbFjt0Nntqj23DiO
	ZB9poBibp5FnpA60y0nW+3gxwKJ7aaUQ+kIA25kyODs7+m5Dy802C/PqFrvhoKfPZ3xMg+KV5k9
	KGcWJxPMBqoMmc2v+yWbBqLlqJH3veoDzbaJcKYr9kXRPd5enx+2smOu
X-Google-Smtp-Source: AGHT+IHJXNcS7Hluji03dQdPRwTs64eZnH+yKoBp7cnqjsxtXtXhSJ0iQiymmtzYr1P8d4dUS+aHoQ==
X-Received: by 2002:a05:600c:1d83:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-43f3a9aed73mr63941575e9.31.1744452912570;
        Sat, 12 Apr 2025 03:15:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f235a5b08sm114474575e9.33.2025.04.12.03.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:15:12 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:15:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] gpio: aggregator: Fix gpio_aggregator_line_alloc()
 checking
Message-ID: <cc71d8cf6e9bb4bb8cd9ae5050100081891d9345.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

The gpio_aggregator_line_alloc() function returns error pointers, but
the callers check for NULL.  Update the error checking in the callers.

Fixes: 83c8e3df642f ("gpio: aggregator: expose aggregator created via legacy sysfs to configfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index b4c9e373a6ec..e1b2efc0df99 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -984,8 +984,8 @@ gpio_aggregator_device_make_group(struct config_group *group, const char *name)
 			return ERR_PTR(-EINVAL);
 
 	line = gpio_aggregator_line_alloc(aggr, idx, NULL, -1);
-	if (!line)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(line))
+		return ERR_CAST(line);
 
 	config_group_init_type_name(&line->group, name, &gpio_aggregator_line_type);
 
@@ -1074,8 +1074,8 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 			/* Named GPIO line */
 			scnprintf(name, sizeof(name), "line%u", n);
 			line = gpio_aggregator_line_alloc(aggr, n, key, -1);
-			if (!line) {
-				error = -ENOMEM;
+			if (IS_ERR(line)) {
+				error = PTR_ERR(line);
 				goto err;
 			}
 			config_group_init_type_name(&line->group, name,
@@ -1105,8 +1105,8 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
 			scnprintf(name, sizeof(name), "line%u", n);
 			line = gpio_aggregator_line_alloc(aggr, n, key, i);
-			if (!line) {
-				error = -ENOMEM;
+			if (IS_ERR(line)) {
+				error = PTR_ERR(line);
 				goto err;
 			}
 			config_group_init_type_name(&line->group, name,
-- 
2.47.2



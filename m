Return-Path: <linux-gpio+bounces-10317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 534F797D788
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08DA81F21CCC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A31317C7A3;
	Fri, 20 Sep 2024 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ih0hNjmu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B8213D28A
	for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2024 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846516; cv=none; b=MCLM/eFKy3LaOVw0w7r/nje/x9Eg+1+EKUb8PhwNDHfmIaRI0rKeSbd8qFectvgnSFEo6B1oqvHVyXegOHw4C0eSMex19l5lLs9KxYezeiiMuCnTUUm/aC4flwxxxwsDo2p1T/HG2rNnEEvD6l5sbOUFMFslGVl5NJT64L7Wdco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846516; c=relaxed/simple;
	bh=+IPmt0jxSkbhE1Zqfgm5OaQQ8WRWtSX6VbeNZQViYU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aq93WNVez6jVkj9dgc0KJHsJLxxsiOYsYZlUOgBdjkcyIEdjddQfSPx8yTPaKJtfJFpFNfTOqTENTVTcEGE2Ky2SnPPllTKKerW0IWNiIh5vM0j5fXI/VcsCKpNprJ7h6Kfz0KHn3aBH8dsFnE6vsYxnG+vefxEpkxCxvcQOeyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ih0hNjmu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso20513425e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2024 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726846512; x=1727451312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fU6Cwa91hojy32E00DvQ6yVAx8vbDlWmMY+GG+TR8qM=;
        b=Ih0hNjmuAc6FWzqe/LXD3aI1hkFfNaYINDjyohs3MWlX0tykCS7mEELxflj7okZrzZ
         Cb/xl4DF7eul1d5ouCi3+7sLFAz/ag28F6cJVSrtzoRGACtNHD141+ed9ucNdWJtfazW
         zyqjsJoeALfNq58/d3jCH7pDr6Bk+JiJpVKP4K073eboz7I3yJFlmjgsH7BPu8T52ZE6
         N5AvKMQtfgyTqPiOBMjrsAKPLBQEAr43iINEEI9cF6o/29t/B2WDnMYctat4Y1ec4I1u
         0oyNbOXVLDLKDIxQxsr8n9dUo0AIMW4jgEtmA8jyCl6Q0aARlgWBI0OhOusqdWhHN643
         jMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846512; x=1727451312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU6Cwa91hojy32E00DvQ6yVAx8vbDlWmMY+GG+TR8qM=;
        b=gObfiS7y0A6UgzBn50F+H+Nt9RpHbIZKX9bhk6v49TkENrVYTh+VJTwFHxCgfZ8hU1
         GCjyIyO7jVUMwauYwjTMsT69+W1vAP98X8UFqbKQMGt0BZXGcGSUEzZpEyjMnzAhefWN
         ukDMEAGSzShUxjWesNZUjtKCEODpqanbqWM84wouU8gZ6RBTYzNNmy+H+krassFvjRpJ
         hpUg8cHaf9dVb91RfeJ99mZAYuaeprEtWoIxfuVtpDmZpgrEf3uWMI6pFqip2ArNJRZ2
         FeUWFk5wa66tP+kgYeGCoTVqTxIU9970tkEWZCr+v5erEUSXLKfL3+d4x3TOvw6e8F6t
         JslA==
X-Gm-Message-State: AOJu0Yx7F5QRpkaGa0E2/O6KhmKbAZEZ29MFr7NyzJKRqsl96L1ETsr7
	Fh7IhtPTM76z9Rc8qv/KSU2mmZHOicbe5n1uz1sEPY74AcSCv2DULisDrPOoHlg=
X-Google-Smtp-Source: AGHT+IEpfw096sBIgGIVS8C62k1w9N8u4gVZYhX6dZA+v8qPQOtl0ZHDbI5DR1B20DSQp8MGrM0qEw==
X-Received: by 2002:a05:600c:1e0b:b0:42c:b62c:9f36 with SMTP id 5b1f17b1804b1-42e7c15a490mr19143725e9.5.1726846512438;
        Fri, 20 Sep 2024 08:35:12 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754a69a7sm52459935e9.34.2024.09.20.08.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:35:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: aw9523: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:34:31 +0200
Message-ID: <20240920153430.503212-13-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=970; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=+IPmt0jxSkbhE1Zqfgm5OaQQ8WRWtSX6VbeNZQViYU8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZYPNZZbig7em7wQIvI7M+rO8vK65NUQUXT8O b+v5dPu1uOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2WDwAKCRCPgPtYfRL+ Tl5qB/9nEpoaIQbpC4yIoKI1aSpjyhgV61JBv1WMD3OXnaUVv1FhIz/NoeuAgCfjIkRoUTLB9Bn CaY/BAEmrO49N+/Z3bV+GoBvfjeWdIY4VgvYo84QyjlKi96xYVI59IsM4MkqdL2ezrVQmrhQlKT yisGv+ADHKIxPfAU6MkkEvzx3szQHjMVaU3GHPy497388GJIgKClyUOexplonEfj0lALHQbKu3Z gUJr0j438CjUY3yrqQ7GEajFveSNfhVEtHsem7MmXOv7R20ivd9v76nR49aULCT/rgUYAD3auaW TgdoSqNycaz6tu0Ri0DpIo+kr3t1nmJBcnWNOWbHdpTb5hXH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index b5e1c467625b..d5cbc55eaece 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -1053,7 +1053,7 @@ static void aw9523_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id aw9523_i2c_id_table[] = {
-	{ "aw9523_i2c", 0 },
+	{ "aw9523_i2c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw9523_i2c_id_table);

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2



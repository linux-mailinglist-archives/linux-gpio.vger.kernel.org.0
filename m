Return-Path: <linux-gpio+bounces-8933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03013959AE6
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 13:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB78228346D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 11:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0853B1B78EB;
	Wed, 21 Aug 2024 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f02x8oyr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D491B5EB4
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724240544; cv=none; b=Ob1TUF5MWHlBE0PP/kAn08v33S1TvotZrukoxos12K2OkSxde5nIYepx56siNoEf7pFggcescR6ezocnosIBnFYT6xRw6nNNR/mIRXhUw267bFvY3D/53JA1qUbDmoOBmMNbI+9mQLW2WPQOE/zsvi1YBkpota95qfmrJJI8Kwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724240544; c=relaxed/simple;
	bh=gqFeZhLDZa8/V36NMsHuuGtqH0kl483lV0GD5epFpNE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u4yuyK5vHGmnYrPYzEQhMGuUM2zReOcrAVcyGo4s87nUe1vQgtxLi7KM73eh3FLx3MCRez8rmlrNtc4RSCq9GLtEx0y0PrixwybHjbtEA5D9JgBhIeSZmg8Vwhc7HsXbne9xFYZExuODFvfjzLRNfqJ89MK2FfZ/yImZ+B/fcNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f02x8oyr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20230059241so28119505ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 04:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724240542; x=1724845342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G22Fd+92Gxxc0ViKFeJcBhlfve/Sxtk78g15n/KrJwA=;
        b=f02x8oyryThW2nY6CeXyBqPiXcz3Y5vK31PoG3+Py18ZdpBNyiUTccT7AZpcNKYoSx
         apjicCOAw6x6oMDFBZZ0PYQWxdwa/8mUgGOtV3QNSeVaymZAg4GenmX5CrfkmCe6D2iC
         I8dYFqQgDvjWn9Y4saP0SsljGheRVzDeQdD/ykhVLqMeZzSTbJmcIbEnJp2eS7VW1rmO
         kEbGZf+F31c7ARbKXOK55QYSxh/dF62R/J4UMzBMRugoOT4R2WocrNXZVcrliPhY+7GO
         ryprdC84KD9mV+2M6MEPpbstYm7liReW9hig+QbzaKW8OIWB1Xwu9EQNaOEvmdwyMxPd
         UuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724240542; x=1724845342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G22Fd+92Gxxc0ViKFeJcBhlfve/Sxtk78g15n/KrJwA=;
        b=w1E2VjCRYc2WgjVSsR+attnCFgIVS47zFDSM6cXK9cMCr3UMaytFVqFvOebm+QnraL
         n/oVsdHosw2jIBgty3DcxH7SJW+wAt7tx2qiaUKw4r/Pb4/ysdoh1iYqL6FXVnTmt3F8
         RHIU0ARxSdVIqsCFNWIuaGMl9qonBeFHIZF/ECJIHMqPESkdoaq4xrYYzH7/occLzU3X
         VDhTQ9yV40Ltt139OAZ8VH/xRHJngIBF20o/ORhHfq4vf//Yoq6AwiWy9GnYgDhEioPN
         KvMawpzNwfYnfEVmAdM0Jrkk7k+z5GkBjM+UWKVr20C7Iyw3GiAD0ucQhaRVTAYdq3Tu
         pyQA==
X-Forwarded-Encrypted: i=1; AJvYcCW0OmSs6kWI4c29BgL78FzyJEczP49UcIQscQpYfQ79NTwH2qtnXHwP4F86RvVen9lXiBwR+qRvkgS6@vger.kernel.org
X-Gm-Message-State: AOJu0YzU55KwWwPBBwbajKU2PPMcNtUG1WEGb+bwZOdRa5PHn+MhrZGJ
	0d5uml5H4NQqcMumnTBorKGxiBgVOyGH//IvayIqqYzPYFVdDcED
X-Google-Smtp-Source: AGHT+IFnZAX+GQZkv8n5Y7ATr2vG0bA+1YBgP82ISc5ZgS9+4RF3vRrhfQEvBgVqT3dALxJCzJPAqg==
X-Received: by 2002:a17:902:e746:b0:202:4317:79c1 with SMTP id d9443c01a7336-20367d57521mr24596885ad.37.1724240542523;
        Wed, 21 Aug 2024 04:42:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:2803:be04:d9cf:894f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f031edbesm91754095ad.110.2024.08.21.04.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 04:42:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: brgl@bgdev.pl
Cc: linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux@armlinux.org.uk,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] gpio: pca953x: Print the error code on read/write failures
Date: Wed, 21 Aug 2024 08:42:02 -0300
Message-Id: <20240821114202.2072220-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Print the error code in the pca953x_write_regs() and pca953x_read_regs()
functions to help debugging.

Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpio/gpio-pca953x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 8baf3edd5274..3f2d33ee20cc 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -498,7 +498,7 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long
 
 	ret = regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chip));
 	if (ret < 0) {
-		dev_err(&chip->client->dev, "failed writing register\n");
+		dev_err(&chip->client->dev, "failed writing register: %d\n", ret);
 		return ret;
 	}
 
@@ -513,7 +513,7 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *
 
 	ret = regmap_bulk_read(chip->regmap, regaddr, value, NBANK(chip));
 	if (ret < 0) {
-		dev_err(&chip->client->dev, "failed reading register\n");
+		dev_err(&chip->client->dev, "failed reading register: %d\n", ret);
 		return ret;
 	}
 
-- 
2.34.1



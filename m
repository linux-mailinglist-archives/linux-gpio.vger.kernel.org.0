Return-Path: <linux-gpio+bounces-26544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C0BB9A677
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 16:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84FDB17B032
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F38030C61D;
	Wed, 24 Sep 2025 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e0lxZtHL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9F30C353
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725518; cv=none; b=SaUdfdjvsjTN46Tha8lv/U2KLAjpNWuJ1Ye6jSYp0RfZBRVWZG2MZjPTr93NXuxdqgh2t1hgKqz2YiCJn8SD8CqG0N0wIuSiQoJub+nEqZZHAYWtDmQYGCVEXZtlxNJzwrk1989aWygq33+Lr/ihbNQ5mNF4IEhdRqhsNA0PRn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725518; c=relaxed/simple;
	bh=L2kLAKhXcPRTSxYID5+lqGdmVixmb8cY89yQVUKyTsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmXYfxGBhT8xRvhox4VoyzaxwgG2MoW/OeI/xR4TrQp01odf1yGxraC7h8utdiUfjZ1/p2JweCrZVkzutNrVLWjNvMqFief0bwLFiY0cTHTE5jEYHKGZxmLTgRY8nXhd/hopoeYqDVjWNReCkEdkt7Affl9ul+GWdFIDZVcWgwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e0lxZtHL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46c889b310dso9404955e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725515; x=1759330315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0Q+Hgya9r+CWJ27IcqRYKkvlXmEyTvOuBCqoT3y8qw=;
        b=e0lxZtHLY+v0rBmlEbUurgnddp5kvZvgYOJbyCrfZMJBKNV2jPOD+ZMWL/cVDu6alT
         WVT22A7bGD+QsL73jovvMsZepws1MokS3LbFlQa7sIVtOMoBkMdyJ90fAeSy3uuLCV/z
         9ITaMZW30GmCShAm508ips6VzY8JNchv53v78GjQpljyHTFZebMT9iurFw9kr2ii67oP
         w89oqJJtsoWAO6k2LNQv7oJYOSUgvtzf09h18HGXCN2vzAPZTQlnEgwO6GTsmFzcYCFf
         2OJ/zzFM7ssPpsuMXJX+1jcUTC6zep0t0pTj745K3uOrk0Acnk4qvGOWodyJm+WlZ1IG
         sSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725515; x=1759330315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0Q+Hgya9r+CWJ27IcqRYKkvlXmEyTvOuBCqoT3y8qw=;
        b=JPAH3xD6G1EYxzHzG50qe3Kvprv/1sc9zS3sGakL4sXNbDtGAIa9WEx0fshlgXxq/q
         SA+DEYmOzHqgNu+QUO/fwWvGpntvLdEm8PtK7bVcCE7c4NcOP5jo1FcSnu1tCqqQBI7y
         eBqDCqsZYkApsjLNBGdYwu9/nnp6rkn0H6p34xB45+9wTSBKxU9H2kO1LxQVzX3zOHT3
         cI0wO7LZHEChaG3hFGaxYoJVAYh8Em8tGZ7PHHoCMyFElBrovX33aV0rx3xP7ajxIi1m
         hg0m45+fYzwVyLXMDOPPyept6rH37NV8xUtrXDpvrIjlHD3EddM7TleAmwjQ0swXwMPa
         caMw==
X-Forwarded-Encrypted: i=1; AJvYcCXFU5f0b8wHcfjftv7agu2x6lFZwPLhjD73UVMshGbQr1mheCO/7UObk7+AY5EA5AMhVtk1a1kYPRJV@vger.kernel.org
X-Gm-Message-State: AOJu0YxHpVIEQ7Xw1ZNksrcD122t+yb1a9uuWCqUZFGWXyaid5YYXdrK
	xa/8G8eSNfawoVK+RtyopOKiDQmAh9EOgjvZHa7Ehyx012o06Ymd/KUdBe0ipao+EJU=
X-Gm-Gg: ASbGncvfUlZBhSxzXA5Wia2PJVLn6vwqzdV8A1oPXl5l0nuyZQAE+R5+ZxJlWSXP5ug
	3kxZxyYvabk/3+h9R3kg+nxmpaVGScRsMvMlZnFjruTV3y9Gbqx57yDxwH83Kk3zT64EpxzM4B/
	Bj6+EsVolEcCeC8HZa24cBLYzqweblj7q1N2ch3f4HgnpvqUu0TzyOycfNPZ9yuLJ3K7I/Pg0SV
	qopyoe+ImaNzABoaFvBP9wZ533xRnNVo2PFViT5DaYjeok/33nzj4gU0bgYXN9XupBTWUt6OyVT
	u8BjHe2sXRngLPH4pYoqTVugX141MfpbrpndB4Ax1mLNwqoqgTLgU2nzF9mSAZ2LVAQxTMq2TKp
	1MuXpJ3dAYvKISZUUs+ZWlw5avLtX
X-Google-Smtp-Source: AGHT+IHqrlf5Iy0gafewEVEvZvdqGPtxzn/dahd6Ieio03KFz2MLsdyrnS63HEdvlLZHwR/e4CQuAg==
X-Received: by 2002:a05:600c:c1c8:20b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-46e2b52c35amr23884575e9.8.1758725514877;
        Wed, 24 Sep 2025 07:51:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:51:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:29 +0200
Subject: [PATCH RFC 1/9] gpio: wcd934x: mark the GPIO controller as
 sleeping
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-1-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+onLqCs+uky6KqRfHsDH/gKs++nVX/GXHjjSwDpjMnY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWFZY+Dx2G8yimcnZUw4X/JDBSCEab4BzQX0
 SEHR9ic5oyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhQAKCRARpy6gFHHX
 csl7D/93a8AjEBhJdr57hZV94lQ6L3oHzmrrx5+I11yewNKQjKjTiq/Sv7simTbkw5LqRHTNOOk
 QWOaGEuOezZILvfSLh1t7XubpcAX+zTbbff5+vb4ZdNe1XGw3g5MD5RLUzKZQ0hjOMJHU7L9tAJ
 NoggHvBT3EnG8Ws9nzAODXZt5TqCAudVYwg8tTt59kKaEXKVyQUpgfYieAEBx3nstzHVwhBZMsN
 PN/W57PhQSenmFgTdbS8wyVjzfM0yQvStz23TE80h/aC9XZT/OgLk/12DNudAF/HRKS5/Q3iuPS
 2HKCzPlKXS+fjOKXLiTomcVP8ARRmUp8VToNMHo4J4KYtNQXi08TC6HgRORLT/1wWctRhPuhb61
 OkA0dqVJVQGYlOElCn2+hsp5eNzF6oKi/t/I3jiVl7XiGyw8uvkoTWCUnNLGmIHFco/iJoLw7Kt
 sPE0BsweoKRZL6tWX9N9iebGP0cqbHMEsyPDeXu8SFvahdcdKtrNFDCksbyNqOKy+4aBmsmslUl
 SuxtbhyvNcNsX/RjP5FpdoDfQkcDHmiWoTFQvz1YGeGNIJeCLCBmFu+3Gbu4uBalakSNLTq5T40
 g+otJPzjjKDtCQ1tClpK7Ad+moqy7orLr6M64tCCWKk2ukhBIo+iwX0F9X3nRRLdISs6m/qIoR+
 N1Boo054QFUaFwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The slimbus regmap passed to the GPIO driver down from MFD does not use
fast_io. This means a mutex is used for locking and thus this GPIO chip
must not sleep. Change the can_sleep switch in struct gpio_chip to true.

Fixes: 59c324683400 ("gpio: wcd934x: Add support to wcd934x gpio controller")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index 4af504c23e6ff5ad2bad1d70a0c42e2fd91f0c7a..572b85e773700ea0740d3e4efc06d3538f7e368e 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -103,7 +103,7 @@ static int wcd_gpio_probe(struct platform_device *pdev)
 	chip->base = -1;
 	chip->ngpio = WCD934X_NPINS;
 	chip->label = dev_name(dev);
-	chip->can_sleep = false;
+	chip->can_sleep = true;
 
 	return devm_gpiochip_add_data(dev, chip, data);
 }

-- 
2.48.1



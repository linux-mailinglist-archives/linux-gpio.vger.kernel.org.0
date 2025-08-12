Return-Path: <linux-gpio+bounces-24290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A15B22674
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24AEE1B6374F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576A62F0C78;
	Tue, 12 Aug 2025 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hP3tGwV9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471F2F0C4B
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000779; cv=none; b=NVVNgHMcCR+H705jhhObOFDafJQjnh4645ySokv/q5emdO2Sqc55UeEXdgmUBEYQQoaUM9CHLsfEtR+x/9SI31j3O36CqPwAoWea7fHBBZJ2YKzGucHFfyRosw9X6wejMrD9VQv8zG8iZljN/+TWHFK1d6CJ8PIk8FrwTbaIv4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000779; c=relaxed/simple;
	bh=CjOqg/tMVuGjCBjMfchIIOcWxbiHZ10GFFMMWZMqLdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hx0FUlzTZ8wIjeC/L7Qnjue/jmX47S5rKGlRQe05Ny9DOiugALHnjiesUVWwx+Et4gkeQKgrGiZs5tkAOoYTzlLTzYMT5MHu5jTynP/YkYcAvXhpqW9nNhSlthjEwvOZb+zxBbO0goqHgxjp/mXSSih1TJxRQ7A4YONUL1WktpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hP3tGwV9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b913a76ba9so442242f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000776; x=1755605576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=hP3tGwV9LDnGwzNdepSEGfeYspXHe2T6BEWLV3TjxLz5KUpHc7E3yO9CUP4T7WPAn5
         yeiyIuLN/yQp0KEGiHX8Lq0o67v4PPtv0ssjZgyDUIJ5FWKKUYHrbZI6+HspdnWX8Omk
         Nz8awHP7O2hBZIuTgRXBZTb5TW7W58ZDy5AWfDeqhWxw2nIcdjWr0ruuunhTSPfrAxOZ
         7U5KdqF1mgJK25yhqVkFhdFWJZun3UWrbQkQ8w7JIbCl11A21qKfGfM7CNOqggPvWuCU
         BBE9jxPInF+cL4CsZRuOyZLd7ArxEm9xmmBrt5E7aG5Kd3jRyuRpuPxSZ3BcPvV+6so2
         cweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000776; x=1755605576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=HdnwK5BlTxvdh9ean4qa20wMy3K+YNiwF3ZsxMqHVKSiqSE0TTbQEG2lBJx+j7etAP
         HRbRXYxNahzQi/0JZ0FEjiA7zKlsKvqa4lXzbyZ4sto8v1yhhIFuoXD2HKHQSEz4DR/c
         o1Sqwt3gWTr+kKqK0/2k5wPGW0tXuVpYX6kcbTFG1+L8wzC26Jk1puoOf7e1p57pyp0i
         Do8MiQHR3pYI3kxUmq+d7c9O7oKojhmbXWkSof5l9G56XdehMxlIJKkiDwVeBOAXYPiy
         9n4Az/rLvRRdq/6ucLy/APvqwbja6wtEyjZjsjhZ1rfgfTbEV+KjDcpGeOhRrb7+XcEB
         Adkw==
X-Gm-Message-State: AOJu0Yxq1U25Mf7JHeq7rE1tirW1bW0cQ1u1TcMfOh+WapUhG0qixbDW
	eNqedimib/ysByIq1haIwpQ/1oP+xFQR3muCxiv4vkf4VtSxGHFvfpNML2yWllbhlIg=
X-Gm-Gg: ASbGncuNACxgOznedqBWyAW0+iccz35MnAZLBqSxFYZfMpa19mvNgcn/+1t4ASSFs9C
	WFbbJ04SjbzC/CmxRNxXmbmqiQZ8BVl0o3sKzQhU0d3FG7Zno9YDfgBlISj3wddkE5j7VNtrtQv
	vCdeH9sj87ucqoEZ9/OOgwMg3J6O+6FCF6ew6wtCvm/eWaszGbYKLufG86deKmwjXP2B+WMCvB8
	Vqp9+2ppb/TK8OxthD8ELs9TUUUE0Zvepi+q1Zrbjg3evjSGae6lfXYNud+ln9jQl+PSYXkD+45
	3ujYpWjKvjwCCXACBtWUvttL8X2Aw/xNLZ3EFff8paVLCnmo2BZRxAaVAqOIUcIq0rXv64xYY4R
	2WuI1B371v4V8KDk=
X-Google-Smtp-Source: AGHT+IEGQDIavEdwAVseF7zTTEBlsP3iW7+rCM7AvFwCujx1KCDQS0QsNDaVetuCN3LIEKies+x0jQ==
X-Received: by 2002:a05:6000:4283:b0:3b7:b3f2:f8b3 with SMTP id ffacd0b85a97d-3b911007702mr2510510f8f.38.1755000775696;
        Tue, 12 Aug 2025 05:12:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:46 +0200
Subject: [PATCH RESEND 04/14] gpio: ts4800: remove the unnecessary call to
 platform_set_drvdata()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-4-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=l19XxlCMzrhQb7segGk57h4S+g8U8d8cxgGqBJH6nF0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy+/9er37Ak/sFPPdUpU+bYimsPDTN2yc6x42
 FQ8FY/oejWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvvwAKCRARpy6gFHHX
 cs1kEACnksREk9QmO2FhzrwUyQY6DFqRCpWOw11t0IdlkTmT1crGP48e6IKjx54SKHyp4sN42jo
 stgwcLRvwFedR2zvmHej3NLE2HegxIm4m7iEfrgRnaPO3fLODyWUW/lMX114rXBqNa6GrspT2ne
 dP5ciZfuBXiSlsOVW16bgOErzHt187wcG825R98099jTmshxHjqsrTUlIsEsTtrLi3FEN4zIzv0
 hr5+6atZ0zl9joHZx2V7PTzwKZGbgzWcQrs6PieTOlLSiSCvWomMaM/tZhuro2JemTnb476JlhH
 //BD0Iw7ncTNdylkaDpA3Xb3JTcbgipc3GNuhp7mJhdruTE7AfWI0V92/a2P4rWfWSHPvAurGnC
 Nte/Q7KLeNVJzz1rv1O/6Phap6sCLBL7Brkop+kaa5OQPDW2wWX6fBTiC+UiYm0E5WwP/JhhxYK
 DGTWaHo7PDMXaxR9zrtJVnPiPLa/RRbAx4MUpsbEFx60d6vuyTkBFj4iDmVILm/a0fd0BxssCA5
 GvKxj0iXDd3zlORV3S3Ux716TyKOEVfwghYqPxOs5ZI84XPMKMuo4zsZXniZWfY+Cr690AiYvcX
 f9lCK5D8o3flMW7LKN5i2yjOd5DAJAHljz+naFZ34U5udYaR5ywzIftABA2Q0648whgtGJ0IEGM
 uS04lz8L4PvZKuQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no corresponding call to platform_get_drvdata() or
dev_get_drvdata(). Remove the call to platform_set_drvdata() from
.probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 4748e3d47106cd2db6a994928b20f76921540a60..86f7947ca9b2d23292c1e6660fe93c611e0cb837 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -51,8 +51,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 
 	chip->ngpio = ngpios;
 
-	platform_set_drvdata(pdev, chip);
-
 	return devm_gpiochip_add_data(&pdev->dev, chip, NULL);
 }
 

-- 
2.48.1



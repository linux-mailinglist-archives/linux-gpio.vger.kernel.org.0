Return-Path: <linux-gpio+bounces-24256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B5B223BC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9433AF6C4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82A62EAB8C;
	Tue, 12 Aug 2025 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tmIjmeJ9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E5E266584
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992352; cv=none; b=jredxvR+kxxNX67XhxAhnVvL2Isfiyel1nxxxoRZTf+NasXjcoutifh61rXmWF6tZP+LzZovKo/ejapkWJZFwhyWQYE+4HaCfOzafjEOIwb6wshixUlIDtrF9h0XXyGexHE5B6XD3O55hI15CgP4rci8NFY/ubgZcfnySHe0vU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992352; c=relaxed/simple;
	bh=CjOqg/tMVuGjCBjMfchIIOcWxbiHZ10GFFMMWZMqLdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MecxCZSrlZzuljFbCB4Jg5HV9Ufz5pc2vr4Uj/Kv2GhLdU4YB8lta3nukgS/Aek/wyuqbjFn7RJuWtAvAm5sGWRxjoo1Cff/GxFQMMTuOCjR7UpEIS3c5/AsSqzf4pzHrB6OqzLCwgVwh7G13mWhdwRqKRqXgQPrjTAgBWvrbTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tmIjmeJ9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459d44d286eso26931275e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992349; x=1755597149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=tmIjmeJ98P8bId0dysY6tjXSjLE9Ws+Nc1P5yvqXUbLr0+NCy5kMpU7QhvLSRfQSFJ
         s9BSbkgr3mAxxKUv3xOEKcnJndHf2cfkC/pN8SvE6zUzGguraKilxlhTA9pip+wk5/TC
         Svjwf5ZelDlZSQ4PsDqyYQocVTfpSvm4OhQ9DO7h1GC+zqJFZTWbncdVq6MNsWIB3xM9
         THM2Wcm1hRGnoGx004pLJABv54k9FJTuisq5ZPRVI8qgAY47v97f7mxRmiDwm48XHTj4
         34t0nhecDXGK16PxE905tKPrpFS0ol+zibIeOUsjciQCNZuaI6jaAWohA1yALfh8eiHP
         RNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992349; x=1755597149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=Ft9KtvPYmtBSfX7IlDH0ggg0cBItSTm2LANJQHUQ5a4Z2895vnHpKZ/sbTghZoE8vF
         8WJNlWlZaYJQyHdIVZBnxUPKr83WJnVFU8lgPP9WdqQDA+nKvOTPLybF/lXPj3RSt6Qz
         3QSkvQMFZi3dcyEPxBba2L5Wt5MS9mnfyiBkIumvkkx+F9tyRNxy4uGmSGVHDzWwzcQ9
         S4J8xCarj1UE5JZyYJIWXQNldEZfjzGoYUvE0mMWZmAcrC9BpsRvMRC8NZGZI7em//8i
         Kfa9M0/P3w3GruhX3/SNMqzXqNk6gZQwp3ZVhshrPwSkR1YNRw8z+yVtx6hKrenO0d62
         qAkg==
X-Gm-Message-State: AOJu0YwlNoLQ2yj5JSn9eBfdDAuUbrfUA4EbtaE4cnFYGPaLCDRlzEs3
	yu2+7eIw5CfZiTE17TPNBF+jt49fOBFWqniRsksJks3k3OOk/4xL4sp9tPEuOLV+ZsBUKwSxn6y
	TxNcw
X-Gm-Gg: ASbGncsP1aY7bSLz5rwlYI2G0dO6uq6UukCqNS009oORHHlZlwqMR4Icim8bom3CB6h
	+TKfgZRpbfykanMTBFVNZ0X2Uy/ikW9oiugkU7g4QYRObgN8fEus9udv8djApa8OlNCCGJ0bFwn
	zU7uP8cIZO8Hh/wXg1iHG1+l2JJNLYDRU2Btx73gNbh0MaYaGvdbk0CnB0e7jU+4c7UL9BU21Iz
	d46vS0RBde0Oc3mQxhHgGzDw4ejeX85VQa2BjZnHKgH7wr1UedNHR0LRahSfnhXGLZE7SUEbs7E
	4Dz7apE3RiBOswfuRkZDdbCCFztlHyKvXsI3R45PqkUN7V2dheXpnXOTv6YZL8X2Lcc6HAVz2EX
	m/NBK+C4O6hr9FqoHGMMmz1VzzQ==
X-Google-Smtp-Source: AGHT+IHMlTWJIYSmrVv4nHMCQDUriTkj7c/K/tgN+L+KmxopYAfuvalo7DHTecAilNpRXOwvXfPrEg==
X-Received: by 2002:a05:600c:46c7:b0:459:443e:b18a with SMTP id 5b1f17b1804b1-45a10dad362mr25112195e9.14.1754992348766;
        Tue, 12 Aug 2025 02:52:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:52:01 +0200
Subject: [PATCH 04/14] gpio: ts4800: remove the unnecessary call to
 platform_set_drvdata()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-4-9f43e95dea98@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7GUepK6ewZZ+J6N2Dw1g70BlgPl9ljHv9BU
 tgefMYjfa+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOxgAKCRARpy6gFHHX
 ctJ4D/9aMoxs1l2GSsPyDnhyzSc7IwkViTAepGrUetHNYsUUQ/wdOaj4Uw5xkBZsfSf/xRuZnMe
 iKAPIqHP2VfZKUpqA4DYvtfbdNysZCmVZ1Ygck+LSYYrnRDdZ2niK9VY5JAZE8kPYAbleXoARhp
 p4bHmZpzFOH7zxZ0VFpeOVdSBzmzb3RMBiQENwuzubY9Ivq9TNir/umhW2c1TNc3+u3mHUf5Pr9
 7Pq7vXm+Qw9WfPibg21H/5xH4rPsLivx5yVZNbEc4MoqjNLie/fiytXOr0GD6ze9nw2P5IB/37+
 oztaO/MgcERiiu+xC9uJiUp9dkHreQwjiJtCt6KzQWCCPTqBSoiIbEoYy0+ipjo+oYo9OHOHuMx
 AClhC4sFmehVvzuby9BtLDqz/YbHF0jfUatsfgCjxFTGFhS23dTt3hFYz/xYNrl/bLWs6bKguxk
 Yg+MFoalXzuB1KvlNvTVNwpLnQmRon4xZasBnmWKPK7j7i183BcxmC6pbmzlzXri+yI12dKrmJs
 JnAP+CbQpc99EhOlw3XQDRHvbmrij9Vix+D+NZ/ggaWecB3/bt0uKKPl4si6qhHa+5R2+5iLNMs
 Y0f7k1N9wSxVPRxP/F5QrU28/FYhpRTAy2BBv5U3V7d7aEPJ6dGTQLiJNnjnSk8Nrz+bvEf3Kl8
 8Q+yjtyYH/gZ89w==
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



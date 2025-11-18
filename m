Return-Path: <linux-gpio+bounces-28647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A764C68ED9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 11:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 79C564EDE64
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 10:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A33133F8CC;
	Tue, 18 Nov 2025 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cfX9NaZ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9D13126A8
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463301; cv=none; b=KSOV8vw0F9lG0LweHKnHYWF0Cs6JlTiujZrqX6whJpli0V+DauPCa/x1Xcnr0PrxXeh6DAu1Ey2jmPubZTebTBUDgA1lQySEfgYoZESBLI7vMUenbxeFL7KFOGuBo2OAiHwxm5EbdZEZUMWRCPuY/U1x1DCjXc/XGp3tW1jLi3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463301; c=relaxed/simple;
	bh=39nryeXBORfBsia7Xm74vhtdxKxgtB90nk7O1ZwgBqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=awkXhHPVD2j5qVBt2iKUV/szh0l8u6h8uVQygaUIPd2QM5H9cUhE/9ktkVJXf8j/qDbKAorBl0/SlclDxDSzR98IDorvG+qcYwLaYK+ypxAv4dyTl96JSYPMIHvfq5eoy92ANN8jr12j7B5CqUizAZgiRMJRa+bmavBghc2jfMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cfX9NaZ1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so54851495e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 02:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763463297; x=1764068097; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXk+XE5AGjZnhdwkAV490gc77e/zLdTxd8PQ48UcZPw=;
        b=cfX9NaZ1WRUx19ZYySXq40cefzBAmQRuMTb64RWDUqtBy278Vrt+uFNX8Fc856dIn4
         zk92DyMCt9oywTtml0Nc8KmjQjncqhD4mFOa1XHR2IEENlp8/P95f1qc4SKZWzRfp4R8
         BefW4wsH2dqWsnhU+yjbkeTr159oQ5YdFpW126MEjPOdMnCQ7CYPaf3Z/vhGEjmY3PuF
         V2pO3H6myt+FmNXOiZAOh994m+2RuMMscl1avpWPdcSQDgFNVlycyQDC4ewhPx//ZCvl
         yn+ZZHsq9/FZ8JhkEy9RJlqycoBesKO1qmeVCihN2Qh8WUq60EpRJLLYWy/RJtQmEgNB
         dD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463297; x=1764068097;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXk+XE5AGjZnhdwkAV490gc77e/zLdTxd8PQ48UcZPw=;
        b=iBHl++yVybVVE3S/vmflvevEflcDVFGSwbJK8svIHvYJoQyf6mvWL9Xo5ml21Fglyv
         6IG7hGjVu2eHweKXR4/trejdk+87JJJT1ATtTRoUxXonm4C3ZdWYj2eXrwiF0FGnVk1F
         qy/l+PzacyztxGGfyUF1NC/+CDjD1az5DeKP9e+c7w/FNYtChUH9Ispp/blPvXo63qLu
         jtkk3zZ7QkUuCBJ5nrlfiO36dQx06vyCepxfZCJReivWfp/04X0R9nU7S+f+4ZVPia2+
         XH89GnoRsaq3jZf7P+FiaGUMuyYjo37s/OGoOvH4PV08Y8DZkbL5yGoLDN+OxCX3zGU7
         +vIQ==
X-Gm-Message-State: AOJu0YyJrWL01lpgKOKfLD2y3dYX6FrI9yhdK/HrPc22eYskmfDTKNZw
	XB2l5jx/WjAFXk9CK7/Q4SiNjUIrsUjya7Xb+luudyT9hYOd2vNxQk5MJbm8cmEGk84=
X-Gm-Gg: ASbGncsUD8wuj9yq/SHx5eokf9tvf1EXd4gpyNxaA+SsnwHrBMT3XmZtlZ9d/gQnWIH
	LGV+LAd16+6Pqwp7ykJZ0bP3DcF6ObTQ/W28QEcYlSfRTc4OhuK9jVmn2scMl3qSi+wvaALudt+
	vj3J1ZCABlbdMMxNzrycl4wIJ2fuDawZin9kj+0Gh/jExigK9vmjImKHxYoTUEhvbyzsLLYBnWH
	RJ0qEi1Z8TVBufvFyvqTL35sJArr2P2OMJZE5hHRRQCoiGhxkTqNTGXv0C1AL9xC9qcox9ok72X
	14YccbUFGt5zIooPO2icsZ1mpaYI91x2HUvoEzk4hwFMoi6X4LP0BLd0UdRXC34Cph2PSqaN6WM
	c/NzB51kfQK/1xqAZNqjlyGogcloXszpiDwqKB6PnAf0456I5CXZTLRHA1wF1KJFqDxQSDas7vQ
	UVxQWO1Xm8ja/biQ==
X-Google-Smtp-Source: AGHT+IHpTm34dRdRH5OuCDFyzpUGf3KzC+N6ucE9kSG1cLhvPtdkr1rSnE2mDER7gkRcgBRTzWsofg==
X-Received: by 2002:a05:600c:1f86:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4778fea17bemr132988205e9.32.1763463296917;
        Tue, 18 Nov 2025 02:54:56 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c283:3472:316:988d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6a1sm347300135e9.11.2025.11.18.02.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:54:56 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 11:54:51 +0100
Subject: [PATCH] gpio: shared: extend the ifdef guard to
 gpio_shared_find_entry()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gpiolib-shared-of-guard-v1-1-e4ef149a2e0b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHpQHGkC/x3MQQqEMAxA0atI1gaajop6FXHRmaY1IFZSFEG8u
 2WWb/H/DZlVOMNY3aB8Spa0FVBdwW9xW2QUXwzW2JaIeoy7pFW+mBen7DEFjIdTj6EjNu3H9kN
 joNS7cpDrf57m53kBfNcX/mkAAAA=
X-Change-ID: 20251118-gpiolib-shared-of-guard-f61e05328940
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5mxs4SlTimyfdvZyrPjBkvGv7MzY4oOopvFwo8ywJgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHFB8jIngPnVhoNGk9C//oR2hLt3DZk8pEJg0F
 GeIVHVU6SuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRxQfAAKCRAFnS7L/zaE
 w44MD/4kjLQof6fiFAQkH11ntAfcWH7i5UDmkBgvzOWzMUMUjIVmt+NQzkp8hN3xz+fRLfZJs8y
 3EoI4l/aBqw8hF1M8rJ4VYNv8fR5QjR4ta0zb2zc5MYyJRXABaVPsK3KQI1cXrk7yJE6lsND9S9
 xeMvJJsKhw/Ss6pyKR/oV8mKvS/E2e09Bd1/Ie7aVJqVbZtJGSW/SCtuadA2OLyjLkLZ5w2WDdd
 NnJADPsS15EhWDpOw9DyAoNj+J8Ao0sC9L4IpMUU9uCq6hiYh/WolZ3D0NIQXz9TsLq5/hnR4+2
 QWJQImr+ELC35zD+rQiy6MGB27tKn5+/qw5GTBHJMxLUihrYUU/ueDc/Ilo//w2dtxtVrqJmZnO
 +gKmfj2xRoammnzOSEWzTEGYeWjODGTgJvzL68xMnF5M/MAGbPOS8iifNBi5ykrPVzmZa3n/NGY
 AtKl9NYHP6tAt+qbSSMMQI/RcmOFWS5lGCqT0dbvEfAzr79h0mILQEE/d5ZEpjROVQiDOHxBcdB
 +qezSBCF3VDVq1Ny2zXplHGJ3I+gbfiRETAhiUqktuym2snTzHs1YG3CNEsB12PYbQS2yxdx2s+
 HRq/ZhTP/AEPT1X6/G6U1+ZAc5p3/lDeR0VgWTZ0vCDhee2+CVW/1R8Lc34tz9z8lsLSQYnVc8W
 XR1485c6+SsdMMQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While this function is supposed to be used by all scanning functions, so
far we only have a single one for OF trees. Once we add support for ACPI
and software nodes, we'll drop the CONFIG_OF guard around this routine
but in order to avoid build warnings, let's extend it to cover it in the
meantime.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511180232.EItKeYjY-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c22eaf05eef23a7f5f111708c3db9412c4c30231..0c07829cd898e4ce19bb5b7156e12982ae674841 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -58,6 +58,7 @@ static LIST_HEAD(gpio_shared_list);
 static DEFINE_MUTEX(gpio_shared_lock);
 static DEFINE_IDA(gpio_shared_ida);
 
+#if IS_ENABLED(CONFIG_OF)
 static struct gpio_shared_entry *
 gpio_shared_find_entry(struct fwnode_handle *controller_node,
 		       unsigned int offset)
@@ -72,7 +73,6 @@ gpio_shared_find_entry(struct fwnode_handle *controller_node,
 	return NULL;
 }
 
-#if IS_ENABLED(CONFIG_OF)
 static int gpio_shared_of_traverse(struct device_node *curr)
 {
 	struct gpio_shared_entry *entry;

---
base-commit: b32b526a0d034be69d115fae3051dda915d846ee
change-id: 20251118-gpiolib-shared-of-guard-f61e05328940

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



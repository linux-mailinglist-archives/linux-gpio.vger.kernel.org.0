Return-Path: <linux-gpio+bounces-16117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE9A38065
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 11:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F28A18846E4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 10:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9CA217663;
	Mon, 17 Feb 2025 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TfwCg1XQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFA8216E2B
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788768; cv=none; b=mIp2+d94SifeDBwHGorXy1dUQT2EEq8onttOM+q7yiA7BpEJ0IQkT2qfhGiybc2Bht7UQwIjB465EE0zJQT0jq2ri7cmnb/5PkVoD9X1Olq9m+jBn5p7Asey/6Kv13ltzCE6yrsqOTd3Wogxz9TipcFKVPsFoIa2ZhbYMMEr19s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788768; c=relaxed/simple;
	bh=vUF/NdChsuF8RX0PL62paJYNXihVr9EN9nW0GqUH6HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xcx5uUz8eJq+zIcjZnc/V4tfmt7tQQYmP//wMLbVhoD+HfnZSWOkLfs2ZGHG/8YhtvDX2WnWqc/TkiBaJr2SULDuKUMUPOXXgrUElR1KJsHwx4tNfy7F1yWQYcmulhOIpmKY0eghQUOZAZBu7xWy72Qk2C1rdGyvNIEOHe1n8oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TfwCg1XQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4397dff185fso9515685e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 02:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739788765; x=1740393565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq7tnHLSofTfA2piDpZZwNRhnA5jRBNdKKxEFfHW/ec=;
        b=TfwCg1XQP43BW6ofJ60nIlueVJdmsPmenMs08VlvdQE9C3JbYJEn4aIFC4oCP0fUtH
         YGl/D/ieSMfQEGk+nJrc6TzQU7Eot7FgmOjMMTOLIfAyIB4ZUrQYUBYdYkCF1DA2lbPn
         ysE/qSFXDFVzq/7rP85BVHEvB+jfNDyXeJeyPFJXOE+kxCpuheiF7EizCHq4UZkxC7en
         qdl4O22yVHnzMLIQqlqrsIBXhRw3VZVWWdS0UGJMgzn885GD6IpRHi+nZj7Pa7+j6L8s
         xS2oqHJmzJWJ9QP0TRQkgCFUIhTbTnnc4xD40K9wB7JJvxWwamshG1dmt/zeqR2eDrQ8
         kzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788765; x=1740393565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq7tnHLSofTfA2piDpZZwNRhnA5jRBNdKKxEFfHW/ec=;
        b=uVGXNChpYuTANp3y+YapJ48UL6yoe44Vicyfo0QbD8m6Fjudp1URmpQahMId7PO5s8
         XBA7+fN0UOtZFT7X8NjoX6Rp6yYmwdIi06QT8ieQsD0qXeWSTr3BR5/mHaxu2W6sOMLq
         N4pRaiskxAWe2v5AgcSx5o6CXlN4JDyBxdu+lz52Iu3x8wOsMndZGtsKhLRlLV0WoO+1
         N5A4pCOgmh4oXsxlYcXD5YsR6KKhyGseAlG/C6YU13Pj0Iqlp8Db8WfupBX4sTIolpuG
         4BFM5xNdoO9Cx+FCqD6BDmhqyOXpFCBq3Thq9N5h4EQeu9sn+LxZalkIq6D858XqMs54
         JaHA==
X-Gm-Message-State: AOJu0YyAzXm4XyOZXxS48GMcfhFneIXBYYodXR9XAdZSCZR3qzeiDlSJ
	0kWkobEplXsW/kXpgIWwPl9yHlaTncgp38c5UcFenPt9sj6igO2iVS8lsiZ6eG8=
X-Gm-Gg: ASbGncszbrbtfTMtul1Mq6j9Y3XarS+bTz+wif1yBJcgE+Ni8Yjf3XbUn7kMJcQlJ25
	oGq+dMOnaMOC68V0xkM8B8KOn+Wnn5df0UFcR/TaFWgxCLZ2i1mwfcO5+Zs+lf8l7t3JlfRASGh
	Q8DzadzO53vbZ7KP4B3HrY0LVVRG5BAnuKWe86pGp47SBkRoPkKzBpRgnTOyf3tRQADtCiwa1Pc
	/w6zoNhLh2QEOEqVy5bxh1QK0vdZWy2FQoJ76uLATIoWfJ59zeC465t902yBvQTjE0DCSCnNwPk
	7Do7d4zocGka
X-Google-Smtp-Source: AGHT+IE4CNwnlKoha9ADPAeKHqx7QY4/pSOdlR/jtGXh8ZGwx2i49taknc0Hm9Pgs+7Gplgq0zx0mw==
X-Received: by 2002:a05:600c:3ca3:b0:439:60bc:71e5 with SMTP id 5b1f17b1804b1-4396e72aac4mr73128495e9.26.1739788765080;
        Mon, 17 Feb 2025 02:39:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06d1f2sm147990095e9.18.2025.02.17.02.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:39:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 2/2] gpiolib: don't build HTE code with CONFIG_HTE disabled
Date: Mon, 17 Feb 2025 11:39:22 +0100
Message-ID: <20250217103922.151047-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217103922.151047-1-brgl@bgdev.pl>
References: <20250217103922.151047-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hardware timestamping is only used on tegra186 platforms but we include
the code and export the symbols everywhere. Shrink the binary a bit by
compiling the relevant functions conditionally.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- rebased after fixing conflicts

 drivers/gpio/gpiolib.c        |  2 ++
 include/linux/gpio/consumer.h | 36 +++++++++++++++++++++--------------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f261f7893f85..65ca749a1078 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2906,6 +2906,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_HTE)
 /**
  * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
  *
@@ -2971,6 +2972,7 @@ int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
+#endif /* CONFIG_HTE */
 
 /**
  * gpiod_set_config - sets @config for a GPIO
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0dc49b5fca5c..0b2b56199c36 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -114,8 +114,6 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
-int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -347,18 +345,6 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 	WARN_ON(desc);
 	return -ENOSYS;
 }
-static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
-					       unsigned long flags)
-{
-	WARN_ON(desc);
-	return -ENOSYS;
-}
-static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
-						unsigned long flags)
-{
-	WARN_ON(desc);
-	return -ENOSYS;
-}
 static inline int gpiod_get_value(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
@@ -559,6 +545,28 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #endif /* CONFIG_GPIOLIB */
 
+#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
+int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+#else
+static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
+					       unsigned long flags)
+{
+	if (!IS_ENABLED(CONFIG_GPIOLIB))
+		WARN_ON(desc);
+
+	return -ENOSYS;
+}
+static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
+						unsigned long flags)
+{
+	if (!IS_ENABLED(CONFIG_GPIOLIB))
+		WARN_ON(desc);
+
+	return -ENOSYS;
+}
+#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,
-- 
2.45.2



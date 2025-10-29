Return-Path: <linux-gpio+bounces-27817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4373C1A774
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F3AB7506731
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529903563C1;
	Wed, 29 Oct 2025 12:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WR9+EXbh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B738355054
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 12:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740946; cv=none; b=NdfQAvZhaaU3JrPwjbcgtt9cxBYHESzIUXX8NNmSk86NNu5LHIFZEZXfeUFCE9ZB5XxTUldPoIU/GQFQAEZvPbBpXTeZ7riS2OtG5iXtNsW48lj8Hx/VuaTLs3+O6bVrnR6PAyt1himDhQ8fFsSNz+EwlJRjfZgCd0qESKfKL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740946; c=relaxed/simple;
	bh=pihEqw63iH8miaFJi/OO1LHWkAM8Q7yQvsG/Unqag2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKuQnIt/LZO8Xe5p/IgA78F0ZAYXej0WdAxc/qT4ScQ6G63aJFTDKQ87VOB/avXIMqKyNfkAsqg5CqYFjzczaPArmhXO8oaHtKlvADdga//dmMhyknJmJNuNn9wgfkeky9rkf3GZJYYs4FWXvFDdzKR5yLfaHy/IiOMnbIC+ohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WR9+EXbh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso33239585e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761740942; x=1762345742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKWwb+CWR52sgUt18Trk69nB3HUB32xJzIqtVQA5qjo=;
        b=WR9+EXbh1JT2hN6kYidRWlnEbB9zJanMCKu74aeCF+PQz1Ym4bYQxSFviEAsFcM9uH
         CveF8xtcFMNZ0R/Gjk8J2Qs9rEpTC2ZdljqlwZSH9Ltzwj4ftfqEAFWzSXcWIMXwpQsI
         pp44SWFtnPrYDOkL8pq7gPQiH422RUmXwXnq14B8L9P7bREyU6VdVykuiVDfDHHJxy/t
         5aqFy+/+Nx0TnAj8jC9Ligr5czwxlP0QhriQC9oWOYJ41ZYwsgHSQPgtRvfMPCzJQDZc
         3WfDiZi/TG5j1tfUBx9smtuYaPT6RHj4t/+wFmTSBIbQMl5Zj50qVihkDOfveWi6vUBq
         TL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740942; x=1762345742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKWwb+CWR52sgUt18Trk69nB3HUB32xJzIqtVQA5qjo=;
        b=QS2gX/RQ0Te1fTozwg/auUVvSYgjYi6HcvtVjhmbZ07RQKM/aY5tnM0al0ABk/FZc+
         yCoihz5jggv9lpduo1f4jE0qIINH+WKSJQSb2hcQ0FiWjKJkEWN/xeT7rGjI/PYxA4mg
         j7TCR5c9ySQOig9rRb0PSVyKs0JmjdpZ8DTXx7wwbf2OEfOpGbeIDMV1HDKc7IcjXCeR
         BFE+oM26oKIikvp9WPDcnxuXIyFx7F4D9FmB898pwbCQF1V1FrpgJFDEhxsKbyWo2kf+
         nUTZE9ZoaiCfjJ/oO8g5Io++z03Fg4wJhJ2EFJceUknQ66189QwEz7oobCl4Iv/0WuXI
         vbyQ==
X-Gm-Message-State: AOJu0YwwehJfP8LnkPTneHkmlSZ6NfVA8OjR+kVZ11g6BVFD+Jgqx/hP
	K2F8m1cMO2IVVpC8AoQwfc2NvDmAcHSaiRGMKfQddKF8noA/54RFMQcJRCXE+ReEC5w=
X-Gm-Gg: ASbGncvVQb3dVc8mMwxf09qYrEovQq4+6aXFF0Y8UUPPyPa4jCuB0zYx7bM9Bpf+L4X
	KYUA0wD5qGI6GeOUpkGF8o46ZWgKxv4BLmkESuqeyisy99uQjQpQSBWeUEyZthEjXcHuKIAApbj
	WpyYaAw5pk8z46VvOM3Bksog9Guq5oDRLJa4TqQ+iTjkjovbs9/rhhlNJmbfxXpRZQyRJIw05mZ
	wH1MGHeEOpYRbXvKNIJ8n+ZjbgODdMgAYIa/RPOjSYVZ4sW2zpXfhROwc6LF98eyB/8c4+ltTjo
	Aqnr8HYgzbMRxYs7Xeb9QXRfP+gMt2Bt4NMwe93/bt/uV0q89woisKrnjMCQD0DTplQBghcXVAj
	+zeJaS/TloxaNZhRy8D/h5KKt5KzRc9Rt9OJMXyHH5/5NPCfu9TCY8bJ/e74CyyExsra1iyMCFC
	aIFthO
X-Google-Smtp-Source: AGHT+IE2bEto6dm9kgomx9Gy3unCJ/VhB2xVUZhKdQJiKPMytSociWC/cTOVz5iTb0q8YRFWnxzeig==
X-Received: by 2002:a05:600c:46cc:b0:471:95a:60c9 with SMTP id 5b1f17b1804b1-4771e19ac2dmr27909795e9.8.1761740942232;
        Wed, 29 Oct 2025 05:29:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm52775545e9.10.2025.10.29.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:29:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:28:42 +0100
Subject: [PATCH v3 08/10] reset: make the provider of reset-gpios the
 parent of the reset device
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-reset-gpios-swnodes-v3-8-638a4cb33201@linaro.org>
References: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
In-Reply-To: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3056;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GNsd7cWIVZyy+GvsDtQHGz7ZcDSeeiM7GomXTvhzcVM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAgh+tbOHr2GtTYTKacQBaZS5LtYi0PYkjtcyS
 ZfHQCN0aDiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQIIfgAKCRARpy6gFHHX
 ct0eD/wJC+3IUqoToQlEO+77Y3Otupc+hBKyQ/4jPAzJRFTzE3xxnUdKdBUpWyvfHGdP7wSZPg6
 srN+4v97xnr+HgiTv3gF5tBVCxevzClXWLcVa+AMvcsdBw4qcFHif3XyiINmNtuOsGAoamIzh1d
 zOzwAGGOvQjqLaNrHmrHr558/Q/Ih8SBsEEHOeabr297FYe20dyCHEcDC3/mPDFN/L8CSCW9uoH
 qObFhUFkpqCCq0fz4XrY5Q5ZCtHnq5YHRl6b8gvaJbF8tEtgxsZ4R5muPFvfCvh1Eynp14oD2DF
 7JMOyHum/eWLWPQ0wFKyn9ktXBx1bldmIo0dcWIel96W0fXuuBUV4qvh43g1uiKkGB6APT5NAyI
 rZqWCJ/tiXOb00mzC6jhA0+EyseKzkQzwI86HT3GtElh0RVblkaxzJO9d32EjJt0HMPuMfbD6sH
 kkFzbokCJEkGmkZYBCuexXDTAi1iuYwqPaGaKMNLGeXrCrxmkYDbfmZVECPRLcVgv1b7Zk+NkJE
 8TXmT1AfQCtJmqJOvRnSz11OWaAltF2XzUypqfJub/tz0l3c7c2rENCt0UJ6N+iJENi1c1/5T5O
 idZ29DHHttNu5Q+fOhvGSDZIjO7e3tLEZJ5FolBTx5I9fGGZG5bkT74NnDuTfSs623EMAhbskn2
 2wbdyblzG9NPa9A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Auxiliary devices really do need a parent so ahead of converting the
reset-gpios driver to registering on the auxiliary bus, make the GPIO
device that provides the reset GPIO the parent of the reset-gpio device.
To that end move the lookup of the GPIO device by fwnode to the
beginning of __reset_add_reset_gpio_device() which has the added benefit
of bailing out earlier, before allocating resources for the virtual
device, if the chip is not up yet.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/reset/core.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 5a696e2dbcc224a633e2b321da53b7bc699cb5f3..13236ab69f10ec80e19b982be2bee5e4b0f99388 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -849,11 +849,11 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 	kref_put(&rstc->refcnt, __reset_control_release);
 }
 
-static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
+static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int id,
+					 struct device_node *np,
 					 unsigned int gpio,
 					 unsigned int of_flags)
 {
-	const struct fwnode_handle *fwnode = of_fwnode_handle(np);
 	unsigned int lookup_flags;
 	const char *label_tmp;
 
@@ -868,10 +868,6 @@ static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
 		return -EINVAL;
 	}
 
-	struct gpio_device *gdev __free(gpio_device_put) = gpio_device_find_by_fwnode(fwnode);
-	if (!gdev)
-		return -EPROBE_DEFER;
-
 	label_tmp = gpio_device_get_label(gdev);
 	if (!label_tmp)
 		return -EINVAL;
@@ -926,6 +922,11 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 */
 	lockdep_assert_not_held(&reset_list_mutex);
 
+	struct gpio_device *gdev __free(gpio_device_put) =
+		gpio_device_find_by_fwnode(of_fwnode_handle(args->np));
+	if (!gdev)
+		return -EPROBE_DEFER;
+
 	guard(mutex)(&reset_gpio_lookup_mutex);
 
 	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
@@ -946,7 +947,7 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 		goto err_ida_free;
 	}
 
-	ret = __reset_add_reset_gpio_lookup(id, args->np, args->args[0],
+	ret = __reset_add_reset_gpio_lookup(gdev, id, args->np, args->args[0],
 					    args->args[1]);
 	if (ret < 0)
 		goto err_kfree;
@@ -958,7 +959,8 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 	 * Hold reference as long as rgpio_dev memory is valid.
 	 */
 	of_node_get(rgpio_dev->of_args.np);
-	pdev = platform_device_register_data(NULL, "reset-gpio", id,
+	pdev = platform_device_register_data(gpio_device_to_device(gdev),
+					     "reset-gpio", id,
 					     &rgpio_dev->of_args,
 					     sizeof(rgpio_dev->of_args));
 	ret = PTR_ERR_OR_ZERO(pdev);

-- 
2.48.1



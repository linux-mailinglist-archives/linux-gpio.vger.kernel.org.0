Return-Path: <linux-gpio+bounces-19168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96694A98043
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44F263B995C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FB626773A;
	Wed, 23 Apr 2025 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cZX0wPgz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D61DE4E3
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392522; cv=none; b=A8AzUwE6g0qmG0dD3AE6j//5DqUvqubwYEG8ljrfPD7nHq2XyVdXtDcWkJZ3s3qh3vhmoOBRxJW0+QGvX3edBDLnmLc3mSDC9jpSj3x7i8K95TUsOV1sv/v5cn06HME26gAU9EYqiG2+XwZ3ty8JATDN1M0PjNCMxDgkXbHP454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392522; c=relaxed/simple;
	bh=2cFJXYo0w8FqSMoLTGOzW7U788xqfufg1/ACcV2UDhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lb+t6K1nFrPPhVRmTQ9vTKb6HugpvHzapEXSYFBgVHamG99xthwk/aa+7f2JOd7e4z4u0S5qMzYi0aCvBqQiSNyL5WuaTbDWsugnmyyp9gJAT68ZGYy5zRNGuwtP8coix/Xi8afOROzBi5FkDXaq3pilGaD5xKP6kJRtCKD4C6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cZX0wPgz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39bf44be22fso4156600f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392518; x=1745997318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jpIbuhGqJno2oGiD2+OmhnBmP+B6R6TyA8FsjUZXAA=;
        b=cZX0wPgzyn2GdQ6bS+2KAx9wR76eRw2cJUmq28vK7LArhApUA2/i7BcKdkrFUmyPmL
         K/SsUgM2m60rn1JKy1XIW36en07Lecq2wLwAOg/d82HaUQUuTTUgdyyx+DQK6Ntj+8vq
         aJ9kh/RY1hws9Do78EJIzMlgkrb6KcymRWnCHmbJaJ/tRItth2zVfPxuMe3zSy+CvjlT
         SwXFed4whBxJPj2KsASqyyHpMCvxM9fiGv+YgStZCMBHRuUGUZFpvw8hJ4siWhecPvoa
         +rmq4Ow5l7Ey9g1EYenuOuSP8AzCyNSh02IzgnlhmDEC37Mmbu5qPpmX+sLnVSSK/wZd
         rT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392518; x=1745997318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jpIbuhGqJno2oGiD2+OmhnBmP+B6R6TyA8FsjUZXAA=;
        b=hQcJ2vjkzKTw30A5qS6cSi90K4UMQkpSXH0vgs737jHiBbqc4gvzlmI1WvwP5bI4hP
         tAAY8LxjCVYbYzWQVpcfI+heN0anPJbzJKjYLyAV+vLY/Icn89i+wGjyvm5Ax8oJANsp
         /NeQKX+9igiAPyxsNIDxyGbvDHIrnCuFgA54xCG3tt7TOEM82qfsZWQoHJBOkq7aGS7J
         9egYRvQ2vGpO3Gz6G9PqimaJ96zMPyS3YN63BEGM7exaOtMemJEihR98gZPpvRjggyHO
         4yk4aWATwmpEdlrUVi2bJ0anC/k2Mpjr4vsA86OXtA0JAKXzBeIbF+pVb2fX/IB/2A6Y
         +UXQ==
X-Gm-Message-State: AOJu0YzF4sl39lBRD/qG7nMdP4/5h8Xwc8E9Pao56Ni8Sqwd5rLZliIu
	EOJqiqPWv3yBUfZ1qBNEeqlB028Hp3ncNnDCzku4N0UhrdpvFpM5Jf3xHyb+RYw=
X-Gm-Gg: ASbGnct6/kU0tPiNDR+b0vEzbksETs0PFHj0PTAJvOtorNLV7BHyWV6wJQ11HMcfSkA
	OWOI6TnM0Zt4BtOpTotbvukZqybbbfXz9Noz4vKjTi2dj9lYXItr8/2aFurEdx2L+uWUvCQWSEe
	UeaU+Uhabnesj6hsLhZ67v0LOpvESGo1hZ/RhaPc6+daEUhBrvQ9HXsgaP3CV6bNMhDfBK9AhQ3
	WEjVFs6WvnIu4qeo+DE65ACsZYBy4B2udub69gahQg4XOsCQzV3ESMsRw9gdb4byJfkpB/4dj3F
	km3xO+l3RJWLAKNq8Xo6CGoJDhXhcqr95w==
X-Google-Smtp-Source: AGHT+IGnUpS9ou6nffd7s4SVUQaTSNl4pQx4m4r5Zz5uifmJEfnPn7s/u9+lgkiPgaAvunq1Xc6dfA==
X-Received: by 2002:a05:6000:4310:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39efba5b778mr13229816f8f.30.1745392518529;
        Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:04 +0200
Subject: [PATCH 02/12] gpio: imx-scu: use lock guards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-2-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MkOnT4yNUZeyHThpCK5EaJBEstX46Cy8bj/Sje8L+og=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOBKq6/ZTVbZPDWRuhYrH8TZUsVagJXdkY5i
 QrnwxvwAYeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 ckEeD/9l4SbUhQKoQaEIERaYqDCzXTHhqB5KuenMgC5r/g5sYiqxqQjudVfEJavtD4haF+6aS9o
 xBIvX9GLhKUl5ZIikmZsrdlMshgyIY28XvfD/BydQE7ZJUgLGaEW4ZjytZz1E/tb5W1O/0WR0NY
 hshNdM49zRWRWZX1Nj4xFECkTnuriQt6vmLJPjpTRc9vO6lI6hRu44vwjuC1+TrsGWo8E6drr5H
 shZ1C+A2LYp6h2edfZQsuuJb5IDheLLXrvKO4LqnN15DZFRU6Y6wTy/WreZUw6PZm7I0cUftKdc
 0ScZ/KPtiTI0XPv3J5Q/skCvJBb8trn1KYQCEEo4Mr2kmHiKvQbTocvrnd9vHZm6iiCV9DUqHgE
 tZMYBL/xY6sxHdGwez2RZp3AwIv45VDRo9qEEPgDwPAjZSPISB9pOVdqLbIcTQqz4dAWvTiPBb2
 tlYO46y6cpcw+IgSpYcXNJJR69S76gYbbfqTlXnIbrvHyPBN/aFH/dMKoKT5FPIz1PhwVILoE2Y
 6dyGGas9foRrvCR4ndO+4uzKrs8XDjvws3vVumzhIUtsJ0W7NHvpiVOHfg7OW3efAMUSP8oyphB
 byaiS/R0pIxiZ+DHEKog1C2cE0qzDut0dyfGx+V+wagrqQ3BRdYAo1aT06StAe6hSgK/ej4OGdU
 +WVTqdlbOWnq5cw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards from cleanup.h with the driver's
mutex.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 403d03f18122..99df95e65820 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -6,8 +6,10 @@
  * to control the PIN resources on SCU domain.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/firmware/imx/svc/rm.h>
@@ -37,13 +39,11 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	int level;
 	int err;
 
-	mutex_lock(&priv->lock);
-
-	/* to read PIN state via scu api */
-	err = imx_sc_misc_get_control(priv->handle,
-			scu_rsrc_arr[offset], 0, &level);
-	mutex_unlock(&priv->lock);
-
+	scoped_guard(mutex, &priv->lock) {
+		/* to read PIN state via scu api */
+		err = imx_sc_misc_get_control(priv->handle,
+					      scu_rsrc_arr[offset], 0, &level);
+	}
 	if (err) {
 		dev_err(priv->dev, "SCU get failed: %d\n", err);
 		return err;
@@ -57,13 +57,11 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
 
-	mutex_lock(&priv->lock);
-
-	/* to set PIN output level via scu api */
-	err = imx_sc_misc_set_control(priv->handle,
-			scu_rsrc_arr[offset], 0, value);
-	mutex_unlock(&priv->lock);
-
+	scoped_guard(mutex, &priv->lock) {
+		/* to set PIN output level via scu api */
+		err = imx_sc_misc_set_control(priv->handle,
+					      scu_rsrc_arr[offset], 0, value);
+	}
 	if (err)
 		dev_err(priv->dev, "SCU set (%d) failed: %d\n",
 				scu_rsrc_arr[offset], err);

-- 
2.45.2



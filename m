Return-Path: <linux-gpio+bounces-12404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB99B83F0
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 21:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 940141F22BE7
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 20:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41321CCEDA;
	Thu, 31 Oct 2024 20:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XPNgh9c7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D01CBEBE
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404928; cv=none; b=MjuVkyHe1qyboXFWJ+WqMQz+DEIlRkjLa5kE8BeHakh2Ro8EKPgRAFRJ7J6AR3FCVODkECI5U4PSONalcJVeHXb6vtRmvj9zjJR9drHjHzb6QfMRMur3zo7VXoO5JqIe6J+2LlpS+vCnYtijbWGhhuPmMUYKXPnnmELIYD2yTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404928; c=relaxed/simple;
	bh=32n8hNRrxZfRWXJHlXEUvVQAOaKpzejZ0VhlHU1F83o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBs5l7V9lzYlLnpl7rWwsk/WXoMLMi5aWL68w56WBvoANoE7bIuOBDi7tp7Mj09dpo4q5Uf6XCfPzy1MhprtLDSNxN2bvyh1KIZt3A+lPhIiXUh77wSWWywmnD1dDrzWu6NIBLGFvNIzGlGN46lxyZ5YYyQzT2BkbYWwqaD2scM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XPNgh9c7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4314b316495so11563885e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 13:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730404925; x=1731009725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gPEduXI+XMe6Dm5bWiV+D66hZVETOkYyz3aI9yIIqU=;
        b=XPNgh9c7MtaX1g3kZDeksVVYRM8FpqFLJiLZYh++w/ClY/h4JkTdK+66VUzZATypez
         vLel5IHtuDM4pZKzYsITbHGhLHqASsI/FfRqkb3+hDzPpVUjuclYvdPYmcZOFWlmENS/
         4aJ3E4VB42QJi1sFCNmztHwFoYFGFUNeXL9d/1PkpAjHTJHsJYmJgUmVBxFSv4SnmQc7
         XW13jNTZ3dGHbzns1IPzX0bUXK14N8VAafrfauOFuGDEr8SXirYusaugjTrbPkauHFN+
         ltv9Qi7GJmvuVB77OzzyvywT3Xzi0UTE8J3P1hxfKylPBBdSvQKHhnL9FrUlBQfz4spF
         hXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404925; x=1731009725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gPEduXI+XMe6Dm5bWiV+D66hZVETOkYyz3aI9yIIqU=;
        b=VQGv5hFlzd5ow6jgEM0aTJ5ZgCjcJaI3frNNVldWDfASTwBmR6e028r4JdkqPER6Ci
         55yxLYarl7loaPAZMvdkp9hRgcTEDZzz+/x5zYznqaZZdUYa+LUrqUB/TMFoHD1Yq5B+
         ZAywrqsxV78NIS1f0QnsvMKSsm5e09al1FUNgcc6zVPILnWwYHbMbimMmFfmPvtdbZgk
         QFw/jJTWzKpwDed6/uxlhGE9E5LJXjxBNQT5dadtPMMlWnyMryPpjq1JfxhNyhq6JL33
         Lt2fb+vbSAwY4/dggBSOHf6hAoXsYvwl4Ez6+thQ+tm4+cZNqumrTAKrtrVUY+AkBcUH
         zQ6Q==
X-Gm-Message-State: AOJu0YyuZ4XThV9xErfbhb2TopFg4rt5QtvVW/tiSkx7UV1GGjb0pDan
	T23mlCTdDdrRDPmXGQULf8xYyOfFpuX1vUWQ7OiF11WUfKUl+iDE+5Y99p6MB+M=
X-Google-Smtp-Source: AGHT+IGBYSgTZbJrlfDKZLP7kcrkgkxX/vih99iJkm8GYhF8BuKcQzph7Yrmgl8WnNkSLt5YSmea7g==
X-Received: by 2002:a5d:6d05:0:b0:37d:4cd5:fff2 with SMTP id ffacd0b85a97d-381be764d8fmr3245266f8f.6.1730404924872;
        Thu, 31 Oct 2024 13:02:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f39e:5519:d578:740])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1189123sm3003993f8f.115.2024.10.31.13.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:02:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 21:01:53 +0100
Subject: [PATCH v4 3/5] gpio: sysfs: emit chardev line-state events on GPIO
 export
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-gpio-notify-sysfs-v4-3-142021c2195c@linaro.org>
References: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
In-Reply-To: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MW68g60TEyuTeEqNXNwM1N7WdnOvX+cyTXG9bH58n2A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnI+I3m8f03GVVwHU8kH4TDVsfKfCXZsPvSgUIR
 qUK4XATNYyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZyPiNwAKCRARpy6gFHHX
 ctjGD/4uCWXLERvN+D9onG6oz17et5OWI9Qcnc255pX6RAb1J7TPgAeTUDIO/BYJ9tVvuTChhq/
 Y3qyL7lerbZGw38TFPZufpRrinZvYhM2KOfgaMcuEf7PEMTMSVJCXIrZSwamMROCPhh56Ci67Kl
 DjKloeKVrPXJbx5OZ9dFME+JTsoGQx03uImflSuS+LQi/CcOw/wYBSnBMIBNrN9YPXfmfBYX+zJ
 3+4ALAHwOLIHLsanzSJUAA3/xYkWxjtkWym+zhOjpkVeJwB2aWDubirBbKJpJm+uyIaJZ/lkrXN
 S6OEK7xonnipE29S+2MznQPRld2nME6bR+ZkcSI54usUybTMdUiMro1OnVOqSqRbfO1sYTOMepf
 Evz8ZcJ2LY8jVpBEY2bnCgavoSljHhTx815mhZuAFDfwKAy4SX2V3ct2INqXLOk1eQOPpPGuW4f
 N4hKoD8r7g3Dqi/uvyC60c/vCZXb8evhaqfiSyQAHJdNQGsA4OlJZKhEHFzAIMd3sGPvr6FCc5Z
 ipAt8LOqEkewZwWjb0XJI5acG2HPRtXS8+PepjXTkNl9HO9MGO0/IjTYMrK0gGYkYmDbXiPzSzp
 5ONHqGgglXJtBLFRxnBl20eFkTAA1ypuxqC2PepBQ3c6wwrJezYLJ/Rp2Af4DBUgRcgg2zd5zre
 JcDzYtimkq2LtNA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We already emit a CONFIG_RELEASED event when a line is unexported over
sysfs (this is handled by gpiod_free()) but we don't do the opposite
when it's exported. This adds the missing call to
gpiod_line_state_notify().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index e6c1e26f302d..dd5e850c9517 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -21,6 +21,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 
+#include <uapi/linux/gpio.h>
+
 #include "gpiolib.h"
 #include "gpiolib-sysfs.h"
 
@@ -471,10 +473,12 @@ static ssize_t export_store(const struct class *class,
 	}
 
 	status = gpiod_export(desc, true);
-	if (status < 0)
+	if (status < 0) {
 		gpiod_free(desc);
-	else
+	} else {
 		set_bit(FLAG_SYSFS, &desc->flags);
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
+	}
 
 done:
 	if (status)

-- 
2.45.2



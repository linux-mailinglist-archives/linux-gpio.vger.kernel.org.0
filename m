Return-Path: <linux-gpio+bounces-29719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8498CCC979D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 21:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4038301E9A0
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 20:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190153093A8;
	Wed, 17 Dec 2025 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DC1vutU7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C130594E
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003031; cv=none; b=XMR1qdmUjBL3oddaNUmMAa0MaPvQLafSGw/IH8SYgGmspv0O7eOib5B0Bt3tzs/CfOQVnMzFERxFrMUXHlsNHif9vE0RvEo5dmAPEnUqf1T1lncB6a4QZsQzags93PmFWrmYLEOzApFBFbDMIQwHcCSKHLQ546xQDedF2QTvQ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003031; c=relaxed/simple;
	bh=mCK0iXOJd0rO60x1ejyGoVuSsrAj3NcAYR3ey5ogDOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcMIcoQbmKbjWry8hcv3d5RGejvIik4+zmocAqsKnhm/u5k/OuZao40ShGAGfDQqcrC3+gGqJbEFMsO5JJ7KTiDXgNpUnMcKrT5htsLgjPk6ECUA2U0TIRBV5DInFQ4Huvs/oTnksIfW03RTfJz2aMndyN7EsYryrvNsVqSA45c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DC1vutU7; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7f651586be1so508328b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 12:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766003029; x=1766607829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93azMiX6JAacpVtkkJMQndj/i18SN6bW6UsjbxDZ6ao=;
        b=DC1vutU7dRqNAILbpPqz5WktBaYxRbIKWt1Cjrk1GXeQaE+FnlU254HijQAhdJFudg
         w/Hx73AmW0If7J5wE0VXl5tZd+RIcFT4QeUz+rkuW6AlVLb0WdbXezsFC05ADvvF7+ZL
         HDSbdUdUWAzyYB0lld+KG1xyulGRsb4gCMjwFBYcnin1Tb5M3g1ilfBaIADFU/YDqNiD
         28Mk4iWdpcC7c6taX6NCDjyR2AADsxrgolM88hK+LM6kOr/9CXkEAqiWHeBBBJm45wO6
         rDgUA+Gq+WhsTg5TFLrjZNF4ERWvUhLGDIdXVccHSZ2bSwO+yePLECanrPFteCsKX+hV
         ZRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003029; x=1766607829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93azMiX6JAacpVtkkJMQndj/i18SN6bW6UsjbxDZ6ao=;
        b=GOVj1O3P/PgPQAKFNHwCZS8Y+xk08hnKWr5owdjBJ25ojvCVp8wqEdfyNQgRjKIIS+
         CmqKrf1xNObvH5dqz6IpLGvYR7G0suiIKDY2mHuZqsfsQYZdtQoDxPBmhLPeva+iAdZD
         2Ahk+flBcKcPM0CGxq2fsCYR3XaiXVmFgM1q5Sd1MTNlH6KPZ+HTqGtxb/CAjZEXebIY
         QpdUDUbG5O4QYdWe11HyOf1GUQjmZYtbj8OJJ29eYgKJB+lYj04H1iu0SN7sLXZIPf63
         mOYVXrqkEUknyulqsT/wPOeqfCLjPP4ZHdcw4jKLxyq0pNDC9mmSEhGjW15ULQY29i4b
         fL7A==
X-Gm-Message-State: AOJu0YwEacJbqIoUaM9NM0ijNpVhiwNvjDtXqDd5uj/pfSvJa0OA5OzO
	8gNuJ/4GNh6GVf5OPf2G6qh1tzgmi8K+zJeaVmoV6HWKNvjdhKx9TB3w9Sslxg==
X-Gm-Gg: AY/fxX7R7fprOFhIMHu0Uk+Vmczmzyg493U9ZsPYrzod13vS/WMv1F6EKeENj0Npipl
	QIdtiRcHh6K5NKyrT7iM5schpSdNKDojOYi1LiTliy2fwiuFKGOKhXmSsJ4hG82KPFufWzkjrGw
	mnEzwpsI2/rniIZ7CgWNWSymPzOPfZ4Jkvr7r2seqnFOpK2w/3YVcWgaQJ8P0yX+ptR2bmmyBGu
	dT9C1LpEYko/Ln5H+JjlMQBTth1tD6MW18XbVkolgVoc7SfvX+x5i8kDpJqYGhG6ACw/w5kwqOd
	DqtSsZCsZHueV+kBRqANUdaSg1zoOhTvfU0VLaO8TRtU8cs+h7xq7efs702pMAVC432HmvK7CSX
	eZoNlUQsVuzFDrrZqFuPboLL3axmtMogDA6o/N9yQHFy+yIZ2lZ1nirMCsA==
X-Google-Smtp-Source: AGHT+IFn9DqCthPWktt4+Q32PBNeEVzSZLnGcFkJdLfy0+F9qzdVdklVa3cLvfduDj9s+YF64oB9kw==
X-Received: by 2002:a05:6a00:430a:b0:7e8:3fcb:bc43 with SMTP id d2e1a72fcca58-7fe0cada90dmr498895b3a.24.1766003029264;
        Wed, 17 Dec 2025 12:23:49 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe121222bcsm318749b3a.19.2025.12.17.12.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:23:48 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: realtek-otto: use unsigned long
Date: Wed, 17 Dec 2025 12:23:31 -0800
Message-ID: <20251217202331.9449-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes compilation on 64-bit platforms as pointers need a larger type.

Change device_get_match_data to of variant. The data is obtained through
OF anyway.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-realtek-otto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index e6694d5d1696..e9c89b191989 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -360,7 +360,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	unsigned long gen_gc_flags;
-	unsigned int dev_flags;
+	unsigned long dev_flags;
 	struct gpio_irq_chip *girq;
 	struct realtek_gpio_ctrl *ctrl;
 	struct resource *res;
@@ -372,7 +372,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
-	dev_flags = (unsigned int) device_get_match_data(dev);
+	dev_flags = (unsigned long) of_device_get_match_data(dev);
 
 	ngpios = REALTEK_GPIO_MAX;
 	of_property_read_u32(dev->of_node, "ngpios", &ngpios);
-- 
2.52.0



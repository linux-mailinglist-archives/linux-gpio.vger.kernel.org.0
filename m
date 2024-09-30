Return-Path: <linux-gpio+bounces-10552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54674989CC8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 10:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C07661C216EB
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 08:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B5B17BB38;
	Mon, 30 Sep 2024 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aQ96ZqB2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E732D7BF
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685037; cv=none; b=ZkVVDAF3JGj4CDb+8slnODPxCWGg96Ty1OzemrXtJ+YsFfpdxyGFTxAQp+Ap48va0di5tF9mMtWLgev1FvuNvjAekbUAEs2q1RkGxnLAzRuOgflDu7HYxJbKj6iBlrVAmKD5cJPebtnJxa2BFsEtgj1GPfQOiiry7dsXobu0yRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685037; c=relaxed/simple;
	bh=PlbTMBYLzOiJCr4d0G2bA9L2wfpF3gpCWmO6C8OLaik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pp31xD/c1JQ0ZYn4THKghkpj4b0h2Q0FNpq5+uX1LgHbvd97ebMAqH4OoMZVtcMi0fPBTdRojjsojxSBNdsr0doMmdnTl4xAxUEhUqlmJCutyZYudFgH0lk5iT0+lvyt3b3dYrl9ogkt+iNbpSarQYg0kj/hhPfyTVgTw/OoGNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aQ96ZqB2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37cc9aeb01dso2238056f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727685033; x=1728289833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+lU65pyKCcIQXw/Ibkcet9XCM/f5MpAMf5MeOQvXQ8=;
        b=aQ96ZqB2sgcN0S309gc9bbn74GN7fqWnl4fsDAlMNWc84mj7bbrmLsrE/h8Ckv7Ing
         +KKQMQNZ0lv1Mt+p+jpb5AUwA2DjM6zpWh7dTm9KiwP6h9wJoGLBZQFaqBsnMQtlA0Pj
         M2exVAx1rz67gHZt0A58D60fqRyYzmP8QTOadF3IN0ehndDduJIgwLyHgedyV0y7/LDG
         Y6hGGXQOVCtHR99Qm5f4kBNsFoqz5m40N3Y82hk5rpqTewL3ApuvGhbg2cNhmg4kjFWi
         gbZOCCz3gRwgelwKmlA9FAdkNPzSVN/qvgX+ONdCpFIEYt37DuSIzL8IGDa6vuacc0Ya
         7/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727685033; x=1728289833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+lU65pyKCcIQXw/Ibkcet9XCM/f5MpAMf5MeOQvXQ8=;
        b=grMxXQJI/M1/GX+JkONK9IcP/EJWmBsYLWnKKenxLbV51D+KMYwgKe0B+Et4N/xulh
         gb52bKu5/JSigFJ40gfxE97MVZbQ6rf2/tnc/mTfjxO4r0aPq3uVpcKVczobwY49VbzJ
         GRP+gL5PNy8Smvw3MQiKw+CraTotBP69NTAWCpGCr5ctINUKMHKUxC0EQXPclqdyPx6u
         oc8cV/a1tGtOJkP05BhEIEl0lPlAHDzQHqhHcaZjr8xMNnpwUElhhi+1w1UbbIaSDv7W
         cfOiOOSZ+jGr/VhQJYUzwN+zd68Z5jMZ00pe5g5a/DYHxYJNXnw+RSvT9kwrj5AcykUQ
         b9fQ==
X-Gm-Message-State: AOJu0YzMV4E3ScHY3knC4BrMlH4BcfysoaIVFnuPGx+J9ZkGKq6kOZJ6
	X21sHOKlWokrdvd+xl1AbHenDSFluSR6T9TQzAU2Vs2pJtHuKuvpzToP9WQgUW0=
X-Google-Smtp-Source: AGHT+IGrPAgdSSu0JCG7OsDHsYZe/XUoxp9S4/8eN3a+AbteqqVkYe5mhULQl9KBVgc2abfcu1l/HA==
X-Received: by 2002:a5d:690f:0:b0:37c:d4ba:1127 with SMTP id ffacd0b85a97d-37cd5a8791dmr6411948f8f.16.1727685032688;
        Mon, 30 Sep 2024 01:30:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565dff6sm8448857f8f.30.2024.09.30.01.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 01:30:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFC PATCH v2] gpio: sysfs: make the sysfs export behavior consistent
Date: Mon, 30 Sep 2024 10:30:29 +0200
Message-ID: <20240930083029.17694-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For drivers or board files that set gpio_chip->names, the links to the
GPIO attribute group created on sysfs export will be named after the
line's name set in that array. For lines that are named using device
properties, the names pointer of the gpio_chip struct is never assigned
so they are exported as if they're not named.

The ABI documentation does not mention the former behavior and given
that the majority of modern systems use device-tree, ACPI or other way
of passing GPIO names using device properties - bypassing gc->names -
it's better to make the behavior consistent by always exporting lines as
"gpioXYZ".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- remove the no longer needed ioname variable

 drivers/gpio/gpiolib-sysfs.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 17ed229412af..20426d6e04d5 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -573,11 +573,10 @@ static struct class gpio_class = {
  */
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
-	const char *ioname = NULL;
 	struct gpio_device *gdev;
 	struct gpiod_data *data;
 	struct device *dev;
-	int status, offset;
+	int status;
 
 	/* can't export until sysfs is available ... */
 	if (!class_is_registered(&gpio_class)) {
@@ -626,14 +625,9 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	else
 		data->direction_can_change = false;
 
-	offset = gpio_chip_hwgpio(desc);
-	if (guard.gc->names && guard.gc->names[offset])
-		ioname = guard.gc->names[offset];
-
 	dev = device_create_with_groups(&gpio_class, &gdev->dev,
 					MKDEV(0, 0), data, gpio_groups,
-					ioname ? ioname : "gpio%u",
-					desc_to_gpio(desc));
+					"gpio%u", desc_to_gpio(desc));
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);
 		goto err_free_data;
-- 
2.43.0



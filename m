Return-Path: <linux-gpio+bounces-693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0697FDB1E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FC7D1C20B61
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB59374FB;
	Wed, 29 Nov 2023 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ewi+WYzV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0210C10DD;
	Wed, 29 Nov 2023 07:23:11 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a00191363c1so989510766b.0;
        Wed, 29 Nov 2023 07:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701271389; x=1701876189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKbIv68GOhP8+bT2hh9UptMvAu4r0doLDG3wGECUPUg=;
        b=Ewi+WYzV6gPuuS6dbgnSuowGHIrfsNe00L12udugbTLHizMXz4fHw+PBQWH8UEXSw8
         j+XE6LM+5GsI3s6mreVDGrfNPOBkNwKWU/ptE7x9VZ0CeYtuIqMsBNyAYkHKRTIMvT99
         juVRyunrVZMbR01uazAKbJO7Xe2JqjipcM5BEZUGJ2gnikREskdyry0A9VTXiYueILQy
         bAO0vh2/PgB0lmEGa2lwqpqRLKBtjIQXKX0tcWeBdUpumIZICICHod/A1zik31U4ayLE
         lFqV7RrgvoXVB/adphOpE6kzUygKtC4PkFSaj6bGPKeEX3f7WoB213/KDZp8RE5iARXU
         r4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701271389; x=1701876189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKbIv68GOhP8+bT2hh9UptMvAu4r0doLDG3wGECUPUg=;
        b=Q3Fjbgbu0vfPH4MAYRq77Rd6K6VFzmhmbkqrRQMNe/L/M9SvFAvoIbskIaobFi2p9x
         TvGF58HCzKVAniZcqMGkqcmaHmAHwqHvpftQtj6Zb3wOHdpvbdlD2Do2PHe5cDVTfUlV
         9RTyKXYlrBeYzP9Sxy+wFSm7gK3T9AvU8rSURVbI8sl6x8umK4dTl1YYkQePleYVcFa9
         Z+h8JQ0SZW8mw9ydzxrXFq84g0muITJ6DdRKSjCsxxvHTAzk3dy4LgIJUNhVH0cctZvV
         ZDIeWHJJC6UsYMEC2/6nQYakO4sJOa+98AvOgazVfrEiIUk8VsRrl1PPdB+Ar93jQt2G
         ejyg==
X-Gm-Message-State: AOJu0Yzg9a6S2p2dL32LuDDrqZzYUg+POIPVm8iVw7DIiW5yREYsJ3uF
	WeCWpuNGW6SzKPX0h2BxANU=
X-Google-Smtp-Source: AGHT+IFmp9AwYII0/6bzHYKbFRqE4uGMHTm8MmRR8umYyshxY6UzB7zeXoHq1PA/SVw69GizeIPX5Q==
X-Received: by 2002:a17:906:4557:b0:a04:a111:4901 with SMTP id s23-20020a170906455700b00a04a1114901mr14667947ejq.18.1701271389171;
        Wed, 29 Nov 2023 07:23:09 -0800 (PST)
Received: from wslxew193.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
        by smtp.gmail.com with ESMTPSA id c23-20020a170906529700b00a0e0e5842b4sm4078987ejm.69.2023.11.29.07.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 07:23:08 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
To: andy@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Jeffery <andrew@aj.id.au>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: boerge.struempfel@gmail.com,
	bstruempfel@ultratronik.de
Subject: [PATCH v3] gpiolib: sysfs: Fix error handling on failed export
Date: Wed, 29 Nov 2023 16:23:07 +0100
Message-ID: <20231129152307.28517-1-boerge.struempfel@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If gpio_set_transitory() fails, we should free the GPIO again. Most
notably, the flag FLAG_REQUESTED has previously been set in
gpiod_request_commit(), and should be reset on failure.

To my knowledge, this does not affect any current users, since the
gpio_set_transitory() mainly returns 0 and -ENOTSUPP, which is converted
to 0. However the gpio_set_transitory() function calles the .set_config()
function of the corresponding GPIO chip and there are some GPIO drivers in
which some (unlikely) branches return other values like -EPROBE_DEFER,
and -EINVAL. In these cases, the above mentioned FLAG_REQUESTED would not
be reset, which results in the pin being blocked until the next reboot.

Fixes: e10f72bf4b3e ("gpio: gpiolib: Generalise state persistence beyond sleep")
Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>

---

V2: https://lore.kernel.org/linux-gpio/CAEktqcv8NC0Cy+wo7nRGOp9USoBdta=n=mrbo-WomxgcmWN5nQ@mail.gmail.com/T/#t
V1: https://lore.kernel.org/linux-gpio/CAEktqcuxS1sPfkGVCgSy1ki8fmUDmuUsHrdAT+zFKy5vGSoKPw@mail.gmail.com/T/#t

Changes from V2:
	- Capitalized all occurances of GPIO in commit message
	- Added Missing - in front of Error Code in commit message
	- Added Fixes Tag in commit message

Changes from V1:
	- Marked all functions in commit message with parenthesis
	- Elaborated in commit message

 drivers/gpio/gpiolib-sysfs.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 6f309a3b2d9a..12d853845bb8 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -474,14 +474,17 @@ static ssize_t export_store(const struct class *class,
 		goto done;
 
 	status = gpiod_set_transitory(desc, false);
-	if (!status) {
-		status = gpiod_export(desc, true);
-		if (status < 0)
-			gpiod_free(desc);
-		else
-			set_bit(FLAG_SYSFS, &desc->flags);
+	if (status) {
+		gpiod_free(desc);
+		goto done;
 	}
 
+	status = gpiod_export(desc, true);
+	if (status < 0)
+		gpiod_free(desc);
+	else
+		set_bit(FLAG_SYSFS, &desc->flags);
+
 done:
 	if (status)
 		pr_debug("%s: status %d\n", __func__, status);
-- 
2.42.0



Return-Path: <linux-gpio+bounces-580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1C7FBC72
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2DEC1C20D1F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 14:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429E75AB91;
	Tue, 28 Nov 2023 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3fSLLwB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67890C1;
	Tue, 28 Nov 2023 06:13:45 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a02ba1f500fso790871166b.0;
        Tue, 28 Nov 2023 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701180824; x=1701785624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4gLTT516qypBTuW2qI4maE+Fjy4aw2dF7NjHyK9A1Y=;
        b=R3fSLLwB9PwyTsReFCbhciCCwBzo3w2D8+ZyDjDBQKfWotcHdbFbdYavLyJ2FY2gpV
         ro5h3tbTpaH0d66h1+9iNabIFjn/sFQezmdh58VBivTpyRm11RFwgNaMxtHL/DAyLqFF
         zV+j5AqYh90G9b/UegIxYDT0RHqMNl1njtSZsB4dUkwSH0wl4Xxm2wR4REb726bDmb2w
         u/74k+Ci1fCsbjYSFa1W705JntoD2nu9TqkXFfOoXrPBKWxdIkz9Mxf8VWEPu7KAxN2C
         fJqTUi2p/pdU9IdgJoNNe0ad7P7ZakKyx2q+pZzYlqZidftiK3JwUcbX2deQ706H8yUL
         qzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180824; x=1701785624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4gLTT516qypBTuW2qI4maE+Fjy4aw2dF7NjHyK9A1Y=;
        b=AbAZS+t9l6CX7Ed0i76qh+1u73EtwBAsHJv0kZF43bxxe/fE4ACKgqTPsc9qAtyLvl
         lC5Lmg35TbDu8NeUa6PqEaIRq03TsZT6C6q/He3ps6zemH/ueNDkzzD2L3HFD9D6OOUl
         aLRw7MuexbD/o85TU84jxgFVVJQO62JPfUeyMiCxVpV2XieG+jNY7DeBeBk6Dz10Kkg8
         2EvigvYUblekP1DssrlK3tkOUtIznRl9ebDb4Ka6gAkJc2TJljTEcsJxtcfiTx1deV87
         6OFboDQiLEBync2e08BsHWzRz4i0lwzvgMaHA7WqazyoS8xT8Fk6a/tAQBiZEkl4sWH2
         EXJg==
X-Gm-Message-State: AOJu0Yw16RCLYGnVW8lH9F+GlwRCcuxRNwAf4hz6AkQdWatINXWIgQzf
	1GqbymW5nfa4Ue8ZV8Zkalzmc8TNnixg8w==
X-Google-Smtp-Source: AGHT+IGFt16NJrgnIlWUt2Av4jT3swKxytBUB55EYq18to2VYToRRH5DYieXmDXjxH3Skdm/HM1jCQ==
X-Received: by 2002:a17:906:2bd1:b0:a04:3571:e165 with SMTP id n17-20020a1709062bd100b00a043571e165mr8255243ejg.52.1701180823701;
        Tue, 28 Nov 2023 06:13:43 -0800 (PST)
Received: from wslxew193.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
        by smtp.gmail.com with ESMTPSA id r21-20020a170906351500b00a0bd234566bsm4212121eja.143.2023.11.28.06.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:13:42 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
To: andy@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: boerge.struempfel@gmail.com,
	bstruempfel@ultratronik.de
Subject: [PATCH v2] gpiolib: sysfs: Fix error handling on failed export
Date: Tue, 28 Nov 2023 15:13:21 +0100
Message-ID: <20231128141321.51669-1-boerge.struempfel@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If gpio_set_transitory() fails, we should free the gpio again. Most
notably, the flag FLAG_REQUESTED has previously been set in
gpiod_request_commit(), and should be reset on failure.

To my knowledge, this does not affect any current users, since the
gpio_set_transitory() mainly returns 0 and -ENOTSUPP, which is converted
to 0. However the gpio_set_transitory() function calles the .set_config()
function of the corresponding gpio chip and there are some gpio drivers in
which some (unlikely) branches return other values like -EPROBE_DEFER,
and EINVAL. In these cases, the above mentioned FLAG_REQUESTED would not
be reset, which results in the pin being blocked until the next reboot.

Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>

---

V1: https://lore.kernel.org/linux-gpio/CAEktqcuxS1sPfkGVCgSy1ki8fmUDmuUsHrdAT+zFKy5vGSoKPw@mail.gmail.com/T/#t

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



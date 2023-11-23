Return-Path: <linux-gpio+bounces-400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3877F6040
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 14:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C3E281DA1
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 13:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8657224A0D;
	Thu, 23 Nov 2023 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jeq3G588"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061E61A8;
	Thu, 23 Nov 2023 05:30:05 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-548f853fc9eso1221525a12.1;
        Thu, 23 Nov 2023 05:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700746203; x=1701351003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RC4QAeE+mvvSH3pdAbHu8q/LCZTxCmKiOR39w4ENfFU=;
        b=Jeq3G588GFcYOZUyT2cFVEXBdcK/+86TpcYoACqoLVV7zBLNd5/Y5/8nGrasO1Jiib
         uEApfVPOiFZBEVSOLySRU8l+gKrFooIKNTDJ1JG7l+e21Ms5p9FXIttHspVWWx0kQr2m
         NLoM3TnlmYSMOsHDCF6Nh8jTVGdnWfEZPPt7tnaFuurNWtrmdQWuU6pxGXgoi9exiih7
         dO2JJ9+sUu+bQbBCjKt/bPlqvqIxVgrgwO4fK0UIed006jPX23+jy0QukGY7Qdpd75SD
         ILI5zreONpl/USow9p1ywfIQ9TBAt1IyFuHeJIxOM0oaKB0VSfi6wepQGxlaWbbQsgUU
         ZCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700746203; x=1701351003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RC4QAeE+mvvSH3pdAbHu8q/LCZTxCmKiOR39w4ENfFU=;
        b=a4zWtaMG2uUQXYg1Bf8FCCODWvhPG43iJRdueHI8Tu1+p6DJ7mnW9kXLFz8kQ6GzaJ
         NyOZx4EA5DW9299akHGn4T+lAy+a5cA7gRogwkoGShsw46D3wuhwCYq9j+LIdPicMnkX
         1MRn7ySN0pCDYOAnw3Dqu9B3iWWGr1A0kRq8398hwzFzSDLTmm5jJ92d+Zud4iM7Eyy1
         QsBUswyFJZWP3h3ilELBQFtg7MUl0ZNyTsG1VgaXXuBbjv53lHBvrihq0V8xS16yaVy2
         E7/eCiMhjP/JqTSUMpuqJpgq2m0rzSKeJAdXLUiDuXitdQDfF9Icp+ad50SADEKnqKad
         w3NA==
X-Gm-Message-State: AOJu0YyWFJoPZqF29nJdID76JDM58dIxIRyXboq9zRbNDc3kOcJPL7FG
	vbhRO/sQbR/WG237G1F/JLI=
X-Google-Smtp-Source: AGHT+IHYcFwtt9y/ODMxkv9Ssm0XVnZOpgAYjlqbfYhN5zzKUvSwj95Ba76j8RQqke4QKc8oK0CEEA==
X-Received: by 2002:aa7:ca54:0:b0:53e:8972:1d4f with SMTP id j20-20020aa7ca54000000b0053e89721d4fmr4641212edt.5.1700746203205;
        Thu, 23 Nov 2023 05:30:03 -0800 (PST)
Received: from wslxew193.ultratronik.de (p200300c7874fc8005124cc901e9d78a6.dip0.t-ipconnect.de. [2003:c7:874f:c800:5124:cc90:1e9d:78a6])
        by smtp.gmail.com with ESMTPSA id d17-20020aa7d691000000b005434095b179sm654281edr.92.2023.11.23.05.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 05:30:02 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: boerge.struempfel@gmail.com,
	bstruempfel@ultratronik.de
Subject: [PATCH] gpiolib: sysfs: Fix improper error handling on failed export
Date: Thu, 23 Nov 2023 14:27:49 +0100
Message-ID: <20231123132749.108827-1-boerge.struempfel@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If gpio_set_transitory fails, we should free the gpio again. Most
notably, the flag FLAG_REQUESTED has previously been set in
gpiod_request_commit, and should be reset on failure.

Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
---
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



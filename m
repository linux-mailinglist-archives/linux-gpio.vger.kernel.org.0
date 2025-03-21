Return-Path: <linux-gpio+bounces-17869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97896A6BEA7
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 16:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578FA189D48A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 15:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6654F22AE75;
	Fri, 21 Mar 2025 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dV5HO0nl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8632236E9
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 15:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572194; cv=none; b=m9VTvoDHJ/boC/Ae9bo6zTvklsv7Stl/pJVYYGMg4qFNiKcpi5ZvRJtJ9ueeWencUEqbBnkNvjvzCKv8zZN9F1ELdHgpErf3NNiB1eQfw0yvodedO8yGhbyreuzg1RZcdCygeYZHSgJBvJMkkQ0osCd4Udb32NhrJLDuQVadAAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572194; c=relaxed/simple;
	bh=NvfXIHhK+VWCUfd/gJ4E9q15zyMoCl0PvormQXQWGJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dWttR3R+o9ersTwPmq1HZexMJIh1utGgbDC5Dy8K+zmTkSaEMeYwyWoWSfnEmfgb5aBs2c5njE+/+NwdCrQzii6J87TBvRkmF5xGOQJ4jmDu2d+3j21vhuwiPJSSzxCWI8V3UIgITkdtXn2aXruPfA2qusNJP2j4GgHp4SQn3go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dV5HO0nl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso14399835e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 08:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742572190; x=1743176990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqsju0kZgP02gRC3wohzv8i9I+alYOhK6gEi8p2Wugk=;
        b=dV5HO0nlMW/HN3v48FYcPinsrxyXOVvSs6J+CtnCIj/PPTLjAzlct2CY0PVLAyPetM
         uDam4henjaSNRoV0ajHmW7xig6YHB6oeLMhRu/DMblR8zJ9UHtNTK4YctGpZeWKhsc3K
         WkXpu1C3hS/+4Xm9OABqawDlj4e3wTeMfjP3iEvIUqA5+AGkyEwOqdHDIaJHyiS1o8Rt
         kF1Ap9LT5MP0iIvFbWa/eaY1OLvhxEqS7dFKhMltX2aXnJ3OuMPmkShCgn461ZJUoYBR
         YA1jxK6Pn0tRr5vNI3k5fpOmx7gEoBWq/9ejAN/4ZW3yH2sKg+P9casqXZIQOb1T/Hqj
         LgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572190; x=1743176990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oqsju0kZgP02gRC3wohzv8i9I+alYOhK6gEi8p2Wugk=;
        b=AwGgIzr/L/TVEnhpjLFDqjXCvUTj/x0OVfJfwp5DEPF0wgFDhTmcOjOQ0aIHI37SJ7
         ULpbP1DL3HXvjUp0RcVQ1dzSX4BQ2YsH9T07Xx2OeXcK8p+j3DPKqC8v2OcSDvb8SfXr
         htqDV9AeFKE300w3Ytx1IV3QFS3gSUGFVcTZYanOabkkKYRTPFs+xarYNEXV9XXDpwwX
         8PYpmosHTN0KfQ9bsXTdYSstYyOoZriOwshEMtIFV+J1sE2zlR1BA+Zf/ofN2BJGI3g1
         FLg8LWERZ/d7L7JcRGBGCQaiJvoC1HN8sLsmzHjyg957y2nnxerqzA0XHr1NzACn+Tyb
         SmTQ==
X-Gm-Message-State: AOJu0YzfayY/5QJRRDfijpVA4kyA7Eb0UqbB2vQGQNaU16JZofqgPNTI
	BoYEJyIF7jI/YfntpA/Gtcetovw36f+YfFMV1pREwmJT4LPa9G3JSb7FEVMiFtc=
X-Gm-Gg: ASbGncuvrdoLwUp2bpc7+Pdgwphg/q12zNsC5eUS159AN50wXs03LtGAtTiBC7G6rZB
	mgpjjh7Qh3H1XTgnvgSx17m862Nl0f3zF5noPAL8JbTLBKumS9FdllmDHnNnESumzwnStPEGK9Q
	jrT8m+ocDfrni9+PFU53ihscGWGL3nmWbs/ECYr7iRh1vxXkTwhQ44rII+C2HCNl9Evdo7S/lsZ
	AJ/x0ZzA+djKowNnXLv4psLGQmQYdzRr6VlpnUMjv98CQzJsCrA0AG4bmFb82/fSe5CCuS2ZDkT
	5rMnr8VmtT25ulb0r6pjob72Xa5EkLmDpCJcvA==
X-Google-Smtp-Source: AGHT+IE83HvVdPd1F8HJgesyYGFZcZ9aY2a2O588opE0kp1Olyw/PgxB4h079l74xJ6rF4Sv/3urew==
X-Received: by 2002:a05:6000:184b:b0:391:1806:e23d with SMTP id ffacd0b85a97d-3997f8ed721mr3270655f8f.6.1742572190575;
        Fri, 21 Mar 2025 08:49:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1aa4:f3ec:847a:32d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b4bsm2664406f8f.25.2025.03.21.08.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:49:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 16:49:37 +0100
Subject: [PATCH 5/6] gpio: TODO: add an item to track the conversion to the
 new value setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-gpio-todo-updates-v1-5-7b38f07110ee@linaro.org>
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
In-Reply-To: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zW9vf2MxVVLSQ7/GxmBLmLjVLQ450goC/H07tgUus28=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn3YqZ4OK5TJEOgGOz59u/Shq340T6aLrfj2kak
 o7dYSVxc9OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ92KmQAKCRARpy6gFHHX
 ci3pD/wPRQ4FG3V729Ngelf387WaUaKndrOi5Zsq3+R6Ww8/pdW1R/jazX4RvG98Cf0LfHXf/oY
 rdbVLm/SED01DVkYDbsmQ2eWQwh24ZQkIKhPMgGtRXN7onmZGbYkPtt8hetgVWWA0D5ldTLXVe4
 V1MDb9+l5pPVRkeKTZyefOySd02O7CX7ymGUjumYVLUQriaK6l+GpPk50pA+hpE7+MBpxjB8x9X
 U8lIOfTguScY9Bc5ejk/RT5/u6uy50lwPlg6Kd8fk9S4Dm9Zr+fLSuccG/UgZnV0kvaVvX6zzFy
 dQwjnXehJhZahwyr2BzSRXzQK12R30YCpDt1TZ+IHGw5lszuT7sP5S35dhdLEm8Q1BwPtDebGcV
 KsI85t7mohkJy6YzBXF9ebQC0vYzmLkRUGfzwSLKOtUNTWlfeU8VStHn8os9pib/cK1KnULKvBp
 At6d8shY5FIgo5RYHORL1f0Jdl5bnWdZHESaowV45xUHQbx4QX4fW5WPb/rVCPvkWs4yg6oRmf9
 aPtiMzLFJXU95K518XkIROkGJtIq6EWCk9uIaqKSIDoN5Xo/oCmiBZX9nbhJ2qabaN1wFsfuE2P
 OHWstEjK47Ug4KI1cz4Ew8TPgTXC7Qp8oJkG8rfNiIqKXQX7kpW1jryE7q1QNJpGfWgwjJ1N97R
 QavjE88WWQQBJzQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add an item tracking the treewide conversion of GPIO drivers to using
the new line value setter callbacks in struct gpio_chip instead of the
old ones that don't allow drivers to signal failures to callers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 052ba70070033..3abf4805335f1 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -161,3 +161,15 @@ A small number of drivers have been converted (pl061, tegra186, msm,
 amd, apple), and can be used as examples of how to proceed with this
 conversion. Note that drivers using the generic irqchip framework
 cannot be converted yet, but watch this space!
+
+-------------------------------------------------------------------------------
+
+Convert all GPIO chips to using the new, value returning line setters
+
+struct gpio_chip's set() and set_multiple() callbacks are now deprecated. They
+return void and thus do not allow drivers to indicate failure to set the line
+value back to the caller.
+
+We've now added new variants - set_rv() and set_multiple_rv() that return an
+integer. Let's convert all GPIO drivers treewide to use the new callbacks,
+remove the old ones and finally rename the new ones back to the old names.

-- 
2.45.2



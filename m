Return-Path: <linux-gpio+bounces-11128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FC998000
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 10:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C96B6B26541
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 08:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2A9206072;
	Thu, 10 Oct 2024 08:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wpYPC3OB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719F28F1
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728547438; cv=none; b=kh3vbdK0chj9utjmLLkmi/TC873rlr9//BoEPfxyzKmVSYa04wEP6QOoqujrTwcWjcO9D28QY0oXOYB4+ybFZshqbYoiZVl3Q7W9X6D/vZUnrne1H2GnWEq6HN3fEZDLElB8hhh6teWUNY13g+ntU0oX1G2gsxZOwwU2NMVQ/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728547438; c=relaxed/simple;
	bh=4Hnw26mcyPUG+bSpHqaDPucCGEMOkROxTInnOfHr5og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETnTtCV+gxn7jd7tH//NU/zmljgngLUF2rBFyZsdtYKU5eAPWJJAMfOxppq8xFn0vJKbHsTm5N7woViDpTBb9a4XWRrYEL7EDfVHiwXUqIcfCzryo+n25EZ43qk1T9u3UXwgtL8aE1DZLOQ1vs9+acfZ9vwaEu0EEx1uK/ZiN1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wpYPC3OB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37ccebd7f0dso357211f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 01:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728547433; x=1729152233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOHSJVTdLAqav+eEKmBbCxq8KtaWLAU67BYMtt/w3UU=;
        b=wpYPC3OButPHmA6BVhV+k/lYYKajzMAHJNvoisJtwzj37RXp1xjdmPEc7lbHt89iLX
         HqDs6oqumHMCQHWloD4nn2K/SjpYgLK47EFp6vFsaNmm6MZeB8uGABvAIi7Id6wlIIL2
         PKJt645vvQVi6gURdH6tv359HZ049enA+EVUn6KfUZEQBfW1sn1mcE6MmA8F2M8k5uId
         dvh+k3T7/MnaOPNfg49OmpyFx2/YGVpJwfHjgGyWzx5hgjKYf/mjYEIlLZbuLUlHaWWX
         BXvVsROnHnIEdQwXfiW+3+bnogwDXG+XnGYwZ95gOHbPTHfLcMIWkVnDOjuiod6Ngk98
         QLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728547433; x=1729152233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOHSJVTdLAqav+eEKmBbCxq8KtaWLAU67BYMtt/w3UU=;
        b=mUt4moGXJGvh5VjpochvH/M221QJv467wxUSy39LM3gT2mhGw1/Bwu24wJoAhnWFr5
         c2iZZW4/yfHM4pVzATGiUnFHZVECYf7KzazKqOkItlo2eefpJN7/VmW90tKT/UQG+Bf0
         5EfHSwNg4XsxRDqBjZ2jIO6p5gGiQ4m8TagomD867tulVpoii+c0J47hyXmaZIg+QJjF
         72mRCjOcOP3Uop2QLYqJpkb0zQ3nLKe7Zte1rb9R+wjQQ9pJcmIJoguFQV8qYC8P3qsm
         O5AlxzAKxEzArwvLygfSi3l6y6al+xW+SFlsAC21MhD9MahL+yQa2RJsV9CAPHxW6MKw
         6mSA==
X-Gm-Message-State: AOJu0YyaUZRJYN/p2q1kJ6NpfppDFl0Lho1rrJfPw4hFsxJvp0rrK1Ff
	Xy7kBkD3xZZrgtIyfvEJ2Bmt1t2BhzKPRmUIbT0Bkp3mz6hCWaQvEYn/ssf1fow=
X-Google-Smtp-Source: AGHT+IEVjmNCPCIiHOq4s9rPIdkzMfu4AW4u4I1oaeC0njtcNkIz+cNZ/lJCbEU3ps1f+YR/oUmeiw==
X-Received: by 2002:adf:facb:0:b0:37d:4aa5:eaed with SMTP id ffacd0b85a97d-37d4aa5ecb4mr1052794f8f.41.1728547432952;
        Thu, 10 Oct 2024 01:03:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5e5d:bfca:20cc:60ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fd90sm776097f8f.79.2024.10.10.01.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:03:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] pinctrl: aw9523: fix kerneldoc for _aw9523_gpio_get_multiple()
Date: Thu, 10 Oct 2024 10:03:47 +0200
Message-ID: <20241010080347.7759-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The parameters' descriptions are wrong, drop the invalid ones and
document the ones that are missing the description.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-aw9523.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 5cb24c1dcb0d..9bf53de20be8 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -550,10 +550,10 @@ static int aw9523_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 /**
  * _aw9523_gpio_get_multiple - Get I/O state for an entire port
- * @regmap: Regmap structure
- * @pin: gpiolib pin number
+ * @awi: Controller data
  * @regbit: hw pin index, used to retrieve port number
  * @state: returned port I/O state
+ * @mask: lines to read values for
  *
  * Return: Zero for success or negative number for error
  */
-- 
2.43.0



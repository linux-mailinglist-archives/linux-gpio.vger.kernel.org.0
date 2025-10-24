Return-Path: <linux-gpio+bounces-27588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F165FC06B84
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 16:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A8D43B7875
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 14:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77889315777;
	Fri, 24 Oct 2025 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHYW7dRh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08403074AE
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761316492; cv=none; b=Kivw5ucxvb5J/29MNoGPKutJ03HqdbloZVMg9lI79xU2tdipPLOe8aLXPZ6OC7IFehr5vM/B6ed5B2naNl+g+Z1f6OUbhKHCRwjO7wZLKRLL2HA2bvTV8FauQgO21KySoOp1q3yQAMOd4stq/w+eGeJZe6zjx/75Ss5fH7gdfTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761316492; c=relaxed/simple;
	bh=a27ALe2yhOhsvti6rryDm6Ym6QY92NcDKqoAWfwQi2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvuQjTchECF4gzIwRHSFgMWd/4FExBsrEmWJUo0ybKppWHqIFlhoxAH+dNo9y+D9AIitRlMPjB0BdZrXe1+gMVbU7mIJUjGaK8vyHf4eiy8JbHgSDbKPMFWkTwKDonnNICPtPW12zwAgcj3voHmIK1rvLx5srDTVczuzJWx7mso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHYW7dRh; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-b550eff972eso1473650a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761316490; x=1761921290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQj29ABrwrijpvys50cDvqcS4VYVuuORqVZjjQai77I=;
        b=LHYW7dRhkJQVqCczSJ1nFqp6lBAog5W2mMpQ5vAe34oOHiehZxG+2pq9JWETM7/FLE
         0fweWG8QQRXH6K1cf2taGMxlYQRpOP7/mLOFqWx11SIw0ZV9VnuOL4NLSLdXpapLbLMu
         0lvmBjal6QzKE5wS4z9hZUoupCyk8+VZ+fQARFv51AfkOU7CpQWBmFFbBLZb161TAIom
         MxPTtnWh1CUqDN5WFVsw2/rZ/U8euub9lNm/Wr6L99etrSzjve8sGrul3qgxMK9rCpEB
         K8Lvar5vw1ZJy2LBxB/lUGzrfCMfwbKVKfuojrUSDbczE1kD0/q6VFUEPX2hB0A4qhJ3
         wCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761316490; x=1761921290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQj29ABrwrijpvys50cDvqcS4VYVuuORqVZjjQai77I=;
        b=hTHIWVl6D5dFdCDeGFOnILkLj5HWc0vE3yb8nkqaXFTNiw5ko/9xBz8O57KT6cTIx/
         SmO7vLGv50eZQJ0BGvQKG5Nl2DkbIMMhoXAI9BSMy793Iz6ypD0gPVSvesLgobQRwt5r
         mNwXAKlGVN2ArqKbfnXqv3fMggr2H5KulqyZGZnDj1oO0+SgN4oJchC+kpSbdG89pCoF
         yYSnC3Q+hoPkQqzMYmvRyuUC092xlT0I5w8f3VNW5MgefoYyvcSQr0dGkkwJYzcHRZRu
         OCjK3AIPRdhR4Rfv7sU/E6qMk+xyIbVfY7po662SpH7099r/+/GDJuqTwMj/DEwxJSso
         0IYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg+elDTRNeXwO2mPIiARHfUO1iL6U1EKM4fVWgT0Fsk5frBbSQUNNSD+Ki/rKieqvG8n7nMWJaCNPn@vger.kernel.org
X-Gm-Message-State: AOJu0YwV2pjTWuyoyqIDBXIVyKhQowv8OrwEN0HfNzRstpaWKoPmB9Ju
	+UQVIYFHC4GXLrbl5vAEle8lfj4EWFEkxSaKmwqVhOkFwVUDcL4fAwWf
X-Gm-Gg: ASbGncuV/QPZ+fY5mNlQY6ItZ24vUXYQ/wphAFTThUcYlJJpG2iUCoznc9YDsg/NKin
	8wtW7AMtRN73/3mSa/R1cI42Gv4Ep5PUPKsQcy7UZJHwN4jo3VdnE/hNxhqy7pZqWdwjDdHtIYV
	3y8yk1VXhI6csav+XuQCMVW8zRmXpSX7Tg2UVry/8z34h1L+qSuISd6oY1+U4kD8Dd80JEzi836
	HLLX10c2gFGZW3zjcL8mgh+xG28yKMXsumaw/GPh16AvwRQQX57OcSzx9c4usqXSkSRyZCBBr/8
	ZiaY8WrvkJ1nm9lRYhC46TlZLg7pNO47p0LlScmLckPluSH9+e36tWchI9bXz4WEBiUbR/h3vYt
	LSDv8p1CYD6T2WFZHRlBZciOhjsh7769UJzXBFkgrol5Z3rRGHgXMZ1uB7HQHRNa5xx5kx6mHdI
	yiPqY=
X-Google-Smtp-Source: AGHT+IErBmFAi51GQfjC8jK8NrYQnDRXpNCqWG1VH5g/DWOWsQEd2w+wLD8u7UXeR1pIgqcyE2avew==
X-Received: by 2002:a17:903:384c:b0:27e:d9a0:ba08 with SMTP id d9443c01a7336-290cb27dae5mr359060835ad.43.1761316489794;
        Fri, 24 Oct 2025 07:34:49 -0700 (PDT)
Received: from sf2-6.. ([110.93.227.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de00dc7sm57822215ad.39.2025.10.24.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:34:49 -0700 (PDT)
From: Ali Tariq <alitariq45892@gmail.com>
To: kernel@esmil.dk
Cc: alitariq45892@gmail.com,
	brgl@bgdev.pl,
	hal.feng@starfivetech.com,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: starfive: use dynamic GPIO base allocation
Date: Fri, 24 Oct 2025 14:33:53 +0000
Message-ID: <20251024143353.71753-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANBLGcygpsp=R5gM7NeuVO-JG1yfQJ_0dhnFfL1ud=291cJZAQ@mail.gmail.com>
References: <CANBLGcygpsp=R5gM7NeuVO-JG1yfQJ_0dhnFfL1ud=291cJZAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JH7110 pinctrl driver currently sets a static GPIO base number from
platform data:

  sfp->gc.base = info->gc_base;

Static base assignment is deprecated and results in the following warning:

  gpio gpiochip0: Static allocation of GPIO base is deprecated,
  use dynamic allocation.

Set `sfp->gc.base = -1` to let the GPIO core dynamically allocate
the base number. This removes the warning and aligns the driver
with current GPIO guidelines.

Tested on VisionFive 2 (JH7110 SoC).

Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Changes in v2
 - Remove unused gc_base field from struct jh7110_pinctrl_soc_info
 - Drop unused JH7110_SYS_GC_BASE and JH7110_AON_GC_BASE defines
 - Remove .gc_base assignments from jh7110_sys_pinctrl_info and jh7110_aon_pinctrl_info
 - No functional change otherwise
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c | 2 --
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 2 --
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c     | 2 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h     | 1 -
 4 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
index cf42e204cbf0..3433b3c91692 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
@@ -29,7 +29,6 @@
 #include "pinctrl-starfive-jh7110.h"
 
 #define JH7110_AON_NGPIO		4
-#define JH7110_AON_GC_BASE		64
 
 #define JH7110_AON_REGS_NUM		37
 
@@ -138,7 +137,6 @@ static const struct jh7110_pinctrl_soc_info jh7110_aon_pinctrl_info = {
 	.pins		= jh7110_aon_pins,
 	.npins		= ARRAY_SIZE(jh7110_aon_pins),
 	.ngpios		= JH7110_AON_NGPIO,
-	.gc_base	= JH7110_AON_GC_BASE,
 	.dout_reg_base	= JH7110_AON_DOUT,
 	.dout_mask	= GENMASK(3, 0),
 	.doen_reg_base	= JH7110_AON_DOEN,
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
index 03c2ad808d61..9b67063a0b0b 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
@@ -29,7 +29,6 @@
 #include "pinctrl-starfive-jh7110.h"
 
 #define JH7110_SYS_NGPIO		64
-#define JH7110_SYS_GC_BASE		0
 
 #define JH7110_SYS_REGS_NUM		174
 
@@ -410,7 +409,6 @@ static const struct jh7110_pinctrl_soc_info jh7110_sys_pinctrl_info = {
 	.pins		= jh7110_sys_pins,
 	.npins		= ARRAY_SIZE(jh7110_sys_pins),
 	.ngpios		= JH7110_SYS_NGPIO,
-	.gc_base	= JH7110_SYS_GC_BASE,
 	.dout_reg_base	= JH7110_SYS_DOUT,
 	.dout_mask	= GENMASK(6, 0),
 	.doen_reg_base	= JH7110_SYS_DOEN,
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 05e3af75b09f..eb5cf8c067d1 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -938,7 +938,7 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 	sfp->gc.set = jh7110_gpio_set;
 	sfp->gc.set_config = jh7110_gpio_set_config;
 	sfp->gc.add_pin_ranges = jh7110_gpio_add_pin_ranges;
-	sfp->gc.base = info->gc_base;
+	sfp->gc.base = -1;
 	sfp->gc.ngpio = info->ngpios;
 
 	jh7110_irq_chip.name = sfp->gc.label;
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
index a33d0d4e1382..2da2d6858008 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
@@ -38,7 +38,6 @@ struct jh7110_pinctrl_soc_info {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
 	unsigned int ngpios;
-	unsigned int gc_base;
 
 	/* gpio dout/doen/din/gpioinput register */
 	unsigned int dout_reg_base;
-- 
2.43.0



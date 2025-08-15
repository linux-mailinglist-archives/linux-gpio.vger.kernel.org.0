Return-Path: <linux-gpio+bounces-24434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D09C7B27F13
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 13:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 417751C22843
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE57C284679;
	Fri, 15 Aug 2025 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ohXaVBMP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC6264A8E
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755256667; cv=none; b=p7dTSaRX3/VweXrQ4rEj/yaYVFwEKyRYmrw9OgeLrcemQNq6fnp0CdzDuFgVcBurfDH1tLsueR+H/Av9cfsdpXEjUBi8UoLdqhlw6dB1feSyS2cuWqtqa88EoO5TSNzLZ0cHRoC73d4WpNJY3jwppn8pCOJYGl/CHPiPPbjB+xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755256667; c=relaxed/simple;
	bh=cNJ/rNLToCZpWc/OoFeQGRqPtuVjPbFhuP+BjjGpzBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UmRQld5YUgx/Sm6kbD6xrYIV9F120ZsS/xWS4yA/mwbfx52jIvSvXWVLQJUBBPA+CIC+czwK90PF6YHpUERFG+gtD1ZEEqcIQH9Cz09nGXloDqKzhevkm7fx6jyGBw4I27uIyDkBXhd9YL6r3K1WrkhGlxrmdEirOrGs2l7jt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ohXaVBMP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9edf504e6so947051f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 04:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755256664; x=1755861464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik7xRaqOpkaG6bjW1AGJTmHUr0AVRjkRhCnWI3OR6Ho=;
        b=ohXaVBMPzQ7xYbsAq6yQra01lXtdR+oYHmr3R3MhrfYTCyMYE5eKDNkIoJd6xUNS9J
         lcmoBK2AI9gknr2FWuxud6R71cZv8ZEHArlDMiRXHQdDYkDE62Pmxhe7W6ZhaSb1mlky
         iyNoDzcG5Fk0Q6EVK1pRLcQyVdjrQjyf3grLeK5KPuNa0O3DDUTJtJEU0X2D93zmYlbm
         PzqsiDahvIzGEYZu8mLX4GKbMnUOs3iBgEf+G8tgjFR6HgN1nFZa5fmtVvcBLsNxMTW7
         w/vWHFU7svaWQKsbyWTiBrxH7ZqaTuF5qcz/s/28kdfnILdWeYqoGUstqUxBsEJwY5Wd
         Dugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755256664; x=1755861464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ik7xRaqOpkaG6bjW1AGJTmHUr0AVRjkRhCnWI3OR6Ho=;
        b=DuawAaiC746B05tc6XEPHEvio7kQ53RPAhAjPHiaQKbpsPreErVOf6ttsOiiXrVsCe
         bGIPzsWC0i3gh6SDI77oHdcR/HbbsapClc9IsOtTZb1DpISrG5Axezpo0lRgviL/2Gh3
         8U3pHTg6EBhq5LQVJSGU3ayZH0ahtUmhJdKX+Hoa6nzbA1iQR7Lfz282fuJJY/YEVQum
         pvYkKZ/17lAQKqFd9p0WDtqgDAWPWP6WpI2zzPzUnPkhHyUpManTxHJrQEzHsScayfdt
         xttwFQub/gnB0mg9GrWaCs6HSsm3v22VP/8fyJNg2S63gNEmOTbUa70gqm6bSZjc045m
         FkOg==
X-Gm-Message-State: AOJu0YxGVH37c+Cb9hnTJAng+/NWKwIEzC6rZCJEC4KzzIJ6+kxOKEVP
	sltmSk63HVMPY8qryQUJP5d8N5GuvjLpjeqiLW8/hzCrFhQYeTeZDxl16HeEtRe0N7U=
X-Gm-Gg: ASbGnct0ORld8s5aCizozc7EfGZNAmOXTznu6sciQkNCh58/rpl3HWSg0xRJWB8TCLF
	swqX3gj9K9JrSGUiXjaOrkpY7L79hnIlhpSeDaloHAgykwihcxsviD+s20QafTQEw2XqbZte/tA
	KH1iXJ9G9PZOI2kHK/8dZ34sp/+1P4g6gySzn5rb/XW4kf5RdGw5pt2jg9feELQ0KIVfGFLQElE
	ighjmYODoCYARXg5m4bXQofDx2jkGIVcEdVrpBzntrPAnteKh7p35lfiCp2EKTTdjF197ojUAqH
	d2+wutQjFZ2Yl5IT9UUTbbWXcRoffMEzHsxppxFSMNedu5ePOwimy8D78AWAytgqIBeP3+Y8q3G
	MaKyY+727etCHf9hEpDkymNNl
X-Google-Smtp-Source: AGHT+IEBgoZjDsFHLhuyxOxceb35Nmp9E6inGayR97K7UzkscW/Xbu5vh2RYJoclRMRx5WVToPqr/Q==
X-Received: by 2002:a05:6000:2887:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3bb690d31f7mr1308362f8f.49.1755256663780;
        Fri, 15 Aug 2025 04:17:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb6475863dsm1616426f8f.5.2025.08.15.04.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 04:17:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sim: don't use GPIO base in debugfs output
Date: Fri, 15 Aug 2025 13:17:33 +0200
Message-ID: <20250815111733.79283-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We're in the process of removing unneeded references to the global GPIO
base number treewide. Use the HW offset instead of the base number.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 050092583f79..a83f5238427c 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -262,8 +262,7 @@ static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
 	guard(mutex)(&chip->lock);
 
 	for_each_hwgpio(gc, i, label)
-		seq_printf(seq, " gpio-%-3d (%s) %s,%s\n",
-			   gc->base + i,
+		seq_printf(seq, " gpio-%-3d (%s) %s,%s\n", i,
 			   label ?: "<unused>",
 			   test_bit(i, chip->direction_map) ? "input" :
 				test_bit(i, chip->value_map) ? "output-high" :
-- 
2.48.1



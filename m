Return-Path: <linux-gpio+bounces-7311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40E090239C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 16:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A30071C22E30
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 14:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84AA139D15;
	Mon, 10 Jun 2024 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="csi4S4rP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E071984A4A
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028360; cv=none; b=rjO+MphzQAJfXM7orngoAeoAmGbf28+FFUVUrg3lwqHCVx4Puhq54o1QFI+7VTG7PiyFdrOrEiKK0b017meN2/I2stdDr5uEl4w9aqrmEorxI8Kp+aHVJoU9MIB4V48nEnoN38FDSfMMysNJJlj8vK28tPl2Rl7BzKxxRd5P3m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028360; c=relaxed/simple;
	bh=yr3jIRicmchwz3anKNej8jnzLR/OgSff3SwQWvHQmQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s7lifla4VRdHXJerEEzOp/M4c4kQUDu/hQ5lDHw2AtUyJ629+WtHA5HeHTnOqqg282AhBDTU4l5JA2KDfaosdAqQ61Ldzbe5AfSXy6eBrJ2RcRBPp4L9Mk1/zjlMFKCtu34vVlxv+ZdVvlLTNX6kCdBpbSxrmK4SonmiIou/6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=csi4S4rP; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52bc274f438so3526409e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 07:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718028356; x=1718633156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVxvwUJERs3T0J4gSW6t9kiiGJorZXzW48W5+k3rC2E=;
        b=csi4S4rPqK/PVbh1mL+SYyY3vrXOJLXJyUAko5Q40ZE/q797Fzw3qkpCWs45rXPIEa
         yFN+hY8LJl+2f+39MzeAA6mLFXA43/i7Ixy43q61b1knAaZLf+jbRu3QgmnSzytZC75U
         N3rMxRNGBUJZzQoOyCCChcLgkfibp2YFlcjDWQbaVk4OOuUz9Zsx0PRJo31AlXW0Al6h
         /rQL/cJP+EeeN3FMRIQaTG5N/GnK+I+D59lcVu3yoKTqTyp0X6rNx/BEbcaTrVQvRKpw
         13er4GKDzowmxJW90HKxzZVKdUllFwgowlqGnw17i56kbYn04AdJhCvSL9lIwKVavaV0
         S3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718028356; x=1718633156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVxvwUJERs3T0J4gSW6t9kiiGJorZXzW48W5+k3rC2E=;
        b=JdOW05NiXD8dP+xyi3PjhCs4v12hnDpEBHSGZ0W69CAMChuKRKLF1mrGK+qDn/9PSF
         sE46P/BV2q7EKHE7C6pGKfCiC5Tvi8AWhqSARw8i8kUdbPyRaaT3/vX8K4I5cROYKZFo
         +4Cfr4d/ouJUiZt2ooFYsyi2hJgeoX4+vtx8BYDILUwCh+MVNNP+ZjCQt4VqEcnS31d9
         sjHSa2wzrZbksqLUmWCWbjkdVOVQGz4LwVHQhqv8Be1vRxiN3VuJ96pYk1w+Dnp/EAMz
         gt4Z1LrjKyDAJ49vs3JPUMTnjlcOPsHZ2EIPTnkZWm6moM6XLnljVrV39e9tJ5DE92HZ
         EETg==
X-Gm-Message-State: AOJu0YxOwdFzwOCxwNx+GnK5DFZYg64hvnDMPgR1T2C+py7oO6lb5Us6
	9XEPgfV21haVXq1OK0gJT68RNu1zggdgrlVbJIxXuM7lMSqtea7C7xbAMTjDhQA=
X-Google-Smtp-Source: AGHT+IGVo21ZRRBzKH4LlG9aONaYeAa+lIIRzKsOCoWCppugjCXj9j36EmeUQnmpOThnit21MSrWQA==
X-Received: by 2002:ac2:5148:0:b0:52c:5f12:5313 with SMTP id 2adb3069b0e04-52c5f1255d3mr3906233e87.18.1718028356003;
        Mon, 10 Jun 2024 07:05:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:b790:b49b:9038:8e99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42217ff4302sm11113845e9.31.2024.06.10.07.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:05:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/3] gpio: sim: driver improvements
Date: Mon, 10 Jun 2024 16:05:45 +0200
Message-ID: <20240610140548.35358-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Andy had some suggestions in his review of the gpio-virtuser that also
apply to gpio-sim so let's use them.

Bartosz Golaszewski (3):
  gpio: sim: use device_match_name() instead of strcmp(dev_name(...
  gpio: sim: drop kernel.h include
  gpio: sim: use devm_mutex_init()

 drivers/gpio/gpio-sim.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

-- 
2.40.1



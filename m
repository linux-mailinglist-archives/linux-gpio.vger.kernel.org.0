Return-Path: <linux-gpio+bounces-29666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC7CC6430
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 07:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6A633015AFF
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 06:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742D430EF7A;
	Wed, 17 Dec 2025 06:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1WSgxgC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC530DD30
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765953170; cv=none; b=TItmkqdQvx2tKb+1Q/v1kp+tF9txyEnqjh8U7l7ER9CAsOER8fHf1MX2cScyOYuK7WzyM5UlYgSm+nlfidvFzs9OPDfwLsvAuI38ILzwg5Cqloeye7OI/x7CJcm13PSDTDdOoQTV0Qe6qYTbTio2pKYE+uzuIDyeobMR44US9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765953170; c=relaxed/simple;
	bh=Z2ZCn7JTN4LuDobIiXrFXJ3dUiGAeTpJdzry3Zg80LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GWCVtX06bVBii6o7bykVVbxKujNg5DEwpZ6W3631odTaj6EM3aK+p0a+Was5v5AtOKpkgzPUZ+cPVK4c2lmz+AyLrZJymGPvB8YwkweHBlMBCjvx2fBH7oMhQPuNJKjWNBApeXbdjzmFcwvISqZd790VVWSbJSHXN7XeSsXKdl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1WSgxgC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so5113897b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 22:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765953168; x=1766557968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7jHZu72JJDVJXJBRq2LehxZHxsu1NJQZH07A4J7UtM=;
        b=g1WSgxgC88cSEurL8TxnbTZigZl5D+9WMAYhG6RvFtOFZ4i2MwhcLJsPrUdWJpAHyX
         4KT5ZfxqHQ2N5Can4uOiU/lA2g4SHUf7cCTbeZiS5JmVyXVwyQLjT0Tb2fXnkHoGLe3i
         3y8BZdrSuI76R37zr9MhJU+3JJSw3boks0aMAJzicB4qKytvl4o9I0I9XWSuH7dQeiEW
         VM5PwFV9SJPOlIxMd4ItVP6bOHTuOsOeKJp0mpoTLI3FkADiqgE2oKTASwji72t1yOFu
         UlAcWqnPox+LvDYitgdMO21EGCZH/nM+38JgNruslD5CBParH/lzW1Hj29I4std9xzFR
         8r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765953168; x=1766557968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7jHZu72JJDVJXJBRq2LehxZHxsu1NJQZH07A4J7UtM=;
        b=r0rkKvUYUFBmdX2t/GlkBRBtD3UAmXd1xFC4w5fPUQY6rKzc0X/IE8pI+gkxf+ZLan
         gqX6B0TzWM/hzoRg6BUlesaPG3y9TOCt2BuSUZEVOQanGoqNBLjG+51kL+VCaMeRNpn5
         2xEXcWMMWhD/hpxVx3DUpHaeoh1hpTz3O451JUjgoOU8Cdz+r3LjTMMeuspKV/UUf3r8
         2MREEsMlNc7RIMp0DiANa9RaheX3HqNv9sTBMIaCkPZF4o40g3s/iwPd8VY/zjFEPNt7
         hf0YFzX3gwKdfnMHRDxo5s7xIy6KwU+iUflwteo6yGBoBggVGj1f20fjdYLZQ2vU/FFG
         fAdw==
X-Gm-Message-State: AOJu0YyrliDzQdO5nw1d3CyofRhlBhLb4g7sVr8mcP9mAZMEQgUFz6ss
	J64mZAuvBOmSuV+1Gp6vPdmFQ29K5DUdecephHdv5SWw7cG1c98y8lCfZr90uw==
X-Gm-Gg: AY/fxX6BLgJoRaFYkYeSunjrSM9Dj6/TTBcWr1F7kGt+9vl0ZColfjGAWXwIFmKqjnX
	Q8JrmWHXsNTUCavHGzavpKVikYPOen2Onctr2/G6l50u4DrM3AwtUSVl7WFzmDxAyCO5YZErnah
	M3BhdwxEkswmKqWnBziRb2/G1b68jwlsbiwgdBtSPV202dbPxnuLjnw6i4nVph8LaNNdsSkzr4r
	c86MVrR1AMb1a+6AXW0PTludzyv3iUZGMByPbNdKTILxlLy7SZc2doaSAe/jxxx5ycL4KiA6G5Q
	Tq47i7QaVOsFuJm0rwsi2UK6xVWXn9aBoOB/izuzJChJVgntKebH0Yr24PCncIqMJsViCfyN9xy
	jeoZkvEyr6XDlkfDWkOTaaQgvM7IQLz6rrkGqh1uvwJDuVXkfqxinzRrgoA==
X-Google-Smtp-Source: AGHT+IH4lr+k6HIrPPStpFs5g2uINXuAdPcSQ1pRVojjc9G0UjbguqI0nkkO0blzXQzMdfZrBV/eUw==
X-Received: by 2002:a05:701b:2419:b0:11b:c1fb:896 with SMTP id a92af1059eb24-11f349a4a02mr8808842c88.4.1765953167540;
        Tue, 16 Dec 2025 22:32:47 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::c20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm61454672c88.13.2025.12.16.22.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:32:46 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/3] gpio: realtek-otto: compile fixes
Date: Tue, 16 Dec 2025 22:32:26 -0800
Message-ID: <20251217063229.38175-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes compilation on 32-bit. Also small OF change.

Rosen Penev (3):
  gpio: realtek-otto: use kernel_ulong_t
  gpio: realtek-otto: add COMPILE_TEST
  gpio: realtek-otto: use of instead of device handlers

 drivers/gpio/Kconfig             | 2 +-
 drivers/gpio/gpio-realtek-otto.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

--
2.52.0



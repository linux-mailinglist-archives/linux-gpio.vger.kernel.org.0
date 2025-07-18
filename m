Return-Path: <linux-gpio+bounces-23458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447CB09E2E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 10:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC3DD17BAE3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 08:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230DA293B48;
	Fri, 18 Jul 2025 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zMyS19aQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F31E1A3B
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752827917; cv=none; b=aa9SvA+OdCfMoyVm+QMl8IUIb5Qv6OE/QlHJP1C5sDlNKyb4mja+p/epIG3nEyPL1FyAZ8u9EMiq9L8Wp/bw1Pi7zCI+zv4s983ECUhhJSC1HMprY04DRitVW3J+fcLbVuUUwHa9Tzqco8arT3VWNzb3XOzlluo00ucRCPp/lJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752827917; c=relaxed/simple;
	bh=0rnRywdj99vUjh7GmU3PmAiPRCJhenK4DLNxhtNGISg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dPxL5KYdoDy7J5VqEe0ECAY6zcJ3HztKdMnXudg5/3JkXa8RSGKbzE1+b0HE56RgzcqIKPYibFvUiE55cSwedWnTHe33FkUtCx58dagP79oipbmPD7BGjATQ0oSnAj3hH46O7pRPCXTa4E3nW29Lktg63KeP4HqAF0YyeVYQE2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zMyS19aQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-455b00283a5so11189695e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 01:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752827915; x=1753432715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXgOYTbgBt90IjpwJ0T6DCAurOotkArJw103biH/iBE=;
        b=zMyS19aQtkIQuN1e0s093A6GhlSVA3kKqNnRzXUXH7zB7EyxnXDk/ih+Qk5EBvO6vH
         CQ831dFv31NYGq8C5fjpvUExdsBGjEvfZtS7rDcvfDJsKanbHoM8LT8ji5XIAtA0axWq
         aQV8JiCJclSvuIy2D/dkzoBmOWi+1j/ftaRQsM/EGY+3Cuj0jdz8cKnROz2U7uVziyaW
         OvmwBweBpJjpe+3wPOLKg7Dahh8S5v78XDSVjb8nT7n2lU552ueHA2nByOUiqX5ecvu6
         dj22E2XZpELZM9FwDcy5pbvVzW4ND/E6L70SoJ8rZt73RY3/1nPCQ0zbe/GWLlZCB53q
         F0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752827915; x=1753432715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXgOYTbgBt90IjpwJ0T6DCAurOotkArJw103biH/iBE=;
        b=VDGNwaN02xeWJWyLBhL1CbLNXCFXwQ09yM5tokLa59Dp4Z03aDiXGsHODmPU/M375Q
         7IIf+Nti726Mh1VWU5zVJlP2ut3uR5J0u2XTjXDEDDX/kKNYihg5oXOdQzhOL/rdImMm
         e8p51sn6HuRRHusawgzNfqVxHj2wwjciTD5PJrVxehr+X2UVz6Ph0HlaEiu6/ClRvBex
         JMvqAVU6Ok4ID3ty/VqRzxKQtySVvoV0gW4e2Q4QgJRT+RcA3hoKKN5kHoshoiqFplix
         9Y9cW9jgBDJCxUq8kMG2z3/m5t+oaAIhhfGQRn1h9YopPxJ+YBcxsdxYPXpfdEGM9sUj
         kDdw==
X-Forwarded-Encrypted: i=1; AJvYcCXho2FLg8mcfhOUT7Fj12WFwEUVm3vYNolDE+vDXVMT7hutAoANsT6t2uxtxrd5CEceBlm40fnmaNOS@vger.kernel.org
X-Gm-Message-State: AOJu0YxiftsuJmamd8xkLfl1bd/BTMCJsFLTdi/RaUrxv0fdicgJ7jAP
	IWNoHtds6tzvg+3lQhr/jc6Tq0K1k3iWI9Z8zmvwplVNk9S2Mz22uvecpwenIYWvTuuOGxMEaxy
	2qehLx1I=
X-Gm-Gg: ASbGncuX6iPDZQjZI6Lnvv2MlZFTZ8LtpZvPDGo/R7K4zuZx1E2M9fCKbH/ZvBp3LDt
	K/HUerpVakpNBI9EuAG3Y8tnMiLdLNX2L7yY/QjdTKwdb7wAFd30UJ/0OB3u7ILvSc4jaVgWduN
	G8/5OH10yB5y+DJqZF2afcZZG3QgXCHmdCbz7PvWCChsHa9mqjrG/ASrYNmp44FbICkOaxMKa56
	/Gvm8phpW3vbyjZLAxdUPEZZaN8wG23QkccsBVzdBz8bday+dPaJFP/ywxqVLDaLBia2VkTjm19
	8Q9DqpjVprc2gh11NZaoNziy5GRgML+wdIKqOru4Z4F9oRMGCby5QunsUsm21TBWZa85Eso5pi+
	3jSwb4YrhCnQiO1Ap677S
X-Google-Smtp-Source: AGHT+IFNocjEuc28rYTEh2nD7SaeEUsWN82H3W4NGv5/y7cD/uTzD8xEZbBDBcDw8hK3CoiOtNza6Q==
X-Received: by 2002:a05:600c:1d84:b0:456:207e:fd86 with SMTP id 5b1f17b1804b1-4563b89f7c6mr16164375e9.2.1752827914610;
        Fri, 18 Jul 2025 01:38:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e88476csm73582005e9.21.2025.07.18.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:38:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.16-rc7
Date: Fri, 18 Jul 2025 10:38:29 +0200
Message-ID: <20250718083830.81316-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.16-rc7

for you to fetch changes up to 11ff5e06e02326a7c87aaa73dbffaed94918261d:

  gpiolib: devres: release GPIOs in devm_gpiod_put_array() (2025-07-17 09:22:46 +0200)

----------------------------------------------------------------
gpio fixes for v6.16-rc7

- fix the devres release callback for devm_gpiod_put_array()
- add an ACPI quirk for Acer Nitro V15 suspend & wakeup

----------------------------------------------------------------
André Draszik (1):
      gpiolib: devres: release GPIOs in devm_gpiod_put_array()

Bartosz Golaszewski (1):
      Merge tag 'intel-gpio-v6.16-2' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

Mario Limonciello (1):
      gpiolib: acpi: Add a quirk for Acer Nitro V15

 drivers/gpio/gpiolib-acpi-quirks.c | 13 +++++++++++++
 drivers/gpio/gpiolib-devres.c      |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)


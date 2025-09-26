Return-Path: <linux-gpio+bounces-26610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F50BA3470
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 12:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C98A4E2B05
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 10:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B012F2BD037;
	Fri, 26 Sep 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cxKDBoE6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5833279355
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758881074; cv=none; b=PgNHhd7UiFG0/0WMyfXbbBpQ7/yJf6wprCUnrLn3mdL5c+Im3IPT8+CkJX2zQmE2BjV5vT++Ht6TVePdzUB6d8JtBRBA5QMU7BQDJiXQv0PWyIVNmM8F4OYPk6LCmpEuBukWIxzcDJgR1xuo/mA5XUQFyrl06fB26f9st9WW50g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758881074; c=relaxed/simple;
	bh=lfsbpXTCfUSN6aBMYs/nnoiIdzUuh9IZb45T4QOdBFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M2zjDOj8e/0wAkWU7uvjkL3VuFW7Cdy91dh26arhzzVNynEB2G1Eov4HT9dVbFaEiJZsNs4fA5JA0EFg+nbp0U59R7cS1wYlbwBRHsNkDrmMN0K1YSIpmhG+n/AfnlrDdkFrwSW6y9gwIego/Vd4fmeAnTYKApeeA/eNQxsZHmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cxKDBoE6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso3647515e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758881071; x=1759485871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQM9vZFM7FnvGLKPuP4NIyjEuejpFr/yasQmtJhsCF4=;
        b=cxKDBoE66gfM2ZcLKJqPdpQ8OcWN40RWoTA1sV0q5MQdNmfEFOPme/TEHulGmTBjyy
         UJxGJl6KpMr7cDaMW1q5fSVykfZ0OwSHYHEqHFeOisTYuD/hZZPIuzPTK4pPLM9CuYm9
         /wNgPO+3dub9u1oGubDivoVeW1ox5OOjt7aEmEq9ijxUF/hmwh89nw6DwSnoY9dWUqEx
         eQ+Zgjuqe4cdV4mLgRswjpjQiCP7wz8PghAdAyoL8c1AFC1By1/WqaRXj7Utm3e8VBok
         /NU7u/zkHNoYpTJSRdLVoee/iwWQhm9tujNZ8DWPhNQ0e7HlDe6sbKzYMqiOZREGdz0G
         y3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758881071; x=1759485871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQM9vZFM7FnvGLKPuP4NIyjEuejpFr/yasQmtJhsCF4=;
        b=kJ32W3BPTCPBcSXLR9+6yDOruaNJ2EJlx4VKUmkGcy/6BLJldDZNiyUNqp5wSaxg/2
         SAJKZupiJbawnE4Il2wbuu2bHfInAIQWx+KfRnbPije4fdTCUfBeHLn8hzeUwXBh073e
         kGIAt1gZn+HdaEI0pd9R6zzhx5K3X6TVcI6ARR3ze2fz8h/jqqoWeGStI+t8NmNn6TJ3
         GH95NkFdOVBCyy3rGG61sJ8uJuOcOB81s9iah5UoUNB6APPYdp2SsKlbmBwWbrfQ9TIx
         EffA881Md+cbspqnr5dPst94ZV0Jq1gh5TR1WM9V6cUF7FxbSc5qA0DJq6hsWwk7psx4
         k+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXVM7GFk8M2EVCGuPqPNHhMICl1h0MD7LuYpbUzenijluBvV5n+goL/+K3YEym7lUMEcIFGArmUGjQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YzR7Z6t6Ahc6M6UNop0+5CUuw8vrj8YdvCUH4wVtXqQBFTgJAnL
	xb3+1R0ie8KfDPdiaHe5V9oB79P9TM2HhOxciDdeoB6ZY52t7LqaOsVi8fO9UgkHKJzNP8Nfp+K
	53xdNK4s=
X-Gm-Gg: ASbGncucPi7/R2BbOsy/FAuernG0crHWM9ApHOf+O5pplC3lGYn4u7bX4W6kXDFTKm8
	s9VGCbaRzMw/kDo4t3EZywxTVqsrQHIptzOP4Cd4///ec2vtn27R2k8JtrfTklzfQJZrah6hB5+
	0SSyBr3LIWl2hWDFKVshP32RPXCu3CfrXOwEmyEaJmXtLQQH4Q4mW25ue3O4xsGWXx5Qt+9zurt
	/o6WYh0AHucK5kJeTYKW1t7QoVDOesob+yGb9IWDu2jn4QOKdx4AtBpQzjBRWG9k6cxIlje2ziA
	qWgzPPmVL21GDTgfAk+KcBKQVEIdIkZTV67Ye+Hz3mTb1Cg1ZMzLMOVkRXk+55kHCpCl+6U+vR6
	x9QxVG2xyAFHC3gJtL5y/MIY=
X-Google-Smtp-Source: AGHT+IEgYt39FJi5czBmqHTA/Ju3Jq2wKhFs+ghFwOE8QfeZzBA/+qSEwQ2i6S4wbag+tndOkFR0Ug==
X-Received: by 2002:a05:600c:c05a:b0:46e:24a4:c247 with SMTP id 5b1f17b1804b1-46e33c37045mr45634845e9.5.1758881071244;
        Fri, 26 Sep 2025 03:04:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ab15:a65:aecd:6def])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bf70b5sm67209715e9.21.2025.09.26.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 03:04:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.17
Date: Fri, 26 Sep 2025 12:04:29 +0200
Message-ID: <20250926100429.40265-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the final set of GPIO fixes for this release.

Thanks,
Bartosz

The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f:

  Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.17

for you to fetch changes up to 3bd44edd6c55828fd4e11cb0efce5b7160bfa2de:

  gpio: regmap: fix memory leak of gpio_regmap structure (2025-09-22 16:35:21 +0200)

----------------------------------------------------------------
gpio fixes for v6.17

- allow looking up GPIOs by the secondary firmware node too
- fix memory leak in gpio-regmap

----------------------------------------------------------------
Hans de Goede (1):
      gpiolib: Extend software-node support to support secondary software-nodes

Ioana Ciornei (1):
      gpio: regmap: fix memory leak of gpio_regmap structure

 drivers/gpio/gpio-regmap.c |  2 +-
 drivers/gpio/gpiolib.c     | 21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)


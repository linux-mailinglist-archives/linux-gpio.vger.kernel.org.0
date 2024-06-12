Return-Path: <linux-gpio+bounces-7391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1439051A8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 13:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D03231F2221A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 11:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67B116F271;
	Wed, 12 Jun 2024 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WO3eyGB5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4E16D9B1
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 11:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193185; cv=none; b=fxPMwQ1YfL9UDc2WzT8mcDRnpj/eI9ovxXCudYhklZh/Ead7i8NZA3l6xKAdWcO/UoeDf7nonWwYgr8BfD/x5vbngrZ2/Sswof+wYrDPzXLf52d0rcvxGQYCCR6O3H9LjoCMw+kwEVNwpfBUYi2S+vf8q13vdsqrqX8Z6NELy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193185; c=relaxed/simple;
	bh=vKRMbWdjF9yOL/g1hDUIhUM3Cg+zmGEy+ne+3L8QjP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1s8UtyG+YTk+UJipAU/Nj/OgJCWHdFI3x1B1b/MkLAnNdoq8fARpNEn0qn/+517BjltZSgOBXLCkFbZ4u4ViJAdKaRWaF1GJNbk3iU7TsLtpfXqwZjlLLG/ub5VYrlc7klD3NZMin5JkRi7IFek48uTfYPHjWAJd2Xb8wiQNRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WO3eyGB5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35f1c209893so4258775f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718193181; x=1718797981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2j4/+CT4I0equq0pDqLd44ZCV2YcKnc3gRoSLxgCNxA=;
        b=WO3eyGB5NofNmanyOzVXMKLJyrJWZTt7EH4YsHd52V9ZjrqRNKU435QJdVrrDGHIEg
         v45MBz4uuO+0jy64eFrJD6cYTnLpP9wMncafJK8n4nfPyxE1zwyWjdrvCSyPhFcF7XlB
         8dKq6b9UxVfOUstSu/qmQbP0vmN9whO6XbkYxYlW76hZh06MzUloYz4V7tK/kn3gvgnF
         VydpR2migmDN5swdiEw+waj2OALavI+MTcCG5EmQ8oIxfNBrANyrX8KMOjuBbiVat6sM
         ChxJM5FepzyIaatcuMrgjIjo1GxNfvjY0pMWjI5rX7pGw/+NDG5I08ZuiIwZpXJgXQLU
         6Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193181; x=1718797981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2j4/+CT4I0equq0pDqLd44ZCV2YcKnc3gRoSLxgCNxA=;
        b=eJxw+J+Iee2stnnzSeeCG+PiwlyJrWS7Z+zq8p60NtbQongnOcnq0KVTtf5IY5ifjD
         SqEv1mG24J5+VLhn5XNFVynEp5ttu6A0m+FdywLSDZxecFCBUpaAxNhIlwET9tLvuEBq
         fgaFIAvBvAZweGhqvoaofWBivpUzcTegvRaAcKMSnv8Lh1DAWzntAOUq8b5BRZrKcMQ6
         GTFsNYqqh7ULPD4adXfY1irUqP9cexfe3MteG9yixIr/B2EL0q3QWCLlze83qw4HyRGL
         P5VkGU/sV9waN+8veafCiXxBsD0Q9O78wD/S/0Ki8f1Yxb6PQiyaPZ0X9NRLuA2A63eQ
         Y76A==
X-Gm-Message-State: AOJu0YxJDvrFyEonhIRX50W+xKgBNdd8+2K9xtnE8KpSc2OaXBVYE1BI
	6pHx52fT1pqbtfeQXwk8NuRjMxIH9jw5EcaSBAiYdXsKMWhxqNycmxBjp1bjaYxt4Ov/8onCDyl
	e
X-Google-Smtp-Source: AGHT+IE43YIRV9hhpf23pRSHgH12FxURIo0G/IlJbnMq2RVxtsnwLw7yJRvuqJ+g97FbDzvbtAUozw==
X-Received: by 2002:a5d:51c9:0:b0:360:70b8:d4bc with SMTP id ffacd0b85a97d-36070b8de48mr28296f8f.16.1718193180984;
        Wed, 12 Jun 2024 04:53:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:a172:4e8b:453e:2f03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1c958f9fsm10457352f8f.38.2024.06.12.04.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 04:53:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/2] gpio: sim: lock simulated GPIOs as interrupts
Date: Wed, 12 Jun 2024 13:52:24 +0200
Message-ID: <20240612115231.26703-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I realized that the gpio-sim module doesn't lock the GPIOs as interrupts
when they are requested from the irq_sim. This leads to users being able
to change the direction of GPIOs that should remain as inputs to output.
This series adds a notifier to the interrupt simulator that users can
register with to be informed about interrupts being requested and
released so that they can act accordingly. The gpio-sim is made to use
this notifier and lock GPIOs as interrupts when needed.

Thomas: if this is fine with you, can you Ack it so that I can take it
through the GPIO tree for the next merge window?

Bartosz Golaszewski (2):
  genirq/irq_sim: add a notifier for irqchip events
  gpio: sim: lock GPIOs as interrupts when they are requested

 drivers/gpio/gpio-sim.c | 30 +++++++++++++++++--
 include/linux/irq_sim.h | 11 +++++++
 kernel/irq/irq_sim.c    | 64 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+), 2 deletions(-)

-- 
2.40.1



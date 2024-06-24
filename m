Return-Path: <linux-gpio+bounces-7635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CAC91468C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 11:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98AB71F217C7
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 09:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85503132126;
	Mon, 24 Jun 2024 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wjifBJ1V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4FE71B5B
	for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719221986; cv=none; b=A+tl/bd4kmkZGQOScrEzhsf2TsHua6OMH2ONBdcWs14eaXLQ2SGy4DH9tRgHdvXDD3mCklrvDpb+7Q6cArTXX6xOXynXa38WRLuVKjrhAYKrOSMkpKsXzpFKVCRfb8K4R85ZReqniQIDwZe1lRHQyH+MlKfqvCnpvBj3P+C4AEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719221986; c=relaxed/simple;
	bh=V4sbjs/MtXRhD3Cp3k6DnQo+6DsmCEXpzqqtUBTPsZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cLwOE3JXxfi7xiMRknS9nGTW2d52+zYC51lGKl95N+auA7FofpC9G9U+InQ094kd4rwghUR/PuHPT4XzAvyGKTCrI0F4YRAHTK3JMZ8oQ3ArGRe31nGicOk61Gxmy9FSmlqqoIfH3WCJNjJhA0I9jy33C70TrnAjJ76YvkEATlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wjifBJ1V; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-362f62ae4c5so2320342f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 02:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719221983; x=1719826783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BumunFyrBg0RpxnJkaY7ClAmF2u147FskiCCZCxcpZk=;
        b=wjifBJ1VkeLonPICiz5HKIpRUr8manEhB0i8COJnKWOi60MA2ZrnuRq9H8yj+5ot6y
         sY3XQC2X0CSYyNeTkBB/B9iYtMPsgLmPGRqe3C9mnXO/mFq2D9PldLh7vZ3oZzkkF8MW
         v+RQYb5uFqdCLObWH8zqXX0y3rvzh4Le0MZrmhlAbAoF//YcQMP3HDx39ey/Bz8wY1JW
         IxPqTpY0iB+QhacSspIm7GtlcEeGiUiCFzNXFkLnABGFyqFhD29+0xrZ10O4JEbLuDa8
         PpFvriytPYjzPsdrrHibCbJlvcyiBNPdHKglhl4fYfUMIRuYy8Qk2EoVoW5DZp1WnyHx
         W9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719221983; x=1719826783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BumunFyrBg0RpxnJkaY7ClAmF2u147FskiCCZCxcpZk=;
        b=FBv7L4N+zhOpQLWOh3lGakLYU164fadlaDS3KgIXmuwed3yCoEz0d5Jvd2wPQsENQL
         0akx32Wbo70nCGUoyG9ob6Uufl3uZ0+cBRtxqbzOCDYNhzfQPQW2esITr/DnvBJWXFKm
         /l/EsZVsLvlad8qL11dkBtmycx0NYUmZTiYyyj3VPC6qC32KW76IJAb/E7dR8JVTTF4B
         VMs0kJ6rrrBM8C0XLKzls1rYP0Gfa6YM8adMyPp45T68mrhm+wUfthP3wREqqavoHLcN
         8o4FqXXMJgoTa6Nqpud/r89MjzygtVUg0ljBWqlOG1DzfZmvEfOfmT6IpMb3eBL7dOx5
         KJMA==
X-Gm-Message-State: AOJu0YxeEcJL0B6K+zT4bZPN//VtzdRdNMebQXkAALOF4id++sFoQ2Lz
	2s/tQhti+85xXqUHVSQkZuIzDSrJfibHDmYYIeu5wPi71+Go9OkF5rMUpIeuJzk=
X-Google-Smtp-Source: AGHT+IFxZLJgskypoyrOaB8qoW2dIx/iyz7IimikSnTa3DpPPOzyT5GgEczuuZVwyCOeMUIvtCBE5Q==
X-Received: by 2002:adf:9d89:0:b0:366:f976:598b with SMTP id ffacd0b85a97d-366f97659d1mr709313f8f.8.1719221982536;
        Mon, 24 Jun 2024 02:39:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b80e:a46a:7fb3:4e3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638d9c1aasm9433138f8f.55.2024.06.24.02.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:39:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] gpio: sim: lock simulated GPIOs as interrupts
Date: Mon, 24 Jun 2024 11:39:31 +0200
Message-ID: <20240624093934.17089-1-brgl@bgdev.pl>
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
This series extends the irq_sim interface and allows users to supply
callbacks that will be executed to inform users about interrupts being
requested and released so that they can act accordingly. The gpio-sim is
made to use this new API and lock GPIOs as interrupts when needed.

Thomas: if this is fine with you, can you Ack it so that I can take it
through the GPIO tree for the next merge window?

Changes since v1:
- drop the notifier in favor of specific callbacks

Bartosz Golaszewski (2):
  genirq/irq_sim: add an extended irq_sim initializer
  gpio: sim: lock GPIOs as interrupts when they are requested

 drivers/gpio/gpio-sim.c | 25 ++++++++++++++++-
 include/linux/irq_sim.h | 17 ++++++++++++
 kernel/irq/irq_sim.c    | 60 ++++++++++++++++++++++++++++++++++++++---
 3 files changed, 98 insertions(+), 4 deletions(-)

-- 
2.43.0



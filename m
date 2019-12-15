Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773EB11FA6B
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 19:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfLOSbj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 13:31:39 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34859 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfLOSbj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 13:31:39 -0500
Received: by mail-lf1-f67.google.com with SMTP id 15so2658787lfr.2;
        Sun, 15 Dec 2019 10:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9qAg3wIzZX204w336ZHZqBn5SnmZdVi95LKDsqCbyM=;
        b=lkwSUYiPHAC4G9NADQvaEBv60Qi/rxBiNW1AbvFYHLwpHH67llWOavJBIznQ0r3tWo
         rjYuHrcwu3sVVZqa3bOT03gpPKfClh7tAFnJhtjzzWsJryxi1AttRgFcTaemZkWQdtyV
         yvVc2YOx+fGc6NUtmTy86/8LsCtmsU1jqEgkrKcatMCbCgO/Bfc53TehbPYQ3MUnEtOs
         ZRcWLmiy7P/A626LocHxMjBtleSFYJ+UNBLVb6Kn77sZuwojRg1Wxd57YZGvy237JVmv
         vmKW6byXh3Pmtw+89qZdAwkGMnghNucF3sXuaHMEfLloh4XNVCNn0md6quLUkPi/5LtD
         p5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9qAg3wIzZX204w336ZHZqBn5SnmZdVi95LKDsqCbyM=;
        b=BxRiqnn0wzVL+g2VGV7iLQtzlgKz5tULDLQM6Efc0LvYm6VpjZsZlWKfPhCKp8sU/D
         fe5pidjronEG798BmtXrHUAy6/pZucLkt9rsBHzw8N9ZBQZp0aZQJbTPuuuBNoIF/1ZO
         xvsDaLNKkJUypInjW4k6JVR8Py46f3Kgktz4MDfy3g49F08sISszisIajFXWM6WitovH
         OTgUaPs1wHnYpaM4kd/6oNy8wpuUgKzv3srqjUT7MYVRtoiJ1ZA78RP3KlSJ//J26j9D
         bangicZIQW2KKlgEAk22QE/+PxC0l+Mk4a47a//Q/YRm0oeGe3sNgx4uGyiBrSxatV6/
         TWvQ==
X-Gm-Message-State: APjAAAUvGaUbaPhPx+/Sc1UJcwRbAq+pOdh65B/xE5tChpOg3osRzaJb
        LVAs4ZDe4Zh1n74GUXo5JY8=
X-Google-Smtp-Source: APXvYqx1dXuxnTq/sTimnff9Ol5ZtwNphjRWSMJORXLq6H0GIgzqx3IhNXEtmatxvK+rsd1sQ6P/Vg==
X-Received: by 2002:a19:8842:: with SMTP id k63mr14556166lfd.90.1576434696640;
        Sun, 15 Dec 2019 10:31:36 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id v2sm8814277ljv.70.2019.12.15.10.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 10:31:35 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
Date:   Sun, 15 Dec 2019 21:30:44 +0300
Message-Id: <20191215183047.9414-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I was investigating why CPU hangs during of GPIO driver suspend and in
the end it turned out that it is a Broadcom WiFi driver problem because
it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and this
may cause a bit weird CPU hang on writing to INT_ENB register during of
GPIO driver suspend. Meanwhile I also noticed that a few things could be
improved in the driver, that's what this small series addresses.

Dmitry Osipenko (3):
  gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
  gpio: tegra: Properly handle irq_set_irq_wake() error
  gpio: tegra: Use NOIRQ phase for suspend/resume

 drivers/gpio/gpio-tegra.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

-- 
2.24.0


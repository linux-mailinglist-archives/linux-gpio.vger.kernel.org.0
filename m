Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74CF011FA78
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 19:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfLOSbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 13:31:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42592 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfLOSbj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 13:31:39 -0500
Received: by mail-lj1-f194.google.com with SMTP id e28so4242745ljo.9;
        Sun, 15 Dec 2019 10:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJpJsdQ2YtTH6nu1Avkb9OWQxXwS0eSkzuTedWw0wzA=;
        b=OECtxzRjr3i8KK8Sx4kBdHFFatddwjCrYJBMoz/f5fc2dHM276Y2bip6GV1eHnCUqa
         aacw+T1Uo0Ft4EegS7TcMDSfknwrG8RYG5TpFErd4OWkwwluMHxAAwmucCxcpU57Za+Q
         cNFKvt2YW/vMPrp5m+3ugcPpwR6rmaf6g5QgZOL4dAXK8fhhprbvefMQNTWCLeTb/i5n
         17XFj4R44a7TyiTSoC9HhszDi6Nj76+UFodIs0HuL9VJYepAUJ22ih8o0ueYzLc4sRzI
         XYT5iNCpw1LX/mWaHqCIsdmv7F8D58KXTnQ5HfXcIeLseCoOVHXFnZ3EqSIpx1R/hs0S
         O5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJpJsdQ2YtTH6nu1Avkb9OWQxXwS0eSkzuTedWw0wzA=;
        b=MvwsJXq1o0zaY+md34zfB7Cc/aOu0MkDh2pKTAWs8MQCcTc7avWgcfyk0Ka8L25S6o
         39Z6eezK2HQQNCOA+Irk7dRcE05ALok5kuY2Z84mlRQcQIdmia+HdZiQUSopyMnU1hov
         cclDrwJxSfeVsuT7WGKAKhCQrz4MPxatfn3+lg911EIy8puNoAbIUIRJuDYPLsmQ7ARx
         Hl+nKQ5zQFjuUnz7ql2CyN1dKclZbwnArHJOs9TiW0emDdqyl+DLcA3GccTmJdWre64K
         CWlzySz4jW1i4ZuzkJba84zjr4uARWamDKt+oasFgQKafw0wHkfEu/DrWpqYog1faUGU
         seHw==
X-Gm-Message-State: APjAAAVtsxVfoqlC+xK5sZVrLPmBRWIcWJddh4PVO1CMaPAaWZhUujQ3
        TKJeOCs08FOh8iVWh096V/c=
X-Google-Smtp-Source: APXvYqxRywx9Bm9sJE5wb3QBUbnF8bl4vnzWBM9c3XS3SduylB0SM0M0FGNl5sZ1Jer5c7GwR9hLOQ==
X-Received: by 2002:a2e:9684:: with SMTP id q4mr17252373lji.242.1576434697498;
        Sun, 15 Dec 2019 10:31:37 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id v2sm8814277ljv.70.2019.12.15.10.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 10:31:37 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
Date:   Sun, 15 Dec 2019 21:30:45 +0300
Message-Id: <20191215183047.9414-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no point in using old-style raw accessors, the generic accessors
do the same thing and also take into account CPU endianness. Tegra SoCs do
not support big-endian mode in the upstream kernel, but let's switch away
from the outdated things anyway, just to keep code up-to-date.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 6fdfe4c5303e..f6a382fbd12d 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -96,12 +96,12 @@ struct tegra_gpio_info {
 static inline void tegra_gpio_writel(struct tegra_gpio_info *tgi,
 				     u32 val, u32 reg)
 {
-	__raw_writel(val, tgi->regs + reg);
+	writel_relaxed(val, tgi->regs + reg);
 }
 
 static inline u32 tegra_gpio_readl(struct tegra_gpio_info *tgi, u32 reg)
 {
-	return __raw_readl(tgi->regs + reg);
+	return readl_relaxed(tgi->regs + reg);
 }
 
 static unsigned int tegra_gpio_compose(unsigned int bank, unsigned int port,
-- 
2.24.0


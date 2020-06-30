Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE49820F5B6
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 15:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388165AbgF3Ndy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 09:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388149AbgF3Ndw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:33:52 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B59C03E97B
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:51 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f139so19613059wmf.5
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zyIUTlmpGUcnH+LiKgtC/ATIX5960EbAPmpzyReDmls=;
        b=Q6mGE5E3X/8/+zlhENHURAJbLrEQhKKP61fNSre5+zd/awBDhaniAZCqLJv3T/K+xB
         LLaHcTkwe5z7mGfkbouNMs2GcI+AqRHhuq6Gz1QCCRJe0Y+hn/YHQuGUZWAqb7RUpdaE
         70+NaU99UEzrWJmcUxMJBjS1r9r8XFy8753y04wH/FBtreZ39DbEg4yxDeqSHADl49s1
         crYCHpqzEp8rRerMgtEmyT9czhG4JiM8cwA7eHXPiSnTgDUgjm80qrR51MCfCoBh7bds
         M2AxS/fr2tEVYfL0+cYxhEvrKD3lrdVVxo3BgjB+eZHFrUSXOVioVHn0oc/fAVoRStuq
         SWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zyIUTlmpGUcnH+LiKgtC/ATIX5960EbAPmpzyReDmls=;
        b=uWevhmGn+nQ0aNI3s9bdvA466V83tdo8SfPqwqYKG3E5M+jPbeYKpJXt/t0AraPIl3
         deTbZ4xgnUwrQymJX56NfmCIfacAberFDyvpy+ubTMs/dNQFFF6LajEJzKvE/7tcAZIg
         oOFpGJdVg7kfTZlWhICOeOIhfjMShW3OiMS7dWtT8TFRNOimkc7fmgja/ItJpyHpTMJV
         JGUPqyo8bY5y/S9KPbc1Y/xgVy8Wy2sP6zMMJLqXahdKOfau4zptoFiMzbYJzjI7ae/Q
         4f1tJ/eQs1Az+aAfrTXiD8uvOnRsXoN8oWpoVserBRYv2Xh9pcLSWg2xnsbdA+HDgtBM
         gIaw==
X-Gm-Message-State: AOAM530BAeDtpAbRZ+A56c2QnXYyAHTIHLmYJc7GPE2yYD8YUrhk0DFx
        kQZk++bWlQ7dB68AJZQEvr78Hw==
X-Google-Smtp-Source: ABdhPJw7St3BA3NSrWMeVnDiPKDDzNpn3UpLraNAHGKv+8L6f1Y/qEVIk8Dy7tAqPKp72fwVAxdgCg==
X-Received: by 2002:a05:600c:2058:: with SMTP id p24mr21449910wmg.74.1593524029704;
        Tue, 30 Jun 2020 06:33:49 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:49 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: [PATCH 01/10] gpio: gpiolib-of: Provide documentation for of_gpio_spi_cs_get_count()
Date:   Tue, 30 Jun 2020 14:33:36 +0100
Message-Id: <20200630133345.2232932-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630133345.2232932-1-lee.jones@linaro.org>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Descriptions for of_gpio_spi_cs_get_count()'s 2 arguments are
missing.  Document both 'dev' and 'con_id'.

Fixes the following W=1 kernel build warnings:

 drivers/gpio/gpiolib-of.c:36: warning: Function parameter or member 'dev' not described in 'of_gpio_spi_cs_get_count'
 drivers/gpio/gpiolib-of.c:36: warning: Function parameter or member 'con_id' not described in 'of_gpio_spi_cs_get_count'

Cc: Anton Vorontsov <avorontsov@ru.mvista.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 219eb00542334..236985714ea92 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -25,6 +25,9 @@
 
 /**
  * of_gpio_spi_cs_get_count() - special GPIO counting for SPI
+ * @dev:    Consuming device
+ * @con_id: Function within the GPIO consumer
+ *
  * Some elder GPIO controllers need special quirks. Currently we handle
  * the Freescale GPIO controller with bindings that doesn't use the
  * established "cs-gpios" for chip selects but instead rely on
-- 
2.25.1


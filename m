Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82202F1528
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 14:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732829AbhAKNfy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 08:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732031AbhAKNfx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 08:35:53 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A688AC0617A3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:36 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id a12so16415529wrv.8
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9PWAjj6KAmmN1RPUy2sMDvaGFXGluCDaXTYP2i4wwX0=;
        b=Z7HSVy7wSFFnfEuvJQpJpxt8KhP1EhF9bXDY7qu55pIXBBxvPw6Scb2q8K9kdsxW4C
         Jhb3KZavw1sRraNH3TnliiJU/7o9PgpmKDUJHQeBxV41RCxW06EvaB1If+7e6uvJ4+Ia
         zO6evyH7bsNIfKrtmra0jYGh75PSRIHP1YtTgc45CEQa2VglXMjeGXohrwlJg/lZMpPd
         COlpDzvpYz0RlnTxySaz4AskHY4iotJnpAhR2ih1jf09pypQCJuf9i/QtnDLEXl8P4Au
         anW+6Qv0yfa9u9NRM91HSbq1JhU3kN2yRYal0MV3KrqEtGFXiY3PiHlag4UMEcBKup/G
         mq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9PWAjj6KAmmN1RPUy2sMDvaGFXGluCDaXTYP2i4wwX0=;
        b=rLOeFkCsxFRgx9yZAdWmx433tbMkC0W4PBoYi3rA78/OZ7UJfSYUtnxkjJDG33I3bG
         uMOvHA2vr+oPzyE7ZpPPG1gXv9aI1G7if1wO8iT/FT4zICRHgoWNMcjsB4lU3azbFTJV
         HllHlSWkV880W11I0/qT1uzuvS86Y6AreRJ+miwSuwD6UFQOg5sAlaCfrNCncqOVmCBx
         /3sesFN2lMMRhqgWEne2CMq9G+itFRvzkY8xbWV5a+0IU44smI5mRQnFfmwVrcBmGOK2
         EcsG5zO7PtGPTjXFlIWHj7zpke4rw032IBRJp0+VkwGbWyPLTeyLPidwUdWOqSn4oeqT
         FypA==
X-Gm-Message-State: AOAM530zF7kHVbLu2DhV8r9PBUHUwQuwzrx/EWBy1MjML1UORORQw07I
        tYtXbKX3tAa+psmKQki4o/BOpg==
X-Google-Smtp-Source: ABdhPJzpJg6wlL75/yCRIRrsLd5gU/jEUxO1TW30hQI2tzqeH1+/2awa5FolJYc91yOrQ4L41tKaLg==
X-Received: by 2002:adf:e452:: with SMTP id t18mr15683256wrm.177.1610372075496;
        Mon, 11 Jan 2021 05:34:35 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m11sm21456741wmi.16.2021.01.11.05.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:34:34 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 5/6] bindings: cxx: line: reorder bias mapping entries
Date:   Mon, 11 Jan 2021 14:34:25 +0100
Message-Id: <20210111133426.22040-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210111133426.22040-1-brgl@bgdev.pl>
References: <20210111133426.22040-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reorder the definitions so that they match the order in which they're
declared in the class. This is cosmetic only.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/line.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 04b15f7..cb9b6dc 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -20,10 +20,10 @@ const ::std::map<int, int> drive_mapping = {
 };
 
 const ::std::map<int, int> bias_mapping = {
+	{ GPIOD_LINE_BIAS_NONE,		line::BIAS_NONE, },
+	{ GPIOD_LINE_BIAS_DISABLE,	line::BIAS_DISABLE, },
 	{ GPIOD_LINE_BIAS_PULL_UP,	line::BIAS_PULL_UP, },
 	{ GPIOD_LINE_BIAS_PULL_DOWN,	line::BIAS_PULL_DOWN, },
-	{ GPIOD_LINE_BIAS_DISABLE,	line::BIAS_DISABLE, },
-	{ GPIOD_LINE_BIAS_NONE,		line::BIAS_NONE, },
 };
 
 } /* namespace */
-- 
2.29.1


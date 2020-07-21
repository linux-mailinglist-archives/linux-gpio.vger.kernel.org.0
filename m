Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4AB2282B0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgGUOuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGUOuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:50:05 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D438AC061794;
        Tue, 21 Jul 2020 07:50:04 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g10so2365367wmc.1;
        Tue, 21 Jul 2020 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NuxS/YlfNn8XyS7GkKomUpEyuCciWXzwunr2ZyS2ffE=;
        b=TMjyC4rkQ7A9UkLFTzOsSS7dB0U1VDYV5OCNuXrbRnYJ+H5fUYIMzY4ZOfgeZz+aEi
         sgt0wVSQP/YPp5E+cY0vRnHlKe2ej0sZQYExDDnwrekw27ViEZiKqTdlrvdvnp4nWNbE
         AS93NYy5x6/AagGBCUizhDHLWQMmkclpRkPp1rYLPpDB/xIy2jDKYRnISuyCNir7k77E
         QpldJjvx2Ic3CDWPiJJFN/vOw8zz/FQG5uAbzcWL8nHub9OjcmilscqfpN1U3j4wvMRO
         MzIjGSutz143lYEQqrSW2LkquC5mOIY7x/xD8TFjmrULqw7hdVVHmppfUIroWxeLdTp/
         8qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NuxS/YlfNn8XyS7GkKomUpEyuCciWXzwunr2ZyS2ffE=;
        b=YqvcQNo8H6vXAYBl5gqPRR+YAb/FOfQPJoAQrLkCybVJ7yog4wgQ6tUBgF+KNTN3HX
         wiBW69beerxgMcKJN7Wb6Pk14Hsfm2fGcPVGJ0QSeRdbp4cvsNwYLY627V9TQ8NxFkRd
         QzwouuO2ax9YgJna4nh/S1j0QHMAJZUtnTtBXThDLa1zB/Sd/2QopEJZs9Lp4eDw3p2f
         s718r5x5lR62Fx5g3D2nbPvgfUGDukO8nPBN6VoHoWKy0lfupeMB/YNv3fPh4N+fv+cS
         /HTb7B4W4SUARP2U9NUNR9j2ZADl1gu4O0jHcgucwOFwTIPv1Uomkx04Yv2tIS1/K82m
         Qjag==
X-Gm-Message-State: AOAM532JYvrjLSDxLNrSe0KPz4SEbQp7axTHMEZuOq2XQCe0N4QXqB8v
        v+/1HbJKGegqOxUgH1NYcqs=
X-Google-Smtp-Source: ABdhPJx1xXfMScCwSaM58Uzr5nx1URk2yPaXj7rE3vbvRn94MBs6hCl3bPq+8AqxbZEn++hbcbOwNw==
X-Received: by 2002:a1c:a993:: with SMTP id s141mr4570847wme.174.1595343003483;
        Tue, 21 Jul 2020 07:50:03 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id l15sm36605788wro.33.2020.07.21.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:50:03 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 3/3] gpio: gpio-intel-mid.c: fixed a coding style issue
Date:   Tue, 21 Jul 2020 16:49:42 +0200
Message-Id: <20200721144942.762495-3-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
In-Reply-To: <20200721144942.762495-1-abanoubsameh@protonmail.com>
References: <20200721144942.762495-1-abanoubsameh@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added an empty line after a declaration to fix a coding style issue.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-intel-mid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index a9cef06b813b..a609964645c1 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -317,6 +317,7 @@ static int intel_mid_irq_init_hw(struct gpio_chip *chip)
 static int __maybe_unused intel_gpio_runtime_idle(struct device *dev)
 {
 	int err = pm_schedule_suspend(dev, 500);
+
 	return err ?: -EBUSY;
 }
 
-- 
2.28.0.rc0


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2407521D8FB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730226AbgGMOuA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730223AbgGMOuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:50:00 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DE0C061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:59 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f2so16819442wrp.7
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nkDu4+NF/Jy0nw1npPjBWOEwj+80cykTcSKL8zkEyoE=;
        b=ZmtW2ht4WqM7YXMQqyxHw3ZRWguzPgBqFC2JKAMqnldEWEsJAUcbwc2bmoKXuvKdhB
         ohLnx6dHRciOiJRTxfPCFjCrEU+2qXEPZTQjSGaojFkCaf6eucv0LMOlOH5ybPM6rBxY
         tDPXuEMK7uUVfDp3zwVJ2KxMPq7Hr81fGJ9+9pNX7BcxMW5GNb707zAllgt9brug1YNA
         C5iAFICTeYYWHDJz2rbibn+U9WTtjaFxewwzqY+I7CTq4Iw2/NIsi2sAK7h9pWrxK98S
         7uCOBoC0BEbMzYAIM8CRkDzn8+axiDVRtayVn3F4BqiORSe8IAY5nVQWBQKD31MV3mWw
         wsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkDu4+NF/Jy0nw1npPjBWOEwj+80cykTcSKL8zkEyoE=;
        b=J2sXFzcc3/pvhn3QpwaOUMQZEJwxU//+7xojuNNV2aMAtVhayZC5XmmuUwjl+ATfyB
         y2u5LK4Ki6CDxcxVQIw+VSK0rzto7nn+njyZmVJ3H8XZvW9yu0Jhq0wKjDt9iSKxSRxn
         07JD2hnhzCI2X40EPvcovnnOVdxZ15kkKe9z9wSmMYtEdcdhG1O1boVGKnCxRl+uom79
         fyzP+TSH2MbSNLP/w3tjd+ECAUY+jl3om10sWL5St4U420RQJDSufZ2f+yx1vRZ5R41d
         qBf88fwkVy+ocR2W0DQysSHEK0F3aVX4A+qjRnbwIZM2rtjt6DIM7iWEDF2f/hlQcYJx
         UBJg==
X-Gm-Message-State: AOAM532MZZBUDvtBsBQ/Ayo7G6sPB56hHQuVOuoSdk6ekCwdgV4EnOj+
        oqRCk2DVbvi87uxxlfYyj64aEQ==
X-Google-Smtp-Source: ABdhPJwWZnEQwNy0uHw6fz+gVKKB5MdRFqRoRee91JUrZWtXKOGQ/CMQO9b8C5u1UFocGLb+2c0OYw==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr80843478wrn.269.1594651798432;
        Mon, 13 Jul 2020 07:49:58 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:57 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        linux-amlogic@lists.infradead.org
Subject: [PATCH 23/25] pinctrl: meson: pinctrl-meson-a1: Remove unused const variable 'i2c_slave_groups'
Date:   Mon, 13 Jul 2020 15:49:28 +0100
Message-Id: <20200713144930.1034632-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It has never been used.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/meson/pinctrl-meson-a1.c:749:27: warning: ‘i2c_slave_groups’ defined but not used [-Wunused-const-variable=]
 749 | static const char const i2c_slave_groups[] = {
 | ^~~~~~~~~~~~~~~~

Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-meson-a1.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
index 0bcec03f344aa..8abf750eac7ee 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-a1.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-a1.c
@@ -746,11 +746,6 @@ static const char * const i2c3_groups[] = {
 	"i2c3_sck_x", "i2c3_sda_x", "i2c3_sck_f", "i2c3_sda_f",
 };
 
-static const char * const i2c_slave_groups[] = {
-	"i2c_slave_sda_a", "i2c_slave_sck_a",
-	"i2c_slave_sda_f", "i2c_slave_sck_f",
-};
-
 static const char * const spi_a_groups[] = {
 	"spi_a_mosi_x2", "spi_a_ss0_x3", "spi_a_sclk_x4", "spi_a_miso_x5",
 	"spi_a_mosi_x7", "spi_a_miso_x8", "spi_a_ss0_x9", "spi_a_sclk_x10",
-- 
2.25.1


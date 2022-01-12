Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4C048CD87
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 22:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiALVQz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 16:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiALVQz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jan 2022 16:16:55 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037A1C06173F
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 13:16:54 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id g5so6092162plo.12
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 13:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mq0Wt8Vn/qiiAup0Vg6KhdHWi/YhPSi9A/mE62zgcTY=;
        b=I2o/GL1Z5DElX/Ffgs511o4VQ1H+5gvy2qNgs9tm3qQyKkJLXirsZ7soF/AcGy6Rjq
         KBxr462PSJpcPy0gYJe5XJwVcVs5ovpAKVUAPZ5R+eUGY60ZVgIjazTHhG66ad4zZy4E
         v/E5iXihdZXc7UyogWRYzSRG/EjUEldgW6fzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mq0Wt8Vn/qiiAup0Vg6KhdHWi/YhPSi9A/mE62zgcTY=;
        b=eHW+rC1K+1+GiXMnmIQ4HEpJZxfWW5zWFFj8u8oo8AYeyloePhk6seB/hnbcKTl5rJ
         mOwFBGqfHPampOeUY2Qr5tD8YhM3sF+ZL0VB2DpJY8p8hW/DN4YPKDmnleNdje51kYqH
         ziiIndj5rVmprAnrnCD57h2xaxsOc3TNXSLBndW5bEd9QdySS3xdfHV3p+DTJYKmvYC1
         NzOHM0/T1GVyzFBsT49lYJghLDDR/EDk1DHEwFIGxESqIMlIWPmGXpn3iQ9UTIFEsP29
         1GeSUwrVf95kKzcxM9c7Mtcq9j/OsPBiIZIAfuHJS22YzFi1QMa5Bq8ZuOsWPX2+xExG
         FKhg==
X-Gm-Message-State: AOAM53147Ivy4PfY7tW385uSQw77zt6j6iowy/m/VcuQRuoD4QBa+17D
        VeQLhfuCESYLOCbPAJifcld/bibAOL/Wvw==
X-Google-Smtp-Source: ABdhPJxpidhGuuJTbkVqZS8M496Do+5ahd77nK9hbLfhJZQp2xJx5laJfxjGwF06S6/t0BzCo4qeEw==
X-Received: by 2002:a17:902:e74a:b0:14a:3b22:5ca5 with SMTP id p10-20020a170902e74a00b0014a3b225ca5mr1286766plf.96.1642022214506;
        Wed, 12 Jan 2022 13:16:54 -0800 (PST)
Received: from localhost.localdomain (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr. [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
        by smtp.gmail.com with ESMTPSA id h15sm507192pfc.89.2022.01.12.13.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 13:16:54 -0800 (PST)
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     linux-amlogic@lists.infradead.org
Cc:     Gary Bisson <gary.bisson@boundarydevices.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] pinctrl: meson-g12a: add more pwm_f options
Date:   Wed, 12 Jan 2022 22:16:40 +0100
Message-Id: <20220112211642.2248901-2-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add missing PWM_F pin muxing for GPIOA_11 and GPIOZ_12.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index cd9656b13836..d182a575981e 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -283,6 +283,8 @@ static const unsigned int pwm_d_x6_pins[]		= { GPIOX_6 };
 static const unsigned int pwm_e_pins[]			= { GPIOX_16 };
 
 /* pwm_f */
+static const unsigned int pwm_f_z_pins[]		= { GPIOZ_12 };
+static const unsigned int pwm_f_a_pins[]		= { GPIOA_11 };
 static const unsigned int pwm_f_x_pins[]		= { GPIOX_7 };
 static const unsigned int pwm_f_h_pins[]		= { GPIOH_5 };
 
@@ -618,6 +620,7 @@ static struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(tdm_c_dout2_z,		4),
 	GROUP(tdm_c_dout3_z,		4),
 	GROUP(mclk1_z,			4),
+	GROUP(pwm_f_z,			5),
 
 	/* bank GPIOX */
 	GROUP(sdio_d0,			1),
@@ -768,6 +771,7 @@ static struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(tdm_c_dout3_a,		2),
 	GROUP(mclk0_a,			1),
 	GROUP(mclk1_a,			2),
+	GROUP(pwm_f_a,			3),
 };
 
 /* uart_ao_a */
@@ -1069,7 +1073,7 @@ static const char * const pwm_e_groups[] = {
 };
 
 static const char * const pwm_f_groups[] = {
-	"pwm_f_x", "pwm_f_h",
+	"pwm_f_z", "pwm_f_a", "pwm_f_x", "pwm_f_h",
 };
 
 static const char * const cec_ao_a_h_groups[] = {
-- 
2.34.1


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1388E483462
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 16:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233952AbiACPq4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 10:46:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbiACPqz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 10:46:55 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DFBC061784
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 07:46:54 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id co15so29107790pjb.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 07:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mGd2tehqllUPXzMzPxa45XALLgMArX9xtGYlZrmeREY=;
        b=WvtxB1ung9NzUxIWNt+S8bbVr7Oo/WYuoF1OH9gg15H9VGzCZDxkFMYB6WJB0j54PM
         Eb9HjuoT5rA5xMB3aY1+5NI5/68dutfwSltaz1WOMLZGjc9BOAqXKEF7NDoZRUGGmm7e
         u3crLy0GnKkTWuD2EUHEusSLAhntfBkG3uAYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mGd2tehqllUPXzMzPxa45XALLgMArX9xtGYlZrmeREY=;
        b=vmgbXtyCQrxxpZ0lsIVKQmh/CnRlbc9fTEz/NNCuMOoNduZhtu7D5m5sE1uxSe8Wnj
         zzuaK4bOx4ckpGmg0wAo5P/ghp0dwctdi1kzqcqWHaAru9FZ3JeXNjJh+7dbnL6dkCZ4
         m9X9OZZSI0PZ1Wv3RIDkYlzfZcGHUlhC4NhAyhrr+yA0jSsHaCdtflpaFvZXrvuEOw2a
         ES2yyJ9JVFcoY1o6DzxNFDoPKqVHYfT3w0Zh/s+z3Vkn/kDqlSXlb4BH8tSKHweseHtK
         qsqr67gkwNcsUsnSo1ZherO651FA4/RZ1mr5U5ia0w7eJ4+zBLkUYedyGYM/RkhiR0gy
         z7iw==
X-Gm-Message-State: AOAM5304ziiYwJ8Cnf4I/qKKtuEv+AOASAfKvKc6L9nfwVfggUJsEg1q
        FUtRpzAUxlEo8Zi4DVc4Wcc5XQ==
X-Google-Smtp-Source: ABdhPJzUBnOMa3u341HSV7yD1MmYO/74k9hrxYCcrAiKRckCANPf4WLP8hN5nqUEW6OFbqayue0rVQ==
X-Received: by 2002:a17:902:8e82:b0:149:b26a:b9c8 with SMTP id bg2-20020a1709028e8200b00149b26ab9c8mr10850854plb.143.1641224814429;
        Mon, 03 Jan 2022 07:46:54 -0800 (PST)
Received: from localhost.localdomain (lfbn-idf1-1-1088-186.w82-125.abo.wanadoo.fr. [82.125.191.186])
        by smtp.gmail.com with ESMTPSA id l2sm41080153pfc.42.2022.01.03.07.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 07:46:54 -0800 (PST)
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     linux-amlogic@lists.infradead.org
Cc:     Gary Bisson <gary.bisson@boundarydevices.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] pinctrl: meson-g12a: add more pwm_f options
Date:   Mon,  3 Jan 2022 16:46:14 +0100
Message-Id: <20220103154616.308376-2-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add missing PWM_F pin muxing for GPIOA_11 and GPIOZ_12.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
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


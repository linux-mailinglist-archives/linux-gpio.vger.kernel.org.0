Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D92E456545
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 11:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfFZJHh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 05:07:37 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46032 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfFZJGp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 05:06:45 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so1745788wre.12
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 02:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j3tTOMHSiFLp+myEpmzmt12jpkjBS7JqoQLTAOWEufU=;
        b=kvEHQB03XrT84WCCgsKDcFFTwKXwKaZ9mDxKAfYFkJG0CyuFNQRy4K8U+kFQ/pSpA8
         r0FZiPGnVvSVEjDRozPe/MTE6t5BbBDy+i0PBLgpt+6tDDw0RzZ2vS3LjJWOZN4DwRZL
         BGnJh7xqxgqmsiPsbISq953QPFmuJ9iADvx8lIEBJ/xkcF+gctf3zO6QpOwhzOmBF0i1
         zfriLTSiHGJYZUvcZGdIIDxwbOSLyx4mRW2hQBrweBIY/TdJaOqa6xp4pvLLXuH0TY6O
         TWQOef7/FtK0IATdV/kq073FgFeAQjyr2yZVKMps3dem6FK9Oa5Oh7L7ggjpbboZhhhZ
         YYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j3tTOMHSiFLp+myEpmzmt12jpkjBS7JqoQLTAOWEufU=;
        b=WDrw9IMXDbhNxq184TxZF6MmMWn9NzXhLxKYaFtxFXPm0Iz1Is9rM9HqrjRW4zTOSu
         nrsKipMahmcERDMq4pzguwNH8vtceXiO6IX8EOQK0HqMKutbYiM7PiKTE3iBqyX5pAXJ
         l6CSVv/i1sBCkFEEWEW1mdfr/CjXRbHq68l+J877iZlsOIi+3cz3PA2V4Ya4kvdzqSLD
         1gjXqhDnZBhpiSdWeOrDx2qvNdfMo67C52m4TO9WBeS3iammqpi3Zy6YUvcBgNQwA2nh
         5dUIWKgLijR0dyt212UhTJdueQiTx00kfAEkHWg8LwKIatzqZv54syAZ+P9tMMsTeVJH
         gSaA==
X-Gm-Message-State: APjAAAXPbSzP+EPqQIT7qMJvD521aUex1XIIZ85056X37t9VS5Nh3sWM
        VtccsRLAqM40SqKRW/AnN0kvxQ==
X-Google-Smtp-Source: APXvYqzlmS3faQEc6tabH/P7o/TLm9JFP3+2CcVMZrRoZkQ0ElNEXs3j3ITiywoJc77PAE2qCCbTaw==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr2768630wrj.66.1561540002580;
        Wed, 26 Jun 2019 02:06:42 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:41 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 05/14] soc: amlogic: meson-clk-measure: protect measure with a mutex
Date:   Wed, 26 Jun 2019 11:06:23 +0200
Message-Id: <20190626090632.7540-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In order to protect clock measuring when multiple process asks for
a mesure, protect the main measure function with mutexes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 19d4cbc93a17..c470e24f1dfa 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -11,6 +11,8 @@
 #include <linux/debugfs.h>
 #include <linux/regmap.h>
 
+static DEFINE_MUTEX(measure_lock);
+
 #define MSR_CLK_DUTY		0x0
 #define MSR_CLK_REG0		0x4
 #define MSR_CLK_REG1		0x8
@@ -360,6 +362,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	unsigned int val;
 	int ret;
 
+	ret = mutex_lock_interruptible(&measure_lock);
+	if (ret)
+		return ret;
+
 	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
 
 	/* Set measurement duration */
@@ -377,8 +383,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 
 	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
 				       val, !(val & MSR_BUSY), 10, 10000);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&measure_lock);
 		return ret;
+	}
 
 	/* Disable */
 	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
@@ -386,6 +394,8 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	/* Get the value in multiple of gate time counts */
 	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
 
+	mutex_unlock(&measure_lock);
+
 	if (val >= MSR_VAL_MASK)
 		return -EINVAL;
 
-- 
2.21.0


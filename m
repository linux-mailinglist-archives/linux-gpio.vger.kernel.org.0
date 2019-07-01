Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB745B7A8
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 11:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbfGAJOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 05:14:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34631 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbfGAJNR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 05:13:17 -0400
Received: by mail-wr1-f65.google.com with SMTP id u18so4751909wru.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2019 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UjWYkkIZxFPFv0EhClixGF6nOSS0O5IaIRSoIWr4uvE=;
        b=OBTityny8NehxM86CMotZmVqU4h7f1j91UFQ3Ng4d88mxR7xGes+5JtDYbHuiXgfvl
         tZ1DtseVHRrFkLhNeNfy84n1y/nWP6R+6KaQM/2rLaEHRMDMZEnBQkY/zmfBe/LqGEYU
         KAjH1b00DjcrHy11zu847kt7uN4Y4cBTJ8jQLszkSYN02rJRdxFwV9w+S6G/WcKzAXwF
         tKAa0iMJgcrApKQiymYS7qy8OQdrE1CnXCVg7F/I9U4gUIB92lFDzusgoPB7NBXqUaYC
         DZAgRgksY81lE2PdxnTefmyUnGVTcPtiAnG/rQ3LZ7H4Jmzz1+49UQldqp4nmwCNvND0
         4Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UjWYkkIZxFPFv0EhClixGF6nOSS0O5IaIRSoIWr4uvE=;
        b=pUkPKKQNHpAFnxW6qpGP4bcyOD6m2HO+eCPyBA2IoCyuiqKJ2IwzAypsJxt3ym367q
         Erc28P9nx77RiOutWARwdJofOwDgtBzyompkER6fMnd3cjKbTc/5G4M3fwomcrfdIqhd
         xiUkzxmFdBKt4V/BcNlbqghF8qQA8IRs+fL2TGs6b2IXOj+EpjyCYC8v07KznM/ENLMb
         HXpenIyLGlHMmwEs+0LrxWc+FAVdcII2SWUYUXi+vmqRO/+U7wP9+5ZenensV1hAoCIl
         SAN/T/4xf/Sza/uzusF4I2/jQpFpUK2BUR8YOl/4G+m3+0q1majssRn6sqWj0Mlus19Y
         4XEA==
X-Gm-Message-State: APjAAAVWgmL/hstNX9EAYEHjZOk4YmhhYDK5bJJzlytWwAAmv0cktfWG
        a1Jqwk5AYGYxbjUE31T78piRNw==
X-Google-Smtp-Source: APXvYqwBMTcbw5rlap0jViAbnSmrPSuRWsUL0g7rV9xchUwDtgLw5W194G1AFcFz013gxJR1rX643w==
X-Received: by 2002:a5d:554b:: with SMTP id g11mr16183465wrw.10.1561972395925;
        Mon, 01 Jul 2019 02:13:15 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:15 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 05/14] soc: amlogic: meson-clk-measure: protect measure with a mutex
Date:   Mon,  1 Jul 2019 11:12:49 +0200
Message-Id: <20190701091258.3870-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In order to protect clock measuring when multiple process asks for
a measure, protect the main measure function with mutexes.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
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


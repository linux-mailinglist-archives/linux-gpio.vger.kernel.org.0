Return-Path: <linux-gpio+bounces-24193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95699B20CF3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E9DD169952
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F008615853B;
	Mon, 11 Aug 2025 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XsJIm6iq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E0F2D3233
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924532; cv=none; b=lWGwPd2ceDYYXDBnVQmHa05BD00yUslR/7kQglxWR3hO4qjqA17d4nmp/5cUrkdGpZia4TYr7kZcV4sgVZVerh/F+AvTrVlv25S5waIQESkMuVg0x61VRBgBbyCG0ekPA3EvbFq82ntVv8MwzE4ru4XhESmwMjsNcprBiUp+i3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924532; c=relaxed/simple;
	bh=PkZaKSs/qxY3s7v22NbYhHMLq7GM43FE40HuD5Fs06M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JaidlgldtICIE85Rm3iGOT7FKR7PEOEfSOhzn6MEPkThCO5TYys2088Iclb8zIXsJL79C5qFXUw/lMRUj1mKFd37fpsy2AsqVL19KEOufCy8x93GFGr41ebF117wa6PTxm2xICEU5gRcPBLCuo4N/1cMJe3jkuwWoB2diwN9Swg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XsJIm6iq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so40896955e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924528; x=1755529328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=;
        b=XsJIm6iqZjm02adUwirPfRmmlSvUJ8hiNXfx3hsIbNknnhtzZtAGgULzgS/u+wb7mb
         KwHtMTG4Z7r8Jw3vukjR1xo9o436jFGGoGoR6Ag6wy+tpCpavAPQoBucLRSk84s4ap++
         EGW4u5wj2WdmgoNE5uJtMJ4HzVbgKwyJ18ZK4Nh0IhsZSXdYqZpgCz5j6YMvz+ZFleQ7
         uPVQHgYNop7XczPrlD6zrfZRXDlkBK5Alu+PxwrwJb07mjS9AsJzpGZECDCdFxqHJkWd
         ibrkLI9sIFQkRzXE8k3PjYURAA3xsU5YzIt7fA4UkIh8/N/DxBnC4U6wy1zmyOkT1P9c
         Q72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924528; x=1755529328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=;
        b=vLjGr/KkDrehL4LyBuWNBheaMdUhpEZpay6V1GcJYlRAsv+3s2pcBlcBvk50CalW5G
         4YrTtWsgB1LSiljqpgyAtQB8+GoH+MheuAE554qtWc1p8VKDew/Ncwr/bASjuL+BgfT1
         e3yqUtJ/uLBxhgbDbve5LlV4rgmo4GOBETpFvevjM2x/84iHzQWUyIf/fuRi1aZiz+GW
         9rka8WSkFilYTqMW4Fn/3BvwDj0bfGUML8yjLMbS0RcjGeTHnyYhNpypVFN9rpkuo2SV
         jk4BgqeKEfS9l9OsL437hzmwLnlGHZf0E6SyrB77Eu6yuqCBfMLmliFcIQzLorRYemQP
         PvwA==
X-Gm-Message-State: AOJu0YyEStxIEnwI6vdgnnjoBgisWiCvmxL1da5tzIRmtIOmF+lYqyLq
	C2+3mIGe9RQrvvsLGdSKvbLvJ4qCg2BFIAQE10lEQKnIOiF2DAIEF+inMyIUxMrlU+s=
X-Gm-Gg: ASbGnctcmmqaTbi019P0OXkHJRUBdsjU/DIeJqMvzWcm5f5XySF8ljiIHCkPTCQ3dqb
	Bqhe/cnfMKkzyNnYNa++e6xFebRmWu3F0FGM4munIYcHMBBt1UY2OmWqUmWlgVCmeBs0ZU9Pd70
	+lAd4bAU9uCU9ZRnYaU1o+PR/eCoeRbjVgo+qRs8RPtU5rITG3vARMrP2aZzv9PhXUVkDZuKVTe
	qDkkPjKrQP0GUQJyV1wWFEbx+o1kAzBWJVgpGi3SDk4l0W350S61L+D0dg1eXZrs4YSJaVugnXd
	F7UPEf4OeX0dJyLEkA4fr7In00BNs9KKFTiZ7PuKPwa0spndiFEW9nwd5vV6//ib6v+ZX9STZeT
	n5phbMy9CV0UpDTjr
X-Google-Smtp-Source: AGHT+IF+THEVCFuwYQu8m6VAawSu2em0TIQUS3g6fESwp8AcQJ26VNGTNiQ2rv1tKPajap4Wv9a2Ng==
X-Received: by 2002:a05:600c:1c2a:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-459f4f3dc83mr97971385e9.7.1754924528440;
        Mon, 11 Aug 2025 08:02:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:00 +0200
Subject: [PATCH 1/5] pinctrl: stm32: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-1-a84c5da2be20@linaro.org>
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TAuKojjyD6nAKERqSGd5+r/u4OVzV5ZEvxmxS/gEado=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXshqBLlfnYFEFYK7uY0jFJFrmHe39l05Pcs
 k4vccla8yeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7AAKCRARpy6gFHHX
 cg7AD/9pgOoPP+pShNjLjROnRjG6ynKjPXowGdW0ABn5sAkUvwA1fgSz4BPTxcdOu2W+Mj2vZHY
 XAcoX6QuhsYKer2Ij7zEVCFDSd2+udUclQR6z/1sd9VJkcvIU/Cxmh6o9S7S0eDGNlXT12iVKcH
 M/EkMJ1nvsruX4Gt7mIphpAl++6vvrv1+745OgmVHhYKFicEpzEly2P+jLkiVq0tISzg986/vRM
 xFCBolAsRNun3fiE99GiiaYkwrse9aR+2q5bpAwjohDzgbwv7ePgGXUzf3KRK6d9zHvxvqa7e12
 mO1pIUTCB+/Omb/OzwjvQUMJO/mPYXkjGI1HfCz1gUZvJgCVyU64A4HjqjN0eneS0mZCRO2jbpO
 /Rhq++1FNkVt7HV086RTI0wGxd2K39LvS3fGyOnmmCc4LIpwL2edcBYSL+hEpZHA6JnTJLGGiMN
 atUmuiciLUCWrgWjBsmur3+KrCq38mMzE2A4bifdCDU78T41+OZ6jq+hvXNGpfE+TG2htol6EjV
 0U2MhDMYKV0jSaBCcphL9S+4OBxXL5+APecu01nQ+aNi7mmSNo7JzdDRQGVXvXCd0pq25kpcZiN
 mVTFPFtmbX3ShdoJ3x9oS/g9h9rgCONYNuSoHzUQZdGFjsaxJE0IFwgrNrOHSNgUIG7b27lX5wn
 kWen1t/i4XapRRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index e91442eb566bb21f7691fa14fcf684957eb6549b..dea49b9aabf2aebbaaa3cb33c8add9926972ed9f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -6,6 +6,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -45,7 +46,7 @@ struct stm32_hdp {
 	void __iomem *base;
 	struct clk *clk;
 	struct pinctrl_dev *pctl_dev;
-	struct gpio_chip gpio_chip;
+	struct gpio_generic_chip gpio_chip;
 	u32 mux_conf;
 	u32 gposet_conf;
 	const char * const *func_name;
@@ -603,6 +604,7 @@ MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
 
 static int stm32_hdp_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct stm32_hdp *hdp;
 	u8 version;
@@ -635,21 +637,25 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 	if (err)
 		return dev_err_probe(dev, err, "Failed to enable pinctrl\n");
 
-	hdp->gpio_chip.get_direction = stm32_hdp_gpio_get_direction;
-	hdp->gpio_chip.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
-	hdp->gpio_chip.can_sleep     = true;
-	hdp->gpio_chip.names	     = stm32_hdp_pins_group;
+	hdp->gpio_chip.gc.get_direction = stm32_hdp_gpio_get_direction;
+	hdp->gpio_chip.gc.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
+	hdp->gpio_chip.gc.can_sleep     = true;
+	hdp->gpio_chip.gc.names	     = stm32_hdp_pins_group;
 
-	err = bgpio_init(&hdp->gpio_chip, dev, 4,
-			 hdp->base + HDP_GPOVAL,
-			 hdp->base + HDP_GPOSET,
-			 hdp->base + HDP_GPOCLR,
-			 NULL, NULL, BGPIOF_NO_INPUT);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = hdp->base + HDP_GPOVAL,
+		.set = hdp->base + HDP_GPOSET,
+		.clr = hdp->base + HDP_GPOCLR,
+		.flags = BGPIOF_NO_INPUT,
+	};
+
+	err = gpio_generic_chip_init(&hdp->gpio_chip, &config);
 	if (err)
-		return dev_err_probe(dev, err, "Failed to init bgpio\n");
+		return dev_err_probe(dev, err, "Failed to init the generic GPIO chip\n");
 
-
-	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip, hdp);
+	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip.gc, hdp);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to add gpiochip\n");
 

-- 
2.48.1



Return-Path: <linux-gpio+bounces-21452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C10AD717A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 677E7162341
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A78624E4AD;
	Thu, 12 Jun 2025 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oS3PdEV1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62D24BBF0
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734131; cv=none; b=DZ1xvZEITn3qoqm7yQF+oiqBoKG1U6A/SvB6GAwy9UFV+eMuCR2+XHivXm+lnQOfPWe4DNAqLM6lq9OBizClrSqlhHnaN2Kgv6g97vYQXe2+p2JgT7WiPz4WJgTDbg8sKrbf1G67mnoiheUPsQZ1Woj9A0SiqbCPfMH61mVohck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734131; c=relaxed/simple;
	bh=+NK8m5qrc1KmJw+Fk/qnUNfnygvAI3Ur756wHpi5Soc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uqzqgl036/1uayHbIJVFSA6tRmf78QAeDBdg1V7k5SgWaoaf0aBTPcs/wvnYusgL4n7RPPg/wu8RefPXF+Vpa/1dP86UYSY8obGf8bXVRWjM6Ndp89hZwNwrEBHjMPTidM52Oug5SAXDEUDT5YSu7/nnRUcf4B2a0rlTKGFDlAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oS3PdEV1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso4710555e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734128; x=1750338928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpryYjr6dJZUJcBNCU3DY41Q8g7jIiX7s0MfCXnX/8U=;
        b=oS3PdEV1glOiO+dhgwzDHvtjJ0ljcJ9MqtjcyAvpxdB6+nD2xhaVy1jd5aQebdqKv4
         OSF22ls02ZBjuoG4PFiYt91VhNy/1gr94GMZY3gCMxKtoZF+Zhv8pOx0kaHqYp9aKHv8
         bOUoy55PxDf8IuAFkoiIqwU1TTsM++WEOlr7ETR5jE4z9rIg8aWBgkIWCLEvhQrTYibq
         VTVpr3lBZKVAUJnOUrW7iJeDl7NIZYE+e5NP9brJJIP0d46VJdd0o68sq0tI+EYpsXVF
         9kRF8tb4zbb4+F3HF3LGwO/eVTFRccjkCPcyGijGAskP+y7mE58sS+TZdRRGNz8zR6IL
         Y3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734128; x=1750338928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpryYjr6dJZUJcBNCU3DY41Q8g7jIiX7s0MfCXnX/8U=;
        b=nXqhIkZzAPQItZZe8BkrESJbrI91p6ASqXnIqkwt1RcKZsIfU/C+QDmlIT4Oku3VD4
         eQUrdIo/0sqy1vIKNxn40kYQJem/k+i/H15smkZ6VqniXlLRtvm/YQJoPp910XLt2YGa
         LqsP6VJSCmNGAaGvKfnw9VS1XAWTE8+XfbFJ0ieHZD8NQkntwenBwMoNSqTkxz7X9MP6
         t7DXraf5D8joDo859z3wtXBtsB3hSY3i915EdKKKtX9Rwx4pAAoHq53cHrtvznOGXkhD
         /HnuTad6QXj27gCfFK1H9H5fBQFKBJtdpJLD1Cwkc3yqpfNKtc0iDlrKQWfmA+F9m+UD
         y/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWKMU07qc/po3fiG5eK/7AxkINv1ZyEJmtElMEvaruePIIBYplYkNMjEotdRnH2zbRCq1wdkxRgLoq2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7UBAanEsszgK2/vNMW1albWEMmdzJHGBuXK/knOAr2sxSpOk
	nBEqErlzdV18Kr3oC0HuGl9KA34yT64ihFQ3PQlIMkLtgvv8R6irU6mx/0amOOvWNTo=
X-Gm-Gg: ASbGncvBgxwvRITyp/DngT8BMSrcVvlNyWKVnd0DeD+DbIAaWFuzTUssEXg4LFAkrUb
	cLYQ7gyRtS6BivxoxV01MR4/Xgib96M0Hz3l3juLv1wlott7c3CgWTPul9Btils6pZxAs9BSdtZ
	oRBPbLILsl1aH3QM7yMYevi1qvhsyg8oZ+LX9HqbL8aHwi0Q0Vs3uXDo1LGeWVMu+Wfug6i2tUN
	00dGyZHiYfZhiSbnyygRPnUczumZ7qdBR7BWqkwFO7f5FvDG1sZ4q4tZnF4hp0VVBCbwhlOwrbg
	f9nRqQiXn15qnK7kSrVuUbbv6pZdGZd0rKUlUayQlq9u/5LNzrJ+jIv/fQWSFx4j+A==
X-Google-Smtp-Source: AGHT+IHYhHp/jvxkulDT8caAK3JFprrXp6WBLQybVLzjI96KoA3fZGyckOWajuSkl9W+4oQhpYhEmw==
X-Received: by 2002:a05:600c:5291:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-4532b966af9mr29139925e9.25.1749734128225;
        Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:15 +0200
Subject: [PATCH 06/16] pinctrl: aw9523: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-6-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/k8zafhiaZ5lNZ/R4/TDowhHogmpS6F04NS8uK5axS4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLlAWn+gixCdfC0imr4N4CjdzgtOVQSb/c3U
 huOoAJ6Hj2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 crzhD/0T0e3xmRZAZFh9L727loONGDCc4JHCYoraLqm9oW7X2GMp5bsZjgzR9lIpJTcS2lz2/50
 7K1JpLe+3IV/JM3Jsuje0k5O9ZSzUrg7tWjzcR5APoxHEJVxL+esq136rwbVMiMUqJdB68n9Ohb
 2as5Wk1vASZi13ROmULzSgpb3+uiQaAGkDcpL1ieFstxBzDZS34ojSuMUj2pzkeZpu4qSMsmpV+
 j6o1OXBEOa7XzItsZ+wdhDVDjo74LIH6w+7ZetDer8IKdulsgwMsiIpL90cW0p0COp7+nXuI6kh
 32Yb8Zw49Z6wxkQQpps9iwDAsqLk3Q/V0EOnKLPvJPtJAG5pc7lojKUwGfj1X9EFl+Q8VlEiCTE
 7Llv1zB9G9hNDtLE9U2hT7toep6c0798QQ3teRYgyLVERdkGjpLfL5kdV1GnnUYUmavpJaXikA7
 wfngkE49CVSCKrsvtodJj3jyvNergEk5cGDqKSa/m3yHljlRrQoDndSM/+WnK8r3LToblbH8Jep
 xs0ev/kWXAJHtnIhiwALmT2dtnHVAVV2m1aqDyabjB+ozDZ8lYW1USpwg/rezqcCY/d3pLF33qp
 Ely+uT5GKTkEsTBk4pIujiVaFHqyLFnGLWFBMvPVxOEDVK0Grf+UJ3FowqoNFYx6FUGLwXpfdlX
 6Hw3h2VYdTU5O1Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-aw9523.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 9bf53de20be874661168ba28f64517b4325ce0c3..c844540384198f40f1142528d815fb6e4d5194b7 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -625,14 +625,14 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 	return ret;
 }
 
-static void aw9523_gpio_set_multiple(struct gpio_chip *chip,
+static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
 				    unsigned long *mask,
 				    unsigned long *bits)
 {
 	struct aw9523 *awi = gpiochip_get_data(chip);
 	u8 mask_lo, mask_hi, bits_lo, bits_hi;
 	unsigned int reg;
-	int ret;
+	int ret = 0;
 
 	mask_lo = *mask;
 	mask_hi = *mask >> 8;
@@ -644,27 +644,33 @@ static void aw9523_gpio_set_multiple(struct gpio_chip *chip,
 		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
 		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
 		if (ret)
-			dev_warn(awi->dev, "Cannot write port1 out level\n");
+			goto out;
 	}
 	if (mask_lo) {
 		reg = AW9523_REG_OUT_STATE(0);
 		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
 		if (ret)
-			dev_warn(awi->dev, "Cannot write port0 out level\n");
+			goto out;
 	}
 	mutex_unlock(&awi->i2c_lock);
+
+out:
+	return ret;
 }
 
-static void aw9523_gpio_set(struct gpio_chip *chip,
-			    unsigned int offset, int value)
+static int aw9523_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct aw9523 *awi = gpiochip_get_data(chip);
 	u8 regbit = offset % AW9523_PINS_PER_PORT;
+	int ret;
 
 	mutex_lock(&awi->i2c_lock);
-	regmap_update_bits(awi->regmap, AW9523_REG_OUT_STATE(offset),
-			   BIT(regbit), value ? BIT(regbit) : 0);
+	ret = regmap_update_bits(awi->regmap, AW9523_REG_OUT_STATE(offset),
+				 BIT(regbit), value ? BIT(regbit) : 0);
 	mutex_unlock(&awi->i2c_lock);
+
+	return ret;
 }
 
 
@@ -779,8 +785,8 @@ static int aw9523_init_gpiochip(struct aw9523 *awi, unsigned int npins)
 	gc->direction_output = aw9523_direction_output;
 	gc->get = aw9523_gpio_get;
 	gc->get_multiple = aw9523_gpio_get_multiple;
-	gc->set = aw9523_gpio_set;
-	gc->set_multiple = aw9523_gpio_set_multiple;
+	gc->set_rv = aw9523_gpio_set;
+	gc->set_multiple_rv = aw9523_gpio_set_multiple;
 	gc->set_config = gpiochip_generic_config;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;

-- 
2.48.1



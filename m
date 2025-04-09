Return-Path: <linux-gpio+bounces-18541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC7A8204D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 375687B5564
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 08:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B7925D52E;
	Wed,  9 Apr 2025 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eS5nRG9p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB59625D218
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188050; cv=none; b=jv0z7SHTpxNkhT6voSPPKGcFN4I1Gxckl/lSRRHkvf3KsUFAeASi2YhomlxpxoI5L5hqVnU2NAyz/zbNKLkDcsx+5pTtKSUFUzz9xO+LXdAL0oAAtiHhCUNz4tNGGYWJLJTHyA/JRnu5HB1CKW0Izjs+plIFnk0Phc/qHQmYCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188050; c=relaxed/simple;
	bh=V3jvDHKDO3y/NiuIZ26eS81nUWDRmeESiPo5QcZ1RiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hv2F5ghXtMA7MqkjKLZAX/Ro7O8ukDB1JHwfkffkayv4KxGfe3AFoB2AzXVcgM+/TA0DflzH4UV0M+gMNe6dn+bEj2Ztcx4WmnQEbjqkpz7+ITwF5jFn8bWHgMKn2NzeU8A5mcgFk018uJX+fd3QB+QGnLFADMgsS9bwfZBehiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eS5nRG9p; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c2688619bso3982515f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188047; x=1744792847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/OUvUxbW8Jlw8m6Urroe1Z2D8oZ9CHZ/LwRr+VHvTg=;
        b=eS5nRG9poCtbwuXR8FtuwotvVUqs2/rUzMSren7RXQpObAYU2jMr02g1FnDVnB5TP+
         D3VRSZpya6PeNuJvqltECRq3De++xUjHxgSahQDS+sEBepREgDCUQubTp+TMYxld26fZ
         qnw0APtQqf2N7JX2/YSJNdF9n2Mth+2bK1OoGaGTkPv8vCxUDvjtbhfk+I5bfE0NzN2P
         mFFsRk5BfV3CW+BCulPcZTjD269Q+0uM1F5CaogWALgarvVb2Vt44AbPKdWv3aM4wZO4
         8HNPQe2d9zf3X9lXaT4WrqIM5ghQU9fke2ul13Ro1i2Gb0kkynZqlsy5BjmgsY0mN+8P
         FcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188047; x=1744792847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/OUvUxbW8Jlw8m6Urroe1Z2D8oZ9CHZ/LwRr+VHvTg=;
        b=b4gZ6roGV4tyi8VC+cInttPrlbVKmCDARcv+ElkFRrXzKtAFdN+sAs47MOk3/mtjTO
         4ZlA4XpHyjTUMrEzO2lcbmcF8cizgdew58UJHWZ26lRIIhgUQA6I8i4NStWUN+RRW8PT
         QjGLCCudQPSMpmA1Nk8vegoXeaQHUV7tKZGO/5muGQH2d1BtTCLBNcRt/ep0/LNQzo47
         DQpuoF8HM2h13oRltJWEnk20dzBJ18pQotRYC2cANMxGMXFdvNV9eQzWyVySfmlG3XZp
         l4klR+sOEfCxoeWgbVc2gg0k/zZJsEsxtSNNyhGC7tQ7lQ6+qbSeiAyluV3qvM4cqRVM
         Kmcw==
X-Forwarded-Encrypted: i=1; AJvYcCURKQ72OMRNs3Vqwtg1tSLzugDmoJZt80857nPfifg3F81ozGRH0rwkaeYsVCZNuXGCMSsSfTrZcCwI@vger.kernel.org
X-Gm-Message-State: AOJu0YxBg5jiakvgkzsQyKTm3SuO66zgdLwVnAYDih9767NWa1yBCEtW
	o/4D9ZjQm+RkeipIIPl/3Jzgrw+N80w4nxeTGpGxpJMWEJSjouGTx4luDxgyYqo=
X-Gm-Gg: ASbGnctIygu/w4ac99yP+pQMxp7YCLpSCLOjp/xclWVHYISMsSIADHsOFIVky3Mv6dY
	Aztmkoh15I2iB4EFDa+KQ1ylgvCiWHH6p/RD/3AOUUnpDQeMXA3jze087Nj3WGktaBJWcQ94kG5
	p0vgW1AXToydjVqxZChCe10cjkVuPQ4YcEs+aUF/NrMuuvJszv5Y4n5Adph3/XngZjFPESFVT5T
	tTEN1Sw10r8NWeQN4N9JnHj7A13BBsvvrW3aWD05taj3AEUW5VA5uw0k5o2ODlnzujST0omX2ih
	eCjeyQod+ciYxWEbAXA/vgG848itjgRQ+aBqzYUst7Cq
X-Google-Smtp-Source: AGHT+IEG9ARuyq2GXIvhvOJ8pTE1gyzUZZTNGic5PF8Mu+v7NqRyW2/PutGpMY9Tr6slpXPDE9nalA==
X-Received: by 2002:a05:6000:290d:b0:391:47d8:de3a with SMTP id ffacd0b85a97d-39d87ce28f7mr1673520f8f.53.1744188047124;
        Wed, 09 Apr 2025 01:40:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:39 +0200
Subject: [PATCH v2 1/7] iio: dac: ad5592r: destroy mutexes in detach paths
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-1-4b36428f39cb@linaro.org>
References: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
In-Reply-To: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XQBsAWxRrbgUBZdq4joassvWFO3XhqdMZQNsYhta8LM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKLRtz0aJoW2RZ04RgC4xM6VPHDLizPhNR4H
 tx76Mh9mx2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyiwAKCRARpy6gFHHX
 cmM+D/4xH/SgX9H5NeAyQEdIYlCa+AVshfPTRfEnMeMsyYe9aicwoSnTZOW10VegqLbTEEQCnfQ
 y6Rhei+Z0LDPM1OI7JSkP8reuhwyrIVxPUwa4rfi1IX0ZVgQ99NLBAs5Mr72CPoHhSk1zbcRBHT
 fnSkXF6ZGX8wMeMAX4doLZ619mUoWgM1rInLhwzQs9DWQErDGEio/bkUtHSw2pXQvdJ+WukZ0L1
 OiPC6L9lI5NnVSdVL46DGwg/RkXIahhJNwjyECF2eibGUFYti8ZclEIg/fDFcfvwgQMTfw3PLVO
 5+dNU1RQ6gItdn+4SQND3EB2iXfzoynjeM+BiUVWrUUy0vERGQD11KbNoeiTaJH0x6sJhAhka1J
 15U9wRneksQdx2jnywigrHeg+tRRqsjmDEDq9FyodOJyFDhdKAYbMKlMY0xQOb+1R3enKwqT5o1
 N/B7ijLh2zQgh4wprT40FfCJBdfF9s4MdnHQJT3ZkICoRUVu9lWpCn/RBIQPim+DGr1Kmeni6k5
 pCdN7WL2j0fljL3qjLAZJBhOWZniyodwhjGnA/lC2TgqD+zGJV1oZP8Soyt7JAhRziTdRX0pk2V
 AlZ6YvyWvI19qBvZxnw9GpPURMusxrW6FwliiqDL+8MRiXzTBVTLaxG0n4XtQ5RM7v26FX3ek7N
 YkzcKVkQ5FdVYVA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The locks used here are initialized but never released which causes
resource leaks with mutex debugging enabled. Add missing calls to
mutex_destroy() or use devres if applicable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/dac/ad5592r-base.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index 50d19304bacb..eb85907f61ae 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -155,6 +155,8 @@ static void ad5592r_gpio_cleanup(struct ad5592r_state *st)
 {
 	if (st->gpio_map)
 		gpiochip_remove(&st->gpiochip);
+
+	mutex_destroy(&st->gpio_lock);
 }
 
 static int ad5592r_reset(struct ad5592r_state *st)
@@ -606,6 +608,10 @@ int ad5592r_probe(struct device *dev, const char *name,
 	st->num_channels = 8;
 	dev_set_drvdata(dev, iio_dev);
 
+	ret = devm_mutex_init(dev, &st->lock);
+	if (ret)
+		return ret;
+
 	st->reg = devm_regulator_get_optional(dev, "vref");
 	if (IS_ERR(st->reg)) {
 		if ((PTR_ERR(st->reg) != -ENODEV) && dev_fwnode(dev))
@@ -622,8 +628,6 @@ int ad5592r_probe(struct device *dev, const char *name,
 	iio_dev->info = &ad5592r_info;
 	iio_dev->modes = INDIO_DIRECT_MODE;
 
-	mutex_init(&st->lock);
-
 	ad5592r_init_scales(st, ad5592r_get_vref(st));
 
 	ret = ad5592r_reset(st);

-- 
2.45.2



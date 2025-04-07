Return-Path: <linux-gpio+bounces-18292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C17A7D64E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A471F426298
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC32422D793;
	Mon,  7 Apr 2025 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DIq5wTZO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0143F22A4FE
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010297; cv=none; b=Omu2oP1KenBN78zOoMCDgXZau2WHrrjl1wn/rTmHfAE5aPaCOX7gfDkkpnInK5yxhyjsOi1zEUsLva2Kli1qnhIiQ+DbN+ffe28EoK8vDoj63OFMkkPOfPDMHFELzG7uhrKnPjV2wiNOqPZrx8Qpyxal1kIBkoOrhONPg6W5MFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010297; c=relaxed/simple;
	bh=qh02EOpLmoVQFOGtxc//WQmmDLs4Qdqs4X8qzXYsbtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QWpKrnrcxmdUaC9PjoAUgaTSh0Z5h2Zdzz7GS3W67Gn4wlnEnwbD0ai4XHlZxtdiXj7Oo04EUse0B+UbzF0FCBUjUN90vK3XseBla8zqyXOQdrZRz47tMWR+bufDgRL+4Z8OKsu/Gdnh1zu0NQCyqxLkNOzP/jx/GLXUg4n8K24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DIq5wTZO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3135980f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010294; x=1744615094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFYbotP5fmTf+KhkIn7tkSgVn5aK/YHRq/3B7g/SlrA=;
        b=DIq5wTZOM91ezm9VxOmDL/5nW0ZxoLsQEvMVZSavLoBQ2GEVUkyw9rY1qaVik8NcF7
         pRu0kSyQt4Ts59tjy8U4L2YzU0PX7MiPDMlmw2qA+XZarO+AThnOfEL4KZ9QqtwsBCjy
         VxbnoGSNzNtpDeelMypqZKcYbgRKQ1k6K9pfAolmLmJMLmAt/d4ZNKh99iHDu0TvlrOt
         0rDBPtqqOh2sefyN/ylagCNHFgtfU99Ryf2hoi9EMuKdEt/QkLnbqX6U7//r7yP3KrhS
         /wsEw8huEKljfVzdu9soV/MqXBiwHHIlsYrDdvk1yf71K/E3x0cy/EAwL3JdxsfMg7Mq
         TQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010294; x=1744615094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFYbotP5fmTf+KhkIn7tkSgVn5aK/YHRq/3B7g/SlrA=;
        b=n1LnSGwzdMpQPqTfLtgcyGqChzidxhoZEO3IR6FPI8Fr/a+9+GK80b7VHF9HO1RGE1
         8BqZp/YABHgJGsXHBj0ihVSrQALP1E/iWVIKKKBrF6Zu4JZmT3bEMihnnJYc4/8nsLxE
         +Th7IdEa9iSsOg2w7hyvyKW88bKdfcPLSxQK7AODMKLyl3EM5lSyed5x5LEjgY8w6UKB
         AO7iNzlWwUOheFmy8HXmSfv+2yChs3EQTKXT5kW2ciaC6W243BbJgF+g3zu4zxNnnaDo
         XB33jzb1fI3tXtLasQO3SfydzA8di/oXsc/mJD1MMKsNP+rePg3ZUVcSGeaBwCIBnVPb
         vnQg==
X-Forwarded-Encrypted: i=1; AJvYcCVao+5g3ZfOPCCmN5f5NcqWlZsbtzvaLFXy370Mgw/j2mkWNV01p1tYzAPVXARHfTXsnPqWjU16sCh5@vger.kernel.org
X-Gm-Message-State: AOJu0YyBnJf+2qLrd5T83rOhdew5F8IslXHofUNtqVW912CqqbO0E9KI
	tNcKTALt6eCcl+RBaLXULrWvh1G2r37oaJqyFEiNIiZhOrUOIGkqGItEFvtHadA=
X-Gm-Gg: ASbGncsN7Q6zAGiRkFnpJeYs5sNYMxVXpMKjAncljV5v45KQOGmub5FuKaQXZwZ39vC
	glmup8ovAIW0+r5gHEjLTiE8KZGwjKMHWStjyV5vBkladz1GcmNX1h6bsMNhB+iTQtGO3qJ7Hyf
	bOCsbtd/ZxTWIs9L/s0n38W0coYVPg/Q0j1eeWuW/K15Bc5Rq/h42um/WIL4k7WE5mJSSr4zPuj
	5VBsDpw68OrccJVeCaFM42S+MvGcoB+O3E7DFphC7nlVg2rvwCYVfI0RlYV9j13w9ZQx1V3BGCM
	8R++vQUJKy7NE8jGIEWV/48WVZZbCS4RuBByPQ==
X-Google-Smtp-Source: AGHT+IHdzlVUeS5mJkviPZtuB2uw9FN1NeOxmWH4SG/0ghkS1vaZxYCoVQJ7a8Egu0T4TP8eDMqtxQ==
X-Received: by 2002:a5d:59af:0:b0:391:9b2:f496 with SMTP id ffacd0b85a97d-39c2e621a3emr13954581f8f.16.1744010294242;
        Mon, 07 Apr 2025 00:18:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:09 +0200
Subject: [PATCH 1/7] iio: dac: ad5592r: destroy mutexes in detach paths
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-1-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XzPoG1yue7TTDzwJnpp3K9VyK//i5C6T3BQHGpW1rkQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wywmyOOD88VwORmWru81fcLV3QYv1XG/rvC
 emcVWAZtXCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MgAKCRARpy6gFHHX
 cqfFEACz71tG/3HuelbJ6Rrr2frDLyUukL8onqRwqZiYWvP2v00lklCU8eOTbzlcce97uUaYV4i
 7mTqzUgEy+rhhPrNgyzc510WcMQQIXDLOSDRj57nwABQeeVOb8JEBS2j/nYoNSbv5XIUMANI0Fn
 i7FWPzY1+g7HQipYpIRm6/gv+o49kw2yp5uAO3DrHnJBbLVAdOo92D8fsLAwnmTG+xC3oUa543X
 WGxiY1DUUqC3YdmvJDrqpey0q8sKK36bOFqtpC9MwhkIaQqvEvPai+nTN3K+Em0yy0CNnUN8V2x
 HjFQPvb1GRLlCZ5lD2xObaYh+ilUynNTA2Oe5bqR1/Ylb/0/jo0GYERiyuB/yVk3FC359a1axap
 P+bLuCrSMIz+E3/p5vLT020cxg0vR+FcGBExYWBICD6Qzx83IpsYSP93Zh55sds/nKbcbSjSjFQ
 CqYVE+zd/DlH4f1ZLumoG31oIOa2dreLrWTXvHfG4kVLRbScIOrFdiUjTFMkoxJQCx270gJeWrP
 uyIfIoImPWueOPQKDC3bfBTaWWtUgDH3fhIY6LMf4XNwYGcXQmHlUEiUa/C6HOkXLUJggNsQUiw
 K8gwxrpumAVtISXOxq9aN+D/cMWuqi6tFOarPths4eY6Y7covbIKNvTNK/LAz78aR5IRiRgdDIK
 bqI8blnjoJd/QqQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The locks used here are initialized but never released which causes
resource leaks with mutex debugging enabled. Add missing calls to
mutex_destroy() or use devres if applicable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/dac/ad5592r-base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index 50d19304bacb..fe4c35689d4d 100644
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
@@ -622,7 +624,9 @@ int ad5592r_probe(struct device *dev, const char *name,
 	iio_dev->info = &ad5592r_info;
 	iio_dev->modes = INDIO_DIRECT_MODE;
 
-	mutex_init(&st->lock);
+	ret = devm_mutex_init(dev, &st->lock);
+	if (ret)
+		goto error_disable_reg;
 
 	ad5592r_init_scales(st, ad5592r_get_vref(st));
 

-- 
2.45.2



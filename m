Return-Path: <linux-gpio+bounces-22057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF13CAE6624
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5785F18939B5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69A12C15A4;
	Tue, 24 Jun 2025 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JLONzGGF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829752BFC70
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771168; cv=none; b=jtKYMSt7mFC9mANk7SsaKX6Sqv7JT09V77M1d3Idw3OpfklLhBiU0vBzoHVUiX3y1psByhbXzDNHGwfxBkIho8VU0fRXzvoO0DEt+H/vQg12hZorv6QaB8vcEBdpGYKSZ+IBTgu2BwqLy2aX2ntqZ+aaEhAa2Nwl2XORLT1JU40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771168; c=relaxed/simple;
	bh=QD67uvhwMqTVnR6qaVgUZJC28SCpastKEWERFswxP0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HpCQ4W38Na4+9JW/QesYsPc3osqjlyHN6TC2PpMr5tEVJr+Rs5me7XXTtKgaldDDW6AP2hmKRwE96ZLwnMlQAoy5MLVzuu3LopYuigFqKxvRLDaDWZvy3q56t+MaMH9MESm1B9LMsLThcZLZFwdaR+jz0Jh9PHRi9+UFKsK6j80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JLONzGGF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a589d99963so5200755f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771165; x=1751375965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8MhLQAkcHIjciDwXBy0xiLsqhDE1FYLFev5f6oWs14=;
        b=JLONzGGF8DN2qXWaa1CgeaZ2ABenCow6TCPGwzfxTH/p9/vOcR47mURUqsgKhQhr80
         fX/UP5PK1b5sSHtH+xUN8dG2nkWCWnwQQF1Uwj49UCosIfKsNPjvtrTpiKsPp6+YGKj6
         LPLWBZq63s0S6r16ld3Sspliod6lPGIRT+++n/juw7jCi4eLYrD3S7Kh0N/BPmmTePjf
         ub5aWk4l728RBm8RcxafkJYLatD/7zyrIFqx4dnwvaYq36l/1fPLBO+jfKjrMEEI1YCk
         grDBTV49omuAfVN7jyCLZZIE95U7DWRGLshLUtMeOM0MIMBS7xqyDEcnWbP/ZwQMve0X
         2EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771165; x=1751375965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8MhLQAkcHIjciDwXBy0xiLsqhDE1FYLFev5f6oWs14=;
        b=usi/7AyGZpXfRQ7EDxqUmZOiKYJQJ8iEM6di6Uq2h3B4E+/2D7RuILPLcK6RgSAID+
         R7/fal5uAAfXA9U+hljrAcYfED0FLG7Q2Tauf6GwpvYYKRCbSNyM76gROqVyt+k4i6Ii
         lVHdApQHHC01O9eMtEVHrFwnr0SlMbBbBeCrHUIi5/Ajd4YANaZn9qVNeasv2SASy1yv
         nQKaQXIvdivBH2Kr6W0W7uhZoNiu1V2McoQXWLlv5/r8oc8Sht4RWgxdKXWnrLvgmA6l
         UkAJ230QsnYmlC6NBUXLJzc4udwmtu/duh9CKa6WaXqNbh0r09nmP1mFqqwyFdEVienp
         MC3A==
X-Gm-Message-State: AOJu0Yz/2U8rY2Q8lpxqCxkB0P44mG+rMdcgmBVXgVW0Dy29BGBzJoAN
	0/NlWp4najwoDFathj+gQN56np36E6ba3Q6I5qESaUPOqvaE5WoTSVx+KtSOGjTGGz8=
X-Gm-Gg: ASbGncvquBhR26xKsBA0TNYObyB57hzTXS5Srt5gagHt4KDoqdrC7AqVLBPHTnCMFUk
	LMfZSN/yV/EbgKNHnwJz/f+McAPQmd6JpVPtFj1Yn6ULbz/skDeGXF6ty8VaJ2klRMIbSeNzr41
	RkPoHvwYPSUo56Kk6COBN468h3tSAtP1Xqtuey0Ik8VXsO2j/ODVqpV6ZId4LU7GV97vuyKFDp5
	UwPd4axT4UdJZ2Nx7vQUiAH0MKOYshgXhKdJ0M9yo5e/i6vIOu14rnFO8kfIGwkg7uXGn9mwzR4
	SuVZDMSv2LnJR/fLbTvzUoRKpIj5+ki+MG059iQnHOirCdHZk3tQwZ0=
X-Google-Smtp-Source: AGHT+IFpR3OgJhahPgRYBa1gyCbLYGTqM0deNU1EOekJG+yRN2EdJeLYcRO6UimDHtLaFLkUJxhOOg==
X-Received: by 2002:a05:6000:4906:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3a6d12e6a3emr12875157f8f.45.1750771164792;
        Tue, 24 Jun 2025 06:19:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:13 +0200
Subject: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CicxjQH60h+01gOTn3o1Z3t/Z3AKnZL5tqmvJoexSio=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXMsfVEhgOPAMUlt3aOG42wfz2dAxjfjfWm
 vW5S89INwaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 crI3D/9MQVWF3IxDKPp8bpUK4M3WZ7ecjW7QXbTbRwiNgNQKGjBGDdCILPxKDj+TB/jIDo/Au36
 eKEMjX0RXCG3OKYAFOzG3zt9jYQlLZtp5I2QHIasRtrOtkq6dRrSE1jIYSm0QHoyd+YX6em4+B/
 2ggCtYCABT/SCGHBt4bVrNW+1AkiWa4QuNmQiaUrMGNU5xinXvg4JYHB6l32pj6Yd9CM2RKOprA
 gfqmSxoXbf8d9K9/pEe0mFaINPdwap9u60KV6IBhFMTXC2K8NvXsjrhz9JAevfkwnLCCY2yOwwh
 WrbX33AJOldJeNHB828mlc3Jh6duTXszjKzd6fo1RlfwDsnUbvxwSo+5VZfgmIp77XMK9RG+rL/
 R9siNRm69f+JftdOURhL1tcduGh6HeYpmZsmsf+jUjOqqf/8NuX9TeXkkpy/moZspj7Ca1zMB94
 1iZV1GsANFay/4vMc9w+qVAbBP8Y3I/Gluz2vLfyiugexHW8IBipihQEucNhX2lksD7uJ5zwRbS
 FKyanwd06NrJivQWgD/kvk1btGBgW/jE+1raVNo70kyTvvgpktS0Y0AbPpqJRIquAo9tO7AeC1a
 +16Yq5moVSnLx9IVYPYkUv8ivKsqG3XtCJ5+ClB8k3oyb4nNpe7YDFh4OzwlZGAia/zHbtzWJYX
 pWZIXVFjjYZp/gg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
module, let's add support for getting the relevant values from generic
device properties. "label" is a semi-standardized property in some GPIO
drivers so let's go with it. There's no standard "base" property, so
let's use the name "gpio-mmio,base" to tie it to this driver
specifically. The number of GPIOs will be retrieved using
gpiochip_get_ngpios() so there's no need to look it up in the software
node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index ffe6b6f6cc9b1e9341e1c42cf8fee917e0147bf3..8108aa8e6b86ae3d0b520a0f22a09689ab1d9bc5 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -737,6 +737,9 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
 {
 	struct bgpio_pdata *pdata;
+	const char *label;
+	unsigned int base;
+	int ret;
 
 	if (!dev_fwnode(dev))
 		return NULL;
@@ -753,6 +756,14 @@ static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *fla
 	if (device_property_read_bool(dev, "no-output"))
 		*flags |= BGPIOF_NO_OUTPUT;
 
+	ret = device_property_read_string(dev, "label", &label);
+	if (!ret)
+		pdata->label = label;
+
+	ret = device_property_read_u32(dev, "gpio-mmio,base", &base);
+	if (!ret && base <= INT_MAX)
+		pdata->base = base;
+
 	return pdata;
 }
 

-- 
2.48.1



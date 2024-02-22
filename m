Return-Path: <linux-gpio+bounces-3628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69585F593
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 11:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DF8C1C2368D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 10:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131A93A1B4;
	Thu, 22 Feb 2024 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fmOnswuF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005C217BB7
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708597525; cv=none; b=nWcJubsx8A894d9uXb0mK+bVuAYANO2PYXGt2D9IJOtLYPp6sRBJmXcfWbAbsM8ZKeLBcmKh0APMPkIcck3B1xFOC4xzihQDAxYfE8pm8FzHgn8WJg216k9VBNZUg+xMpijdiAoj/jyueDN4H7NHVDODrIP4MZeo3PJkQrw1e1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708597525; c=relaxed/simple;
	bh=mnxxNFv+0lFpw/SFMfmvyOPBK7dB4yVlBgJH3aPt1as=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sg6ROUFppXwr4rBg+hwprTWTLizdRtXouMhxVuIPtnOIjYjRdYYnLw/8mrBg8OHZ6ibNjblSB+7GKjYSuEf+VnkK2BgxVSOQhIP/NxdE4bE4aCl0FzMv2RRP1yhpJ9iesWUeWQSXNE/yT+RdMbeEXY1wHcLsZksqDtpuBuDrjlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fmOnswuF; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d1094b549cso109129001fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 02:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708597522; x=1709202322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhl5ESUaDZOx7x5KxkphJWu06MFmNtC2GZwvxBuWor8=;
        b=fmOnswuFbm8IoGvrw7ODFN6iKLGSmRoaeCvT6us1qe6oiEN9vy2/FNVCJBmuHxpx2g
         oPjSVt9P7K7aezjq8aZCMTPCG6bP3bZS+m66juOCbt9Ln+oL8BIe27m19ZWNGWmV036H
         +jn8DMVPyuCAVEz1SAZDNUJ9Tz3W75aWB1X5MFzU9avqXqicgsWeNm5nr6z3B/l9IO7d
         4hz1cnpsvolxibxzCkNmTbG9dgURgDcUVuTd6cqnrJDdvcQdj2D4JD9M8Iud2DW2N40m
         16p9g/o6iGy8lvpcEnRQ9tlr/o4Oo1WBRWOHG4IKtpNSVB0sl6Q+KhcvfRZIXBvTeVBb
         nOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708597522; x=1709202322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dhl5ESUaDZOx7x5KxkphJWu06MFmNtC2GZwvxBuWor8=;
        b=oRe+bdgMZn53v9T77hpp3IhE8wtH62tqyyTWUBvzArpEPTpOBtVsmwsZSjJKAaAoDd
         D7BgMK8yhtAPHkQrpnJsjH9+UWfEFHVa0NyIUHDWvbb4zsClicVR+K1/hUEQLG28c9YC
         NjyVEyk4QhMQFxYKVJm6eDIkjI9F7TIHCHyvDVOWyeZPydX+4xs9VZw9w7PlsOz4Fg2M
         fVElNcyH69bAuXPIEhjPKOJcl97rcEnAAi016ej7ahYeVJsq5DU+Y98biQQK7nSN1k+b
         7A4G8+K8KNnDIkOgaeKGzfsAgJy5KaJI+UdoWwsxFuievKz91ixHQ/3oLyacj35m9p0B
         9xzg==
X-Gm-Message-State: AOJu0Yxo1hwYwTpuB+/dlm0L1CCop8u33236sRA5i4qTp13YMyCyqlbX
	LHGy+9XpN1AQ7CnrqI1etaAdxAYJ/K4BjKwflBq4dKGIhjoa3b11sNiKhntdMbQ=
X-Google-Smtp-Source: AGHT+IFOqwxJiGBc2Fme09gX8vKqytLAGdD/ajuD0r/rE1luPnxjk/tot7zNIx7Fsj9Rj2kppY/ECg==
X-Received: by 2002:a2e:3c09:0:b0:2d2:3017:c144 with SMTP id j9-20020a2e3c09000000b002d23017c144mr9167469lja.39.1708597522077;
        Thu, 22 Feb 2024 02:25:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:465e:5c78:c1d5:890b])
        by smtp.gmail.com with ESMTPSA id ay3-20020a5d6f03000000b0033d1b760125sm20632623wrb.92.2024.02.22.02.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 02:25:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/2] gpio: provide for_each_hwgpio()
Date: Thu, 22 Feb 2024 11:25:12 +0100
Message-Id: <20240222102513.16975-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We only provide iterators for requested GPIOs to provider drivers. In
order to allow them to display debug information about all GPIOs, let's
provide a variant for iterating over all GPIOs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- rename the iterator to for_each_hwgpio()

 include/linux/gpio/driver.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9c1fbfaebaa8..175129a92656 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -551,6 +551,21 @@ DEFINE_CLASS(_gpiochip_for_each_data,
 	     }),
 	     const char **label, int *i)
 
+/**
+ * for_each_hwgpio - Iterates over all GPIOs for given chip.
+ * @_chip: Chip to iterate over.
+ * @_i: Loop counter.
+ * @_label: Place to store the address of the label if the GPIO is requested.
+ *          Set to NULL for unused GPIOs.
+ */
+#define for_each_hwgpio(_chip, _i, _label) \
+	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
+	     *_data.i < _chip->ngpio; \
+	     (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL) \
+		if (IS_ERR(*_data.label = \
+			gpiochip_dup_line_label(_chip, *_data.i))) {} \
+		else
+
 /**
  * for_each_requested_gpio_in_range - iterates over requested GPIOs in a given range
  * @_chip:	the chip to query
-- 
2.40.1



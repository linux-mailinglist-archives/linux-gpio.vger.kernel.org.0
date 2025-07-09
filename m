Return-Path: <linux-gpio+bounces-22957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A101AFE04A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFA817AE509
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1180A27B51C;
	Wed,  9 Jul 2025 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UozZGLrh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB3427A461
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043353; cv=none; b=Xc/QTEX4JcYmJRpfan7fUsnWJ6Pr6xuXOBbOUECUKujzQvcUKpiBYpWc2CRluhs8dL7VMuKzP0w/mS2n/y8VCZ+eQagXVeDNqXIVRO35QIrIeJ/IMNOxRKHynKdPBjh8ldkh1SviYo3hSAqb44cb/gozRTLxpNoJZmFZRb0ts1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043353; c=relaxed/simple;
	bh=qDF+5wkLtmkv+a8EuWJMQf3iyFD7+WuZAkcxYOiiW8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0WKRlGE75Q9rFDZIc35vV8ARPRzC7s5RDq0dDVIOwM1Du8pX6jXsfMOmrULF4wAgpOlHueTZqznh6h+6/lagAmF1yPgttqhVo1S2PAEudyRKIJUyyiHP8jHh51sjH+mPAkjfbCEUsnngAUxvzA6dWORnoiAkXQEyMd20Rb2YsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UozZGLrh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d7b50815so43086355e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043350; x=1752648150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYXzAgR/QsucPPbY1ptN+8QS9bw6Y723FyD/WGEX0Vc=;
        b=UozZGLrhPzGvRGi4Ut69b2rMqSa5QGojTGmGoLfLZw54w/6R3oKYzPXEg+82nMwWvQ
         nBRjUyLoqfkxA6KCEg9+CutOJTs5mKNZGBkJGnOYHFUQrxyMidzFCev13qWXNHqPR5Ry
         vdL7ZO3zApRDC5jicOZzxSxXqaRUosGMsyd9/T5Bblec8YtKaCvpjWbEAta0teWnMyU/
         0rrBdvPL4bbNBMgg8KQ3gChDJdZPWXpsI7sCrhk/uj8pCrBXO2L8wIbQwGSpF0m6kJ3r
         yOHublaBaNEGFJuto95+KfDlxs2B3TWbKyNuQN/jnt6SBPNhAlzEGRvs3rIXRYtxtktS
         RsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043350; x=1752648150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYXzAgR/QsucPPbY1ptN+8QS9bw6Y723FyD/WGEX0Vc=;
        b=Fhnt3DtggmSs5ekYaBgouSpuxzL4Jy7hhoE+q9Jr8t/Vrbgmljcw/1px5Y57QodFmv
         GyUoQX4JIuWMYzniYHZRgdx/AZN0A9TmB8Av0pFw6+AczJnhCmSWaoZcZ814pWdlS3BN
         zL9b6aPG6+UFvsHh/whxLnqPTiJmcp4R1zkLLqhzoYfZ6fC5DFnHFvpUrnm9yNtXMYik
         3yEQtnCgdi8EVI66jLuwuKikZ4h5191XECNx22RAQ5OButRMSEo0UJDY+08wTahRo7rb
         ZQ9rnc4K/v8fowzbTQZkuCNfAPmlrEnQ0BflBkRThPz0ddIRI1Q6PDpAfTCFzNAsQK7m
         7WfA==
X-Gm-Message-State: AOJu0YwJOvB7qB4VR1rxqqO6pTl8cmSqNWlwSRTPG4guFm5xEd7lc/ku
	8wSgEhxfDkgaAWK22M66w4+9cRcRsMy68MGPeWSUKIHLvQSxOaZxcdWcdZXWOjONNpW3qLB8I0t
	RLbdPbiY=
X-Gm-Gg: ASbGncs5lvVVO53EdC3utYmc7k7PKi+D5Ri+ABWwi3t6Pzhqkt1JafDu6/MXEAln+4z
	petPdHzwk/l02EsNGi1bM8bqziBNKJLc1eorwBgDZ45KDCD8+W5+XepjpzzQnQT0Jx4Awa4zw6t
	BsLcmYFfrdsiNaRnKxGxpnAC9088dwPHI1ppNWur0Th2bveIB05vnhvb09g9rycVnKcuod6U2X6
	FRUDqCcgI26BQW/DO4ZXg9kbUeeiRo1ipQB0HjWrfJ3Od5bbROnoM6rpHIm9pIKGVa1H6lpcJ2o
	9YzWOHL84HcqGawG7ZDkSWD2d786u4VPT+wsTExSsz+ouins35tRassP
X-Google-Smtp-Source: AGHT+IHj+s/VBrAvrguJEGL092/FlNxW8s0VoNwIzQuaD8vmjFv21VYppz9JisncrQZ/PhZ/Kj5qew==
X-Received: by 2002:a05:600c:3e14:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-454d539ae4dmr8311655e9.22.1752043350479;
        Tue, 08 Jul 2025 23:42:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:50 +0200
Subject: [PATCH 13/19] gpio: xra1403: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-13-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=p+d5WgTnWs1VIynPaJSr2B/ELmhJiS6sSBvx1VfH3LE=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhuD0Oh/HloFhHS73yJ325WaqTvQX/AGUbo1nsFHnvTfiIDJ
 okCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJobg9DAAoJEBGnLqAUcddyn6MP+gKa
 0+icq0YpvqrQlI4V5dVyb+qmZYKcVGLeTkKKTfv1XQDeLi+ty+D/XCF6RmQ8pUI0DpwGPz4FlFi
 eZGsCO3LtRxF5gNLsA40qk2QMYStsYx6SI83lV7it6aqyqIDIRi4eap4wQQFjfIae0K8y7PjeMu
 iLbcdAMd97aYeCge89v90bFZDovETU9k9iYPGdnjLjU3lr6OsT7Lrh/+wPlwRm6bL4eyIK/qXO/
 G8Nt9Lp2CZ92AewjbjSMzSXfTDzAl+hZn8sGks6XsDYSPpCtWofFpm+ZEhtB2eCkyrCmhHA2Ej+
 KyOV3CrXBCLXfUI9wEbqwAOs5GhdHLz8DtJb+jAIWJ+EGuJcqssxPR/CklDNi6Xx4AcT9OhHvx3
 UuxbP8wV3kWAGKmP5WtA67Gdn6P8hyrLsisXZ3zlSEZhmq9zroo1IpJrIq431cFztrZi6tUte+V
 tFbMvGx2vHnyNx+p+6XkwKlLIAeJlQtM6v7/Zy41z2Rhbp4a33TZFDOEbBSZULUVYOQdG63LNM6
 SGbBqqweY2HNv07muZGVvULV0Ix7KRZklKGtNSjPwoLTB/nTaoOYQ4GMKcjWxRgd+bqDiXDsU4G
 tQHkQS9WCONID3ZY4eW/gKdqdZ3n53Wrt/HlYLQSUDdO2HscxlcDqJp9+MEfwIbpLvxUEdiiug4
 wXszr
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xra1403.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 842cf875bb92036616adc63748dda85c47af544c..70402c6b540739b73170988d03ad592b5d55c153 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -102,16 +102,13 @@ static int xra1403_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset % 8));
 }
 
-static void xra1403_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int xra1403_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	int ret;
 	struct xra1403 *xra = gpiochip_get_data(chip);
 
-	ret = regmap_update_bits(xra->regmap, to_reg(XRA_OCR, offset),
-			BIT(offset % 8), value ? BIT(offset % 8) : 0);
-	if (ret)
-		dev_err(chip->parent, "Failed to set pin: %d, ret: %d\n",
-				offset, ret);
+	return regmap_update_bits(xra->regmap, to_reg(XRA_OCR, offset),
+				  BIT(offset % 8),
+				  value ? BIT(offset % 8) : 0);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -167,7 +164,7 @@ static int xra1403_probe(struct spi_device *spi)
 	xra->chip.direction_output = xra1403_direction_output;
 	xra->chip.get_direction = xra1403_get_direction;
 	xra->chip.get = xra1403_get;
-	xra->chip.set = xra1403_set;
+	xra->chip.set_rv = xra1403_set;
 
 	xra->chip.dbg_show = xra1403_dbg_show;
 

-- 
2.48.1



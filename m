Return-Path: <linux-gpio+bounces-15647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 719EFA2EA04
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D643167EE4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448151DED57;
	Mon, 10 Feb 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hlEyuhNk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8201D47C7
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184731; cv=none; b=qeMvom34o0exKvvnJ82sHfQ2Azai10Mts+fyGmBmRhX6Egio5dxlHOHAx5cLOlPXQYnCTDhMG3YoadTkHCkXXGDeOlGWBJqEiNkWSIo6tcZ80ZfxqS7wmNEcdYNuRu3/ETLKXqWoqr+bc+sMgGDfJqERPmuiYFZksNT5WMVPAG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184731; c=relaxed/simple;
	bh=VEYyCI/WQWt7FUs1FcU8Tp3ZXokrKORavVAubjuZUu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlMIPxWL9spfMaFzsGuem92W6FxYdeg6BnVERnsZuRlq52YMiKgSRRNfo5q19QQ07O7N09I01AnDfcQzElDI4ddfYvpXvsmr1AtbEOuZ8eK0mDH2CsS5KqXE1xxoLrjWQUYR9XProzbM4+0CEY0jkfCUB67Xm8ONZZpvXCcpuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hlEyuhNk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4393f6a2c1bso5679955e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 02:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184728; x=1739789528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sO4RL0P3MsiqhqZaJGlhjjTXZ+rOkejLGclJdeKjOgk=;
        b=hlEyuhNkkSn+szlvX30e26u4pl5dtDJsgFq79gdyeP8LiSN8Mwy3EdQEL5FtYe5w2M
         kIfS9Xd5hgnIJ8Odax6F4J7LJ3CpZThBwTed0Jwx7z3/bRGORCEQDeACVuJsDzV6N6Rt
         Ro1PrBPv/6JYi71hi+XpZVwpDgXoT1CTmFSa6rjHX0ffR105u11wGJ0LuDkRSdDx9fCr
         OPjWhyxOhu86sGKd5TBpQntsZRoWLnUHdcx8Nj1alf8nPgzUYyXmyyqJLEKu75KvdhsF
         smCqW9OC6wJ8P8nEx6Kt3ZiXJw5WEpubNKV8fqEm2TX5yyAYC6nF7sM8Nc9TEh9EIwBm
         n5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184728; x=1739789528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sO4RL0P3MsiqhqZaJGlhjjTXZ+rOkejLGclJdeKjOgk=;
        b=AE671gOVZlZ5/pK4q8rV9vlYlnRm431Dd3oENRIos385n5ekwQMbX0sojnddyJOO6n
         OsVkNeRANvxmRH/MtVIzzqK9MvC1lcOdtWrV773uJqf21P4sY6kp8ybDUxSfE/b4qzOF
         rPp1ihrEH7l5WSbPJ5kuzZ3GeLJoKVEJuY7shQttwVWMLgSdrKPyVeXPmPm7FAdNpVTK
         A+y0VSVf1oPPwJapZrY/i7FbN+sKdW9e7MuhvxDebbped7AMPrO7YTK8u+1pODX5QWie
         qa5EWo7MW/hhu3c9NoztVpnWxRa8Up8dAMKopcj374VQcRl+hezmQ8nx+11sPjm9LWDu
         sdzQ==
X-Gm-Message-State: AOJu0YwRt6YFI1tfvF/YEBo7Wexa5rRC+agTWmAQqkF6M2Bcg27BZMnw
	qxxYML22y1RQVagnSkwqgkSdT8ZtC2M3WEqFph6k9dtqU/1jEv+679L9NnVtID4=
X-Gm-Gg: ASbGncuWL6gcHULudIJ94+dDI4KmNRU7S/5P2Nvt8w7dFXpV1m8jC3yO5qSkLywiz/w
	7sVcLtvl3LQkYiRN5ywV/4VSv4QoG+sQe1c/5JD330HGjRzQ+s0AMl153QmkGJtataLndST90u+
	JWnb+WZELRC6V0WdktmHAvh8kfa+tqwQ6X/EF3orAwr1FPgz5E6R4/B/ob1QOD4eMj1lXMkDmP6
	8Vovp3LPnU2AJnGpRJmDjuPV6zQrNAOYosUfXSh0Dad1ZHSnwPSowKunK08p8a8UZlP9ZAFvFEd
	d4LOAX3/
X-Google-Smtp-Source: AGHT+IG9w8+Y2BmWt3Wy2zCugo1yyVPEoCM54U4nHTtttPaMyB9ZvLuV+Rm+5tQM3AD5nQFQQRIc0w==
X-Received: by 2002:a05:600c:1e1c:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-439255514c0mr84862755e9.6.1739184727605;
        Mon, 10 Feb 2025 02:52:07 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:51:56 +0100
Subject: [PATCH 2/8] gpiolib: sanitize the return value of
 gpio_chip::request()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-2-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xkoYB7QevhvR3b+N2NNvGIdS2HFsaFzerPPF2/0s9uc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpSeBElLfXXQ84Z9WEjnwnVZFBwpXL6a3buq
 qxEtPp/EGGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUgAKCRARpy6gFHHX
 cttFD/9KMeATzvVcS8fkNWtmLZqCca0VOv3FIImFijcRAY1VSscZnpcKmcSFogZrPYFVPS3AwaT
 UmELIhw2EbSWGCN4YgmeuEcf++8V6C5MKxwU7qGmq+vPKUeySCdoc30XQuV1212EJCK2XEwDHu9
 SDU5bB56HMMj0rZA43rwIUxps7o861ZL+8LPTAYakQEYQE/YhztjoYlncE7+iXlBLkfS+16eIh1
 NBttreNhs0cRQS+/TfSXEBjlnMC1II6mYNCs4716Oh9jfylxLrPvdPQuwrjclzQvb9V5dHfQAtx
 rutAgVd/esaXieQjwPHHSGIwS8qAPQa9ZLHRE1Vsg2VfuCd9jhmjpiugDzpsZ7/LJOy1dYOuIB8
 ga9X9D8Ft2x2LeBMQlTo7GYROzRXKLUjvMCrPHIsDfGXhgLOzqLCVtYHCqzMXjlWLIm7wEppYDf
 1wXJg2IP4MnoCBnppWRe6wuN4UJaHMdkPJJvXLut2xzQ8Ql+uuCaIRabQdpBm0/1hYl2LTvMr5l
 JcOM7Z7KYcXYAI8Q/m9lDZINgILVtMZjZ00q6acCGrrGBreJ/yQofrY20Ag+MrgGQHlUhu9IX8D
 FN2SaOCoE4xPafKxDBKjJklp2p7UB7/YlyC87I0uLbLe81cP8LuZVRIyPxsN/t7OCY+SM8cibmv
 i+jiWfu5itVunew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The return value of the request() callback may be propagated to
user-space. If a bad driver returns a positive number, it may confuse
user programs. Tighten the API contract and check for positive numbers
returned by GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 2 ++
 include/linux/gpio/driver.h | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5d3774dc748b..42625da7e797 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2331,6 +2331,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 			ret = guard.gc->request(guard.gc, offset);
 		else
 			ret = -EINVAL;
+		if (ret > 0)
+			ret = -EBADE;
 		if (ret)
 			goto out_clear_bit;
 	}
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270..26fcddcb74b8 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -328,7 +328,8 @@ struct gpio_irq_chip {
  * @fwnode: optional fwnode providing this controller's properties
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @request: optional hook for chip-specific activation, such as
- *	enabling module power and clock; may sleep
+ *	enabling module power and clock; may sleep; must return 0 on success
+ *	or negative error number on failure
  * @free: optional hook for chip-specific deactivation, such as
  *	disabling module power and clock; may sleep
  * @get_direction: returns direction for signal "offset", 0=out, 1=in,

-- 
2.45.2



Return-Path: <linux-gpio+bounces-18116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04056A762D7
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 11:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CC243A7654
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2929F1D90C8;
	Mon, 31 Mar 2025 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vq9DcgtJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C297083C
	for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411621; cv=none; b=U9I/f3Y/UCvrs+P8GCNT8HswJygQ6gIn4UzLZ+sf3xMy6jCFmigtJaILEOZ6ZfUTZ5hMw+7iQmvip/7Y/nvktDgpiLsjEFfOjS+oQ0NCXXaAbT1dno08rP9errZV4MUZFrfRtAdDYhQKDvDEYbTEnpuv5UjkWPHm3aznBPJYEU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411621; c=relaxed/simple;
	bh=UEWMWx4XKJbpBIie5I4I/XrLwk7DDMfV1c2Dylv5ohI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JCAHy5F2WTMWGQ2g1gm7OKITDqRdpXsIsAvNZ0E9HTLijQvjGq9hSVl9rd7WVYYqedBH+evDqxLB7zhBPFdcy/Yns7qdIvtagEUNVCdWamDPA7fleGezEpewZdbruFagKr757Ns0qBCvplcg8pKghe+YjlTyYs1sX1NM85fI4xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vq9DcgtJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0782d787so27929415e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743411618; x=1744016418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8qYiLh2aqdDw3cPZwckXmMYUhPJtmVI390aRHfK5nI=;
        b=Vq9DcgtJoFLhG0EnLOtSNkZKxvqDuhcFm3zfjU76MaKrMLtDKiS+IIuB56ky7CrBqR
         /rrEBlBDeLA97R4rwaKezEkfd/Fz+Yy5NW4Buu+I0R3KuDWdC5hqzr1rKNmhThkY4JQM
         vB1Z5NSaaznpr2+ui5nF65BSN+EkIQZbzQAvCYdPNvR/JiDc5779H7iA2W3Iy1zRbsKV
         tiF+cjqrj4BFfyVXpqKvVYUGfrmv1PQT4ILLqAhxHnw6arU4YZwnzsknZ04+w1jInugh
         xKYul+mDDF4EmPYgMbN7JXOMwsZRFBhF85N2T9CuX6nYHGeu46/NkwGIUIFI6kDWqBU0
         ADgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411618; x=1744016418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8qYiLh2aqdDw3cPZwckXmMYUhPJtmVI390aRHfK5nI=;
        b=UyRbUTlXYO33irhRtVIN5zqNnb+kRBOrE30XITZ8frdTiLCWWzr5pNtVqybr1T/Y0W
         XNLBwoGoXkwOfylj7JvnK+VrUR7H0R4d9BJThkr+vejercE5YemQ/ImuzD7XAol5JZzX
         ZXnYbG5bznjICGcyK29kwe9uTTcq3GOaocIIuKMt1NKPqP9iDuIUaA67VLITBtiVyvTR
         SXRL4srEMqN7VU1vb8Qocg8JdQdQT9DZ3M6cePtS3HBGqloe5YGagdhDzKXlh3gqN+fy
         MA5T360BLhpYA55b1fo9bAQRuKputfGH009LKYifddUSAYtNHLSYTcm0+wZVnZPBA24H
         cBWg==
X-Gm-Message-State: AOJu0YwhNAk7k7IQh3tQPSNBR04cl1Tw+pVhPnPIDtmrrgW0LXLaaIJr
	xGMic8zEj6jWvFDgfvkeHDf4ATKtnwkNahLrRtyZer1m0avX6tOidkNMAyzctms=
X-Gm-Gg: ASbGncu8zQRIzQ1Twoa9i9p/eIHPOG3GwdMbE1k2g6Wriwwwzfq1u3INvlDND2Nxswk
	GZ69UAtdYI5CS97F9BebrrFOrAYs2MIJqxXieQF73JOkWrI+t1BLT0DF9phdbUJEeYHP6Boo4PR
	WTQ+x3Lr9t1RLKI/HOSr2+kDIkJo5ClNzfUfDMQ3J6uvU+VpdskrV0O86gBKGCHCFILFZQ5yFIm
	QwDQzhhfFS2OiWodqn/O7cDgyhaGAuMmhkST7cTmktjghfhGbobYA3ReIg1uZGWe+Ev1t+POhes
	h5e8flenkJ4w5AQfImeNeCAIvjQQ836fuT5gMQ==
X-Google-Smtp-Source: AGHT+IGYMdRRQWNFzlUCehEceX+XXUHjOedSfgkqSnl7Q8CuZbi5g1WG4ZlK+YukiCPN7+U9dPyW0Q==
X-Received: by 2002:a05:600c:1388:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43db622a2a1mr49112435e9.11.1743411618213;
        Mon, 31 Mar 2025 02:00:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1db:ad07:29d1:fc13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm114534115e9.28.2025.03.31.02.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:00:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 31 Mar 2025 11:00:09 +0200
Subject: [PATCH 1/3] gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-gpio-todo-remove-nonexclusive-v1-1-25f72675f304@linaro.org>
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
In-Reply-To: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=878;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tlGOX5FQjGMEQfrMpb3Lx+55MZB/eBiCAP/mbvbglPQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn6lmfvXKAtsbn/u07MB4pHBI6KOEjCjOjAIh23
 zndHx/YlnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ+pZnwAKCRARpy6gFHHX
 ciIxD/48yDvJXOQkZV1Wkm3Z75EezAAxi7pURHuz45RZYw5Q7lCWxtbJXtzQifZQU4OU6Sg6Uw/
 y4pUCtPw/gX3iOqGyYstANfN9D2WkuXfrLWnfhhXchlJMhqT69iXltn94s2bBVLaVvN+H8VHj1Q
 sNenYfEI3zc1sGvTF7vx3XD/IFuZDT9s/b2nwVZmB6zrCytd5qYa9fZmKOjt/RMCahn1ItO6L5M
 mCtiZAD2tPtJzAlAsQV+vJv9J7ScCRV8m+Ca+5B2S9VN98mwbsVBDEzodjn4BIYLa0PrHPHdJZB
 uh16/AgMn2u4DqnB8K6zQGVH1xP0JqwFvixhLleslQoBdIKt3yTMbPsWD+PjZTJfVZGl5puJsD/
 dxtGYA/V9KhL0WgL0WJyuqSRGttg1Bvy+JaNBKvxo/w2sMEiwI6T5NJyNw7sqpiSphVLZW7WQOB
 Hup7ItjsB9OWs80rA6496sseOwwOcOWdgmki7JXAzNlyl1KdXYcNdtkyy3Wu55kh8/Xgb4Tk6i/
 1M2Fs8LlQFfj2j/wkjug6/3yfh4RAXzKkJwQaSMSgbYEqaepAH5LzXQ3DDhBmHdPQCpRTQhBDhz
 mac2Dm4TOCcytK8KhKZ2LF7blX2EUM7948cE08+mDw+DDu5Zio0S8ApZq0/rKq/3nRBhXs94U6Q
 tJld+Arw4DIymAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The non-exclusive GPIO request flag looks like a functional feature but
is in fact a bad workaround for a corner-case that got out of hand. It
should be removed so deprecate it officially so that nobody uses it
anymore.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/consumer.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 45b651c05b9c8..8adc8e9cb4a7b 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -31,6 +31,7 @@ struct gpio_descs {
 #define GPIOD_FLAGS_BIT_DIR_OUT		BIT(1)
 #define GPIOD_FLAGS_BIT_DIR_VAL		BIT(2)
 #define GPIOD_FLAGS_BIT_OPEN_DRAIN	BIT(3)
+/* GPIOD_FLAGS_BIT_NONEXCLUSIVE is DEPRECATED, don't use in new code. */
 #define GPIOD_FLAGS_BIT_NONEXCLUSIVE	BIT(4)
 
 /**

-- 
2.45.2



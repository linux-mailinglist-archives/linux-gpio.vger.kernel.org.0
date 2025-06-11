Return-Path: <linux-gpio+bounces-21411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440AAD5FF2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 22:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBF82188B307
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 20:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A8A23185C;
	Wed, 11 Jun 2025 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pIDPpEQ4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC02E1B0424
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673127; cv=none; b=m7CLS5AZCyVKuqU1ok/T0Aanu/yfko4xvCcWByWjvR0dXwz5lS2EW2LraLg62sVeMLU+5jpo8a7iTxn8eqwg5kg5UUz/nJZDq4apY1y/PfAFFGwfl736tmAl2Cott1gP1/2RjqN5v4t9eFqTPvZjPoMCM39Rct6Tg3aiNSl8Z8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673127; c=relaxed/simple;
	bh=fl1skejRdYPAXQJachyawZhX+X0nZDq7tf0kNuLhVqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J1cqAMi4hBo/cJJmq77qtWujnPgqb/FCwmGRpnsveELclIeez8WYJ8kYjytENzRTehxz7U2YIbiRzOk2hjRS/dSHjNxTycvWciDeGKtbhEBixHoowAsTmudjPDrYTlM2gW8zzI6+3GIsYlaL7ooE81scc8F+ahVpcz9CvlCo8hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pIDPpEQ4; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-401f6513cb2so726229b6e.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 13:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673124; x=1750277924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nTNTlZNHWyRFYDg5bngNoKX8zKHnMqcB37IegXuxL+g=;
        b=pIDPpEQ44WX6uHLLAP4XgAvP8WkdLncdfZmnpe1h/gTH9lEDp2CUFG2q1heCCWDWed
         4LFeq3t3ynXENgHLWHAgn+Onv34Y8JIxExN+PWNwmG22vtzxfXpmFouCvOQabZlTK9eZ
         r+GPvSyQXQ5H0JuUGqizfiNVidH4LVX5EbHjR248Uknme56LeRMwZro4T033QTvh+4wB
         bJM1y6DKT4H0b6eikffsthhetpDrk5m0J9HW+iXrzsRuVNEDeH3nIt+KYuyaFAzigrSU
         TQubpIKuxfBi0FDuHBzlE/ghRmrVuiqFaUnq6SdHUiwsIb9X0QLgKTOZiaMr6jc4WI8p
         DlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673124; x=1750277924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTNTlZNHWyRFYDg5bngNoKX8zKHnMqcB37IegXuxL+g=;
        b=QXdvJ0jWgVRp2UOX/vcwtE88O6joHw40cyGyzb/oKIvFNHjqmROQS8TFO72oQI6as+
         woYt1DCnXWH44ohreHOJu+waNgUOiXhyrh2vp32kKrHdkrQrefEF+gjnL6d1gRG3no/a
         lzNJOetq1vONgztbjVaYPhFy7uPT5T7U0+8DXA1OKBggQtarpxL/4MwAHYHPDgeVRYWQ
         c2VYPB0YOXCx9YCklHwpaS3IiFDmXipkR1gzV8p4s9sqDzJNjKbPvSR18Vj75eTs6YSa
         DwuSrUgW28D7Ysl+ZvktV1N2/Sp4SWhutW9i30Nrn0fNntcpapj0VYMhYb+3rIZOH6IQ
         pqSg==
X-Forwarded-Encrypted: i=1; AJvYcCXCM64Cib0/WeQVuxSyxph420xbu5MqFa47kQ9QT8AgaiHH8wc+q6NiBxMrOBKIYt3gzctzSy5o4vOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGgxW03/PmscvcepL4cYc1JOSLErMsU+zYpIzY1EP/tV9Qqbj
	eIaL3YPkr8xRedZ10yWgYXJItNq7kXWgfZxuS8w72Jp4FTW5LC4oruuOFc1A6k7YzcPVgazn2zj
	+6tAr
X-Gm-Gg: ASbGncsNXEYLfq2jmAddsMeswzMqHxIFgsf/5dj83JXq69R8aq8ArO0vNzXB3eh70+p
	MR1nB7jMUbuZDoqN0ER3cyLRKej8BFIdSDPvo3k7qmUgYLL7QBmhEVp6C7bhQ1R0fDPDw+gaK4n
	p8/bmMwyQVexoQARx03lhJk0hF+3s5AuzOv1rWImaWAz4EGsVSPOcj/CQEqtisqshwsRG2b2xWN
	Ocz07HvQXMIQ/qhf40gXZSUL3DD737UpmT/9qP9Wf1cg2Qv4Lfnig0jnm0c2IxHRGJkcggEmZO7
	ZT6tLlXbKQ3/T4efT5BjGcR1sfDzQcUcTMwJvms89l09M6y6EYNEL9aVUzBzCqWfUnne
X-Google-Smtp-Source: AGHT+IExhWtGNKPwRnOwsmDXgg/RlKoph4199SUPBrA/vgunndUh/aKsrqhRu/XH/oSztR8tBsQK8g==
X-Received: by 2002:a05:6808:181e:b0:408:fef8:9c91 with SMTP id 5614622812f47-40a65fee5edmr732537b6e.5.1749673123808;
        Wed, 11 Jun 2025 13:18:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d80d967sm467732b6e.4.2025.06.11.13.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:18:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v4 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Date: Wed, 11 Jun 2025 15:18:08 -0500
Message-Id: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDkSWgC/4XNTQqDMBCG4atI1k3Jn1G76j1KFzEZNWCNJBIq4
 t0b3bSUSpfvB/PMggJ4CwFdsgV5iDZYN6QQpwzpTg0tYGtSI0ZYTiinuB2twwEmrLxXM+6gH8H
 j2gjFWckLYjhKt6OHxj5393ZP3dkwOT/vbyLd1n9ipJjgqqK61LoWRsK1VnNvaw9n7R5oQyN7Q
 4zII4gliOq8IaJsikrzHxD/gCg5gniCjFSy4LIQRpVf0LquLwm4GHhPAQAA
X-Change-ID: 20250131-gpio-set-array-helper-bd4a328370d3
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=fl1skejRdYPAXQJachyawZhX+X0nZDq7tf0kNuLhVqk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSeSDnP2x2LEK+fLj5yc2iRew7RstZzKtuFXLX
 p3MJHtaiP6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEnkgwAKCRDCzCAB/wGP
 wOfdB/4ipvtAe+CwmELCP2yQlVhCMr6n4zq/Aligv6zjBb+DKG9GHsQ2+Uk1KbbKa1W/r7mBBEB
 E1ql6DHjcLnZgvEdKXQObOLA7++2Wb7ALNErFObpEEAe0DBvtoXZov+AcwBxzgfyVrYaVtXQXUb
 +rZB2jwuWZwU6AqfOJy88IqHXmXfxRVz7uVuQ4FnNW5Y60tIjadU5MShX/pBXi/8vMyR0OMNHG9
 b1fOZhZtmAeMiI044Uih3mclXT8ttjd+MVvSbosF4Vz4OpvkUPGiaa4v4830mmiflgbPdYSnFsz
 q+zEBFudRiIlgN0yOWNpNb7q6mOe87q1WCX/aknWMqSwobjH
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
that didn't get applied yet for the bus subsystem. So I have changed
the subject line accordingly.

Arnd,

There was no maintainer listed in MAINTAINERS for the ts-nbus driver
and it looks like you have picked up patches for it in the past. Could
you please pick up these as well?

---
Changes in v4:
- Dropped all non-ts-nbus patches.
- Fixed a reported issue with uninitialized variables.
- Link to v3: https://lore.kernel.org/r/20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com

Changes in v3:
- Added IS_ERR_OR_NULL() check to gpiod_multi_set_value_cansleep()
- Added new patches to clean up accessing bitmap directly (ts-nbus, ad2s1210).
- Added function prefix for max3191x.
- Removed unnecessary braces in ad7606 patch.
- Picked up additional trailers.
- Link to v2: https://lore.kernel.org/r/20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com

Changes in v2:
- Renamed new function from gpiods_multi_set_value_cansleep() to
  gpiod_multi_set_value_cansleep()
- Fixed typo in name of replaced function in all commit messages.
- Picked up trailers.
- Link to v1: https://lore.kernel.org/r/20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com

---
David Lechner (3):
      bus: ts-nbus: validate ts,data-gpios array size
      bus: ts-nbus: use gpiod_multi_set_value_cansleep
      bus: ts-nbus: use bitmap_set_value8()

 drivers/bus/ts-nbus.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)
---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250131-gpio-set-array-helper-bd4a328370d3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>



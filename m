Return-Path: <linux-gpio+bounces-21149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9511AD3249
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91039188E41E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A9228B7CD;
	Tue, 10 Jun 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pSAQPe6u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF61A28B40E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548409; cv=none; b=CA5ooQ8TI7rGnDzG1RN/xaILI3TZj520G64LVpQmq8sX3B2Yw9OOMbrFjWfqUIfUJHg5hcKMjsQjdwwv4Rk8UkJ9cVuJFi5IagO4sYcMTQ1wAoiYQyfQ1/XPuoKhlZWA5IZWH1YVRAwU/YKPKMViu6T27cUT5Nk2+rovcDkT8i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548409; c=relaxed/simple;
	bh=AKwpmJzl9lKGf7zB+8qMMeBZ+Kie7ZQ0wL5tYgJZHuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tM9h7fqXH0ffd+3wwQt0zgR3NPPkF9hH+4RfYTyHL274bJA6GjXtQx7gnEd1ud9tJvGTvMox7wtKOzRFbtLC+NJEik357TEjAVDKw8v20+YBdQuYBAdxpW4EhgnvLmuvRjEvdWrzbp6YgHXrSp794F0n9wPkPU9mDY51YsJeDOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pSAQPe6u; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1582698f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548406; x=1750153206; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8YqxWEVGIbl06OM/kRfzm2Y5s3NUOnEjDcK+SqosNHU=;
        b=pSAQPe6u+ZU6BhGbL8uK0HxJqlXmkCbQUJ5u5Gl4uu2MT2jwrZvy3Y7rkX9Z5ThSEm
         cCZkpFGHc9zkarit1fzsNIahORO4QTlY1Who1W1wcSNgFyXu93+VaW85O9Mxqat8hHOf
         aeYtOwvUhQWnqGgw0TMLCZhjKs3XauHHgWAQ62Qn3KxUY2CUKwL3BdCDfj7BqejkHN5+
         CWuezzvF9WmkP4gZp0meUlhMlhs89ZOJC4gxZCitySfeisRKaTR5HqsIEFqbnPSOzpaK
         ZJ3fl5CIkYjn4BRfebmucFgIcESeUYrdCYthR9X1BWbCbnFCJ7JJJn6DCrgHCletIij+
         db2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548406; x=1750153206;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YqxWEVGIbl06OM/kRfzm2Y5s3NUOnEjDcK+SqosNHU=;
        b=Ugn4JSwOi5+MHbnV57ShKkDgWnaPksVvZJfslSFsk7lzjNNcwv6AzYDzcJb7EjXyhR
         NdwWVm9yUyZ2+5LwWntN9ScZCTIFrz6GpnHeH6dgSAvX8wAvQrhgbhbyRSeBZRhbBTEV
         KVuD2x0y+swafGwpiaN0boweKwqGBrfSMQ96FC69hquefR30rgcZwp70IVbSeT9zLrR8
         Id505MSUYFMGJkK/u5LHlA1Q7ek4RFU+maR30BIukC6DwaJwwizwXAqtKOfkZHPSL8Bg
         b0n3sGV7Wi3xpUW6yAjxrrpwGHPprhVlpocBeRB+0wXfULDmiUO1vNhFblCbiN1o0HC/
         htjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFI6tQgex8NqbnAN6tQQn4FOKb9aPMVju7wpXCzlacycXFQTYBckcUC3n6Plw1gpd2DozFHMTUahhq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3+8f9g6VOLvUtHaoJ3ujsHe9EAuYHm0dCAtMagrPupyUgAnD7
	iJqtGQuMWaDiMcS7shioWwaO2krrPyUCbDftYuf4xJajNtZp2pqEQHyvKwV6Q1CTOBs=
X-Gm-Gg: ASbGncvkSJtmkbW7Anepudg0QcDc9DfGhshISiFGtAh2R30ok+D6lp+2P3p43jVGXBo
	Uxwl8Vba+hP5gw4mW4dnjYmHwp2oWkqbiS0lHp2WbY+BArQdrG299Y5MitCKjoD1A2Jh9jowKu0
	KOvT9fMTf282Tl11EpejJ8KDcK+qgZ+q7g5roNDEq43BZaMiBqw58h5DZ5DBchl6w0P/GM4HJpW
	ZtaSV/NUjJJ2tbzxTiY3+e18zMiV+WDvv0I2WuBkF8rfmgav+W/5AUfETFL67EfDGZCyfX737Fs
	4b+KEEgGIuz0qUQ/qYrkKeKTc8oRmB7kqxWpoza2kjcVkRLStsx/Oi8cBe+9RRU=
X-Google-Smtp-Source: AGHT+IHAj214YdvfGYx1uOM3eZcsSW+MMvv57eHmxc2mJpyMMZA/B3YgejPP9vSlzR8Tacu+83rrHA==
X-Received: by 2002:a05:6000:4287:b0:3a4:f7af:b41 with SMTP id ffacd0b85a97d-3a531caa1femr14444697f8f.15.1749548406144;
        Tue, 10 Jun 2025 02:40:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709729sm134388355e9.19.2025.06.10.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:40:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RESEND 0/3] Input: convert GPIO chips to using new value
 setters
Date: Tue, 10 Jun 2025 11:39:57 +0200
Message-Id: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG39R2gC/3WNsQ7CIBRFf6V5s88ALSk6OdjVQUfToUVsX2KAQ
 CWapv8uYXc89+aeu0I0gUyEY7VCMIkiOZuB7yrQ82Ang/TIDIIJyeqa4+TJ6Zk8RrNgSEjWvxc
 cNReKKy3bWkDe+mCe9CneO1y7W3c5Q5/zmeLiwrfcJV7aYm5Y+8ecODIc1NjIkSvTHvTpRXYIb
 u/CBP22bT8avG12wwAAAA==
X-Change-ID: 20250331-gpiochip-set-rv-input-bc12818c5732
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AKwpmJzl9lKGf7zB+8qMMeBZ+Kie7ZQ0wL5tYgJZHuI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoR/1w/nKOzVoDi76ax1r2d54w+vjHRLZUjp8v4
 Lyt6o3RjNCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEf9cAAKCRARpy6gFHHX
 coMSD/9EpFU6M2G/ulQHJiLOkSW4viscpAsyePNbT4lS7UHQrSIKroONDyrQb/XCs4UMeLOfCaB
 BrJFxMh3SVUKTC5y+cg0TzGv+luzFMX4scqB2gQX75sYYcMc27Ydd7vjWocf3SOoCO99PgtGBLw
 HkJvPB15jno4fjzuhwnAHsjUpEMNzIsMKbOUFkAVaVpBoPzIFJcq0CZI7SEW3DKQtnqxX0dHqYW
 mRBQA0gdbvFWiiAxfHm+04J1SV6m0FPMaF5hiz4C7loqPg4NDcpQJLpZ6MJeAAXpURmIXjieKPe
 9UDJlVZZhSOD29wN7rLobpLmA0n+t4zS3jywu43tTsorsyOoL5w9Ru1ScR3clGb7cJIzwwbYtJt
 syj9OIu8yU1ZBcf3f/BJ7T/DrqGXi22iS26nrcjcKjLLQvnhfuwisSMAi+uBKY63zH7bGoW6MW0
 q6vo8E9EK2D1kqzFzi58UtWGaDx5RBiE1si+Uv61dMEXvXRLleRTu0IN92lLfnd3qbgnDck/Ekp
 L0sDOqtQvKPZC+tLwLJiVG3n85aKrvbST/MM753j2cuL4gED8q7ZwecZAM1Y//6KYPLFkIkL4fL
 YXS8ZFUKTCWTGolheMx9GMjQ4guFTEs62nndAMFuUV2py4piiW3K9n4jXLiTGtGCqaBZG4CTgw9
 qAQCxCdWvGhZ2ag==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Never got any further feedback on this series last cycle. Resending for
v6.17.

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the GPIO controllers under drivers/input/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      Input: ad7879 - use new GPIO line value setter callbacks
      Input: adp5588 - use new GPIO line value setter callbacks
      Input: adp5589 - use new GPIO line value setter callbacks

 drivers/input/keyboard/adp5588-keys.c |  9 +++++----
 drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
 drivers/input/touchscreen/ad7879.c    | 11 +++++++----
 3 files changed, 18 insertions(+), 13 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250331-gpiochip-set-rv-input-bc12818c5732

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



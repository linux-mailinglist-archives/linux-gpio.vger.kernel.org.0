Return-Path: <linux-gpio+bounces-19180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A510CA981DE
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEEA87AC5A8
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA042749EE;
	Wed, 23 Apr 2025 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MDqkO/p+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603C4270559
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394844; cv=none; b=T1oJLjmVS0nsde6A5jEwsnlTmi5VRkxXYQvhR9TMsPjjMUc7tn4/umdt8iV7HrXG0PVIm0NazjI6a9OjO/7hoMxDG1xZYU+tB0+LVlJfjYF9AdZS0QCoCBJi1tOt7/04dfnfkgvpV6367frWqwqMHjSLgLcfuli3Xh2Rfoa520A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394844; c=relaxed/simple;
	bh=N0WwTN6cuFBMQtVPSuk+m8VXYpNYq64YYcC2HR1dSt4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ka+r5THyTyF+Xw/9MdZdjv8BOB8+aBp5lRGPds8cdPqQ0jMigzQXj9yCbuxhMxPaMRqBE0+YTVye62++I2p9kRJMWk573W1R/7uoRKvhndyMD0PTFey3XmeCpWVT6n65O0H9I962le9DgR9WyQCXGHw8aPFyny7X/rOYQHXIcgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MDqkO/p+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso4323345e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745394841; x=1745999641; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VPRTWsIFDattDg+pyjOf0c8PqdiKxpRrUpEN2x7oMCM=;
        b=MDqkO/p+6l13y5VsiVuAr9E5roNMGqinuA8Ut5rE1rS7KHqa6zd02J2bvKsnDTLj4P
         wthP4uR8sVTMX6pPY2hpfUkWD1IJ1a6gDQS67/6rtlADTy8f0sjRgq6Mq7qAbtLqMGql
         WnZqKJJMPuoWC/YBhNQc998LGMgXazEjHwqSCaBET5but6j5sKIQ6MWyZHoSEgUL957u
         qaIS9aUt1wsiyqjXPymlWkd5g56hsLMyQY0Z5QvajWsIRv6fFfcyrHe1tvG29AKtn7t6
         7qc/SWtzuJM6Xi2MwrRwymDnzRb6qIB30smNqPWMPm4HswaC+wSSqOHN5S+NOlzYEDwZ
         FLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394841; x=1745999641;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPRTWsIFDattDg+pyjOf0c8PqdiKxpRrUpEN2x7oMCM=;
        b=PjXGPenPhwWvkibwRxUNpde7KGLofAFlQd9BKP3rEj0k558s2oppJZxSCuHC6Vos7E
         5tjmvrvLFryW03ZjPN+ckF7QS55iJnqPgPUGc+yCF1kHb2+mWPCeZuMq1KJaEG0a0t4E
         qpb/KweYE1QN+7h0pUs2fIxIeQTwJyhh6i+hPBNjpceta86IOtyX5DGFE8BEYS3hpTF0
         8O7UeNxNPFqNVmckivLT9RvUtcofrSe1NSmQM/iMsYT2RURBo9WVdGOB/q3ESPWV/y+/
         e+SymXFIPEyfzBMNBtDtWVEzWo/pumaiLSQkU+klGAjnC4BPu/i/3IWPZqSVrzoIRDAG
         OfqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGhkk3VGBB6LAIkWp0pAuYdo9zzq9E2XUxWcAL+rXQuWsEBZQIjSiHO0YV3d7MYo0gMDSaHiF+J4cQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6iYDEIDCub9+fSxfAZQLS/eRRDL0p4kwM4/AghHUlBE6X1p+5
	7Jyb9P+ioK7cAyCP6a5viUgSnIaYEkhOBTBcja8fGgcslj7B0qJj7htO++MKmOk=
X-Gm-Gg: ASbGnctUPQnmJzYJega//j3kKZ4zNBaMNv+eMzIkAmYjF66wMUjII5WX61YHEEgTiRW
	PbvpPs55Oce7N+U9DSzs61b7KP72b1NPAPAUnBEA4Jaza4VwVb1WRo0pNci/r7uTOKW1okdK/Sq
	C/hQmULwxOIRZrLkA9UQ1P3xDojgJQ7NGd/afkkIB7lIIPdlcP/yr5o8t9RDNcgxE+yqVCJDxUR
	9Z0Czt81t5HLai3l0PkqkC34qYbdry7jyU0uHLzLRd0ubeIXrfAPyymomePw1eZgNaNOBdMwLEv
	uTe9t0582AgZteu4cyKzoOxqznGoJMVeMQ==
X-Google-Smtp-Source: AGHT+IHI5oJcBEzU/+dqI9+s526iScFMzOCWLPWNYgVlJrgGNMkgt2vl8zY5oFysLDdkEPsKBo2JNg==
X-Received: by 2002:a05:600c:1c98:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-44091fddd38mr18823105e9.15.1745394840657;
        Wed, 23 Apr 2025 00:54:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm18266655f8f.33.2025.04.23.00.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] leds: use new GPIO setter callbacks
Date: Wed, 23 Apr 2025 09:53:49 +0200
Message-Id: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6cCGgC/x3MSwqAMAxF0a1Ixga0/tCtiAOprxoQLY2IUNy7x
 eEZ3BtJEQRKQxYp4BaV80go84zsNh8rWJZkMoVpitpUvHo57SaeFReHm3csys6gKVvXW8wdpdQ
 HOHn+7Ti97wesVD2XZgAAAA==
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Riku Voipio <riku.voipio@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N0WwTN6cuFBMQtVPSuk+m8VXYpNYq64YYcC2HR1dSt4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJyT0+OlYThjZx+FJ1bQJdzMWTUnPIg5r6TIS
 XEKMFC4+VKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAickwAKCRARpy6gFHHX
 cjt/D/wPBEC+V/mt3kFZcJSkkFnnWauvhCM+yNIUveQso7mRwm86BhNda9mFAFk3cHZoOPDScyc
 o3T3/BU9SfQhnyvx0poAisMlg8Sd9ONLBy97qOfTBpt/5jmM/1ReopFmJJieQhtaHSV9j+NFyNP
 kZLzEnuXAJiNhKsUYjAA77dvZ+L913ZvUbPCuyjehMrBG5gvOt2XEF0UvnH+EvRFqu3r2cYpSts
 qUIyfoJ/5FBgx7zBsLDZr0TctfcpyJQ/31m7G7ApNCZr7p9jK+jQGmMYNJJISu6g5MCa8wcU5TJ
 +C1rWHB5SFK9n5wN+4F3oAb8Ivs9geYfuG6GjNz/BC94KQb+axKWBiPXATLtf67jEWYGoSIrqUK
 MrFv7kAmjwxrmmLQe9DtPMCG6AaElSjhbgQKaqx+sKsD4yW8POPXUsoj94zf+CeXxzQBgUlIB8n
 /bBpXT4WAtqYjMiA1rUJzY6TEmTuCCJ4eugdleVBEtwOeXDJAEVCv2SNYuR3i43KdqpOk/5+Bza
 5TchKROmGc6E3P1pSJQC1FrxdHvhVIRpnql/A2j6OG7zYsRfIftAv8biQClezXW6T1c+teoDL/8
 2ctKakglr4OPG3MsBekAVlRelsbt9xvUDyYGQeFUq0H3Lsnp+RNhBJDfuIHp0qOorgC9luxsMBZ
 IV3RS3CjYTlRSoA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO drivers under drivers/leds/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      leds: lgm-sso: use new line value setter callbacks
      leds: pca955x: use new line value setter callbacks
      leds: pca9532: use new line value setter callbacks
      leds: tca6507: use new line value setter callbacks

 drivers/leds/blink/leds-lgm-sso.c |  6 ++++--
 drivers/leds/leds-pca9532.c       | 11 ++++++-----
 drivers/leds/leds-pca955x.c       |  8 ++++----
 drivers/leds/leds-tca6507.c       | 11 ++++++-----
 4 files changed, 20 insertions(+), 16 deletions(-)
---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250423-gpiochip-set-rv-leds-f2e516f9cea7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



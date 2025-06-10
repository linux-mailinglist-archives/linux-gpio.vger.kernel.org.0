Return-Path: <linux-gpio+bounces-21208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5619AD376E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E552B9E00C0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C47629CB45;
	Tue, 10 Jun 2025 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mYb1Mv8B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033628E60C
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559431; cv=none; b=POdojmmAO2/vL0znik3Tb1XX2yOZwePCSGmarmTSzdbxPsa38ec7PKAEVIjhbz59Dr0V/ueMgg2M4BIh4yG+geRP2j5gPS2hg6S4SvMXTBVflGhA6Nyxo+fUAMtdHx3xXaQGwP5iy06g+PFQJ3VfV02jUVXDRymco5xtTLgVFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559431; c=relaxed/simple;
	bh=4nODc2Mtbf2GfMKmdK4ugxvnIA0l8topfUGeUpqv/wQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WuYcHgtyhkLZU1OuvCLaOhxsnXYHv+1rDbjIXPOc5nxokmlXISuJ9tP2amyPzgzATT3ES2WG0UBTZ10bwRsuhXkix2h7vAVX1b4Blk4Cu42hYsxjtD8EvHZYCdWHAQdlvNuERWDhUCnqoxzLt5XkScrejc++likD01bGpeo/aCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mYb1Mv8B; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso9816045e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559428; x=1750164228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiVUFoTyYUZ3pxshEFcAd4bLKMF3ilGuB1tgOPOqVOw=;
        b=mYb1Mv8BaMkADn/0vDKNBtN9qmoBxhwhYgkMsJ+w/lEbQnOeXn+DJeCroihZ8Sh+zh
         vtrE2PqrDaSMvp1zp/D/qsBMakHMF/9F9QOPyCWVuDLmT1y9B4LjO0QdSmLQ03USft89
         zf71di4a7VLfRviqV4pOVlfyQEK+GoR3+YC0jfBLMzfkxUj63D4zVea0H+HTyLUme9FT
         Jo6hFeExQdbzg2LsWpETdhXC27XVGbQHc0yWKRIzR7kpn5wUXjmpH0H3nzR5IbHAwZn8
         0jNEaeiBH1Z47O/Cu9EbuAR9PPDjIZMyF62bXFeXpybLFka+TqPCH0k6NZUq/5Tx7/9D
         +qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559428; x=1750164228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiVUFoTyYUZ3pxshEFcAd4bLKMF3ilGuB1tgOPOqVOw=;
        b=CYaI2y+A98TH3Q6XwP4FJl0E0vJLi/AFC4TBT9SrqIKRwXI0obYpUE/8lwUJksfTw2
         liFOrkYKt7oyNu8E5oV6QFzRpCO0HQuPLZ1W0mhvcQDn1H0pp+wNjyo8BAslNCUskeG0
         ou1xCisr+pCMsozPpufIJpWNLVlJkldCUFBj+rxTZcavF57538NTq7pTk9300DLned2Y
         mp+mgyIFSLqIRFpnZ3moBSvgoPrrDgot3PkRtdTc9zjblC97OJYdYu4XCzYh8x09QDYw
         Wye7AkI4jwSohawcPVKtaGfIud1tKvdaBtv1rFLvsrFs6e6q37qZcsF6OZqwL3lrbZ1R
         COpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5H6Idey5n/QRK1upDpgg11lqHk9f7/Tuo+W0Ft502s5VOfrjCac1pWDdzXf2JMnv1sLRMKzJSk8jJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ZWAbVA/dhujEowsKzts+31sFJ7VX24D4P1ef5k648Sh62w+T
	gw2XtP4/Zp2wcHBS2VQ2ZbyymwnstY9QGN5k6xPD8TgXvuSf5MPDh7izAOPFGs01mHE=
X-Gm-Gg: ASbGncusiiGM0ds28QCrANYdQ8Mh0UFcOHae4ucnS9evfOanR2KhjU2LMOUOQ9vec0A
	T7cJySYqGGE7hckhP//+yWi+VMydXUcfFVEcXPPZT9yxNXnnJmWqfIuGZ4mx4KctGofT7xrr9G1
	axtS0sK4s+Tcd+nLXVSZKLcwHX2G8SAOt2zl6CRyJ5Id4kAzn4rK0SlbDTXqgeqTwwyhmY/K13x
	H/N8F1B91vO4LloplIQfDLpEXxFF+vveZ91eCj/uPS99M3s4WATEeujV5w9Q6NZBwkuyTLa7JfO
	SNP9a6j1V8Iu+9XlAnCwruc7w0Rm10FRzwUx+PZF3Ht8OBnotR6z
X-Google-Smtp-Source: AGHT+IGuWTf1KowrUQILfyGWQyY4v7aI69gh0KH5E1zC2liy1/7pGOK7wxPBkvdzhBOsu44QykkkhA==
X-Received: by 2002:a05:6000:4305:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a5319ba2bcmr13137620f8f.7.1749559428029;
        Tue, 10 Jun 2025 05:43:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d15asm12553064f8f.66.2025.06.10.05.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:43:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] USB: serial: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:43:45 +0200
Message-Id: <20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIEoSGgC/x3MQQqAIBAAwK/Enlso00tfiQ6lqy5EiVsRRH/PO
 s5lbhDKTAJ9dUOmk4W3taCtK7BxWgMhu2JQjTKNUR2GxJuNnFBox3ziITN+x7Sg9tppa5Uz5KE
 EKZPn68+H8XlemZ0AvmwAAAA=
X-Change-ID: 20250523-gpiochip-set-rv-usb-serial-4f4d4cc2d5ef
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4nODc2Mtbf2GfMKmdK4ugxvnIA0l8topfUGeUpqv/wQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCiC2/OS/m48r4jFb0FUB3WKLJ2SsbwxWE21D
 btTzSpt9eSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgoggAKCRARpy6gFHHX
 cgAsD/9BtP/VITx5daGbUAukC4x8UhNf2HjiPEIG4xe701hezEsLDBpKZ1c+IzEMeJJEdguVddy
 WqX29QVn52OSN87fNbeJShmUt4OUX+uHyP641t1BU/PwyboWBgRA8UL4yuXyn0iSvoJyVofhBPg
 HLAUwFbER6s608xNbJhB2RsZSQ0n/oUECRdIKQGAEzidujU3RvLR2KjJA17ptn2sFEuVnfbkjDl
 2OgWZgvSovKzapvtDWDGFE7F8m/pzGVsVjXMV9nlMQQpg3NZaEWAkkCxLO3KQw96RyUJbajTB6p
 CR3vnh6m3EASM7zVT5pH+F77o402ADtqfHrdxk0kvyjVnDDAsBApkBvMNwDP5+MfhRLL63bgALG
 DNFIweuZaY/giBznfUr2VGAC1Qa2NLu0IL/vAHrJfMIhmqGz6agzsDddV1E7RDnoSIiq5hbamQD
 f2Vda8CceiCl3bjovl85gqs5Q3GEmhidRO4nCpo2H4EFn6N9FqHiXzjkCLR4oV6jnCfKEMqjWZj
 3ZVTRvPBQPUMYAr5BZUeHfGDQuyIA5Y3JOPc6y/q+E1E6lZKHKiUPeR0oqND8LxoGmYuEmN2kP5
 TQFpQGLzr5EAU+RmQ4wxtWRCg9LtYA0ejx9NlpYNz0RdVnjuXqoWg1mHyKzYJTCg10d4jyw9L+2
 DxXu6P2U6w0DUDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/usb/serial/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      USB: serial: ftdi_sio: use new GPIO line value setter callbacks
      USB: serial: cp210x: use new GPIO line value setter callbacks

 drivers/usb/serial/cp210x.c   | 18 +++++++-----------
 drivers/usb/serial/ftdi_sio.c | 18 ++++++++++++------
 2 files changed, 19 insertions(+), 17 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-gpiochip-set-rv-usb-serial-4f4d4cc2d5ef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



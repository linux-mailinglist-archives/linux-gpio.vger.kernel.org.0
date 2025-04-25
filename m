Return-Path: <linux-gpio+bounces-19303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B56A9C2FC
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3802A3A6EF1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E5D23817E;
	Fri, 25 Apr 2025 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NTw7tmXE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C9B238177
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572116; cv=none; b=Oft5+GGaaKMiPS7G/H7qpfbzyKXY/BMC7gAxCc8LtB2lTSnJx0eRo779Pp3+YMj+nILtG8UE0NnOMUpTfyf7OHEO5t7LmHL8t/qVqfcncSffjEJBgT3qEVsvhgXmB8c/dXxTTJ7lxQoQk26KEPYpF9cm/KivLslbDwIIR4CNL/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572116; c=relaxed/simple;
	bh=ANj/MbrvQHKDnhB3vQX1T2MkVCMk0PmRafR6TVspNQw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FrPMdReDMYUDvZeEFFtqm30GFKowSDhEO6DN6Sqaf5a2QYXChWryh286ydxP1i21KDyrOHgZR6gibd7j1wOVa8uNogR/62zl4HBQwitlFlzLRCnNvaWnwU7Bsg7Jz6XeCpejThAriKyRGwvs4lYhrLWs2a8zsdGH9z5sBA+/b+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NTw7tmXE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso2136345f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 02:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572113; x=1746176913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKCVt8cqZa4daExvvFC4VJJQ68THbR+BkiDSHCicFkU=;
        b=NTw7tmXE2wjXeDaSdBxUFuGYpd5nnzZwkDrZSGOpQsXRo+HQ5MxU53XTlueX5ZN30o
         SKV3ekvY316NKQEQfJA9ccSZvkH+Mnt4HoZU7a4kp3nCv9cmNy2Wk2789Y/2V5uUhsYt
         ZCfniY/lcnDfqeJl/DDKRLBRWU4B9qdp8aIln04wZSaGz6Mz47BsXw9uPsON39sMP3D1
         PwdAbYlFZ58hi5m6PfXqwW3GqzNHcfrfEZoPPFGajtuA0cX0ChnyOKmM+1k/eSi/4pgo
         TIDCVZ+QC8vRvrPuvCSGGbfKLNtU/OKwNv5DswnWG9o9AbxsQayDJ1ravu0EKUoAL3Tl
         u/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572113; x=1746176913;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKCVt8cqZa4daExvvFC4VJJQ68THbR+BkiDSHCicFkU=;
        b=VGHQlYqJR7FeA066ohRlM9dBTRo5rCThxI63aZ+Su9EXf6aFji29jRFtp9mw4Yd5gR
         0hor26eDLMjUub5I6bfJVeXj47LNUOrOI5mTxskYdYaoDHE9LK6lRG3ZgSlpjg2ArLUq
         VEpaIsBkjUlPD/bdZT2+wF0OXRrXtFMTZDpB0yoecdAhHI0kOzgY/mWCF4WfK189LKtA
         EbaCFzp/xrK85EolNLZmLHjMIB0/9sQ3FfivCzuXUS8JOQLNepdML6TQff0K8YcpYNZ8
         +1fvfODOdDDjGX9QpUoJlt/vBOoZSMkE48OhF//11fXGQZiUEV/UomMDHzEfTj4K7Cob
         lCMA==
X-Forwarded-Encrypted: i=1; AJvYcCXEW8Bu8XsfM2IGsSqwFJTahIgP615rhJBA6mxBOWRId0hhxaFabKBgzIdMZSXjCOcCNmJF9q//Pgdc@vger.kernel.org
X-Gm-Message-State: AOJu0YwF7Wgb/jZKUZ3+fMkiWLaU6YiKQUhc398ZAT8M5IDqiLuGFwXw
	/dD8hIwBAta6K8cBtvHj67GJDj6OFlXrsrpHxollEZkAjHINwsqubq+ncGDnJkQ=
X-Gm-Gg: ASbGncvATl9jSHGXqq83ZlHvKvqTswiCWyJelGSE0fVvaA+O55VF21eOWr8lJoWrqWY
	jisXnvU5vUKSOsHoDuzA+LPFqc99Oi/JxYuprM22tlo6YYreIdYd7GzUuZkXjE2kHK8g46oAoco
	5ijhFd+SY/vWxu3sk+YgmXFOrFOXvzaC2pVLv/tuFuSYe4wj/A5HkeMvwTmOtcXTwC0uZZH93O0
	L3IaDuOUF6jU3PhSwR9ytaPaQMliG0DqFl5rbUqTjA9ZO6HpZliV+MRwoEpfMveCrOjvkkP+TVV
	3HNke3OkjCG9LXQnv+Id7XBlHG/evgo78cX+AGMQO+me
X-Google-Smtp-Source: AGHT+IFhCd5BPYZFIfYD16hI1BlRwFfgX60D/xCeQ4EZ5iaoUDIXJctfJLdM9miyeVLK+SKr/8t4cA==
X-Received: by 2002:a5d:6da5:0:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-3a074e14995mr1200520f8f.5.1745572113504;
        Fri, 25 Apr 2025 02:08:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] pinctrl: bcm: convert GPIO chips to using new value
 setters
Date: Fri, 25 Apr 2025 11:08:28 +0200
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAxRC2gC/x3MMQqAMAwAwK9IZgO1WAe/Ig41Rg1oLamIUPy7x
 fGWy5BYhRP0VQblW5KcoaCpK6DNh5VR5mKwxjrTWodrlJM2iZj4Qr0xSqBLd5zowM52TM77loy
 HMkTlRZ5/H8b3/QCF1mfQbQAAAA==
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=987;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ANj/MbrvQHKDnhB3vQX1T2MkVCMk0PmRafR6TVspNQw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EOgR8kZf+AgOsBpF3vuYSeKM2l0AU4Iiv2f
 y4AuAkbP/+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDgAKCRARpy6gFHHX
 ck+uD/9RfuF65/qkAGF1taXgtmW7kgM2w55txdgGadXpYy9Ue44TYkv8VgdzBvcotGQmizJcOMz
 OGj0QdPsNe2XKRDD+NZ3G6pO7MDOFDQyPu/NEmUFOOaP7GWIGWtX5sVfma+0bK+mDL9PZqIPu+C
 +FAPEiVqrYz/7QPBZtcWpNf7ridhw/VYqYNvIrTAMMkEvw2o9RwkQIBqchw3uEIaFNlIAoxy7cD
 NTSiH4LhqxhGw1zJYmdxtHy6wsxprQH6HWGRorlYwsjXAo3yy2KSJbetN1DDi6kDzBRJneREu0p
 5dYzlTzm2TJVoPj2Fdd/rbvmLsBIRuTu9FkNgWoYNhiAt7AMNyTzmFlyUHTX1gKCJyN3iZdsISg
 S+a8JavpGW3DMnrFRnax0pVFDhWPDhR7OIQv115lXmOmmXkZjX/QiTfZfZKDeFY0MxMAyZO/n+5
 nsen5anTT5xGlM02QaYxi/m7/1yZV8CQFTJOaXetm4JwPCia2KiRJ4PZFw/poFQ5qRwFI0mBLYJ
 QwRV63tyryAxtd4Qr4TYOvONarpe5ARr+iOWWh2qxpJQwNCNr8nb9mR2D2bfF2uyvVaOBWG4Uw/
 bKUVTJZkI2ioduc1Ii7UN1UydDR3osnRLXVmVPaS/4VIcosXsBY+Dzu60v9/mfBEq/SbSiJMIBj
 WXihIq7NcwrwYWQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the broadcom pinctrl GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      pinctrl: bcm: nsp-gpio: use new GPIO line value setter callbacks
      pinctrl: bcm: iproc-gpio: use new GPIO line value setter callbacks
      pinctrl: bcm2835: use new GPIO line value setter callbacks

 drivers/pinctrl/bcm/pinctrl-bcm2835.c    | 9 ++++++---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 6 ++++--
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c   | 6 ++++--
 3 files changed, 14 insertions(+), 7 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-gpiochip-set-rv-pinctrl-bcm-626ec5aa4c0a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



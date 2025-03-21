Return-Path: <linux-gpio+bounces-17864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D90B0A6BEAB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 16:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 277AD3B5224
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 15:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2D01E5713;
	Fri, 21 Mar 2025 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NF+vJLTI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC034A00
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572190; cv=none; b=KcMQIUvB6FABeP3Mfwfjra2uZ9SL/oysmj0ohJnCY/Io5uQWvbVQ5RtwHs2XgEVp2+IHfPANYesO3bMRlqUK+cQZI29fHceREHmvTUnQRIOXo1BUSWuhLyjtxbpLWs/OI+oIVu5gck8HZUC06aR9NuaqGoCF3ZSoDYxlLteQC3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572190; c=relaxed/simple;
	bh=HR4MOYYeEi4/YtAUlDN+xlXtMWKtoiz1VBuYe7LhgoE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bwNes2MVePFUzHPAIQlfpE3Ash34wm1ZAeJJXt8XREVzQ/DiERh3yPThTHHGu6aaA8AwxQ/RDH9A4CusAJC5KTodaTeWXw6DUHTjhAGbTUG/n875RwRUMxZY5MiyEUuvT1UK2Rg6AmAaknZw1BVzDPwkjnpkt8+MYJpX8S3gLRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NF+vJLTI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3997205e43eso1746610f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742572187; x=1743176987; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecrDTLYDxGgNhNzRTNm3evCjq50/ZrIXNStDXAwPg6M=;
        b=NF+vJLTIItFdmriITSc1+gi5aVo05aExGTzbuq9485OK4aSlAGL9TnAShH1z9d4hwm
         lXkFfw37hoSLC+JNfXo/7LwfTK3sWADmZAuRRO2Z7pqZ4pHgsr5BnIXvM4l2dKIDwz72
         qUJSm6PmheRb2xFY2tjiWkvjW48bFIVIBlYraf37D6+uJVy+U8PMT/WZgnmLKvAsLeNs
         7Qdyh9plwfnSIVSTlOjBUHgyLoV1LG99rjRNsJi8yRb5Ww9BoFn03a9SBpi9BwnkdfnM
         Udue9jJkAyeCkibnfOrLASc2jRCpQF7JkkbuhSnZdous/GbuGfNg4TxrnruskhbbMJEm
         4gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572187; x=1743176987;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecrDTLYDxGgNhNzRTNm3evCjq50/ZrIXNStDXAwPg6M=;
        b=mldBFIM3W2jdXsOOkLC5MWBexNsoUzYbL665ChcdeUzSJg2CHVnikBhoFzvMlrUYoZ
         geFWV2qmvNBQpVXDgHiO5xUpXFfvGGopvV/jwq19nZ1T4y9RZ8MJnIfepyrKH6PqiZrn
         H8rha/VqvpoJokzWdbez6gV1vZwbnLhCboFUXr0N29CFltjKA+ZVhbX05S581/8OwvAF
         OKUA+gShwEtj4Divgoe5bjNAayP6fzcdvwzNZQqA3Yt+eeHMqxGH71QLyk9DMVj51Gon
         NooncJWssX4ZtSvKvLP94xsXMOAkk3kSE2Dypz+pIKO9h73hYJiiXynaACxTKktfDt6v
         Ov5g==
X-Gm-Message-State: AOJu0YxKk0T2Uc2g2DrYEqIBJ2QxaxK4mrdW3EQgqR/AHKN7CqX12OUF
	KGZ8W6CQnj+7wjM3gmVZqEeWrlMxCFmLY58u2PAz9UYOoJ/epTiWmTCAsDfpMs8=
X-Gm-Gg: ASbGncsbem4NZJ5m8tFOHr46up6SH29L7dM7gwbgAqkVgMoU1jNznMYidD17leX2V3+
	0ZnMuVjXh1ROxe9/a6ZiKTrfocLlmzwh6PqzAUWl2KN3e41jfEQriO9qCRTbbsUK5hu3V3sU6uJ
	DyrM+LQgC9dUjrJikrsZVwJIxPQK/DzwnT0UHh0nISNH5abUPRWRwGyW81ICZRrBqh73CJXZvF4
	qj3TIf1xO1y+F2fOgOMuyI2BVVpD/VZy+LJrAs/j6nfcQ3T8m5acrd2na/n4ndlP+JZLux/HRz9
	82QFEDegy7mo3yCJmvvpy3lzNK7hODipN9KLTw==
X-Google-Smtp-Source: AGHT+IEiBDLKuJPqm3653bNhiZEd8FfHn9OjwciSqLyeyuoAQ239gy/UgKfYCMoxrL2j4dDK2e/q7g==
X-Received: by 2002:a05:6000:2a6:b0:391:2c67:7999 with SMTP id ffacd0b85a97d-3997f9404aemr4348746f8f.48.1742572186779;
        Fri, 21 Mar 2025 08:49:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1aa4:f3ec:847a:32d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b4bsm2664406f8f.25.2025.03.21.08.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:49:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/6] gpio: update the TODO list
Date: Fri, 21 Mar 2025 16:49:32 +0100
Message-Id: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyK3WcC/x3MMQqAMAxA0atIZgNt1A5eRRyKiZqlLa2KIN7d4
 viG/x8oklUKjM0DWS4tGkOFbRtYdh82QeVqIEOD6cjiljTiETnimdgfUpB7v7qO2FlyULuUZdX
 7f07z+35eTlDLYwAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=889;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HR4MOYYeEi4/YtAUlDN+xlXtMWKtoiz1VBuYe7LhgoE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn3YqV5R1Yax9J6jI06F6hn74zcE+qdNhcjL+6C
 ypmE0EqvRiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ92KlQAKCRARpy6gFHHX
 cqQCD/9q70My7TckdtfgVNjjvKeL1DiMvfT1Giq49GvUWwaQL7vM7F45ZMl3mLW8L0Z1LAnDYJT
 7fNs1lJR0rffZDJwo4fZdoOvblQpUH/BHd7b32UWPi/OcQRfteS2Fx9/kXCZ0v6ooP3bpCvX10x
 0+vthgfH7yTxYUyW2OrKl1ntrnZilJXBU+b/vclHZYkSKx1FUnEFMumocX8cwoEpqFtcOQAQUax
 r5xHWR6anSsf0qwRWG1axHOg2evxld7Vjv2ZGs+xBwtmszmxBpO3N6faVK1StRTJF3B4DrDItuv
 vqhO+UlpSnjY6pgOTLgDeWAvtdL4EhJb2l/YSXg32g7doxSvIBe3lmajkV7Uh4+rS7ih+p1Z9ex
 p8Rpy20xd0DXt5QssNhd9eCucgMjn69dD8eYQyi4F5xgB4ya/47mAip7dMrvMOUA0hL1ovOgpi9
 Rp8bbe7jQ60ZpV04/o1slP7Rolo9m0rDN62X6c3TPGMiVBSFrdrbQx7R5QMG+HcYqdqpGvlWlNf
 VexUUepSncV1jH5b23xCpbjMLjaCaioMM4ZXQtT7+uMZgxcj/kPr+A+EDMz5EArWHL8r1HgzLYY
 mPpsCCngRS0cj5sKAO9a8mUbSMdEfOrHDDDIqA3ID/VvdV9y33lIfQgQHRP2268w92D6nCwe+7L
 /cIm0GBYJx9vBMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Here are a couple proposed updates to the TODO file for your
consideration.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (6):
      gpio: TODO: remove the item about the new debugfs interface
      gpio: TODO: remove task duplication
      gpio: TODO: remove the pinctrl integration task
      gpio: TODO: add delimiters between tasks for better readability
      gpio: TODO: add an item to track the conversion to the new value setters
      gpio: TODO: add an item to track reworking the sysfs interface

 drivers/gpio/TODO | 89 +++++++++++++++++++++----------------------------------
 1 file changed, 33 insertions(+), 56 deletions(-)
---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250321-gpio-todo-updates-d4af632d6126

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



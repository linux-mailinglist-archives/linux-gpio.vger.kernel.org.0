Return-Path: <linux-gpio+bounces-12134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989639B1851
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 14:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B87A01C20C5A
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 12:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100A41D61B9;
	Sat, 26 Oct 2024 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LgdARNLy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B82B641
	for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729947520; cv=none; b=RmPWJvK34P0bB+vM898ndTIpoe9BYaJNuIWq5W9SF3uvpm8H5vTfBGYGH+ByD7EOHVONiCqCIQoyajafGil7PTl10C+uz+sPfrCwmgt7ky5yhHRfXEllzvJl4K9BBrs5alIl0KUA7dv3n2kGDSAq7FjaeaRMlDAHTeU1Aj7iNlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729947520; c=relaxed/simple;
	bh=LN3ztd1AdBfZmL5Es/y83++2ekRYr42bJFDWQaySwmU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rqafn3PNJX8j7DCApbw1IkR4YyWp9c4nqYviMincaBPi0tI3Ivs8XYw0RT5kPrwYg3xn6OBMcfn1/OYS5eW0cV6d638vwkvOwnGWgZE2U3O1cO3y019BHohOcGdRr2NQv+1L8qdE/g7K7ymoVvxvor+wcL7spOKm3pY0sumMRVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LgdARNLy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315eac969aso19774875e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729947517; x=1730552317; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fV7GHtiMbguKbqgTn7VM6KISPuTz2G39nKTBY6jvHcA=;
        b=LgdARNLyKhgzLm4mH1suNE6VU6vetj/kj51KNcDxXXXs/XMuAxu/mf7QIHjhaCkNDB
         wU9Ca9uDys1DTko9RWCxRDTwBPKtfe/j1iBQlRvVKSVFtOcDx3C2kdqP8cGypIRjepCW
         vrs6yJGPS1h9TfIBG5Ixcza66HC4WHv6z/q300g1/LiIMFPBL3euh9ULPCjUV8glElug
         6u0L2+O4RLyuZLLPyy/IecarU8P1MjmgTKRfNeLNiWB1Xh2ErJXEUV6k+oZoFKjJXXAm
         txkpYjIpdQiA9Fm8nwzMfcyxY/zMZRjqk7ccSnSXjKehmyKHv6N0FmriCNj6+NgMcvFa
         C1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729947517; x=1730552317;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV7GHtiMbguKbqgTn7VM6KISPuTz2G39nKTBY6jvHcA=;
        b=VjGgiGjo1kUUw5lQnUAjXbnopbzY5Maqi99Te1RpP4/LdDbIsy7vpAp3P5BBH+yaWf
         H7HgS7m3ztz8eiNNQyEJ3ZSob6Z0Gbg4IESxN+fWYKFu2xskq6MISgkhGvd2XLyz1xeZ
         TXSQCInxof1Jbtz2sRWIOEYUSqIfA7gz/Ct/zkxKae7GQNI6MQh+eSmNju3BY7thnmkw
         OU0hHLnZ8FP2hrqxaNRLL0+uLZHyOG3NuqBbavSMiGRLPti+nGK3BhtDU5BRObl9SuU5
         ifc6mYmUoFrRUfOV2pepG0gKHE2IG3z9LFt3RKaBRC32DxRuoRRgJBSJDrWEgbW2NIx7
         g8Jw==
X-Gm-Message-State: AOJu0YwuMDwOJeMRdwcZrYpZIVK8sRUCHzik6RZop5dHm75TZpRuzreA
	SF/euMvGv1OVhQHxBKe7N8fuK3s8pWB8qWGVNxVP8JFcy4BJYYzTHCqk3YlgTgE=
X-Google-Smtp-Source: AGHT+IFiz4g50uD4V/P8EpBdgSxIHN3P97CCyHae2ZCzG5QWxTHtDQqU019ZcLz9N4L/3LZYy5kD7A==
X-Received: by 2002:a05:600c:45c3:b0:431:55af:a220 with SMTP id 5b1f17b1804b1-4319a5bbffemr20887505e9.12.1729947516483;
        Sat, 26 Oct 2024 05:58:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:617b:5770:df34:27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a3edasm47498535e9.22.2024.10.26.05.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 05:58:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 0/5] gpio: sysfs: send character device notifications
 for sysfs class events
Date: Sat, 26 Oct 2024 14:58:28 +0200
Message-Id: <20241026-gpio-notify-sysfs-v3-0-ad8f127d12f5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHTnHGcC/23NTQqDMBCG4auUrJuSH63aVe9RujBmogMlkYyEi
 nj3RqHQgsv3g3lmYQQRgdjttLAICQmDz6HPJ9YNre+Bo83NlFCFFErxfsTAfZjQzZxmcsS1sdY
 10HVt41i+GyM4fO/m45l7QJpCnPcXSW7rVysOtCS54E0tnaoqDVVd3l/o2xguIfZs45L6JcojQ
 mWiNFYaaYTRcP0j1nX9AOq4JA72AAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LN3ztd1AdBfZmL5Es/y83++2ekRYr42bJFDWQaySwmU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnHOd5Nb2Tua7BbUnN339ltfzLoBCRAhEm0aUTJ
 XoWfWCCYNWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxzneQAKCRARpy6gFHHX
 cl7aD/91DzZ9+M9BQxV3SJknF9bSeZuDhP7jhA4RvVZsHYbWT2Q+RChubU2L3UFWNFQ9XiqW97A
 TnDc2sudmZB4n+0GdMgIczyyz+0mViW4aqwZWGDJTWALcOUId5yhbyDe0Ks+Rv+kQGxFWtQY8/d
 7PuWzkPrU5EdfMDepuYNlUXhVUPHR2GIcI0z20HGllrEPEHTcCfXe8g2jfyK2AYmi7D6miwjVfz
 fa8qUvQ8Q1CoMog6hifWLtjrtpLy3crDbcvI1noHHhiEVNx+qNmDVjWXuYhABBt/wzUdJXlmjBR
 7ANLcB89RcIjMOIUlfuKhFEgiEvC3p8RLfMRIbLWQaTk1MkmyEIpNvglk87oZYFuGAqENstr6CV
 +kTgoW1sbPfbFdBWBnunTZnf1ZDDYVU9ep3Q4EV7qKKO2YzFPzEfHU9lFW4WLiA8d50U4KqbVW6
 y+3Ed6rKXshAmVnzDxarW6lYPmM70ZKTfsQZ6tHPgJMF8BulUpgjw2Bli7BIdhDodP9BnOZInHK
 2QkkSmHnNO+z0SHvj1nFbvBFrttDbeDtlghkUGTSeGAY5G8qCFBW9eAGXbfoM5hotZOBd5bJWH+
 XvPQuwq/5z4sbBNZTlfpVdiNTxHnCOEVTAZf8po73/TwpNvX8MARuZ9+kSEyETl10SDYSuTGQn+
 ca62xa9k1ZQGDEA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This may be a total corner-case but for consistency and completeness I
think it makes sense to also send out line state change events on actions
triggered from the GPIO sysfs class.

The first two patches use cleanup helpers in sysfs code. The next three
change the code to emit notifications on line export (unexport is
already handled) and active_low & edge changes.

One last thing I considered was also notifying user-space whenever
gpiochip_un/lock_as_irq() is called but that doesn't make much sense as
it's largely independent from the GPIO core and can be called for both
requested and available lines whenever someone requests an interrupt
from a GPIO controller.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- Keep the unusual order of operations in value_store()
- Link to v2: https://lore.kernel.org/r/20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org

Changes in v2:
- Streamline the code even more by dropping unnecessary return code
  assignments
- use normal guards where scoped ones are overkill
- Link to v1: https://lore.kernel.org/r/20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org

---
Bartosz Golaszewski (5):
      gpio: sysfs: use cleanup guards for gpiod_data::mutex
      gpio: sysfs: use cleanup guards for the sysfs_lock mutex
      gpio: sysfs: emit chardev line-state events on GPIO export
      gpio: sysfs: emit chardev line-state events on active-low changes
      gpio: sysfs: emit chardev line-state events on edge store

 drivers/gpio/gpiolib-sysfs.c | 170 +++++++++++++++++++------------------------
 1 file changed, 76 insertions(+), 94 deletions(-)
---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241022-gpio-notify-sysfs-3bddf9ecca9f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



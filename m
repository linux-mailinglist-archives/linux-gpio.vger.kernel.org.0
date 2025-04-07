Return-Path: <linux-gpio+bounces-18275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2DA7D524
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0254F1721F0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1B3225766;
	Mon,  7 Apr 2025 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ipQNJku+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA77154C0D
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009999; cv=none; b=E1zB7RMNcmxBQJurYrcFOvgZUueLc+3ywbNgQKVR8B09Ecg4tF7RhCMVyJq8O9rcbjm9+HYkn2ywDAjkaZAgdUT2fBaDXCwkfaKMJ1wEWsDvc0r30SwhNRJ/AXVsxM5Gq8nH5mZdYZwRZW0aJ3nFYpKa827W/XonFdmu8UMQ9Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009999; c=relaxed/simple;
	bh=Vnmdn+t6Y86VbAYLc7RRQLvehxl5oFgmisxSEqZIS64=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BAi5ExJtVChEU/DsGd2taxR0bWvw2kGyNXzSvD3PDb81KihCMiRODuQtuP5fNmJz/YfQPWedr+TLHayFrn6uJZEZAk8lB99PAldBp9m7ASlTVHRFHKwPIHnEmAEO+cdU9NUJpY7ZBg3dwRKOSswB5sI7kR55Vl1QCjPJ0ldADY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ipQNJku+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so25580595e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009995; x=1744614795; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DwRGUdBr91mhQGW8nyMNUWbYU6PKuo4GJaBq0sbsH9w=;
        b=ipQNJku+BTX+3dZBelRRqXhmKU3D29aESTmkB+Xf60PohSmlaahpeTsi++e7qbntrR
         H/IbKAKLWy3OVpm1Pi3scKhFwrQXJ8cSjYTJ8E9tnONqbCMmVflfkbR4/stGKW/AD1KF
         86+QBCvyuVoan1UGtsOHs/+f2n+tW7YTuUY/IOwDcDDf0J3eUkwCVqhFsjZuBdNW9o5a
         YvutxlurFCOQRX3eoKV3nRfrD9bJAkKS2bs7+s66n9hYpdqRHRdw3NRlBAv+UYZXaAE7
         idb3I6xEBlI2swgeOjB7PaiY83ZUeZBnbwBHP5lfXgpx4ox0Ac60nttjJIThjNpc5bzR
         Ugkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009995; x=1744614795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwRGUdBr91mhQGW8nyMNUWbYU6PKuo4GJaBq0sbsH9w=;
        b=pQIXJxho8JgeRJT03zvLoybHCT2bkurAPOPr7NmTvlpj57/63oPzMFJgzEBalt16u4
         oujqo+HZN4ZZy3uWonK4gEpVM49delNeA8XjxPsgNl+dIWpLRD9EIxhB8tg/tTugd1Xi
         RnB88OszBXf4lb97EMn+p3eC19A2ZyWXJOYGzI28kHg2Wsfn9NBQxYHPrp1wgGtgfaEQ
         FBbDDiOr7sRVIdBG2JEhEMeTUJc9aumsBnGrNQbvyOzukQe+RxreEIm+W3oHHFZUBWZB
         arEudVp1LTvhqo6W6LGaMDzL6xsrR91NAhHRksHdG8xCkYvECFhX4xanmhsrNXutXlLA
         tpQA==
X-Gm-Message-State: AOJu0YyrX7XhbVZ7FhGuFeD3jSWPKt+QJTwYD+uC8GZ3W9hXXe/ERLSS
	Rt/4PHMxw1WKpTbEowqn9GCA03sq0NDiNzm2hQ49FmaOlOShmlfSrH8msgycOyU=
X-Gm-Gg: ASbGncucewJ7mCkZA37cPPY4nSyICkUiwRbszDxaaTESjKG1MEGEc8/4y6y6wly8n9Y
	/osMgKH8e7U2GSTEO3KMhQGroaEkmvinSI8zz1HNpxdgJQWzK66sCaAnLs1rrpTioFjHe5dEMwh
	Dd8CAqL6vNMetSjhg8AQ6InXxkS9l1rWaCqo/yTT2liwQeJ33IHO9SePqaVV33jKfTYXVSNIeoV
	RvmxT0yaew86NeAVavUAObbvi2pLbxEvKHofAXxDjNnPTTIrEcYYxtJPtm5ONV5eYES+j0yFHqE
	SjbFScQWUqZBKm068lyJRsTQOF88PKFqQkWsjA==
X-Google-Smtp-Source: AGHT+IE9hjus+hIwOldnijWlMq7DvTnBnFi83roQoF6Htti4CPEQrMeidZeYK1mSABv6+4odr98X+w==
X-Received: by 2002:a05:600c:3494:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43ed0bc8d96mr106130405e9.9.1744009995330;
        Mon, 07 Apr 2025 00:13:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters
Date: Mon, 07 Apr 2025 09:13:09 +0200
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAV782cC/x3MOwqAMAwA0KtIZgO14gevIg61JpqlllREkN7d4
 viW90IiFUowVS8o3ZLkDAVNXYE/XNgJZSsGa2xnWtvjHuX0h0RMdKHevzE6vRpk3nhw3I+uXaE
 EUYnl+fN5yfkDjFSWHGwAAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Vnmdn+t6Y86VbAYLc7RRQLvehxl5oFgmisxSEqZIS64=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sHXukWy51PN9Cxj44kY7ojJhQrg47v1B1Sd
 xjtwIStWiGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7BwAKCRARpy6gFHHX
 cnYaD/0Z3DWw6u8DY27fQeeMUJV3zej2Ex03jd+DfiC9T0gq8fhFgrxYlVtoJ8rvHB19cBBTRhB
 QpOz6380d22E9MJHpEzCNi/xrT6Fal02NWBztIROVeHbo73SJ5TucK36qxQVUzvc2RB3gs2YeRM
 AV939PCtbvVnCTBjbZcwyEb9u56EuVKz7dIzkulBtpCm3KOblTYtPSVUAg9qrf9yIIptdiy3Fqo
 YEO+Hf2QImUzhag+AXPbUmhvgWMbLpab3Fi7Lyjtx+HYCxtxqmCBl6yAtKzim9QM/YQGTIbKXE6
 44T+p2RGx09wo4ptLo6hFX+6lnEyux2kTzPpQBbPm1cKB9vjqtR6MYseqq8pxZVBF6XvOtfqYYW
 CKa7fU+X5y4y3aS3tgTAbb5xCjFF/pVYJqsRgu7EKA2OLcNpolugBqmPPwydaK5QORxP2U7jWzp
 v7gxLY0PLJxMq8FVXVv4xjaEm5QJJL06ZTB2nS4bW5vyP4Aix6cGrewVPReaKbCtILY1XyajL6s
 xs3Gvhij5Jl6anYXyFJLQY3Eb2ssW8ivHGkeFBNjyKLIHDRcw0UYyr3isme90NL5HW8c3neTsHy
 12QLYAzYdhDlNAS1ODcF7/YmOVXqiuuoHPef/p0was7ecfBByESRIv6ggY0pmb18oLK1Rqc/G0A
 J+5ExBfSxPg5KuA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
another round of GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: dln2: use new line value setter callbacks
      gpio: eic-sprd: use new line value setter callbacks
      gpio: em: use new line value setter callbacks
      gpio: exar: use new line value setter callbacks
      gpio: allow building port-mapped GPIO drivers with COMPILE_TEST=y
      gpio: f7188: use new line value setter callbacks
      gpio: graniterapids: use new line value setter callbacks
      gpio: gw-pld: use new line value setter callbacks
      gpio: htc-egpio: enable building with COMPILE_TEST=y
      gpio: htc-egpio: use new line value setter callbacks
      gpio: ich: enable building with COMPILE_TEST=y
      gpio: ich: use new line value setter callbacks

 drivers/gpio/Kconfig              |  7 +++----
 drivers/gpio/gpio-dln2.c          |  7 ++++---
 drivers/gpio/gpio-eic-sprd.c      |  5 +++--
 drivers/gpio/gpio-em.c            |  6 ++++--
 drivers/gpio/gpio-exar.c          | 16 +++++++++-------
 drivers/gpio/gpio-f7188x.c        | 13 +++++++++----
 drivers/gpio/gpio-graniterapids.c |  6 +++---
 drivers/gpio/gpio-gw-pld.c        |  6 +++---
 drivers/gpio/gpio-htc-egpio.c     | 16 ++++++++--------
 drivers/gpio/gpio-ich.c           | 12 ++++++++----
 10 files changed, 54 insertions(+), 40 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-gpio-part1-ffdf7af68a3b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



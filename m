Return-Path: <linux-gpio+bounces-18645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D08EA83EE8
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735DE16B18A
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094B2267F70;
	Thu, 10 Apr 2025 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X87Ny9vt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A625E823
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277705; cv=none; b=jWpF/lXsP2v6YFnHg8IApKZxWArWYeWW8OCxavqGUZgIoJTcYJIMjPImCA3Zb3WzqpINqYgQo2+BJ65RNLsDbK6VgpSVpd8gOm5+FC25WV0kZEko5r2oJz5IguHy41A26DN1aFpBP7YfdKBt1tDbW2iEm+FpbeJ5e9J1MPhwkcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277705; c=relaxed/simple;
	bh=iFetTbmnkwguCa4GHM9J9o/edrRO2Pn6FvkE6xcKAlc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YIW2Pmm9dYnwX/hFKiW3eAwuxY7zndEgCwvCX/1VkD9eSI5j6I1nM1cO66UAcHzrTMnrxDYmIazt/5exTJ0gKnux8UjgYMMjKhovyHAiLOlQYTC8sZe3w5Fw8BOYjzMVsv9+ryGq2bxttY3FU17FRN4mH9bd7HQ9xfwgD0W3V8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X87Ny9vt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so301245f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 02:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744277701; x=1744882501; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yNJLYf4fxFOOcQnuqVuO+ood2KRbQxF3Z/iz8NCCuU=;
        b=X87Ny9vtw7Sp7ICksik6lRs7Yz8TY7l/1qyyvibEs0nK9fSV/h8rmGwA44gREwbPrw
         2VtoC/JXkVbJzz6fw6Iuo23HXdDPq6NWIXdkLzpTUkCWPMMn77IYHzLKnFzh/o35p6w+
         nHoE2f4cNMiAR9/+GIWzRLYWRjkl4YOya/P3rcU5Fu3/5gtAYCHSNN1RAROdYLYuO3XY
         aBP8mLqPnEbl48DQFhDMOk/3YAuMc+VsC4FVummHgASCP5OnT11yygc/xIZTJcsZTklJ
         7M4PBUWzwdrfuKx4VZp7y9149bGKFrBazwJUUs4HSSnJPqWZM6AXWeGG1GWDaW6OwdfE
         oqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277701; x=1744882501;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9yNJLYf4fxFOOcQnuqVuO+ood2KRbQxF3Z/iz8NCCuU=;
        b=AYs9b96wUSPtsxYbEXZSwyS/xXehvZULjS3ZPxbEA4OEG97mRVkLVyatg6FPfIGv7b
         HjZx4y1McXDTF+r7SBYCJ/4af3TdWYow2OW4Vm7KeOFeAUpf2Agr5xskfgEqv9wrecHt
         miqe8clhHYXUK3WbtrkmhTh/RJHaIs98IwrVKJI37+wBAdvtL41n12qN+CtEzZhS+PHv
         yyHDuSmpFcrN2o/vCkIKtPNy7UVVNXqvES2s9tshKD4tTXd3BfEQMiUpf/Zz5dE2WYpj
         TFWvm/1Yj5LQNBQNqIrmm0smdkyBTdyWvbbtjxNRuW1mi0d6cGXoz1lCCnYaXqGXlRnx
         bFaw==
X-Forwarded-Encrypted: i=1; AJvYcCX/y67ZG9m18fcRPNZ0EtwdGA1yVYT4We7fUbGTAqV6M4RZ9LN8pLzeunYJccUwdm2j7eK/nxnwxQEs@vger.kernel.org
X-Gm-Message-State: AOJu0YzHSZvbQwqQWa19x8l9f9p5LvAQQheaGA9+zoNc8Gcy/SEiXg4d
	K+tO4Aa5bKX+5RLlMyyDT2zC7+Ka5yYgCRHNzpwyZrx7X5Pft6aDp+yoqDcJbbN1ekLZOQQkuKQ
	uMic=
X-Gm-Gg: ASbGncuZDjJ37K8aQYooXgy9JBfD4v7u1qNTSrY0amFzrnDCY+Kek/v8NqmQYcn11xe
	06/WXeDIsZl4uynRbPh4PbSM2Yed049V3IDxxrMt06Jd795lYDctKleHgraKmOUprUzC2rBB512
	1kV7qIr0NipjZ9yjciyjjaH5hq0/u4wsXW7Qky1GiroA1AKsYHsFByu9I7xxCbuqn9N0Ndu20Fl
	TjD7rlUuw17HYBI1W451KKfRZ4/9uRf57nsZmJKuPpTbLuFRzBJfnCN01ahmUfEx8PK75+RRNpK
	d6/RdOUvN2PtXagcgjfDWvrCtQsZjuzm1w==
X-Google-Smtp-Source: AGHT+IHB5ixa97tdLO73kQ9oNCLgZBeyh8x0B9dbm42YYzSHNmSW6/R50qbg0fTSOEFwj/jnE0FlLg==
X-Received: by 2002:a5d:5f4f:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39d8fda7660mr1549072f8f.48.1744277701487;
        Thu, 10 Apr 2025 02:35:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm49698435e9.9.2025.04.10.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:35:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/6] pinctrl: qcom: use new GPIO line value setter
 callbacks
Date: Thu, 10 Apr 2025 11:34:42 +0200
Message-Id: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALKQ92cC/x3MOwqAMAwA0KtIZgOtnw5eRRwkRg1oW1MRQby7x
 fEt74HEKpygKx5QviRJ8Bm2LIDW0S+MMmVDZarWNNbgEiXQKhETn6gXRvF06oYHhR2ZRju52dW
 uJshFVJ7l/vt+eN8PlgEpUG4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iFetTbmnkwguCa4GHM9J9o/edrRO2Pn6FvkE6xcKAlc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn95DA9DnT6CQMPCt+8x3M3vnDa/yssIFVhr2KL
 tQ3bn4dw6aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/eQwAAKCRARpy6gFHHX
 cpG+D/9DAX2PjoUZ70k9zTrEGGwA10i4py2ERkb6JOha3k3iZe/8dq5cgTStqF6mjqq5PoLuJ7Z
 gz+zKOcO8nJ9wA7zNkEXzsV7cWDfq3ZboehceyI+yRkn09drsjDawugtBmactdgS9kVcWZfi4ec
 1/qMlBG8WwifMKIAGYyO5Pp3rSxgKmd03jI+Dg9FChzwnKPic2as5VXKTJAUCMv31GT39ctT1rt
 oHgt/wTzHz68Y/HokLznyJryFvtkLIA3DvSCVnmPtDdw9e9WY0X9ZrIX09lt0Dp76773BWeZelc
 YcJA26+bar1ONANke5Ni4NHBTZ6fLSQQk6PrkqV3tFFaiblKYWusL8h5ndFCaXwt+mzHxMHmvG/
 aHXV59bJ8LHJtIGemVZekSCYSOlcZZElnDQ1Ns4Mdmrqd/Z/ao1UzWtsRX6khJAOZTzrzYw/vOC
 lg/9z1v+CraqwJFkRksHYxdYJ9CAxhBQ9NqbWM5gBKs6JhriAgqNn46Cr6Kiv2FbxI4aJENfRJD
 AVnQZmHQ4gGQqbr9JJ8OYP54ExSftQyD3fBzzqMFhXbUesTNZgvUeD775DWvR9B4ZLE0yk8JFtW
 9c19+TrcHcfK6JrUiuIvbL6sx6jEq/wILs4SvgScKI/U8Jojqa/5Buc7H6GLC1VEAPCkFNVqWBt
 xFpqhNmMvZp+CsQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. Convert all
Qualcomm pinctrl drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (6):
      pinctrl: qcom: lpass-lpi: use new GPIO line value setter callbacks
      pinctrl: qcom: msm: use new GPIO line value setter callbacks
      pinctrl: qcom: spmi-gpio: use new GPIO line value setter callbacks
      pinctrl: qcom: spmi-mpp: use new GPIO line value setter callbacks
      pinctrl: qcom: ssbi-gpio: use new GPIO line value setter callbacks
      pinctrl: qcom: ssbi-mpp: use new GPIO line value setter callbacks

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 6 +++---
 drivers/pinctrl/qcom/pinctrl-msm.c       | 6 ++++--
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 6 +++---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c  | 6 +++---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 7 ++++---
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c  | 7 ++++---
 6 files changed, 21 insertions(+), 17 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250410-gpiochip-set-rv-pinctrl-qcom-eca1d6f6363c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



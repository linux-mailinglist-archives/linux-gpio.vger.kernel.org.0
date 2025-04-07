Return-Path: <linux-gpio+bounces-18307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0410FA7D624
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 239B43B8E21
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519CF227EAB;
	Mon,  7 Apr 2025 07:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cGdGwS2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9291422618F
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010661; cv=none; b=AFLjUco7RSqkUmHZA9FMM3YWR8Wh3qyZzmKwF7dE0uuxzTR6pRksHoRd62eR+uSyA9z19FEQbHLmTm8I6u6ufqlFlVZih9nGl4hV4NANMp7+JfxTzb3ygR/SivLLU8rWF45nB5rgfEPeYclD80VrOkRd2OlxJ+OTkwHPeRuy8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010661; c=relaxed/simple;
	bh=M0PJtEGCXZR8tC03CygDMHN1EINp9WaVMWWt3MPmM5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sxhMTUn3oJMZvBJpPPvU+yBhsBTZCwNv2d7GuYIknfSdgxfM7vqrXyIswXj88GQSn0as8lTlA0QujnGY7BPMZfH01lVRtDyjfsrNiQffq5l4mdybN6EcEv7KBjr1esN0tH1oejfls0RM3KW3Wt3pCQThW28ZnO+FM/riMQyTOSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cGdGwS2f; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso25905515e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010658; x=1744615458; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=je/Myjh6UG7dMR4lYKRmbIqhb/mrZ9iSRDkEfU+kfXQ=;
        b=cGdGwS2fiS1rw+4L4wRPNpqqiLnsrIJRERj2BDgkie9TzJztH7VnseLcVKE/gvPbEi
         oQnstJqPu3iIATxg+Olqx/f9Xyzx2BBexLNGu7OEQ54uUwFmkVfOrN2QI1Dz9gP4eP4L
         eYj3ziWz3VMFtMRYTDO5c9fUzG00HrN3zFXn67ZErrGWR3JPhGO7DRYkXxfyEbPnjYqA
         7ORpzb8Ao6Bs3VmP1aIMDlWZ7D8/sy6HhBQIzCr6v14tFz7OQXtu8Fp2yjjgR3Oi4mur
         KBMWDbFEM2/BiiEvn4/9VFSuP2VN64nIc+Q1x45VYxVtTE7bxcrmeiH58OCbi4JvY16U
         3Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010658; x=1744615458;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=je/Myjh6UG7dMR4lYKRmbIqhb/mrZ9iSRDkEfU+kfXQ=;
        b=q2aBYz+oPuEFHQsItAcjuXTEGCoYFGiEEFJk9azxBLFFS7tRHIsmStN072AF9TniZm
         Vh6qldqEz4H4NqmSziFzM8iDLgugVsve1Yi1NsY63IpWNSJk6oKcw/3vaSk/asLQhZpD
         0bJ8msUuaI9HrQE5K+UBZN28sGoOoBwnnsbWPpZFTosF7L8/9ZULbmXzQIxdox5qv9gz
         bSsovALHXCOQVzyDM5f48BmjNPkcg0ssJ/lRaReGE93eKo7Qxg7Ctvsj4rI268ybP8to
         J/Ns5g2sX/cgyqbwF1kG8drkn1byENVEHRXK9OXMDZGO7AjF5eHkxJhsld2SAwOrV48R
         JRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkQnuFWkw1DY4dGyyjGTjdwLNbpBAo4ZVFZk+5oJn8PPyjGrt0dGEYKsBy5S6Uvmoqu29p6SyjA39+@vger.kernel.org
X-Gm-Message-State: AOJu0YyqgMLDcTCWVqy3sEI+gwCBuUowh3rfK0RxtlBBSMhokiHxbMbY
	LZzj/9YCI2tX7ZqjqM5ngYOndakZHOR5M0tCbJTUEm5SiiYmn4w4SrKNwuT+50g=
X-Gm-Gg: ASbGncsCMuXV0aYm9Bcxxvws+yAzwRFYCsC5tp3S1L345nsJ5liRlM+gOWmoU+N3J8P
	ELtp3pmEgHoTn40EfiQ4vV+S7CQzxvALycu/Lrrr6E3Yr1AsaFlyOUwbCdNr546cz0o/Rj+DK1H
	QF48bm7reaxKK8mwvlu6Nl8f4CNeE0forRmaqdLspVoyFtD8lXipp8jtli7r6Ov1EuBH1Du1idn
	espOBiHG8hPA9Lqt2KXOTu9Yw53UFFTwWa/KCKWVQ73/5s09gkA9LKXgGHfMf5YJR0Nco+gZdLF
	HXg67gzvtOEMA09FYbPLYOMctjnNWYAJPEW79g==
X-Google-Smtp-Source: AGHT+IGnA7e4NHSYo/1K0kmxxLw8A3ECzBYZm0uk2HECwK3ENhC5z6LNrBPUZNtRye6CN+JFLrQWhA==
X-Received: by 2002:a05:600c:3b8b:b0:43d:7588:6699 with SMTP id 5b1f17b1804b1-43ecf81b778mr100012435e9.7.1744010657958;
        Mon, 07 Apr 2025 00:24:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf193sm119855255e9.24.2025.04.07.00.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:24:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] mfd: convert GPIO chips to using new value setters
Date: Mon, 07 Apr 2025 09:24:12 +0200
Message-Id: <20250407-gpiochip-set-rv-mfd-v1-0-43f4d86d01d1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJx982cC/x3MQQqAIBBA0avIrBswI6SuEi1ER51FJhoSRHdPW
 r7F/w9UKkwVVvFAocaVz9QxDgJsNCkQsusGJdUsJ6UxZD5t5IyVLiwND+/QSau1MYsZpYJe5kK
 e7/+67e/7AeG1U5RlAAAA
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M0PJtEGCXZR8tC03CygDMHN1EINp9WaVMWWt3MPmM5I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn832gtwvybD3/ZEhmMEyKSACmKuoM78PG4cWQW
 tftsrQ+7CaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N9oAAKCRARpy6gFHHX
 ct5ZD/0Q1fnKly/YgK/ZVWrQ7zY3y+W9KCfzjI5d8OBGjZ1iPYZKl8fdJaacyODpud8w1t2aIq4
 Hyb0Z8FG+HS3ck377p8EmvG+X+cHFYWFYNkHTEo16YWQYy38B0bRp5bctbm9djZAip4j3YOa4Ny
 Ij3R9Oj0PBm8fyYaGusRoJo+XKOFQH0V+iGj9I1iOoGG14xt+KR5rczpi3Q7QoKtcYBwaTvBNjS
 cYCANH98j9pUkJlNec14hg5eGEytEwSuf3W8WHfAIb9XmziPB856j1QJe1U2T8emQULh1DG0Gox
 6kNJFRFWXwBHzZqT1Ydthe30qOJCbdFJyR1OKSh6Abi1iVPZA3EAxt3uR4XYdSUOzw7P9njS7ZE
 OH/e7vIyNkM1LV8mwyMkQAwfGsCikVRffBKFtaZ1H3xEosiozCpjo4j0vQ7BIdkPlkrKOutN57K
 5oJuTv/V5777ry45REoXk7ji2BF704Il+6uRhirJHtMCfZb74P6i+tkyKS3gcyMqgj66RodIm+z
 aaMmGkZmC7gTCV30usr1Hy/kJ5A9Cb6h5NF7pT9xLfDQ0jswoWrdc/rQpCcM7b5HQUjVGIvb3VR
 P8dggBTNtiIs4pAIYQtYzzULsuYCiS4z/p+s1ynu9N37nh0ETJLGWPWvInFCkvKO6SaOdxRwgQN
 xU2RSA1258u2n1g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all MFD GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      mfd: sm501: use new GPIO line value setter callbacks
      mfd: tps65010: use new GPIO line value setter callbacks
      mfd: ucb1x00: use new GPIO line value setter callbacks

 drivers/mfd/sm501.c        | 7 +++++--
 drivers/mfd/tps65010.c     | 6 ++++--
 drivers/mfd/ucb1x00-core.c | 7 +++++--
 3 files changed, 14 insertions(+), 6 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250327-gpiochip-set-rv-mfd-d0c77aa9a102

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



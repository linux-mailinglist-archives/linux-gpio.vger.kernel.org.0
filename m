Return-Path: <linux-gpio+bounces-21189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27709AD36C7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 054D31763DA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E1227A907;
	Tue, 10 Jun 2025 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rt14wuuV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9689D28D85B
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558949; cv=none; b=jxvrAt2EWbsCWWFnsuoecJHmMTt+VpYgUuAY3Rhi2dQVT+ZoijhRTe3fP6OwICGmJC5ONyyZerp2msvHI6NaG906NutDmx7CkMbcggNKqFpEKSkfUVTfKuGIM+X7aVbPBU23qGoSMmJJbHlWrmGOzfLu1N4Q/rRciF8DqeegRAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558949; c=relaxed/simple;
	bh=XaC8k08wKuFc5cu7hL0wG4+KmvUx78eFAt9+qSWr15M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HQX95eeuOjn0Ic4m45fhvnx/Dzbw8ZbzKHf7qkb0Y1O4kWhZqlpdXFwS0SMr9WQXdvYOGubrQmG5ZfR6UgfJYGsehuvH0kWZu4/BHW/j19LufaLmoFMtKSmsj2Mhv/Cu43mAzM0kYYGm0J0eonmPcdCqNgGnbLI3sDQpt3uG/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rt14wuuV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so4385383f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558946; x=1750163746; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OoV+QiSos0TvqbtzN622Wepav+RyMGf3Ca7AzlVUBmE=;
        b=Rt14wuuVOx7KzZkG89HmdSDGVg46PIRSFbAZfQ0vwxlF6R4aQJauzEZK1mPupGGffS
         YjibrrHUOePpBkrYwJakojAyE9QAZ7iQZPqq16IydBy9V2T9BuzrNz+VnF8/EAghyqEH
         Jhi1gEqhoC4UaKubOksw0jNY7ubZoEZJ0/8F+Ip3akW4Nvgwx+xq4tUzbEtosTuV7GwY
         FfbxS7u5Xx5ONqY+QpNP6ZsfZa37rXYoelkGmS4VbNYPD+4048V/D3Pcycuk3bEx1Rw0
         05q60xNT3L/BdHmrDW+fsWbyPVms06fcBZzU+HIHlpd1QYSDtiEKP4qPVVUuHacZucNp
         zhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558946; x=1750163746;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoV+QiSos0TvqbtzN622Wepav+RyMGf3Ca7AzlVUBmE=;
        b=q1MOFebpH1RqG4aBCpvj7Zqko6d0OuS7m8pt2+ACgUx5O3zBldOXJGagsEJQRFDgPy
         7m11FHIe5zDzSUzdt0VQH8FwNOUcJP0GvOa+U94N+mm15R84z8nvA6f0u4PoUWjcCbWI
         IQjCrtTM0GplisPMqmDyRyR31LLnEW4TaAPRghBCorXutV621yCGaZ23Tx8n2k0VkGp3
         wpZCrGLB/SXZ5JMRvIzR/h3Qg4xFq4LnXQCs2oqIeZKj4cXtsEQkk2BpSqL3sDQwrVMP
         LUYyNVwrenRc8FKbLAlbwV8/ks9xn+YK9ADit69Itfr1kVr6LU3jL+hl+pWdi+SyJUzl
         WN4g==
X-Forwarded-Encrypted: i=1; AJvYcCWSfAJ/O9MkrAwDw3DSSu57NfRbEAsfgu5uIvSIylGwIAZ9tq73pp2C4mIna8deIiLArXVohpbsjpHS@vger.kernel.org
X-Gm-Message-State: AOJu0YwhuV21lD/B+P30F/n/h8myBid5bq/7KxbcoHBx7r/BgijNLojt
	2XDv2koNy1oUfLCQ7uEtls2LUGsqeB4ysbKC/FOixzj9Rv7l16lmMN+iWSx453uaAao=
X-Gm-Gg: ASbGncu6QORaKljUMkbUb0dXQ9NxBTH2Kip+f/AAGTbg143z1d0EF9RnMxg7is7NlUB
	wQIkhxJMT/AnVxH1tinXY2n+62gAIo0ORYL5uQnPflQCNsRZDh21U1fb2w+5t4oK+YEBbg1WmsZ
	ULDGCKERO8raQXADW+t2zAKIP1g/JbtwjBhZcT9hbkI/ReapOSwdJNbcNsjNbFgPR9Mwrq5b2zP
	YV+Gyfk7IWK6yoGtcHGeZQkNjKf6If5fOAKxVvSfkWei4K8MbtrISaGYbXG2Ul3M7FDIKXrTgxN
	IWP7soRtXfrMTvx9WTGwrY/+4IG3DV29nAm9yEBjoMkGRfLew3HlRA==
X-Google-Smtp-Source: AGHT+IHyzowAa0FHq/zfDL+blwKiEmXcXgh3Jrov3Hpokl1FWHbRPFr2MHWcU4cplAuWB++u3cF7fA==
X-Received: by 2002:a05:6000:40df:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3a55226cffbmr2048191f8f.2.1749558945951;
        Tue, 10 Jun 2025 05:35:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:35:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/7] media: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:35:34 +0200
Message-Id: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcmSGgC/x3MQQqAIBBA0avErBtQw6iuEi0kR51FJhoRhHdPW
 r7F/y8UykwFlu6FTDcXPmOD7DvYg4mekG0zKKG00EqhT3zugRMWujDfeJBlgzRIYfQsp2F00Nq
 UyfHzf9et1g88ALqgZwAAAA==
X-Change-ID: 20250522-gpiochip-set-rv-media-e310a591836f
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XaC8k08wKuFc5cu7hL0wG4+KmvUx78eFAt9+qSWr15M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCacaLCWCUkE3ZTdI5lxLU+QwSnfr/b+UlY2V
 oDGQ5GGWrGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnAAKCRARpy6gFHHX
 cjKcD/9avb5mQZSOcedwlswOS5ItaCs+WD2JFekxWWMdY4rW8ZZCT9Lv2Kbnn9qfggVZLlNLfPT
 SzZKVLPnobqL3E4luG+W6PZSRfv2CoIvDS3AAr9GaqGfEbnRfb6MoQKPnb2OsSzumEXY2eVut8V
 qv6rOPTt5l04Hxftw5/A9dGLhIxekPEBJGi+VUPAYhs1QDetTJdlsIPE04ND1FRFitkfWZIpdQM
 chWdabY6Qw7HA0SC3Czm+LsU812bnFckizTkI4LmRIO282AtSZ+DK+GicsVMStOClqXp3BgF2pe
 ijEZE+rDJpAPjSYOnaXUW32vbieN4ldfU4izh615CqETJqgsFMET4S5McHNMq+O01UaIjTO1rfl
 1iOuoxdjZzxb7eNoxc1HWI/uBEIMRI/P4HlNNH/+sZ4UTpVFfC8sW9wFKhuYcObKx+RP5ihYoT6
 vLcacCKgucrMvbStackXeQN23qVhPzsINeKmCBjoPTEEo4WpRMB4c5nFVYb7TryhJBDwxhfe8cv
 y0IB++XSmC0e/JRYMAm6hHUUuH9uxdYsT4eyAXXJ4TJ4xxwUvUDKtGoDLZqgxn0Nkvl83wataRI
 J6WFMXcfXJuj1KTruof42g9huZls85Wcuqp7iL2PtE6K74GFv94uOEfsPc2pQYGAmukFs+1vwC/
 k86DhjG9pRx94sA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/media/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (7):
      media: dvb-frontends/cxd2820r: use new GPIO line value setter callbacks
      media: solo6x10: remove unneeded GPIO direction setters
      media: solo6x10: use new GPIO line value setter callbacks
      media: i2c: ds90ub953: use new GPIO line value setter callbacks
      media: i2c: ds90ub913: use new GPIO line value setter callbacks
      media: i2c: max96717: use new GPIO line value setter callbacks
      media: i2c: max9286: use new GPIO line value setter callbacks

 drivers/media/dvb-frontends/cxd2820r_core.c |  6 +++---
 drivers/media/i2c/ds90ub913.c               |  6 +++---
 drivers/media/i2c/ds90ub953.c               | 11 +++++------
 drivers/media/i2c/max9286.c                 |  8 ++++----
 drivers/media/i2c/max96717.c                | 10 +++++-----
 drivers/media/pci/solo6x10/solo6x10-gpio.c  | 20 ++++----------------
 6 files changed, 24 insertions(+), 37 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250522-gpiochip-set-rv-media-e310a591836f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



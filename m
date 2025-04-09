Return-Path: <linux-gpio+bounces-18565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE77A826D7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 15:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0D8519E7C76
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 13:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BA3263C84;
	Wed,  9 Apr 2025 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dHlXrdwz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E29241CAF
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207098; cv=none; b=bOdmZmD7N7Wri2YGLX81Rqayeyl/NXrP2CCqNLY38RBXU2O75RVnIr7M8dG/1urf3XJRyeZRotQrfImYGsWS+HZYxQkxWjD51GyJDg3FQZeCFHerweJZwyjiQ+WW7AKH2ijeRWbLreKY/P56MxY+gsNWe7nvYGlKgARNCtGtCi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207098; c=relaxed/simple;
	bh=4wiG1oWsFDNXV9hkIUq/KfIYAJEAjN3PQIPKRD55XsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RFlo43US86O/D1CJPDmSY9dkSiB4f93wA68CXnmkfXU6iozpw8EnnLtKhhQEkTQvQ0KUIAphL68Hrn70tIjdcWNUOjG8E+wFkuI9uzPrWh/8q6S0bBXjoxNFIPoijQTktek1tctbJ24kjBhQWjQBDEm7lx/YmP6mg3Uoa2SV8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dHlXrdwz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso35514795e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744207093; x=1744811893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqNDGbtGLo2t+c/K/+WxlFYfgefVNdcRkPfKSN2QwBU=;
        b=dHlXrdwzjercwMVdpSmXID0fO6ArYPCEEeF4ZyCT7iP6Yr8c72Ya6u2XrWLDoilLvT
         FxiMJAYaTocj/0qbVqrjNbhnR4GRr3gLtmpZqJQCihGU97z6al1JKJvZEQ0ttp4XbreX
         Fq398AC1RvQaMo+aZzGQuGRhT1IUlNI5HLfsluqI51i2yisNHNY9puQ+AfRqDdaLF8Q8
         df/gTa0kQRB34Dm7AmjKgizCCjSpMhidE9rdFV1yG6Wjkn+GVNdsENDaUZnd/beK3T9A
         7lnmjVjNYGcJvMqUILp16LzOEv3ccW1Dz7oipHRI6xhduSQ5wcUdhYe3kVfWgCUcIfKf
         hXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207093; x=1744811893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqNDGbtGLo2t+c/K/+WxlFYfgefVNdcRkPfKSN2QwBU=;
        b=KiJ4pZNm60xm8feHC5Z/8f5+zlGbUZ84pyQ1cK7i75IZiiYjcBFCOamPE37689M4A5
         qrj/m+mVsGyXZvJ+5zko/V75P5o8vKrnKsQzdDLPoDdAVOT96ewyM4gx8cr/kk8YJqYF
         kzE3N6F0itjr1x3R1SMQY5gGaNeTmB3y+ifHVil4gSSmRKReHFflaTv2nyDqtYiLFkTs
         XRUrMSzU//QSZul21BS22CFH/FD3s9YZePBMzL6Zp8ZvCAhILlDFWlVzphBvCGH2LKUX
         dI3S9StquBfp5xNlAtUyUzTFNs1cdUpd9eBboZWi+EOxFe8x0DT4wdRVtniDEYSzALLl
         Fddg==
X-Gm-Message-State: AOJu0YzWVnFVzvq9zHqVn5MSIwsWt92q+n0GdLAiVjycS9+BCCXFT4ZR
	76WqsUlltM6yNHK3uXBMAkB6HkEef+5pVjLWt1M7jD9vfwf1styABzsQyfPYZ8I3zb8fauFaUsH
	PKdI=
X-Gm-Gg: ASbGncvu7rqbRIfsiZgFnIKYrwGRdvd0jvCVb2pJ8Kcji+k1Yfv0rBTm7GSXXyuUQuP
	vOdiWEuNXZNNZEuY0DqYbx6MPdjTc1OXAbteNYtKEbfEXhYgfx28b7W6XcTHfweDTFO5hH2TPnq
	Yea7xV1XZSybSbXTaAt4XIhZGwecBbVTHzfKMND9DQSLI2fPbcg7ROdosJIzp48I4OD3T4slWLU
	FVr4n6uNMsJYk5Dvl3QeaU39GUd7VJCYa9jmATZoyQ39HeBFiMaQvxlw2xvNk1yrdFefX30F48P
	Cm0q0ErJVchouAAf4u0COG/uU+lPGKxbY69dm+5a
X-Google-Smtp-Source: AGHT+IHIVX12DG4UJMD+npbr7T0nRY9vFkjh96NzqxVpkK8HbCN57Cr3fp13NFCMVTQ558A+SUwSQw==
X-Received: by 2002:a05:6000:1888:b0:39c:2688:6904 with SMTP id ffacd0b85a97d-39d87cd34afmr2909304f8f.39.1744207092923;
        Wed, 09 Apr 2025 06:58:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0a80sm1768025f8f.68.2025.04.09.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 06:58:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/9] Introduce configfs-based interface for gpio-aggregator
Date: Wed,  9 Apr 2025 15:58:10 +0200
Message-ID: <174420708545.59017.7631940211921310879.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407043019.4105613-1-koichiro.den@canonical.com>
References: <20250407043019.4105613-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Apr 2025 13:30:10 +0900, Koichiro Den wrote:
> This patch series introduces a configfs-based interface to gpio-aggregator
> to address limitations in the existing 'new_device' interface.
> 
> The existing 'new_device' interface has several limitations:
> 
>   Issue#1. No way to determine when GPIO aggregator creation is complete.
>   Issue#2. No way to retrieve errors when creating a GPIO aggregator.
>   Issue#3. No way to trace a GPIO line of an aggregator back to its
>            corresponding physical device.
>   Issue#4. The 'new_device' echo does not indicate which virtual
>            gpiochip<N> was created.
>   Issue#5. No way to assign names to GPIO lines exported through an
>            aggregator.
> 
> [...]

Applied, thanks!

[1/9] gpio: aggregator: reorder functions to prepare for configfs introduction
      https://git.kernel.org/brgl/linux/c/7a56efeabffd13a162073068b8e29113c65f9e64
[2/9] gpio: aggregator: unify function naming
      https://git.kernel.org/brgl/linux/c/7616dd97ae22e5f69b24774455673d183d4191c9
[3/9] gpio: aggregator: add gpio_aggregator_{alloc,free}()
      https://git.kernel.org/brgl/linux/c/88fe1d1a646b3b01dcc335c44e7b33ea510f620e
[4/9] gpio: aggregator: introduce basic configfs interface
      https://git.kernel.org/brgl/linux/c/2b72a5399eae25ee2cfd447efa3012f1d9d7257d
[5/9] gpio: aggregator: rename 'name' to 'key' in gpio_aggregator_parse()
      https://git.kernel.org/brgl/linux/c/26ec717c3b160d00a91e647c8ecfa33eaf645b05
[6/9] gpio: aggregator: expose aggregator created via legacy sysfs to configfs
      https://git.kernel.org/brgl/linux/c/09708f2b1cee33d585606932fb0ff5bb4c49f48d
[7/9] gpio: aggregator: cancel deferred probe for devices created via configfs
      https://git.kernel.org/brgl/linux/c/62cf750f23a8905be5cf4471087068c1fe2e2d5b
[8/9] Documentation: gpio: document configfs interface for gpio-aggregator
      https://git.kernel.org/brgl/linux/c/017ae62c1d0bb4b3c29c8a15dc7c130e3c4783b8
[9/9] selftests: gpio: add test cases for gpio-aggregator
      https://git.kernel.org/brgl/linux/c/93ada5ce07889271aefb22147280cfd9cf3da5d8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


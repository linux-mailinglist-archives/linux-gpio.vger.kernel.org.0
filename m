Return-Path: <linux-gpio+bounces-23807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA1B11991
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 10:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 409CC1CC7686
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83972BE7D7;
	Fri, 25 Jul 2025 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nWuaZICG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1372BD5B2
	for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753431050; cv=none; b=iwSMlJNGQbYPBU1Wmelh6ZvQhlKHIt8EfSVwLPmykJkVmvnu5u4+f177qSJH0y9YV73Yz8OsOQkJfOLpPXxhqadkDg0HChZ1Cr6buSJPOV3MwG3P3zbuxhYuO4EBBo6G9mL+TYUohI13UypRbv/Hxgb7HTANFs60XE6sVjlKj5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753431050; c=relaxed/simple;
	bh=/8Jy2q7BUbMRemNSy/ayI7mRAKf+o02bPXV7CnXtXQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AAzhPQHitHSgVxG0JPwFrztROkkbrhM3CIX6lLbXrwf82XvdtmwYYAHxu2ySBDUTcfIkVy4di2ptFuyVUg0Z/MSDCmlDrFCXeadMgsXsg/E96JD5SqpQyJdEPbwPjhGauABgynX87PJYb5HbhGoLJL/tQhfzEe4427APCVVvRTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nWuaZICG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b7746135acso405221f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jul 2025 01:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753431047; x=1754035847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjnADGgMIxD9Mwt4aQx2cVoKFVB9u557YmwsL2pYhHc=;
        b=nWuaZICGp1RprfKTIAnRT8GXAntIodnigFZgHAgo38xzs0lc8jlmJIoYb80sV0wOQj
         s0snfm1v0otVMYj2rWIYqW5sTnBt6l8nr1XiwC1A6LzVtGVGSvuhbXLODv1cV5yt+MQM
         tsyByYDkm0h3dzUg8NV2SYNSxxwuo0qz2J3XBVZALc19lxSU3AC9tQn4O7ZZrzD+881R
         2rgGhih/Bc/6fLDd0iYzSj6a2Vp75ghEfZHSEjOeBa0OT6ZzaGbx2vlpSrlJ8/7ILX6V
         AHx8jDtEAWshRDJfOVRNaza0lCoOdzddHs5jrik+cIexago/XwSZhn/+xjYM9WM4jpZC
         ONXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753431047; x=1754035847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjnADGgMIxD9Mwt4aQx2cVoKFVB9u557YmwsL2pYhHc=;
        b=Sq94RVsV5a3UQ+QpdCSa2hAJKAC9Tr+Jw3l/yZ3E1U77iXQE+KTFsaZZ1WGpMX7E7R
         pazh6nmz6QnebRPHcWrcxtAqtWfUt/RD3QpVjh9ccjNZVFinW+K4Z7r7Fa0xi+OfTRTJ
         ZgzGU7mLVYUspEbFLfA755rEzKnqA8/YFMx5yjm6VXn0DRw1OH0ul9iXcGYKBDyGT9aV
         gJxtQul63st3gwVtmH99TS1DctZ7Moxh83ZQEEWr5QIuWTzijpHpUGz2C2HDd9OgFIsF
         7xuA5YUjTl8P4dcZHz4/9Ds+INSW5t9W5KuR3ZZ4Z2gha9Kl57HYGsNMcQWN9PK/3fcY
         Z9wA==
X-Forwarded-Encrypted: i=1; AJvYcCW0IUas1LRepAef6Df687vqK5eA5go98Ss3tYn3ziSNDuGNJAYX7932MxTBD1iYdM7FP7BCW0LITx9G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+nJfZuFE1tUAyLGV3cIflHyxxE6kKR1LDxw5Pf70vl1WOYybz
	6oWCspCQ8VX55ejc3roy1B0JD5OnGrZHVcy3mNiE++mSSKRooL3R8euoyHCIX88Mggw=
X-Gm-Gg: ASbGncv0nRK4ElTNBPU2QPYpwODflybPyM5O7mAUoRsR+tpYpAcc4bHd+aTZs0acZXQ
	wAGfzGL13BUd4GqdpnweH2nlSEa7IPr6RVMAAsXw4MVtjVA/MCw0T6K5aPPSSzVTDGOeiGDDHvt
	tqCeZHCMsKdXUKb4ZSRs+GbScxdzcmvHRd1/xaRN3NhuHbzedmryzYbzlSINiVhUuE3zYYYEaER
	hjtF2XMMIdCakcPT+zfuTXYIThku7zyUiPynNw67FfTcdE7p6g3tATF7L9FjBGf44X3iWB7QkSO
	9U7PKU6ioIrwyjy9vnt/auVVJiHKlRt9qq9Iy7BVYh4TZ6GJWl9fLP4JmUbr+uq5UVg73uxBn4D
	+rz7o1c2MpKy6YvFusXuwkV8=
X-Google-Smtp-Source: AGHT+IFtrN6VUv3AxAAmMB1p8Cksy5ht9aBXYvpOBIp9CQazid75UckioUfrsNhXmPCAYyDnC0fv7Q==
X-Received: by 2002:a05:6000:2407:b0:3b7:6d94:a032 with SMTP id ffacd0b85a97d-3b7765e6ba2mr811266f8f.3.1753431047252;
        Fri, 25 Jul 2025 01:10:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3c3c:6b37:9b23:6049])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad22asm4402723f8f.53.2025.07.25.01.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 01:10:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Enrico Weigelt <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Harald Mommer <harald.mommer@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] gpio: virtio: Fix config space reading.
Date: Fri, 25 Jul 2025 10:10:45 +0200
Message-ID: <175343097349.17150.917277696050409769.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250724143718.5442-1-harald.mommer@oss.qualcomm.com>
References: <20250724143718.5442-1-harald.mommer@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 24 Jul 2025 16:36:52 +0200, Harald Mommer wrote:
> Fix for Virtio GPIO Linux driver
> 
> The Virtio GPIO Linux driver reads the configuration space in a way not
> conformant with the virtio specification. The hypervisor we are using is
> strict in what it accepts so the current behavior causes a problem.
> 
> Builds on top of gpio/for-next, tested on Linux v6.5.7.
> 
> [...]

It's already Friday and I won't be able to run it through the autobuilders so
I won't be sending it for v6.16. I queued it for v6.17 and it will be part of
my PR early next week.

Thanks!

[1/1] gpio: virtio: Fix config space reading.
      https://git.kernel.org/brgl/linux/c/4740e1e2f320061c2f0dbadc0dd3dfb58df986d5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


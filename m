Return-Path: <linux-gpio+bounces-8012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1BC9261DB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 15:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59C751F21F76
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 13:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983C517DA1B;
	Wed,  3 Jul 2024 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MlVdVK6/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A66717D35E
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720013314; cv=none; b=o+YD9T7RoKuDIElYryjXIWpDEMqdXNBcLpLdNXmgn7rhgow5hKTa5zXD3AgGWuk7ThtVVACYXpRInYEGIOtd2d6XaX/0LrsO+PF88pSz3SkMASeeMGUFy5JyWGUfoyiP7PpA9fTrtjecbV8MMM+DoUXoIQfK+ncCv/se68kiBlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720013314; c=relaxed/simple;
	bh=eXeh+odNiG8x4cyW9ttyv7RVPgMeH+bDRXBp/ntb5AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Njur2tRkqiSLhozmzCMs+sHXsMmejxH144UEHFXyFxUt24jUp1I93LgPEHfjpkCQGUcfTm3/F0MNM1h6o1kEx08g5NLYIDG7hSmhE2GH9fQZG7wCVcPJnfDi+I3f3Hmyc+/hTMIxgp876etfpaBIywTKg456pRUNnuJEfz7Gdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MlVdVK6/; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so73938791fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720013307; x=1720618107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH47RNmUX1AGSr0QbImyT9elpUv6h36gp7mCFp6MkqA=;
        b=MlVdVK6/beA4npbdCAzgMv39IjfvLx8k+mcrNqaXj3Us5koXQIDlN/i+hVkL1qiXTU
         rO/b9EO5NbZte2k3jZKftE/UzZbzF1RXW18eXm8YFjjoSMX7dAfobuHeFFH8gcJLlqnC
         p87YjnNp4vtpBQPaAC3/AgyCZjxCmqsG+zvCKeeBU9b8bk6bdomaqud/b3KJNj10xo1N
         fzdOIir+XJxnfulwj4jUEF6rFk146Y5SCYRtBN/hgh4afvOcYeDupeIrv+Ch3KtovCls
         15Sa5v4hFj8OGjhAWdCTW6Zin+os6ED6ma19gYGMSfZv2upGyxC7CbT5PDcs0rUDIMto
         1EIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720013307; x=1720618107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH47RNmUX1AGSr0QbImyT9elpUv6h36gp7mCFp6MkqA=;
        b=X0Q9/Mp0v7lmjvt1/oJRu1EQYOsJbFCK5mlJr3AXYyZ5OCO0FFjQlH+P1c2m2/uqhP
         CWZpTRM3X3VpdPia+6CvN7lKJjibTNAWapXdOKyAGpxwOA7f2nC0IfbLDbwkHTujdojX
         a2IYVxFx08Gbx+6mcZ1usWnLw06P6dsF0A/+pTxPIPQmcRabK5RVDgVkkB5WvVsuFj5b
         /RGo9/r8jbw13jP+13bNJbL68GrMJnzJJyCHuicum2OWexXADl6pJ6t25fIliHQfQbcy
         JC/RFPcizFuwsDt59mFJT2fHIG2ujqZcoLx4dA/mYHPwAqpDvY9miydijSrcpMKf/K9H
         7YlQ==
X-Gm-Message-State: AOJu0YzkggPMjq97fdxiLgKEiZjiIvZVOZm8H0YmwXnbpSRfJ1R8vIdX
	wkgiatEVXI9jSlUx3SkXLB51PvPeJefY/MmPuBIrWgJnnsDj3rIGqqVvQLzsMgMj2k7jR4lMXED
	q
X-Google-Smtp-Source: AGHT+IF8+t0W+Jxcef2zPEJhg/UHQYLfiKh8V3SIvq9COfdpuCwDUDYiE5vlgZ1/wChFAeIeucnstg==
X-Received: by 2002:a2e:9d44:0:b0:2ec:57c7:c737 with SMTP id 38308e7fff4ca-2ee5e6e60fbmr73030221fa.40.1720013307158;
        Wed, 03 Jul 2024 06:28:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c37f:195e:538f:bf06])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4258036d034sm137144915e9.43.2024.07.03.06.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 06:28:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Mentovai <mark@mentovai.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	=?UTF-8?q?L=C3=B3r=C3=A1nd=20Horv=C3=A1th?= <lorand.horvath82@gmail.com>
Subject: Re: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
Date: Wed,  3 Jul 2024 15:28:20 +0200
Message-ID: <172001329822.19609.1796927408061216237.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 25 Jun 2024 09:19:49 +0800, Shiji Yang wrote:
> bgpio_bits must be aligned with the data bus width. For example, on a
> 32 bit big endian system and we only have 16 GPIOs. If we only assume
> bgpio_bits=16 we can never control the GPIO because the base address
> is the lowest address.
> 
> low address                          high address
> -------------------------------------------------
> |   byte3   |   byte2   |   byte1   |   byte0   |
> -------------------------------------------------
> |    NaN    |    NaN    |  gpio8-15 |  gpio0-7  |
> -------------------------------------------------
> 
> [...]

Applied, thanks!

[1/1] gpio: mmio: do not calculate bgpio_bits via "ngpios"
      commit: f07798d7bb9c46d17d80103fb772fd2c75d47919

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


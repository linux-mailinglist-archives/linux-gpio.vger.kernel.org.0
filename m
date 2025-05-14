Return-Path: <linux-gpio+bounces-20158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299EDAB6FEE
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A5EC3AE3EE
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 15:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149BE190068;
	Wed, 14 May 2025 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NjIA3K4c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3EA1DED6F
	for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236683; cv=none; b=r6h6uqrQODUMoeqHHLtRVg2vEzNAZTCfGn7msG4xBql/sdNOlxgqZTiEWIw4ZDLCA4wB8ecgjhM54+HC508GvKoHiUmk4SPByx8K1eBKdIoQozoGiuutIgGXUvyQqH08QrXVidjX5r6iVAfIQULWNsi5mCNBbjMfVlmiOuAX+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236683; c=relaxed/simple;
	bh=Z1sxsE8kXcUhyoj0n/3eQWxMrwrp8xETdMTl6tZn0Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TxykgkvDtU3gkl5viIvsmZGSMcDYfdcSvbUakrZY77IwqMRFifx3u85G/9VJjVDUdmygFooGCohNrM4X5XOA8FNY+vdRwwi/7zN2BvOKRR57G/2ViwVoAfJWwe0CpnwnnZwJXWfoIBCFaRBeJzdzEq3+blL2nLmRFad9TcQ1C2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NjIA3K4c; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso49257725e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747236680; x=1747841480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGR4+1BG0FD7hF4WA19BAUgiyzmgLYBs/GSczEJQxEg=;
        b=NjIA3K4c9L0i4et5fKAejFpL9vC3TkQOgER2Q40rHyEPU7b6pp2EIPBjR9PSvmMUZY
         YDnH0mqEpPSEuECdChDLwK6uf0r5onaoNOZUM821+M6ZcVpaPrAw7tHF8kJfK5W36QXe
         PV5bhm96SyQbmG/OaxhRxDYQtHeZ+k9/GvI1BEyI2yYTeY851tmNgOm3hrQjWvk8RjVr
         gKK8xbWstPGRl6XIsBdsB9BAMg2VzAjNKBuGocQulbBLCcsTg60ocAVKusWcSNTrgg60
         sjnRZ2eGFcDyqpplV73xEw24ezGW1GeXB3GIc8sSseGQvTw59C9eds5Os1ZVMLVfnSv4
         ymuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236680; x=1747841480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGR4+1BG0FD7hF4WA19BAUgiyzmgLYBs/GSczEJQxEg=;
        b=K6qy4w7sDwDJL8xiMNS7xXwKCEeZF9b5r1b7ivgJN6TDCsx725KWcQS/1IIRSMDAC3
         xYbCqBU08Ej4d0W5M7z80DBXyWH+kLq+Y9ag2RK0GvohRtOl6pepExA/rLuUD58plv9P
         lHv5ndYvG3PmSEEqnTtNrnxbWaA93LoSkdDTtw6n8RyVmouoB1JRHId24yUqmG6/mhPd
         7hZs+4FfgV62IlELdRCbhdEjkJCHkBAKhOvOiEUzUZ6qjRkNZ4RuX1ZrscOwhgTVe8kX
         o03gN5cUIy3zSbbKa5FqWlueNsJaYA1u3jdZ7QUahSoXPNVNVpeUZ0wpO04Zk3ICxXrX
         yQFg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6QCrL0bwKhmVkVJ6Ijoe1VW9qtVHpGHNYNVmtTCVjwkxdp1TQyo7F+ztOXPUfr6mUFFFTVtZTFBb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Cveigjv0PxR32DivR9pCKc09rpZttqtltZUiR4Ci2pGjpESx
	nVBl1sj/10IMenGplivTs5Jk/irACInm5kV6S9URcSoUT5LzBxuf5fYL9GSiFkRLf0ilQfGrJrv
	D/kQ=
X-Gm-Gg: ASbGncuN+/aYPiGJ89zLVxUM5o9TGBHTBlUbLhvnBRIFsuheWlzhMQ8T3ojzWfBtdL9
	MTx42Ldajk/RvUYem9ibD8nXVjYBCQISh/QdUl33D2uVccEui+J+ykt7ycPtFwBrTMdDRBh3lTq
	t6SUHiSELwYVTUva7lC1PZZx3euoP77oQD5wSCG6KdRR3/ZxeEmTL1pdgiLeX7kvs/uUWbpduhe
	u9TMO+mE62E5PsrsgvJ8PS+Z0v1W4mu3Z/Mrcblkf+mhlTB41aNRvA0iNUmfYhnBTsO4C/yYrNK
	v3ob5oOI4Wpn2q7zSFQZ9vgqe7Df/hGjI5Q/0RF0A/acEyIO+xP7vv4eli4PV+mxcyz2BeVjFGr
	iW0HWD82HgPW70tSTb933CDKD
X-Google-Smtp-Source: AGHT+IHOvVPhpwSb7mTZDJYjwkd9um7VINSJBr3N9zogJFPLlegS2njAEUaLrSQ74A/tb/6r6JJrbw==
X-Received: by 2002:a05:600c:1c9e:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-442f216c175mr31299005e9.27.1747236680160;
        Wed, 14 May 2025 08:31:20 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f337db3bsm32975415e9.9.2025.05.14.08.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:31:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] pinctrl: tegra: Add Tegra186 pinmux driver
Date: Wed, 14 May 2025 17:31:17 +0200
Message-ID: <174723666619.14309.2874778168838879633.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 29 Apr 2025 16:33:29 -0500, Aaron Kling wrote:
> This series adds support for Tegra186 pin control, based on a downstream
> driver, updated to match the existing Tegra194 driver.
> 
> 

Applied, thanks!

[2/4] dt-bindings: gpio: tegra186: Add gpio-ranges
      https://git.kernel.org/brgl/linux/c/1275c70c4c1ca764cbf9ced01fb4286e4f49747e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Return-Path: <linux-gpio+bounces-27002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4025FBD2222
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 089A14ED03D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 08:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5982FB0BF;
	Mon, 13 Oct 2025 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GVUmyLMo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBBA2F5473
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 08:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345228; cv=none; b=HOi514zJPj8NcMM8cYiX6n9GGhNtxnoJI2F7sPHjekK27EtZVTeYgLlLiWaryrR+IHJX+2wEwo0AHfcTwYFoA3H1ZSHuHnG1Y9WEvMYC2CXkDd1qdrQNDGcKGS1TgvDD+6SHGuxBwbMI1DqnKQ2qC84858FYe+t/OzQcnM4PYLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345228; c=relaxed/simple;
	bh=d8M+ivtADtXDYSeEzdGAHqGf256mH6bZPw61WhtBoMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyoNBLks8GVUaCvWBnAw9nKE3FEHkzgrk9kynuzy67vZS2oWQfGUdioyu4YmsOe376Pzz3KI+Ue4pXsD5RoZ20FAXcIbJz3gXQhbpv392em0i7DAkcNyl+q07HtUcD+37fEdq4MYxxAKvS163DN7d32+DXv/hMvwxRGX7Ttyu+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GVUmyLMo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso28654795e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760345224; x=1760950024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gd+pzMdPIgYVRLk+23ZpKjIPNg8psVXn3K6n4iNiROM=;
        b=GVUmyLMoaGlAXna0UDwEOi3ZDkL4LjrHyRHq1pdI60UxWe6CkSQJbdB3kYvcqQHTyE
         YCl7FBbjwVbrmp/blyi8Nkslm4ERW+NecvormMUaNToGuZL2bWyRkE2CFLi3xbM0o5YA
         f3vB3vdzoaE4vFAsupoKgibiH+vIRe2x+pBCAJs1TxrdEmPz1T2fWsTIE9U8VA0SgzcN
         gVTycnzvF0rmQklSTI+rq7Xno4WV3P7deX7cix32IEed5alqsKdcApSVNy1da4hc7xKV
         UkvF0p3U/Dbhk7Znu+wUCLX/ZZR7hdw5BozJEZelQukHBfcQZSrEJwJxrBRrJrrlJSW6
         jeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760345224; x=1760950024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gd+pzMdPIgYVRLk+23ZpKjIPNg8psVXn3K6n4iNiROM=;
        b=Wa9qCLmz6HuwXi+s56uIokcAb2oLFuB3IIkmfr19RZSd+XtslfTceWgUUkY41EYHYL
         h3D0qSQIo23iH6nwvshWXfREmnr3yNFXcgdSsAL9F4/GMbWMMJADFdsg7XPBc7JHdJ8D
         jvldqF3IXxxNi8Lif8gR6LCFzFEWbzqrItyCOKqrvvdeMoCaodtADegWgnW4VVndeLVi
         TTJ7DCMCAqqrN/n/kcCmaNOGcDZWeXVxUm9urYT5U5r42k/E9zewYonbjctNfBuEGXvA
         KOXyjQB6+w1Qu+7HUdNtaNokY4YtbmeRdlhypszZ5IYHWf7ce6uVQYonwFyFr+b7IXC9
         9T5w==
X-Forwarded-Encrypted: i=1; AJvYcCXGiqSXZ6XDt6N0yrN3vByh8YF7wtEzptCqyg51ONQlfuDjAzN0al17Jssx1BFSu58rmV/Z0BDTBbES@vger.kernel.org
X-Gm-Message-State: AOJu0YycvT3r5/DjWd9yJjBMCTlTqbQOGx6A45PFQQfT3/i7YxP7VG0S
	zAuEIMKG//pH9bI+81/mFei/GvrOSLKtuvOg0oOysMngvakDYO168AiTxvMrKthzsuA=
X-Gm-Gg: ASbGncuISkXqCqLeCVGmSbgtOhELcfUjSLNNjHu2O/xhDirqTX/YIVz1M8ZoWUr5CRZ
	ayNyNz2M2drJTYwSyRZJPlsnXxUfNub2xLbYMAHI0Yp+oZH8ELn8BVPQTRYn/e/kcN3wJeJnmPh
	7TsGF+TH4mBxfIdhvxKwIarSJVLn1xz80sLfZKoC661cRYDrum+DTPiWnIIjB/+UU/73tZ3Vf2+
	N1kO9NWnn+/DnrWiv20gXruUHgzktfSK6IMvtqcbvoBhmwL/efkMqrAPq2LToaTLGCVS0WE+P1b
	uM9wfn74fopDNd9sSjZjEc/H5TYUh20cihOmOGsgyurUBJ1ssUajdQQ7gaFhJMIxT4uAwvFPnhz
	IX8gCPR7aSzK3JHmbPiz2aHM+vDMbHTWthsIzWuAxGpacri7ZGI64YBV7lfOZjtiG
X-Google-Smtp-Source: AGHT+IHtVbZgFTpgAFwb6aNqBpk5v0sDXR3QkRzIBm9bTc/K4JVxZ0824W18iq7Jkgk7IKJyUkmAXg==
X-Received: by 2002:a05:6000:1445:b0:3de:b99d:d43 with SMTP id ffacd0b85a97d-42666ab8668mr13212697f8f.19.1760345223815;
        Mon, 13 Oct 2025 01:47:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fc45:d50e:e755:a6e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d0061sm17199089f8f.30.2025.10.13.01.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:47:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Alex Tran <alex.t.tran@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: gpio-grgpio: call request_irq after incrementing the reference count
Date: Mon, 13 Oct 2025 10:47:01 +0200
Message-ID: <176034521952.38327.12702860512610142526.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251002055727.1488237-1-alex.t.tran@gmail.com>
References: <20251002055727.1488237-1-alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 01 Oct 2025 22:57:27 -0700, Alex Tran wrote:
> Remove extraneous dropping of the lock just to call 'request_irq'
> and locking again afterwards. Increment reference count
> before calling 'request_irq'. Rollback reference count if
> 'request_irq' fails.
> 
> 

Applied, thanks!

[1/1] gpio: gpio-grgpio: call request_irq after incrementing the reference count
      https://git.kernel.org/brgl/linux/c/3a74778dc20f692ade1227a7e73cabd2367a8b71

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


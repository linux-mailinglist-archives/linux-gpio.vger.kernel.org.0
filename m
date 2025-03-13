Return-Path: <linux-gpio+bounces-17519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E76A5EDD9
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 09:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9767517BDA7
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 08:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A626D25FA2F;
	Thu, 13 Mar 2025 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jKtdhVlm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7500D1EE013
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741854043; cv=none; b=E9/vef2IODQqB3tsi8f0tEYyjPzOUITsMZDO33moFSZWlB8z+euDVMX82ESB/HmKdyAwzSMXs6AlOyoixQ0mQPtYhaPHSXfxCfLBmHR8YeczSF4C/YRMb2IKasOnB9SfNlTihWJC54CLrmV8/rEmbR5AbxPLAzDno+GYEn+eJqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741854043; c=relaxed/simple;
	bh=Hy+xSuVofnwueySGzw2wHE0q2UL2HSvh3hUYR0Xn/ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVBaO8VUbwOcv5GkMxyFj0DFW9K/FtSrIhbMYDaajW4gZcfxvovKbrkx8yBb1I/MtkTkTd8Gg0ASwNThB31p3FmN0fgfTHKqxmohyT74WwIr+J9uZlZvO3Ge1FOhUOe2B/cwJz/QGpH0JFtb9RIxKI34Hep8trjUSuSokrB/sy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jKtdhVlm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso5508285e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 01:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741854039; x=1742458839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNbTO5TjicLjBY2S6bO59mh/PAXU4LLxrsvGBXuMbkE=;
        b=jKtdhVlmMwPyE2+sppV3ay+nJcv+9tPETYnXdKA9fmcG1Gs0fFpC2koFTNVHhyxvLT
         E5zCacAOaCLUZ1aVWjhv0ME96TbKnOv7BgoQ6KEs8ZqNwcephA4prbe6jms1w3Lt5KcL
         UN+1Qfv8Yf1ruROCb+54956b5G0WRUUeZjBnzvOBugpsIqYJCpLLvEQu27VE/6D3Z2Kx
         jfH1SCihNWkaR3V5oaNU0LJS8dm0CxCpS+wFylMKQqMSoQMEjg2q1BSmT23RyyOCFXU1
         U5n+kdt3BMVjlrHO2BqHGexQY6jbCxTNWBJXSZ2pqsLUuT+Nb+J7VDpE6Ar1t4ZPiOgh
         +Qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741854039; x=1742458839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNbTO5TjicLjBY2S6bO59mh/PAXU4LLxrsvGBXuMbkE=;
        b=bz8D/9fEGCyy3W3+5As2DzFychViY80vdjCLltvkzFHs/GQFp4zIA+AqdZEB+jtZ/M
         FKY+EEveDbdwNfQjpZgPJJIbnlJaUx+7eiIUw+ReedOnd57o06mETIYP2bE7uJ27FvNT
         ln7IOSZJku2+FZjnlzgH3i262WsSXEI0jEOxG2OVekvpDYwP8BNV1eQ2zG3LnuDdrA+9
         IN09pZEV5sdOaaBQJnWRGiKKDpI8Z7NTSD7wW756zP/kznpUqQFbqtPV0SHfgcQoZvd2
         TRNDbwWWS/G/S7nm7C5eQgj90sYgfo84zztRyjysTKCprbpsSmduCaQ7rrP6tqrC4Nbt
         3gjA==
X-Forwarded-Encrypted: i=1; AJvYcCX0waesRbiU/4dbsBaTDaS0dZHVzgtg8QYLEv+R0AEbbNqW50+vu4xMkHrf1u8fYpcUwDu4jSdCaRC7@vger.kernel.org
X-Gm-Message-State: AOJu0YwxW2JC7FFxkPtFpz0AOwq3JlZb5YWhRIOY+uwOW5JLwZ4E56RG
	JnPvvouM19A1l0Z/RXuvSKi7eiqZ/+AC95GAdUX5r3mrKtAXfyFY5DzzOOqIrVI=
X-Gm-Gg: ASbGnctJhOCcg+uOvIiP0JSuv4bi+yapNJ0STWpTuZ/L1ng0j6G6xUeWQdTxssvR5h6
	OCtBNgZgRtmmiEH4tUzYPO7LTDRzh6zWXcanexyfrk2lOrOFkGOMPKeHETeri4ky2gXH2NP9Ed/
	eqkE3dWqhPpy/OANaPllzmA07cvlXYg8jL/XkJ/8M46oVrAKnhvnMcJ1Q/KumL592IxYSaUXqUo
	1Mt13lLaPhuQBOTT/KUqBBN/kA4Qzz1AT59sHVuv0DmXlrNJvCJcfyA2plrf+2NwHzoyw0wsmfn
	Ic0Ac7vrQLveCVz0x9nvhyDVGVE8TWXyoAxI3o2hs4N2QKijPTXajno=
X-Google-Smtp-Source: AGHT+IGrcDtQowxkrSkzeof6W2aS9uYKvk3LTW2BB4YIJuRbMAtEH7ewNad2BvzkhFhHtn4QOTOMdA==
X-Received: by 2002:a05:600c:3554:b0:43c:fffc:787b with SMTP id 5b1f17b1804b1-43cfffc7b0fmr139852135e9.12.1741854039440;
        Thu, 13 Mar 2025 01:20:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:90f7:ca4b:a5e1:8693])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8d068esm45070275e9.33.2025.03.13.01.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 01:20:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Genes Lists <lists@sapience.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] gpiolib: don't check the retval of get_direction() when registering a chip
Date: Thu, 13 Mar 2025 09:20:36 +0100
Message-ID: <174185403526.7115.15257225871449545065.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250311175631.83779-1-brgl@bgdev.pl>
References: <20250311175631.83779-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Mar 2025 18:56:31 +0100, Bartosz Golaszewski wrote:
> During chip registration we should neither check the return value of
> gc->get_direction() nor hold the SRCU lock when calling it. The former
> is because pin controllers may have pins set to alternate functions and
> return errors from their get_direction() callbacks. That's alright - we
> should default to the safe INPUT state and not bail-out. The latter is
> not needed because we haven't registered the chip yet so there's nothing
> to protect against dynamic removal. In fact: we currently hit a lockdep
> splat. Revert to calling the gc->get_direction() callback directly and
> *not* checking its value.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: don't check the retval of get_direction() when registering a chip
      commit: 0102fbf52b93e609fec0dab53b1fb4fe69113f5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


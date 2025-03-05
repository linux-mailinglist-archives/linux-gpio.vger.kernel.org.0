Return-Path: <linux-gpio+bounces-17095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 084C1A4F94E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 09:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE4A01892AE7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520FA1FECB8;
	Wed,  5 Mar 2025 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E91BkuPI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24A1FDE2F
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741165005; cv=none; b=PET1E7Luu4ZD5P0btJaYwavoW519HDNItGpwH17Lb4JyOvtVN3ySdq40lzXrWf1zYGTJJrd394cr95pQlLzLaun5+5dDNjWyG0WkLMtV4RXWJ2bKtIwT3rWiin2yErP1Gqk14jdGPjK/Lm5a4mjCwkhl5CzaVrkp9zS719dBdew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741165005; c=relaxed/simple;
	bh=MdB85ZcPm8v/V2YtsHgVtSYH4zfMxt4J5oHF0yYVGyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mvh0grBz0bkuLnCewoI5axkR8wFlFq7xT4SudD46QzzU9/wIanJCyM9MqgGA5/T4LhK7OezYpwuwgZgBGF0zGWbVRlFC+NHvTUfHhFYkv9OmbdllSIFn2Zp8GDmTzUvNa4lEMEmI2o7Ero84BCqHklW3C+10yr+uyDekjbgO1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E91BkuPI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bc38bb6baso18722925e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 00:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741165001; x=1741769801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Fuv0TDvt2J50qLsgdzrl3qC7n/blSVSUBhsKPFPU+Y=;
        b=E91BkuPIeUYfMcnTyNokmzWbTMua3YEMe0zirdFW5yT9xxIkxFVODfiqOs73p73Dj8
         Xc5eAofl+WhV3hj8G64KEo4YTrfGvyh368lc9h3B2/zabFThFNDc/ztf95TrQGJF7rDX
         C2TtfZJJj6okUP/OokIksJmle2ImDzdzE3VKWTUlYviHFbAYAj9FCux2NqM2bnBCxOnL
         czXfN5iixzFp2uxGiXBtVOgalHtNHZqZJhFi1/ucoW4dbyz3qgq2jtalE+cspd3VVdXO
         WBHlT0W3iVwgwpl8B6iidh2c2XVnaAPalKiZLwfriYsENBUZb2oenWJVGRBGR8i7iKYD
         NuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165001; x=1741769801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Fuv0TDvt2J50qLsgdzrl3qC7n/blSVSUBhsKPFPU+Y=;
        b=tySF0SdDVG8ssq5ZGv8h2JrW4emlLw1ZQ45Yd3tRGI6k3K4ROx5BUuuWuPUxoIbhK/
         x75Ze7CeZmH8ob1B7JpQecim0e1qBEBkc/SsAhtUYKAJjzJ0lIPVXFGfqPYB4GyW9JvG
         7IMrGacMD0x2J1WiEUBRx2GvphYCiyOmrA4LDOSlg/Dql8PlqA4TjkotCo9vw+tVS08u
         F/cEBpBtNjVIBY6Y1Ftu+qQnyq9Zp9AKG8UA3lTj19lHwzHdt1KfByDhM91kW5fQ3mQD
         tHVWCo+vZgTjw2fLr5Zttz7euuo+nISM1hDXyVSyBsw9gGQuNFDirpV1ZkPBFo7nBnEs
         jijw==
X-Forwarded-Encrypted: i=1; AJvYcCXl/T9dr2GO9ViKEM4zkszKnq5prVKOEc3KnJXmBR9RbU7aE5nviHF7skJEF6e+k25ddHAb7hHe8BYX@vger.kernel.org
X-Gm-Message-State: AOJu0YzN1sUWBZacvdhg1LBwmCd5V+WJnBa+1ytTtY+e+b7U1aVVA0Nb
	xL4r66jCGlZeuGt8nVK2NsC8E0v7fg9NesR0w1c0cJsksNbHEgsYes0VDT9Jl7A=
X-Gm-Gg: ASbGncskA+Q50lmQTux8pp3IBIzVXrPgDaSnp4ZISZDeqT6DD7xTXjAvdv2ys7bxiOb
	q0IsQ44n95SDPpqVrIsKVov15/31aDT0gqjx9EkyjZIR3vRIB7TnuPYj9USyNjrwLjslWixAmEI
	iO/wf4TjM/idUM1/msX2GEqhP6ivIerPM0CJpF39uoOWtbN1E7Ipfm/t+ehuRPvdvxP6XI4PVdJ
	UY8hFep4ZOYbIjfNExuciZ7TrCgLeVD0setBeFPLdEJwaW4ms1wo93eFFUIvbJ2ji2P+8g4ygLT
	W0nM3RBu3Oo1NjdM7DAAGipglrY/gI4CcG91yHczzqSU
X-Google-Smtp-Source: AGHT+IEjTeOshg/et4xsAiyT8rCEdbinKDlmt5E8tVs9hXKleiSIZhgrtg7jQiHngwX96hNKwI634A==
X-Received: by 2002:a05:600c:1988:b0:439:9377:fa21 with SMTP id 5b1f17b1804b1-43bd2aed6c2mr12768215e9.19.1741165001227;
        Wed, 05 Mar 2025 00:56:41 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e514:53b3:5af8:e408])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796084sm20652588f8f.19.2025.03.05.00.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:56:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: loongson: Add new loongson gpio chip compatible
Date: Wed,  5 Mar 2025 09:56:39 +0100
Message-ID: <174116499292.21788.16321684566048827154.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Mar 2025 15:45:51 +0800, Binbin Zhou wrote:
> Add the devicetree compatibles for Loongson-7A2000 and Loongson-3A6000
> gpio chip.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: loongson: Add new loongson gpio chip compatible
      commit: e4a345c55e1b9b5ab5212a93b081f666f71b303b
[2/2] gpio: loongson-64bit: Add more gpio chip support
      commit: 44fe79020b91a1a8620e44d4f361b389e8fc552f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


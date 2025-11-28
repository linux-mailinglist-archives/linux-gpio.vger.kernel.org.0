Return-Path: <linux-gpio+bounces-29184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C81C91EB7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 13:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E418B4E956C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 11:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EA4320CC2;
	Fri, 28 Nov 2025 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1av2JeSq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC82302153
	for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331099; cv=none; b=OGibETNk6h7hQ8ll7XVi3t7q0+4hwVk91ksTDughwpfl/uiJZW+WCzCi2Yu1Ubzh33qvwvS3cz/SFIZYpuUEehhTDDBJlyJJqqx+lk8L7yuYXkGijohqEEVsu2vTTz98TmnSOPTHIWu/UzqOkWjT2NlYp3eVGR48tnXBm+/Iqoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331099; c=relaxed/simple;
	bh=qfJ1OTvKVP1Ym4J+Aild1PiXcaKU2Wavf81BdJjbp/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uU/EZPNHfTDM2eeht4vKEzUSK/7jbnsT8udk0Pfy8VFR9Z0rIbllN59b1DOWu9L0cF+V/BC9W7Is9EfJZFTY7WbG0gIDFhODElZP7zipMde6iM+s3Sw7HNnPyLjQegAr+J11z3+IUrb49mFbg5bDUUIz0tl2u4Hu8QxYHBPuHeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1av2JeSq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso15046495e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 03:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764331096; x=1764935896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYTmtQiXbAwX4ENNr1hIG4MUKKFnYuoCu6+O5HaztTo=;
        b=1av2JeSq2BvHozZwNl4p/njrnhrYVvLReZYJ02LRysO4vwmXowyqtRNV3F+jENn6Uk
         rJ57roqN8oLmxuFIsC5wPuHEQ1P7I06xwxraBwJWXKgD/TR+V0ObXmObZFlXDaVDGVtt
         AEFLqAwA4JJraJbvMeEpfzu9PBvOnrd2wguC9SkFhLjiT9gykjPCxKzj4r48dwxVz62u
         9EEEta9T3JJty2sG8L2q+5oI6+H73YVZBRwoE0DjOo4ENIdR6dI3F4+lLPn0ERcUVDSZ
         5fluLRQingxHdnbVAhZKWR263/apexJqDo9+vRAWBSzpgvUNB15EauGMD3AIQrCv8V/J
         5qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331096; x=1764935896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yYTmtQiXbAwX4ENNr1hIG4MUKKFnYuoCu6+O5HaztTo=;
        b=KfsTiVtxFIk7jdSJEanvG79pK2I2kgBhZhd9BYv31c3ljnBIptI3svKnyqSUWrjkN1
         GjKySYRENWj0OpUnFyVN90oFUVyIiS3c6aVYd2lLh33AhxvQSKSQAZiww7BUCVhRdNfR
         40ngryN+UnQJgRtctD6TeMKMFPTSz+fU/F+upZvmj0arQ/5z1+Y9C9Tx/fkaeXZ6HWI0
         O0cXH1tOSTcJznCBdjng613eIuaSSSvYyoAyIQJaQCs2uE9MMWsKOmaUNzg/Rb/aJ3Co
         SjfJMeuPhvXklcvax8tH2NuyMphIbi94Mr8lwIYnRpiov+EC3oZ2AFANNpVy8ApJDykL
         0AeA==
X-Forwarded-Encrypted: i=1; AJvYcCUMNLON5lxAo8BoZd1WTED6uCWepSpqAeAIFzv+mQpXUbWRYggjU9hGQvmNHpSxAUTq5WJEk+/9B2sm@vger.kernel.org
X-Gm-Message-State: AOJu0YwnqH/MCdimGNxwiPJbnVcVQTHUD4Fr/uxgEWWN+7nD933AKD0b
	UZHk60RQ1SIyeIHMA81BdOVvy27HSlfbOkVKLJRTDMO4/4eHBwgFNFTa91hQUQeRg6kvCb38fqu
	8NNU8
X-Gm-Gg: ASbGncsc1l+JSDl+CzwTspTHuJyLdNGAGeaJKFhIIBrG3sYkeNh/mi1U8sYwTaah5Tx
	6uz63TRUr8MIbA5PHu9kOKcNgcojov3WqWbgzEBwLlpRBPtXrxCOp2zvkp6VZaRz8GtnDQ9e+8L
	MDEoGq7hZjC3IwCdScNV+jt57HZFx07N0QK8hSKG3+k8HdFBbQaos5gSCKe3SEQdOQ7qDdX40z+
	6Puw8H+dMCNtjkV3z+8QO+MdHid9ck2Z8AtVyYVIUHarQCTbdsa1ajM8RRws/EGSCt33WNFCXGX
	y0bpdzt6iRFlwCdCsq75FTw+2ZP6uUid8YZp+NKidJsAv8s3sgF1n5QwH+PvAUnHjEfRLKpT5c7
	MIUuCN57gzf0Z+tv8csEo3KCAyNfzHdIVF8cYCNwdx3IsTbLApmFTapoWx/nVD+Gz8pu79sDYJb
	vEsa4Otw==
X-Google-Smtp-Source: AGHT+IHrGsM524Z+thYWyClX5bsmlqHDqJ1AX9crOCxWL8UMF5y9jjCevUPvBTQmoNUjTPqlqpQA1w==
X-Received: by 2002:a05:600c:470d:b0:471:1717:411 with SMTP id 5b1f17b1804b1-477c01edab1mr340808725e9.24.1764331096055;
        Fri, 28 Nov 2025 03:58:16 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc39csm154190595e9.14.2025.11.28.03.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:58:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] gpio: regmap: fix kernel-doc notation
Date: Fri, 28 Nov 2025 12:58:13 +0100
Message-ID: <176433109064.40107.11570033181225737316.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128062739.845403-1-rdunlap@infradead.org>
References: <20251128062739.845403-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Nov 2025 22:27:39 -0800, Randy Dunlap wrote:
> Add a ':' to the end of struct member names to prevent kernel-doc
> warnings:
> 
> Warning: include/linux/gpio/regmap.h:108 struct member 'regmap_irq_line'
>  not described in 'gpio_regmap_config'
> Warning: include/linux/gpio/regmap.h:108 struct member 'regmap_irq_flags'
>  not described in 'gpio_regmap_config'
> 
> [...]

Applied, thanks!

[1/1] gpio: regmap: fix kernel-doc notation
      https://git.kernel.org/brgl/linux/c/f01c0f7ee59fce16e5bae92a2d388a8a6fdf3f0f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


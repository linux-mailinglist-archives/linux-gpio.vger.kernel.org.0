Return-Path: <linux-gpio+bounces-18530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2F2A81F11
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3B137B2270
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 08:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892C225A620;
	Wed,  9 Apr 2025 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LV1w7mjP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D625A33B
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185676; cv=none; b=nEwBWXbg+cDlv91WGyjqUhl6Xy4aRJigaQtNwfxD7TOwk4jxj1RdMAK3nWjNXRZUyWFHJ/yLFX1iG0hUi1LXW0tAc14+BdYEb3z0vflxnZS24oK1claYCS0owUSk7o0SNX3UvF70PElpy0lUgYyay0ZLUGm+gvqxOQU2OGyeaV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185676; c=relaxed/simple;
	bh=n3VPKB9aYltNneVrBjJGraBYHEIEXZKeKZdBL+aUoq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AwWNudIJBjobj5vVr+rXcp3S1k2MP5fHWEwyRJG2shJb9DIcwLzQz4Qlnp1ZogktqoQXgCVw9L+fTtt0y4uq9UVB/9EirYXYEWDtfQSkrnPGy+sUWEKXPDIjfnv2oQbd90hEh7ZAEBkMiC9Oq+0koI7vTZB2e7Mbj81ceszXyFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LV1w7mjP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so39263565e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744185672; x=1744790472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYA5nuvEcee0U5B8rRBFmv973vNjUvML6aJjj0Hxl2E=;
        b=LV1w7mjPkbiKEZVU33ihSVNkHa48YEgxiFqHgU3mSzSHE4Arl97VLKP4CieoBlMxom
         3I2YCZQMvrXHS2qyiaowRvJ0Q7019s3xA7V9KSFdt5zXI/uKaDlOTFkcaX3XHO3yA9O7
         knXYjlZGJvia7OBTgt1s8Dl0uFfpzdNK5IUmuWTb6+MB5V79Dk+5zDsITRa3swDq3Oea
         4Jh6ya5NafU1LSD3x8ymSN0DZU9qtuyoChr9HyEFxxwORTmdte5KNdYAUcheJuA7Ywku
         zbNV109MRdy/F8kCIcNvNmiT+Z7i3SH+mDoiurBNArb+D6oiBSZyzCJRYOKpztgUafgS
         y35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744185672; x=1744790472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYA5nuvEcee0U5B8rRBFmv973vNjUvML6aJjj0Hxl2E=;
        b=n1QrjsbPQ6k/JBVdlK7tLBZpbPZkN2PYTpLtb80a/sTcEXHxpaA4Ch56yutefDcH4h
         z5GNQkFEDNqAnszk2uZvtWIMpxaqVXRLIl6nJwhCcgxbHkJtvHq7pysF/NPpLQbgXQ56
         QmFe/3ZaVd5TnwtULP1dtkrKtN+Bphgq9Mk/0d/zl6rMxHT/Ul3PJI31wHDlWzYNiXHO
         xrb67gngXid3U3mxnR69KSh4ojdOZb/oDax4IiXf24gUmoeV0gw2LvgnakjotQsiPFdQ
         p08JeqpKrn923oCl576EwE6/em7o8WW2bO/dPCn2qMoeChryFVAneXDjAIklXOX0tAX4
         qe8g==
X-Forwarded-Encrypted: i=1; AJvYcCUhveeJSfQ369K0cbyVAFStU3yKrhsXBIHDIhvYBpvn0afny6A3tCw7KjgNQxGCsVnC6tAO9KHdVwDD@vger.kernel.org
X-Gm-Message-State: AOJu0YxoPPeD2GCUE43x7B0u+rsP2N3CBVPOUsDGwv67Rr+0+v/OCh9F
	MFNxVwh0jBX+eoy9KewncJ4GAbOiqelKgtkHrNDHrgna+0LU8U72UcAdFSVeS+I=
X-Gm-Gg: ASbGncvAzBnNDxCtd7W7+XR8mMyjKA4i6HYINL3HTibS5W5ZEMElBfxQVjMsKppjKOi
	eQ5ijLi1fLHOWlJy2+2sxxcv59Q5w43dOLyjq6u+wzT9cFe3KGrNUwFxaTk9oDoBdaOAjdQ1uke
	NLSPJg0GAnMOYmAAYE4CalEVMQHt631bepPfwecurJoVgb6fD7vVjq1qE3bbR+SzCMgnz4qPbLc
	mVEFbxrJiLQAJbDXHbcwWvwiTVt1WLBQ2XhAIDC64nsS26RylTs3KOLU+duipjfKEe46kHW9shX
	8ixWjCelZk71wkNvFxlR+FaqjnA09xnu/CptMoNi
X-Google-Smtp-Source: AGHT+IGaj8cFxBAvcY1T8wT2Ez7JNKsWmwnkcv7FXxTc5rGKH2FENTx9IQvQjR6mzayg09fR083p7w==
X-Received: by 2002:a05:6000:2910:b0:39c:1257:feb8 with SMTP id ffacd0b85a97d-39d87ce318fmr1678541f8f.56.1744185672504;
        Wed, 09 Apr 2025 01:01:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm11350935e9.30.2025.04.09.01.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:01:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] gpio: don't compare raw GPIO descriptor pointers directly
Date: Wed,  9 Apr 2025 10:01:10 +0200
Message-ID: <174418566616.17540.8349820040396705264.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Apr 2025 09:08:13 +0200, Bartosz Golaszewski wrote:
> Handling of shared GPIOs in the kernel needs some improvements. Let's
> start with a simple change of not comparing GPIO descriptor pointers
> directly as there's nothing that guarantees that the same physical pin
> will always be represented by a single GPIO descriptor obtained by
> calling gpiod_get().
> 
> For merging: I suggest to take patch 1/2 through the GPIO tree and
> provide an immutable tag for the regulator tree.
> 
> [...]

Applied, thanks!

[1/2] gpio: provide gpiod_is_equal()
      https://git.kernel.org/brgl/linux/c/265daffe788aa1cc5925d0afcde4fe6e99c66638

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


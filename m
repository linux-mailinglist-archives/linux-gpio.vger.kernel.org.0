Return-Path: <linux-gpio+bounces-5811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00838B0B09
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 15:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 049A4B27513
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 13:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603A715E7EE;
	Wed, 24 Apr 2024 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="crWrIenO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAB615E7E2
	for <linux-gpio@vger.kernel.org>; Wed, 24 Apr 2024 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713965557; cv=none; b=CbdR27Yw8iFnXgipb4w3sS0ocfvBDaY3rvB552+itZl6m0CBJYPiiMiuc0cPM8kRdx/SZQNwjjFU9iye7TfCvLGl3u2d9jpSls3r7I5sAOpL1AmlYQkqPFHWG1uj9zA8FjhPv0i9rP0qlQCOU7+LVjN/WNT8+StPvPVyMqj6dyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713965557; c=relaxed/simple;
	bh=sqIFK4Ke/iibSqSzQ2BwQLyPnh2uu6n9SbHcTFTF+/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YphXOo4mMrVoJnofSmVrC4L10GgtEo/zWMqG6/dUy4fVb4KJlblOF4O131EUmz9qCgQGHfA2mb8ttkb/dEt/NttAwKX4TIqW9Y/whpsxEyCzO5Hbn4AeXCl+Txm6NxKpZpXWqT2oOS7Y7L5XmKISxYVOqOTvj4YNKdHDKLmwbQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=crWrIenO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-418e4cd2196so52644465e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Apr 2024 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713965554; x=1714570354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ON7DRK4o1QQEG6zMRrSA5yFg2l3FUOQ+KbU0jTc3aC0=;
        b=crWrIenOl8wTB724qL6vZoQtJs2o57vqHDpgA8aQeWzcftmmw9mEh/jXiT6RtyMYzD
         I1lFgBAchRxDl4+a1PLWGotEisXG/Oc4CDVXlkWiEbpIK9AB1lCT/LG+at2OiQZZFDTO
         9ysiYW5gthum06Cjs1Ov43iF6lLyWo3Nb/rSTlrnln8UcSMMZjpl8ODyuMXld8kwS1mK
         2chWUnUAIeSaXp94jRzZDMn6Vht3bO5l3IY/65dH664NJLWMbwHkbx0zDBCDbu47mtwp
         zm9+VgcOvqxAnpSLoqNIHNpRcfH8zF+7u79D+JnWv8b/s48xCBb1BRwvCJ55x+i76Bxl
         32/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713965554; x=1714570354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ON7DRK4o1QQEG6zMRrSA5yFg2l3FUOQ+KbU0jTc3aC0=;
        b=PnxMnnT5aDMzG1ZjvHgwfCue2VqECRLH4NpKzK0eeUiio06L5pseV24rkMMUablila
         WJANyTGdOqyKm8tNKZIiPjnTZ8tEvGzQ4ve6upyt8D0KNOVSFOrqmk+aK1hzIkcirdVS
         WL1eBoVD/ynJbR79qAKhEdCMJqraoCJ3xVzDt/ZeSbK3FbdZvnFMNbGLcD7kmiJomFAv
         2bF38rWOiohif02+e1kn+XEYP3fpF46a6oitMYuywVPyJKuJeqxXO/7EHyjrwSxq+dE8
         d6awYeoyynACgx+5o/tfsZK5T1vW9Eo+P8YQhkINBGpS5yV3WSMpHD/p+WWcTZybbBFR
         trSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjTW058weHOirdJ0MI+c6pdfTGDPTWNg/sngEfBl6MAFn4Mc2xQ8uSEeiWYCp8Kj7/T7DT3O1zqDWhqbAiRMrsYRkpuanU7p0dzQ==
X-Gm-Message-State: AOJu0YweLgGPJEqLpQ+N3cN0OdTsGPUb8KAYDU8uw03rpE73qoUB8D21
	ErBHS466zrvZnUiAN/HvmlvnfwTohqbMDTroVqwHdx25mS5nwfwyKpoRpxfDvLo=
X-Google-Smtp-Source: AGHT+IFt5k+u0qlhoBUYdAEe0Bqa4xVeIXq/GvItIj5LfRSsXjv3ukTNbIY3sE/Ec8osEpb2ZDqjGw==
X-Received: by 2002:a05:600c:1da7:b0:41b:24c0:aec5 with SMTP id p39-20020a05600c1da700b0041b24c0aec5mr297122wms.13.1713965553846;
        Wed, 24 Apr 2024 06:32:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:da66:dc78:acc5:bb9c])
        by smtp.gmail.com with ESMTPSA id d11-20020a05600c3acb00b0041aea85be32sm3343941wms.22.2024.04.24.06.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 06:32:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	jonathanh@nvidia.com,
	treding@nvidia.com,
	sfr@canb.auug.org.au,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	mochs@nvidia.com,
	csoto@nvidia.com,
	jamien@nvidia.com,
	smangipudi@nvidia.com
Subject: Re: [PATCH v3] gpio: tegra186: Fix tegra186_gpio_is_accessible() check
Date: Wed, 24 Apr 2024 15:32:32 +0200
Message-Id: <171396554137.82284.11131075774933207943.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240424095514.24397-1-pshete@nvidia.com>
References: <CAMRc=MfJokORpEOMkOmQdzTuZxcUAcnmpdEyJWKqvT0gCpuzbg@mail.gmail.com> <20240424095514.24397-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 24 Apr 2024 15:25:14 +0530, Prathamesh Shete wrote:
> The controller has several register bits describing access control
> information for a given GPIO pin. When SCR_SEC_[R|W]EN is unset, it
> means we have full read/write access to all the registers for given GPIO
> pin. When SCR_SEC[R|W]EN is set, it means we need to further check the
> accompanying SCR_SEC_G1[R|W] bit to determine read/write access to all
> the registers for given GPIO pin.
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra186: Fix tegra186_gpio_is_accessible() check
      commit: d806f474a9a7993648a2c70642ee129316d8deff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


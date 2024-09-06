Return-Path: <linux-gpio+bounces-9874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040F96EB08
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 08:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83F28B218B8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 06:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0125413D8B5;
	Fri,  6 Sep 2024 06:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="njYzfIHH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D913D243
	for <linux-gpio@vger.kernel.org>; Fri,  6 Sep 2024 06:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605619; cv=none; b=q2NmlIR2vU//GvOhNM9eaHZ66sVD/Mw51j9hmnLwvZWEHMTM3v6YsGvWRfvILm9gcLQ2k00v6kAb+djHpAMMVCOOmlZJa7aNy8FxjQ8uppxY3hARQqRx5duSwVH5PLv/jmo3ZYLoyTjjBIFYsFJvD2ZDnsoNkaX+kV94weKYPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605619; c=relaxed/simple;
	bh=tnNsEtGtWFMm/bfDuYOYLc3H1LpokXva1XZ98SjaLQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hh9pH2wRH+57iTNiQffkkiV/KSkj+vH/xdeJcp+k8ZO8la0yYlXNzApVT6ieVt6Hl14+3eFL94Z4qkT9z9f/+YYJCqOJEvEDByml9zKFmRRDGiCr/45gCYKUNifOiQNitgIhSI9XxIMDLKe7WpKEHr8dzW8h9vjQmGBkN4S67fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=njYzfIHH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42bbd16fca8so14135705e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725605616; x=1726210416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IYW21oi9yH7QqhGx5jI/FXCYiMC05lPbcPdKcwx56g=;
        b=njYzfIHHAB2xpn10XVs2lqP1URgHpBnjCMw5mdJGzeEPp6nTr2eXS8/WTJdLaySurd
         T3PihBdn54TD4tbs4UyJtHd7q+dEH1R+XknkxQr2QT6iiB1Jc9Rp/cGaHIOCInsy3jB2
         FM5hGWBL6DUzfVMVZgWA4ZENaHIH+KAM5bgjxJ2MIQAcy+14ECWetPW8DcpYpeYfWCrd
         674Kgk1NJ+YN6xfVJGc4s4gL0NYZ8coKS910GmqossF/hXIv3CdOs8+MwDurx9MpZsVF
         tgp4dPW7BGo9eX8XXaxXeoov34XC2/DAUl38Cnj6vOQxlX/PWLeENWPdKA7CUHUWZ5No
         LOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605616; x=1726210416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IYW21oi9yH7QqhGx5jI/FXCYiMC05lPbcPdKcwx56g=;
        b=DQhmDaaYbCQOOQ4oM6eASoWrV+3lAazlx8xRLMrNSJdX01LrxTlD8a1mu9fq1sMLDf
         8Wv2DRFjBxHzgN7EDLv7vfxIR1K6y7C9dk92lf7mJbfVaURS/GCZPLnqYmBt7CYMaLsl
         FzLKBWjGBxXuIpQ29g0MpMFidROB5E+8Pdrp90QtTcV+jo+2ZCrUfGa65mloGNOFsZWl
         nrTr8riH+A+qLHYgthdHWjIdKOg9MqSu7eO9P2BaVm1m6pKKR+9HGh5+u7P/HO076DFr
         JYbi/JKRg9z+OdjzY+SlWNfMFtm45Z614XEL+17l2CEHvaaOWCk8xeqUm2D1Z6tUirwJ
         bvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/5GxebqBdkmznba03fSEGEEdUZPR+be0iNjiTr+dWwjZyXMnYSTi/SSHSDfC2AcCHjqVnZE5caxd+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4j2ucLGRDZmGh+mThRV7K6DVrvoC2/M7xmuFcOEnSlCe46zQi
	ObsOg7vUaE/+yknWcYr8SYnmICCINYju13JdqW4aciBo8xVXfcA/7INXDAnDTnc=
X-Google-Smtp-Source: AGHT+IHIug8Vy6nVa6CgM+WDS6SRKy6Pk2msF4EYJa32/Liac07D4IHnwN+x/z0KCsoTZpGMOkl6hQ==
X-Received: by 2002:a05:600c:3588:b0:426:602d:a243 with SMTP id 5b1f17b1804b1-42c9f98a268mr11474335e9.16.1725605615504;
        Thu, 05 Sep 2024 23:53:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b9fc:a1e7:588c:1e37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca06003e8sm10136765e9.33.2024.09.05.23.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 23:53:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Martyn Welch <martyn.welch@collabora.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mpc8xxx: switch to using DEFINE_RUNTIME_DEV_PM_OPS()
Date: Fri,  6 Sep 2024 08:53:33 +0200
Message-ID: <172560561169.6345.488968579750809640.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904140706.70359-1-brgl@bgdev.pl>
References: <20240904140706.70359-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Sep 2024 16:07:06 +0200, Bartosz Golaszewski wrote:
> Use the preferred API for assigning system sleep pm callbacks in drivers.
> 
> 

Applied, thanks!

[1/1] gpio: mpc8xxx: switch to using DEFINE_RUNTIME_DEV_PM_OPS()
      commit: 6b5e97c020060c2b8ad286002415106ab7034435

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


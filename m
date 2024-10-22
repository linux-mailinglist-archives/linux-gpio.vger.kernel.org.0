Return-Path: <linux-gpio+bounces-11740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9CF9A9AD7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 09:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19E3C1F21916
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 07:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580C514A084;
	Tue, 22 Oct 2024 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cIfP2dRb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD57146A63
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581716; cv=none; b=HIYN/7k1fkH/RVXfhKL3ai40Ytq1wsixyfQYpjexcUetyOUVpCaxeYgsJrcaBuOegVFxq1hO8lBVyl07aeiNNpYL++YyiynfWncw+78aXT1uoLS7KKfHs7cBoPZMuq0Yyff98YDzdKddRmmlaKdZdRNKQvd8SjRN0/Mf6KsqGkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581716; c=relaxed/simple;
	bh=9CBkz29mLVQAbEQ7wTV/BYgGmzmw+enhQtCpmG1QYj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sfHPLxUHfND+kfmVgOFi7yZYK3lxmJEeH3SC9R7mhlRPj5NOf6g8a1r0RDWVYiPmFsNVz8AKJpojzKMTDtlEZxaD8gw8h9FiLP1p6Xfg9O84bQyPbAxLWZ7PuYuenAFOJ0pIamlTH0HjDyU3ElQR2wW68WxwIsvAmgULJhUAVlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cIfP2dRb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4314f38d274so72477635e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 00:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729581712; x=1730186512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15zyfNYj2lwLq+Kn4fS2pz0ncB6EnSFkoCeZ2Tc6ozE=;
        b=cIfP2dRbfQ0o98bizojSvbRX5SV5cemY6G9S6aLTngzFcXaxcJlQ2ZOGmVHqfzEs2n
         gAT9WV11590hoyzxG5mHOn6Yryepd268aDSw1RS/x3AOENhMRDoTP6TmPtM7SrV9wr8O
         mHstZRgX4B2w+I4KtpzP/6/Dqyd8tMjcnZPMhmXadYNfOXvJxaR7C2+A4/24wonr4HCs
         Wlwe9PtsPMg/qtlEaJxwPu9eYcTnudOjf1gfd4f3NbFbTGTVPccqJLtof8SyIelBueMv
         rnquE0WU8baoKH+Wr4MSJO8sXUu/5GuDB+Bc80E9n9nFG1Uy1QN0fEAeqjLv/JKSbkVL
         bT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729581712; x=1730186512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15zyfNYj2lwLq+Kn4fS2pz0ncB6EnSFkoCeZ2Tc6ozE=;
        b=IjD3mv1yfz637V7lbmo42Fk3nXa4lddxw8U9h0RFJRONiO64boj90qJ6q/5v7nHVDo
         Hh+qPfO4JXGwzGC04iajyP6RMpGRq/+xC8naBUdfP0JpFIoHimRro+Y8u8ue89AMYIAf
         EJQEIqnA0wWq6mZbWamHWfyguNUZZNFnQqHHNTFgjWhCw8Ga4lUTO05jdPvbYK51VJGu
         0n5PVtmdxNgLU9UCIRJpTPpbpUE/AAI2C9YtqgMyZqrNhPAA3KJ2Qg5BTjiTXnah0eSR
         IzTvNiz/PSsOJRb5x2giBUgDOwXzFGujzPJjqgux8o6vVhKjy30tA68wx4jjCq/KiP52
         5gBA==
X-Gm-Message-State: AOJu0YzY6PpZU+3RApsexhpu57V722dEE8ZFucWL+FOf21EyvXPOBPEL
	gxe70VGK3LFU623C3392EHyeKKWpIo2Vfp4X6IXRpqQTHyon1ChYdfsUqKmoQ3/QyxGQpSuUXQm
	c
X-Google-Smtp-Source: AGHT+IGU5znKna/XKNfNduII0UxhuAkgFg6uSzzlOrY7l/bLkNmn3Z2D5poXLeR85ec/ufvJ7/bL+w==
X-Received: by 2002:a05:600c:350a:b0:431:59b2:f0c4 with SMTP id 5b1f17b1804b1-43161627098mr143475305e9.8.1729581712581;
        Tue, 22 Oct 2024 00:21:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c8b:c7e5:66f5:b8f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a47b74sm5942453f8f.27.2024.10.22.00.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:21:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/4] gpio: xgene-sb: Improve ACPI and property related code
Date: Tue, 22 Oct 2024 09:21:51 +0200
Message-ID: <172958170915.19451.9656518623046632221.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018134550.2071101-1-andriy.shevchenko@linux.intel.com>
References: <20241018134550.2071101-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 18 Oct 2024 16:44:59 +0300, Andy Shevchenko wrote:
> Improve ACPI and property related code in the driver.
> 
> v2: reorder the patchs so we want be sure ACPI_PTR() is defined.
> 
> Andy Shevchenko (4):
>   gpio: xgene-sb: Remove unneeded definitions for properties
>   gpio: xgene-sb: Drop ACPI_PTR() and CONFIG_ACPI guards
>   gpio: xgene-sb: Tidy up ACPI and OF ID tables
>   gpio: xgene-sb: don't use "proxy" headers
> 
> [...]

Applied, thanks!

[1/4] gpio: xgene-sb: Remove unneeded definitions for properties
      commit: 8b26b8e8be3eac0a3beacf1f07bf2dfb4d679d37
[2/4] gpio: xgene-sb: Drop ACPI_PTR() and CONFIG_ACPI guards
      commit: 33319f6d3416fa00e87e9abf41d9ac98a5d5185c
[3/4] gpio: xgene-sb: Tidy up ACPI and OF ID tables
      commit: 6ebbe789fe7a65205f77289d1ace46d52f1089a3
[4/4] gpio: xgene-sb: don't use "proxy" headers
      commit: 101b259bce5cb7c74c4f96712ecdc4d204d49360

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


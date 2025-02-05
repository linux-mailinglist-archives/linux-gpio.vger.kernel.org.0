Return-Path: <linux-gpio+bounces-15403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC5A28BCE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 14:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E59168B77
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 13:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969FA86AE3;
	Wed,  5 Feb 2025 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YHuzXHUg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC863A8F7
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762552; cv=none; b=tDVnmXgWMqejmlgSiS+jwrmsE7/0TTXA6HvWEHs6AgKDdLgx8ET0HLk8ERK6aX3FsVLCW1Q+LLzn9SecKBsnfiKSF01fOsaCG8E7qg13X1ggzwf7EPtwWbrGEzj/oJrk26iLGU9H/k/qnyHiLR8cP/7g3/Dm0tVPdq5DOftr1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762552; c=relaxed/simple;
	bh=XKFVYbl0TNBYCPGbPgPe7Z1Bz3ly9Xt1vgCq9zlX5xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3zY8Q3FO+E+LVFwD/pd/VmuLyWE8h5zvNSJyMNBeMYAg79a1oZWdpDMe4RvgbeRF250ICzEjXAN6w7u/+DWlbshdYWhHB6stvYuIqdIdLUfLFvF2ypjcovyxKzaZSr+NMWXVjaYEIb5MXEzQQJirw2RTN/7KEURX0zkK0t+gJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YHuzXHUg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso50378425e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2025 05:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738762548; x=1739367348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bp9j4XjMLP8Z7a8kNkKoYripo1v8cHROzm/zXlS1NDQ=;
        b=YHuzXHUgkDlDhoMGFvp81T0DcdPBftkaT6Op+iKCTsX0Q9EwpSwdqb7D9qB+xeSlmw
         imSvEp0PD1IdAsAQCyeSNseqlPnmECE4oTQP9mjUSqfG7TP1szCUu1EJwGYzeKM9tXVq
         scn7rVgBa40OW74VFtp/01MW1V+Kpzeov4nWxypaOWTlLodoK0qGY63iyp/Sp/GmC8bH
         UxO6K35TQSEKx+VvlRIDwtv2KHBv+g3G1vJnQGYowPnDpww4+lK59ikiCuLPQXF0Vz+S
         +8WpoEc6qtUw6p/qTjIgrmizGQrW2dAaJlyi+lzwx7lUBsVHm2+gDEXHBQgturyB7QoG
         0iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762548; x=1739367348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bp9j4XjMLP8Z7a8kNkKoYripo1v8cHROzm/zXlS1NDQ=;
        b=fnPlCqQMmg0FrpO9QXEDV2tgb3kmX7hn1t5AmO1/tANv0rwRRNdITZA6VbsuNp815P
         y77PWIJKzLBRhuo0krU5qBeD2HklNDPXoyfT+QOhXqwTDeAvgwTjVks3uQJNdD53LjcQ
         oKKvImu0KrSP0/7UXCvEokzT7EMJaTWvs8N/gevfOWBs4FD48XEJmNqBuPrY7OiDlJW8
         26OYMYd7MLeCjb/acNpzKTzA32lFWguA+qr0siXjRuHhWPsvVPVG7emtJW7syMtV6mRG
         ywMnvZgpKUCRbJYc0y/u8JeGFP+ngO6nWqynT43giit5FIcFz8/59c6JM+YPOoVe/2cK
         JQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpO/VOfL3KGlANrok+Kq2QkhRbEOT5Nl9V845HM7j0k4+FE+QhpT0xpzdM4kBG0ffMgDjk3HVi14+e@vger.kernel.org
X-Gm-Message-State: AOJu0YwSb8O6Gug/PSsNVYknuq5PWHlUenxFW8Q8XndrP/9CQc4upRtd
	GGBYGD5TXWLLidVWl0FqLtc6xT22iZ25Nk37RhzHrPVux6PKYqiJtsQRBJMA2+k=
X-Gm-Gg: ASbGncvCGHKrqRvnbMVACxSYoUAcHBfiq7I9wEIHoc/OexGBdrZpnLeMskCp+AoO7uy
	NUdnFiyUTtehyG9YO3CnIPdFdzEUygYsn8qsp94zI0kwZG+XfF1hP2aErRTIXk+e35OGGd6OqKz
	v9PCJaSduFfmYBRNbRyy2Uo94CNgLRDyPPVhVY+qTW1/C9C1jzcH8yiW9VBMkkY2B5uKb+D1jvo
	i0bIJT4DWZFay8bABfgbJLqj001QG4/fM+ZtFmosw0npoQ3NEit2tUeoalMByLeM8bmgN/GvS/A
	iH+MVH726usCUjc=
X-Google-Smtp-Source: AGHT+IFx7aFM8xo8nLFvqyCw+urEnYhqmpJUwyeIbQXQVWa8amEJ8YpnNz309+eEBnVR4jgKXUOqtA==
X-Received: by 2002:a05:6000:1547:b0:38d:af20:5f25 with SMTP id ffacd0b85a97d-38db48cb72bmr1732135f8f.29.1738762548159;
        Wed, 05 Feb 2025 05:35:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3239:b668:f15e:fed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d966faasm22045115e9.23.2025.02.05.05.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:35:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/3] bindings: fix ordering of releasing of gpiosim resources
Date: Wed,  5 Feb 2025 14:35:44 +0100
Message-ID: <173876253650.17639.15958896535528300544.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
References: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Feb 2025 14:25:02 +0100, Bartosz Golaszewski wrote:
> Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
> instantiated device depends on") uncovered resource management issues in
> bindings tests (C++, python and rust). This series addresses them.
> 
> 

Applied, thanks!

[1/3] bindings: cxx: tests: disable GPIO simulator before releasing it
      commit: 33a2c3dd585f5b57d7fd1f676c46194aa863b5c5
[2/3] bindings: python: tests: disable device before releasing the bank
      commit: 9949cdaf846167aa590cbb1301c8f49090651ab6
[3/3] bindings: rust: tests: disable device before dropping the resources
      commit: b376eaa86215efd725319ba3508c01d9c22dfd10

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


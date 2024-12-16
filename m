Return-Path: <linux-gpio+bounces-13903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1DE9F2C87
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 10:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACA8F1881ECB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 09:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C625F1CEEA0;
	Mon, 16 Dec 2024 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h7Je6kvV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1828C2E628
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734339749; cv=none; b=fYtEO2Df+F4AV4EcjKyNuyq25hfkwTn7SMJmhG2OV8AO6NODUr+oY+LeWKZ44gsVnbVG9bPem1QVX0DLeHB8caCZxgu0YMhugebtQndd6mN38da46j7shNTpl8W+f3jzF4XcdLryepFa82Un9Fhm6P4XIBCAPxVrqkPgjYkxxbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734339749; c=relaxed/simple;
	bh=U2gDRI6o+ZiZcITGNgoY7NUnp1QMTw7q/baXkcs9UXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W4tnY04S93GRrNPTflPdfvQoYWRCl2HaABdpzzoUi0v/G1hMA+/YMzyPJIyCT7TVP3JfUIyfKdl+l2Cf5pxoNaTL53Q3Hk/qGadplqQIKxVjzJgvd+fEW5xxMCFK1XdxuNaQ6K4JIseX89ndh9kJtomrKqSznnYzHic+/93B48c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=h7Je6kvV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43626213fffso21407095e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 01:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734339746; x=1734944546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wATqsn/eENM8Lez8gF1L7O+yyadA6Ly1WVoYR86y7I=;
        b=h7Je6kvV0hbTidkvYtMXF9pDb48UpsTsotnU7z6Dh9tNwCUf28SmYHCVQElY6x0kcr
         /S6ny0zxMmlfVo4AxhzAhvqMgh45X+4zlpNpE4aA5xJh9JwXadL8dUO1axOIY+VoJWf8
         g/ZQ+8/AqPYLdoXlvWNwQGgLI9stNIS5iW/ZIid89wPpzYLRTjL+SScrWhPX826igDC3
         plHrtuMh4v4+1F/2e9tFH+GS7pkRGC+fVGeQzTRcNdmELrs+kIMM/DwdaaPBm0g3lEGS
         q3KQ2WoAPZh5atpPRSSyN/dPli7jRzLOw9kf2h8jxtiwCVWhBhULj4yiEeMaDWex3WRG
         yR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734339746; x=1734944546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wATqsn/eENM8Lez8gF1L7O+yyadA6Ly1WVoYR86y7I=;
        b=xFxMAuMM/RRjhlnUNUAhjR81Ke6mjuuqXWbeUcsuZf66qPNjZREy4N9mXlrxFNHNa2
         tE+r4RvFrGDiRzrNOBU7QrVu//Qjy9Mt2kepfPCtznmHvxnN+9ku4+zqCIjLCAYfhLgT
         8/0BVh57mh1YPB2W/pHvUC7JODkOD0PMEoCryjdTtQawTS0kLnyxFgWMh5vW03Kb2087
         SIdveRHgFaigDpFpfQHX3gY+62GeZujw+VBKm4HOQPC8ONgVcTs8/Idt18BIi6cVhHGQ
         gAfeFUVUOM0DD3cVo7cqp5KSSOerTo11+yJnP9IllaVH8y2XkR7U/C1nskuYKKIiITMD
         1tGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/FFEYdL8KavzjBuSSQH5d8O0mtBXTQUlvk6QEot5Jpou6IxholiKsUHHH7KnKNZX5xbKGF4znaLIJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlC94GmgHziBc6pniCVIW2by0qb/VyKQQMH8k9HqZkmA35YyR
	vqOjghhL+cktITrBhbDgK6+a3vmnbnB2BXPOIc9uMk1zBVBK3TKevxidgUPR8zE=
X-Gm-Gg: ASbGncs/tdo/Ocy7YzgJGyMR2bRvt/mBoGudQUpvo+736LH53fu4SLCe5rFtXWd75VQ
	WjdvIFDqYCcdYpbdC0xTb1ctNSAui1TJ9YID5lpkyKGndskmqdbRzcug6vVbcjS8mJzlyiGK1vo
	WTl2GicFj+YFFqnsE2FJpJZfY4CSE8oxHXXbBIDwrgOZj5WMc7XTKlOD3/LgZjUuLqjXc0R50wA
	Jrlu6qe2CGKB69g2j9yvGl894ub7dpur/PZHgAsnHZGn7akVReDuBO1
X-Google-Smtp-Source: AGHT+IGycKITqRB6syrFQHJ9oKD3n4ajGhElTUsZtv8o/7RGTau6nFuwnH3fxgJ2PoJsus8jvug5ag==
X-Received: by 2002:a5d:64a9:0:b0:385:fcaf:841 with SMTP id ffacd0b85a97d-388c3a7ddcdmr9113199f8f.23.1734339746213;
        Mon, 16 Dec 2024 01:02:26 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ddd7:943f:c7de:9971])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801bb00sm7448078f8f.62.2024.12.16.01.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 01:02:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] gpio-tqmx86: cleanup + changing directions
Date: Mon, 16 Dec 2024 10:02:23 +0100
Message-ID: <173433970413.37432.12127590828071064437.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1734001247.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1734001247.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 12 Dec 2024 15:08:04 +0100, Matthias Schiffer wrote:
> This is the first of two series adding new features to the gpio-tqmx86
> driver. The first 4 patches are cleanup/preparation and the last patch
> adds support for changing the directions of GPIOs.
> 
> Once this is merged, the final series will add support for new TQMx86
> variants (SMARC and COM-HPC) that feature up to 14 GPIOs and full IRQ
> support on all lines.
> 
> [...]

Applied, thanks!

[1/5] gpio: tqmx86: add macros for interrupt configuration
      commit: 2a485c83787723671b7ad215e4e141315e46b311
[2/5] gpio: tqmx86: consistently refer to IRQs by hwirq numbers
      commit: 0ccf314304ed5b83df7470a8ed0fe1b6ed48fc03
[3/5] gpio: tqmx86: use cleanup guards for spinlock
      commit: 2abb6e53b5b08987265946b258ca29762091930c
[4/5] gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
      commit: a1389f5c128e80c8ad3132bbdc7b5061f3710b7f
[5/5] gpio: tqmx86: add support for changing GPIO directions
      commit: 2251fbd05f2357927fa5c5a8dd955f84da883008

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Return-Path: <linux-gpio+bounces-26929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4EABC86B9
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 12:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC26F4E6CED
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 10:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9813A2D879B;
	Thu,  9 Oct 2025 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vd0SZcSb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9563211A09
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004753; cv=none; b=RHuRZtO8EGmr0V2LzavaTKBBHeF0aX8Ybg1adIML1aJc+RGXO1neTuoRRg/AhYyWeZsO1d1oTqQJnO7UnHy1nKFghZ9sv3VuaHPQxJl+v8rmVxfocdGfe79RQihXfFmz+jwRbRd9o+eNllJ/LIV+mLxdnPqmWjnuWK1YQJB801Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004753; c=relaxed/simple;
	bh=JTtVIAFYf35Hh8feLqqWv19+tcpgXwV0O2h/lrQZ+LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kt4Je2x/urFGjSclN1vb/SwQY+8+TOcgak9ga/K3rDyXdwu3hM2P8/V3HU1pitG4mpKxicQiYgl+TF8A1uyPayHhe2zbFIDkCjkxlDPFsHva+lwvTvt8lSCal6hcf4kKim/wSc6sjS6XTEu6ijdPwrW7uOrR6yRAIp+aPFgtHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vd0SZcSb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso5834575e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760004750; x=1760609550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SO/OcY1CO73Q6LYMqOLX5PvBUeNoOpjpPrCz+L7Phi8=;
        b=Vd0SZcSbAk/uJ6FmS1ntD7NdOfhIZQj8BKd3C/Bq4JUb78zQtlry38cUxTUODbVc1h
         VDhiYCI6usbZcKE5qaCF5hAqe82UdO4pbi0e3feaRimqGN9vCOh4RlJOfaNnF3HCbQ4I
         VO4osTdYxL4qEqr3zAviZOBqDCBUtL90eOb05FxPk39GofwF6YPK4sZ+3vXdPXBiJhNj
         0owdO4vg8QX6LA0k8xP06xIA7PDQtCI4Tb0Lpyq1OoNQlGd8J1VsoQ09HwCS8Aav4f1o
         /bIMDZUcz4HL0bGitT76uU95b6IWDq0GTlJDGUtLObzzWgcDI1WtuYkP+jDCwQviOVIp
         JXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004750; x=1760609550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SO/OcY1CO73Q6LYMqOLX5PvBUeNoOpjpPrCz+L7Phi8=;
        b=fmOQwMddtaC657AZzr7g9mJnMyLuoEblYsqCZ8wzcLFw8UxV695G7NyDsv3yyFnnxF
         VCncdf1H7CaDMytbpfu2H0Q8ThcDpU1qaqC45vVpILJqhFVFBvj+3N77pWF9/1HTYOyB
         ityF9tqVFzJMgDIfIsIhkp/AcvdW4mlErwtDjmhqMSJpeLKw+wYnYuhcWEXHpxplF6Ry
         ADTu9ooIMle3Vti07qDvspr3epAvY0o4pgU0tig6jowKpFrSqzJ0RbXGgKVWH2oDWv57
         GJJEk7u8I6lZtTg4ZVpgMlQC8bLbxYCcD4uUZSDScFbsdjhTEpIctqlkXJhHTEuIhzQn
         Yo1A==
X-Forwarded-Encrypted: i=1; AJvYcCU/6/WR3mUao3djZdGQk78tItkF6u4cOkyqq7rH0rqZN/lJ4ieBaz5Hw0ORREtDr4Q6JXmJKOcfwdnF@vger.kernel.org
X-Gm-Message-State: AOJu0Yybq0We7XyagGqLHRj081Yyqa+1eFy6kAZ2arEuPeF+w4a0DhU6
	0joy/eLxR8XSQG1RqUC+b03PILCaRCPkHmq3OiFeeGSAgyQds46o/rp2DFBxe+EL6xI=
X-Gm-Gg: ASbGncsUB8CU1XjTtobz4Safp11P1tIfiRa4f/IQik/bvuTol0r67LF3Un6avO1JEf3
	dlUNkUloR697laxKzcDuJNyySP50C4XsNV1pXhMZnAB3C+TH4+x7NtEeXOyBgQSfHE80MJtrRQH
	GBx1dr/AOtT6O2zxRWddQniSUT+zsS2eFx9hXAUXjHVr22y39WfI5BvOPdFiHKBJnj/W1VKvSkR
	t4ivBUxIzR+Tg4kBHloXmLNwKc0Jp5Jn9ZAHqAcecTH1aKEjT6hyLXLlC2Z5HAu1vYqA3qHczc7
	fyraFM/aDsU6RDed9j4hRunyJXCd6BRaJe4vwEZija6MQnsRAVEKzMHhtB1IIyOHScvGs46tg3X
	IN4/xpuZEX17IUEArY/9uOpvzgER4DbPa5qD9JJfDgl/NW5c=
X-Google-Smtp-Source: AGHT+IG9djRtuVw+ie4GfUE2fCKVw3VDvAD/MGwTeuRqIhTj3DidnkwSdyN5TC7cZH1+rVL/DgOUoQ==
X-Received: by 2002:a05:600c:4ed4:b0:45d:f88f:9304 with SMTP id 5b1f17b1804b1-46fa9b0e7b3mr50062135e9.30.1760004749930;
        Thu, 09 Oct 2025 03:12:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a78:91ac:9309:82b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab633badsm34723735e9.3.2025.10.09.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:12:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Date: Thu,  9 Oct 2025 12:12:27 +0200
Message-ID: <176000470857.91617.1046632810440589541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 24 Sep 2025 16:51:28 +0200, Bartosz Golaszewski wrote:
> Here's a functional RFC for improving the handling of shared GPIOs in
> linux.
> 
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
> 
> [...]

I'm picking this one up for fixes as it addresses a locking bug.

[1/9] gpio: wcd934x: mark the GPIO controller as sleeping
      https://git.kernel.org/brgl/linux/c/83d314fac266a3d9de61e4a4490c4f2eafc86b05

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


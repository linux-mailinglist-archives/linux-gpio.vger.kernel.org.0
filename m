Return-Path: <linux-gpio+bounces-21650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 604B3ADA9E3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D38943AD5FD
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B90C1FFC74;
	Mon, 16 Jun 2025 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p6IuIV/q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56A41494C2
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060353; cv=none; b=Pc7PD69LnN35iBT/jCXOxI11sQeG288Jaa++39mrBvsma3jfFbJEYEDl8QIv3tEwuK8FJz3Qyo0LzCG/za4o+GXfeTjesVKwL3QxdwUYZuEj+LBK9mVnND+hy9dyISuFGiTsbrEIpgeO+z0n0/Wwp+TmOxNtEEXeFyABPefxbsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060353; c=relaxed/simple;
	bh=XNXlaoAzz+oQNCL2X3wL+nHvZuwvlPXZ+uEskKSsuj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tiy4o5m71qnInkRDMDh+y3mDJOqAYK7Hh/IyCgrh5UfFhZ4D7OJYSSCqWHc55GOFI/H8VosCvXCSbpvI5s9M96MJxQHVpw7W/yb5ElBCLzSdiXaDMexH9uP2sefMmDJql7U3kbJt4eWJH/cESXshp0yqY71GtnnKyFf+tX0uOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p6IuIV/q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so26868475e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750060350; x=1750665150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuZ7ryNA5tj6+VLj2Sq6P0eo79hP3I6BooUtB2sx2bc=;
        b=p6IuIV/qhv49OM/wZVB1WQeSpeqBa6rXoXkvI6/zPoWkleHHK7xNPKqIPNQ8qyyKm6
         1ir+Wg8zXhF7TMbQF2CiNo5Oih8PyIpW92b2XvUAH0pQXzQxfAtd/c4b7X2bb3tcWe8n
         xWNGokFS9foC01/7YFXB8YmNomh4uxddjBtl5aZh+i0/1edJlP++Z+ePhlANrV435KJ0
         maTMU7JaCso44LooaOgr3floxZPpIGixX5ze15AUBuxO4QYH7LdIKSlqpIz2ayE0v9NP
         LdYZQKJqMAVVr9Yjpa5h6zbn51i/e/AeUvZpJQSZtkoQnHbMmTNs5CQlxySpR3+mfOiB
         xtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750060350; x=1750665150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuZ7ryNA5tj6+VLj2Sq6P0eo79hP3I6BooUtB2sx2bc=;
        b=PaYpCxtokSup8lrtd9ZqtHDSwLf2RWTV3l/ISHUL+e+wjKRcG9rIcD3WZMGFye/YT4
         ljcsK0V3FFAScyUO8IuR35Veq9F69bPdUluV1dnnLUndd2s4GT/5PBF3uQIuFrM0YeHX
         M0MYIfROOUMAtJEdb4QRpVuuQTXjvpmr4WnCGhWxnikeuyikoIfHYGHPWfFFTq/cv3Xx
         CkGawRxaluvq8JHAOQcG/EeHIojbch4W6kr0oL9pbpFG/5a6/HFVRUYAUvuZ0e/mv1Cd
         d8CeVa5gLevmYvECnwNA/Azqg/d8/xk88vVIw8yHizTtDZEtrj2iXeWAbmo7j9bgljRZ
         ZlMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm9SoUMFztTSNADpZe4Y4QRTREL9WXt0zBua8TSQUIKitmxpAPOl3LrY2UqDcNQPQm1A1NgvI1Upmv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wbS7v2kueXPtxX5244+YAYvs4XYhl2wjQse1IRsm31tM2M09
	zgG7K5HLfh6Q2Jar1NVDHxCAk9q44CE/rrjsPajrYIzmCQAeXk/qjVQ+pGzpraAfBmk=
X-Gm-Gg: ASbGnct2YuI3r4rO96lWp+5loZUsB1Wj2/joq3EklZDTt7X78kmUpuDoSepWZ9Wr6Uw
	FI6s9DirAX5iauO8Acn3zGeL600w/cGz8pcxY6PaLDlzs953jH+3AqA1ycGwOFPGUkQm+a3ujT3
	7A+5Ukkd1XLm9vOaSVkvMYRC54q94SaWolL/aS66jtBtHd11ZuoKn21Oerlng4jUdwF0qLyOoGm
	c5NgyaRVHdA+rZUlFXNpNPAyL6G+2+oiAbPMOPkHpYlC4QD9kjH2M+c50wB6MCojewdpqrsBUpb
	jWFNwTndMCzl0qdFfLGfcOACzYZ7KJDLqmQQ7cpVvFusFSxJFF3xLPzHdA0oqg==
X-Google-Smtp-Source: AGHT+IHXRXXZYRGpubgH6HhObOmp8EGF7T7fg1ywZE0VXlicZkh5PVgGSBSmZjmIyIfwlxbLRKwwnQ==
X-Received: by 2002:a05:600c:6097:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-4533cb484e6mr75561385e9.19.1750060350043;
        Mon, 16 Jun 2025 00:52:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24420csm134888355e9.20.2025.06.16.00.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:52:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: raspberrypi-exp: use new GPIO line value setter callbacks
Date: Mon, 16 Jun 2025 09:52:28 +0200
Message-ID: <175006034577.16922.13168351714262147379.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250614111216.93677-1-wahrenst@gmx.net>
References: <20250614111216.93677-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 14 Jun 2025 13:12:16 +0200, Stefan Wahren wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[1/1] gpio: raspberrypi-exp: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/367864935785382bab95f5e5a691535d28f5a21b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


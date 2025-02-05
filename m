Return-Path: <linux-gpio+bounces-15407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA4A28BF2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 14:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6277D1882635
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 13:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFFF135A63;
	Wed,  5 Feb 2025 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0kEnSMJ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909EB136658
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762805; cv=none; b=b52v6+Bx9VIyypsyitFDo95tNkRObadbTfL06RWX/pNXgZbG2OKTm3LiI3EFbN7bH3u6X043M6AfdR8LAlH+iqP4ih7jG8hcPim7hbMSs9g3CGrKQCY+h11wHct/E9MkV1ox8dbNpC7I+XMVZNC9vs9sIflh4uSeW3npEcTNUOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762805; c=relaxed/simple;
	bh=to0rndXbutpCdbidwW+dqd9uyYlNfoEbmkQvSdSVRow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dX9KWpIm8bl4EHRirmXfoPi/tmPdKnzIdkwE+oiShCOoijMl3UzNW2Iul7Vxjeoix85lygQ8Nl8JDCkiDb9RCbHcEvXGm7vd2QHTiJnFuC81zKxqBP1vdluVcdkov8Moq4Cxy1gTaaR3ItrFr3nKGn+gLF3tkGOy7p3zXabmFFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0kEnSMJ2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436249df846so46760965e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2025 05:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738762802; x=1739367602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jiGn42kvvsu9ocdoHUA3wGODMdKmSTejfdkpV2G8qU=;
        b=0kEnSMJ2JO66/e13CHlOrYuYu1BhaVtKYh5bJbuJDWZ1slzOAeYNj+cgNKyM40a2Dm
         YdPXX3C6lyu99rReB8abYCBWhPkqvrJz/5FriaQz6ItkI8YKdLzroO8Jgiwkosehf6Sd
         +Ki9a4UZugLjgOFwUhYakE7RpBrJYF9dv7xcNDrOlhDWEEesE1NDdQJ3p5Q3hGWW+OKZ
         xbIlUugV3UBnEfco+BSZ7xML/yCPLC5WR8xwTca/9JuwTe0lEOUaKzkPE0gg3ysyBdO8
         JdLKJuwIQoSxrVOr0pEFACRS7pUPbdPpRCu5Kf+rkqYyTgLws1TCt9KezsI1+fQMgwha
         Xrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762802; x=1739367602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jiGn42kvvsu9ocdoHUA3wGODMdKmSTejfdkpV2G8qU=;
        b=r6q3aD3nul0hb8/xENJhA5kCGSzpr9vGQ6I8Kr+n3CmfRbf551jXXChx6T0lZdmQRd
         WhHDdtE8EriWCv1CGjrztZIeVETBCR7qfem1zSpCLplt7XQXXEqRlcf3Tm6jqj5013Cd
         9vOUeSHRnJ1qhkgpFvBbbvFzcDiH5jmMuBBKLMtTiGuDk8PYnQY9B0cYWHlxvNr2wDIN
         CVMNM7gZGAHugNA5o+7iG/jx9yuQVmJwzCH706TyYuGNBPvHp2ScIZpR4z0L8ysNM6kY
         gFf3dF5Mh7xAsFQPkwWS/as1gJHDZ5Aa/Z6hyE4eVOrqqDSVbJjdh6LQx8pkOf8hMr6C
         SKVA==
X-Forwarded-Encrypted: i=1; AJvYcCXYXEcJRjHTWVUxaiE7VtXaflisu7v8GmMxliqajQp1LqVR4f3fl9GLZlS5w817DW0qr+/GoC0OmDDb@vger.kernel.org
X-Gm-Message-State: AOJu0YxFayv4XlCLr86WYzPPxapPSdCuYh9/wYdlLAEQHdIDtRF7z4G9
	cR02GWjmrPGJkdX4tpNYG50rsjzxAc64ta77zZR4B29xLq7EyzUbdDdnAOHrcOQ=
X-Gm-Gg: ASbGncvdz3xGLfolV7tYeE14GvdnJEpycjqPTVyQVs5V2J/p4mNa8nQPMeHQRrzaQs+
	cilywIQhG4rSvyajiQLxIeWUufsgU/kn0vqQpze7zq6OVbFG4TE+k9qLTNB5Mi4YPXPanNO3bmH
	UnOlM4VLq0OS4rcipNKzIozEvd+2sMVhTMqiuFqov+plZEg4vaYbY1flmMJWrhYYyfUv0lNENTd
	Bgit3EeGDf0XmQHYkwzx/9CRJGPIXgftmHNo2yjfL5BKmYrkVvEoRBc61R5thBJY/p2WbKhehZr
	aRBFmpkgRc6HyXw=
X-Google-Smtp-Source: AGHT+IEo9hIviDYhb31r2hIrMu00KPJNKRFNZRRwmU6V/iBqIa6axOmyAKUSv1JNDBSNjuzq7Fi29g==
X-Received: by 2002:a05:600c:3b9a:b0:434:feb1:adae with SMTP id 5b1f17b1804b1-4390d42cf2bmr22533925e9.3.1738762801531;
        Wed, 05 Feb 2025 05:40:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3239:b668:f15e:fed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm21974185e9.3.2025.02.05.05.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:40:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andreas Larsson <andreas@gaisler.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend] gpio: GPIO_GRGPIO should depend on OF
Date: Wed,  5 Feb 2025 14:39:57 +0100
Message-ID: <173876277707.18360.8561413925372301898.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <db6da3d11bf850d89f199e5c740d8f133e38078d.1738760539.git.geert+renesas@glider.be>
References: <db6da3d11bf850d89f199e5c740d8f133e38078d.1738760539.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 05 Feb 2025 14:05:03 +0100, Geert Uytterhoeven wrote:
> While the Aeroflex Gaisler GRGPIO driver has no build-time dependency on
> gpiolib-of, it supports only DT-based configuration, and is used only on
> DT systems.  Hence add a dependency on OF, to prevent asking the user
> about this driver when configuring a kernel without DT support.
> 
> 

Applied, thanks!

[1/1] gpio: GPIO_GRGPIO should depend on OF
      commit: 5393f40a640b8c4f716bf87e7b0d4328bf1f22b2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


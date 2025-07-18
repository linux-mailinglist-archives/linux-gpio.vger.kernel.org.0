Return-Path: <linux-gpio+bounces-23448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5005DB09D27
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6175D165DA8
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A1629DB84;
	Fri, 18 Jul 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cd9Ca9UM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC6292B5C
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825392; cv=none; b=KsNhhbWBnyWFtRTxFlb60kxA0Oqo5iWy/+YDa0dNbewJrYMX++wnNQeeHBpwOQIsseyrZqQ4MiAiVwyfpRSbx6M2phRtH+E7xWw5KRh5osn7iuQkoL+PlwvdNuxC1xE2JYA4Rb20iKw/dxt9oTbGPX7mj1C14sBi9kF39t8NBbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825392; c=relaxed/simple;
	bh=C9bqcrGBhTrsWpfUjOW4kU/Mkn12SfkpmSUDhAhPK+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LjGx57H8qLJFHlWrxBBri9s5uHwxsZ822YsOrn7vo8xaI6j73AWnjsRXgr1ykyn2fGAuyuF13M1T6XKpjyMuAbhx7h+umy6chLDHDDKjqUr8ZK5whG2/H1csHFKWNAp8LYnpbAbBS4q+OQa0uaRqdeCfhI5VZbFxac1kt7WdKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cd9Ca9UM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a52874d593so1422640f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825388; x=1753430188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2WjJ11dRN5Gip96AGcE1HrjIgLasYoR1jtLMOpXHO0=;
        b=cd9Ca9UM/JJ9jTuwXzHFn1qxbb8pXmcWnK502LQlyY+FLGMT7OdfR/zoEXZ6zUqaeV
         edgGEA3tJTsbDoObg3JgBTmU+0ud8xQOCQWmqh6hAQi6l0tCQMu/H/Jhne3QOhJarBwR
         pZceQvTUuJbyR8xdrNmtJ7NQigHfMrMXG/9xT7OgZBGxLkvbvKn6Shp1xEeBGydTtk99
         pp408/vFGghdURM+XupTpTyXRGhKWX5DLm+dxoJzGMGR4Mgvj0C1YjJwozd7+o+szfKm
         jq2OypeDFvUDZBtUlBxVIyrADORZ9gyBr+VmjhFOO11t6BBDmaVTTTqP/e3wvpBeu0sf
         rzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825388; x=1753430188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2WjJ11dRN5Gip96AGcE1HrjIgLasYoR1jtLMOpXHO0=;
        b=YsyY+cVZM4aC8SmwW1A6WDEFpnU97Ebb4AwgZMR1JUsp6jiTKysDH2FSh2e4XSQ0zh
         6yt5AUoWh2KNYY2KXMPxr8tmnq1VUwv3EBfa4zpH1PiCUM0Trzfo77JvjMQxlflNEKvL
         8x8gF9eH83wpP/FSEQD2+FcINIsC4Qa1+3XdmHiQc9t2uTGiU+X7R8O1OpUvSqRPtpYZ
         T1B2SO0kgT+cy9VVlNlhzhqarnmeEi8FKjy4GsVWLoa25yxPI8qV245Eu1DNjZkkvP1C
         AxbmkOnZVg674XLqPiOXvY8HIrw80SnmViheB+Jti0DiAxry5Eo5B+Ex17X3+dYsVAtu
         oz7g==
X-Forwarded-Encrypted: i=1; AJvYcCXoUKoECfss3xmrj8f69hgDbgaCcwjh4DytJWkyv15ZRbx75oXGQB/X9A6GGQn/21bRM/3RlKg0ZYss@vger.kernel.org
X-Gm-Message-State: AOJu0YyWUGgQjVWBxfNECY02XYXFIXalqdIkw1Jp5VfJSS5mPmjLvfYV
	mpMhS69XKEL36xQTnYD5+nIFbaGco0YmLIPGRJvT2vQKuCystJEJfhP9YlDQwW0eKxU=
X-Gm-Gg: ASbGncu+Ir+vjugPcUGGjQdIYTc0Svu5iqfiCUR4FaiB0fLMwDuWxf6ZrYOLk5+cVbp
	qbLC4fb72ABjJMZfKA0CWEzZPZKmG6wNM0+WjuvcFaNDIg2DLuZHAnnX74lrMGt3nTgmC3vFJ2g
	2h/nZQzhgz0hfd5tofy7+inM2UYtCJFWnWbbrrMOP9/Xm8iod/bEOJAtcaiwj66hBBGfe0g4UiT
	OKtjL1Hv35dI1c0M9ztnxj5NGvWqfKr8LpJRRCDC5JKOsg74uFYxQEneTNeKjuk2eEDcfsWKFn+
	lBVUbERmiupeVteA/aeFrnydQ/+6lOzc65gvyl1//nIKe50XPvEz0KgfLOwFhtPdGwcU50EUWWn
	u2VQ9gjkTd3qgFD5B09MkES0EU/GFVpU=
X-Google-Smtp-Source: AGHT+IFzwWzItXEyAswXF2j8T2V3Jltv/4LmwN9EFBQ4BjRqOu8vs9NQK02Z8i9W2KisnoCadrxSJQ==
X-Received: by 2002:a05:6000:2209:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3b60e518cc4mr7354018f8f.42.1752825388439;
        Fri, 18 Jul 2025 00:56:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert st,spear-spics-gpio to DT schema
Date: Fri, 18 Jul 2025 09:55:57 +0200
Message-ID: <175282531515.45055.9916675888040268718.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202753.3010240-1-robh@kernel.org>
References: <20250714202753.3010240-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:27:52 -0500, Rob Herring (Arm) wrote:
> Convert the ST SPEAr SPI CS GPIO binding to DT schema format. It's a
> straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert st,spear-spics-gpio to DT schema
      https://git.kernel.org/brgl/linux/c/3a315c97fcfac3785060c1980d0a81ce76a24cc7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


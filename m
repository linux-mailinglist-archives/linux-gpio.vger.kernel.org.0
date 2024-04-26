Return-Path: <linux-gpio+bounces-5877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0308B316A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 09:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBE2CB2291D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 07:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B687713C3EA;
	Fri, 26 Apr 2024 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nwUdAWLC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A35E13C3D2
	for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714116818; cv=none; b=TWbQMGfGV4r/8Pz/BStjk4BoGMeRRFQGo9uQnnrndRAFcaBPknIAeSt3g3f7TmYX4OesO2BlDmyrivianoXJpkUkjz3OgqYzTjmGxGbNcvYtFoUAv3v8xegXh97Z6XTOludKLNgEct1kEima9htmlcwr1zH7A3zJ8xmv/oIfugY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714116818; c=relaxed/simple;
	bh=9ePKGoQQ03Kw1+fDy3bdzYL0h8yQNi0slcWIGi8PPz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EA1Pi1Cegaej9/Ykril+D2U0A9HoDGlgs+rQJI/YjGBudDo/qo1K2xdRe55RO0jrOXBWl6lELR3pB2eodVjHex5kCbXz+Byajtvy7Wbq2EPGlLJ5GP7oSLPaN46A5ff9IBcWBS90v3xqKYyK1HuKv9LV63h3DE1BZxMlrKeDVE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nwUdAWLC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41ba1ba5591so583205e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1714116815; x=1714721615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZHhtC7yB+LEmKe67OSuhKeCGfLVnVMhlXHLt/YBxSQ=;
        b=nwUdAWLCQAVibxOIv9dBJjOWMuCEynyJf8vmZGTSY1cZGSYEtHfijdiFNxGSsjUnuV
         5fADZlrt2oxtVDmhZoD2/kDR+dDFGmDsQYgIA68hvgM0/8wkrCVSIMJz1R1gy7yKLbBl
         FFGBk0aLhRqK56NvVhcmB709dNJXoAlgzkdqCKZZiI8qfKkVZSnIhokh0wOwK4iRPBAG
         OpOw0GO8uysmQnc5CdNJg3QD1g8BsezYh4muj1bCHfFHsqQpFjOYhDV78RH131PoKxQ/
         hHox7UA8I+qOrIBZfWDat/UPVTjGp3uOq1j0JPvoqI9/12+MDjIzHt/3ydcHfW9mG7Fe
         OlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714116815; x=1714721615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZHhtC7yB+LEmKe67OSuhKeCGfLVnVMhlXHLt/YBxSQ=;
        b=iNaP+hfvcOHyPaWHbaiHqHvQ8TgIdsC+BdplbLSTvxkYdJFagcFPECFTqLZqeBJ2Tj
         wnOGYc8U0YaXscz5bVzZKNh8Kvft34OQpenrxmhryiSg/G4SkLJK9TLrYOGc901jay1m
         MnF8UEYH3YSOKS2nb4V3qulAupnm3zK7gE/o6NlQQU4eowqydxpSxlAYt1lYxHNTZBWh
         1n2D3WIEUMlEAWklFr4Of8AdIuTwzHPBImu1/vEM9jloLyRWguRNLKzDUxsKcGeuc/bR
         lWeZIJqe4CmgAhTjeqXVELbCEj4OtNECj0oCKgbeuuJv6y7twixpkkUHO6f7RVLpQf9+
         +fYg==
X-Forwarded-Encrypted: i=1; AJvYcCXaS1TLLhwj3GGdvO0TIAcKkBkwWbH4Q1lk3kmFwa5JPzpN0qXnxMN4m0+HDK/kv6N3r792qoe3BBykGNh4QGCgoQscBTEwjhZU3w==
X-Gm-Message-State: AOJu0YwBPHC4NPEa/QaPjK3Wx/3CCmFZkF6swQgNhawB4QB2rX3siKY5
	7k+aoyJpG7nyQgMU7Tc8VQ1vT6GaImWsXXewdvRcgQdhwh7ndw2p115kR+Af9Xs=
X-Google-Smtp-Source: AGHT+IFAYmHbznrVYvrFyG3S4RgGzbE1l0SOZYxWBq+xKHGXgg5E4ck93IiPSX+DZnp/DKsyl3rmgw==
X-Received: by 2002:a05:600c:470f:b0:41a:8374:7eae with SMTP id v15-20020a05600c470f00b0041a83747eaemr1364455wmo.31.1714116815390;
        Fri, 26 Apr 2024 00:33:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e63:d6ed:67ba:fbe4])
        by smtp.gmail.com with ESMTPSA id q15-20020a05600c46cf00b00416e2c8b290sm33935449wmo.1.2024.04.26.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 00:33:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Doug Berger <opendmb@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] gpio: brcmstb: add support for gpio-ranges
Date: Fri, 26 Apr 2024 09:33:33 +0200
Message-Id: <171411680836.6435.15788506275238936215.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240424185039.1707812-1-opendmb@gmail.com>
References: <20240424185039.1707812-1-opendmb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 24 Apr 2024 11:50:36 -0700, Doug Berger wrote:
> The Raspberry Pi 5 includes Broadcom STB GPIO IP as well as
> Broadcom 2712 pin controller IP.
> 
> The community has expressed interest in linking the two drivers
> with the "gpio-ranges" property in device tree. This commit
> stack implements the necessary changes.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: gpio: brcmstb: add gpio-ranges
      commit: 7c66f8173360556ac0c3c38a91234af5a0a5a4a9
[2/3] gpio: of: support gpio-ranges for multiple gpiochip devices
      commit: e818cd3c8a345c046edff00b5ad0be4d39f7e4d4
[3/3] gpio: brcmstb: add support for gpio-ranges
      commit: 5539287ca65686f478e058a1e939294cb5682426

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


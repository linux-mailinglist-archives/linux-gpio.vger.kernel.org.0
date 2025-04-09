Return-Path: <linux-gpio+bounces-18539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3771A8202E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4B554A3480
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 08:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A92225C70E;
	Wed,  9 Apr 2025 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BoJbaHJO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84022D4D4
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187750; cv=none; b=nEqM4/Pz9aG4ZUH12cEoNR00kEXzqWns/umXh1dxrEah2aJQqDRpzDW3tWYTEme3ukAVIdnhgRt6SwEwoNUXp42SEhoLCGV00UWG9GUBphKxXxJqw72rOXIC1eNydaUd2PnNlAnOSZ1QqRnW+O/b+lJ8Vl7mVDIJF7dJW/4YmQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187750; c=relaxed/simple;
	bh=ETDEyyHWHJEIKFXCApELl/R9sLYGdCkFQ8AFXJvJsQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MTyqH6kryvUd3C0ttxHsupROvMoZhqJSKIGKr07/GlRP1BFxb7ju+61N5OoaoJLSrtpcxMMkbLrtjmOp5fDEYi58uKrlhtHByKKCAZ/FP6gaXqE/bRoKWNyPYHGxieyw3uvceNkuj1ZFzr/IshFZPfdDcHIaCPORe0ZpO7EW4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BoJbaHJO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so58450545e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744187746; x=1744792546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=el1YoTqrU0Hduquq3XtvrhCcVlg8sd7EcPhPRkGv2hE=;
        b=BoJbaHJOBwa0kbutOCB5Ug58bwkVPP7j4+L/+G/pTP1eX2IS5Na2y+MD46lKhW7o6q
         4YDVWEiBAvC8RTYy699FOfe4LV6LSGBfwGC2VlCz/tuC8Mga8+H4JKo9E67mC3AE+bFR
         HBtcHO4Ymx7bgoDlFAEcNj0Eh6aSEaLgWr9ggfJd129NF6O7pLFOGX7QFuUA0wJHHKqB
         vp1GHHDjJsM00j0aOXs75WqREDEPOp1wpG0bzsVtGvLQqUffVGeKLT6MmRSsksS/nl/t
         SsXZlJsMQ1JJ/gaWkqORcaApR5LgOQsyCMLBleAy8LWbHOKh3cy17X95ZmkmboZca+zB
         6evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187746; x=1744792546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=el1YoTqrU0Hduquq3XtvrhCcVlg8sd7EcPhPRkGv2hE=;
        b=oTsQZ3ILvk+B3Hwt5eNxxCKNKK9JwJpzo9d8hryWquXdDfBNQeY99iNX3YCwBG5kam
         /B5P9ZuGz8UfGc7OM8xVC/LKqt7sKtt6Tj6cseWMDdtQUTIjJPVbrRLKPZbPXJO6hCx1
         zL2sZxukWZkpj6UAitS+LrpRJJeQ26u9vXzJhIKa4g7gskWtfa4brIoEeyEX9kuwco8B
         efFx9NYyXPhGMoYUdr9KyEHLmDWp3F0RJE/mL2bvJm3Ct18AR4v14POmNt345u+A6ZuC
         IdrwjOTqdl2Jdt92hxeu3bjkfWGFWExxq3W3K7jdyEjLh6MHY+e3YqR0Ic7V+AvDNtPO
         Dbtg==
X-Forwarded-Encrypted: i=1; AJvYcCUCbY2W4f4cHPed8h8uTKkmuP2KTZGQqO93qfiLfLXyNbRx/QmMTXyATU0fyuwi6tvwTXSLPmfc3nm4@vger.kernel.org
X-Gm-Message-State: AOJu0YzAT84vXqFzseJQfjP3l3q2hQSN2AYaAAnOC1Xiep9d1xrevweg
	VFdQ0TPfUVFxQbmmnGN7n45nOBiVgPpbQRvW5xXURpNFkRRYeO6NNBA0GGwl7Pw=
X-Gm-Gg: ASbGnctYhFD3TyBHdW0aRXXqjR+hO7h+XoGsP7oTfiVK3F6U3PTK490mZQsPBDLInRM
	fomvCFb8+c/HBLyz9QpBzcCS14IawZTaIuOK8jKkMzoYwb83N9Zac+emmad+U+4OEtAXb4yvymp
	BSJ7f1Dx6FfgJEsajnAMoEFxgDY8YDdyfDX29sEVndA1SC5znXOGzkLUcyTbk2hBDza6F8pf0Wk
	PLEEC0FzZxFd0WsZWZyqQVKZRrc/7XC9otSiujI1eN1MpCJTMOJryIXPHVgWD+ykM+tfAzhzGGR
	wtdZPmnTfKzdd+BK6AHbekUTbA15ZvbgLk9sVkkwRc9XOnZ4mDU=
X-Google-Smtp-Source: AGHT+IEVD2lslpaI/7rJdnAeqx3wViSVYCOrqXVSkQ27OLCHAfme1XR6nMNHEVQPwT+A6iaBHutElQ==
X-Received: by 2002:a05:600c:c88:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-43f1fdc3bf7mr13678815e9.6.1744187745673;
        Wed, 09 Apr 2025 01:35:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecf30sm12557045e9.1.2025.04.09.01.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:35:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: convert board-file GPIO chips to using new value setters
Date: Wed,  9 Apr 2025 10:35:44 +0200
Message-ID: <174418774169.21152.4210389076223179557.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Apr 2025 09:09:17 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all ARM board-file level controllers.
> 
> 

Applied, thanks!

[1/4] ARM: orion/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/6982e6b0bdd838fe71a6133cfc0f79645bc31a04
[2/4] ARM: sa1100/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/9c3782118a57a6d7a17980115f46bcf2b85fdf29
[3/4] ARM: scoop/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/dd8a6af45928871e5d9a04959ab8f97c3714264a
[4/4] ARM: s3c/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/fb52f3226cab41b94f9e6ac92b1108bce324e700

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


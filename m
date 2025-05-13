Return-Path: <linux-gpio+bounces-20057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C318AB55C3
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF286861108
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAA328DF0B;
	Tue, 13 May 2025 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gVvTLMBh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66F1624C3
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142157; cv=none; b=FhnL+kxkxNGaqeu2/icZWWXosLNE8Ia0YMskwji4XvmlREnexsiKPRazB+XZbiKvBoYoMqbrovO7dQ6DtNnI2prwEChMoaBxJqiqBHdiZJEmy5ur+/uo3V42QZswOT51f+pZBx9AJPBG9DmeLHNPoivGa6YmMwK3EzIwVjvNI9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142157; c=relaxed/simple;
	bh=hRylyn1PcQVlg10HiqmNfXqVxRHV0X3JGOuwCnjPmdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsXdheUaPmjPcgGDzsP54kNarUSLKxMg0/pAQMIX7LKwnuFZBAs7kjd0B5JfTX+dIskqpscit0A120u+8uD5vW1zwYf+BeYSftv+BxmDUsT0pHKPdL5orbI6hhAc/SgnYuarl6pTzaI/8Ym5eu+2rW7ZGEh7AOiEwSk2Ugk0RDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gVvTLMBh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so58284405e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747142154; x=1747746954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPY3rRdUVBrXW+v2nzRIA0l1VDmPMKxlLUGaAoh0kXU=;
        b=gVvTLMBhVx0qH1Q2Q2Sb8T+pCzhIs/kLhJBXKz0vcE+A+kmDWiiBBksdfjS1emlogH
         oOdWHfhYxNPoUPzsohIFLd07d2jKKabNbzlYOXVplos4h4R7Cix+sfZTqA64hyvEaTf/
         KA1wzHq7uwBMgLejo/bMyRQtgLN7UJOnPp6sNSsuWj2NyMkKAGLB0KkNIViv0MM/a9bb
         DNZILVi9RM7qrFntEIBUTnIhzq83y4+yvFPOV8N62TUytq4pWtJXUenzf7Uc37vQLrmj
         7T9HOxiacvbX9q+fIGDzJaHhgINnRzFku0zE7DouSqMGc9Rl6phfNY3xFAB82+lJIxiR
         VxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142154; x=1747746954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPY3rRdUVBrXW+v2nzRIA0l1VDmPMKxlLUGaAoh0kXU=;
        b=LQ46e1n0hJil5dWj8r+FzW5cLf8H8HKWyJa6bv0EkjGLLssPNQxaYq/GTabnamFj01
         fiiCsKf+7hqMkr3fdIKe63IRFi+26cHW5NLEGXBnJ0o/Abn/hUi5zmZ5xT/6G/W1OysD
         y0FPxEetU1M8V06egoCiTPAfJg1JLY8aqRO8y8U8cppBKIHhe6KAg+BCh9q4AHqIKfbz
         lDpoFNBPhp88POoBPFszEmVfTWV4YgpMBmkw2MjarmajoZlc9igXo9IY8PfYyCcygsD3
         wP2liTm11smWZWIeS9iVLCNft1H9+s6q1X6IEcmKkyfAJlyoBsdM9cxyZKT6GmYZ0ISG
         tl6A==
X-Forwarded-Encrypted: i=1; AJvYcCV++rXKspbpgLfLpA5vG//lRVKYVjObfy1UbArnZmb9+pfIVW0Xk5LqTZ3MFUkS4vjAFrq/DDERbQty@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYuetNb6bEu2v20+T5tQf2ayJ4vKMo6PoI1Exu8MAjBEWhI2u
	E9/+ck48nHX/Ms9zmXSdSYd83fZMNtAQtCwm1cIo+3mExxot9hD5KwrYXm894l/tkwhpR3NiUuV
	vDU4=
X-Gm-Gg: ASbGncuC01UQUByQRJ3cpVJweFJiNIW2DAALEDmcZFBqdNnTCuvHwNe6Z+OcokPuXrJ
	Ld/j3bcsJVz7v8dwNsdyjNA3WmYiUHrRm0JLRw6w3QPyNj9+yKn0EsxPNaHhPPpaJ0tEabcjsCS
	Mn89NOGaNv/izHXxzXIF/dAOChDDJVmCy8PjhjNX3ZayWIt7coHKBYUA5tEoXiIP7H6OHua8TWQ
	OwZQ2V1IVFMWD1mlCkClFsGwp8WaF4Ob+iitxXCrFl704PuR9vR1mQXkaqFdLXWklk/AGjo1H19
	/EZx0AOok/UJw7MksGwx9G5oMRH86J3ha1vlHm1R7SK5iS6hu3BPxg6kK97YFUc17bnlqqBaiCw
	8rlQdjLNjNHavqReMIdJBAlKb
X-Google-Smtp-Source: AGHT+IF45Z3/yPJnSPxFe0jDPVCInZwQAAhswNv4Px26NKFArlJLvwKRwbJZn6KBm6BZg6uGp+I+6Q==
X-Received: by 2002:a05:600c:3e0f:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442e1093222mr108939215e9.24.1747142153624;
        Tue, 13 May 2025 06:15:53 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f3c2sm210290765e9.15.2025.05.13.06.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:15:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value setters - part 3 for v6.16
Date: Tue, 13 May 2025 15:15:51 +0200
Message-ID: <174714214927.9467.6551553602169960677.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 06 May 2025 11:01:43 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO controllers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: lp873x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/30d15b8949828811e9df3dafc12e3d523ed6e154
[02/12] gpio: lp87565: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/978d23c1db9a303f2fab817de28087ada5859a9a
[03/12] gpio: lpc18xx: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/4f71abfef92d9e302c7c62744fa806076b3ba819
[04/12] gpio: lpc32xx: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/1a7b6b536d509203325bccd88ae42499b45f5765
[05/12] gpio: madera: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/2e6b7f5ffe08d42196b31322e6443a9874c79a03
[06/12] gpio: max3191x: remove unused callbacks
        https://git.kernel.org/brgl/linux/c/75e80b69e1367b95a98107fc38351b5b865c568c
[07/12] gpio: max730x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/1938913798082cd284ab59afcdf68c2bb5ba1686
[08/12] gpio: max732x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/66a6d0e5a77889cbec98152dadda70dd79f1678c
[09/12] gpio: max77620: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/8f9da4401b82faa788b663402ea699ccfd756597
[10/12] gpio: mb86s7x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/dff5a31dcbd260eb61f0128876910809f04f1e3b
[11/12] gpio: mc33880: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/51227589e8388b452b4315907d2de5f7d5a06e87
[12/12] gpio: ml-ioh: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d3f960365b8c35449d22b780383dc9b40d96203e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


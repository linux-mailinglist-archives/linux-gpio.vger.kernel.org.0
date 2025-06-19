Return-Path: <linux-gpio+bounces-21836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3868ADFE75
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 09:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C41361896F3A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 07:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C8324889F;
	Thu, 19 Jun 2025 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C4B6EK5h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0419E24A051
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317245; cv=none; b=lV4QTusLw2HZ5bT3Bve8OKZY1DnMWMfCE9EPH6+SNOZW43wpJGTAJT8/dxBm76fhbobex18olfyLpne5XOlsV2t8G6JH0Fy01Pzeay9N+U7bDQ2Wi9HTZgcz8poyxkAr59lgw87fyc8cx+awz/UR423KncErL7xwD8YpYZ29Gcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317245; c=relaxed/simple;
	bh=Yq2FlbkzUqerQAzRvLsP0m+ZTiUSI2pXvwMlAMDLmKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JaB/07CgXRtiD2aCRwyDMYPYxjE3TJ3OowOjsKNzEcc7GZfPO5kuR9rd4b1TvSCdti4wIJUdijmVj+pvHGEFHNB8dZzsa1Jw2jYliK6Irh0LyEXpj5gsr+/3r29cTywcoifFSgP8L6gihTfio5g6HlV0ceu0Q5Qnr8YC3iqUk+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C4B6EK5h; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso256447f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 00:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317242; x=1750922042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq44AhL1m8zmm2BXeTzju6Z4jxLaMdXtrDcTCP3h0bM=;
        b=C4B6EK5hbxZPet6m3ea1A9rz6nq44MgCHmGwRT8hFQ0FFpqchTSlBTvytlgKQopIcf
         rQnZQ1ekvHLt8hPpdNr2JejCiU/hOd+VBKeP5WGoVQ1vUsbSfM6uw0KlCUFaRDcwzpiC
         NZL4vzHVvPqnvvCz3X1oHWCI4+ka3c+RmEh573oIseFRAPWdcCmFaucK7pGQNPWFSawk
         xaT5x9dzn9mkkI+BdJCpgCKHrkKMYBuTpJowJ3IrRco4HsPTez8iWHr5H1S9NklQcS7p
         LJ2T1ZckgZIZmhGr/5cgHPvLI6jTUbEJ3dkGgAQBmauElvOG2nm1jETCOEpojZAiY8+5
         2mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317242; x=1750922042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq44AhL1m8zmm2BXeTzju6Z4jxLaMdXtrDcTCP3h0bM=;
        b=hh50KnB92qggtuZFxhARb0gyzHCAGHOG28utDLL8G6s5ltIO6YVRpWloCfQL0qfTaE
         kL5FP+xIgHEjcc82H0PLoeSdaoWqjtZOJeloa5/oQ2xchTPt6eReYiqi2IzpFYvxOIHi
         xCmAvI1gLqlqabOi/HRa7Wq9eIzevXQGFA6r83peRztI7+KcuQu2fhjGMK6WMMlWNU7x
         OD1whIZQ4PpitfwcXyxpzQnd5FaVvZJSJ+4mYJDaMIHDTfRON7IlTFrbPH0z/DOXbIC0
         rinLSVuASZ2IEo038uLlArd3cDiuDKosrLr5AfIyCmKBrQLuxY5emtM79jMH3WyLgV/O
         hvLg==
X-Forwarded-Encrypted: i=1; AJvYcCV3tWPySKz30ux8JJpNHuBqrKGsvF+VlIc4t7AyrxlxqW9AVtqr1kooTadesLwSTMfvtK6qdV1xKies@vger.kernel.org
X-Gm-Message-State: AOJu0YztIWBx3BMg8by9DJ1AHwjEvcqwDMBNbkJVOm9Wgue2uSy1GK+A
	KImYdYb9ruOTJzjSfeluuRi/Lo2iaiCu7M4q6TYRJMk9AE2k8WclCKFz6Er879esFJg=
X-Gm-Gg: ASbGncudq9VtdbOhp3E311N7C334Ezed6auPpP5KTHoaaqFw0gebpssdft+wqItCH8i
	d6d3gZpbHBwRU5lM6XI+/OUKlz0jjFD15RiUDckyCf39pBDuXwhAcfa2EZ1x+G9hl8Cx/0y4ff0
	fXuCZ65QUu2N8ORU+zuS27QkHWZd1sVno5eHGwTufjbnyGy1Yx+K7yI64MGsVbDMP/j5oED7uAn
	FYYTaXIssSQgAZJzMRqaX6BEq0y25YJWQCXaVZfwuAqNn4ITIozSk00243bwVHFtmdw/FyxAKgU
	WbXrqDILcqIpIgvDDzMqzZzFJYAAQIznI5JXiYqd+KzUcGyEg8B5wEwrbxZdIeo6yxM1dAt0YQ=
	=
X-Google-Smtp-Source: AGHT+IGlNantl4wJm6RCvWBimekXrYP8rB5NeN1SXtm5TjP6e7AZBjb9h39LOn+KDLomqiXHR+OvRQ==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc80:b932 with SMTP id ffacd0b85a97d-3a572367dd8mr13904267f8f.8.1750317241916;
        Thu, 19 Jun 2025 00:14:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087b4sm19153422f8f.51.2025.06.19.00.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:14:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Klara Modin <klarasmodin@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: fix NULL-pointer dereferences introduced in GPIO chip setter conversion
Date: Thu, 19 Jun 2025 09:14:00 +0200
Message-ID: <175031723753.8751.12135495432904618963.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 18 Jun 2025 15:02:05 +0200, Bartosz Golaszewski wrote:
> I should have paid more attention when doing the GPIO chip setter
> conversions that there are instances where the setters are accessed
> directly using the function pointers in struct gpio_chip.
> 
> This is not optimal and I am making a mental note to track all such
> use-cases and use the appropriate wrapper instead. For now: let's just
> fix the issue in gpio-mmio and its users as well as one other converted
> driver that suffers from it.
> 
> [...]

Applied, thanks!

[1/2] gpio: npcm-sgpio: don't use legacy GPIO chip setters
      https://git.kernel.org/brgl/linux/c/1fd7d210952938e8ef6d87287e056e25a2fc0547
[2/2] gpio: mmio: don't use legacy GPIO chip setters
      https://git.kernel.org/brgl/linux/c/cbb887a76b788d8e9646fdd785f43745a3a662bb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


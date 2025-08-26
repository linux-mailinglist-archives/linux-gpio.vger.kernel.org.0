Return-Path: <linux-gpio+bounces-24989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6BBB3645B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 15:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A77FB2A75BB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 13:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6962233A00A;
	Tue, 26 Aug 2025 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="21Q8sAah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFFC23F439
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756214856; cv=none; b=df5vbgVs1GI7E77AaraSvhphrqa4VrwtvK6rO/+cY672R7wQlA84LzgRZgpnd0tx1Ed1t/3nvGIe8QSyxZWKX7Ni/5r6QZ0hlIWNAbwPUM0c1kdXZSELbpFMSOiRptzGRIlGePZMs6oCqKHfTGqE9oy4D5LFaCiz+APIwwVHgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756214856; c=relaxed/simple;
	bh=m6EtPj0+uVtOuoBi+kY7iqJCwfqPxHH3Tv3BeRWW1Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBZwaTr/iz+8KNvmbTC0P01PsbYaFCnLHo/on+UntpoXwU85w8YBjziT770lCgJgPHXs7Q77dx5YsisOAPirw+/JWbRKaP7gWrWm68LoWW+4F9Eo8KprqpyAwmcSfd4qXhSZjiGE4932WiH6WV32M6149AXk+ml2qqkBgihIeUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=21Q8sAah; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b65469a5bso8996805e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756214853; x=1756819653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6mCp+F+gxJpSoi77Mk8DTDXwuJqpWFSqV1XbI8Gr38=;
        b=21Q8sAahctrduFvfZ6ls4ScFLDuUUhkdh2EkXVwvUPvk4GjvEW0y6s3IZ3AXYzDjTz
         NGNamTRoHw9mpAuIImz+gKYfBbqSGp5G5yf5+8/Dk8rA03zB915sOuyiABJBbour11le
         KJsj3ljbErKmxA7Kxo+49hndPSEiD2oMco3FH1tsVL3gduSScje4/XCwyyJf/0a2tFV7
         UEJ+MlLaqcqhcn5EaJQ3r/0Z5qLi1WzNS5cEkkTJffC8puiQhciXysgnBUQny5D+MrpS
         t/F+7J/l7NmVtyQyP1QLAsFddQ0NMVDWWm3OBcfxQTuZc5eU0uEEig1P5Q9VYkXY5nfw
         8evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756214853; x=1756819653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6mCp+F+gxJpSoi77Mk8DTDXwuJqpWFSqV1XbI8Gr38=;
        b=MNKT+QP8n0ZLqd4XB8h98KR9cRJ8lHQtXg3/BgXIybZabFCkIXXXDPyLOVq8c8iqOY
         Xs5A6YCvUMBK0oCg8lQOOzfN0MTwMkpxSy/PhNTYGHaHj9Zee8MRqoIGF0cnUKmIJH9S
         Hmn8u7SlV9bBxgPtxU2ZoZjkaKGnhSqUBVuOrDpA+HP7tPOPxIeEB6ZfHa54jN1DA7zQ
         +WgCkA7sTWY1GX4TPAgJrONXCmqqHL2PBZrMnpKCtEebRcy+8gF9raNqTaC6+OQ/zo7A
         XCsnKjj8SQm3oI2cc8yRYvC1TTUOrcWZFqC2nnkEtIGgEe7rcL+nVAiUojolkYQ2qG7a
         XKsg==
X-Forwarded-Encrypted: i=1; AJvYcCXeYgnu4ZhKtVa1cmzN2+FmQ0199I8F5Caa2SWwa465my8d05gQlru3WruNJoXxHWIoNpE//G1kRQBV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+f11fldiLE+tkGdVAvxYfail2imtRri2BZBg4soaSyd4eCTiO
	HJVLjrX5iGvGWB1esQFxX0gJZZrKOEQ5n9bCPKykCvXoHJ9sT5lvCgdpyBsEXe++V+A=
X-Gm-Gg: ASbGnct7pK11aaAQqhw/UXjRUAXHhltiBARZknwOW8EqqcU4fRuTfKPabJ9PVheM05P
	soMKdOs+000Ez3xny+GIS5e/3GmGCYLVax+tVWsnzoU4v6ze4f1MGbmNKSQQlq2DrlKg4e0UQAc
	F1CpUgMZJj+AlkQ9FHDSXCiefMs8D3hkOnoRuf3r4MBx95yxYiTNsxHkuRPSzZbjxZQ4JYisY1N
	EYj0l/4BOpAUn9tf5t3zMghHugiXv0+S6mlrmmkBDqq3zI5ELAUAMuwLhxBT+3wvo4yPA5QaRRj
	zwMN7LhGWDERQofhsk61dRl2Cc0hotNopaQ7z/cuDE5voeXKUWOLV/ryhWb75034I4J7Oi1iUnO
	nCq4vnFY4Eit8uip6qbhrk1bf
X-Google-Smtp-Source: AGHT+IEtIkJUDKq6YfUH3OIVgwuCFgy5UnEG3BCV3U9Lc+PLLOQkSw1irNa69/oxZWuy1ZkYx0BZwg==
X-Received: by 2002:a05:6000:288d:b0:3c7:36f3:c352 with SMTP id ffacd0b85a97d-3c736f3c4c0mr10077934f8f.59.1756214849721;
        Tue, 26 Aug 2025 06:27:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c712178161sm16133692f8f.67.2025.08.26.06.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:27:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: gpio: add documentation about using software nodes
Date: Tue, 26 Aug 2025 15:27:28 +0200
Message-ID: <175621484579.32185.5463919382812315938.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <tnaaz2qlk5jpbonfle7uy7pb54qx6ixwuczfbkwtxxwpj7hwas@y7a2rwko3k6c>
References: <tnaaz2qlk5jpbonfle7uy7pb54qx6ixwuczfbkwtxxwpj7hwas@y7a2rwko3k6c>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 17 Aug 2025 14:30:20 -0700, Dmitry Torokhov wrote:
> Introduce documentation regarding use of software nodes to describe
> GPIOs on legacy boards that have not been converted to device tree.
> 
> 

Applied, thanks!

[1/1] Documentation: gpio: add documentation about using software nodes
      https://git.kernel.org/brgl/linux/c/8003235b10e54c1be57374c6224751b39750f16c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


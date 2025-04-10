Return-Path: <linux-gpio+bounces-18620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACAA83AA0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DC8618973D4
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 07:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104DA20B1F7;
	Thu, 10 Apr 2025 07:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iwA5776c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57C2054E3
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269376; cv=none; b=dntCY7sbPqoviVKv1la4DqTQaC6MAFA2rP+H10ChB5PM0jY3VQCVAGbCfhw3l05BfryKe0aWfFd/IBSWwAzHNeiLB94oV6WOTbMzzONj7qNbpd0g1ukegQonLRWcXPJMZmxSjwtKObPu2Ioa2Yj7KNKoTps/vmR0fUsDijorB7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269376; c=relaxed/simple;
	bh=jtF/nrS6iv9Kj+fvDEFx6uHdSawvFx7PwxIay8a7nrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjO1JsbE5qb97W43+gqpMloIPZ+/ZuKdZvTK/dv+ldIu3GRW8zbwrVau7oZDWm0bIqwNPm0gShyVsebtcd0xz1KIH73R6ZXA0vDFZYAH/H4a9LdvORtzU0TdoO3Ez+t5/29Gv64smORYzG6wldsQRi1nKYTXuWw7aEtngOmMi8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iwA5776c; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0782d787so3169535e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 00:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744269372; x=1744874172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmLueEOSOx1TOZ/xE11puxSYTKnDaeqcR4nW9ehtutQ=;
        b=iwA5776cZPPcaLJ6Y6M6rglFih14l61mU9JsC3An+TEN+gRHlT7GQJ4NCz92t5IdiH
         S8TrzQuqsdm9BDzLdm+kGixXhpQhF8ryPoSLmtd0UZbhtdeBua7QuNrxxMJEGXPh8VEC
         aegO/uxYFGKeZW1yCS166FpzT/xS3a8oy+wTSWgI/rvDvSIiIFEVXpEKbXkF9LRuYfh6
         vQ0b686UqGKgy3KTqERZL5r7KRGd/pLP+mVfIlW5+FAm9QrxGJNir9o/Oy0nGSvHiQG2
         lgeG14tPcwQi8Kd+kxrwmIznDhQfQlKklwoDEhBlBJ0gAkN0cPYzR68IW8fVeGVQDCER
         7sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269372; x=1744874172;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmLueEOSOx1TOZ/xE11puxSYTKnDaeqcR4nW9ehtutQ=;
        b=nOpsZKHEshaT3pCGYA1QcAm528zDaHJcDqQo4HtDOaae6daHN9zBeyXm4CBSeRe3gk
         O+YTqV0Da3LFI5qR3Ke0zAsXxeDZ/vcxaUl00hoE9HZ3Hkjye+WdhMNGfpIrdLqDeLa0
         G7bDOeOjHYEJqojWl2rLg0DS/YeJC2HC1qZx0VTTdtHPALD17T1Eq1BGC8GTt+WlYaHr
         vX2Q39Dnbo4xL8CCtopo35etxik2udPOoxVmcFxD+3M8MjUFy9XmCVhbBT9KmkPYMc0y
         Gh26qCdnLEAGOG4TqetEORcrMdq859pH3GNXLwPoWBf6wbovHLYDBme4oGAHZKTKt3C1
         Q7qg==
X-Forwarded-Encrypted: i=1; AJvYcCVXSaR0ILPwu2yi6BAWpz+/SD7LbnZX3jMB4ddOSY2Zzl21e7quDbkXEDiRysbVKY8c+4CnS3asdrX2@vger.kernel.org
X-Gm-Message-State: AOJu0YxNaFzEXDhtSmv+ObTfO1NvIJa1k8oG4zkYCmGSgaX7oJ5q+CS8
	BNtsjMcEdDSkUXr2AbfnVsvv8tWF3Pr2XT9CVWCOBKPBEeAWZPogk43Rcq4IVAY=
X-Gm-Gg: ASbGncuJXUy2AVONoaJYxoD2nadJvZZGnV/dvLjBFmzFle2gprxdXz4YTkaLa/J8Xu6
	D7dgtwxr3LmniMEdeZAwuaJAZflLKuPYhh/pXgtAaagoc8FrkjjH7ho2BW26oyAnr/IRDuQot20
	W8K6tn6V3FjT3gsKOIpU5azgF1zG81a5jAv3kJQO8H9+VLYSSv56WGH1FICSmpVhwYLnYiJI4rr
	Pegso4TiQh9dD5jxrdm5GEqtv9TSPmLKE1BwPKw02sAZNczA10Nfg3GRhc43Wb87n9UhUCljXcv
	zlgk9PFOH5e/OTHEJRCzD2KwphL+R7h4NCHnGErdFYwZ1jmTXD0pdfIxJO0=
X-Google-Smtp-Source: AGHT+IEz5IG00lmAVwHCdXdSnJ2Z0KQTlp+V18IFUkzrkAAyElIVx0JjEnVPmuw7GvI+SO1ZUwQhPQ==
X-Received: by 2002:a05:600c:4ec9:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-43f2ff0540fmr11919285e9.18.1744269371500;
        Thu, 10 Apr 2025 00:16:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d069sm45329215e9.17.2025.04.10.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:16:10 -0700 (PDT)
Message-ID: <b8f356b8-b242-41da-a654-d937a354fc1e@tuxon.dev>
Date: Thu, 10 Apr 2025 10:16:07 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] pinctrl: at91-pio4: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.04.2025 10:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


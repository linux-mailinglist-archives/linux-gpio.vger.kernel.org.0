Return-Path: <linux-gpio+bounces-27214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 584ACBE44AA
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 17:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1268E3B32CB
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 15:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF78B34AAF8;
	Thu, 16 Oct 2025 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJzK1g4v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADDE34AAFB
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760629045; cv=none; b=Qy8eAbUtlKggsgeifmV7ItlZxSEL/su2DnCF4C/EwzWD1iG/IBXfN9lfP9GHzrvaVbgKFaDz0y0XuA3uTC4Zlf1EzBmi21gfAlDk3oD1Xexy1dk/nc2zBa5ee0xODN4yp2yNA9UseK7JZzYeZ+i8IMBN/D8yQ0DqXw2FXbSlHwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760629045; c=relaxed/simple;
	bh=IQFwym3P9+Nw3XQ9AhLnb0cLG2B7kYyMSV3AcTLlS5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhSZ/VXcGdho0Fdp3aT6NdxfiiPNqSep5tpJfRhwiurkOykV1wBDc7a1aeXEy9cU/DeKQI3C0KQpPPypcXNUAf/kMsLnFRle1xnohzOGiPJ+S0PX9VdIWdGAcR72RP1e6WHks24JfVjzyw49gvQAC7DZTYz15eC9MBNW0FCDyJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJzK1g4v; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so148783366b.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760629041; x=1761233841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lt9AoG+5Ci07Qvd8dFqmwNsNmi0V9J5hOKNJ8ADlmH8=;
        b=cJzK1g4vWJMSH6IKrpfA/tmiEZjJfecLXtzULXUvJInL31UJk6WbXsGrMXScK0PTVV
         ikQb1tmC+mhmYbsZ6EDxLDDjDqdWkbbRfDw/Ruj32KQMOapwC92EANi4imxIVN9coYnW
         gf08bIWYfyFm8rfDml8cp9B1pEYEVtWEsW0SaDYkdK2ASrysKUEYDbP8yeffHutCKns4
         iFI9fcLIUB/vfmA6jP2el2YaDuAIdE2rR+PTg6FJzDdqStNbznBsPriVfWroqMh+cyML
         UEBJB8HHYQu4Iu7FHiHUkCDg7P9+2I9gEFaL/DqKCF1Re4MAsSm+WE/C3EINBUdXiLO/
         42nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760629041; x=1761233841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt9AoG+5Ci07Qvd8dFqmwNsNmi0V9J5hOKNJ8ADlmH8=;
        b=vqJbOkPI5TQ/4RwhS44UvXRmOd7ZWSdYwgiJz9hV934RRMOFuYM4FAG/WWzgNi6pYv
         7jqyallIbb2uCk1N9sEi1j1n1245Rlc9KERe6v3caTwpszuChE7Kx7mswPaThrVyPemF
         AzJPF949RyK8DRh8o8Ev+iUemfxVfIax8ro1KF55/B4OcojcHSJsiAZ96nI9IZ7juh5Y
         Xu0FgboLszH4oes6QGt+Xy4vdbYnN3MlDUMruRxZbrapXfVdY1DLi1uxW10BhzDrjE9v
         mLn7R+VBAe5i4dg9ep5SLFuj4VJchmHQVXeTPovVYZZySpYSd2+Q1LpP7Xe160M7J5k5
         tY6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnf6zWUQqQMhSSURgPUdcUoJMFQdDQEBTBUcEKAVkWvJL1rnbQSQljcAYVdR/jr9QBpV0xtDRWOJsW@vger.kernel.org
X-Gm-Message-State: AOJu0YzKVxFB4TzSfhNa3EJ2byWZBN/JmySq2sSMY9MFln4+gd4WxKd/
	VtmYB+gNqVfGj2865ECh6MdWrK0mJ/f9+YhniLq8o38nh3wgbl1j9poW
X-Gm-Gg: ASbGncudoTmylVz4Z9/jTPY3wGG+eFZ3A9uMNDbBqHRx+YsGof6fzXgw9XH5IR9Qwd4
	ARc2o1INqCkDfDqYiEP9r7xVfU1IkyB7rFz3Af8M+3gu4ugP8bzHqjb1YyhPROe8xkZQ5qtg0MQ
	eYWKiBOXK4aJYakcwWmxIwVu8zGr2fzwU5kHA4bqa8wCEvQcx6KterAKQ27OdIoyFX5HCPZT0jg
	IaYWC9FdY5jvplhsEmIDUqw4FvSm/n2IZr6te6q/lj5YV/N6yY/nmg/uUvkvyP+o62tdPq+EVXy
	PUAIzgADnqpbLOXeFniHxX9kESonpQ8yu2WNxuYyIrAWNeki/rzlY5gBZlDOT2NY3s8+GweGYmy
	vAOojXXkRTu2pReow+Q+2W0ZaWV+qMKNUyzyVAClMBk+hx/tEcMT9WTwBO1hlYvo1nHqtLytaxD
	WEqW/SsA6l5CiIIjA18hMfwfmdfJrww/C3c0xJbe9KkKjK473JF/ctrffjAIPGZbgZyyRe1AdUj
	IN1jJPZUTs=
X-Google-Smtp-Source: AGHT+IH5rChTcQ8KMfdTwyelHm2o0px+idB9KuE6OvaeLt94wXIWXpeWcF/P5s/Pb2bnDPg7YRkZog==
X-Received: by 2002:a17:907:2d06:b0:b40:cfe9:ed2c with SMTP id a640c23a62f3a-b64769cd245mr34400266b.64.1760629040911;
        Thu, 16 Oct 2025 08:37:20 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f10a:ad01:ad7e:4d4c:7985:153? ([2001:9e8:f10a:ad01:ad7e:4d4c:7985:153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb9e7a23dsm554836166b.23.2025.10.16.08.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 08:37:20 -0700 (PDT)
Message-ID: <22a84772-0e54-4b99-9bc7-59e7e4633807@gmail.com>
Date: Thu, 16 Oct 2025 17:37:20 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 2/2] gpio: add gpio-split driver
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Peter Rosin <peda@axentia.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251009223501.570949-1-jelonek.jonas@gmail.com>
 <20251009223501.570949-3-jelonek.jonas@gmail.com>
 <CACRpkdbCw1Agnsy-aYPs+2PhQDFjj+=VjmGQBmxuCUfwRuWkfw@mail.gmail.com>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <CACRpkdbCw1Agnsy-aYPs+2PhQDFjj+=VjmGQBmxuCUfwRuWkfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

On 14.10.25 10:37, Linus Walleij wrote:
> This can be made easier these days, reusing the
> forwarder library. I think! Check if I'm right.

I think this doesn't really simplify things her. As far as I can see the
GPIO forwarder is more targeted toward 1-to-1 scenarios, requiring some
(or even more?) "hackery" to fit to my 1-to-many.

> This part is maybe the most interesting:
>
>         fwd = devm_gpiochip_fwd_alloc(dev, pctrl->pctrl_data->ngpio);
>
> Here ngpio will be 1 for your usecase.

Giving ngpio=1 here makes the gpiochip only provide a single gpio. This then
needs to be the number of GPIOs defined in the DT (number of child nodes).
But in this case, the internal 'descs' is allocated accordingly and there's a
1-to-1-mapping between the external offset and internal offset. To solve this
I would have to add the same descriptor for the shared gpio multiple times.
Not sure if this is a good idea.

>> +++ b/drivers/gpio/gpio-split.c
> As mentioned I would call this gpio-line-mux.c

Sure, will be changed.

> Yours,
> Linus Walleij

Best,
Jonas


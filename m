Return-Path: <linux-gpio+bounces-16791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7522A49599
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7106165947
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F199F2580F9;
	Fri, 28 Feb 2025 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYFEQmqd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC91FDA8B;
	Fri, 28 Feb 2025 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735756; cv=none; b=t7G8J2RnJUJweonL5RQV5ZVa2WzAjhIw3iMVyRBjIt7DJbS6OLkaqdsqH+Nf53pxA0dJhQkJkf3AzXCQmn+ReByDHPyWjeNXSW/kRb5MilygK0Sjuq6N+vuJCTrbkyVCh5PCxS6SbfGjptmb7SVk9mM9FcI6qPirOtF/MSSSkyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735756; c=relaxed/simple;
	bh=urGBaZuu0T7CAnSTlkAsDfspCqisN3IYW6woecbyi1c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pzsKaYvQ7iVqp4+/OsmgshcSRVrkLIao+WaR/ffSR7EEq9R8cGDPaHtorRXUa1SSpB/dSCqXaZouD7cYMNBYMuOqHkdpYTq1rEWxl/DZJ2yLEFHrT7/QJ9pvVXcFfu67cI5+KBaBPz+rnxOI/9G9Wy2q2mYMMBIohmWjTs/hD+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYFEQmqd; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5454f00fc8dso1747634e87.0;
        Fri, 28 Feb 2025 01:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740735753; x=1741340553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WS5bBDK2Hm/BZdU3oZ1FmM1LCXpliOCIUFGYpHOR07A=;
        b=mYFEQmqdnBrkEfLB9Hx1WSAf4gqIjONE7Xb5ST1VJfo9IvtiH4QPQPkhaq6ONMZco0
         c9bNaWj4SnJ4QH3uw93WL9vGXvzqryWHmd04zB1JdMh7qChWfqZAe8Lqf2Bk1qkL5poK
         CpClJGeTkgny1K/ukqyrY25FC+TmGE3ZojvYOMGsxMkne22hzS88gkCgymfGKjvzqdH7
         vU+gqJIy8H98d7wFGuvWmLytfbXgdP+UkaUItNfEi2br9mCdYxhtM0WjwgsI6eQomHNc
         YyyrfjtWe0fWXQgOsDB/VfVKvj18efbCSC8TLD/u2DPvvE1ObgSlMWtiiGGPVvAlytkh
         7Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740735753; x=1741340553;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WS5bBDK2Hm/BZdU3oZ1FmM1LCXpliOCIUFGYpHOR07A=;
        b=W1MXF57gMLARAokLpHmZ4ZBCyRiHsMJM+cz43xJMmP0mAlnKKTiJ7VGIUvdo112HWH
         Aw7Py1a61jbvVkDRQRYPJjFWK1KE8foVjiphD3rlf9mOxU5kBFRp4zBl3rvgTLP2AmeQ
         n2O7kKGRTgB+xlxmcJM0Bcwt1jFvfRYbYincIdd1YAIJfoeCvZniLGCQPhsqNImarAEZ
         ArqK9YEK6aRRB146r6pPI1QLpbDnY/92dbFOAxScDsmM7huNixfhrIknMIiyOyMREQUh
         Evljr5fr/4SwASEvAYsDi9/tykzKbcVJhfO41fMdvyVPWexlU2X/sEB0MZD0ZXtBymk9
         S56g==
X-Forwarded-Encrypted: i=1; AJvYcCWNAg+Sc0AzqoJLT2ZGsy7YMePXEz3lI7gSHzZ45YpqKF4QGjccaFsAaXjc924U9cHeQ/vhW45gO87EHGtW@vger.kernel.org, AJvYcCX/pBG+CmxxmaRupcphu9Z+JP0VHpiDsHtAdMkb4ROceErNmkdi00jQI8ZKSP129SNqmloC1VRCld+F@vger.kernel.org
X-Gm-Message-State: AOJu0YxMPXPrxFRRDnMthVdPa4PCNwRDDNOvgA/lMyhl8t1bbrRW/nDU
	sHLkI33os1yg58MaJc0iYdkoQyxXHII7mUEs4nCJzhY57crSETYSnRdl5g==
X-Gm-Gg: ASbGncu6e7ICPZqM+tKvZV0/PA25YK/sybCXuziaFCg6ZW5/QRSgmiYc5J7SM1R0T/V
	NXYPqhM9jf9jRE4tGFA4WhsOAruPYbS0hFpIUXiJfOMpFnrVDS75RcW7FNYvLtCJRsGOFiRIBjS
	72lrKPwlNg5gRDtYUQXb+BxYRrBn0C8bg9nLxL1GPKTP1R0ODP9Ez022YjUjQBrBG8q1f7OKrmB
	e+CE7Dr3EfHyFQGyOY7Wogv3jO9vXZ3EFDE7y/W7ob7fxoF3/F601TEfuZEYZf8KxGC3N7HnpI3
	A1UGQeVrl6boMTwWeNf0YqTihTUSwxMHOHwFViHS6sAi2HCOuSqteyFDwoU6iPKbLDQonqDKSbX
	oCm4NAR8=
X-Google-Smtp-Source: AGHT+IGF8M0O7huZzjQ6LFWkfz1SRtYAUP4VIrHmN07fG89dvMchCd7M1Mrp85i1fQMqNnnGxyMYTw==
X-Received: by 2002:a05:6512:e8b:b0:545:1d96:d6dd with SMTP id 2adb3069b0e04-5494c330ae4mr860880e87.26.1740735752835;
        Fri, 28 Feb 2025 01:42:32 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494ca38eaesm218255e87.124.2025.02.28.01.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 01:42:31 -0800 (PST)
Message-ID: <6cb71da0-18cd-4ecc-8b7d-822e85987216@gmail.com>
Date: Fri, 28 Feb 2025 11:42:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: Document the 'valid_mask' being internal
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
References: <Z71qphikHPGB0Yuv@mva-rohm>
 <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com>
 <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
 <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
 <a7ab9d47-cd17-4098-b2ba-d53dfc19dbed@gmail.com>
 <CACRpkdafJfmuO++XXSFha51Q5=9DrqqRtxOpNeUsmvy7BHrC2g@mail.gmail.com>
 <f3984cfc-3e3f-47d9-a734-3af7f072c22b@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <f3984cfc-3e3f-47d9-a734-3af7f072c22b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/02/2025 11:28, Matti Vaittinen wrote:
> 
> CC: Geert (because, I think he was asked about the Rcar GPIO check before).
> 
> On 28/02/2025 10:23, Linus Walleij wrote:
>> On Thu, Feb 27, 2025 at 9:24 AM Matti Vaittinen
>> <mazziesaccount@gmail.com> wrote:

>> The call graph should look like this:
>>
>> devm_gpiod_get_array()
>>      gpiod_get_array()
>>          gpiod_get_index(0...n)
>>              gpiod_find_and_request()
>>                  gpiod_request()
>>                      gpiod_request_commit()
> 
> Here in my setup the guard.gc->request == NULL. Thus the code never goes 
> to the branch with the validation. And just before you ask me why the 
> guard.gc->request is NULL - what do you call a blind bambi? :)
>   - No idea.

Oh, I suppose the 'guard.gc' is just the chip structure. So, these 
validity checks are only applied if the gc provides the request 
callback? As far as I understand, the request callback is optional, and 
thus the validity check for GPIOs may be omitted.

> 
>>                          gpiochip_line_is_valid()
> 
> Eg, This is never called.
> 

Yours,
	-- Matti


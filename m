Return-Path: <linux-gpio+bounces-13577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBBE9E6959
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 09:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14BE016731E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345281DF978;
	Fri,  6 Dec 2024 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="H0QMG5/V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D20F1D9A48
	for <linux-gpio@vger.kernel.org>; Fri,  6 Dec 2024 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475212; cv=none; b=WWQz0NGaIfxSz2j7zBJPKV+G9FOpojHVYCx5ma+o5J/PeefenfYb+SlgBHAUmcpHKxypgMFbyIYjKrw7GwQKNm1C1LpYAh9CxfjOxLHTbGspH26IZBcYnGuIl9ncIwA1MS7hRGpCiA5Iand/tA1z6+GgZ+/khD9Nuje5bKmO7NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475212; c=relaxed/simple;
	bh=dVhJzd+zi2qvnhI6V4kLZeLkA7Rn9FM8MiYf957XXwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3luPaP92bXVhIPoYbu0y/8EQ+4+0QyScS3ChEWZlxYGf3Swn8pLqEa60mfd5dvvh8rQmCVPXpEuh6l+ph1WY5E8PRsZU9t4PTwEHwRH//TRbVsX4PN2rA7kvXR/jpyKNGvPmklNr74WWmf8p/6pVIdRxJSNOHZcR/NOXEI60t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=H0QMG5/V; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fc41b4c78bso1222941a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2024 00:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733475210; x=1734080010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhAWXP/xYcgG165en4AgCqVK5kkwITFAfiMlRNxRk38=;
        b=H0QMG5/VYGecgCIVCGNNvUIPPP/0rEFBwzWFZakgQYFe+5v6sWVQUp0gnzHbDa1jc4
         sQC0vZgG3F6ROl1/WDKu+mBXRwXHgucsPcx44t/9iL0ixuDBJQNgnZOqmThcSotmOgkH
         jkhhcyNaEwTI/Sgokk96YfHgyVsEKC8PormAkJp2avcRPDZnqBypbcGSEcQ4OEJgnQNR
         kddG7LGfBtolLVEKUpGfZ9olOGBlEa6nK1TQkXQBB3lebuCBExEr+Gcj1sMm/1N/y/w7
         JLCZO9e1lskSvuPUWQPRTVL48vPyIEtCAxhIRsmWy7L131kLo3LZFkLZWziOJUIKBPHs
         56MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475210; x=1734080010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhAWXP/xYcgG165en4AgCqVK5kkwITFAfiMlRNxRk38=;
        b=PDoWObiOyIa8Q8X9dz9FGyqFYZ8HVUYJPhXf8Qd65lFLfNuaXyRV4DL4K36rlmhhJC
         ou3CpNU3CXlOxCNBMF2fBIq5BEZt7c/jEXeXS6jCheCnyyeb7HHTUw+4xIeZ0xtpPlDl
         JHpm1hqinaVv5z9Xiig84qCv5EvyY4ju/ebLyaU99s1HncRsl4AoLrWqvTyuvA7t5BoE
         uR9rxLQeJZZpSHlqcfEfc6JoYUSAQ2NYFFEBNmD9rorP251sZGzFY8zYAcs7ssm6nhvI
         aUbZ3Ewz0EHlK2krLPzE5VjOxaTUKrcvoL1d9oBgXgQwAa0kljXpe2FJ+ZiKMIgE06Rc
         kmbw==
X-Forwarded-Encrypted: i=1; AJvYcCVPw5EZhIy9wUz8tfDJRUclfrLCgFkuaQoAssF/0b2RJ/VNqsq//8UB3UhT5woL6lt9VikJKjGlKzij@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3w1caDnt9LqHhvhqr6OdmHGjGn1J2XvjjMDU8x4WA9UG45SQ
	aVP24K8x6uYhntzbX6xwB7yT7NViwKXPCaDClb6YOiJ3p/8iI6FOfVzm+BdvGp0=
X-Gm-Gg: ASbGncu8CRl9AJXFiCn7eBCp8IHmb3BwReoDzx+98GR5t7kLI7Qe+fCtJriNnoA25EP
	W5pUkFZ285iaT14ZoUFHoIWlof5RR9TjuvSjewIAoQ7BMhW29Jqj8SvQQbSL2o3tGarh6fq0JKM
	fBZ5BtYr0b6JvNMnRXMpj4t0Id8CfF7ztPccp+lxeFie4A+7oRuxJLiv6PXJCeIFwhuHlhiPeRT
	pnbZDWj9ji0d8k4ODfwyUq96Wck+66drmAjibVUVKfouzSlYVo67HcT9qp9a1x9BUJ/RDrMZkGQ
	lhbe1UeLfhPCySH6VjHmdkdkLa0HcQ==
X-Google-Smtp-Source: AGHT+IGVC68J1Hzhc2DJ5JzM2SWZtS95n2/RU7xPk9iO5TFT0l2oWgmdNro3sDkmHuu1N0xvn6m2YQ==
X-Received: by 2002:a05:6a20:729b:b0:1e0:d9e9:a2c7 with SMTP id adf61e73a8af0-1e1870b92damr4214712637.15.1733475209777;
        Fri, 06 Dec 2024 00:53:29 -0800 (PST)
Received: from ?IPV6:2001:f70:39c0:3a00:8296:81d6:350c:96bb? ([2001:f70:39c0:3a00:8296:81d6:350c:96bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29e8f52sm2490824b3a.58.2024.12.06.00.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 00:53:29 -0800 (PST)
Message-ID: <1cbec5a7-6c83-4abe-8532-041dbf891e16@pf.is.s.u-tokyo.ac.jp>
Date: Fri, 6 Dec 2024 17:53:25 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: gpiolib: fix refcount imbalance in
 gpiochip_setup_dev()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
References: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
 <Z1GoskmQH0_FhxID@black.fi.intel.com>
 <CAMRc=Me004KgVZDVVCD1r_yDfpRjVsw2TAJCGiHd+TEiQ4xW6A@mail.gmail.com>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <CAMRc=Me004KgVZDVVCD1r_yDfpRjVsw2TAJCGiHd+TEiQ4xW6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for the review. And yes, I should have paid more attention to 
the code, sorry. I have reflected the reviewed points in the V2 patch, 
so please take a look at it.

On 12/5/24 22:20, Andy Shevchenko wrote:
 > On Wed, Dec 04, 2024 at 09:21:52PM +0900, Joe Hattori wrote:
 >> In gpiochip_setup_dev(), the refcount incremented in device_initialize()
 >> is not decremented in the error path. Fix it by calling put_device().
 >
 > First of all, we have gpio_put_device().

Fixed in the V2 patch.

 > Second, what the problem do you have in practice? Can you show any 
backtrace?
 > Third, how had this change been tested?

I am building a static analysis tool, and it reported this reference 
leak. I overlooked that it still reported the same error after this 
patch, and it is fixed in the V2 patch. If a backtrace is needed, I will 
try.

 >
 > Looking at the current code I noticed the following:
 > 1) gpiochip_add_data_with_key() has already that call;

Thank you for pointing out, the call has been removed in the V2 patch.
 > 2) gpiochip_setup_devs() misses that call.

I was not sure if the gpiochip_setup_devs() should have an error path to 
remove all the registered GPIO devices when a single registration fails, 
thus it is not addressed in the V2 patch. If such a cleanup path is 
needed, please let me know.

 >
 > This effectively means that you inroduce a regression while fixing a bug.
 >
 > The GPIO device initialisation is non-trivial, please pay more 
attention to the
 > code.
 >
 > Bart, can this be removed or reverted before it poisons stable?
 >
Best,
Joe


Return-Path: <linux-gpio+bounces-13970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 057F89F4E63
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E8D818882B1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8130F1F76D3;
	Tue, 17 Dec 2024 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L68v5LnV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAB71F63CB
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447011; cv=none; b=LxNHJeK0QcxiJ6GbvMl/bIwXnImeKRFYeuAihRr1i+hZ9DXvr0J68lkc0dKi1f6tL/Lkw6rqgWpQOrjwysRKykn0Y/dPHJfq9hr1+AFZaPyhDcaahgU+I3UIokrfkPxosifpBHvEdd9lWAqXJpSHgcxUGuQB8wFtCSoNBIgl0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447011; c=relaxed/simple;
	bh=Ae4g+o4SrUUouyU6JTQr8W/GSuESQPuA1a0/fO2H38I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LW2mM1Pw1rPMJ1vth4p1NQcS9SfGnl/DEMMHOzp0nkyWcFxbkCEygs3AJ+/QFMDpuq7f+pP6SxtQK18xO5pJrwxu5I1FQX4SLK8TbQj/NqQNEz27R8c/H5z6jcfxwPTBw68HR7OMWacIfvGBBMhULUTBxqxsKDuVybZ0tHFZ6rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L68v5LnV; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso8155216a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 06:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734447008; x=1735051808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ycke3T0FtYGNg3PwgW0NCCRZfN9GJ53dRhecaGhM6c=;
        b=L68v5LnV0muBBasJV1djRNq3ePbO4F/NY8NwNGeqUJLjSlESOKO/ciUgX2FMuNnnOw
         zW9+8gPIArejcDVyFnnSxufRajuaBXMGSy7adf6+0001J9GY3oVZZ/GDln9aHHDuOiXx
         XVTSwxOUu/o4ogkANdZy2kNrHE/lIbxpq14DOoOvdRu7y9CNYcnYPKLYt/JZWP9E9SZV
         P8Lbom7ZiDj487S1DpVF1N0n1Ac7ogGD8gAKe7+MtBWgzZmVtglLAINR7Wn3sn90Fjvc
         RGaE1z9ZIzk9Jk1KP7BDHwGKySecFAYr+oNY5FCLsYfFeYewEey+IHF9vXitstzv44gm
         tIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734447008; x=1735051808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ycke3T0FtYGNg3PwgW0NCCRZfN9GJ53dRhecaGhM6c=;
        b=xD6F44T//jI9xHcJsz7DhK5XsZOQIih+n1xBcF/01HnE3/1eZjHy7ppcWtpSWf5W5C
         obM3VNNDQDjw+RxOOVkhylGx3ia0xEhbIEfl/e2sJKnPv1OTCTsUMIRxLqXG3TgBlHm6
         n/HtOykpcr6EpmTo5bNvG+KaHYcYRMgkkudt8pZIjfKEHvRCnM1+chxfwyo9p8nmzXNS
         7g+2xks+OA+Y4PYUXKpmJqy4MxlDOo/O4xuqtipJH6leWgPwZ5Jeo3XKI5KSZZ5RbV8I
         TporfL4dOQaB+szEn7YjgQSknEv+SglC+r6tcMFwGJIXl/bMMHU3ioQ4wftvMh+96goe
         X1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXxrVtu3ZXZMPaTxG303Hwi77wIws2RJTlXk6iczMWd+TPGV/9I3FGJlX3Rk9LO3SisI4uWId64ozK0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9xjV8GyGSyPYfwjjkoqalStvoOcfxGgqidKVlRfhXKFANV5l
	k8viL8hgcJ1hz6NuKligC6yqoTP4gBCtyB3+knYiZ9ckI6EcbXuWEciTai3wHS8=
X-Gm-Gg: ASbGncujrk1EIVT3qAh0zhx0TgTNHSNMmaULSP5PbeG2B1BH2knUJ7rkWkAkrrzU/nR
	9D4T8JfcCsCIbfIoTajy067iW3oBxWCvUinURCMZyY0NsqIGF+zB5tZb8QshSkewQitslM71hPh
	Y+ia6woNNG0JMxt0FX3ouXOZO4DCMcfMtjCglSJZOBx/0PTrFmfiqe2priySWnh4wbMcSPx+tvs
	JfFJqGMA3eaqkw39FrKuA/vZX71A/OZjU9yxtMPtRNqNazQKHUIbYKdzM6gvg==
X-Google-Smtp-Source: AGHT+IGOUjQCh7pdBsXmyuaUSolYMZWmt6XwrTMde3rBi1yLvFprfTSIzhaibeECiMuEQ9oaPdmyZQ==
X-Received: by 2002:a05:6402:50d0:b0:5d1:2534:57bf with SMTP id 4fb4d7f45d1cf-5d63c3bc37dmr13657470a12.32.1734447007937;
        Tue, 17 Dec 2024 06:50:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f33027sm4310953a12.74.2024.12.17.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:50:07 -0800 (PST)
Date: Tue, 17 Dec 2024 17:50:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: gpiolib: fix refcount imbalance in
 gpiochip_setup_dev()
Message-ID: <83a0821e-eac8-442f-bbeb-de2d439c02dd@stanley.mountain>
References: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
 <Z1GoskmQH0_FhxID@black.fi.intel.com>
 <CAMRc=Me004KgVZDVVCD1r_yDfpRjVsw2TAJCGiHd+TEiQ4xW6A@mail.gmail.com>
 <1cbec5a7-6c83-4abe-8532-041dbf891e16@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cbec5a7-6c83-4abe-8532-041dbf891e16@pf.is.s.u-tokyo.ac.jp>

Most static checker stuff is cleanup code.  I've written a blog entry on
clean up code.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

You mostly get this right, but one thing which could help is rule #6
where ideally the cleanup in the function is copy and pasted to create
the release function.

So when you add cleanup to the error paths, check the release function
and see what it does.  Sometimes you've seen the clean up code is missing
in the release function.  Other times it calls wrapper like
gpio_put_device() instead of calling put_device() directly.  The function
calls should be in a specific order, (hopefully the reverse order of how
they're allocated).

regards,
dan carpenter



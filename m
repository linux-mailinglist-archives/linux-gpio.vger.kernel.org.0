Return-Path: <linux-gpio+bounces-24887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA1B33A48
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07BB31898494
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31102C0F95;
	Mon, 25 Aug 2025 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7iWC4YS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907382C08DF;
	Mon, 25 Aug 2025 09:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113188; cv=none; b=a2yPtmOVdL+NsSNB4ijWJTOVRo/9p4BqH90sAMDGK+TTbCsPUaeATrbfhakrRl8PhDDbmqHhM6VQPg0fafDTvg1S0oWna43FfBi+fKwJ1z29i74P7WIvbgX3k+f2InFP/JzIl2qbNYsFlPN5eCcb/TPGu7mCHa5UAbA19eoe/lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113188; c=relaxed/simple;
	bh=89SJ+CeTRw/ZOip4rlLEx2j30XPwB/TJtFZLnmPX8Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNu6SE3E4uOd6sMNvePME6o2PBEgJy7X4pChjgS1aKwTgEohilI7GXccEZ1i4JsFCnlppO28HGSVHec32niX7Myha6FK0xWRAnPm7TPu96CImtlMmCHopm55uELzWaDvglqfLpVZ4GmSaY4FG8TNreN915X3is3nwX5wEjnsEuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7iWC4YS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso20713345e9.3;
        Mon, 25 Aug 2025 02:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756113185; x=1756717985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=db4P+0rJIoVMAf9aCGAunwkOJVROKaFbOov+4nNddVY=;
        b=j7iWC4YSxEsLFcmTLjQutM53PVZa18MiKgqdX2cTtLoEAIxkvKLAAiCPDZKI5SA49g
         sekkG7WR8LdNXn1frcMXL39IhOaZ3VEu0WQRiTIHNMBig0T6ENanwnHoUAzmns8XBY3l
         r2HZo9e4sZ9RSZjDj7g3PcTfZ4ZVL14eeyPJPM/JmTnL9pM/9KQPTLtpOYeUpEZfTZAq
         KNfX3maywqj7PvDrnM37MNMNxhDZusuPwbbUJG5csri/v1JFuJTTi5l2HspLIMbj4XHm
         ocdQUtKc2ecL2orgBc8Qiuoxzu6vp4r9A4ynpgO5LewiqXuSuiPkNwiXtyM/c+TDmlzr
         rNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113185; x=1756717985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=db4P+0rJIoVMAf9aCGAunwkOJVROKaFbOov+4nNddVY=;
        b=lXR4tXTHHNeMHNM0HN6+EXJeD7tZceCfO2SEH/j4M2phCJ8x9ktw4E4XkcAodIZOl5
         rRauYxtKwswWvZokaje0ZKVfwNt0uMevZbk0wkbMp58OVEn/i557/PafyfS/s+2gMxd+
         Ou7psIFUYkHbqdPlk20IC/I88s4L9Py/ZmjbT1pqT1q+13IdwM6hbfbr1Jwkwm1Zh0yw
         slRGe99F2cnF6BKZEbw/F+/eyi1RUgpboKF37mRwMhpM0rA14dW1Fj0ZAU4SjLAh0MIF
         mbDezG6ccCWaykA0gpZP9tiEGIpf+CbwZGnzRngWRKbh9+jWHbHcaNGvVabO95Rro8yY
         4vzA==
X-Forwarded-Encrypted: i=1; AJvYcCUoEGTpZkXRU/yduE1wBqFlrFOHL0/zycVUdUscfpDggC2i0aV7c2BsFCZcvayYloQ5Lp7N4ZbTzEq9BQ==@vger.kernel.org, AJvYcCUw389aC/JSXfTs1SYyztheL+u3qDULGmJU2hB2ema1cQIrWVxG4MZEF3PBsyNb8P6ngp0OtAAZIvUC@vger.kernel.org, AJvYcCVLwmtsyyVJS9htlPQ5gWgNb6FMwsFuGSkIV2KHlOQlMfns6JrLn/snFRH4w5/QbkPGRwqiUl4jeNNGPlQ=@vger.kernel.org, AJvYcCVtBo10CmbB4CVE/fW3nierLiiEMSvNzxBw8DRgo09ydeeZWiJwq05/KLl2XTapTkA4KVOs9qgVkEj50RD2@vger.kernel.org, AJvYcCW5d2d/sWJYGd/Mgc59E6DrE6eueWnM2k7xByCB7WAILFX8Fiu6Up04MuOufoby1ZIKNVwDPI1AB4p/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79tLnHzYzrJ9AQaR2m6A0Ludh5B8mdQa97xUa0Z26YCfk5Yex
	zaFl/+Uhg75faegH2u26cBMPwUgX5zlevrIHsWokpucaMrhUIrCV0Oxf
X-Gm-Gg: ASbGncvzph6voQGuc5Zv8olUBvjunJgvn9j7br8X43C1F50d6ZQkpEv7pksFmVpoqeb
	2PuS0rDjQfTB61EQgpQENd4i09wyq1b5CEgJk3jb9hxE9H+Oq4RCKYf199MyUH7AxlyGdxwodsf
	h0NcMsAdgM2t0MN0A16sO4TI2bz1y9zqNuhh07IXs+P6Ba3DIkqb8RfKi15E7Zcszc6Fx3K9L4s
	hiRcUbJ4Fz+vasW+1HFKicY46peE42RKa377JpcAYTGfCwIlc9OvYrZ8ol76/3rnDIGpEl7Y6AU
	9SwfsKJemQ6Co9/rKXh0cva5hISdKzhtGTjkAhPWJo1DuKZN9MY8B0vUAI+cx/FdyNLev9jO7KG
	T9i6l1fF17GToWA==
X-Google-Smtp-Source: AGHT+IE03utt4ThdNe6shpSXgFmCA5mbksDv1S7T8WZiNoIZMCptGYie8W77bfRxLDIMs5p1gZhy8A==
X-Received: by 2002:a05:600c:19cd:b0:456:db0:4f3d with SMTP id 5b1f17b1804b1-45b517b9571mr120173075e9.24.1756113184697;
        Mon, 25 Aug 2025 02:13:04 -0700 (PDT)
Received: from nsa ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c712178161sm10638818f8f.67.2025.08.25.02.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:13:04 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:13:25 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 6/6] gpio: gpio-ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <y6qiierd6qdzcyghzaisv3ajlt53f74hk64tomm57kqouci5k5@cgpxvsnz4jks>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <20250814-ltc4283-support-v1-6-88b2cef773f2@analog.com>
 <CACRpkdax9THwKRZmaAHVcKbnBdi1LxjgvibAFOUVnVQJBhBiwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdax9THwKRZmaAHVcKbnBdi1LxjgvibAFOUVnVQJBhBiwA@mail.gmail.com>

On Tue, Aug 19, 2025 at 02:12:51PM +0200, Linus Walleij wrote:
> Hi Nuno,
> 
> thanks for your patch!
> 
> On Thu, Aug 14, 2025 at 12:52 PM Nuno Sá via B4 Relay
> <devnull+nuno.sa.analog.com@kernel.org> wrote:
> 
> > From: Nuno Sá <nuno.sa@analog.com>
> >
> > The LTC4283 device has up to 8 pins that can be configured as GPIOs.
> >
> > Note that PGIO pins are not set as GPIOs by default so if they are
> > configured to be used as GPIOs we need to make sure to initialize them
> > to a sane default. They are set as inputs by default.
> >
> > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> (...)
> 
> Can you check if you can use gpio-regmap.c helper?
> 
> select GPIO_REGMAP
> 
> git grep devm_gpio_regmap_register
> for example drivers using this.
> 
> I think it can further cut down the code to very little.

Sure, I'll have that in mind for v2.

- Nuno Sá

> 
> Yours,
> Linus Walleij


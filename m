Return-Path: <linux-gpio+bounces-18398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A912A7F021
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 00:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B7973AAC76
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 22:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92702144A1;
	Mon,  7 Apr 2025 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaHsvH9c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D77823DE;
	Mon,  7 Apr 2025 22:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744063242; cv=none; b=PE4T0mDXO6ic7SM8ggPJP5g6fXk9pNnpEKgWM47Fsw7LvgFbko43xB3vDQIzZV2qd0VQz/JLRQanpzZv9eVOfaXNZVsh//Kc2Zg997u/6SEMoOitXvwCZco4u/Wg5sR2vtTu53W/fYq7pdQP94KLlWkDOXXP5pFsc6TCfJVbbLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744063242; c=relaxed/simple;
	bh=AdlKtehz82doSEn45Oyk5hf22xBH1s0QhMC3mjY+5lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aahxK6bZj10m0CYuXPZgOAXAperL0i4tGrys9/FidzPTdDaIEAwz73JHA7R6Z+Ml5si6gG7ZX8/iMFFEv46Aj77SjrybZmL7hF3d7XphmYR8bJosUOl3hrT/8OeMKamBqrU1w23B6HUlJGDHHbSEB5eRawBhzPsBXwDbRafdMeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaHsvH9c; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4383188b3a.3;
        Mon, 07 Apr 2025 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744063240; x=1744668040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6D0NZ7H12HB12+U9+CnAwmOYRWcrrB6ReApYETicOk=;
        b=FaHsvH9cRz3fZmAAvc6VM/+Vy8edaxBJWRKy1qKoE8DrNRBhodUNYsq4GdVUyhkO/U
         SC4s7rRBmzrmU9f3FvJAp/UcZChTpECNv/rlV/bsGBcDSqpFRuq/4OiDY80dS62yQFQS
         4587UpKX9D7i/MK3MsCcE+uI5h5Qw5vVRwH4X0Q/ceso0BW/IWttKXz0XYltPlTB1dJ3
         lJKLiuQQ1JV4tgX3y63Rhbip5sLWYi2Q4Yktkb16vmioMTSnLx+QWFzLGjGmzyM/or9E
         fUycA5t7Va5k2p/DNIWvSwx0B4lvp0Cj/9CQWSWPCBOOYwSLpMX9lJJ6I1I61FQK3dC+
         9iWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744063240; x=1744668040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6D0NZ7H12HB12+U9+CnAwmOYRWcrrB6ReApYETicOk=;
        b=W6h+M23krxKwpt52bR42/iSDHuofiVYIHbcskTcwvXqsfjhu3l0ogT4j/tbw8tgq2l
         gxgSY0EFNUBKeDqaBWhGpK4NTDvvG9rU9Aew1LS5aCcf3g71jEnFQl16iJVvrrcS816i
         1XvgTYxOWzMYbJigEllGk3/W2Upml2voUSXQh6l41o/gbgRy4Vgaja4C+/g8xVnc/3Nz
         /EllkLXvpfrLQYHEMxgSfAJKhCtLfS1A5DCXTpBfzFWaou1iZPety80fll+29F24bMNy
         PSFeLtIpkRvuGtoZ3jYKfIbxwClP/v2lH3RBQsUzngX4Cb1wL7piuFIh7FJGXMrSbAXY
         Xi5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRjRKwfyYNsIDLYAUKltVYJXAE3vEZGeIu9eTM3K5KZEVLbGoKs0cOVHBzDyETSNC5W75o+ALlsauTwhk=@vger.kernel.org, AJvYcCXIKue24FPkuUNrWP1kZ9o140cdr2YyHpyIbPHDvulS2ggrXeRtD95wUqhByn7nhlS5HX0FkxPhjQlI@vger.kernel.org, AJvYcCXVZffiutZXAKlFPAFltRrUVsaR8UUWyQ6qtoDv9HrUChAqmr7fBVrUJ8htw+3ezGso9f5F53FKZzfxcnsn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnix3RHyKzmAEQbVprlQbcf5jMZxghzzF3XdhaZOssOY/jGF8r
	hUjSD2Q8bELBRH9VpekhF63nKFH8iLDWLKFYoGBa9iLXZjSh04b5
X-Gm-Gg: ASbGncuKh51qjQUzSj8pS+0xQGIutuajVG7C29ymnls3qpcvu5E18XxXh2qeLUiNPtb
	AbGiJYFz4sktwmOeJ37FxiC4xwNMtppEgWXvUlEGiXu7T14LFeB/K+q/Gl+b105HGYxzgEnH2Nv
	fiFg4mtm1NeFYFq0sy5caIP25oihv4NSEttrmy6A+ZqUi2i2VV2i9xNoUVUZD5vXHRceF+l4UtK
	ucIVBXH4SAMI1246DkVCuJl8LTGjJp2QNOcvDOcXgBQ7jZefB4u6CHuaNrK8br8kjqAlSPFsPp6
	yIynZaPK+BV1/ZC9Tm3rAehDc35GpR4xAwbDUMmQSPW9Zfx08EEVT39LgA==
X-Google-Smtp-Source: AGHT+IGXN3PtptyGLs+CQ9CJ+bDjhpeR7ILLRO9gIYVJ9LOIe8y7I4UKlZ9jze/A2pKV2h3rQA9TCQ==
X-Received: by 2002:a05:6a20:d50b:b0:1f5:79c4:5da2 with SMTP id adf61e73a8af0-201047368bbmr25358744637.31.1744063240025;
        Mon, 07 Apr 2025 15:00:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc31db70sm7853349a12.24.2025.04.07.15.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 15:00:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Apr 2025 15:00:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jean Delvare <jdelvare@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/ucd9000) Use new GPIO line value
 setter callbacks
Message-ID: <b5e0fe4d-9acd-4bdf-832e-673237f16f4b@roeck-us.net>
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
 <20250407-gpiochip-set-rv-hwmon-v1-2-1fa38f34dc07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-hwmon-v1-2-1fa38f34dc07@linaro.org>

On Mon, Apr 07, 2025 at 09:16:17AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Applied.

Thanks,
Guenter


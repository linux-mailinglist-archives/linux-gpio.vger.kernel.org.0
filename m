Return-Path: <linux-gpio+bounces-11541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ECA9A22A4
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BDC51F21ECD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 12:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7134E1DDC09;
	Thu, 17 Oct 2024 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PujDGkMD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701061DA61E;
	Thu, 17 Oct 2024 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729169068; cv=none; b=ezZXjmztnZanV5pfSMX6VRLFXuF+WVZjZSg9wuvM2HGsu6lLm+1ttznBcsJkwS7I1ekt2wLQM3E+2n6xR7gYKwHWebZxlzZ8UkVNj7xgjP7vdOzeaMcDql+2VOmAZR0utqt07ySRks+tl1oJBviRogBeYUhIHYNxnNd0LGKixrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729169068; c=relaxed/simple;
	bh=mt+NMi86sJ1rLYGBTXhYvaYo5i3bjNobHS95VseAgrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aw2eBHCXNECXHkU5Wi/RccIY9n1Z3BTby34FYgY281xjG1igF9a2C+Ydx0UQKxhXv10VIMvr6xb7L4DsCu66/UHwHVdDKkVOinRu2TOdzlHm6oh5xOaOIGKSvDFubBxKbeh/5woqMqYJEQ9kX/v/40WaSsPUkmNXb4Ttzpdli3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PujDGkMD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20ca96a155cso7166505ad.2;
        Thu, 17 Oct 2024 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729169065; x=1729773865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zG9PeUqDzbG1kAQW7q4YeEudloX5/VsCl0lOklorYQ8=;
        b=PujDGkMDX75XZDDUxXBOAwHj1nCZdibgDBOsZu2o1VeXUPe0g5FwGchL3sQn7verfX
         ofr5SOK26PipmW16yGtVpGAtCuEnxRyfljUouN+0VorVJnb75fMDOIJMaa/oGl78fOJk
         3LJhv/2m+USuJMU9y1strvbmK31th325Wyaf54t4jEujKPB9V5XGENJAaUihjLGlifiU
         x6APEIIVfT+8Q/V02rLniGPTXl0YDVq0cB36kUnZoh/rsnU/nZX405zLMMyThojvdJtR
         3tEkY9fJK+dYrhScO3jAQUa3KfYe5VpnYZsAGtW81S3W2j2ecNhdkNnX86JKfFOSOvJh
         t1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729169065; x=1729773865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG9PeUqDzbG1kAQW7q4YeEudloX5/VsCl0lOklorYQ8=;
        b=p5blAwf/s6oEEIaZ6Bs0e+BpvAF4jstXfFzu50DuDtYA/jV+r0ars1UTtZpgyn4PrZ
         4Xjz4y3andgfadeFUPaRONQm52TwL9mn3UwLUunYkzJ0/V3nzFHZ1gulf7SlVZlRGHM2
         9Ovr5RXce51iuZPF1DT7XSj4MFDizG/oC7COQ6+Db2+WvFHTKGgAmvZemrEQB+j5ZZ1q
         N1m9wBKcXJUfkItdaKbtMC1shRjsKh0L7yFUjumvJ7FUgBxhn8Bb32jd6akfj+QF2FqZ
         r+/GXaqal5uaCzu9Q8QoCvGMQjZ1kRpWh4BQIoIDbU9iUefODzHzn1H776xUfA2wE1UO
         VXqg==
X-Forwarded-Encrypted: i=1; AJvYcCUBs57QlE3gh1DiVHIS7pxQNqrR8+7W2P69ZX9gAEp4BBRnhjR7E9vrbpOaWLpZ02I7+ku0ONpc9MrT@vger.kernel.org, AJvYcCUyPkCkZHLZMBclcA3YdFcOJT+AHWwQgaforKtrNFj+uqpOgYr3UEIhGCevCqlvrnJRHuz67rvQUXOkoDLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxXf7as+L7LiPpozVQdUg6fYmiiftZ+8Ip/RkrfNuww/q3YJA0e
	vy1LvbcL0x9KbcolhDUAajE/0BiF4MlYMnpVB/0t/nm1sSMs4BjYZONPuQ==
X-Google-Smtp-Source: AGHT+IHemkWCQ54g5WrKwCPeyXkVHn9NcKAl7pt7qfoFIfhj6jAERRXEGucwBhionrRwXiUYWpqr6g==
X-Received: by 2002:a17:90a:c708:b0:2e2:b64e:f501 with SMTP id 98e67ed59e1d1-2e2f0d7f1fbmr24811067a91.30.1729169064577;
        Thu, 17 Oct 2024 05:44:24 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e0949f51sm1785686a91.48.2024.10.17.05.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 05:44:24 -0700 (PDT)
Date: Thu, 17 Oct 2024 20:44:18 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 3/8] gpio: cdev: go back to storing debounce period in
 the GPIO descriptor
Message-ID: <20241017124418.GA221864@rigel>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-3-64bc05f3be0c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-gpio-notify-in-kernel-events-v4-3-64bc05f3be0c@linaro.org>

On Thu, Oct 17, 2024 at 10:14:11AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> @@ -1047,7 +925,7 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
>  	/* try hardware */
>  	ret = gpiod_set_debounce(line->desc, debounce_period_us);
>  	if (!ret) {
> -		line_set_debounce_period(line, debounce_period_us);
> +		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
>  		return ret;
>  	}

Not related to this change, but this check looks redundant to me - the same
is performed where debounce_setup() is called.

Want a patch to remove it?

Cheers,
Kent.


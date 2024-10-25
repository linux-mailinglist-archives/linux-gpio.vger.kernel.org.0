Return-Path: <linux-gpio+bounces-12102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C54CB9B03EF
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 15:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618251F2397A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7BD70804;
	Fri, 25 Oct 2024 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARUhDD/z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93CF21218B;
	Fri, 25 Oct 2024 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729862667; cv=none; b=SJCg1cDEzI8p9zhXkydixLEHc7/DzBBUVarormQLub7f/MEKlXGxqGwqw1fTKQXOICDIfG4IrDI0S/OBmC614DwhBLLZ5uAn7cv/9b3JOrB0Sff298+IdnMvBR8kDS0828fbAoQ+ha5XVf1AfWKxXh8p1iClYa2MEeJdxUHG0XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729862667; c=relaxed/simple;
	bh=51dKJ7Ed57t8VicYOCxosy6fY1zFlccA6PO1eALXl9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6O9Jj2HmIoExj3nCmJ62k9tcd/r43jq937NtZHeHOkFTxIe6G58aZ1nO/sdRS3fuKFbkHsCWqoZ9T4xHJXhvoULjWLZYN3RI3TlzFnTdajddZQjn8I7GK79DHYkPTzF38ykYEkpRFyFmbPCp8J0f3cCX5R5itygW86vVsn0/Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARUhDD/z; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20cb7139d9dso17012405ad.1;
        Fri, 25 Oct 2024 06:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729862665; x=1730467465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WU9qxxvxTf7zt9wyjlFg/kFNR6xBLJ3MYlfdsRtKf18=;
        b=ARUhDD/zz9r/GbRQOJsNH7qRc6ONG340M8PNRXHoIDOcmSY1nAl91v4ZXhu8ReR/jd
         1P6McbqWXQjRBZ35QXcMsoedkJuRUie+lAh89bPwHFMQQPFbollKKcPadNSf/0aeMQpH
         RhBvshn9GKolbGc+W6ogI4JY96qY0o6XHd7rQ/7gQpiYhhMHPhKD5fw+mwxvxXNCot+8
         HqKfv7ZHCy1mu/p2oPOFaFcdngB0jKd41rTDtbvvVpcsUoYTJz/TESvOdvEP/AKE4vAJ
         ukf5h+KBf2O+Ea/CprxkA3flgTUdmcmAGAdE8qC78+UFqrtbJhZuQs+eXGhAYH92OuOl
         OOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862665; x=1730467465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU9qxxvxTf7zt9wyjlFg/kFNR6xBLJ3MYlfdsRtKf18=;
        b=KGRFItHYtoF5qyj0GNN/R2ipML81D/mr21g2YVtvCv69Pi1kPdOof4dRGRX7lQjenF
         +ZofckU9qktmjOw2olTrUkEqDLpJfmqnZGKgrE3xxjGB0wT8VnYU/j8xHjN/iQPVQBX9
         SV5DQzEzzPs3oLePbdlor9e6Uf3Wv3DkFCGTTtKS011weDhcqJ2Zri/rsngjoDuu3brq
         ADMK/ea5RWE531sUCyrYqZwaBxGGYPF/7sfbk6UdCuEFX+E938fefDukQSQTd+6rYzzz
         XhrEa95jvxE3NsnvbXsUC4HC5llNIsGONOfkanFWioHxuPgGaeooNSNHT0r+egDjQ+fU
         arDw==
X-Forwarded-Encrypted: i=1; AJvYcCW8cGmqhGEPaU8bBlNXIu+4PAuAhUTQZ++3rpSTbvwl+b1skSB+xCMPyDmWvzwnFWbZIepqaSFK1999tYta@vger.kernel.org, AJvYcCXosNxQnKbYpqk+obaquyj/eeFrH26ihO/RrRTWJOQ1kEVqtkMznfa9GFFARFvTl4YvIwdGxzb9dI5S@vger.kernel.org
X-Gm-Message-State: AOJu0YxV60sVGb83SzUQwPhSlI9gudvqkpebvTVfyaQit1l2na7M/oVP
	ChEoy9VnsdeP/8w7BGhQ6xEVu3OXKDp6bt1G73S18n1nakecsnUh
X-Google-Smtp-Source: AGHT+IF5NE36x5VPAHBd5xQ4qLx+mrIG4HheWP3ds4tnL5KR2QeFM3qikFeqt1DkjxepgK1ck5X/TQ==
X-Received: by 2002:a17:902:f549:b0:205:8bad:171c with SMTP id d9443c01a7336-20fb98f1e18mr67697415ad.12.1729862665050;
        Fri, 25 Oct 2024 06:24:25 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02eceasm9221015ad.212.2024.10.25.06.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:24:24 -0700 (PDT)
Date: Fri, 25 Oct 2024 21:24:20 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/5] gpio: sysfs: use cleanup guards for
 gpiod_data::mutex
Message-ID: <20241025132420.GA155087@rigel>
References: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
 <20241025-gpio-notify-sysfs-v2-1-5bd1b1b0b3e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025-gpio-notify-sysfs-v2-1-5bd1b1b0b3e6@linaro.org>

On Fri, Oct 25, 2024 at 02:18:51PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Shrink the code and drop some goto labels by using lock guards around
> gpiod_data::mutex.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 81 ++++++++++++++++----------------------------
>  1 file changed, 29 insertions(+), 52 deletions(-)
>
> @@ -139,19 +132,17 @@ static ssize_t value_store(struct device *dev,
>  	long value;
>
>  	status = kstrtol(buf, 0, &value);
> +	if (status)
> +		return status;
>
> -	mutex_lock(&data->mutex);
> +	guard(mutex)(&data->mutex);
>
> -	if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
> -		status = -EPERM;
> -	} else if (status == 0) {
> -		gpiod_set_value_cansleep(desc, value);
> -		status = size;
> -	}
> +	if (!test_bit(FLAG_IS_OUT, &desc->flags))
> +		return -EPERM;
>
> -	mutex_unlock(&data->mutex);
> +	gpiod_set_value_cansleep(desc, value);
>
> -	return status;
> +	return size;
>  }

This is a behavioural change as you've moved the decode check before the
permission check.  Not sure if that is significant or not, so in my
suggestion I retained the old order.

Cheers,
Kent.


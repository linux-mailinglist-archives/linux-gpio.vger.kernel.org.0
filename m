Return-Path: <linux-gpio+bounces-9835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914E96D99C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 15:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 151251F22F78
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 13:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B888119AD71;
	Thu,  5 Sep 2024 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+AoRmli"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB97198E84;
	Thu,  5 Sep 2024 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541290; cv=none; b=o3UJloid6xVQeDmXza50HN3tx7jo8qecZ1URkC0oKCKgCB1O8Hiuo2FQmfMs4m+zmuQUoMqVE25/9FZ67u31wN5yUhBPtgnTWLBuKgn4Y22AyIKPh+R/XsqUDJH2P1xRFR94fbR7mXhQa/ppmhKVKTSvyDI8BpLA0+to82Sn2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541290; c=relaxed/simple;
	bh=tkxHU7hZVDfRA8rd2YekS1j0GoIwf/WYcslyJtMoVXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THk8G/Ha76OWgcqNDn9UGZ2f4uY5S9DV2+SgyTpBLRHk4DQHlrJUwcEyNMM4dap3RcnxOnVIOFJSVsCg5iDMLmy6Dz9jQ72I69ibDxP+dpNBZghXmCBYWSDAi1uJe1zkBXAxOdIl3clsBrTPILMNqWaJOBoUQk7L+E+GFruuzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+AoRmli; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2021c08b95cso15402105ad.0;
        Thu, 05 Sep 2024 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725541288; x=1726146088; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b9ROrOIM9enPhK0yrnMuxFWN8TPFgN2Dmn5612MJ8mg=;
        b=U+AoRmlifAVQQYhYMstggA+CGCGeck7iFIeOiyDepImqD5bFv7amCoPRo9L9CyooUq
         C4sIG3MQoqYtjjJHfn1xEHqXNftcVJK5nfl7FgAejGCwams7qkhYXqvC+djOsTNzCpkz
         xovq0vs8cCbzd8K0CXDmTx08npBZvuGJA0VkIYE5DLEefgW+1bXYl22fCtr1s0XbXp05
         P500RsfgJCGQVpzACR9PWkf1F0IotIcezrqxmnqGfK9RL7w6zjPyv0atLhrwJXlU7qi6
         TZ0SuTXkkLRD0ntHM7LggSkvzKoeRQe59APa4U8mavBffJR1/+eLw2U+NN6a4ol/KL2G
         mCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541288; x=1726146088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9ROrOIM9enPhK0yrnMuxFWN8TPFgN2Dmn5612MJ8mg=;
        b=UBeaxhPkkePUbFbhh8VYZty/x1SbUke2/CMViE5iSE+ljvAAtepTZIGgR62Jwrtr8n
         GqbfajYnBRbFm/nhYhfW+6gsJfvZ3D1isORS4GyDxzf6wISTBauhgciuyByXIcB6PadW
         TYtxETESyny2+m6AC4RcMJGYZiOXi35MRsj8LGhXkg0E/F4zUdjBkqSLAOoDVw6VgCLN
         LEMd0zjw4WcBfvvEkoN20HQMuu6LsE6qjp7U+htxIzVlHXeiZbsrZnnm+cJinejUUDH+
         hQkRgy04WavcEnGLGgM8KuZ/beM4I8qfbqjSFp6Pgs4Z/pq3y/toUyYKHb5ReCKmmpZE
         5CpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbLls9PBvsmzaJKTqsFRAk1JYwBTi8rxCBy6V5vr1n7wVtqV6ME8q7c/d95x2h5Q/2D6cLVmWDdf3jrZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLsugodvH7CAapsm03p561aRLoRqDR76c2CDcsNll3WP+l3Zm
	0EUpSNKTkxdJ4IP/uHlCX4OcXWJ7nEQvBKZrqDBajty2wAXQEGDW
X-Google-Smtp-Source: AGHT+IEmli1rNfjUdTgqJY6ZDnm2bVAcwPRt/sBwOd6M9bWhnrxa6kByqOINAVR9Dm3QLQlHDiQWmg==
X-Received: by 2002:a17:902:da91:b0:205:7b03:ec3f with SMTP id d9443c01a7336-206b835fc61mr81218615ad.19.1725541288374;
        Thu, 05 Sep 2024 06:01:28 -0700 (PDT)
Received: from rigel ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae913df2sm28301605ad.41.2024.09.05.06.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 06:01:27 -0700 (PDT)
Date: Thu, 5 Sep 2024 21:01:21 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: use !mem_is_zero() instead of
 memchr_inv(s, 0, n)
Message-ID: <20240905130121.GA166185@rigel>
References: <20240904090743.1204593-1-andy.shevchenko@gmail.com>
 <172552177868.28435.4071190094207246356.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172552177868.28435.4071190094207246356.b4-ty@linaro.org>

On Thu, Sep 05, 2024 at 09:36:20AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>
> On Wed, 04 Sep 2024 12:07:43 +0300, Andy Shevchenko wrote:
> > Use the mem_is_zero() helper where possible.
> >
> >
>
> Applied, thanks!
>
> [1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
>       commit: b1da870ba36b3f525aee9be35b2f08a1feec61a7
>

As per my other mail, mem_is_zero() is not defined in gpio/for-next yet.
So how does this work?

If I build for-next I get:

drivers/gpio/gpiolib-cdev.c: In function ‘gpio_v2_line_config_validate’:
drivers/gpio/gpiolib-cdev.c:1334:14: error: implicit declaration of function ‘mem_is_zero’; did you mean ‘xa_is_zero’? [-Werror=implicit-function-declaration]
 1334 |         if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
      |              ^~~~~~~~~~~
      |              xa_is_zero


Cheers,
Kent.


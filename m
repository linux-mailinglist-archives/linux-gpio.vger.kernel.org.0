Return-Path: <linux-gpio+bounces-10866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC62D991429
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 05:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21EC1C22561
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 03:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F4C1C687;
	Sat,  5 Oct 2024 03:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6AFv6Zx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D72810F4;
	Sat,  5 Oct 2024 03:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728099971; cv=none; b=SjSjTwzqMEqnkL9XO9c+dGdIeNeJmpCbNq9ar4IEvNJ37zsS76cZS3VqeySNtUZ9LkjkRajHlxb9v6p/Tbgqw08FElSm+7hNakyNkERkl8qIw0OhOCIw7g4CxhdDxG9GezW6lY1YXuuJ1Ex4I/LDgm7W9JJnVER+4ncBSo/128A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728099971; c=relaxed/simple;
	bh=jj1hTTDTs7gvVuUjnCJAlO83/Ioa7dCrpGtA6y6/RoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqxz+/vZbi3SICNZinxBVQdZdlC+wOCXrmvbkRvWstNDZ+4Tw4+V+2xG7irRSK7v6BbV0iam6EbtNkwe0FK993uHPf+NlwxckseWlDtASz0Ikchge2O0kL7/IHWqJceSeVkZXJKw0yMjw4DfFpKuyk5AABhF0VcIHYbRxHhc0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6AFv6Zx; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e0a5088777so2194932a91.2;
        Fri, 04 Oct 2024 20:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728099969; x=1728704769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+FKLPp297pv4YqZ8PC1oE0NCgF9pFVYsLCW0C43Yfes=;
        b=C6AFv6Zx4w0zd4U9hfhn0w5K9yfGeDAVUjXdc7zXjfcVuiY2ZE1FJXprfQnakv8tkd
         z7i5O2ACVbj/CcbrQBbSa8Y/VjETR6eZGnTEK2GgidT9mxx9YiCoC0B++rhOkwZo8NAE
         LPo1RzAdbePNb6JVVmdE0ugyAkb0BjPpcAYrpK6polE74N5wwrA98zjujUSBwQCmM+ni
         v+BaQ3D38X4NSVQ2dxXG2EgnvNpHxYNxyZo99I8ch9u6TB1boCN+4F4RynQ4uBuALD6H
         SgNjIq7UjT3b3SA7ck6K26v/lu8hHm2z7BdGoX5IXJkI++v+bUszIefNc4kzgw92OSnc
         G8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728099969; x=1728704769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FKLPp297pv4YqZ8PC1oE0NCgF9pFVYsLCW0C43Yfes=;
        b=RxjlVhGfiawgyd9o3r1QAiSgOis4+pzocG4N62/TS7IAxZluqO6bBCfoPgLyY+ABmk
         NVtVYgGV/0w7mk1SmOKdNfMCTI6VXv51XhOMRROokQg0Eq5O3BO3iygRFxwyggvqWy9y
         8ONFsfEdIcApPqGVbCh3foD4Miu7Wfz8j+Xn0uWml6MPDL/Pok91wABPPevUlhS0EiI/
         raa/I7k4MZjqTdsYHFzRZNpXDKZRy7W4ojv2JaJLIwdNC68qIBfJ4ca4sz9oZdJ2nAQ+
         fDbiwq+xFL9zd06z/V0ZM3FldTP2mm1t6oyuneY/K81+gEMAELAhbLDvIROilO0S6aV6
         iQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCUZNT1VnpaNKmm+X1wSGiPsHaQ+uXX40RIaMBXn9HtHzlUP0Ynulr8XP0bR0W6RLOxPKJEJAxEXMcnfUTbX@vger.kernel.org, AJvYcCUnAMy4OO2CXnbskSbOyyhWQUWJ/dZJyWba9zjzww8YxT7bg9pze3KAC1uMetlXnU3oWZdOTIALBnFj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3EQzAlezjO4FHlf48ZF5J+Z9sI7rlYho8qVYBE89ybI/eulBN
	dcTVc6xn0SWw/HO14UGEY9BSQqWNBqZ3F8VufSlTtKe/fMY3nC1df0DtIQJz
X-Google-Smtp-Source: AGHT+IGMOfQqhSvpYqUX6LnHIGe6u5APM9+ucwyxPTRUDfoGVhvLzLx1eOfyTjthd8fFSNQx0Fok3A==
X-Received: by 2002:a17:90b:1b05:b0:2e0:a77e:82ff with SMTP id 98e67ed59e1d1-2e1e6365024mr5684342a91.33.1728099969575;
        Fri, 04 Oct 2024 20:46:09 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b0f6467sm768721a91.45.2024.10.04.20.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 20:46:09 -0700 (PDT)
Date: Sat, 5 Oct 2024 11:46:04 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 4/5] gpiolib: simplify notifying user-space about line
 requests
Message-ID: <20241005034604.GA41715@rigel>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
 <20241004-gpio-notify-in-kernel-events-v1-4-8ac29e1df4fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-gpio-notify-in-kernel-events-v1-4-8ac29e1df4fe@linaro.org>

On Fri, Oct 04, 2024 at 04:43:25PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Instead of emitting the line state change event on request in three
> different places, just do it once, closer to the source: in
> gpiod_request_commit().
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-cdev.c | 6 ------
>  drivers/gpio/gpiolib.c      | 4 ++--
>  2 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index b0050250ac3a..f614a981253d 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -372,8 +372,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>  				goto out_free_lh;
>  		}
>
> -		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
> -
>  		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
>  			offset);

This moves the notify to before the desc->flags have been set.
So the notified will now see the flags as previously set, not what they
have been requested as.

That might be acceptible if you subsequently issue GPIO_V2_LINE_CHANGED_CONFIG
when the flags are set, but that is not done here and you explicitly don't
notify from here in patch 5 when you add notifying to gpiod_direction_output()
etc.

Cheers,
Kent.


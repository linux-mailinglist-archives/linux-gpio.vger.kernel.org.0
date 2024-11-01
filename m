Return-Path: <linux-gpio+bounces-12416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC29B8A71
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 06:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75BBE2832BD
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 05:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C661494A5;
	Fri,  1 Nov 2024 05:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmF8i98E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3530146A62;
	Fri,  1 Nov 2024 05:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439077; cv=none; b=cRo2oniJyUXIXr/BHcmF3ToqhreoyabVZpdkMxFPFIwBjTYTdXitxgyV9mDHN3/yI6ZqnzollISm+y22Mr8Cn4EksAJKRp/X+t7Z0m1Jpsh7pNeXHpgV5ahavz6IG+Ri0oXtUGgXnYZPP3a2LdLYUFuzcCz9kogIxrsjWzUyYMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439077; c=relaxed/simple;
	bh=1R7cjVao6I8ql0NBBBTl5wXcbuyim+rOFH097APa8Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxZnX/aHm+0zAfo4tUL1p5p0Mv5xZyWWcRb48IrD5KncJ+WKIqmQGgui/Jo29UDhsdNNXBsEBZk9e4AuyaKDMfXjXgaqwt7klvRG0cuUpTA90PO52MkAJ/xpNL1Nl5g4YK/snwwqaiJ/Er+EWeBetoPWljK+XWxdFLh7kWGcDnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmF8i98E; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso1319815a12.2;
        Thu, 31 Oct 2024 22:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730439075; x=1731043875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1R7cjVao6I8ql0NBBBTl5wXcbuyim+rOFH097APa8Kk=;
        b=jmF8i98EZd9imIjqNBfhVxKDgVWsydP+YI5YDvxlUiaRmmnjipX9QVtisZ+1J3NVri
         TUFUhXJBmywVqS/xYgXBif+6PQ2LZH3MYUX6qL3/F15TBAsFBr2QmJ3CRrC342V1SzU/
         V0BYMCbBVBzlPoOkRWjwuDzs5esU0OHXSh1O5lnQ/9SWKOD64Me1Eg+l1pUz25K/Wz9R
         +RjfBG2vWvQ2Uc2dNuVbLhwUuB2QQn6yp0YbYNCDe814RR3DGcKPkoD+ME/xKEMnYYk4
         OfnLAms91R9zvU+rQWVKHAjAs8iQkQUXAWk5TC7TT9JSiqGd71D5doqiJKb3C8wKjUNM
         Bl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439075; x=1731043875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1R7cjVao6I8ql0NBBBTl5wXcbuyim+rOFH097APa8Kk=;
        b=nRGwmqFinQwjmQej6GZv9Dtr+2zljidwZ6j6PCWI7FQS7Vo9WtJx/As2OliWc4snxI
         2ZPSz+7Mk5/iP2G51G1D+fcFPmwhamYsYyqpNxtoo+yIiN42WeLB09MJuqqFAk5xCYnw
         bnIhfsjdPNxn34c9QOPnZ8jbwsVdmN9AImDxjlfXoTx3JJPZg8mc4tf4kDhBC6mH1tPp
         1zsxOhoO/YoNrQIJNBQsnpPYWsE3urCQC2+T4rfhbSBCI+7rFMYV2yEsV0qqicIQe6te
         dhmxQKSBd5Ub7oQI+hCXfcdqsrY4Md2yobFe6BPJW6Wf3XZ0om/oSVmoZwt0KZz2QK0j
         27Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUiODDYuoatHkfvTdPV8rkw182zyf6SWvcY/F5X02/dhFllq76ZPV8/zBUKl1DHDXfjcR0jeDpS4vesh0lI@vger.kernel.org, AJvYcCWl+Rxb0ZE199iS+WBwQ48lmK4qvq5GaKp42t39PyPj04pnjXb8zc0YDxgdiBpnHrbhDjKyY71uxLWn@vger.kernel.org
X-Gm-Message-State: AOJu0YyjIimJSxSCN5Pw0pn0988zq4u5Xk4QjXBJtXfDxHwCDKD5BAOv
	cDwaV1yspFjhKkM1W4XxqzNaQvaedQer0KNlbicajd7UhWKF4SlSqcD6AA==
X-Google-Smtp-Source: AGHT+IE9LVPrr67www8iYBj4/+kddDr8ZeL/CvmNjVMlBOeEce9e2HyKMkPUe+LSRxmFSFyMBoe38Q==
X-Received: by 2002:a05:6a20:2d1f:b0:1d8:a13d:d6b2 with SMTP id adf61e73a8af0-1d9a83ab574mr29179958637.10.1730439074774;
        Thu, 31 Oct 2024 22:31:14 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8d02sm2022473b3a.43.2024.10.31.22.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:31:14 -0700 (PDT)
Date: Fri, 1 Nov 2024 13:31:10 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 0/5] gpio: sysfs: send character device notifications
 for sysfs class events
Message-ID: <20241101053110.GB110734@rigel>
References: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>

On Thu, Oct 31, 2024 at 09:01:50PM +0100, Bartosz Golaszewski wrote:
> This may be a total corner-case but for consistency and completeness I
> think it makes sense to also send out line state change events on actions
> triggered from the GPIO sysfs class.
>
> The first two patches use cleanup helpers in sysfs code. The next three
> change the code to emit notifications on line export (unexport is
> already handled) and active_low & edge changes.
>
> One last thing I considered was also notifying user-space whenever
> gpiochip_un/lock_as_irq() is called but that doesn't make much sense as
> it's largely independent from the GPIO core and can be called for both
> requested and available lines whenever someone requests an interrupt
> from a GPIO controller.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Looks good to me, though I'm sure there are a few places Andy would like
to tidy up the ret/error handling :).

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.


Return-Path: <linux-gpio+bounces-16814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BDFA49A2A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 14:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80EBE3B974F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CC426B960;
	Fri, 28 Feb 2025 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/cro2no"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5525E471
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747858; cv=none; b=kjCUFhvN4F4AMmwg67Ip5cuhZV4GQu0nRZZBaHrR+NW2ZUDkv8X8n/Ez7Kv/+PL++zAjQE3CJdDlL0IwKn7x6HtnrjMlvWLNW9W2gSS15ouKIIHjLjjEPZ0mHa5yDH/C94Y31Orwjm2YbgUGgHTxmXujIWkrM4FmyIpBoOKSyLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747858; c=relaxed/simple;
	bh=VhPyMoEJWSHzL635uSgBkZm3dqp5Xsq94bQLc3MM460=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxnnVmUg9hgmUj+vWa0hsn2z56Sk189jIAA8xqr1IBt9N+dFIEcB3GxO4bpdBo4k2qilFYSDy6Wp/RH7VpLPU5TtSR8NYNEwdC+bYw6mSQ930dCETik3kgbVtbNXUP0RoIB9c3NPEdLKKYUpHF/4lW+M3ntvWI9u6cJvfeO/98g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/cro2no; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abec925a135so277626566b.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 05:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740747855; x=1741352655; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=10Fkhp5xsWvMhzDZ9Hnkhm34939uK3s6cg26798CuOw=;
        b=q/cro2noUaTTqpexN6t86qhlX7eBZntO2OL3xf6hjUUA7x1l+DBXMWpcsrPX0WrKXX
         y1DZeespD+Tm8P618HqS7YwoK7162gR6V+cUnJiRCKrtHv4ZWE9KUsizpNiK488rv1Vt
         6FqTS7NSlBK0aUMGIERJ1Ur2sjunPUOdlglO/8RPUzXPDm316dtr/ccbBAF7jv2v2EcM
         3+Wk+6oBC+4hyWwP/TixxqmnIvJlvGrJttt5OIPSLEkuhhxcAdoUwhdDjED094hk7fap
         MQIjpS+9N09Qn3chD1xUrJ0yUZzqB+rXMtVTmbD/V0Q0JhYYjcPuCaTVqmtCQTawT7C+
         8doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740747855; x=1741352655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10Fkhp5xsWvMhzDZ9Hnkhm34939uK3s6cg26798CuOw=;
        b=SBENzDYts6QORk0ZBvlHMzheuNv+416UkTuNf6CuMxEpyTWtM+SB5zP3REO4gEultj
         c7026/exnWF6HXmjI2ykMIBOyT3XmibEf/RjT0zyla24OItV57lHr0mAMW9+DMQle2F7
         g/DAt4ukbEMkLt9CzcKv7YF2BltQbGOKTnQtZe8OPlQ053Mmpy9v/BKJzkQTTu28L0fD
         4Wwi1TzKyVBQztPGCZMauE9O0L7gwBtVubSAyOQ09ewBwzRnVpzhF46BkrFPG1bPnAgQ
         LHrkTVx0Tk0rV0YsJSPFKIzK/NeYkmBNfGIBMKV0sUlrpu/fRn/FUynCRFD16ntnkNWr
         d+og==
X-Forwarded-Encrypted: i=1; AJvYcCWoVrxUBbecdqTPqKNSzm16HAh3006q79vXl6ImYMg7oACEP619Ys9IDLEoc3xF4uwQB3ZhUUfGo+Zj@vger.kernel.org
X-Gm-Message-State: AOJu0YwvbEqjRrtx35bdWIMZM7x4gOivN2lXf1gVqULYDGzDmW28m4t6
	fbADBTMsslwM+Q2MDcYsJcK/KKMsWJv7e9CjPr4WfCHxivP5UEw7gCPkFG3UrdY=
X-Gm-Gg: ASbGncszST4Vh2916N3Ktyl7h9RnzFn8yC0Ih6CYQtkJtHa39hJNhtfqP3Air23pEAt
	ERYGJm4DjiKDahbcHnJ2j16y9jyy4FUGbxnok8lR1+/ik/UYdTX4gpkUig8CSftghrU1bVpa//U
	+Qb/y5Z3zgVDbqVCjnkZ2TMo/pQsw9fiG6+61YDWGKE8GHKNvKA+JnOpcwBVslU2aO4eNeqAF7K
	BfqXvK8xKIwZQhwgti3C+L+Ibz2EcBIJU8voIN29Fm9DiA+ctxnMo4CTer/hWNIrEZrWF4qN7wA
	8HXcHj+KpdoL5N5QDSbYN6QoPI2afmg=
X-Google-Smtp-Source: AGHT+IEUt1hmwix/p/NTJLkhDfTeZ90IH3mBi7jSL6LBqNJkRYtj0rKm6mJr2PdW+AYQwRFhzgJHvw==
X-Received: by 2002:a17:907:3fa7:b0:abb:b31d:778f with SMTP id a640c23a62f3a-abf25fabb6amr318360466b.20.1740747855227;
        Fri, 28 Feb 2025 05:04:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c0ba408sm286438866b.37.2025.02.28.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:04:14 -0800 (PST)
Date: Fri, 28 Feb 2025 16:04:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] [PATCH] gpiolib: Fix Oops in
 gpiod_direction_input_nonotify()
Message-ID: <084aad2a-83ae-4027-a934-797f53962256@stanley.mountain>
References: <0f3ea3f6-8ae3-4352-b790-de0642edc4a2@stanley.mountain>
 <CAMRc=MeF42NeNJ_kR7H7oJsCHt=grTtN=c-3RbjFhX=uRQ5X9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeF42NeNJ_kR7H7oJsCHt=grTtN=c-3RbjFhX=uRQ5X9w@mail.gmail.com>

On Fri, Feb 28, 2025 at 12:06:24PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 27, 2025 at 9:17 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The gpiod_direction_input_nonotify() function is supposed to return zero
> > if the direction for the pin is input.  But instead it accidentally
> > returns GPIO_LINE_DIRECTION_IN (1) which will be cast into an ERR_PTR()
> > in gpiochip_request_own_desc().  The callers dereference it and it leads
> > to a crash.
> >
> > I changed gpiod_direction_output_raw_commit() just for consistency but
> > returning GPIO_LINE_DIRECTION_OUT (0) is fine.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> This doesn't apply on top of v6.14-rc4, could you please rebase and
> resend? Thanks for the catch!

Sure, of course.

regards,
dan carpenter



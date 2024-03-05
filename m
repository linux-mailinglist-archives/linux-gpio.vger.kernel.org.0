Return-Path: <linux-gpio+bounces-4144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6DE87213E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 15:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCB961C222DE
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 14:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B201886626;
	Tue,  5 Mar 2024 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0eJx3wl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0DE85927
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709648084; cv=none; b=N1Es2IMZoU5hFAUUsK2eOUSKzPOxLijxBJg63pnaGYASgFkCOwlpALckGQKrvsku9nhjnXNVPQYcbtzfNJ3++nojaa+AluNnDu0PVnR70dEApq19QxbQMx5FIQ4XHe4cF/fxWYm+BKDTNXTjd3NtIH+hKqHrJMJsgSHn13qTqAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709648084; c=relaxed/simple;
	bh=XBErKlVVtmn1WR410Z68CcZiMCuNgjRPgN2LT0AKjLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeEkBlEQRAA7jdlNx8s5uyU4zOLo4t0O3S6xoDct6T8NmEMl2LY/t2sdQJBdIKUtb6QWtbbhVxvOmm/HeGxtqdCiGqYPQ2rjw/xiV/NPP5WbOr9XLy71E+m2Ud2PKu7RUss5FiZ1vlylAOBEggonlroz9wa81nsaGy5pV4HDzzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0eJx3wl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-412ebda8772so5947275e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 06:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709648081; x=1710252881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYgKvUYtJLorfP27PNL3Gyz0XsuBP43h1RyjWIqFg8k=;
        b=g0eJx3wlLXUJE88UoghwS+LSPA3KuRHdX0ai8BrcCxT99yFdhCecf20DaRh1KDXji6
         DCHmWOyn+Sn9UlFnItK5ZjbehQD1k53XUQm4DiJMylkw0qjetJuUclQjzh55SmhtSk8O
         cnMRsyaM1j0qXlm7M9O0sj2N3aTlMkV4hMeAi+KCgi2KCiloKGjzvlWYNb9Xy3zOgvDA
         mt31FJQbDvhoB1KKfb/+noo8Wp0WrdgcpO3d3xKDWcGw7C4fB+752S/d+WRvwqT5BULd
         OmkbxCcASL7XJ5tWbV2kw9Da2XwjJngHe4YRNQziLV28TbC8FcXJeSuwPu4j5lSRhiUQ
         +nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709648081; x=1710252881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYgKvUYtJLorfP27PNL3Gyz0XsuBP43h1RyjWIqFg8k=;
        b=Db7BH34iAXgDGuJdFaUXh0ycKqWsDidt/FkqLKfcl/RclhjHUVneNc0E/jaqJAY1TY
         dCYD7RQm8hTJYxN2vCeF/y0jh9Xq7fRWmSxG6dPk9+m0U7hINwJUrMp0Y/u66d+WpjC4
         eyDxTiv1ol7ZEdHoLACTxTKq5j7feK0tJgyvgTp9LfOe3pVJgL4wKbpUBVcvkvM5ciSi
         7TR5+dnae+0dFoV9+NB/HxZ/P3wixFKXPL2yfOGCGfz25y9ppHYG8Vw5ijzeWw7bGi7V
         /bmpnE1rhWxGmNBRaKvVJ50s1n3kDIn/lalCSyyWcpByXEnb85PwcdjKinDtm65nHcmc
         AsHA==
X-Forwarded-Encrypted: i=1; AJvYcCXiOERbuSBfuOYvyH7zB9Goy12Eb5TGLiQFZMEn4yX1fPHZakLFdnYDPA/HzVut8vg2oprEjcmyHdULHeVEGLF0gCBx0BhH+zN+8A==
X-Gm-Message-State: AOJu0YyFNB9tG0U4M4VDDeomy8YQJmJn6A5NJRZEaXjsLlN5vAW/pPYb
	kWXqXtSDcIndp8a+tWO2NV1DTiHxmeXbPnO36EWRe0qFqNLhpaTE+6zrS+MhSPo=
X-Google-Smtp-Source: AGHT+IFiZvo+2Ed36XHb4D8FEGL8RTKDKh0WAHkFjCOZayTy5yg1kPzsgjoKPmq/i8S2Mnz6IL5Vzw==
X-Received: by 2002:a05:600c:5385:b0:412:eeb0:18db with SMTP id hg5-20020a05600c538500b00412eeb018dbmr1107845wmb.2.1709648081248;
        Tue, 05 Mar 2024 06:14:41 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bt12-20020a056000080c00b0033e3a110d7fsm6645453wrb.71.2024.03.05.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 06:14:40 -0800 (PST)
Date: Tue, 5 Mar 2024 17:14:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] gpio: swnode: Don't use __free() on result of
 swnode_get_gpio_device()
Message-ID: <cbb40800-d01a-4e3b-bf36-6cfcb85b2796@moroto.mountain>
References: <20240304160320.1054811-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304160320.1054811-1-ckeepax@opensource.cirrus.com>

On Mon, Mar 04, 2024 at 04:03:20PM +0000, Charles Keepax wrote:
> swnode_get_gpio_device() can return an error pointer, however
> gpio_device_put() is not able to accept error values. Thus using
> __free() will result in dereferencing an invalid pointer.
> 

No, this code works as-is.  The gpio_device_put() won't be called
directly, it will be called by a wrapper that checks for error pointers.
The __free() stuff is defined like this:

include/linux/gpio/driver.h
   655  DEFINE_FREE(gpio_device_put, struct gpio_device *,
   656              if (!IS_ERR_OR_NULL(_T)) gpio_device_put(_T))

So it handles error pointers correctly.

regards,
dan carpenter



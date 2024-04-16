Return-Path: <linux-gpio+bounces-5573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772F8A76CB
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8DEA1C22CF4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF0E6E2A3;
	Tue, 16 Apr 2024 21:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kq9qFCiz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009496BFBB
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713302911; cv=none; b=SKLpwOu0iqdpvqtrBMQQBOrV8o6XO0DEWfq/MPwAYiuk8ZpFEQcEO2swdpx85j9cAs91sB2l0pfMquLualUYqa/FdkfolTLXPTtRdl1xdZV6megX4mO+hojbHf94KcK3PhYb1ddEuKqImAjm7wbrQQCmoi7htjaxqdqQfYY8zuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713302911; c=relaxed/simple;
	bh=rgeB5P8oe9a/ZUMAwEsRTdrrWq4mJs9/euQYtIRqzzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6r4Z6aXBqou4n4lzHwRlAyutJBdsIW+KxjYHIc89sXHpM3cjaWci7RzGnYh8U3R2QK6dcF0Ui8ygIavDcu81tt5bkYoo13PO280AvE4r9iJZI/mw8R8HMcD7p5fI86IlsYAVXdAhZhtYo/hdpiN8iutuiaw4p8WC2RJoe2DLqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kq9qFCiz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6effe9c852eso2109312b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713302909; x=1713907709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rgeB5P8oe9a/ZUMAwEsRTdrrWq4mJs9/euQYtIRqzzA=;
        b=kq9qFCizQ7M5bmOxc8TMfwIJGeu0BOZo9oODnbypt5satssgw/kCJd8rXD/XSdF1lC
         4bCb54kRCT0I4r0Qz4vWrzLsa8xnMN5XJkrVnv9a27jbGyoRQ5L/YvkmPDUVCfBEf5Jc
         KjG2Z/2YEGrTmFsGIbDNq5TNFgeBiT+gj8WOvOY4O/AqcKHLiad1XK5VXsCrRFVVzX9l
         3+QQoZjmS8+kPYycNRIjUtWZ2lYm4Q49tqeRJI/My1U75d9j3ikU8uOZCdtLpka6hx8z
         oDBmRIQFaZHUjQjKe+ZOP06dN3y9GihLsPndyw+2yugne0gFWGDXsn/62D+eEBORRbfq
         ZA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713302909; x=1713907709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgeB5P8oe9a/ZUMAwEsRTdrrWq4mJs9/euQYtIRqzzA=;
        b=SyRZ3e+cL692vvncx+EQY6AYv65ZgPJfqHla3hNRDAzMgRflRHldB86nTRF1UMqHIG
         VlZQt4vtSnAVi01Kd8sexrZTj7GrTQs7+jY4soLvi/2q2cFu98NeOH5opCwOyN5dW/M0
         /BHDf4q5iPhKWi5umEp4/8fmjNmHNOrIZ3QDbDAEE/hwgVnGt9BKWCaRqblo15mhS3Eq
         ZmszZ7/3kXO6opZOdIlZfrrv+lTJrw7r60h/WJEhEPBEEeDLKs1b9A3S1RoJJ5mNG3tw
         UHTXgYMZxB+Ug/+H1haLL/+2Zi5ynh48gGbZ68GyaQMcT7sPvR2ZNFf1i+XGtdTOYT7c
         KaxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYh9ez9bv5PQ2OYcUELTwkALW3ow8/r0wKxvStvj/UCQtUWlEJJxQRSmdZ+bHd2px1/RJCgVeFm6IVl1kMaF0IdNTqbLcvvoLkcw==
X-Gm-Message-State: AOJu0Yy44wzc741VkF+u6z2YfGqdOGEDv/3wtpChnQd4cVqQt2ds3HBE
	bjhWHXDIRQrj24XBaVxBxyE6jbgOghE3ct7dSxPTBfwo4n7Kl6Xf
X-Google-Smtp-Source: AGHT+IED+TPR4QWdx5D8fSL52YZAUCQjF1rSVNRUqcw2TVuycqcRq+JP0yLYostm7m2B2hHnvJee5Q==
X-Received: by 2002:a05:6a00:1886:b0:6ed:4f0e:76a8 with SMTP id x6-20020a056a00188600b006ed4f0e76a8mr14784097pfh.6.1713302909277;
        Tue, 16 Apr 2024 14:28:29 -0700 (PDT)
Received: from rigel (194-223-186-215.tpgi.com.au. [194.223.186.215])
        by smtp.gmail.com with ESMTPSA id x21-20020aa79195000000b006efbc365de9sm5477336pfa.121.2024.04.16.14.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:28:28 -0700 (PDT)
Date: Wed, 17 Apr 2024 05:28:23 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Grant Likely <grant.likely@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Walter Lozano <walter.lozano@collabora.com>
Subject: Re: [libgpiod][PATCH 1/2] licensing: relicense C++ bindings under
 LGPL-2.1-or-later
Message-ID: <20240416212823.GA63139@rigel>
References: <20240416212141.6683-1-brgl@bgdev.pl>
 <20240416212141.6683-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416212141.6683-2-brgl@bgdev.pl>

On Tue, Apr 16, 2024 at 11:21:40PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit ea84f882d5d3 ("licensing: relicense C++ library code under
> LGPL-3.0-or-later") changed the license of C++ bindings in order to
> solve potential issues with code generated from templates[1], default
> implementations, etc. However this change makes the bindings less
> attractive to projects that have strict licensing restrictions and avoid
> GPL-3.0 code[2].
>
> After talking to Grant Likely I decided that the best approach is to
> make the bindings available under LGPL-v2.1-or-later and simply let the
> end user decide which version's text to apply.
>
> While at it: tweak the README to also mention that examples are provided
> under GPL-2.0-or-later.
>
> Link: [1] https://www.spinics.net/lists/linux-gpio/msg46605.html
> Link: [2] https://github.com/brgl/libgpiod/issues/72
> Suggested-by: Walter Lozano <walter.lozano@collabora.com>
> Suggested-by: Grant Likely <grant.likely@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Kent Gibson <warthog618@gmail.com>


Return-Path: <linux-gpio+bounces-15486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB7A2B210
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 20:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10EBE188B52C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C66419F464;
	Thu,  6 Feb 2025 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wm4UMcH4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCEC23958C;
	Thu,  6 Feb 2025 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869409; cv=none; b=LRBg/Ww6W1EjCpLOVYD+iX0WtFO8Bjd62fMRJ5KK1ZAedH/LNetmAxTpDrLG031AwrUOsEE2OeLFJA4oV2fsE96xn+EQAQxC8Y57r6tY5Bb7J39RLaZrnArmwr60qn56ZXY38e5G7K/h5xDZhSZqFU/AaF0qpBqrgZjYyBQgUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869409; c=relaxed/simple;
	bh=oM+dvGNntOTrsnnoqCO4nuqA9d+f7sHywmyvc3SLuKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddg/zFlPBqg9vz3et5nlFUMwf1JdsKHron68SihhgUyeiZT4yRlz/WCxsD7yZo5NHwCOC2JWziOIvJjCkHXefgLS2DlWWSNewlXlL0iVValdKPyRmiQIJ8vTy6JWiJyiyWmrNbazlahDSp6VBo26NBTbbgBZv5lp/EPEijIhK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wm4UMcH4; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9d5f8a4b9so2057320a91.0;
        Thu, 06 Feb 2025 11:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738869407; x=1739474207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GCdO692bHBghPfQRGV/NUxGlZvxVvv1uNkFJcvuit2M=;
        b=Wm4UMcH4xMNxH5coaLFmBGd1EHq06NNMPNhcZaGljlXO5Fdq2SVyTkIzADQiumR6rq
         qHrhOZDk5RIFxhnzRMJcK+RiFXVAsCnxc3/00FG+dFYaGvcIPz3DIw3r/+a+htnAhC8j
         neg0434Gezx9/VyCLq9elA83Zb/Fu2sNKo8C8cSJHPGVQ3H128X+lSENxeJW51oRed3c
         Ivv4W9b/n2URoB+TkYSD/SDchAhfKKbF4OwR5sz45JHNAnKHnehYz8SlV70skmbjerSy
         P5+GUR348fN/1Lh6TjmFxfE9nlowDgPQ0f8yHqsoyctbBjscYA2u60JbCuWl9H1bj0iY
         OZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738869407; x=1739474207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCdO692bHBghPfQRGV/NUxGlZvxVvv1uNkFJcvuit2M=;
        b=k4AMssy5Vb3KkVIqRTMhQBKRpaIeoegQfyuuWW71vKjWT0h0VKyMXE+VOMEpYsQ7ve
         6JWEv2rnXjZ09NBJnt5uWFOUKkK2lw+HTaoMg4EMHdnwWhRAq68Z9Ubzre9SKTJGu/f6
         GmMxrwPApzZkqCgKSAbBnA4YjCrzghLzawAytZOTPk+LZB4XaEBcSbP+K9NqffK278MA
         iycVMyyR1OQuDX14y/N+v3BGC3yVK5MKf0Ltcg9f1q/1vDmJMvh2uZLhD1w3HN58udV3
         st4uo2VYq5cFcPwZ5ejte/ONXsurGDJABJggwfueDsMTpgC0jOKvACDtl5cWhm+O1pa+
         XL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU18SJCFbSev9MRjSFTkpWX1IXeYLZLzVXB/SofbV0ycCStlZIN2puPUc2JdvjJf6NqLDxR4mFn20Tt@vger.kernel.org, AJvYcCXiYzzyTgncGQI2oFWpI6da7mZ44VhTRzDeTcobl5YTmmG0zW5mfzQufvjUytfJZsZFD38IKQcLVbaeaG0W@vger.kernel.org
X-Gm-Message-State: AOJu0YybjULq7l1IdygVaIxLBeZVD/P1ohsKcx4SNF9sahAQX3xqu7kx
	WXerZovlq1rsH6xiJGs9uKJEeuzW7VgK2AgxsIAqaAxx2n2+CWWG
X-Gm-Gg: ASbGncszzizcJSZEYAssCN3vVjLcRvxrKasGdAQ4Kw9buycU5LnBD59BlxuwCw6Ns62
	Mn+xG+/2zV4SGtcNVh8x1hezXANNMuje2yFaov423qRCmA4llcComuBEM29UJ9SdAwlOnnSGPtJ
	Ur4fW96Lg93eWX1MB+1hhd8JObzCk9tA+npwEvCqnu/rXSIDxMfjQT2KtyVKPnCX85iV9yCbpZH
	dZNFYlgQqAppZgrpKnTaW40cSve4Ue3bvFNcgGNxy/sA8DcETByTiFxjuUxXYZSMu2fD1AZ7Fwy
	8CrlIgj99bQqvNw=
X-Google-Smtp-Source: AGHT+IGyBu8HGooogVECSDxGIUQ5Z40l4h+BQiOH7nR1Zf9Q9rLywn17YBVVdpSAMvv59KLxYaoxWQ==
X-Received: by 2002:a17:90b:38c3:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-2fa24064f31mr383637a91.14.1738869406961;
        Thu, 06 Feb 2025 11:16:46 -0800 (PST)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a1848asm1794373a91.12.2025.02.06.11.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:16:46 -0800 (PST)
Date: Thu, 6 Feb 2025 14:16:44 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/2] gpio: xilinx: Replace custom bitmap APIs
Message-ID: <Z6UKnNyf9cDVSUPF@thinkpad>
References: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
 <Z6MzExQFcIz9HlkN@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6MzExQFcIz9HlkN@smile.fi.intel.com>

On Wed, Feb 05, 2025 at 11:44:51AM +0200, Andy Shevchenko wrote:
> +Cc: Yury
> 
> On Wed, Feb 05, 2025 at 11:31:09AM +0200, Andy Shevchenko wrote:
> > Relatively recently bitmap APIs gain a few new calls which may help
> > to convert the GPIO Xilinx driver to use them and become shorter and
> > nicer. This mini-series does exactly that.
> > 
> > Changelog v2:
> > - fixed a regression in patch 2
> > 
> > Andy Shevchenko (2):
> >   gpio: xilinx: Use better bitmap APIs where appropriate
> >   gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()
> 
> Yury, just FYI, after this series, if applied, the bitmap_remap() and
> bitmap_bitremap() may be moved to the NUMA only APIs. Or i.o.w. the
> commit cde3d0f81e67 ("bitmap: Make bitmap_remap() and bitmap_bitremap()
> available to users") may be reverted.

Thanks Andy, I'll keep an eye on it.


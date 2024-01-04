Return-Path: <linux-gpio+bounces-2034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE05824347
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 15:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 884AF1F24A7C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 14:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74F5210F4;
	Thu,  4 Jan 2024 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xyj3/NhK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8412B225A2
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6d9cb95ddd1so244047b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jan 2024 06:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704377233; x=1704982033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6s08Pa2CX0Hqjhq4avMson/FGevHOGY6/7OQjf6U5M=;
        b=Xyj3/NhKy2BLbfCnmTiCmcTGxc0PEH2b3rd+Za+XiuJ2lg5u93ZSaRS4waluD2ZLJv
         43IkBpowkXQCVH8zL/lmoR075xJFwVysf8gDiHO8QHmcG9qyUKcWRa9ePAp+7fejsOEC
         eDHw6NM/KLxNAChwc2LHnnWHWUjjoJD1Hmrslz8ooqq6DhlGid90QZ3OmEh/HpIayExe
         yVNROssf0foWAY4u01bEvZvO4DzlSuQwrcE04ji1r32kGjfVUAHuwYc2ghfhDhkwCSws
         YeOJf5Mr+Mo3aM+87g7JjyeJTB/cv96hDeXxwqlux23DabFCwurmhF5+7efR0r4fT5ps
         D0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704377233; x=1704982033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6s08Pa2CX0Hqjhq4avMson/FGevHOGY6/7OQjf6U5M=;
        b=mxl2gfkRpv27hKyoYy8fGPZLH+kW6py4I/2suLxhkxdFz2Mn+pIn5ncotT7inGzxj7
         dDTg0EolX87Q39LRa6UfLg9YZoXYDJNLfGIRXGhifWRaZ3n2CzLWFfhTInSIMCRW17HL
         e2WcqGJ7Itf8K6WW5QHCMIxL6i8ShkROimOw678bophnpPFISsbKGH6r7p8Izur3K51A
         Ij4FXE0oFfDreR1rdDEVYLO3sHahnXDBb53CYpjvVvwZ2G4tk6KikY9GreAwtkK8vLoC
         vbE9JGDSGfwaLh3Ysd70QZHoa+7vnK6eDW6xYD/ykumWLAWG17+00ec2p0wwxBv4hYeH
         egpA==
X-Gm-Message-State: AOJu0YyCqqt4boBqNR/uHkJGHye561U5jETMHfz0uKpySv2axwK1E/zl
	ZTvoQmnEkRvXYqBb6GL+WoA=
X-Google-Smtp-Source: AGHT+IEHuadtl5NGIL5Ly2ZHBWQpT6L1R+e0LNoYMKELdhRdvgwxhjE/PP/AT0bNy3jI0Cr0oUhosg==
X-Received: by 2002:a17:902:7848:b0:1d4:d5bb:5d75 with SMTP id e8-20020a170902784800b001d4d5bb5d75mr503587pln.12.1704377232584;
        Thu, 04 Jan 2024 06:07:12 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id d13-20020a170903230d00b001d3fa5acf71sm25731918plh.12.2024.01.04.06.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 06:07:12 -0800 (PST)
Date: Thu, 4 Jan 2024 22:07:07 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
Subject: Re: [libgpiod][PATCH] core: remove buggy flags sanitization from
 line-config
Message-ID: <20240104140707.GA90369@rigel>
References: <20240104135058.46703-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104135058.46703-1-brgl@bgdev.pl>

On Thu, Jan 04, 2024 at 02:50:58PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We try to drop potentially set output flags from line config if edge
> detection is enabled but we use the library enum instead of the one from
> the uAPI. In any case, we should actually loudly complain if user tries
> to use the output mode with edge-detection (like we do currently) so just
> remove offending lines entirely.
>

I don't see any problem with that.
It also explains why we didn't pick it up earlier - it behaves as
expected and has no visible side effects, so this is just tidying up
dead code.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> Reported-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  lib/line-config.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/lib/line-config.c b/lib/line-config.c
> index 2749a2a..9302c1b 100644
> --- a/lib/line-config.c
> +++ b/lib/line-config.c
> @@ -381,18 +381,15 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
>  	case GPIOD_LINE_EDGE_FALLING:
>  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>  			  GPIO_V2_LINE_FLAG_INPUT);
> -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
>  		break;
>  	case GPIOD_LINE_EDGE_RISING:
>  		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
>  			  GPIO_V2_LINE_FLAG_INPUT);
> -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
>  		break;
>  	case GPIOD_LINE_EDGE_BOTH:
>  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>  			  GPIO_V2_LINE_FLAG_EDGE_RISING |
>  			  GPIO_V2_LINE_FLAG_INPUT);
> -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
>  		break;
>  	default:
>  		break;
> --
> 2.40.1
>


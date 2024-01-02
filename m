Return-Path: <linux-gpio+bounces-1964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 439288220F9
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 19:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A191F23293
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 18:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAD5156D9;
	Tue,  2 Jan 2024 18:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDus/B0Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A321F15AC1
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d9bee259c5so2197207b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 10:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704220069; x=1704824869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMm9rQ6mYdwoAAvAUrgkd3p0Xbxtfz7Hj7Nymp54eL0=;
        b=NDus/B0YHztpLVNP5L16Qh7lB8pjCCjrdNiyUmJMp4/ydN4gDYYrfIfQFQvaIPWqf4
         tqTnP5J8Sin9aJl1Up3V5mvzWy6fWEbVg8opHu3xYvh9b9p6bIBh4O1hxITOvlxilgmx
         0qNLY77LT1oZvFujehvlCie+shmyzlpJb/cx96aN87vVFkOdlH9AtpuTOItVOE4t+n/k
         hDf6WfSeiQ6wsBJV/qqBDv9LH1JcraMRVpLyfkUOD+L1kayfY2iG1WbyJX0ay0u4FXM/
         cEZPpW9fnvV53fZE2uNcuMWVl8+dwQLKs/yvoXIgDLwHgQCJ+7EpxV4s7I5N1gE+ZvWy
         JYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704220069; x=1704824869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMm9rQ6mYdwoAAvAUrgkd3p0Xbxtfz7Hj7Nymp54eL0=;
        b=LHjj8o9oTVSdHzPJLKtmnChSkq2rUHe9oi2IWF8y6JyglCycb4smq2Y+pg2wjcSJpO
         MOcjtWm/EALaRyqWk4XqQO/jVMq2hTkAciwriCWcS5iT0Xy/hDFoAzeO4Wy4f2mGoLlX
         nbaarZrsZElGXKKe8W++LPwwmpSMGuy1RXDrZkRhVYDqXXxaTcH/DgbKEQV2p/vvDEG/
         8wJZzt8nMOitT4WQJfmUAM8CkUnr7aR/VmFiIpVC1j/j4Tt8ykGIBNxdK/IeFpvlLy0w
         UycQCwMpmJPsh6+K7wo9Pgj2zO2UnisWvtEm+MslCVgWpmYUAfzGjbNpEKs0eWf4mToD
         GNVA==
X-Gm-Message-State: AOJu0YwuFdhBYBRQkGpoJXdxF9V6oaeWs10WFSrFvxaZvOP8NTpwo+ir
	b8PTZG6wd9dGIIXMmYbjpPBWflcHVII=
X-Google-Smtp-Source: AGHT+IEJwI4noU29B2g4+tMFtdfyk9TS95BzPMiTrtFQJ89vDwEg2wXtcYWqHjUluhtP8+E+KusCfQ==
X-Received: by 2002:a05:6a00:938f:b0:6d9:ae76:c612 with SMTP id ka15-20020a056a00938f00b006d9ae76c612mr8377346pfb.50.1704220068786;
        Tue, 02 Jan 2024 10:27:48 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id s189-20020a625ec6000000b006d7903784casm16766087pfb.131.2024.01.02.10.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 10:27:48 -0800 (PST)
Date: Wed, 3 Jan 2024 02:27:44 +0800
From: Kent Gibson <warthog618@gmail.com>
To: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH v2] core: fix deselection of output direction
 when edge detection is selected
Message-ID: <20240102182744.GA5195@rigel>
References: <Pine.LNX.4.64.2401021550390.16108@wormhole.robuust.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.2401021550390.16108@wormhole.robuust.nl>

On Tue, Jan 02, 2024 at 03:52:01PM +0100, J.A. Bezemer wrote:
> Fix deselection of output direction when edge detection is selected in
> make_kernel_flags(). Use correct flag to perform deselection rather than
> a library enum.
>
> For correct usage, there are no visible side-effects. The wrongly reset
> kernel flags are always zero already.
>
> For incorrect usage of edge detection combined with output direction,
> both output and input directions would have been requested from the
> kernel, causing a confusing error. Such usage will now be sanitized, as
> intended, into a working configuration with only input direction.
>
> Signed-off-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>

That works for me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> ---
>   lib/line-config.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/line-config.c b/lib/line-config.c
> index 2749a2a..9bf7734 100644
> --- a/lib/line-config.c
> +++ b/lib/line-config.c
> @@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
>   	case GPIOD_LINE_EDGE_FALLING:
>   		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>   			  GPIO_V2_LINE_FLAG_INPUT);
> -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
>   		break;
>   	case GPIOD_LINE_EDGE_RISING:
>   		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
>   			  GPIO_V2_LINE_FLAG_INPUT);
> -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
>   		break;
>   	case GPIOD_LINE_EDGE_BOTH:
>   		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>   			  GPIO_V2_LINE_FLAG_EDGE_RISING |
>   			  GPIO_V2_LINE_FLAG_INPUT);
> -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
>   		break;
>   	default:
>   		break;
> --
> 2.30.2
>


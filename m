Return-Path: <linux-gpio+bounces-1941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C882097B
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 02:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D788F1F216CD
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 01:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F428819;
	Sun, 31 Dec 2023 01:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuDGZYkE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CB27F7
	for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 01:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3dee5f534so57347035ad.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 17:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703987852; x=1704592652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahP2P8Gf1/CFQBqVTr5iwH25boasJOt7Umdu1MTr8TA=;
        b=MuDGZYkEFi229hgWrneCtUTnapmr5CswU/xxYls6aXmwXOJrsDDSly/bA4oDnTVwQg
         ihLL3RymvvBg7pB6leTkdWv7r2jua58CCpD+89uoqXT/WgQbjz3SnrR3y2kLwwJIpjY5
         Gx9uN81DGLNuubDbsjfQDnMYTQapGNHzYqTaXVRBlpCrRO/dBbbOdFCQ5QfdfQBFhGeQ
         sPmUgd4EumtXWqOgIpqOY5uhhfywNI1q2rqJDqGNjGIyaJJplxCPJTbUb9i685sbuU8w
         39GJdpTDsA2I8tPxVJj8aF0+ZIrT0ya4H/8jiTAZ6p/RYLpKR+zLMOAWHPwjwXMttNbn
         sg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703987852; x=1704592652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahP2P8Gf1/CFQBqVTr5iwH25boasJOt7Umdu1MTr8TA=;
        b=ftfsmYIKqtxQ6Bhpo6BMdqqAfSHYe4UAN9C1mvTpJFZ1vYSewO7JaoqVgYGk6UMPOj
         KUsIa2+v9ASIvTymIWCw4yx+odwnqyF91YpPGI1AElWD12NwfRgSM1oWcm2zLeScyWjQ
         ijeLz6oFfm9B1PjQ3J331iExZLXK0o5wDlZ4WqI+qOJnQpBQf7bqqOuw+CP0ACbkWHFw
         LlNdQW/oRnZ1TW8rDTKz0MYKDEt11JbDWAPX0Xrj+xY3/bikLI6JPlTh4tMNTrwDouK4
         L2Ax1o1o4DnKKRVxj6sWQ7K/tCRZraWbc0o8sDDw4qQ9ZSQQlyCU8UMcuaEwHgJOm4dM
         lApw==
X-Gm-Message-State: AOJu0YzG7rAQgpGdiChohpbq0+IF/+zjWdCydt19PYyc0qD6eWqK6kCt
	pLq9ryWlegaPyUciDPk49VPOVPVXAIs=
X-Google-Smtp-Source: AGHT+IHSFUeK5NpERqmXA5i3AeK7MPm1AfZYd+QJdHRfnKdL2nujwXHAG9Vly5ei2zOMjq2olsWdFA==
X-Received: by 2002:a17:902:efd2:b0:1d4:415:5fed with SMTP id ja18-20020a170902efd200b001d404155fedmr12982589plb.65.1703987851721;
        Sat, 30 Dec 2023 17:57:31 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id iy7-20020a170903130700b001d4b1a8a1ddsm400582plb.223.2023.12.30.17.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 17:57:31 -0800 (PST)
Date: Sun, 31 Dec 2023 09:57:27 +0800
From: Kent Gibson <warthog618@gmail.com>
To: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH] line-config.c: Fix library enum used for
 kernel flags bitfield
Message-ID: <20231231015727.GA3304@rigel>
References: <Pine.LNX.4.64.2312301347330.29540@wormhole.robuust.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.2312301347330.29540@wormhole.robuust.nl>

On Sat, Dec 30, 2023 at 01:48:53PM +0100, J.A. Bezemer wrote:
> Library enum was used to sanitize kernel flags.
>

Rephrase to make imperative and better describe what is being fixed.
e.g.

"Fix deselection of output direction when edge detection is selected in
make_kernel_flags(). Use correct flag to perform deselection rather than
a library enum."

If you do select both then the kernel will return an error when
the config is applied, so worst case outcome is a confusing errror.

> This will probably not have broken any "correct" usage: it would clear
> GPIO_V2_LINE_FLAG_USED, which is not used on setting, and
> GPIO_V2_LINE_FLAG_ACTIVE_LOW, which is set correctly later on.
>

It would be clearer to say there are no other visible side-effects, for
the reasons you list.

I'm just nitpicking the wording here - the patch itself looks good.
Well spotted.

Cheers,
Kent.

> Signed-off-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
> ---
>  lib/line-config.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/line-config.c b/lib/line-config.c
> index 2749a2a..9bf7734 100644
> --- a/lib/line-config.c
> +++ b/lib/line-config.c
> @@ -381,18 +381,18 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
>  	case GPIOD_LINE_EDGE_FALLING:
>  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>  			  GPIO_V2_LINE_FLAG_INPUT);
> -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
>  		break;
>  	case GPIOD_LINE_EDGE_RISING:
>  		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
>  			  GPIO_V2_LINE_FLAG_INPUT);
> -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
>  		break;
>  	case GPIOD_LINE_EDGE_BOTH:
>  		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>  			  GPIO_V2_LINE_FLAG_EDGE_RISING |
>  			  GPIO_V2_LINE_FLAG_INPUT);
> -		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
> +		flags &= ~GPIO_V2_LINE_FLAG_OUTPUT;
>  		break;
>  	default:
>  		break;
> --
> 2.30.2
>


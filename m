Return-Path: <linux-gpio+bounces-2018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FFC823E68
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 10:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8A4B283FC5
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 09:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965C720303;
	Thu,  4 Jan 2024 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y1NGOLhL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E55520307
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 09:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-467a7a376d5so59509137.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jan 2024 01:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704359616; x=1704964416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CL0PrSQZZVH4inukeLkNwrEZwMRmBc+n2yOANyAfZ0A=;
        b=y1NGOLhLxZxStc+zODiFVM9Qw5c3Pl8606pO+7ctbxKIfkdRrK3ckgWOxTTa6nmECZ
         FSotftxuFSGIx7zaHa8RNhoDuAOM1aGMZm5Bz9ns1TmYOWaCS5LVZ89IHo3FTEjoIqqt
         pKPDzMxuaCszaB7YNfGsI2era1FaZTwOKSBn8wEGzynWE+xOpagkVBUzpoPJ8PCD7+P5
         k75wXgEw7cc/BLCMXW6bya2qyOYmPTHzlAenBH4QknO3Jk/d9py0wGByhLVaM5QIqlth
         00skUx4XVKl0W/dCfE/YSuDuaahzCHOg+AMVS+HoeUiQYVhZVrdCV2WXX+dvoAu+/Tpf
         xU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704359616; x=1704964416;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CL0PrSQZZVH4inukeLkNwrEZwMRmBc+n2yOANyAfZ0A=;
        b=g+RRAYaQ6B6qkLIXl+Pwdz8+iqLMF8Z18y01VmcLk2XKxMXKtOcyDRecbYLEX7HVbm
         1ZAetPYlYh1iUCxglWagHEX6dXT2oNjGj80oeTSPAiLH4WbGh9Y0ZVRcW0QCYJWJgB97
         3DM9ZDF92TNirI9H8IHUCJxikOS/J4bprpBC3oagZ9CN8a467Ay2tRlO/NGADcHYNjfs
         ijxsBfOQNviJDUHuuRAQdZQ/KAKPreFZ7ARDsmlwVOYjApbbOa7WEGtE2fH/p3dVWi1S
         CqkJGqWBnF1PKR9cOOrdLvh1BJ0n5sRHofnYiQ+/OiSaevvwRlfGuCAuR8PxR++HDRx1
         C5Tw==
X-Gm-Message-State: AOJu0Yz7TSlKkoC8op5StgM5esV3GSOWt31MoJJQwPteMMdYeZMLOGLV
	nhZ6QIun0ApREz8c2TiAoATiNnib6982AEn3fLRsXyQqXPasGHtyoGr+oLuh
X-Google-Smtp-Source: AGHT+IEBkBElHgsRuwgFfyX4RSn4tGgqkosAAVD71QTeqmvChXdtXmGOd+ytDhYIUlBIxcn0KxSj+6F7L0Ry3s4aYBk=
X-Received: by 2002:a05:6102:510b:b0:467:aa5:269 with SMTP id
 bm11-20020a056102510b00b004670aa50269mr147136vsb.13.1704359616232; Thu, 04
 Jan 2024 01:13:36 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jan 2024 01:13:35 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <Pine.LNX.4.64.2401032017390.31157@wormhole.robuust.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Pine.LNX.4.64.2401032017390.31157@wormhole.robuust.nl>
Date: Thu, 4 Jan 2024 01:13:35 -0800
Message-ID: <CAMRc=MeoSzL=BbknUWFZkUD57pym+D9Ghjb9iyrgJJBUhRdXHg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 retry] core: fix deselection of output
 direction when edge detection is selected
To: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jan 2024 20:18:27 +0100, "J.A. Bezemer"
<j.a.bezemer@opensourcepartners.nl> said:
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
>
>

It doesn't seem like you ran the test suite because it breaks one of
the test cases:

**
gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
'request' should be NULL
# gpiod-test:ERROR:tests-edge-event.c:80:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
'request' should be NULL
**
gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
assertion failed (22 == errno): (22 == 0)
# gpiod-test:ERROR:tests-edge-event.c:81:_gpiod_test_func_cannot_request_lines_in_output_mode_with_edge_detection:
assertion failed (22 == errno): (22 == 0)
not ok 19 /gpiod/edge-event/cannot_request_lines_in_output_mode_with_edge_detection

Bartosz


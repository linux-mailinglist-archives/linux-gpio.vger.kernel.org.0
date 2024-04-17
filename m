Return-Path: <linux-gpio+bounces-5586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 563EF8A7D03
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 09:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C15051F21C4B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 07:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF436A8CF;
	Wed, 17 Apr 2024 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTLaZTQt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BAA69E0C
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713338638; cv=none; b=ijNLr99LBiJiEEGdkvV7S/av5SY5dWfG8d9h2JTcW+EOSbqAIIlGuk7E0ceO8pIh3hB4z5lnTjNrsn8GzUM87cbmdYpUKZQOnkSk4HtWRDgeVONnKrAnxRIiMngt3sxanz47Mt7DDx0MzqmMG4xbGJ2NkBjqM3QkwgCVk/S3qiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713338638; c=relaxed/simple;
	bh=QH9oghLaqnB9afrzmcKiQrCc3QgHdtX55Fa0VrP/wzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEHPdNMo6MJ7lYVra1M5Y7/RVWXc1159vcagr7WEkGFC63uMPHJPxRSAmo2bwLcLEPTHodUtdgJAmztAulfvBRAZoWbIflb+MqE0Vh1wk0Nq46hN1t22HMdaAFHbPBXgdAryj+7HcNPuvRQ7m9yn+xYkVcdlb/wIX2QannK7L9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTLaZTQt; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so4483380a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 00:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713338636; x=1713943436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DA5jMYR9ePniQ+HJvH5peL37wSJniQTvosQBB+hoAh4=;
        b=nTLaZTQt4zQ1M2106xUjomqLuWYDYNvCXQlXlLxCoChV38dE6lavVGsDsNFcvpVDRl
         +Ce5FaJPecuYT01IAmJTbHWtKzyoRp+vaBy8ktZS6eq8QRVZcYeZUG5TAhKTvW40ZWRd
         TwoTHMqyCL69aqSsOS3mTLJ6iMVY1RhoqGi6bIL5sX0xqhlqMKLl5vME8yTG8H/KM0zw
         3F9E2FMtru1dxvQd1XSr8V6ZZtujPvUr9f7l9cMfHIMuFRCQb/hzWFOOsFEZtN3x9u+V
         nP3lmQbVuUEMMwGuE+mfcOWPfWrnx7QYzQEkrCzqYbot9I71xCzD7gH35YEG7YOmmRMB
         MxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713338636; x=1713943436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DA5jMYR9ePniQ+HJvH5peL37wSJniQTvosQBB+hoAh4=;
        b=Xb0HSEpP1/6GgbeCUqvcpMlUTfIEfk5JWsYyhRTewnyI/VZKd2aNAYQ59dLEKgENN8
         QHDeUyqQospUBWbhJyTkGvc+/bNJGZ+Q2nPcb8KKSr8brv0MuDYHY0Z+b3ZxB201/B6L
         +zhk5/yLtVmZwXTvAmsSezMGep0iSLr5+Fu2oM5r+NH5ZG9bdWXjDtGna5Ffzw9NGk14
         D/q2gW7btglBAQOigS+D2KWhUmg22B7JVqbCTdLtyaoZ87qhBdspbIRdg4ZDeUcy18fu
         g49dkMT2mQeCsrZVsa6AA30ogXtfnifTKy4Q1F9kmvYDIYmyx6hfSZlhTJbkeKmmzvbs
         HYZA==
X-Forwarded-Encrypted: i=1; AJvYcCVmut+41sXOzTKRKzVyVpq2hqHsrVMK+wjOhaQVx4Mm4F3ChV1JmNVGMVVZKFuDiHKqmZb8/0gqgl1JSnO5R1zi5pl0/CaW2xSA0Q==
X-Gm-Message-State: AOJu0YwwCL3hL3QIFj6jWW01a1ndo2ZiDRi5+rQv3xB3ASLQB5OHUQcN
	Dgt/04t/jx39KvoaYRGLSFAajO4/xRtglpRZvktoeX4mO5y3KrzP
X-Google-Smtp-Source: AGHT+IEh7UyJQUalrC8DIo7BN04o6SXiMlK5jc41L4aNm8OgxKsJBCPLKF3V6bDdaB5Vmr/1Pc2Jpw==
X-Received: by 2002:a05:6a20:561a:b0:1a7:bc31:933b with SMTP id ir26-20020a056a20561a00b001a7bc31933bmr17032346pzc.47.1713338636227;
        Wed, 17 Apr 2024 00:23:56 -0700 (PDT)
Received: from rigel (14-202-6-107.static.tpgi.com.au. [14.202.6.107])
        by smtp.gmail.com with ESMTPSA id hg19-20020a17090b301300b0029c472ec962sm727350pjb.47.2024.04.17.00.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 00:23:55 -0700 (PDT)
Date: Wed, 17 Apr 2024 15:23:50 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Gunnar =?iso-8859-1?Q?Th=F6rnqvist?= <gunnar@igl.se>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2 2/4] tools: use ppoll() where higher timeout
 resolution makes sense
Message-ID: <20240417072350.GA120983@rigel>
References: <20240416215222.175166-1-brgl@bgdev.pl>
 <20240416215222.175166-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416215222.175166-3-brgl@bgdev.pl>

On Tue, Apr 16, 2024 at 11:52:20PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We allow timeout units to be specified in microseconds but for poll() we
> need to round them up to milliseconds. Switch to ppoll() to avoid losing
> precision.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  tools/gpiomon.c    | 12 ++++++++++--
>  tools/gpionotify.c | 12 ++++++++++--
>  2 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index 40e6ac2..728a671 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -176,7 +176,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
>  			cfg->fmt = optarg;
>  			break;
>  		case 'i':
> -			cfg->idle_timeout = parse_period_or_die(optarg) / 1000;
> +			cfg->idle_timeout = parse_period_or_die(optarg);
>  			break;
>  		case 'l':
>  			cfg->active_low = true;
> @@ -362,6 +362,7 @@ int main(int argc, char **argv)
>  	int num_lines, events_done = 0;
>  	struct gpiod_edge_event *event;
>  	struct line_resolver *resolver;
> +	struct timespec idle_timeout;
>  	struct gpiod_chip *chip;
>  	struct pollfd *pollfds;
>  	unsigned int *offsets;
> @@ -453,7 +454,14 @@ int main(int argc, char **argv)
>  	for (;;) {
>  		fflush(stdout);
>
> -		ret = poll(pollfds, resolver->num_chips, cfg.idle_timeout);
> +		if (cfg.idle_timeout > 0) {
> +			idle_timeout.tv_sec = cfg.idle_timeout / 1000000;
> +			idle_timeout.tv_nsec =
> +					(cfg.idle_timeout % 1000000) * 1000;
> +		}
> +
> +		ret = ppoll(pollfds, resolver->num_chips,
> +			    cfg.idle_timeout > 0 ? &idle_timeout : NULL, NULL);
>  		if (ret < 0)
>  			die_perror("error polling for events");
>

One minor nit - I would introduce a timespec pointer initialised to NULL
and set to point to idle_timeout within the if rather than repeat the
cfg.idle_timeout > 0 test.

But that is just personal preference, so either way,

Reviewed-by: Kent Gibson <warthog618@gmail.com>

for the series.

Cheers,
Kent.

> diff --git a/tools/gpionotify.c b/tools/gpionotify.c
> index d2aee15..962896c 100644
> --- a/tools/gpionotify.c
> +++ b/tools/gpionotify.c
> @@ -132,7 +132,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
>  			cfg->fmt = optarg;
>  			break;
>  		case 'i':
> -			cfg->idle_timeout = parse_period_or_die(optarg) / 1000;
> +			cfg->idle_timeout = parse_period_or_die(optarg);
>  			break;
>  		case 'n':
>  			cfg->events_wanted = parse_uint_or_die(optarg);
> @@ -374,6 +374,7 @@ int main(int argc, char **argv)
>  	int i, j, ret, events_done = 0, evtype;
>  	struct line_resolver *resolver;
>  	struct gpiod_info_event *event;
> +	struct timespec idle_timeout;
>  	struct gpiod_chip **chips;
>  	struct gpiod_chip *chip;
>  	struct pollfd *pollfds;
> @@ -422,7 +423,14 @@ int main(int argc, char **argv)
>  	for (;;) {
>  		fflush(stdout);
>
> -		ret = poll(pollfds, resolver->num_chips, cfg.idle_timeout);
> +		if (cfg.idle_timeout > 0) {
> +			idle_timeout.tv_sec = cfg.idle_timeout / 1000000;
> +			idle_timeout.tv_nsec =
> +					(cfg.idle_timeout % 1000000) * 1000;
> +		}
> +
> +		ret = ppoll(pollfds, resolver->num_chips,
> +			    cfg.idle_timeout > 0 ? &idle_timeout : NULL, NULL);
>  		if (ret < 0)
>  			die_perror("error polling for events");
>
> --
> 2.40.1
>


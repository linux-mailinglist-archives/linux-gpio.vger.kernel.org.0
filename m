Return-Path: <linux-gpio+bounces-9025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3801295C5FF
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2CA1C21A09
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 07:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B636137932;
	Fri, 23 Aug 2024 07:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q8MVZkYs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4077E10953
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 07:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396618; cv=none; b=FtlyTwzK6D7oga4wlW/EZFIhogXxQBf3fG+V+fR7eJBh9C+Hr+gTmHrlMnxAi6qvOMEQNFHWTHLQKqStXM6wmRMSI9HDDdnjFmnY5s6bRAmv9S0XvmGjg5fpuwECL+BUbTgiOWlS9FWN+YP5SOv9Gc3aWyfcuTJ/dHXfsHCLx84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396618; c=relaxed/simple;
	bh=ZJjEvnc2xFf03BS3XNIITQW4HsX6QFf0Qk0nXkaJIHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Edium6UemhtoEmbnXg45wDiy6ezEdoip5W/eBHoFEyVoRc5px8YkNDu4HaHh8TsdZeRZNb8flg0kzVr6neKPnS7/TicaahsXIup8dp1Kdo0iKRSEH2jGlSzBOKetP5t0f5dO6L/gfwxm6gbGxVPUOe9TZotPWFp46F/fFI+HRew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q8MVZkYs; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53343bf5eddso2155235e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724396613; x=1725001413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=631IyQQFrTSi5qSS+uAt8xZOc4toTWziEe/GEentgL4=;
        b=q8MVZkYsge2fls15BrxqKrDWVwicSZ9Rm0s5Nje7zkymQpTkbbL1d5Sx+3t4rDIxVh
         XeTzZNSitI/jN9riawzEHZS4lgVAHnbnn0QA70pFHI+YsJpor24Jz0R+mb9XZL4bjUtE
         Fk31S/9uvCUcmGFXhrTtgpS/O38rqUmv6sdU9QzYQSJvTnd74eBoSgBQEHDgL5CdOOmx
         2gRiQSoE/6COk+FXwqdlfBql8lsPQmcz9hYzLLCtQIu4Rsf7aFjRMgAEHe/rWz87CsdR
         mtNIvC1sZfFQt/yv7rEA/RyB9GhX7SdDUNQJHL/bpbJkA7+XPzz5pqe4gq83MD5u+wX3
         0jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396613; x=1725001413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=631IyQQFrTSi5qSS+uAt8xZOc4toTWziEe/GEentgL4=;
        b=N0w2UJwesSX+O4nzlghxjBLAyNUocoWqi7Nyp8NqFsXGK6m0wjq66Cdb8k6mzLQgUY
         jnQ1SwdWKRPlYyf4V5nFiudoIb2XqKEfQ714l0HH618j4GrfI8j9iqXwSlrGduiOGexO
         s9y/Gt3OpCTuc2nW8eAL1vuruMSfmtf47mnBmWT5eSEqrEEW+Ai6KlkR2niR0aCGbh38
         XqBhNeHzE5frxwADd8Gf08ZdJ594zYS77O5ZBJS6rv9ip4ev6utp0lAnYPO97+2mQVj2
         AdMl0qLTJT8NtZ8xrQU5dDnF+7ZQcKTueskMjSOeMbcwGObPKmF0OuUBudEYnq/XMKdv
         vUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZYul8XAkNps3sFLxHmg81FI4iUE1dDhZ7gIj9U6l7LlC4YdyaClqRVJoiqCzenGCvJPXKBX22u75y@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrf0UBsydOFFISItsWeKlpHjYj2KIu22bZsyB0a5005s9JcRc
	t+igSlasrEqurrdPRU6SKQbP6wg+t7fY2GxVUAxrIbgnlMGXsr0WFhGSH5i05gZ+TzBOKQEttlJ
	Cz6PGQ10m3dZAt4KKHktVwFVMR6zxIDOq1oZN90kKSiP98ceipLg=
X-Google-Smtp-Source: AGHT+IHY49T3oJIuQgQ/+y4wG4KjjwuaGjX4iUjBSV6dFDznjIAjomIHYM3UH7bhzmqjoQsvR5HkDstbYmlY4IRkH+8=
X-Received: by 2002:a05:6512:3ba3:b0:530:ad9f:8757 with SMTP id
 2adb3069b0e04-534387be3f9mr814471e87.45.1724396612600; Fri, 23 Aug 2024
 00:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
In-Reply-To: <20240823034314.62305-1-ye.zhang@rock-chips.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 23 Aug 2024 09:03:21 +0200
Message-ID: <CAMRc=MfsSXXu5uJE3FjvpTeEJEkLYwsKbiQdCO=d7L50cXREzg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: rockchip: Update the GPIO driver
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 5:45=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:
>
> GPIO driver support acpi and new version, set input direction in
> irq_request_resources, fix division error and debounce config error.
>
> Changes since v1:
> - Split commits with multiple changes into separate commits.
> - Adjust backportable fix to the forefront.
> - Modify messages of some commits.
>
> Ye Zhang (11):
>   gpio: rockchip: avoid division by zero
>   gpio: rockchip: release reference to device node
>   gpio: rockchip: resolve overflow issues
>   gpio: rockchip: resolve underflow issue
>   gpio: rockchip: fix debounce calculate
>   gpio: rockchip: Update debounce config function
>   gpio: rockchip: support 'clock-names' from dt nodes
>   gpio: rockchip: support new version gpio
>   gpio: rockchip: Set input direction when request irq
>   gpio: rockchip: support ACPI
>   gpio: rockchip: driver works without pinctrl device
>
>  drivers/gpio/gpio-rockchip.c | 297 +++++++++++++++++++++--------------
>  1 file changed, 181 insertions(+), 116 deletions(-)
>
> --
> 2.34.1
>

I think something went wrong here, the patches are not numbered like
they should.

Bart


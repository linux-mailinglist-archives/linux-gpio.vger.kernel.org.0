Return-Path: <linux-gpio+bounces-2279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B4682EC8E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 11:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03D371C22F8B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 10:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC68134C0;
	Tue, 16 Jan 2024 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNTMmcuU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F345E13AC0
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2024 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28be024282bso6333003a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2024 02:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705399720; x=1706004520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GzojpZjDTSqNj7i7RHItvAayQhZ61n/AVntAtP2XvmM=;
        b=cNTMmcuU+1VAGTjIdcIfgTfacQ2cMG+lXFz5kb1eYPV3KnmAvDQRJ6Uo/+I41G0Ahb
         bnVhtwcQ/1HaALsRnrzFYgMEcQbAKQxpVY4dvwv432zpMrTRUZtifZDxrPqyBziJw/S4
         8eJdCbaCIKYJEcBEAITr0yrr0eq8Op2RxX9qFqxSIMvedpt4vx7dpcRFyI6BgDIJIAz9
         FtKJfL2KqZkT9NwFURIM5lwa2bDKnJdTTTKzVHEepmbCvTk+y5nGMWDydR5fvfPOEGS2
         3cclNd/nVBtJIiTYIIQjgZyvh8zudIpILzLzr0BWLozVsY8L57/Nb5SM0ExQqf0VBk5z
         dU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705399720; x=1706004520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzojpZjDTSqNj7i7RHItvAayQhZ61n/AVntAtP2XvmM=;
        b=R7M/rTPCns3FoudRi92ukYagYEONrQwPLQHwyePPNvRt3U/OJdKgvF3r5W5fAinzMf
         wMj+wkodGQx0d7qNK3QZPErmd0pwaSND806EOSPLITGlavIsAJWJ/cw0qCbjpMnwHcZr
         /u7NSACVp4u16zV8BNWWv0DGz6YOycZfbJ+kJRslDEf7PYczaIKee4v4FSUANtHAbylR
         DUIHsv7nCBs5P0uoRQNl8R9wBkDmCZxauUshH/3jWFt214JqcHq0sx/TEsHU97+6VvRM
         hAe570SGoHfLoIYtjO4EDIWk5JgzVwgPd7NVTOmwMUXsQMi22n393aQzQcH131l0ra8L
         YzWQ==
X-Gm-Message-State: AOJu0YzFx9Nqali9Z5bc1+hEEPJAtO6615tB/o9KRipHTHFjA4CnL8ux
	ng6eK4/CgGXd1fWvGAk1zc8=
X-Google-Smtp-Source: AGHT+IFKCUT383TMaDaDHoOq4zsbCm2wO/ftoXm0dK2djeodEFnSCJLZH9L9MZNh561P/c0u610v2g==
X-Received: by 2002:a17:90a:c692:b0:28b:f368:9a85 with SMTP id n18-20020a17090ac69200b0028bf3689a85mr3563266pjt.92.1705399720040;
        Tue, 16 Jan 2024 02:08:40 -0800 (PST)
Received: from rigel (220-245-101-143.tpgi.com.au. [220.245.101.143])
        by smtp.gmail.com with ESMTPSA id pb6-20020a17090b3c0600b0028e823f8be4sm663053pjb.36.2024.01.16.02.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 02:08:39 -0800 (PST)
Date: Tue, 16 Jan 2024 18:08:34 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2] README: mention the Linux 5.10 requirement
 for libgpiod v2
Message-ID: <20240116100834.GA3474@rigel>
References: <20240116094057.10533-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116094057.10533-1-brgl@bgdev.pl>

On Tue, Jan 16, 2024 at 10:40:57AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Major version 2 of libgpiod requires linux kernel uAPI v2 to be available.
> This was released in Linux 5.10 so mention it in the README.
>
> Suggested-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - reword as suggested by Kent
>
>  README | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/README b/README
> index 632aab3..6063f43 100644
> --- a/README
> +++ b/README
> @@ -8,8 +8,9 @@ libgpiod
>               character device (gpiod stands for GPIO device)
>
>  Since linux 4.8 the GPIO sysfs interface is deprecated. User space should use
> -the character device instead. This library encapsulates the ioctl calls and
> -data structures behind a straightforward API.
> +the character device instead. Version 2 of libgpiod requires GPIO character
> +device uAPI v2 which was first released in linux v5.10. This library
> +encapsulates the ioctl calls and data structures behind a straightforward API.
>

Minor nit - drop the "v" in v5.10 to be consistent with other use,
including the 4.8 in the same paragraph?

Cheers,
Kent.


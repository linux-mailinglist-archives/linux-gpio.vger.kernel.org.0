Return-Path: <linux-gpio+bounces-10901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66131991E86
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 15:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFD01C20B4B
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 13:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA98177982;
	Sun,  6 Oct 2024 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avd/cuLK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51390178361;
	Sun,  6 Oct 2024 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728221381; cv=none; b=tQO9caAIRAUXroYFRODjBmz2ICVbKn8lKFbaBJ+0AZLcF/iggheolaA7lcRpYTnpUcPCIIK3mOPHZQ5VnVE91u+CC6K49+1pmkQT6HLT9adjpRHT9iF6dpfmRjHAcWfj5EqxGSgVKDnr+n5DorbeLEFXK0K6HxwnLAESvY3Gia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728221381; c=relaxed/simple;
	bh=7FxyJE6neFx1ddL6Q5v5ljGHjrY2DjV+2muoX0KWpsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Blvjh1pNeZluHpHN/k8XRzAbbs5mp8HGpKq9sraZWlXgeaN3In0qfEOwA8p5uJyD9pDRu5+rFdx1ChdiHh1O6V1+hot25SSdKXAVLfah82LMD1MLfpH/Q+0fvXi2aw1SAByI7z2c82Y8/0FJTjY4e78B7IWOgjX2tHt4bc8V59s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avd/cuLK; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7e9fdad5af8so472087a12.3;
        Sun, 06 Oct 2024 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728221379; x=1728826179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihUVHbD+SKrfNeS61DNknYwr10Pjjr3tzJg1D5gikqI=;
        b=avd/cuLKFi5dL3QcNqbvsF7aSHGHt1Gjykkc3lk5itej3iKOWwci9xxyYrSwR8O4Iw
         3vEu4HBn/h2jiKl+HVa/XZJouI9Xdm5Ob5sNvWgpsHCM5SkyRwaivAEexpPPNe7/a3eS
         qE1YxkBxdFfxTtuY4yOpNaYrNB+G1Kc307ZrScuo20EQKkuFAlbh7oBWG78/ENHPb9eb
         uvRphm1UTqx3OcZ/QOZ+B3th9peITix8B504ryrn47UaVBexpX0vKuGr3mth6wxuwsSx
         B0nxPyOn/+RhLDXG1UGIHBd3d4N9+ogQvbIk7/hKut/fKuxjPJdmyxXb5CNonKvO2UG4
         N03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728221379; x=1728826179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUVHbD+SKrfNeS61DNknYwr10Pjjr3tzJg1D5gikqI=;
        b=Y4sve7ok18vk5F8VKNGcYxWatT+J0OWXQTfW+bsVunOFIDUy/1xBcZkvNtQacCcmXb
         EN7K6g11WCmJesFPqoiqulM5CCNoVjwP+OJCzX14w6O25o+ou/ah/TG8tXm79gOMgXbG
         gKumEp//bN69+kbvItBY4nff8e8rrrZdwgVAOzFeEhYFhEqtsCJz5sIn8Zwkrunbp6o4
         x6EP4UJfsaCoCYpX/aJ6zaY9+8E9ltg35DQfuPhluy7Mi3IapKB0/61pEstU+cYpaJdQ
         USEmSrvKzRVoF2BVMyuQbnkkwOhVJq0i1XF6rJkYMZKijNNzXm1eK/4fghUxXmojT4td
         pRVg==
X-Forwarded-Encrypted: i=1; AJvYcCUAFzxoKnbTpr2IsytPyVs+1fFG9isfuU5U2N5xPCEfq0gxjC8uMIzRUmPLxmxgEvg8M2V4XnviqEqK@vger.kernel.org, AJvYcCWTsYHwPWIp4R4/1mEBav0CZOVnmitM7ASVc05t/BKeGsaYofLgCmLnhNQPVULOxIcA7J2j5zTvOQQjzZ1b@vger.kernel.org
X-Gm-Message-State: AOJu0YzhVDDTAa28b/t3xZnBU6xjMY6GsC6rqpnfcQkunTjB+HeZkSn7
	42GQZfbBMkbtQmaiGJ2YPfCQcVkCTwFOq4V5tIcvNfgRZDA+Cc7yrAQMRXZP
X-Google-Smtp-Source: AGHT+IHecfoskDkSWB7ppGbNa2r9ZkblqiPDlMLr6p/hlhNjP6ghlQ1AtdvBgbe8I1ateNr2q7XNKA==
X-Received: by 2002:a05:6a20:c89c:b0:1d6:ded8:8f33 with SMTP id adf61e73a8af0-1d6dfa46be2mr13288449637.23.1728221379475;
        Sun, 06 Oct 2024 06:29:39 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f6821c32sm3226641a12.33.2024.10.06.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 06:29:38 -0700 (PDT)
Date: Sun, 6 Oct 2024 21:29:34 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/5] gpio: notify user-space about config changes in the
 kernel
Message-ID: <20241006132934.GA179594@rigel>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>

On Fri, Oct 04, 2024 at 04:43:21PM +0200, Bartosz Golaszewski wrote:
> We currently only emit events on changed line config to user-space on
> changes made from user-space. Users have no way of getting notified
> about in-kernel changes. This series improves the situation and also
> contains a couple other related improvements.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches 1-3 look good to me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

for those three.

> ---
> Bartosz Golaszewski (5):
>       gpiolib: use v2 defines for line state change events
>       gpiolib: unify two loops initializing GPIO descriptors
>       gpio: cdev: update flags at once when reconfiguring from user-space
>       gpiolib: simplify notifying user-space about line requests
>       gpiolib: notify user-space about in-kernel line state changes
>
>  drivers/gpio/gpiolib-cdev.c |  88 +++++++++++++++++------------------
>  drivers/gpio/gpiolib.c      | 110 ++++++++++++++++++++++++++++++++++++--------
>  drivers/gpio/gpiolib.h      |   9 +++-
>  3 files changed, 141 insertions(+), 66 deletions(-)
> ---
> base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
> change-id: 20240924-gpio-notify-in-kernel-events-07cd912153e8
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>


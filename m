Return-Path: <linux-gpio+bounces-5532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19EA8A6ACE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 14:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D31EB213B9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 12:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B2712B15A;
	Tue, 16 Apr 2024 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bd2Wnhbw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6407712AACA
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270144; cv=none; b=OnvwUju9n+4q0cSxERiGFiWV7GmanG0RypBAqw2DGJAQ8CCDKsgUcPHTI8T/ywqNNywpVm2Jf8SaU10XE2wvZsq6XM9+4L2Npzq7fbfDKCiCDq87T1KB/0eMEYP2Za7I/zzIpByUc3hLVFiUo43u2cJOMqe/c4vTPMLLXMCYnGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270144; c=relaxed/simple;
	bh=DKrIFSDvPyPsC6ZdQ2dqkpMRmXsqmzOPCzV+pvng9tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LX8RPAKErbkVJdn863wzUfY3cv5KN/5NgA1sKwjXu8/lLlo6EufMm7M/kNtnVSstE/R8Fnt/FaklKDo2rrqTi1o2ix0ygOZm9xIHjIaQuYSZBixt9dlVEOYo1kzuBvTONviINjk/rmZMQX2CW0HivSExiEFy7LKpx5nhQFuAS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bd2Wnhbw; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so4315622276.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 05:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713270141; x=1713874941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKrIFSDvPyPsC6ZdQ2dqkpMRmXsqmzOPCzV+pvng9tk=;
        b=Bd2WnhbwBZKJHegchjwgDiRJVVpJeJ2ZWWuWskzQQ2rK3v/h3FE0Rk6ayC0gC+9GCJ
         ZkELgngLgtWOpRMBFNrVFJRcz3pl3BtMKa8PXCtysA7IMD3Xhy7MUSTUvwe5yfCHaeS1
         CyjyVoBn3Kros4JNMGUkyEd48F4SlOdgr97pXTj/LFr/epWiBc6O0MD5RBlGLqMZWlVl
         N4/SOHPaymkkorLQS02tcLW+UHk8VW1ZqRdbeej6k/Kv/FdOxC7cn4b5QOh7UWsG5uWJ
         PYlX2t5mYTETTHUIAUm9GwY/ym4ZCaef9FozhP9wW09z5JXmo9czYp8AsIcat4250fOK
         GgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713270141; x=1713874941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKrIFSDvPyPsC6ZdQ2dqkpMRmXsqmzOPCzV+pvng9tk=;
        b=Sr8L7S0Fz20wQjoDgF4uyFLXuqRQWH+a36LxE3HQ7vEZTKfaIrLQ4XUtJ5aH0bb0wV
         ES5u1p2RVWda35BzBcID7wxnb+c8lp4S8usYpSK1FP4nA+nXSh5ZDMFV9HY2MfBxFtGv
         J8oHqjz6xfe5RJl0HZHUrHAsHtrjz6NflLre7T12NKGGHkDr2idQvG+JQsXpVrIjRtGB
         yzwtEIhjnITi3LxhvO7Tl0bnd3jZ4DG0jwKoZMrvGEi28gHHH0zvCCp6wH7GgFcB8+TL
         hgNKEavzfXX+wiFq0+/mOK3tsZSf4ZAKiaRmVbDE+GAMn5HfyO49fqn47JyMW6Imj6Dm
         bFfg==
X-Forwarded-Encrypted: i=1; AJvYcCVptt3FM3qRMYSDIjI5PtVcKJ4Xepz0YPuANOvguEXy3qPVmXWEnSM2QsF1hyz6CPzsccmo5neXiGeDNjD0QVz//21erZ/XNpF79w==
X-Gm-Message-State: AOJu0YxXVE6ufZ08KUEkIWIEgH6sy6UAXY6fbPjN9bXo/L71iQh9qBXh
	sYhsNNteu6JFBik/thi+1y0P8PzmcKOpM4oyPx0czikN0NKnLg6SUiwPOuEdR/8J5e0hcaDZGbi
	OoCuXRZJcq8SJx8rg4IiqsqON9reJm4bQLLKmCg==
X-Google-Smtp-Source: AGHT+IH6I+79BV6weCSjyg+xHM274VtjfV8MzR1S0lXUMhI5Av+adu1GyzQ9NMJZOKWXpjT31ISM3wou5BWCwEtVdK4=
X-Received: by 2002:a25:8211:0:b0:de1:1af9:c7ea with SMTP id
 q17-20020a258211000000b00de11af9c7eamr10234568ybk.1.1713270141306; Tue, 16
 Apr 2024 05:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaXVvtt3b9rFxU4ZNShD17Bm4XU9X3h4dY501iJy3kPA@mail.gmail.com>
 <ZhlSaFWlbE6OS7om@smile.fi.intel.com> <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
In-Reply-To: <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Apr 2024 14:22:09 +0200
Message-ID: <CACRpkdZRp-DFQgb3=Ut27DHd1w11_aEY0HbLjJHob=C5Ek-dyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 9:44=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> IIUC include/dt-bindings/ headers should only be used by DT sources
> and code that parses the OF properties.

That's what I have come to understand as well.

I wonder if there is something that can be done to enforce it?

Ideally the code that parses OF properties should have to
opt in to get access to the <dt-bindings/*> namespace.

Yours,
Linus Walleij


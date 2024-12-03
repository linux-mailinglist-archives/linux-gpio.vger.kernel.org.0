Return-Path: <linux-gpio+bounces-13459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF739E27CB
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 17:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E153285BEC
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 16:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8791F8ADF;
	Tue,  3 Dec 2024 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ImoIQxh7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28C72BD1D
	for <linux-gpio@vger.kernel.org>; Tue,  3 Dec 2024 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244082; cv=none; b=axAOpZ9cq3skj4WuorTWIHURJEnvRONOtZZ9T/TVKsAvl6Th/LDv+a77GQBvu4tVKslyi1I+RcE7+fzoz/p3ZRaZICH/GU/m6mDA2Bhdke6D+4svY0qwjrqfdBgqsZN+CSSZ4/IYbf5P1p9gS4G2XDok5nbTqbTTrpUsZaa5qyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244082; c=relaxed/simple;
	bh=lYbDR2oS7Lr5SDoN1wnli3FOgTY/tUQ6zhWZKZOdyow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHquesvOhP01Z9MXP93njiPmYcPiW4iFSYln5n35Rwf+BP0Kh71YQI7bp8XNt/yVk8NHw55ohcN8eU3tP2IqaNy7cXPanjOYJ5F52xeQB4Jq72pcrNzEl3FmKO/bVmZ7xR6luIgUSHEzya8hWI0J1KuRfhaUX9jWBcSSTmDO1mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ImoIQxh7; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de880c77eso6850631e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2024 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733244079; x=1733848879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3cKcg9kF9rQPeRe4S6fxF/eadsgLyIFQpsrwW9a20M=;
        b=ImoIQxh7nUBc5zE16H6St8zh7YdwHCTuoVetX+c/ZAKvzRSCcZ9oLEKaV+SkYclt0u
         F2Hl2PyEoicz39fzpxddzAJKA5HRp5djWN2e0j7d9lzDmu+HOu4OodTHWeknppjoM9i1
         KRA1514qpqrV8kCieco0wbUIN+j07argQW2w6zUIAoa95v4q0+UJm54ouJB8phun9yMl
         AdvEFDf2ptrOKSSiXgYyfgjKLu9KQV1+rKbHKjsxyD+0Uhg0aPvlzZFr0f7O8nOZPc0w
         A+gHbB127oCihcCf0GJtNOSL+a7pUx3np7OUrIJVQ8gzlzGHoiBGcdO6Er41AlTviqFW
         FgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244079; x=1733848879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3cKcg9kF9rQPeRe4S6fxF/eadsgLyIFQpsrwW9a20M=;
        b=ZEne/W68Wnt1oJmWaSMRdEDIRVjrLjTmT6eGipcV28VxFAjg3j76xHQrcoKR5lnfuW
         eOhZGQhF2z0ICGN0toqjKpCaLVZfK/CZFa8UhVpn+wkibTAJQxBgfCEtBKIZ/8WaTz+/
         mktc4HT/J8qMDVU0oA7C4WjMx6gfvWeRjVTKreo6uR2jLkxCcNf8Ng3OIUi5AOqfT5xY
         LN7Y/Ce/3Dc5PXQgDhQ5EmPsnTT/G0yk99yaC/Xj0vMsX+TSXI+ECmKXCXGcqjL7gZPG
         GJa/QEN6EBjCd5N8VgnA+LGma8KY++DUpAFOd56WNCmrz3//ZIq1V7EK3BCSpBbbWh1a
         mWkQ==
X-Gm-Message-State: AOJu0YxVl1IPtvFDNmf4bGX/DvcSrY75Wh09ZRKlXjqtnu+XJuZk/GTY
	5uM+4RodVnshI6863tsukfHQxbOxiEapE9EpwjwKC8nKi73SDvdo/4wJVEV9y+ZD2ZYoNj1mY5J
	ONdTNoiOa2nziZAfIAtA2kHyXneC8qpqgs7IS3g==
X-Gm-Gg: ASbGncsI/jhRO+1oj53gG18lKHUzpNEAA52Dc/6X/CVftMsO27vKh6tdmfp4FI0fOdJ
	HpohVukGR+glUTm7tJD96T3XymTkTO+w=
X-Google-Smtp-Source: AGHT+IHW+vsl0mYcoay/ASPlsom23HgQ21s30uqyqy8EPOs30ZTnPyOxBXGCdO8xyntMRDTjm/dm7vKdQmuCRnMPcw4=
X-Received: by 2002:a05:6512:3a8f:b0:53d:a9a4:73c1 with SMTP id
 2adb3069b0e04-53e12a2186emr2033000e87.39.1733244078951; Tue, 03 Dec 2024
 08:41:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127184506.962756-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20241127184506.962756-1-alexander.sverdlin@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Dec 2024 17:41:07 +0100
Message-ID: <CAMRc=MeSVHjsrU6tbGwcu_TqOh_Pw-8OLRcqcdkZDpDP9n4Z4w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: omap: Silence lockdep "Invalid wait context"
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-omap@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 7:45=E2=80=AFPM A. Sverdlin
<alexander.sverdlin@siemens.com> wrote:
>
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> The problem apparetly has been known since the conversion to
> raw_spin_lock() (commit 4dbada2be460
> ("gpio: omap: use raw locks for locking")).
>
> Symptom:
>
> [ BUG: Invalid wait context ]
> 5.10.214
> -----------------------------
> swapper/1 is trying to lock:
> (enable_lock){....}-{3:3}, at: clk_enable_lock
> other info that might help us debug this:
> context-{5:5}
> 2 locks held by swapper/1:
>  #0: (&dev->mutex){....}-{4:4}, at: device_driver_attach
>  #1: (&bank->lock){....}-{2:2}, at: omap_gpio_set_config
> stack backtrace:
> CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.214
> Hardware name: Generic AM33XX (Flattened Device Tree)
> unwind_backtrace
> show_stack
> __lock_acquire
> lock_acquire.part.0
> _raw_spin_lock_irqsave
> clk_enable_lock
> clk_enable
> omap_gpio_set_config
> gpio_keys_setup_key
> gpio_keys_probe
> platform_drv_probe
> really_probe
> driver_probe_device
> device_driver_attach
> __driver_attach
> bus_for_each_dev
> bus_add_driver
> driver_register
> do_one_initcall
> do_initcalls
> kernel_init_freeable
> kernel_init
>
> Reorder clk_enable()/clk_disable() calls in a way that they always happen
> outside of raw_spin_lock'ed sections.
>
> Cc: stable@vger.kernel.org
> Fixes: 4dbada2be460 ("gpio: omap: use raw locks for locking")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v2: complete rework, I've totally missed the fact
>     clk_enable()/clk_disable() cannot avoid clk_enable_lock() even if the
>     clock is enabled; I had to extract all clk_*() calls out of
>     raw_spin_lock'ed sections
>

This looks so much worse now. :(

I refuse to believe this is the only way to fix it.

Would it be possible to wrap the logic that disables the clock
depending on the return value of omap_gpio_dbck_enable() in some
abstraction layer? Basing the behavior on the boolean return value of
a function named omap_gpio_dbck_enable() makes very little sense when
looking at it now and it will make even less a year from now.

Could we add functions like omap_gpio_dbck_clk_enable() and
omap_gpio_dbck_clk_disable() plus some state in the driver data set by
omap_gpio_dbck_enable() which would be then read by
omap_gpio_dbck_clk_disable() in order to determine whether to disable
the clock or keep it going?

Bart


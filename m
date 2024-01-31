Return-Path: <linux-gpio+bounces-2836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2610844878
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DABA286A29
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AE83FE42;
	Wed, 31 Jan 2024 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4y/x8dc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0683FE2A
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706731851; cv=none; b=gGWAK3UYgSYPLwVUy/fvZ+ojGu/qZ4qrnN8mjNOIe7tYT8oU0CZSeleXn4QCbjBNLOfRKT/6X0j0ZYPZsNfhPPBzdME68cutXdU+SdltraVeMR5Q8pfrnMNgGEQkCx1QBNLhoutf8jcQgRHImmV/L1Bgk2CcmOvtwS8AIAESiCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706731851; c=relaxed/simple;
	bh=zbht5rbF5vwft67Ip62P/qWqh70GKmzfR9gnSCxmPkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmHNo4mG1sqSco90Lzn7dY7jjoNwfTHH0JM2X8HqehiQ8IDa6e3XsR3g0Na0sRpepZTfYE5l0qOTxqFzsdHpckn0lYVoszyMD+WvZcnZwbvPpenUomPt1Ys3HO5jBeGU60u5ydLFW5daoAolOnZKTDJDuAC4qjsxYDJE8zbLttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u4y/x8dc; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6041012c81fso1855997b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706731849; x=1707336649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbht5rbF5vwft67Ip62P/qWqh70GKmzfR9gnSCxmPkQ=;
        b=u4y/x8dcGgROzaYLzS/8/AxiNOWmu4xkUI7NombK4f6U2jRDzQxQGNQeYC/jcVmrB0
         vYoeGcfKlKGc3lq9WBZBx3O55EU+RiPpj9P1NRobuZVxL5N8McvPicI3tcMZ9gLGMhvQ
         CDob0BQwXfw+D0kRBGOr9GGpU6+SPMfo3rhi2aoCicHkVANFUJ13bz8sqANyovcxNnY0
         cGqoHr/+WiwQedi20Ryp0xby2ZIxSTipjSoYJe5GsUK5avhcwYZKBJrGqhaxzT5HK5ug
         9xZF4T5lokf/B2G053ptpzfDg4+1zwiGd19iwsGjWm6FtdjObVt6reAZinTyZy5DjVGC
         KAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706731849; x=1707336649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbht5rbF5vwft67Ip62P/qWqh70GKmzfR9gnSCxmPkQ=;
        b=c7itBMukUgkKz0vHTszwYFlhO9Zg4Nv/RN4i1+xn4M/XYo2xF6j9SiqyXjnNylt6Si
         dGBxMtqFAr8huMnXtXKpZ4x8x86rhWk20FsGSvLtOmHhaxUssi7IfWGTTKk4jSkIaROP
         YIgGo8CQ7ATPanIS4lEOh0+pdlRIAsD+Jny89WbhxoWqDywruf/IeNo6A5VhTh13kn0f
         M25Itb87hPTOVg6IkyS/br8tfbeGEAW+FwWd00z7IkU/bMAibaVLb2yXmEWble+zADFF
         KipecmcCd2Ckrkr7WDnn7U2NxSVcEvViSzs7RspKVTGuPFtqsuad2hkbyBJDm/oFZG4i
         JPpg==
X-Gm-Message-State: AOJu0Yw7v56VFo0EWc7S9HbtBlyrNU7IdXmPXfK3z7lcr+bVWydJHY1C
	mfmOTEAIjiIDRIH9qLXA4mXUg5j2qXcXnFUDan8mBogcT6Lm0msPcAG5rAIKrHydD8ZXdrb124l
	hf4OsmnGR1mJPW52TcLC8mk0fqqJPvpSw/96etA==
X-Google-Smtp-Source: AGHT+IG4x4rsv2xknv/jiQVp0Dua73Me5S7piuf0s2bsHE3HvZ1Cbph3+NUYOuCP8+nCqT32PG6U+mWJWBCOQiJJ2S4=
X-Received: by 2002:a0d:ea4d:0:b0:604:666:4232 with SMTP id
 t74-20020a0dea4d000000b0060406664232mr103933ywe.16.1706731849106; Wed, 31 Jan
 2024 12:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-15-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-15-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:10:38 +0100
Message-ID: <CACRpkdb9kp-a_Su8VgBwv1bWx-cOoH1R3GP9UH=pcbntGUviMw@mail.gmail.com>
Subject: Re: [PATCH 14/22] gpio: cdev: replace gpiochip_get_desc() with gpio_device_get_desc()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpio_device_get_desc() is the safer alternative to gpiochip_get_desc().
> As we don't really need to dereference the chip pointer to retrieve the
> descriptors in character device code, let's use it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Excellent.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


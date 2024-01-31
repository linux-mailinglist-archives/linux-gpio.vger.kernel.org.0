Return-Path: <linux-gpio+bounces-2827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CD844816
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1F1F1F22445
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 19:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6B33E49D;
	Wed, 31 Jan 2024 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rq/Ybn5r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87B9F4F5
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 19:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706729778; cv=none; b=XAvX0ArT6eUJW+cgJjP/vlPPSWO3OIeDBOuW9GGMkwtHsV/2Nxwuph02l+Ug7JfAiPupDhq6qGSUN2zJ6lU53Q/jiSsW05FuRJkMFvV3kFFU47lnXeom+7oHYv4TcrkhkmDk+doCOOU8nqEcpXxSkxu/X8OtfbR0MALRTKMQ5QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706729778; c=relaxed/simple;
	bh=9Y68LgBRQij8he0Kr+gpbkEx5OCno/fS8uOwaqb+6rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfyS/QXe0K8lLyKRjfgXqAaqv0enTwLmbS7c1V3Y3GZ0DrXQw0Aa20bYgRfYt6f9FEXlTZe/p8RX2Jj9FFra+6hBRknsoJw20zKEV5TLHR+iUaiaUunvU16gKWz9rvnyegyNv/t+yTC3oCGz6r5tQ2kFLxUms48XRGuECNRuoEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rq/Ybn5r; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6c3902a98so78822276.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 11:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706729775; x=1707334575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Y68LgBRQij8he0Kr+gpbkEx5OCno/fS8uOwaqb+6rc=;
        b=rq/Ybn5rpOzVhhw4w6sfxFOFqIIrU8jqTDC2rV8/4z1mx8EaH4r8HAfN/ceKTUB305
         zK3H9iInHcK6tpTMj2WOjV5AkG1XHdZZO2m0B90SklleFFTuLdnSqGy5srkprh9IaKH6
         +yw4EdsAxO81ocU3tvtr1PfjYGicev31zVntw+9a4bFut95ziTXA2R69X4EI69mDL/Vp
         x1O0GvMGhOGWKFZmyTTdajtdQyhMbfwArAErRLEwMoT0l3QORmjfbgnI6BwmWDIiuYzx
         6E1vPdfZAQSZ3UtRILpuRGVwVJ/o5KbUWzMvN3j3Jeh6gfVw37Cn9KcpOBUxNvbHCKrr
         dvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706729775; x=1707334575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Y68LgBRQij8he0Kr+gpbkEx5OCno/fS8uOwaqb+6rc=;
        b=WXzEgfPuww9yWKaVKbzAmPwBJ4QueS2o8ipDGFv/9wU9hJUO90Evfjnegi3spYtTMN
         K7JNKkXkfOS+edH2hQb5NvjYRMjEi/mFFrVhSX/uj3eP72wnidFM7Nc7bxTmgAgr6y3i
         b60XcqduvFB2EQ9FY7wwIvljd1SeoT/9ayyFlzgu3zUonn99cOtmYw+Vt9CnblQCFv6g
         Gy7KaiK/AQPFS+XfgaIhETSEPSwaqjVV1yE2Gk+nzwDTgGM+ivMWZstDlc4r+MIq4BOD
         KmGRYmdNLoZ1ELnPRbOc49NG9xBG4+r9ZR4JZDmeIHxjsxcUk+774B69BZQKXqIyR/cr
         SnGQ==
X-Gm-Message-State: AOJu0YzPl2PXp/o3Bl/v9WMpdMA9W1N+JJ2TdSGmM9KlErHKoWI4690i
	Q21yn9IovswDK7hNpx+ICJiUFHR4O+fGu+Fxufh0KIkM4DyxBuQpJ65LEW6bixRvNpkr0UTtKto
	9uX4H+RWtSFoT0/io1A3f+sAZxyV/HeuudK0X5Q==
X-Google-Smtp-Source: AGHT+IHE9TnEUafFu48/cKz0DQ06AiMUyK9YHNzl+2qoDTexZhmLbBYSZv7t0knybEVl+LL4ULHQZNX3/170BWIfjgk=
X-Received: by 2002:a25:c50b:0:b0:dc6:4a88:bd2e with SMTP id
 v11-20020a25c50b000000b00dc64a88bd2emr65585ybe.45.1706729773921; Wed, 31 Jan
 2024 11:36:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-5-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-5-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 20:36:02 +0100
Message-ID: <CACRpkdZuGQ=9S=COdJRfaqzaC9ieGE8go7E7dcXfWX1XJdL_Rg@mail.gmail.com>
Subject: Re: [PATCH 04/22] gpio: provide and use gpiod_get_label()
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
> We will soon serialize access to the descriptor label using SRCU. The
> write-side of the protection will require calling synchronize_srcu()
> which must not be called from atomic context. We have two irq helpers:
> gpiochip_lock_as_irq() and gpiochip_unlock_as_irq() that set the label
> if the GPIO is not requested but is being used as interrupt. They are
> called with a spinlock held from the interrupt subsystem.
>
> They must not do it if we are to use SRCU so instead let's move the
> special corner case to a dedicated getter.
>
> First: let's implement and use the getter where it's applicable.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

After seeing the clever trick in the next patch I realized why
you do this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


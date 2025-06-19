Return-Path: <linux-gpio+bounces-21883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD2AE08DF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 16:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B51C18833F7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 14:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF2C220F24;
	Thu, 19 Jun 2025 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xdfldzVm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5887717E0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343675; cv=none; b=UP4gHe8/RWHjBDkQyn9XVcELy7tP6irYxjSRdwybg+ecElbpaMsP8pxhYrShuFVI4WmBfSfWQcWz3b3s7RSz3zHzfBtL+DhPQVU/aDYCRauXnP3fvQSTmgeQuPXI1n29WcMMAlyMbXr6S6p1HeLaIq77vhWBUwWigM6vFyTeDpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343675; c=relaxed/simple;
	bh=npDsCsbC8yB4lDdI+t7kw9s48Aia79Vp0ui0m6EisQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jb8N5wCDddqZPUNWraagAxZfUbiwfvl1ZCRI261HlMBlEoxZ5Own52jKOhPC6Aa03/JDKcPTx+AEaWBwyIt9Dh9m4yvzHXSOIcsWPmHwR3byDYNmSP1nKWGPe9YcK6u+uS0UaQRi0B9A5rr3FKwNH0c16R897uXnoGYWawp4Vc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xdfldzVm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553d52cb80dso942693e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750343671; x=1750948471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npDsCsbC8yB4lDdI+t7kw9s48Aia79Vp0ui0m6EisQ0=;
        b=xdfldzVmsXsxV8SZVe6rDFWUuEhC9WEZjIOKl5aeole6QtnyWcJUJcuqL4DomesFUH
         exgezVW6d9v1DR8X9nkBC2ZzJ0DdJsUCbgwTtml6wl0IZjdnUx3hL52oSTHrLeElznOk
         McxFkcGl225hcHNXcb4pvBHQN/komGXsrFsW6/I7TB3y1qjOmoWJtbGlrFyh97TAkoAw
         36PxV41Px8SlaNiWoSh2+U6ZpBp+OdZJwtkzkKfpZM+GHwoaqjfOWXLv9DLszl1n4hVw
         EVKJhw9u5ADo0rfJ3vYwQQhPUQ7K3Shy78Ep5MKf28WH/1wz/ksL3kKjzWwq3XjAt0kV
         emfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343671; x=1750948471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npDsCsbC8yB4lDdI+t7kw9s48Aia79Vp0ui0m6EisQ0=;
        b=hh5pGLSu5uGS9RiROwnhBm0GRv/97L66S48UK1MGOpSw7g8DZ6Ozpuc8CZTx0Go1YC
         LM7ncOu1etUCr11dVneoLdfmwy493lJDfS5XF8cbxuFC0x8HSVxBI9H+y2xiRGRq+98d
         X1yeN3s6I37hbc5/63H94ig1r6F+eDuk5bZ/FfpjblXOXR+mmeIKMObsDjkU+7s6lTUp
         hL1EOXa/fOgz5fbNYOfxbIoUXLU+9NpZ7JuSNpSrwepEuxqYlwiAqeWJGdg6wo2hhmYK
         VdGfiuQ/dRxGYuS6CwS2ggwPULSX9pcYMjgtBWXBkb85QHV3OLyRmq1HLncgYeiKjzce
         SX+A==
X-Gm-Message-State: AOJu0Yy5ZTaTZJCYmnV+2JXg+43hA3EKEGaSjknNjyP3XU5lZI0It+Tz
	3ODBpZCMamT/YvdionbbAUBQZYFgHVXNXJz7PsMno2uurUJG1qb/A4DFNZ7BHxuL9pS5JnsgNUK
	ycD4sTiY5nmzJWmZDYRClJll4bU9oG0cUYBHbRMgGkw==
X-Gm-Gg: ASbGncv9/MC/s2H2jmqDW4Tc5q8kfyCj/4mwi0WvZI2BP9KuFQlLoabZxMtFvkiLiAG
	BSLcZiCkonvip6PgDnOY901E3p1fsG4UQDtmySRMliVIwPCLAeLG6z5QnK16vod35IhSupHWEYE
	swP+Du3+5AnrvKy+Q/YQ01NkeH6UfRZY/7NAIGvm3CpgIp/obj8mswQRSwKwheYE32Lr4Cv4qrf
	ek=
X-Google-Smtp-Source: AGHT+IGTg4fC3jUJFCbywRZz/VrLdnK1jrWH+Rcuacnc6SmvAw8kjD4XHlxnLFwvrsW49l4uIWj+tyHjhyD2bODyADw=
X-Received: by 2002:a05:6512:3090:b0:553:cc61:170d with SMTP id
 2adb3069b0e04-553d97f06f4mr1085732e87.21.1750343670809; Thu, 19 Jun 2025
 07:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-9-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-9-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 16:34:19 +0200
X-Gm-Features: AX0GCFubK_DwyskV-8MDyKBHZbV9NQDViI1V1zsdGePHy5OXUt193JhwAEyCNeE
Message-ID: <CAMRc=MembHffEuLYhg6-GN9fRA2Sk5WUCsZdLOTKNtdJYqPkRw@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] gpio: reg: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Ah dang it, this is still not enough as there are users under
arch/arm/ that scoop out the gpio_chip and call its set_multiple()
callback directly. Next week, I'll just apply other patches from that
series and resend this one corrected separately.

Bartosz


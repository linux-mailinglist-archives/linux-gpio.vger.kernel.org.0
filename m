Return-Path: <linux-gpio+bounces-2560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FF83BD58
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 10:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34B41B2D873
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 09:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081AE1BF2B;
	Thu, 25 Jan 2024 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EO4lUot8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301D31CA84
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706174940; cv=none; b=N0eseTyeE+eAtYWlaCJLKeAlvKcHUopO3tMzU/FpW1qLS4HHrpEaBLOlm8sozPwRvhsYoA099IA1zaBwbbbmEw2wwL9IQO0YRuwhK6t669AoqTj5yHWYUQLKfIDX9i0dvmJ6gopOIZVbNTs8GX0obKh29xXlqfqO5BR56Mqu3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706174940; c=relaxed/simple;
	bh=Czou+Fc09Tc9zXH0osqCab6GeZhYtdc1i9VY6/QvHgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EePCR8tgYxkxrgxAutWvOPFCgOb/sni8Joy02udzZqKtEROwAuqJn96deghVuBnjG3e3ILUM+ZFJj6IacSsbgV+H26VUQ2bHZCzLQWI9Sgxc9PDdPtroKU7sTMpsKlTzqvpLbUYTbwMT89QZw4trkryYY9FU/ljmwU8xHUmB0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EO4lUot8; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-46b1a355f5bso46875137.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 01:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706174938; x=1706779738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Czou+Fc09Tc9zXH0osqCab6GeZhYtdc1i9VY6/QvHgU=;
        b=EO4lUot8LR7hgPhWJYLxHCjBv8kbKrmGEL9z8122OztI2VoIlcXC80zxo+KWHk1wco
         BtZVXt+fyruJQHOHpva4ZjcZCnpYR4o0QO7F/1ge2HmuPai+Sr2gcvUc3q0U+/oYeiY/
         bBG7GsXLHnUyxWZ7OBn9ubY30eoMcw8stn/Z9JlF9dUzqt6oYq5T9yAIIPFc4BD0XltD
         3NRRaiUPAI9iNW/Se7qH9ajoORJM9XNxb1z7o5bRNQgadfwdExQByHpphgo8W89uvotH
         bhzgFCDrkDZHe3PBqEf2feMvr2d8/stKCh9sZ8YnfXs/a3AsKWOd0+a8veVmTqIKQKmT
         ydCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706174938; x=1706779738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Czou+Fc09Tc9zXH0osqCab6GeZhYtdc1i9VY6/QvHgU=;
        b=j0JcwQVUXuSHvP3uIeoVNJZJLygEaDbiJCfB0/MqSH/CpZBhweRZywXpFTVpcd+qsd
         NTLtKvEK7+Wpnoam2N+AXROfZygl8dPdwX5WE9Ng++ytHYDZl4RSY2nF+XdqgebIPias
         /Llk6BcdXN+65/51JHIRw1tkgXVNRhvin9iv0lz8bDKG7Scv13EJrzFRX3iu/Lo/yEvl
         7OEbovvWxNyk9x9BCgvckFxxGS9Cvt97XfpdAqGJsuvd1+w0t84nojNE+KvrvZfg7XDv
         GqW3mqVbMqfqHZJ1hKLfuUANYX65akwdkyEKTIXPni0RTkgvGFOaimLPX0A+fP7AWOE/
         3Tig==
X-Gm-Message-State: AOJu0YweuZr33LRHpb9D6OSVE0VNLxWTLTOTTaZs9PzTglJYuhLA91yO
	4iN7PEUJ662PshZOGtY13eIykmkyiV92quDxHaNVJk6yCyOfBJqThxuGX6cKnkVNhjoR3YdxtV9
	gLq30zgVZIcMpqF59XMq6h8jIRRg8l6VuAK9DEQ==
X-Google-Smtp-Source: AGHT+IHWAK75KO7eUDVgQBY7634AqsxBL1EjuJMZm7NIdfKFtDNBo90CuaLYi3Ma2HadkTIgwjVGLskQhMUPcf+OjRY=
X-Received: by 2002:a67:c413:0:b0:46b:528:d5e1 with SMTP id
 c19-20020a67c413000000b0046b0528d5e1mr258950vsk.8.1706174938055; Thu, 25 Jan
 2024 01:28:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125081601.118051-1-krzysztof.kozlowski@linaro.org>
 <20240125081601.118051-3-krzysztof.kozlowski@linaro.org> <CAMRc=MfYg5MgndDZtrAaScmtjXm4-AX6y1np7V3p4ngBKZG-pw@mail.gmail.com>
 <0039e8e3-bfb7-43af-ab04-53aeaa02f4b0@linaro.org>
In-Reply-To: <0039e8e3-bfb7-43af-ab04-53aeaa02f4b0@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Jan 2024 10:28:46 +0100
Message-ID: <CAMRc=MdXRm5UGu3abXXwtGhw5TG7NC0O5w6_X_RoZRH_C6YgdA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpiolib: add gpio_device_get_label() stub for !GPIOLIB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Peter Rosin <peda@axentia.se>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, kernel test robot <lkp@intel.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 10:14=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/01/2024 10:04, Bartosz Golaszewski wrote:
> > On Thu, Jan 25, 2024 at 9:16=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> Add empty stub of gpio_device_get_label() when GPIOLIB is not enabled.
> >>
> >> Cc: <stable@vger.kernel.org>
> >> Fixes: d1f7728259ef ("gpiolib: provide gpio_device_get_label()")
> >> Suggested-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >>
> >> Reset framework will need it:
> >> https://lore.kernel.org/oe-kbuild-all/202401250958.YksQmnWj-lkp@intel.=
com/
> >
> > And I suppose you'll want an immutable branch for that?
>
> I guess that's the question to Philipp, but other way could be an Ack.
>

I prefer it to go through my tree in case of conflicts as I have a big
refactor coming up. I'll give it a day or two on the list and set up a
tag for Philipp.

Bartosz

> Best regards,
> Krzysztof
>


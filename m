Return-Path: <linux-gpio+bounces-20370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D619FABE697
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 23:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D423E1BC0B0F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 22:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F6D25E455;
	Tue, 20 May 2025 21:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMklSYU+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C08256C9D
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778381; cv=none; b=bhpYyJW3xbZqsAqsQQsxPUH1+0alhLQZ+lVTl4yO+bNhm0s5396gjCGfxXmaMlUjh9C35uZzSvSsz6Cj/WslkNpG+6Z8pgUqnO1ZPiM7xJgAv2e12QXXkNwHwDZEZ3U7ik6PZgg/IFS3IH0W8jTE27lMJ2cnPHA0bNPemq9E8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778381; c=relaxed/simple;
	bh=Au849YRg0UNQ2jFTEcsVof5ccrqnHtmMmWVENNxHxOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtj4SW9UxpSCR/TOSTSJrkkeBrVlzNXSTMwZdA5rp1nVrPXFe09va2QE0hv89jVaH65Q/CHOIGTnHoCPZehUQNF20aP9lC9khbjdt4j1HB+X0YQezUmWCgfF6TzOMLLAwHFtGyp+EyK07z2rvlidfO6h71pn9HmngYd0LzGgMuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMklSYU+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3105ef2a071so70892521fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 14:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778378; x=1748383178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au849YRg0UNQ2jFTEcsVof5ccrqnHtmMmWVENNxHxOA=;
        b=PMklSYU+SdpefuYScwvk0mkH+kq8I+hrR122L7eiOKgfx3pMfYwEnqMYFdRguOv1j0
         DQYjpqtqIzYfAhWBdud4VmIo/03lPVxjCEFPmC0gyCIlFx9WzkTkDD6XYmo77zKFrIYd
         t1P8uyfNxpggkwNxwr1J96KTbYdyTrCX8zsGKgXhdL1m3I14+ZS2cQa6CF1PX6BQ4CjK
         MmcByXmfuHe/P+wuQiitDVmQp+kItbscfyCbWrgLnkoAWYI1BobNFPIV/4UuLyFVyxaY
         HSlO3tQhUXWWNTJA5eeyEbxasekevDgVbmWtqQmo13ysraY6yw1F0zgR77N20luE4gf+
         F6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778378; x=1748383178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au849YRg0UNQ2jFTEcsVof5ccrqnHtmMmWVENNxHxOA=;
        b=BkT4geEBQqz7Dxx9UlqUjN/riZDn+mGUmGDIR6+NQdPH/mMK85jrI5sB1xIut50tFa
         gpfTPqY7GjOZKIiaLt6/qZd1paOF2OKVKvDeE06BZvgyDyMmPz/EqZ5wKtKiKwEXEd3J
         eOfstllcEBNxZAwf7PF4O6DMh+g5ktG/kBF++gsDWqFfCbdxvetdes75tvB71+u0MuTm
         2BcZxnhjfaJfFaDlyoyFd5/CRotbvZwemyPiBIgm7vQH+OXohSIOfwwCcv4z0S0bdTQt
         nm7kLDO2wbZ8avZU1hjKyLhrYvcugQufTcyvLR8zni9UnEWf+4tQYxDvPbFoyogbODTf
         S8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNH7S6s8Chxaa9aBjZJjobTrn1WnXbYngZEwXq4rOfblScXj+X3WCTBJ8FKQlUQfTMa3M8H4RTRg8A@vger.kernel.org
X-Gm-Message-State: AOJu0YzaFaMGUVUjMYywC4OxwBVWIcFgKrqgQIRbjCFPmn8K/wdfV09a
	2XsjRaR387KzMUy1XxLZeQqY29zVkvAyQ7lTKEg/s4b7jerssKuQ2FbIjlLr1wB9b53fWXi77Qu
	RciQr3VgIeHYV2sie5wNJIYTKE4yQGxZCWxb+rxb94A==
X-Gm-Gg: ASbGnct2/RyV4jckuPrqqoHYfhXneD+QcsPOoizYXZi+4CM3xT4rq/rIzODhzEi2UGL
	4++9qe/zAfLTNP35Hq0F9zkYxr0i7j5wB7QCLIA7fKPERxHNGE8iz4WBzARlNjrewT9+J9ZmAzY
	ygognunMG9FeilvBD/Wl3Aa+i4KwxfT6E6
X-Google-Smtp-Source: AGHT+IFGXmpd1II9RIoiTiuwNTr9SMDNaNasXEYSEeoFi+itIQs1c9py8jq9kh9xbrkCL4KgUzEy+knAlJTnnihOYdM=
X-Received: by 2002:a05:651c:550:b0:329:168e:1c95 with SMTP id
 38308e7fff4ca-329169d611fmr43691811fa.33.1747778378199; Tue, 20 May 2025
 14:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org> <20250519-gpio-irq-kconfig-fixes-v1-1-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-1-fe6ba1c6116d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:59:27 +0200
X-Gm-Features: AX0GCFtNM9CIgVAC4sc2ZtRZc7sbjM3GrbDrSYWYg3sk65dU3IzkaI8NC4Q0PFc
Message-ID: <CACRpkdbwU0NvwfQTm0+pbsreF0FBk4ubbwnyeYmZxxpfBpGyNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: pxa: select GPIOLIB_IRQCHIP
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=3Dy. Add the missing Kconfig select.
>
> Fixes: 20117cf426b6 ("gpio: pxa: Make irq_chip immutable")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505181429.mzyIatOU-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


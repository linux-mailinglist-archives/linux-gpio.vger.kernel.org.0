Return-Path: <linux-gpio+bounces-18187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1CA79C68
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 08:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F5F33AE607
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 06:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D66224B05;
	Thu,  3 Apr 2025 06:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c1MRolHC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D97081A
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663503; cv=none; b=elLWg9T21q+QwA5+pSYAnSz0wC8v76yxjODD60g8crCBk64wggHt2OegDVxI4pO+DSQp165PYRiJcQHhEk6htEca9DS89zZ8tYqBKwmaX8v0luBtv1BpPLBu3xN/sM+QVyvljbz1cA1CD3FsVecUyVzbDZEERioa6oqqI4rk3z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663503; c=relaxed/simple;
	bh=Svo2A8r3Jmqe67aCC/m/jUEWnRUioDCWZy6BQcePGqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slqrH3N7a7FicKqi7QVnpM3ndWFfKO3BICTUWVaUmWWlLEhXpIGc4UJffZpFI/VvTljIWLAi2vtH2M77xJMxPqPBpPeweG20SolvnA96FexiVCsfIhosXxAGdtgmy877HQLAG5k7r8RK4LWX8fLKadn2AftA7ip3UucFrnXPbGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c1MRolHC; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54addb5a139so648454e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Apr 2025 23:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743663500; x=1744268300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Svo2A8r3Jmqe67aCC/m/jUEWnRUioDCWZy6BQcePGqc=;
        b=c1MRolHCkXuOGSVAHUxTg78gC07kViyVVItHl7S+oVF/YmMvrAiZq5kzc+eYzCh/ss
         fyVHS61Jx7XwuBVrCGAQo27pvff5XVPvA6OgMr5Ljikk1RN330kj1hArU1SFXAUQgUI4
         dmpm895WJztnRjsqnTSWK2rkkE+yYLjMqtJSKazzYNBTm8Wsggclc4Xwd1ov+bAPvo59
         2XUjqHROUoxoGB2T5TWcmMAkGzyP4apNjl/LZDSWWXBbDnKqq/bTM7uCwYqNwBa8/VYG
         UcullmcPridACFJjyxGjJ1yqcNqprBe/ajt9Pvj+uAQd0zJWRhfMZ2xvSjhC/2txn/du
         GvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743663500; x=1744268300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Svo2A8r3Jmqe67aCC/m/jUEWnRUioDCWZy6BQcePGqc=;
        b=B3VTUt1EeuS3YowIJQ8IFMClWtJbmDgZG2hJrJ5HNVjvf8zues0EuvsAJ7uYMakijn
         wxFsDie7JGsQNquNYYYeYSfOM/9vtlilNedsrRUS6N/ntIjwCtX+LjWp9qYB16zVGcAx
         L7Y3xAgWdN08HeJ57LFNeAeMv20VA0E+TbTooCpt+2x7iuCea5PhthwnBY/Hhvj+I7fN
         Q/j9m9pOs4vjGO1QIThUEf2PTAU8TvLncKNkljFWvBJ4/iqtRB2q+UkD0mrMn4Kv+DCN
         UNNcl6IXGI7Av3WVG333uQrG2lffYhUt8+1PqOcMoznj4og/CV1nspv4Wbl99Uwgksy0
         AVKA==
X-Forwarded-Encrypted: i=1; AJvYcCVDWrDlluP+5ajBVfQkNdtxm07AfSlleNcQbVJcOWpNxcNjeEa2N01VS6AK+bGdoT+sqsg0oklCbF1w@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvgdEiMmoq77fEj1SF8FrXBL2jiEPowTw4MIhxVDuR4u0sEn7
	dI4sOukucwgApy2Z2z42N9lW+ZyygfkxDDOTQrFRid4dXlYiaf4cdHCcLEfEJ3Ps/D3GA6F+ZFb
	Cqdr4Wha50ZtJNo2RzPmnhIPusvEGoXk/Vc1KEg==
X-Gm-Gg: ASbGncsZ3vN5KR7E9LNQ0LQHKczwN4L2mhmsD7WXBwT2qQSQowHi6NWIWvzdJTxZiNY
	lWCkIQ+6F7Gussp1D5SfBqtx4vzOBDVcu/4bhQBeyCvqpxmb+uw1atW1+NjQNZEFHVjNwpXm7nk
	LKVhudngHUSIbQ+CJyGu25YNu3Ht/4cGeQvNawenbdKIhBHTwtzNX2RObw
X-Google-Smtp-Source: AGHT+IF7DQnLd2yHx8gCZKrzHn8zuC05BwBHsqp2Ajhws62+Hn5j+meHkLxz/EwnU3MjqUNm4hitHhMdcHo8xpr3WCI=
X-Received: by 2002:a05:6512:33d3:b0:549:b0f3:43a1 with SMTP id
 2adb3069b0e04-54c1d8b0d5bmr432688e87.30.1743663499972; Wed, 02 Apr 2025
 23:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 08:58:09 +0200
X-Gm-Features: AQ5f1Jo3r-FtyKUu_Mjqi8jTXLCPKanSLeSOFmvxvJrLriGpTe_MF2mRs_QHx44
Message-ID: <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> When non-optional GPIO is requested and failed, the variable that holds
> the (invalid) descriptor can contain an error pointer. However, gpiod_put=
()
> ignores that fact and tries to cleanup never requested descriptor.
> Make sure gpiod_put() ignores that as well.
>
> While at it, do the same for the gpiod_put_array().
>
> Note, it arguable needs to be present in the stubs as those are usually
> called when CONFIG_GPIOLIB=3Dn and GPIOs are requested using gpiod_get_op=
tional()
> or similar APIs.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

I'm not a fan of this. Silently ignoring NULL makes sense in the
context of _optional() calls where we want to do nothing on GPIOs that
aren't there. But this encourages people to get sloppy and just ignore
error pointers returned from gpiod_get()? Also: all other calls error
out on IS_ERR(desc) so why would we make it an exception? If anything,
the broadcom SPI driver this is about should store the return value of
gpiod_get() in a local variable, check it and then assign NULL to the
actual descriptor stored in the driver data.

We return errors for a reason, I don't like the idea of just ignoring
them in gpiod_put().

Bartosz


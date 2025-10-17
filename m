Return-Path: <linux-gpio+bounces-27239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F9EBE728E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 10:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67C8A4E462D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 08:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DE4284883;
	Fri, 17 Oct 2025 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Kw8bQLFb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F161283FE5
	for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760689632; cv=none; b=YzcLfi3GgVGMJMtyGsRpqlTM8fd4cq5Sw0rAzuQs/bKplwXWQvzwCoRnGMQYVyEyecIZ6QQaW0nkdTxd/rNTqZ1uw6CxD4em4L+wPEADxcYubMl3tdPyj52al65BZKCmlZFcgX2r17ca+s/WpgUHNVQVKnUX+Oxcu8+JYuFIDWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760689632; c=relaxed/simple;
	bh=p0fkPR07R3AjfCc+3PqgoNjeMw3Dpbanig7t2u2fafM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYmUuJ3huftuQOivYXzwBDc1wWj8e8yy8/GfYlyHNKoo6+ISqVRiHY9ejQ54121V/PKrgsHrjrrJY9jHZQwbKbIIhXyD1yFlcdVnhidpnViIneGHu9uF6Untfra+soQW64V8eOLA7cY+FerpHFGeoMYO9VeanQq3/VgCfpifP40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Kw8bQLFb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59054fc6a45so1962781e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760689628; x=1761294428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15+cvikOEb/N+bxSV8FiJMWqJU144Pr8Ahk8t+ghMq4=;
        b=Kw8bQLFbwdI6GT9TTZC3waIBDVhOGFYg8ApAv+uObPhivdrN6hgAbKy8nhNwBDlXVV
         65VbCWJKYWxxpBRbqVMIJBSgZs+VOtB/hCf9u+rDKqUFCJgzO0zIXDTNYZOW1rQFgTAD
         dGzDZyLqTa7GwNh6FYgSzumFUtdfULSVljFARuApDrxOiGcW5VoAzouLQpi/WIn4ADp2
         o36uqtDJbuPg5q9oVFMeSsEZ9UU7PuGiGv2LuZDeCziVM7Q1731RtEfV2XeH+ZoZDM48
         QZtzgthv0LL5S9gSJqgtalS6rF8YBzDl8DZKBRM8DVnHaEy6yseeAsErYIxQDHYQVrzz
         x2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760689628; x=1761294428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15+cvikOEb/N+bxSV8FiJMWqJU144Pr8Ahk8t+ghMq4=;
        b=aX+BaKbj87Qwc/8s0MTb+04Zc3Qdmpe+JxNhK/FpbKvv575h6BvVEOQPf0LLzVHHDO
         sneI6FuJAULJ6sI2pbv9IRzbG+ipCQkE7qJYEQzc7he63WW5UiEb8KEEAbf8YuwdwNHu
         MBQaKWvz0pTOsBfaHKr2lAQAhUlWwwqIGzNcIczPRZ3M3vL4N1t0kgn8myUivyCvQicj
         DTcJErlC714UEf4AeEpTW3ZJNrvMf1vf5McqIHzVdTR6Nx659vs9Lnoiq+hGBtWTiDL8
         AnDw+VVqtKc+w5QZdtEo5iu5baJyPCnwnZAzM7PmjiPhXcVCq5qGb1xW8cxPiCsqnJBf
         piWg==
X-Forwarded-Encrypted: i=1; AJvYcCUS1ysg52lYbv14kox8su7CcG6/BklbvWPTi3w5fu8EmvRZjuck6kfyP+iuEat7U7b2jnm5/t4WHuZJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh4bzMhN8wqcvsqHhmgTHWPGaZTEIbMEWvl1SarrMDG4avtD1C
	Y1xjF3SMAyTCz0H1W/RCccrdXBt0QA4rTyi5hpc/8/kBUXlG7h5BeBGobKziQLJx+qyZ3YaT+Sr
	QF3nUt2ZCHxQ2h0NBu8xJ4nwu8p2LV4PMXEFX+rsrfQ==
X-Gm-Gg: ASbGncuN6jiSG1ChzGL36xNdSCTEML7F2IYALiELdyrSWJMaGW7vzRUyofXuZievkGU
	R8DjTa0Q1m4LN6R3CGh9vxpHG0aOEVnAIdFF0ZZY+an1zY4ZgV1+2x8ZGGhLoakDvuLggdOsNdX
	J+KDUv4V35MbV4gNK1VwD1qoGkNMh1CHk/uLOKzTSjZ56yKf/EWtjpt1P9r+DAQPnZOgyIE0TwR
	+ilUvSzHYRCCXI9Wv2UtFrqKYTUB5onnksLiMPYFLDUTXVmWQEdJ8rQj0f+Soy4Y+V77/e/ayoA
	YK3cyzh2SRKnNQD5A49Q1OmEiC2Mf1s0QiLyUw==
X-Google-Smtp-Source: AGHT+IFwBncw2Alu/QrgMDtxyBQtfNfh1dxGwzHw2WYd6BMmIRW7GTYerndPtj3BFzplWGL9rnd33K0LzXn6GGDseB0=
X-Received: by 2002:a05:6512:131f:b0:58b:151:bc0f with SMTP id
 2adb3069b0e04-591d85aa254mr1018570e87.54.1760689628553; Fri, 17 Oct 2025
 01:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
In-Reply-To: <20251017-fix-gpio-idio-16-regmap-v1-0-a7c71080f740@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Oct 2025 10:26:55 +0200
X-Gm-Features: AS18NWAvJs_3O-y2cqSEZ1ia1pDDJUTRQDnpYtzwKwzQdQqAvSOQieJIv9e3Y7M
Message-ID: <CAMRc=Md0iMkYtLZseccidLvhacsRRM4CXhL48Y1O2Ri-ZTeK9g@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: idio-16: Fix regmap initialization errors
To: William Breathitt Gray <wbg@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 2:58=E2=80=AFAM William Breathitt Gray <wbg@kernel.=
org> wrote:
>
> The migration of IDIO-16 GPIO drivers to the regmap API resulted in some
> regressions to the gpio-104-idio-16, gpio-pci-idio-16, and gpio-idio-16
> modules. Specifically, the 104-idio-16 and pci-idio-16 GPIO drivers
> utilize regmap caching and thus must set max_register for their
> regmap_config, while gpio-idio-16 requires fixed_direction_output to
> represent the fixed direction of the IDIO-16 GPIO lines. Fixes for these
> regressions are provided by this series.
>
> Link: https://lore.kernel.org/r/cover.1680618405.git.william.gray@linaro.=
org
> Link: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nuta=
nix.com
> Signed-off-by: William Breathitt Gray <wbg@kernel.org>
> ---
> William Breathitt Gray (3):
>       gpio: 104-idio-16: Define maximum valid register address offset
>       gpio: pci-idio-16: Define maximum valid register address offset
>       gpio: idio-16: Define fixed direction of the GPIO lines
>
>  drivers/gpio/gpio-104-idio-16.c | 1 +
>  drivers/gpio/gpio-idio-16.c     | 5 +++++
>  drivers/gpio/gpio-pci-idio-16.c | 1 +
>  3 files changed, 7 insertions(+)
> ---
> base-commit: eba11116f39533d2e38cc5898014f2c95f32d23a
> change-id: 20251017-fix-gpio-idio-16-regmap-1282cdc56a19
>
> Best regards,
> --
> William Breathitt Gray <wbg@kernel.org>
>
>

Please use get_maintainer.pl or b4 --auto-to-cc. This is the address
I'm using for reviews.

Bartosz


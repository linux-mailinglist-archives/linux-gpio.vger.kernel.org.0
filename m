Return-Path: <linux-gpio+bounces-12995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 499129C8553
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 09:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8BA61F21F4E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 08:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E036F1F7578;
	Thu, 14 Nov 2024 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3Rv73PHd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8C51632DE
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574505; cv=none; b=TW1MEPfSRUDOufko6uIah4aqCLYCWlqCLjjeYEOY1C7EKVb+8p4bns91a5zzJztTwftYAJZHcG1xhvUCZ73Q5O9PYMPYXltUGP+k7CitLEQT4bc9C2ZwcVjKFq4RLqAMjFWCuJSLqxOVvybu0CbOd5nSAws/HpUKxHMCG02khPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574505; c=relaxed/simple;
	bh=BRDf8b35P49ChHiIo8YMyiWPE3Z2iHuLyTWB6FjvoME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DycO5rs8zxIrLbirBNhvQ6dEoZ1ANMsBa2JAn0wTUpldRipOiuPq0ub3anqa4YW2EqIDICe53+ykJbyNz0rxaRYyk6NRYTvC2QS3juqdK/UCxuc32W/c++6UosVJAn3gdhQVcYAOpMljxy1p1Av53VvscC1nuYwzHYShaRu4UW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3Rv73PHd; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53d8c08cfc4so258474e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 00:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731574501; x=1732179301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkBbJj7BfW/fDhpfQZIe1WHT5ksVj7BqqExH4/PtpYc=;
        b=3Rv73PHddv7S6psDMYskID8qeJyje0pQKX2wctynh3B8Yo1NmbKqmYs2zJNS0MyyT8
         jN5KFKi28Gd/gCExK+VRpiiTz7JF+2B4C1mY+AbPKAL9oCvDrhQV1sfsYrAzr4asYFOz
         aMc/WTYgjEyEQEkejEnkkpfyHS4+sYBsvGuIbSITudaw7nmq4cUMsKst0qn2itKp8I1J
         1ApCunBZQLSHyqBkKa6hTYwoGwO4/0eNeeI7wevFnQjH+nxxBMZm1lhfzWkgsdG1oyHA
         unV1d1w6zaLC2h0jltnrZgFdaDnI3hrm/Nmyv6E0b9+gtKSgM5ums/njWgTEtP2H60FF
         F8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574501; x=1732179301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkBbJj7BfW/fDhpfQZIe1WHT5ksVj7BqqExH4/PtpYc=;
        b=RbFt+GZyklQohENKBoVMP64+s7OA2/YY37jk0WdG541rwjTqF6KcJHyunNVTu05juP
         JHjrIlKnNo3VUQfwE/9sshrAyr3tCwj0qu2+UQEaiMCVnuMNVRTtjTzzv4u+WENw+jEg
         fhJQJLc5CQKFFFEax4RV+bN0atl+2NezLrGX9u7ofALcXeAW/aLKTwtKTe4cmKhynwUt
         ydTqoZhfCbpQJv6nsPzMuKguQ3jPKfVRhZNkqiEIvAqICr8jFMciYaApIYc4z7ofW1PJ
         KCIp9mLh+sTOLDaUgUkCVh970cBh5wiWaFbnPhvTErcm/jP7lGBXSvZmbR9wwBJgKZja
         mbDg==
X-Forwarded-Encrypted: i=1; AJvYcCWX33zoEfownxkznHFM1cJIhOO3jDnf7lyce44XAfndb2UCAoA4DMdl+MNLucW1TrsUbaWRs8Be//Ta@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6B0f8oHzXkdcMlszyUfxYgLQZA2ox8JVmBbAE55goAHpyZCCi
	J7wOPAs7zXhHIXJkhGSz0vkuh/VzxGdb6GV18RZ517IY6p3O3Vc5c/+gNn5nZ9ewvkmn4tn34vz
	LFVX0ixYBPv08enL+Jy73ar2mncYghakLMGJUHw==
X-Google-Smtp-Source: AGHT+IEwpPlGd9At63I8RuNf1kkhMFb10NwI+VOwJnq285RAFgNn8X4mjEzNpCGwUQ/oRBfOHJM0GvNfmlY1uctn4MU=
X-Received: by 2002:ac2:483b:0:b0:53d:a882:c2b1 with SMTP id
 2adb3069b0e04-53da882c2b4mr257744e87.26.1731574501347; Thu, 14 Nov 2024
 00:55:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Nov 2024 09:54:50 +0100
Message-ID: <CAMRc=MeaDjhxAwmTcNZ+oHniFn4EWVEmfP8MdNWitmD+Rr=scA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Move and sort Kconfig entries as suggested
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 6:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The Kconfig under drivers/gpio has a specific comment
>
>   put drivers in the right section, in alphabetical order
>
> but in time some of the entries fell unordered there.
> Put an order again.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
Could you elaborate on why you're moving drivers between categories?
For instance: you moved Intel LJCA to USB drivers and I'm sure you
have a reason for it (it's not clear if this actually is a USB driver,
it's not registered as such) but please expand on it in the commit
message.

Bart


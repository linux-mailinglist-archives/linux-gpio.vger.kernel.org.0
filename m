Return-Path: <linux-gpio+bounces-25903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA95B51837
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 15:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5F2188E0A6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 13:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F30218592;
	Wed, 10 Sep 2025 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DPKPpw/T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F3D31D382
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511978; cv=none; b=VcZTKbtcdfkBRIIuO5ox3Eq6GZN6sjfLu4mB3/NuS3ZRgvQEj1SwKk/uYl55UDFfNB0entCB6EwAS4Fx7foycnSi5P82pJl/WKc3/7v+Qzet789kbFP8Iw14NxK0HJJisXwP+JOM67rFHIWFzV6UB+cfDpYRH9dmrBU5Bdn9ZRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511978; c=relaxed/simple;
	bh=jckwo4DzWJoSXQynmvCEPazuqxT9RAb0hM2+LiiTOlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhmNQug+DYgbtKMmacZ3tR+TaKxI7JD1njBFf6s0w/D9j4aTDexnjd7GI07RecgV19kWmWwsB/tXnG8MTm3gdBi8x5Q3bCEfTpmys18CGb1Lh6rcT/8u2dDC1gHY6ExfON7eYXvTrqVEH4Ht/kKVh+o1LZ+F3DvaFRcYDxKO6sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DPKPpw/T; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f98e7782bso905780e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757511975; x=1758116775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jckwo4DzWJoSXQynmvCEPazuqxT9RAb0hM2+LiiTOlE=;
        b=DPKPpw/T4+1ANv37rWNGiwrv4mFDUEF/kI/qHHC2eqsjaKEjAlw1yJGaEhQy7ZiRk7
         Z7vqbcwsdWgQM1a5fj0+wn9zqtl5EyszM/LLqa8sjicgWdje51UDtTSypvOreG9pEl5a
         LYdNniilkUIptAhota1wpcwcGIUjQTU/Tvp0lCkjJFeD7a82imhh2aNhgLsK4WxdyWNA
         qvByQHSxyGbZ7vUTDu/dYSeoUji4mv1dF11p7CBO99N3fNPkDgYp/MI+5rfNLtcq1Lmv
         TiipLz6MkYpvRLqSWRMhylc47q+0svyBdoZzM016bPhJA46cWaVkqLZOxp6kqOmxqBC0
         KOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511975; x=1758116775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jckwo4DzWJoSXQynmvCEPazuqxT9RAb0hM2+LiiTOlE=;
        b=ipwM681nTr9qa4XTar96qXy6hsGg4aKS3zmAx92+H7Q4djdpy7r6yARZmhboy0dP0o
         e0YyqGUJ+QGaQd+NDrMQrXnNt950ZLuf3fOyOfEetS5osQAOZ9aF0foEgYmmqSM4p5CI
         Wf8XMpS7v8lUs4SRw1oBgtylWZwd1KyhDNHJpgO/BtQrZD6wAXasCYugCV4Er+7Uu1b+
         Eg1CjA5N1lfvxk0U/KSyxaLA7NRrAKOcgexTQv/OdPkyFftazF4wQ3VEqbho2QUAyMAM
         NkrMvnzPf7BcKswQHl0s2prErK77B+CPzcQ31K+IbSitvpUzEmCP5kZZdl0DgIE2/iJd
         n6rA==
X-Forwarded-Encrypted: i=1; AJvYcCV6xbkQB2BtwfHfh9PMkUaIpU/1PPlFfqAKfbCykuJSeq/WSzSdib8FxleFOW+uCzuIpo5lcMeq34Bb@vger.kernel.org
X-Gm-Message-State: AOJu0YyLmY1ArtA/AMYty3V7g13ruVFs7Xo9YeNTi7y1U73fclwNMP11
	z7ElNHm7d0RZKRs8pSWfQeosYKDF3CnJwHLOwYS5Z24qgMePBpBLeYsMX3e+H0HVoAyvpvYbcHZ
	nciFjFmv8oI+F6P3GAYJkL6LVcusKAXaV8bxh/odq1Ccg4MUrNf+/mpxUnQ==
X-Gm-Gg: ASbGnctZeYX6b6y5vyAFi/scJZyAiWtOncDXxNJeRrgueZXLmTy+5l2DGM6JbZxzaKH
	qEahPFD+8+bEW1LPqsx/xkw2KHzu0ArjCOP/z+75XGZ9wy7FaQwW/6RzElDHy1xSPslsj6/iMnq
	rzg7HS6jlfSy20JgR2VKG77yKizP05xKQhRzVYCpq0VJ7ukbkQ0NyCrPPsqh/0fISzF7eD9ROxi
	7m6ERhj1LMP2X+QU9IOFaEEKelHf/oTC2mFemo=
X-Google-Smtp-Source: AGHT+IFgj2ppHdy6zATwu9/GkdKc4tc5zX1z5/CmlY1l1JQXLE6h9ZkRqOvbziFLq6eYgZNZaXGJJCpLLoi+L5GfeRk=
X-Received: by 2002:a05:6512:1195:b0:55f:3c0b:9ca9 with SMTP id
 2adb3069b0e04-56273118a03mr5943244e87.1.1757511975363; Wed, 10 Sep 2025
 06:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu> <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu> <CAMRc=McBdJ16RYvJM_R7pL+u3zcs_+A0nj5_5twP7KxWhW6VDw@mail.gmail.com>
 <aMF9QFIvXC5kI_9J@ada.csh.rit.edu>
In-Reply-To: <aMF9QFIvXC5kI_9J@ada.csh.rit.edu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:46:03 +0200
X-Gm-Features: Ac12FXw_b4dB1oBOSKat4kUqj6UH_gOF4z0OMCLiQ9S83rqNOEKPvjJcoe2D9qs
Message-ID: <CAMRc=MfSOTTBv3spbyiedpMifMyfmTkpmbvuDuKcbs5S1B+Esg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 3:29=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> w=
rote:
>
> On Wed, Sep 10, 2025 at 03:15:46PM +0200, Bartosz Golaszewski wrote:
> > I cannot really give you much feedback because this patch should be
> > first split into smaller chunks that explain what each change is
> > doing. As it is: it's so complex, I simply don't understand it and
> > don't have enough time to try and decipher it. Please try to make it
> > into a series of smaller patches.
>
> Got it. That's why I offered to break it up.
>
> Here's the order I did the work in:
> 1. Add quirk support + brik quirk
> 2. Label format (Only a few lines, could go into 1 or 3 if preferred)
> 3. RCU stuff
>
> Is this a reasonable order for the series? This would be the easiest
> way for me to do it given what I have in git.
>
> In a perfect world, I would like to have had:
>
> 1. RCU stuff (These are effectively bugfixes)

If these are bugfixes that should be backported to stable then they
should indeed come first.

FYI: Maybe consider also adding lock guards for rcu read locks if you're at=
 it?

Bart

> 2. Label stuff
> 3. Quirks
> 4. Brik quirk (possibly squashed into 3)
>
> Let me know what you think... Thank you!


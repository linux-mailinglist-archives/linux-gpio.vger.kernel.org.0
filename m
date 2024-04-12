Return-Path: <linux-gpio+bounces-5440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9628E8A365F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 21:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C66A91C21347
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 19:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73437150997;
	Fri, 12 Apr 2024 19:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pnVaRNS1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA4814F9FD
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 19:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712950174; cv=none; b=hmzeWkXqMGhZMPy4rdtvKJ/PRyIHjpLAbFGaMkEtqe7RugugnE0PE1qI7YxveENAuHsksZzZ3sXsa1ruCIDzlUTXsZXdR1ltdloFrPQwh9mIKWNsDKOuIu1lXyJ6921E7chZpZ8iPd+rjPVG0mhg4dxsx5eGGdmqXQDob4z8mQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712950174; c=relaxed/simple;
	bh=dMU3YTqYEj6Pq0v0+vb73IdcglOkFpGJFmjvvfyr1GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBrKziHalK1VvUsN0Vf0uyAvCNXrWQ6Da8dStOxcSUwbn9Nlw38ZkTtYi3UK06Bybj8OWF1JMG3XZ0cFZ4XbhT5FM/RHgkSkFtaCewmtXtciTgXl6UzJcHwfJZgEhRjpB0b60ubhjF1vqySICgUaH5eT2Wl9tBaq8o1zLYJ/POM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pnVaRNS1; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2da0f8f7b24so7624071fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712950170; x=1713554970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMU3YTqYEj6Pq0v0+vb73IdcglOkFpGJFmjvvfyr1GM=;
        b=pnVaRNS1SIhV6qcMvXag+Ts1k+LJs1E1TkQHB6wDhvW/HnYkCnXjgO5br3fjDwzAgz
         04yet4YmlPsb03hSaGAB6ogU5sVvu156av8irkeszqCK5VLM77s1/B+KtzI0IRro/yxi
         Y0uS34W7RhgJb8nDRPFPSbavEz43RhNkfACjQHDrU0kJAxba0ysSGQZuZpsbnCFJA/IY
         P61fFVM2DiaUkb5piD+EjJOmxPJzMSvOXqsiVvDRNyvqWU8eJxu2iW1kmJTtwmSsybaW
         tSQok7e1uvX1vBhifiyhGtYkHHh+Av1DO+cAACcxkU4NcJEuyhECU54IVMi36uZRQSGq
         OVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712950170; x=1713554970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMU3YTqYEj6Pq0v0+vb73IdcglOkFpGJFmjvvfyr1GM=;
        b=G21dCfKXO4EItq5I0PpXnAef9+AHdqwp7SCILc9ndgLYH1alIDLKzcYaRFr6UBveJC
         aEkMmXSjJhUVwmlN5mt4+L9Mh8HXP8BREP/e7V8lxrYPiA59do1kwShXuXLcygCKAKDm
         Fh9qmZuO8T50LmRfCBYjVMLChraBSePXSq6EruvDyESj2fTv66WKd83spA7nTrIC2/yf
         Q1zif6LPDX0dZptVcc4UyccVqi3GL1iFfrnC6DLEScBh84KwxaoBXgnq1rgHtRGA0YtR
         yhBVSv72f2O3ZWjqM0tjc2xR7AREnlld1/8ZrV8qQBsHLylLbX1Ks8SAe4qwGYojnWHU
         RiTw==
X-Gm-Message-State: AOJu0Yx9lrVwQG2J185gMHKoCQALwSIYf43ztUlOrs//Q5/bm+JlFRPo
	fVxayqNLs9+QMtbxrufsOwW6hlo7rCf6+vVV5EAqC2nTGv5WBdGDfg5mfH7fjGUUuqCEZbX70PY
	hzSOyex4cZqNU3rfJ3wydDqwOUMixd3Lnk/3idA==
X-Google-Smtp-Source: AGHT+IFPPr7frvWajQHGbkpxINHZewvW3o7jH7+UGGjVYe6zp1bkg8rR8QuGlvgmrYeG+47sm5i6VRjBLlopWWTUIBw=
X-Received: by 2002:a2e:a70e:0:b0:2d8:cea3:85e7 with SMTP id
 s14-20020a2ea70e000000b002d8cea385e7mr1073208lje.12.1712950170486; Fri, 12
 Apr 2024 12:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408233201.419893-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240408233201.419893-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Apr 2024 21:29:19 +0200
Message-ID: <CAMRc=MfnAYFPtk-pwtd496c-qry0aQs1NJCkTEQ+jLF+JGyxNQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Replace leading TABs by
 spaces in the code blocks
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 1:32=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The code blocks are indented with two spaces, if the leading TAB
> is occurred the syntax highlighting might be broken in some editors.
> To prevent that unify all code blocks by using spaces instead of
> leading TAB(s).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart


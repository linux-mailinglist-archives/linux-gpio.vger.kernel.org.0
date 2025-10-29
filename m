Return-Path: <linux-gpio+bounces-27821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC09EC1A7CE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1615F1A608D4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FD535773A;
	Wed, 29 Oct 2025 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F87I/2HK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234063587A6
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741431; cv=none; b=Skojn1I+xX9xtY/RRYe1aw3/lYcB/+GGZ6wMMv+4tGgVxOUQ7TDbOzRS8B4PamTHFRhb71eEj8OO4Tt16YOadeiYrBL1OTEXm/O5SxVS982cCLycQKRqt8aTq9e/4/BAd16rhvw7GMFWGUpLZbEq+OAig12Eu/sWBARJyTLVjQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741431; c=relaxed/simple;
	bh=ni2P6AAAIna0hjFuAO82zYVMn0J7WfuU6b6IJiF1kKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXRXVjb9knIiiGpwOFnaQJSi4rNtNFLJs+DEvr+eZyg99H5CX731tChip56QMT2gTUZueGlTCbyF0DCQoQfvCv87Zpe0ffOjai1Vpp0CTAwPeaLhNeIBRZzEe6Jz8Pl0clcMpaKF15fToHdaUsHFZw0vFT+HIArwd71CZy9hsvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F87I/2HK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-591ea9ccfc2so1455828e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761741427; x=1762346227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7av6/+8iNuXmmgvTwlUka4Y7XmkOmuVd9YoxH52DeM=;
        b=F87I/2HK8EHJQ7q4NQauRZSN2gkF3Pa6uWaxKT5wFbnJ02O9XJM9CVQa76aAk0TSaF
         76edmu0GN4qf8O7hLOGmgl2m1E/wZWlSCbCwBKWravWbrzWOVNd2Wqlt7J+Ua6qOxZxV
         Vo25gJ6FNxMMGcNYpCsgsF/Dew11WFweBBQN5b/PSxkUJYaDWPJMhjW8sS4ajHDy6GUk
         UcOdOSnXu53Sjp2FtHMI3QAxxu+nHioY2KQfxl0H50DDrK7277Tkwx4zmGEf+2VqRYAC
         XTokfkhjUfDrPSSnkP3OTTs8R08HxGteHAfjxqZNthOIwQp4OQb3FHhc2UN/G9S0PpM9
         LdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741427; x=1762346227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7av6/+8iNuXmmgvTwlUka4Y7XmkOmuVd9YoxH52DeM=;
        b=un7UmgDh5iVBAuwV3sMUXdXM8pDDwzrDyiRcFjV5joeTP/e/+/i9owBrw7Qm9ANSu/
         sS5c3e32IRZzK4VMKMy5XomA+BUSGYDcsf0h5pO598RuDT2S/jsEFRU2QWqZalR2ubXV
         pZ/V+/+2LgYUdP9AVhlSKWYWdMFccLrdgzRfffxlNLxDEgGFNVFK6GpSHsAwXIT3EHb1
         dAyie5LYWusfJuIilGFn0xblZ8cgbHdaQOuZTSjMwpCLvFO+SnnPGNUSBpiVVBp1v4Xo
         SvHWJF03lqE4ciGWeYjlJ9U+2bQmhdvCm7s1s03Kf5sQnqblEGACF2BoIRgo6iCoX73E
         klEw==
X-Forwarded-Encrypted: i=1; AJvYcCWBhip4RERk6eLbOI3SfSQoNrPRbS6gSyEzLKcy41WVJ1gjf9fER5v9/TI0yrN4/XI4NBTpAvi231zO@vger.kernel.org
X-Gm-Message-State: AOJu0YxlLjJESxydlD3LPIIpwVTSboEkAcUxVp+938CTE2v6L8Ny0Pjd
	Y+yT0IlOJmEuE7klyFEBtamOVUE5xtYlaYF3MexVFHitgHsAB6sVf1ctM+4QqIsixM1PGokbx28
	fONJySwV3q9u1eO+5j3LkBrnyctKnT/spSBZP5w54Cg==
X-Gm-Gg: ASbGnct09ax9cxH+78qo3Y5DoSbvq9u0UJAFe5XH8gj9QC3ORVBr6haz8dv4GEdAQlb
	i4dUtQZeUxkgILPY979Ru7fmoQu/AscHFiLdqwKGsB76j0pgZil4tD2T5pTgybQu9l0gOlNFeHZ
	894KBRHNSMAgRjeZDvSgjwxe9yW2whEfgOinJnnYX95yESME6dQzpAmDTFkb2/S373NL4D8krCx
	CTE1S1CBgoO98Daa1maRJACuXkznoJItNu4z8mpZ8Yi5IQxV9Go26+Br0n0ePel7gd4LXZSGUV+
	TewwaKSSDccDKBs4eTz0N2qkpHs=
X-Google-Smtp-Source: AGHT+IEUmGu04036ormM4pltNB2Am321w2VXbEnKTAs3EJCIFCtIkYSiyRchfH1o5wZ/LZR6U90hsv4wZnUUYh2RdrI=
X-Received: by 2002:a05:6512:31d5:b0:591:c763:78e5 with SMTP id
 2adb3069b0e04-5930ee00135mr2032537e87.23.1761741427164; Wed, 29 Oct 2025
 05:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-1-71c568acf47c@linaro.org> <aQH9gE_fB119CW3l@smile.fi.intel.com>
In-Reply-To: <aQH9gE_fB119CW3l@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:36:55 +0100
X-Gm-Features: AWmQ_blmOzETrnBiOxNQNAG3OMw6fz-E4Nx4SOD4Wgu8a41SpvuD7mJ9RHyBeG8
Message-ID: <CAMRc=MdKfXJx-cxNr1uOCkifD6YVE2t5w4hkuYy7jcnidiid2Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] string: provide strends()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 12:20:37PM +0100, Bartosz Golaszewski wrote:
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > +/**
> > + * strends - Check if a string ends with another string.
> > + * @str - NULL-terminated string to check against @suffix
> > + * @suffix - NULL-terminated string defining the suffix to look for in=
 @str
> > + *
> > + * Returns:
> > + * True if @str ends with @suffix. False in all other cases.
> > + */
> > +static inline bool strends(const char *str, const char *suffix)
> > +{
> > +     unsigned int str_len =3D strlen(str), suffix_len =3D strlen(suffi=
x);
> > +
> > +     if (str_len < suffix_len)
> > +             return false;
> > +
> > +     return !(strcmp(str + str_len - suffix_len, suffix));
> > +}
>
> Can you rather re-use strcmp_suffix() from drivers/of/property.c?
>

I think that strends() and its boolean return value are a bit more
intuitive to use than strcmp_suffix() and its integer return value,
the meaning of which you typically have to look-up to figure out. If
there are no objections, I'd like to keep it and - when it's upstream
- convert property.c to using it instead. Also: the name
strcmp_suffix() could use some improvement, seeing how I wasn't able
to find it, even though I looked hard across the kernel source, while
I easily stumbled upon a similar implementation of strends() already
existing in dtc sources.

Bart


Return-Path: <linux-gpio+bounces-27457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2CDBFC568
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 886996250B8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976CB34C814;
	Wed, 22 Oct 2025 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vrD7MCFR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6634C804
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140416; cv=none; b=Y4u4wPYRYhW7m2gz85k5bM4zLZrt3088QpboQZpIAaIRyLvPlaC+q/oPcf1AtaJ+agD2lcrBF1ba/kk3pn+v3kbd1qi216+fDNICvxfRha5+vMhZEHsgFk1Lr+twwR0i14eZ7rGZVSzvmxdLblLj67dZy4vjkVurwUBiazTiSbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140416; c=relaxed/simple;
	bh=orIYgaMNJClTUKA2Pj42SRVGg9kx4atmkKO79VfJkGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ov0QQmaY1Iqi/aM20HLG9bLrWtadqaIwDq/Zy6U0kWX0VdZMShc3c+oLKar/4TvzVpbXn2GUKdiLWEbwI802gGBfXd+tYwqdImNI+dS3x5G4zpsSdKU2An3zcZTGNrJwlCmsAaY+tM0jeNEZr7CxD7UKU41SwGTH2Lf7qu9E4ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vrD7MCFR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-591c9934e0cso7694330e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140412; x=1761745212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9Gx1TCR16ehe+RsUpMtumgWDjpXuT38xi+HNgTYzlg=;
        b=vrD7MCFR5TiQfiyQ4b02oUQqocgr2+soVZ1doqOvsLFk21dlz6ansHvxpg/DOmiPM0
         Ts1epqVzsKPTxIZEgTAPG9E2iwlz02J7DaqDODW1db/2njFkQJbarS6Levwn4DB2q6gi
         ohXRYq70x90qVfc11r+1GmB1lxZfg+Ml8RL/1e+MdroVDnsqQDagTA7w4x/luiWwUnb6
         Kb7fsbnaZGMqIEhPMYWYXn3oxcCxsfcUswJGBDLQkWp63WfpuWv1mjLkguanLZJD6xVq
         x7Q3AK/upmP1LgDrkGUPeyKJLmxAtJs6N38B9cckdbfVEdtCoqnHqdg6YYIUcJ+3qH+O
         t6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140412; x=1761745212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9Gx1TCR16ehe+RsUpMtumgWDjpXuT38xi+HNgTYzlg=;
        b=AZ6rSgwnLpr/mGXxTA1ZYcdMbFOeuJGshpRE0DGtAAWTNPrxFQBBFKQhzn2SZeIf16
         K661s01WMXQGihvJk1ovoLeu1crn/tT21pNraQ3ZUhHSCn1DkovsnkSCSX28wVgoR7ep
         xA+wRCZpqauavzp42Edduly2C4sAE3E4baKK3Nkouddz2Yw5ITQ1hA3fwCmFVCJjFQ5c
         R/u6v2NfMJABZ7ORktfYPgqb5gNYK5mIYBLXZAWaGDCgs/CyKmXt/2DFELLsP/mK6rjz
         Rz/HVAFl3YFo0LfaK6RnXu96e5aZcShoatYK3sftamFXgq6spL/tE9lvsQ3tQdVd3jvn
         Iy/w==
X-Forwarded-Encrypted: i=1; AJvYcCWLaKyojA4OFoGQAYTTd0vNeA1JxdTq9QcM0y/SuNOfODzcm7atu/2K+97mY5wpCsCs0GQyiALpeZPN@vger.kernel.org
X-Gm-Message-State: AOJu0YyBWryLYDxNsY9nzSuSDgNbwqPctfSLHH4Fz22QBWgfMvbNQQDM
	TDP5UTx9rx8kH8gg+vDdRfEDYle+Wga3FJsqE12hazKC9LDpRihWTzqAJknGQFWAUI8PZFcsyHu
	z/s3y8adoGcMHBKDbJzlU84cCatOuI9N9ajSWrNh6Hg==
X-Gm-Gg: ASbGncs5o8FSEgXJ7QO4Vvvcd/6H+RkJ5Sq+e+jRIGRHFpR9SGiN24eQyIGxm0QJq5N
	m3qA2zx+rLIfZxmS81n5FEQnCeSR6dRV6J9gKvZP0zA6ikH55KlE9X1eNOecq1E4v271kzv11iO
	fEuBmTUEF4nrYOFBjl2gyv/djD4JuOpWm6W8HgTdLbgEqdaoCWWTR/72llh/8iLjNS4G9MzqYU0
	yq/7epV5MGQqp7yYERSJIzxNwLdHigBcP+xNa+5k/K2wC+ubzr/bqlOh2UZoCECQZXNHGt/dLZs
	+l8NUmr5FpG9I/iN8073/BSUmzQ=
X-Google-Smtp-Source: AGHT+IEKqm8lYyfETbDHoX6GlVAlvBKAEAKibR9/ZUGF9ZkgmvVU7aDY+sPQ7pncE4VQkSkH1+uh5CHDb76NK4aZXko=
X-Received: by 2002:a05:6512:694:b0:57a:1846:df77 with SMTP id
 2adb3069b0e04-591d8550fa0mr6598936e87.40.1761140412394; Wed, 22 Oct 2025
 06:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
In-Reply-To: <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:40:00 +0200
X-Gm-Features: AS18NWC2AFr1HYLKJbD6SJ_gfPPZz3lolA3TRfFJfK8fopnOG8MhqaQPJHZTguM
Message-ID: <CAMRc=Mf_qfFzWqy6ND+YDuXcv5NOYiRTo9QY76V719PqJBMxPA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 3:34=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Oct 22, 2025 at 4:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const=
 char *prefix)
> >         return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
> >  }
> >
> > +bool strends(const char *str, const char *suffix);
>
> Why not static inline as strstarts()?
>

Because it's not a oneliner.

Bartosz


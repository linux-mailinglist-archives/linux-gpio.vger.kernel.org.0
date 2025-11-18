Return-Path: <linux-gpio+bounces-28666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB7C69E58
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 15:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4EB7734412B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 14:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391F23590D7;
	Tue, 18 Nov 2025 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VNe2uO88"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEC02FF15B
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475247; cv=none; b=mUjxHPyRmYL9KilsF6sZhyydXvajzsCTomObpAy1U6Mm560Tlf2prtHxUQkX3z/HTz/QiQfWQP+VypVyZmTnyIXqDSlulXeZpGyDOQxdBXx/4Q8lH9yA4xa3oclTBRMjSyPA0bCNIt4tsxOY9k44UzJtp5uHFiCWETvLg6Ki8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475247; c=relaxed/simple;
	bh=0oWXzIw3NrgikdygKFftKQaLFa+eqJmNB4unNCQZN/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Byc+WfpW+B2s/I0x+OCj8C91O5RQ85clDFOmL9yCIjbfc5lPDfERc3S6wu0VwO9vmoZulo0DNPkki+6nHYME4QDQ2G6hxdG/W8naS9d1LEqV0bpFeitk6y9Crke/DHD6Jb8/noTosQ5B+mmMyEs+uRaIaCyT4JUQrOBw88Yw4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VNe2uO88; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5957e017378so6387813e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 06:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763475243; x=1764080043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/hsRoPuxK0ArN7QijjTpiqRdVM4dQQwSNJXwTgxb/s=;
        b=VNe2uO88x+g9NCHAPX7nefpVdY4ApelKS+cewHfdy2xv/JGpCeWYY9eUnvLm1R84gG
         aTdR04gzbaeTyBD1UV7uNHLLNADqvcHWAc7jAGmqRb0NzuMyx+xNDoZiswjL/UmTuWnk
         aouoWp42YBDfx1LxzXNVgxwY0wYlAT1rCPJC/DPckJuTAaLBx+3nkm9XFlQoGYu+oH01
         d/47THufSVxHyaBOe5p3+tB3j0cz0vF5gcOoGUH3kG3vzqf04c2np0t5iHlwRFP8PkwW
         ISXMjU6GwdjK43pL3Fnc7iCqf4/Ar+IH4zLU6cyU4bNfaEvTcOjDpa0XelcNXGVKobrC
         RxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475243; x=1764080043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y/hsRoPuxK0ArN7QijjTpiqRdVM4dQQwSNJXwTgxb/s=;
        b=AUn16wClDwtCv+hSL2sODr48X+Vab35Omc6DAAxzUgWDHhPRAOwcad3er5H2BBLHeN
         zXoAw3NFiPgMOB5fYpNG1ET6x+7Nz/eJNYhoBg1xdvthb98QA6Slv9xpxxDyHZbqOU5T
         4+aKVpMbC3LieYpj9kSJN7YWg7r38/qmrRaNTvd3TgGELy/Q3kCLBcOAEHEMnP33Vx+V
         wEbckTqd9T4Cp1R2TkM8Ny3BY1vsf6jFIvnvyBWamulMvt3U+ATt9noJizEl3Hg7s5H2
         7Xh4MjT9uoFHVf5sSS7PbkggvfvWPlST0qzTgxjoAQMS+vDM8A6rheF1RSse7NAR65/d
         gDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW56kSkJeARR4v0JoFPfjNXFz9DXWVXFmOl6kNA7q25lBCHzRm/YkS/mmrN5uFlvVGzezR7ZEKURWrp@vger.kernel.org
X-Gm-Message-State: AOJu0YxXaHEGZ2pZMyWxGECR7On65Nbor85/cPqCBaKkWvueXbr9yxhU
	fXc9VPlcf233bPg+4RByzWmBLmrkXmdNT2LvkVvbkBZNsSr76IoZ2ju7Z9rsfsrbVY8myUFMM7b
	zDVOVtzT1X06UZXUXkQK60QgOOPb1/9g3ICVztycGvw==
X-Gm-Gg: ASbGncsPEMfJTjEFElxJwqv9lH7UXiAG9D99U+DVv4nC6DPS76O1+JIGHBeN43ViaoE
	4iYqN1VUnOPz+aRIDblanQtVOG+Zr0tlLqC1WKb6/dXBadKvbMX5BlxVG7Vd89OSXiINvsZpgcE
	YEoSisrxxM22pVCRx35T2JvE6FOU5Wcl5BgdbxGOFUPCzlkYJDZu9bUnoJQ8XENwyAKi0nYHdPr
	QBatCjqZ2Y58Aikb9R0C3uachJO8gXT0Wy5YGHRfAUM7IWHmNs4hVb3mRrFEK3J9E993dD9f2Ie
	TMWQZ8zuKQ3kgzMS9tDzRbMuz23MKiERaa8J
X-Google-Smtp-Source: AGHT+IGJQ03bHhvSLT/Jw/p5/ciRMIhXOi1kKvgTg/A2ei7jw24+PyQrUs9nkeMJrkLlGxvJrjx4mWLznFJMN8Rsc34=
X-Received: by 2002:a05:6512:3d21:b0:591:c346:1106 with SMTP id
 2adb3069b0e04-595841984b9mr4734076e87.9.1763475243255; Tue, 18 Nov 2025
 06:14:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
In-Reply-To: <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 15:13:49 +0100
X-Gm-Features: AWmQ_bm5Da4wHKOxjtJ__aJHgfbf47KWT_x6OWvp3Fig-m3IkJbVSEO16RWkPHU
Message-ID: <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Aishwarya.TCV@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 3:06=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 12, 2025 at 02:55:36PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
>
> This is causing boot failures for me in -next on the ARM FVP with
> defconfig, the select affects all platforms not just the Qualcomm ones.
> We get:
>
> [    0.137360] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000058
>
> ...
>
> [    0.140979] Call trace:
> [    0.141037]  gpio_shared_of_traverse+0x48/0x480 (P)
> [    0.141187]  gpio_shared_init+0x28/0x14c
> [    0.141314]  do_one_initcall+0x60/0x1d4
> [    0.141446]  kernel_init_freeable+0x24c/0x2c8
> [    0.141607]  kernel_init+0x20/0x140
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/2101484#L692
>

Hi Mark!

Thanks for the heads-up. I'll try to fix it ASAP to avoid a revert.

I can't open the link:

500 Internal Server Error

FATAL: remaining connection slots are reserved for non-replication
superuser connections

Oops, something has gone wrong!

Any chance you could get the offending line out of this stack trace?

Bartosz


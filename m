Return-Path: <linux-gpio+bounces-28287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCD4C45B5C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 10:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3876D3B777D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8908B2FF17D;
	Mon, 10 Nov 2025 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p2CMFFxd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8210F1
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762767969; cv=none; b=Uqmpw6PaoHgv8BXufJ3VGZ7RNjtHQ3RlNdzCX6ULUYwLsnZt9eyJT1dTRF2qWS0Vakm55D7HYtuT2mNcfvfF4AjoDWrHhBpqh1Fxeb5qdxbyxFK1HYBuorBZDMJ52c+UxWF0kK62buoc/Ym7rwh8yH93/qMwxZdnxgx0s4DQ/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762767969; c=relaxed/simple;
	bh=S1wGfyaVdsxk2Z9k/75oWbkAnuDI8szZ8sPaIPGsbg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bq4oZqLAbsZucApyh6K3G/R/fYRZV7Gal6+6jwMNyUaba94FKQkhVffP3Wj7tzkZa/KhikM5GzaX50rJkwq9KAMIiAQVQngS7W4t++HGarD1JvA1ZTZGuNYXR85T2Fmz6QwWTr56NfOkVWHVvzIdOIQYxakCFxBFyAvCGZczL70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p2CMFFxd; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3737d0920e6so33414371fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762767964; x=1763372764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1wGfyaVdsxk2Z9k/75oWbkAnuDI8szZ8sPaIPGsbg4=;
        b=p2CMFFxdz/LXcki8b/9cQ63b1+vPg6eVxWnP6h8Fjc08dAAs/BibvCUlORK3rO9SGk
         CSbG4iXmZbM5+KC11hm2SEnV7BgdtMZrMONK36sbkrF69f+5rh4z0sn7Mmp6pHn/fvVw
         nkEaB075udlFLU3IKgs7tEIFG4/PQzkf9sAA028wJG6pl0m2fM1zYA4SxOJsA4IYpJhy
         2v1K8l20JvcJ56iLY690oB2e6BJJG8HFdInZrVobJB+4S6AGntT2Nu1O1dqcDXYuc94u
         qY1sIi9BJndrjtIUG5d/T/SyH31lEBEh+NTt/qMqaJDKOQ5X9HEkqzpHDCSR1tsfieBp
         eV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767964; x=1763372764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S1wGfyaVdsxk2Z9k/75oWbkAnuDI8szZ8sPaIPGsbg4=;
        b=TgmVc2Bb3ULq1KgcbpuSIXalYHCe69PV/rZuGRdlQ65O56w6TrcbTg5iGznxXr8vEj
         BLHPibbiBr7U+10gUWmcWSEHODxIWNDczuG4QhakbmOWwQScVFGDWAxwCxmW0+1rEo4U
         rA++aqd2LrVImeJZvcXwoVXq/sBAha/fO2kI388uSAmxlGI5yOcF8s1OV2iNruZjBRUr
         N0xzfMHVMiYlKLVwvq/ab5c7uNN+CHbAv19pC6oEAVfVhA+kyTke5qD7j487oZ+ocSJ7
         B55Of1ZZim23xv0T6SFN7x6PuQA1/HL5oXeY+ZsOp9zL0Bb999qnBhbG1CJplpt8gKnE
         z6kA==
X-Forwarded-Encrypted: i=1; AJvYcCUmqfe8jJG77Mij4ceRV/Vqap8Bfv7reZva38SuqmRAHF34NDQ5ZrFAdYEExKt4Lawp2roBBB6jWv7J@vger.kernel.org
X-Gm-Message-State: AOJu0YzlJKhfToL63Da5TSR1iIIXerPRyig09T1z/Z7MxP9u/tkuXq5F
	FKxsiZAI/7h4CaTfUu+FaLzWpAnReX5KvgjbtKOYYXjGHXFLog79fNh3P8Qeiy0yoJzvRBe2g0X
	+BNmW/GBMB9qIMalrqJGVr2m4yWA9e1/tTgBdSv9x8A==
X-Gm-Gg: ASbGnctH4QNuZaOxSa0FTTghM3hYS1AEc6Z5c9h2Qlm6kVNkgisTNEM16vMrK1JHGMT
	L/bkV+hsQEQwirE+PMyNR1xlNbmdpYPBX4cssHvWUyYV77mMNAg28qzCuQAtyRadY3L9HlERXJA
	p2b5zIYruZDu1v6Tkm2xTsoWQvHTV7L51UUStIyXQlpxWi6pFhK418LWSyjNPU7gVBaZnCFodTv
	VbTuvGUMFst0UkDBsusPLdJvPUsALNHDzD2yGGir2BvU/jlAgVN2WbueHSR/wBvwYUDyGB+OUFh
	EZaL86FFBFSZ0PLzwd3bVWihaqQ=
X-Google-Smtp-Source: AGHT+IEapDIVTd3K1bAU32YeDgJ+hfEUFZ75bdtJQQ2tm2wsLYYaIB9HdEFBH57etQ4VQO2ruXk7jNm7rMa1KIXieBs=
X-Received: by 2002:a05:6512:108a:b0:594:4b3e:2815 with SMTP id
 2adb3069b0e04-5945f1867a2mr1922781e87.2.1762767964507; Mon, 10 Nov 2025
 01:46:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Nov 2025 10:45:53 +0100
X-Gm-Features: AWmQ_bmNaGfRXrBGj05YeySBEfqaBzH8jnH775-U4Qey4HBlXtV5VLim7kMBPJg
Message-ID: <CAMRc=Md4X-GWpeRgun6zv6dddKFqqrjUSveq3fNOe5AboLAcXg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: improve support for shared GPIOs
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
>
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.
>
> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> to also cover ACPI (even though I don't know about any ACPI platform that
> would need this at the moment, I think it makes sense to make the
> solution complete), Dmitry (same thing but for software nodes), Mani
> (because you have a somewhat related use-case for the PERST# signal and
> I'd like to hear your input on whether this is something you can use or
> maybe it needs a separate, implicit gpio-perst driver similar to what
> Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> last week in person and I also use the auxiliary bus for the proxy
> devices).
>
> Merging strategy: patches 1-6 should go through the GPIO tree and then
> ARM-SoC, ASoC and regulator trees can pull these changes from an
> immutable branch and apply the remaining patches.
>

Can I get some Reviewed-bys under the GPIO patches if there are no
other open issues? I would like for this to start making its way
upstream if there are no strong objections to the concept. After a
release or two, I'd like to start enabling it on more platforms.

Bart


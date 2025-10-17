Return-Path: <linux-gpio+bounces-27258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B8775BEB109
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 19:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A71444E3B28
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 17:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D443064A1;
	Fri, 17 Oct 2025 17:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lKX+h+at"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE5B2F8BC0
	for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722027; cv=none; b=nKVaJngd1JR7v4TmYfhMs0RxreybxC9QjqhKjhYKBu0L1jjpMQIxyqefzwOJowGFYPgdhkDt/WJnGUlsh9qTTRecidglW6Yw2fLsVGS1rr2yxSvH3xaUc2rBHoBw+oNgtWIHvjxN/jUWZJ+fKNY2PUrJ3nSU5IKOBJCxQwSe+OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722027; c=relaxed/simple;
	bh=hDi+5M2k5Ml1K9ClJ80BwZv3vRmscPjpCQVBDoPQMTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3djk3BMfsPSndtzZMdtTeTk0ywR5/UpOWV1hg9O6zkzAWUylkbS3b3U/Oleqrm4YBSquFb+9TpQqhXRJ6tP+lZ1I3HPpzbjxJKgIUnkkKCrf6hQkgTVy3hKm72d8pFsAw9k9sDYTOdvtnhbd9aMYVM7LX0EXmcDHxKb+Def6Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lKX+h+at; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so2566510e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 10:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760722023; x=1761326823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDi+5M2k5Ml1K9ClJ80BwZv3vRmscPjpCQVBDoPQMTA=;
        b=lKX+h+atSh/zaXOsjLobaX21WkHh58ezfi30YgGOQdUKbp0BMeje339NJHne/5JMpb
         YIQSpjti8Jk9IQtAFdG2RCTJJxhovDl1cz5E0hqXu+QLthicuZP7UIJqrTxTI1nxO99d
         h0GgieTf2XB6l9hyEtR/5HUZt9LXSqyXyXKZZIMMkAkcRaED+uGG6oCV5q8RqVU11CzR
         s67o4QsV6DFjfOz4GvfhAJJj1Ej2X8+R38CigDfA0AdAMcOVbxoVpkOlv03gZ0js3XX0
         ARvLnfLwCBpAwSTmmA+CYGgVz2Vy5mI9uejbpvOojiZewL/ejZ6fHbxrjFPrfhUk7PTa
         P8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760722023; x=1761326823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDi+5M2k5Ml1K9ClJ80BwZv3vRmscPjpCQVBDoPQMTA=;
        b=eWgO5mLX9jENEdM7VZQuLmt/SjMzurrs0Krw1siLhMIOOnnC5WELxzjrWWbIPGkxg1
         W4vvvM4NcKizyI5nlkrsk2EO4EX9N/RLVelA/GSBP3n56o6pu/M24nguKacznsFUx+Vq
         ZsOZtpBtqHcooYXHshB15+PkgDvT5DE94nsyaDFuTbyztOZe6QpjFl40lp+PeeosSepD
         vBOZvk6435VqNHZu6nA+j7Utn1saf+un70VSt+Isz/sV9NfzKyPxZ3rCW3gxQl3+RjzM
         sGJxv2Wjej+F3GkXO0ftlnQAYSvhvH3VynnM2vAoOSi3CEOligjUhBbnS/mKSitLdzc/
         9Q4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGfXzQPeyVBOXH1RThBnkj41PiB6YvzMISfwDGfuDdVkeKSkfBEt53jR9Yp+q9cevDCcETM+MgD/Z9@vger.kernel.org
X-Gm-Message-State: AOJu0YxoyePVTrKwJ6hoPiXWg+TBbFe2mzVOOwvjQEY+8o+luu99w/Zl
	Ziz2qTnsiNqFIYCbsgDl/OjgbhArF4yXTFpGHy4xZDo4d3R3GUqjd8aIgwBlEkH2mOcvsl3/K+6
	HoeBEqWOgnex7MnSs89eOPWKVYohoFJJfOFHCI5kZvXAzDQAlLnrsHF9X5Q==
X-Gm-Gg: ASbGnctPZwscNhXSRB/NYIF0R1VXSBhke1eVUyk9GoBlBK8844TtnHysJ1MFvG0/HbU
	rPP+LpTfGO9Jae5a80K80decQ/bDi3yxyMiUaXzAmumy+0G9BUaw+THPxUlP/tLKMlUMbV3GozJ
	bxRBUKPATLYzI2so/cH+V5zpFWM+m40sP3qmAns25Wr3DW/VzqFpBVGqGmy8ZFDIryvpXrpRMJl
	zgvUy+bL8zxiq72HMa19KrTnKR4K7CRMcAVrdh/u8ntYIbpMCIy4eGT16NMGGEYfSaEqs0CWUot
	1QEoPF3B00u0l+tgtZNXVWq/Nwg=
X-Google-Smtp-Source: AGHT+IEnROQjyiNXa20y9fdKGDuy8cXUgGRQbjpjaM5VjMNNuXFx1RyY7/MYDJo1ov+PfI5vPHyhYoMIz6wqTgC382I=
X-Received: by 2002:a05:6512:3b96:b0:58a:f7e0:7284 with SMTP id
 2adb3069b0e04-591d84fed59mr1542688e87.13.1760722022961; Fri, 17 Oct 2025
 10:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Oct 2025 19:26:51 +0200
X-Gm-Features: AS18NWBvQScHzFXgOzgmGaLsZFy2d0XcQpPFsgGo-dqtoYRGPaRXMw7LL4aRoyw
Message-ID: <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Catalin Marinas <catalin.marinas@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 4:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Here's a functional RFC for improving the handling of shared GPIOs in
> linux.
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
> First patch in the series is a bugfix targetting stable, I'm surprised
> nobody noticed the lockdep splat yet. The second adds a library function
> I use in a later patch. All remaining patches implement or use the
> shared GPIO support.
>

Mark,

I was working on extending this series with patches that make the
regulator subsystem aware of shared GPIOs managed by GPIOLIB. I admit
that after our previous discussions I was under the impression that
the regulator core not only manages the enable count of the underlying
non-exclusive GPIOs but also emits the relevant
REGULATOR_EVENT_ENABLE/DISABLE notifications for GPIO-driven
regulators when the physical pin actually gets enabled/disabled
respectively.

Upon a closer inspection it turns out that this is not the case - the
ENABLE/DISABLE events are emitted when the *logical* regulator is
enabled/disabled even if this does not involve a change in the state
of the shared pin.

Example: the tlv320aic3x.c codec driver may use a fixed regulator that
uses a shared GPIO pin. The regulator in question may get disabled but
its GPIO might not change state as it's still enabled by a different
regulator. The driver will still see the disable event and put the
codec in reset.

I'm not saying this behavior is incorrect, I'm just mentioning it as I
thought that there's a need for some GPIO descriptor notifier that
allows to signal the actual change in value to users but it doesn't
seem to be the case if we just want to maintain the current behavior.
The only change we need to support the existing NONEXCLUSIVE flag and
the new shared GPIOs at the same time - until we convert all users -
is providing gpiod_is_shared() and just making regulator core skip the
descriptor comparison and referencing via struct regulator_enable_gpio
if it sees that a GPIO descriptor is shared.

I will post a v2 early next week.

Bartosz


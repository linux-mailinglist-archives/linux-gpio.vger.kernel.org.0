Return-Path: <linux-gpio+bounces-28348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E6C4D22A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 11:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B67A3A4738
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 10:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CB234EF07;
	Tue, 11 Nov 2025 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rX39NeN2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C634CFBF
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857590; cv=none; b=Yw/6hrQrD+FHeqcdmp/mwFaVmj0kP0m/0pxwhGijzUEC6qEvUkMY4BPitEjh9No9at+FOVks5qyQeBnn/mMJZRK/FsOQpPKbOED2EbDMqrszOufeuhwMBJZgr4p1lj1E0qkrDAantV0e+z+G/0POttV5Vx24y8BGYgk6n0AMpcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857590; c=relaxed/simple;
	bh=uQN8C80XsI1DNcTbyZlxKBoQDlYbpinBS57HXqp89to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNyu7dgjgnXKg16Y0cRDLWs4TYFvFi7x50wnx6AMbfmS+bisgL+1Qh7ghmwsfGRK/7niKJNGZez9PQtbtV4afoZBfr7OunDL5vgV/hmgTHv34OC3fbXVbNk4e+94Jtd61ThaAhQmWbAkJxBOD0DkrvkyfNxw03ul5CQMzCf/22M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rX39NeN2; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-786d1658793so36159187b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 02:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857588; x=1763462388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQN8C80XsI1DNcTbyZlxKBoQDlYbpinBS57HXqp89to=;
        b=rX39NeN2PL/TgYFEBoIA2sPMSLu4q60y1Sa+C9R/8ZPxW6qJe0Dzx95viWXQz7cGgr
         PH0grH2HrymuRTq8svDjQdovq93ZJ4mLlaKgcSTll7KfAhiiROr2GfO1+b7/MxlRgnT/
         5YYNdrwHyqf9vhIur4rcrsQGCfCUZtDfSce/YCJs1a00tA3kOprneBPS8RHUzjtOc9JR
         cbyc3eGbrRXkS8Pm716k0+wpv7u5F7YYgh0Wt+QbcWACSlaIIGEVZEEkS3sG8fQ8I96V
         awB/NynSphoHhND6wLUZqoKVhqOJexO9Wq0NCuwitk89qlEDHzJLxIpdBsDcwTaHYejd
         Y+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857588; x=1763462388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uQN8C80XsI1DNcTbyZlxKBoQDlYbpinBS57HXqp89to=;
        b=CBIYTaa2WOdKrde15XhuCG38KYYB5JqLTa+GFFBWpr9O1iSkoFSfTvouHGuw3nB98K
         cVgaBNI5blieHa/XlJpgISRNmzh5MlLwpQlj0SOYLEm3zx6zaFfM1xcuqsGOjE+hmZUe
         u8mSKPbcHEIucVShnu5DDeVInCk33yYR1+J7rjWcKa869F3EUjgbVvMV/ENftG8Da4hk
         G13Rjrla8LcqYWszl5kbrXAs4EHKa5deJ+SNvbwZyBq6rNt8DouxujOCFszEUBLSAlGb
         YzCJOK0N35IzAMFX7S0Brac0y9z8sA2qFVDNdFdCkworcoc4c4peiRP9uXRXU0i0TZA1
         vrjw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9qJ7mIcX7/uh/qooFINen1BU8d0q+u7q5CjqFihTCJ1Ozbk9OOsLi6j55oMJopUWiqAEcEWEBrNx@vger.kernel.org
X-Gm-Message-State: AOJu0YxbR7BgkJc9pgvKiCZmZbrC0pQqUBqk6oI90iwr7WKispjCCJoa
	Z+3lbKSFdyMmVpGJpPwFYLDR+b+xh7dkCModZmLOXgojRDDjjWLXgxzpozqr/ATvbyXlgvj4xtJ
	sbwB6nO9oA1HsOB0SXHx5xxn+W4xBT6lIM4whtzx9Hw==
X-Gm-Gg: ASbGncuGTh6K+j0yqZk+Gzejl6PoI0kugth55tAyS8piyYsp4SgVnH7VinhT+aRVfKI
	fWQuF9iNTzo2qk3eFu/MKmCdxEdV5In1IfSudNCqIuT8qXDbsoSk/x0LSJ4xakAsDn+nnm228i9
	wEapUX0K2Dw2VQIG6CC/jh7ccnfM7ED6/aC7kAYryoeI/aN+WUZ8bTSl6FkhKRpV+LkzaomHn16
	ZO9HMSuYsLfNNFFBcDyn9llzD7mp8TJ9jCobVteoBUkTRJYhEBlqBkQF+h6rrtYS3OZlCSS6tgb
	K/YTPw==
X-Google-Smtp-Source: AGHT+IGdKr3biW2aMZhYy7DvL1RF+7Uz2kpvCtGXfJ2OgvOVwI6zfxqRAu2DSnJi2xHuqa0EQrFVKg9nUpOsh5XjgKI=
X-Received: by 2002:a05:690c:55c2:10b0:787:deea:1ba8 with SMTP id
 00721157ae682-787deea2334mr150764527b3.50.1762857587612; Tue, 11 Nov 2025
 02:39:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-2-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-2-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:39:30 +0100
X-Gm-Features: AWmQ_bk198TBC3PdqVd9Oowwqb_fFWVruyMz7Lubn4P_lvSkb0elFliKm8IlGq8
Message-ID: <CACRpkdYRzuumaCv=a5UL_G8StQj10kBiRfkfrpWCk05zVfGYsA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] gpiolib: define GPIOD_FLAG_SHARED
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Define a new GPIO descriptor flag for marking pins that are shared by
> multiple consumer. This flag will be used in several places so we need
> to do it in advance and separately from other changes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


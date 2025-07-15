Return-Path: <linux-gpio+bounces-23299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0137FB060B0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 16:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFB1F5071E3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 14:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17FA1EA7DF;
	Tue, 15 Jul 2025 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvY0BD7k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB851EA7D2
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588097; cv=none; b=jzT8VRkbN8qoUssYlFZOfmEYd0KkOSAnIToNw+5Rc74aQs03kama+8zIUz/EIsDYmnjvG/qLMoXd5rZ46HV1TSkLxXO7VJMK2x2JycxBBVJT9inOW4Eh1eOE6ftkmbGcsxXUbixfyB2Oas2j8uN7m++kzPGaqRuhUJzUVMUgK4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588097; c=relaxed/simple;
	bh=ZehdloQEUsP88pigCl64ebfictbezAWEu62Zt8m49sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIC1CaeuiyDq3nieL4L+ZX1sU0JrLf/gVsf2HzMw2lFggZlLiaWUC2KJI739kAqzVSHftq9S7/RmsS7fiP6+pznvk1zHruda5y3/qoIZCjLaPWIFURotEjEzaYQuHD0jMuNT205nt0ZXMJU7u5PvXXR2ZJNIRbVSZCIVxut6j6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvY0BD7k; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b6a349ccso6869101e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752588092; x=1753192892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMq+z0lTQ5uqzjIe7ORBXN+DvvALIfquyp6XwhodWKg=;
        b=QvY0BD7kEfcCud+y9Vn9la4Fhw8+G1Pj7wEoK8gDPvkl4zKp9bl7iqOzj782EBceI8
         ccReZhCWcgz0U+kk/Fz3fe1AHdpnmsgU7vg9D6uqH4g/knnOoFg/QohesoucuXWobWZE
         Jfwfkv9ACztJIR0ezHVsQKmI2K+lR5LrDCdZjl7NSSpRbbn9vfYxIHCqhMBSgUSUfE+S
         5Bu0psetYdQjfc43FYJ6ctq3aboaPPhqRn+LVVOAumjl7iXH89p73036RDWBPpKFqjX0
         A5JwvrfnOwiJYCkBU8dOenOH4BFru8Ww70tQzbkf6cNWTXcY78PSVDyOTVH6hrbviHrn
         FPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752588092; x=1753192892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMq+z0lTQ5uqzjIe7ORBXN+DvvALIfquyp6XwhodWKg=;
        b=Sxz+8BazknXtGokoeq2PcRGJJXxzNKxuwniIAR1EpbTRP+2Z+Y8PWpGQRhPBvnbuQJ
         Xhi3SHdpM1+5rH/tKRwWnerE4NgRxwkG9OY6L8H4ZOg3lsquHfS+1jqhwf3WducwEEvQ
         /od0Fz7HB9UuyWeCZjh3tl/w060BlGxbnPyOsTrPc4WAI6jZ2v9Q9BFS1GcxAD/QGh+C
         82bMVQOc2hHPvKfT5+F8SAqEZeRK2gK8sdlseHdJwK+pccuuJjeAKS1qqH/UHdtosxL9
         b0XDF0PhzfgFEVkK//WqBSvPTpo+fAwg+8McW+K9E3ivlsrgEixEZLjpXsnEo3SWnMfF
         cLIA==
X-Forwarded-Encrypted: i=1; AJvYcCW0o31UReJys4Gg1KF8Tvarqdf2lTIWspAFccNrjXZN5NI35OcbeKOogelHhsyVEQjlyulsrrVfYHzQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxVhjhfw0wi1gTqgGbTth/VTRT3cbZ7luqJqlGgNHNe0JU8RKSg
	Vpxx5WhPLHvmajv+fHW6JI2Y1wCayuWSewsHZ1/0NNkxDWA9QiljhVLzXoq2CeRyKpO5YXa3w7q
	QeN8lOGxg+evJ/0eOuo7hYOylSokDokdNk2eJUtKoIA==
X-Gm-Gg: ASbGncvZWdYED7UJf9DhELaEXISWe2S6fIlva+6XA/qUohK64X7vDKuLDr+/LmiaiaM
	DwLkfS8Sp20O2UWw0WaPGt166YEfYr2+Z4jGdavci0bTJuscboeW6ikjMzldmH55xYMNYQWzQGd
	zM8m8z+GsO/MDoe+0Qe09IWYYEKfP9B9v0FnagA3FbnJxioBE3/n7JBRz3q0hJXH78QQbPGNAYD
	uOD3hw7l1u6Uk6Jjg==
X-Google-Smtp-Source: AGHT+IF13ylGotB5yILT4bHb/RqmaS522PnGXIijvb1MELLLon8vaTv/g4ADQmp0eDqrLOLp5d2POnBSPsqQfLVeuyg=
X-Received: by 2002:a05:6512:3d0f:b0:553:2f47:ed21 with SMTP id
 2adb3069b0e04-55a0460950fmr5418782e87.41.1752588090141; Tue, 15 Jul 2025
 07:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715100415.60487-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250715100415.60487-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Jul 2025 16:01:18 +0200
X-Gm-Features: Ac12FXxwgG17tM0pR7Wbn7eqRk8ggfOlZMUUBSReGExBS5bLfNdm4fWxeml3fXM
Message-ID: <CACRpkdZn9ePtwBnxNoy+nijc-oqu5zWoKc2O9QDe=MsgZpRdKg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.17
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 12:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.17
>
> for you to fetch changes up to 683d532dfc9657ab8aae25204f378352ed144646:
>
>   pinctrl: samsung: Fix gs101 irq chip (2025-07-05 09:35:22 +0200)

Pulled in!

Thanks Krzysztof, excellent work as always.

Yours,
Linus Walleij


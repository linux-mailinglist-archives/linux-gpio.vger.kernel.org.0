Return-Path: <linux-gpio+bounces-2832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D3784485B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D922F1C237B1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60B43FB0A;
	Wed, 31 Jan 2024 20:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q1qglu0H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6393EA9C
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706731301; cv=none; b=J4Zhc9oIKOYROxPBbpPEtnFh/PKpSBLqk1jAIGWbgMMiFbKbVlh1cIkT9JSQwtrpcF+QWx8EB7beEMnwlvygYsC6326qn7cV2X8+FTIBliaoune9+bywCj5DnQo0tU2CFfaPoNcHifkGauLJzaWYNoGh9ACFsPj2/hkRnEM7/IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706731301; c=relaxed/simple;
	bh=/R8kRs2qiNcStWcrwCYAg0we1hus4HfYrb2LRT0M+Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0CHBLH8rnoSHUvYFr9zmOu8vtabaMLHNEI9iW9QKZdPRc7OEi7bfEA2UJTyGjgf9pHUkll6whwzIuorO7EBPUpTTWxIYzLyYGAr1QI+fjktRqkx+LnAYIwLzGmtnlX+xVtFdmIxtZUYNcw54iJqSeGgODQLEqZMMj9yNKRpzWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q1qglu0H; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60412866c36so1650827b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706731297; x=1707336097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5V9bfTwLL9jNSv6vg88NwIpMVBmUkBIVa/DKkkcbPJs=;
        b=Q1qglu0HGyJmwKzaoAW2YmF8Scd9zThGUoKzPFvDLCHg/UvmbTeMGHKIzBu0TzvcFI
         RbKWwf9dldxEr9CUfiZhdp9uaeo/owPKPJAY6sqIzC3Qs3pGWo6ZtzKVwJj/LOOq+r4i
         DhvDh+wdEmZb3dBVto5yIOkiYl2uGkv9FSy5DBmhe5FrK9QezaD1M437CUMNCdMWEZKi
         rXuQHDc0VPXUwhewUJJMNWxWsm55NSS7PEKabO4llIFH8qcNAq4kSiX7tU3vhtMpNnW9
         ej6QkpXVP8hBC4yO2B3hTElX8IuVXEFCL2DERif6zQJpRiD/Ejys9joIWzHF1et7FhQ4
         InVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706731297; x=1707336097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5V9bfTwLL9jNSv6vg88NwIpMVBmUkBIVa/DKkkcbPJs=;
        b=D8+f5Sdm1WF4P12VEpgsFh6kx9L0wxZcwhBbBmiQPa0s2sS/xfkDjnmGBMud2BTPmI
         LUVIzYW2EuVvNqVDPf8dL1mtJniSB2q4DMa3Dn0afNy1HQWLXlzqt3n+xbMUrE5IYRdY
         9BwiG3cjLE0mSt99JomIC6ycfMWVSiSyLMe+/KkiyWfOv7aNAfod66S05KIQWCXp4CbJ
         hiRFSsAqgUjoJAXVk0ReoYLW66BGjspFM9Eodtet0KyVg9A+/aOJRNFEMtEGvC3UuCwN
         op631TSFtqKl/IH51iXbIQ/ZxAIL8AeHRMToJcAUMRseoWdtZMKnrd1sTnDBju4a5ZXq
         vw8w==
X-Gm-Message-State: AOJu0YzT5ZhUD3po+NcIqHM72Lz/3+QXzMA6JsDELifCiJzj9nAchE/I
	0BSQYgNbGZqu/xDU3OW8Usr33pl07eZyegF6tb4G56XZrk8bkcPfPu3iLk2LFpTdbS2WDwacNKI
	MthrcGCHdWknmJKmxB7zB1Ofj0qD3ehHtSjp1Gw==
X-Google-Smtp-Source: AGHT+IG4vNiu5MK6XabdRnK0icsrcLF9T9xmQMFMBM/Sh4h7TAa+xTBMwPghDW0XbTZS3sWViFpO7WLlsGXRLt30L8I=
X-Received: by 2002:a81:4302:0:b0:604:f32:df75 with SMTP id
 q2-20020a814302000000b006040f32df75mr2404365ywa.7.1706731297634; Wed, 31 Jan
 2024 12:01:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-11-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-11-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:01:25 +0100
Message-ID: <CACRpkdZyaqwbxvsLtXPHSX=6jyFPYSxA9n+qWakdhGKmo+L9fw@mail.gmail.com>
Subject: Re: [PATCH 10/22] gpio: reinforce desc->flags handling
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We now removed the gpio_lock spinlock and modified the places
> previously protected by it to handle desc->flags access in a consistent
> way. Let's improve other places that were previously unprotected by
> reading the flags field of gpio_desc once and using the stored value for
> logic consistency. If we need to modify the field, let's also write it
> back once with a consistent value resulting from the function's logic.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
(...)

I have a trouble with this one:

gpiochip_find_base_unlocked()
> +       unsigned long flags;
(...)
> +       flags =3D READ_ONCE(desc->flags);
(...)
> +       if (test_bit(FLAG_OPEN_DRAIN, &flags) &&
> +           test_bit(FLAG_IS_OUT, &flags))
>                 return 0;
(...)
> +       assign_bit(FLAG_IS_OUT, &flags, !ret);
> +       WRITE_ONCE(desc->flags, flags);

I unerstand the atomicity of each operation here, but ... if what you want
to protect is modifications from other CPUs, how do we know that another
CPU isn't coming in and reading and modifying and assigning
another flag inbetween these operations while the value is only
stored in the CPU-local flags variable?

Same with gpiod_direction_output().

To me it seems like maybe you need to actually protect the desc->flags
with the SRCU struct in these cases? (and not only use it for the
label protection then).

An alternative is maybe to rewrite the code with test_and_set().

But as you say it is currently unprotected, I just wonder if this really
adds any protection.

Yours,
Linus Walleij


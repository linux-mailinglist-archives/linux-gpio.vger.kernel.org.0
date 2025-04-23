Return-Path: <linux-gpio+bounces-19224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A220AA99135
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 17:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EB1D16375B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 15:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A2F2951A9;
	Wed, 23 Apr 2025 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="corBk+v7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506728BA8C
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421328; cv=none; b=jjC5VDSe3DbBxaPcatz/crLht1uxAKzg61PdJasQLpuOlM2aKawC+j17jXCdDiLn6yAn9GZJoXhX+KUIzqr9iRfpTVghmDk6RxVxg+BrABpYdOdIbtqg7Nu8CMQDSpR1na+FSvo/OJa5h8LxCGdJNgrsGPKGAxLwYTy8M+dYRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421328; c=relaxed/simple;
	bh=9qP8bXqNzUsGoFHt25UAqj1MVWphgl/sd3HC87H6/es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcc6MLA9AEYrTW/wHH6BX5yCilhKoGALwiyaWksanuoKgdYvsTScPJPoTUieVMLyYK30bqZ2Ft5Aa1mseRyPlH1V73gg7Gj97T0ofLLGkYfJUtj2A82HSz+/8cbtpD5jPA6iyRqdwwkIYsQHgftHLkOIhW6lkTWRfqpK+nthkVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=corBk+v7; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30db3f3c907so155101fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421325; x=1746026125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpCh/bKv5Ai6XWwUzIcH2XxVQsTuQk3BEgJo+HbzPHE=;
        b=corBk+v7lp+Nn1UPXm1gxwChgFAarMS3O1PaLhBN1llNHLHIrEQbKDqkLPIhCU1k61
         mBSmb0advBlh1YpGDKW+J2ne/5dSCGOL7IY6BAd7NRItCyWu+VQ1JGhozb1xy7v+cjCR
         jckeHJgAMOK26Plg5KTbmxDTgej0HbmccPy6U/YOwQnuHW3YoxFwtfgp4DpMUgljxniB
         0HK5AWmnXE+TGZgtjqIKUrGneL1RMI6J+YAO97KZaH5ZgliGsLz7Ak4VemkuXrsaoTjn
         FxpiNQQ5RK+MtNyr4GJ9As4fFLb+Zmw35TH80RBxGOyS0h+9uuGqdW3+hCgHUbqUNaBC
         uOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421325; x=1746026125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpCh/bKv5Ai6XWwUzIcH2XxVQsTuQk3BEgJo+HbzPHE=;
        b=WTG0/Fhi3oDfV5RqPpZTdZE53CrIiyjNqJsH5ktuB8r4xsatdw6k44a0zAnDxK4I+n
         Vv7n5CsI4fUpgRw1un7gKO54zQWIe7nHPZjBUFMwawB+LHy9lNBRzeNkNuWkq+oDt7GJ
         U6xU6JUzh8KbtM71vsVIhwTx/naEzKcxr4a/dPZbo4yB2vncZDOUW+va4LLHSRrRqWPc
         rlIemrjbv5eoSJBlM8RqtH8OxGM4PXxvDfIdH9xPKgCP+Lmt4irsunxBTg+Qot9jTWZ7
         4Z2M9Vj0kCjkiDj3YQBE6+GROj10wJetjH5n9iXM7C6ddXwnihnpjS68ulGvgEZWTbwi
         SJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCVdGaIRkX0Ju0mcnJNAclE7xKXllNirqNTa0GrnNjvPMDhDSlAhD5DS9IpmSQvHY69B9W8XqPFE5i1Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0sSI6jhLo7mxiA5vp1S0RknZ/NIN2/GKKSc+19eK+5eqd9/lm
	GIKZ6ZlgDEKREYQYCsBjC3vTpJrAtPFz6bVvdQ0feBbtSdptu5UuSAbnYKuoqfiHB23wSR0/u5z
	DRg8uvO6wamp69BuLrpAjFwxcsKsKgwi8wxlhHQ==
X-Gm-Gg: ASbGncsHiMd6Ggkl9VbLQ3iZJX7blTiwREW1Kt+r/3uzD5xFQuGdQ3n5TgpPV09BJfA
	0OX+7tLCpLwlxPkEqJu8y0pZZaZsabz2qdMN7HSL7B7PfdA88JqmfYdC8PE3Kdy1//Fzxo2WgPk
	VJ4tluX5i1YjuX5uZO8Oug1rM+AcKX46ROQU0BM20m543imbrgdggjYw==
X-Google-Smtp-Source: AGHT+IEb1jIj14pt/URZReGGb6TRkHRFc9RO4pOYfh9JBEeg/z0nCu7x4tQD9PqcIWoruPNTpnessNuZbjek65SmGKg=
X-Received: by 2002:a05:651c:1603:b0:30b:e3d9:37e5 with SMTP id
 38308e7fff4ca-310904db169mr55235771fa.13.1745421324677; Wed, 23 Apr 2025
 08:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:15:13 +0200
X-Gm-Features: ATxdqUFDwggDqgtKp-q1Zc5o_6PU2EcjPow6QZCYfHjlH6VvpL_4JmV6numGqXk
Message-ID: <CAMRc=Mdp55VX543rXmLtMHF7sCxojcs-3BqyTZu7NDMzbTqVog@mail.gmail.com>
Subject: Re: [PATCH 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (5):
>       powerpc: sysdev/gpio: use new line value setter callbacks
>       powerpc: 83xx/gpio: use new line value setter callbacks
>       powerpc: 44x/gpio: use new line value setter callbacks
>       powerpc: 52xx/gpio: use new line value setter callbacks
>       powerpc: 8xx/gpio: use new line value setter callbacks
>
>  arch/powerpc/platforms/44x/gpio.c              |  7 ++++---
>  arch/powerpc/platforms/52xx/mpc52xx_gpt.c      |  6 ++++--
>  arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |  6 ++++--
>  arch/powerpc/platforms/8xx/cpm1.c              | 12 ++++++++----
>  arch/powerpc/sysdev/cpm_common.c               |  6 ++++--
>  5 files changed, 24 insertions(+), 13 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250326-gpiochip-set-rv-powerpc-1e98d28222aa
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Gentle ping.

Bart


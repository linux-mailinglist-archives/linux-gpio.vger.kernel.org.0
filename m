Return-Path: <linux-gpio+bounces-25606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BCB44387
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 18:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1860216B6BD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 16:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C91A3090FE;
	Thu,  4 Sep 2025 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ANcnECMl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB02301036
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004320; cv=none; b=B78cqwEfIN9RD1zFuKA+4Tp7cP6HfLXZFkvYkdUFe2GHGj94oblR0pgSL2z0Fy/bHy0bfYuUmZQezxhJjFkOQXx7zeAlIfPm8pY6NKr+BZvlOk0Q3NQENn6TsjcgsEWSgsk/PfeQQujiCwICSk/KAQFwTA1dnOU1umRl6eqXe7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004320; c=relaxed/simple;
	bh=s59DBpnh/Bni9KPUdtjHKw9HmnP1CEzQJd7Re0FgJ/U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbIHN7GMP4S6QIdkIxZQmdUizs6Y919Gy1O9uPXZepn++cvopRpz8YXUhEkGyijA1tDzZJrIkNjrwX1cW2BelVkAGpgk4dnVdOrBZmPwOpkYvRhd81EErGJa97dju9+pK9S/w4PqJyqlJrzFXuz6tTMNV6yD9UmTIaJkcnSKIzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ANcnECMl; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-333f92a69d4so11697311fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757004316; x=1757609116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s59DBpnh/Bni9KPUdtjHKw9HmnP1CEzQJd7Re0FgJ/U=;
        b=ANcnECMlnGABmCNbBMpYN+bOWJTZP88/pim0Kte42qce7gdI3mFpIaJbegZNnossSR
         4ao9kU8Ms9w5mzcH3gxzrCpj06JTCI/HQzcWpL4s+6of7XCsuci+g8jzQA4L4vZu2RxK
         VSyOBT2y3wVD7XUqSoZYBAUSrNQ3HfLt/ZN6qyVxmEPrmqb40gM40ufETh9X+ZC5n7Zk
         6M5QeqlwnZyU6v0h9sHJhoITuGlB1OPVtPiDxcPX6yWVB+jzUUTwKkxDsjguUXyEQ03C
         f749+6jivuHP1Kbp8Cnp+Ysg9Dx3sZ9k+1Ry+PD2bCISVqVwE98o9q4nesOXGFc5gbhP
         GSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004316; x=1757609116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s59DBpnh/Bni9KPUdtjHKw9HmnP1CEzQJd7Re0FgJ/U=;
        b=vUJ0j+Mz5sbjSNV12z8J4qlmAdaQAeLSyf0gcMqKFszq5YtJ8OXrYdvWOURYqjuFI+
         rJ3glXCymu9/TkE8YxTna09VnGyHczjik6LmOTZVGjUijWyaTDna/wm0rHwgz5ZOOOyt
         lYcRTrHMEB+KDKzGdepjFs/49f1Yqt7t0YxnG3RPHbE0UYycytuxRb/0S6rKJvUqt8VG
         s3OQ8MIX8Ka/zFzdjVHEiwlFjqx06BcuqX7ws6EIZE28PFmwt8xi+ZlhFPFRL0J/Qt3f
         otJn4We6i4PnKvBc3ocK0LrpvSSMEsMy57CsShuE8TQ3r2D093Ct9JcZQfmdOBydVnqI
         nQFA==
X-Forwarded-Encrypted: i=1; AJvYcCURWD2XJW5iFZGfPJv2bPkGBFeMB8mQLUrpjfsz+nl+HESZ63Am9mts20CPAbulXjTli/2JKeTTmE1l@vger.kernel.org
X-Gm-Message-State: AOJu0YxkIrlByRveSTv1BQ/LdM8i6rbwA3nbR5xIkdD1Q4LXl54J8dWb
	KOXeeByQx1bmVba+VUGE+dA1erMZZrzNsbrNbI+RqfgfBn8hkAhGPu7Wl5RbV/cCdONLf6nafq5
	qYbaVCt5A6fJ7hvwW4afQ4Q0bgnOWYgVRWGH2VcQeLQ==
X-Gm-Gg: ASbGnct37Z7v+X/kLGNt4xCz3hNgAEwY4igagExHH9ZJHoKirgpDSpUMND+FNacl96/
	TXHiZehDLKX1bYM1U7DGXKCLX1V7a/KGBARbBYZwGL1J2Jl7tygKnPu/PvuF9/Rvg92GoXYb/Y4
	Ug/CQ3QcdvUKW18n4EZGXwEgaFySuS95OCyaTLsmXT1k4EKoD+CaTuHoyhVSJb6Uh79eFKQWxXA
	ZiVdt8h85lUxRM/yDlNjMXZwRF7CPQTth3Agg==
X-Google-Smtp-Source: AGHT+IHODX9nL+jalzSRHRkJwxaYzf9a7w+AWw5w5Ry9jDLJs9T5DohamwIN94OX93CogB6gTeiJGbjrzMXKX0KJ93k=
X-Received: by 2002:a05:651c:2343:20b0:336:b47b:d145 with SMTP id
 38308e7fff4ca-336ca9f4367mr47380591fa.2.1757004315902; Thu, 04 Sep 2025
 09:45:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 12:45:15 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 12:45:15 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250904-hid-cp2112-fix-set-value-v1-1-17d2e26dc8c9@armadeus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904-hid-cp2112-fix-set-value-v1-1-17d2e26dc8c9@armadeus.com>
Date: Thu, 4 Sep 2025 12:45:15 -0400
X-Gm-Features: Ac12FXzndUbHuaQzJ_4VZEEORe4fBHBc3Z2g8YpNt0l-Cdtkqn6cNAIAkwgPB28
Message-ID: <CAMRc=Mc8RZBi_OF5rDY8ky5pNW3xCBaR+21Anefs=B=enStPrw@mail.gmail.com>
Subject: Re: [PATCH] HID: cp2112: fix setter callbacks return value
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Sep 2025 18:42:07 +0200, "S=C3=A9bastien Szymanski"
<sebastien.szymanski@armadeus.com> said:
> Since commit 6485543488a6 ("HID: cp2112: use new line value setter
> callbacks"), setting a GPIO value always fails with error -EBADE.
>
> That's because the returned value by the setter callbacks is the
> returned value by the hid_hw_raw_request() function which is the number o=
f
> bytes sent on success or a negative value on error. The function
> gpiochip_set() returns -EBADE if the setter callbacks return a value >
> 0.
>
> Fix this by making the setter callbacks return 0 on success or a negative
> value on error.
>
> While at it, use the returned value by cp2112_gpio_set_unlocked() in the
> direction_output callback.
>
> Fixes: 6485543488a6 ("HID: cp2112: use new line value setter callbacks")
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com=
>
> ---

Eek! With the number of conversions it was bound to happen to some drivers
since I can't really functionally test most of them. :(

Thanks for spotting it and fixing it!

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


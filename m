Return-Path: <linux-gpio+bounces-20982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F39ACDB86
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 11:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C185F7A6A2D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 09:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87D028D821;
	Wed,  4 Jun 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j93Jn6y8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF82228D83D
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031161; cv=none; b=LNOzjld71USVgBRJinsr5oU56ocFoFfYoYLsKqXIdAN6NEfgiuxx8VH8ouWGH2VZqIU7EVV1+6YqT0IgFWPKwA5KA2pmmD1Ul894qE/uPWvMI1hS93xeaViRHsmwsCUhWK9Zmsxo0hJ1mBa/BCMs8b4X+2B9DCskYD/WTiscW9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031161; c=relaxed/simple;
	bh=qNFMJR2Op1bRHX2umGOwafobnC9wjuOYQ8O8pbFpZtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/uyQbpDC4UzYks0dieulRHrdi0MmmRg/TewhWDgOsk23wypRcYpO6Lp+b8VKE3PzTEeZtCrstmSUscLodUIX0ZhF8FGtttx+2j3bcmQxkcke0hG3hBCpY7Ek4nWSjblXWIZnM32/Nsu2ale9/BGkzxFX3y8f7MLp0ZOscquFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j93Jn6y8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5535652f42cso966505e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749031158; x=1749635958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1Xkbhi2FXcs9BuNNL+T5zC3K/Dj/hcfsJRWol4Uns8=;
        b=j93Jn6y8s+2zYEGT4FRNR/1R7+SDIkEovogg1q23w+/80rOqLXFpYE95dybj0CDTBJ
         G4+R689kD9D0Z6I6jFB9TATbs0sEfxlQK/wpvt5ZZJiIVcuCX0lPQDrh5SAVlPDOlMlX
         cfbNu32zPYV2clnq5sMJwmRIS7kOj2VZC0aeeO7K9tLLvr9asXwTzk3QO3kC2SnjdtvG
         aq2CGVeH+pni7z9qe9jP0U5n0a2wZ6q84+Cb56RiP9EIpDmF170aQWhIev9G0t6YnoPx
         jDHZwhzcjuO4PUBFt22Gwrsi1YUT63LfOLPlmE1uRYWyY9DEnvNkcPnAbkHpsh432b5x
         KVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749031158; x=1749635958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1Xkbhi2FXcs9BuNNL+T5zC3K/Dj/hcfsJRWol4Uns8=;
        b=etlc5HvU1o2L5prIp+vKVUuO89dhm6U8BKq0cdcGKjnkPyEAtMjCPOlh/7U2PP+rOf
         zDCuwENsHraBLUDjNsSUt2877sbtqZDdUHMyHaglT/MuHLiCrhmzYExZvYjRorl5oAEx
         TpHeF5AYYdtLtVLZ73uB0S41zf7FJv9QVJ8bfCw6TNwqT523euqOFYQzBdFXaBIs+rSf
         Dy8CRMjjTNgV9c1H1lP/R7EcxvJwUjCt+TkXQ+4Xx0L9phNFu71bKkRHF6qUOt+IH1ye
         qy+MqSSFP9N5Xooj1Xq9POU+A8SwhW8tiVV8YyvgFx0WP5/jN5NfSauB1nNPeoVYiJOo
         By5Q==
X-Gm-Message-State: AOJu0YyQOuFBurTFKEPgkoTjYpEtSlb2IZZIbjqVeePWAIU92CQfnqeK
	NRdAgJ3IXC33CVkG0R/RuWTi3nhhgf74TN0Y0vFymt2eXWv40r/7BoBY6hi1kfg8k9tnZZLcxL+
	/tp7AEcsQANswn3Cj5YAIo8o7ixcKbQHdz8cyPbHVKA==
X-Gm-Gg: ASbGncsVQvDW3pao/wRrmAGgVs7Jga5r9f6uWOy6AsYlz1R7gqr+BGd1/0y+wiBA9kT
	CLbhxiZlS4bcuHqeCH0GINdkeTcEMsHRDtcIrhCgCJ+8aX201z0RQl/EosxJUwvzMDyLfD120OB
	e6pEr07Q53AKCKZmv0FvdjN/j16BurvLgppWx/wDzhLL0rlClw9pv4efw+Y4OKf5Ss
X-Google-Smtp-Source: AGHT+IF2JZJLXh3u9YrTQxxjFobXd508LDDMB/iccWCmo0//s5+JFJZ52nYts2Rlk7fD7J6Cky9+i+Ap9C9mg2eG/58=
X-Received: by 2002:a05:6512:ba3:b0:553:2a16:2513 with SMTP id
 2adb3069b0e04-55356c046a5mr655224e87.47.1749031157763; Wed, 04 Jun 2025
 02:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
In-Reply-To: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Jun 2025 11:59:06 +0200
X-Gm-Features: AX0GCFt-WaRgQpck-kd61_5bUpnHB6kQPndRczPhFwpisNWoCcoyFYwTBqFHtb8
Message-ID: <CAMRc=MdB4u=Cn9NmzqSjQukRsCJDZuqZCYdozg_E9Ooi39oS5g@mail.gmail.com>
Subject: Re: [PATCH libgpiod 0/3] doc: add rust docs
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Erik Schilling <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> While full integration of Rust docs with sphinx is currently hard, if
> not impossible, we can still follow the pattern we used for GLib
> bindings and generate the docs using cargo, then linking to them from
> the sphinx page.
>
> While at it: fix some minor issues in conf.py.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (3):
>       doc: reformat conf.py with black
>       doc: improve the readability of the prefix variable
>       doc: integrate rust docs into the sphinx build
>
>  .readthedocs.yaml |  3 +++
>  docs/conf.py      | 43 ++++++++++++++++++++++++++++++++++---------
>  docs/rust_api.rst | 22 ++++++++++++++--------
>  3 files changed, 51 insertions(+), 17 deletions(-)
> ---
> base-commit: 088c66ef20662b76eebf03e71f11196a5ae14b33
> change-id: 20250604-rust-docs-502d6caf207b
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Erik, Cc'ing your current address here, I forgot you're no longer with
linaro. Hope you can get this from lore.

Bart


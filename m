Return-Path: <linux-gpio+bounces-17421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ED4A5BF95
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 12:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DB401898B51
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E674824E4B7;
	Tue, 11 Mar 2025 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RvJd4iHc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC61E51FA
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693567; cv=none; b=nmf9yFRChvdrRHnXVk1EHOgedesH6rKDS/VfrSzXMGzoErwSm7CbyPomXW5j/cd9lj5XdkjOWGmSs7qEJCuEod9v4Tq8ypijqdG/H+Uf8oij2KeEVuHN0cvzWZHwD0EA0YApqGDvmYvhIHG+eENyYyFROWkWxdyEGOX/modABNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693567; c=relaxed/simple;
	bh=HlzzY05BWtlJR2koHJrBJ3eDmc59baWY962o/k5YXK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9gmlXhw3FVj1sGzPjyZuU8pDQD4RBgDTHjDcQpsRyL6aVHNxDDms2BHcUkZo38l3tV6hJf+BPDgjDmteav5ldNBIqDuPWo3Fvb8xgY0aydg9H/5+c730l00NvKbbrv8irv5NKq8ZdN6C+XxCsCVg0zD5ExeMiKqsg+QGWBFHhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RvJd4iHc; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499614d3d2so4569757e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 04:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741693563; x=1742298363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlzzY05BWtlJR2koHJrBJ3eDmc59baWY962o/k5YXK4=;
        b=RvJd4iHcAz/8woGSfMGsuvVEttUlbLjBCQfSKSZs6gZzByjAdeRe910poRUOq+t6fe
         /4ZdYtTXa8/BA2DuWUeeMln3ugJw6U0hjoLZkBG67Utj4roV+34Byim5sDpcRV5mWZuR
         4Z7KP/n7FdHRP3VfdnbACljDt8gY4SrIO04oHAxScdGum8Tu1qyAwXVzIK0ZJMunziHd
         na24RM+1Uk4AkBkaIXeSiW8Rz6uG7q9e5c3QaF0vgNt2RsuyzF+GwMv1ooiUotdh4jJI
         ZH5SsmL5l7oSdd7wJSSw62LYT6q9J0e3Q8s/7qTX4/IDZbfMLQuP7PXlKxjXq9uEAF21
         8Z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741693563; x=1742298363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlzzY05BWtlJR2koHJrBJ3eDmc59baWY962o/k5YXK4=;
        b=qlYkDfn55xVE/fuI+iq6VaAk7YKS6K7fDsYpXfQNLLVoGSeoVQXLGAPARMLwBvmHna
         aJ3tdiW6wZjdVj46c3kr6PCWkJ/tKEgJPnh+v93Q4ciKReYTDKfky5oTOYeDdMsZVQ9M
         vEfwf/KYq/sSDMwLzzaUFT0E9INfbEoM+hoe1B0OwIsDuEdPPf4o2K67lkQnDH3IHsJz
         4ENAHpYCdraDoDwyUEeXiNtAcliDPthZYXgppy1z/H50Ih9+pM4MnbZsdIRNmd/0sBJR
         25CsJMCEHNBipgE6Ob7RG2B8ZxjEZBHfXwAKoOEKHPfHiLjDGMo7vN5ivs5NWnRrlAs+
         SviQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY718S+PixxkG9l3ybL+bIskPbiQRzKV2uds7mBRYp0MdzGRZhCERM9QGqPYqv4I0oC6a0ojejDb5/@vger.kernel.org
X-Gm-Message-State: AOJu0YyAxcQUW+gdPCRHviOso2gQfmVzWC7ALSfa6UJmYCM9zbYASwgK
	pIkbmmZppjmnemHId9KBlLn8NypNxUgrnqHsaDMoqOY8cssU/LzrRGrDUhhkaaKNDLZiZ4aTYKl
	PiPv5eDtPbV1zqprGWCBXi1tyenK69ruB32QCRA==
X-Gm-Gg: ASbGncsU3SaDADsdiqDpfFTeyE1a7/glczZnfg9CN6+G09KX49UbpjlEtZUGSaLjw82
	t6yRdDQv11OY7SGgaJD1vjH+zNNioBsqnwSGghChwxExrv0XG2Rz0PtayyBq8XLzsJsi+VAATJ0
	ii3cUDYF8m+LAenv+TCkwn/rEZGJquv6+k1XBdG8cpvIQEigsSIUjJB3VF
X-Google-Smtp-Source: AGHT+IG4TTEqvKKmU2492g+AukZb45PJtvegal8h8Xen11Z8QtCphiS4Y8oNyA46u4GkRFEnjLMwklQP0xpWjgnldJM=
X-Received: by 2002:a05:6512:ba6:b0:545:f4b:ed66 with SMTP id
 2adb3069b0e04-54990e5e270mr5969176e87.21.1741693562644; Tue, 11 Mar 2025
 04:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110034.53959031@erd003.prtnl>
In-Reply-To: <20250311110034.53959031@erd003.prtnl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 12:45:51 +0100
X-Gm-Features: AQ5f1Jq_7RVi4eqH6I3J4FQSDCj7bjjh65GU3qe_TbZeAh-Mej8_AfvoQOJZwNE
Message-ID: <CAMRc=MewC-7XFfWxPS7cmMycxo-62NDrUKFyjnnCbwqXQXWuZw@mail.gmail.com>
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
To: David Jander <david@protonic.nl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 11:01=E2=80=AFAM David Jander <david@protonic.nl> w=
rote:
>
> On kernel 6.13, after git revert -n fcc8b637c542 time is back to what it =
was
> on 6.12.
>

Interestingly: I cannot reproduce it. Obviously gpiofind doesn't exist
in libgpiod v2 but I'm running gpiodetect with and without reverting
these changes and am getting roughly the same results: ~0.050s real
time for 1 up to 4 chips.

Any idea why that could be? Can you reproduce it with libgpiod v2 (I
don't know why that wouldn't be the case but worth double checking).

Bart


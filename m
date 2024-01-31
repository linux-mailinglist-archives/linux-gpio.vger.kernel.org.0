Return-Path: <linux-gpio+bounces-2829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5817F844829
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E947B1F268AF
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 19:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544563E479;
	Wed, 31 Jan 2024 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YMdiFHmX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E123FB16
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 19:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706730107; cv=none; b=JjEJN/tgdPAHCr4R1vH/WS/OaMylH2DSmOoIJHOXkaCXqR4Ttr0eJefb8KLOHXz38NH1AHWlb3eS1Bt1WbpcIYjNNLKFBaRm6ffrmqCdn3x5aMayx8UvjAGMuQbQ3N6c33eWqbiizYl2WswleffZufU2lWlfmrHeXgh2vItOXuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706730107; c=relaxed/simple;
	bh=OkhClyqGGM5gqjlWyitEvXIZetTvRXEOIznDvqpU1TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoIKPDC8NduQ0wV9se18wwsBp9cY9dkHCWlECZr+AmJkyMDSaWZ2DSs/qDPPEWqjIC4UWCsZFCT3Y26P/a0CRbmKPK4I+CyPm3IJv4cyYLoYhR5tE0J2i0VfIgKSzp/QU2YnRyiVmMmYVXnIn45HVSLJvCtTrmbD59OKQTHND5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YMdiFHmX; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-602c714bdbeso803607b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 11:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706730104; x=1707334904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnoQHvAbASaPoVdTyGlmKQC9N2Jh1gEDxnnkfJ0ZHb4=;
        b=YMdiFHmXZ4YNZ83hJFGTVaJFVgCJN1eKBI0DLd8/m6U73fU/N4RryPGL56IaTHmRss
         EG5f10CeHJa9CzpxPHTG2q6DQe7hvF2kgOYkTYa0PSy2o2rrKfiAcjU2bFIGQq71QqZh
         2eDYl4jKfEN5FLu2TMjfaNFUvzeQzVfzDVB6rnFGOheXFWy4m1DIty9vCoFTOzqRVkge
         vyIhIN1WsYtDCxqoRM7hkxUS9bJtpDBx0/SHxlD5JH5UknYQ5YHbIkACoKN01PSEF+ZN
         ZVtT9/emgPH6b4Iyc4fHEnX5tGUZAUu0cnGSt1o3l4XgMFcgAN/IyMPKROkcRsIlVomW
         XXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706730104; x=1707334904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnoQHvAbASaPoVdTyGlmKQC9N2Jh1gEDxnnkfJ0ZHb4=;
        b=aMUbg411XLB1UZ8b/c0L+SWalYiZS2jUHZe2oKINcJudGreZAxa1fQaG4irir8j64/
         bh/54vb7XrizBW3kJNzQKs8DULf5Bxj11WL2PFplvphdX1X8lHlZ38hn9ng8lXROEeaN
         7CxC2l8tCMQhtozmfGNcWfQxDoYBZ39ZF06YaGVN0eRSEL8b7iqg7XEb5VSHnwzJAU7X
         FG3XAsHF3x+xjGyZmZHybTeUjQ94QocmwrOY0EM8RONzQfk0uRIMfDe3z6oentSZ+hsS
         kmWdBXrfQK4QS6G+1DurAUzobXnDr0dxpaQa0r2tk+01ek+Uf8geT+nNVgCZrI4bIb+O
         R/pQ==
X-Gm-Message-State: AOJu0Ywgrb++Hyx5CKYeyzDXv5XYG6G4z9YMxBUTh8iKCLtQ4BfUZcRt
	Fd37fiC0D09scCl6+lvh7N6Nbs0lfeQr6Ow/Q67PNaNprYVxoxtI//h4g3bKCJy5V2iOF/LX8up
	O+97KzIVEZ5GvTnX5g/wiMzI4miW3734Pek3Iag2xlJxThARi
X-Google-Smtp-Source: AGHT+IHIkxz5wbRgafyXx9pFQL6X7VgtqIYZUzIvbjFzPcOeVDH+7LFp9Qk/vLeKYy4h/WD0yWj0sJaf3erb0b5746Y=
X-Received: by 2002:a81:83cc:0:b0:604:1277:d759 with SMTP id
 t195-20020a8183cc000000b006041277d759mr1317173ywf.20.1706730104368; Wed, 31
 Jan 2024 11:41:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-8-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-8-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 20:41:33 +0100
Message-ID: <CACRpkdaqrZ5cgpnocBv4NbLfZGuW+M0uQzfCpA_A4+5wTe1J2w@mail.gmail.com>
Subject: Re: [PATCH 07/22] gpio: protect the descriptor label with SRCU
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
> In order to ensure that the label is not freed while it's being
> accessed, let's protect it with SRCU and synchronize it everytime it's
> changed.
>
> Let's modify desc_set_label() to manage the memory used for the label as
> it can only be freed once synchronize_srcu() returns.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

And this conclude the previous patches by protecting the inevitable
label with SRCU, very clever. (I wouldn't have been able to come up
with it...)
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> -#define gpiod_err(desc, fmt, ...)                                       =
      \
> -       pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : =
"?",  \
> -                ##__VA_ARGS__)
(...)

Now it is clear why you were minimizing these helpers.
(Maybe add to the commit message of that patch? "We do this
because all functions need to be changed later".)

Yours,
Linus Walleij


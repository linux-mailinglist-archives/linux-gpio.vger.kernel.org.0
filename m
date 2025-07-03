Return-Path: <linux-gpio+bounces-22775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1143AF8392
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 00:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58B04545CC5
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 22:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1872BFC80;
	Thu,  3 Jul 2025 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJJuxuyd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0332BFC70
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582356; cv=none; b=nWVz5S6ObS5GMtIj+XZtWAjSouTXrHClz/ckPlhSa6dfQU35i9aZIVcNpy3GRRdSqLxZoTdG3XF7BTWbZ+kGkPmSZvhSDFwPIyjbNFvk9tFt6AjQY2KlogT8F4Y6+sbtY42cAnGxXdALz/36IohHkvoFeL1CauR6+FmdpbbR0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582356; c=relaxed/simple;
	bh=qHiJGvw/4jGa4QsGOCrg7eO9558uRKsIgpy7SwSLppQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYnH6q0JiS3yrkdQfAqbsUhl5cmveALqnnYGVWfSlktCVXffYZSDl5TJKJzpkUjDAvEaRpDrZ2u0JZU19kxb5Np1NyCv+/EqAKnQE420CUmkMnSuXfZHYRU2xg1kJZ8a4WRgGYMdpBWXyJOlA7LSOIr/OkIHdX+01TpKG6iQn74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJJuxuyd; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553dceb342fso400687e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751582353; x=1752187153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHiJGvw/4jGa4QsGOCrg7eO9558uRKsIgpy7SwSLppQ=;
        b=fJJuxuydbWi1fBH+rZ+u6VqGTiuFmdhNuDBHoAEiA2EP/VcIBFbpuljSObYqIx3QxT
         TxXQWRpeLBS+o0Tjc/vzxU7nLvozxVMl1o4ESAXN97oLqp8IA/Bv7Agu5BMoY2g5lZ6t
         kEX+ASWGkO7JZKok0QL7tjXzeK2bfitJbzUbPGFmObpIup1Ye8EUoMCmZthC36mVTWKZ
         NFqoFBguOm7UFPp39y19cvfhIjcwCJCGoy2NDQaVo5kpH6PyDRlP/I0fkHb70K+6dUuq
         Ne+Ilfbnfihzu9qDamktPzbF7jdazBOY7MZpxW2OgfN3qyF5PfabsTXVEyMM0LM6jvD8
         JwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751582353; x=1752187153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHiJGvw/4jGa4QsGOCrg7eO9558uRKsIgpy7SwSLppQ=;
        b=bbtKq8hO/mj2ne1l/x6Fj76QIDiC9HFqNCGfxJ/oZ+xCEAAYpvajYHzRCTjK3XlrVv
         0SuHhZqIH+OdM8Kavg3I4N3Wbow3zjnK3GnD/pi5Q/CP1vdDlIfRCdRtP8jysy3hOvUQ
         0Hu5NeSppYwsalrc0g+OmjWKW8dEyMV904vqbExN7ElGAp6LvQckUtim/5UeLPY1HqSi
         wGtzVnTFAxEUeHBsYg0PRYBB7DcCcTveZkbyb7sD8q0vKTRtwaBWWnUwUCYMhPYRxQI2
         ndbg2482yEfmYrGV0pCmWZES9TnhInvbkEMLoQ1Xhi+CagkUHwzrxtZ0y1ifZgqfg3sU
         sq/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGy1PDCSZcNn64DuWFOwhHiBU3B5ryr2eZIJrTntwc/a8XrMvgta89z8MxoT1QwoKNmk8K1pIsLcct@vger.kernel.org
X-Gm-Message-State: AOJu0YyOBAG3B9Alg9Lp7hvhunpFGgBRv2y8KTKJK85cQ8zU5ZKNXx9D
	Hvlj1zgWe+zZSsPf7PRT7Vs1KFRljHdJv2oqFOS87A0PtIvrQsnb7xMvaOCzkyWYUVhrzaW6C3I
	IcSeurelj99b/397dbHLSp7X1naruJpoXppRUHPAQfA==
X-Gm-Gg: ASbGnctA8TjMW71x9S0TXpiCUwEOUMJHvoSVfPQ0TB21jxHs4vFHdNDyqhpPHznetWO
	ra4KRbGaGZmYTIirYcUNe1aEbJdahv1HdbFkCKYicslP/uEASn8ILuwHOgLZXE+1JRdR+mibG6N
	drDeoQXF0marfC+4HaiguVddcJoAy91akMfFAvmHXxv7s=
X-Google-Smtp-Source: AGHT+IGv3ck00tYjA0oJ1uAFiXX8dKOpbmMnkAsSvX3eRdG6T6/6PMHb5TEQ2nljlmc/vsAEZrYKze2AdV98N+dH7KI=
X-Received: by 2002:a05:6512:1589:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-556e73fd335mr44356e87.55.1751582352961; Thu, 03 Jul 2025
 15:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:39:01 +0200
X-Gm-Features: Ac12FXxyLpl7_cYrO9sRsqDV9GRQvTlee2Fpz1xlmG_qIRP703som7M3nlLO-ZY
Message-ID: <CACRpkdZKsfFWCKxd8QbUjrgrzHind6fJcZ0n0LeHmE1xPdUxuw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 10:45=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Note: this really is an RFC. Please don't spend too much time revieweing
> the code in detail. I'd like to figure out if that's a good approach at
> all first.

I like what I see.

Go ahead with this patch series!

I can use this to strictify other pin controllers as well.

Yours,
Linus Walleij


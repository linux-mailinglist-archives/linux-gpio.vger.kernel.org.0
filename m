Return-Path: <linux-gpio+bounces-27316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FECABF3997
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAB3B18C43F4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F016B2E62DA;
	Mon, 20 Oct 2025 20:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pvTYGHBN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20062D948F
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 20:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993690; cv=none; b=gGk31nPiouZxum82vYV94rotdR6d7Y2YfnP0Vb2c4+Y7AFp1bLbM0tD722KMhXMoAlhrQxCFEeJnZme7DYbqFqiWHaaaCM6lbuBrfUHyyMyD/7EGjuyxLf9PrZdnonBpDJEQ9W6l8jSgt6Pa0Y+zF+lNHZz6agrqerwWEjqGjT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993690; c=relaxed/simple;
	bh=oaK/JWjJE2/SR6SZ6HaM8FD8DZG7Dm8tlaeIPzqqYqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slv5P82KVuJDMWgyKe6TtA1QZWEpto6Sfzukms23Jnrdsv9OYPJ63CxwpAHOi+R3qNwfgp1zAK3KGrx3Aa+tVYJT6cRf/YZkcTWkbYTv0JDs9Y5btKl43XcOrUQy7babido4yUW8Fw+AixAlJrbSin7VbwvyX0NNlMT0Do+3HRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pvTYGHBN; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3737d09d123so46076731fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 13:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760993687; x=1761598487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaK/JWjJE2/SR6SZ6HaM8FD8DZG7Dm8tlaeIPzqqYqo=;
        b=pvTYGHBNavA0mpjXa+/P3KBUbjykfrfjSEEVqoopT5LNW32rfthDL6nyNud5G35TVh
         rZgRll+dWN2Bilg6hsXQe9bLyr0HYcKZjLKb5GZdV5GFTw1JLZRuuZj8Wg6267i3mU98
         L4uvGQZVw0ycKEg5pxQbRrLNATGqbquVFm4pUWYdUXvk5dZSKObPU6O9t2hx5Gs3T+sj
         FJZGZAUAMfp7hq+FjkOwEFAP06louhQnJ+cIKO/9pDLckEZww5FOqwRozl24Xs7Kj22S
         reqWSjJy3A4DdZqwsiBIB0dZ/BSCaAwJ3GfsSkCeFbJxmyAN48ZNLPQ8a+cptQPF5+aC
         0/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993687; x=1761598487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaK/JWjJE2/SR6SZ6HaM8FD8DZG7Dm8tlaeIPzqqYqo=;
        b=u4e7xJsznEX7mZCPL7AamOPZF2/0yGqL2vJp6vJ/hSCgv9mtUEWHg1+Krle2hr63zS
         7S3qncnVvyRCriMkraFS/T6IkGQlrFUHTSePNMYqzsQL0TRNeuHL3tdumAasFkQpeUYC
         TAE9q4NlTjS6PpsW9EF9YMAINifR6IzBOXVm4ywlG665btZGd5IFLy2/SmNH9tBNxTsr
         R0f0PbH9B/cUFtS6Dmx+kaieIvfP5Pa8K2zITfysB9nvraWA+ckjMOCP2MCrgaPwm87I
         Xb5D1B2uRCjwUeOfV5+NazZiEMdg9kL7D4mU97SYbFXo126V3VFpbTeJe/k/cFpSXykS
         Kx7g==
X-Gm-Message-State: AOJu0Yx9UY21WDAjMKMkmWDLNsgIL7ALRN+5bTngt2r1AH7HV5WkDCvp
	Wt7Ni8gFisbiIBndhd8PKCPW99KWTpB9LyfuJE0LVmo8Sx8APXGEk1MsU9IPEfj6N4+Of+DTVEw
	bBQNBkYZe5FYyezJKtvqXMmL9SxhtW6Cjj4mpzf8lz0ab8s8c6qStQMU=
X-Gm-Gg: ASbGnctX4JI8jcl2E1H8us9CDAypslyvG5P3zKu/X9mglyttDU+qTi/JGOKsbSoNQmo
	/yElaD9ggL4goF4CR/BWuC9ZP8IE5mOBn/+R/+mhlKjTOs5aLM87KZQzQJEOLRwBxcHoYybedyt
	W1VWUxtruJRJ4saJOrtj3DanUQkJau7C29Wlh/t70MOGtDWGOa5CEvJfmQMAP+lDSDLKva0gy2n
	rVRmDv8eQKC8OyS7mB8vPaSBjZANECM0EBigOy1Hk3WuZRqUNNdIvglpA1HvNh/2fEq+nc=
X-Google-Smtp-Source: AGHT+IGkEZv0k1l4p/uUPvNH35UjQXjhgT6RSG3voVwHPgqfteBI2zFP1m5yhreJdrfvetvyzUC+Bdrd+G8VOh9IYx4=
X-Received: by 2002:a2e:a98b:0:b0:376:45a3:27c0 with SMTP id
 38308e7fff4ca-37797a14390mr43192591fa.28.1760993686818; Mon, 20 Oct 2025
 13:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014-function-is-gpio-kerneldoc-v1-1-4e6940a2b37f@linaro.org>
In-Reply-To: <20251014-function-is-gpio-kerneldoc-v1-1-4e6940a2b37f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 22:54:35 +0200
X-Gm-Features: AS18NWCYx5oxW2Z3h3Y51rf2absOGahtNH72Bdb3R7MlXZRoFWbtduApQ7K2j8o
Message-ID: <CACRpkdY9_XK6bpom1KNeALRAYDfZ=JVswTVGhA+gbNLOAs1iWA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinmux: Add missing .function_is_gpio kerneldoc
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 1:03=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> This callback was undocumented, add the docs.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Fixed the grammar errors pointed out by Alexander and applied.

Yours,
Linus Walleij


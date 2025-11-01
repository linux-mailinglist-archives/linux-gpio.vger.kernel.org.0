Return-Path: <linux-gpio+bounces-27919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D65C2883B
	for <lists+linux-gpio@lfdr.de>; Sat, 01 Nov 2025 23:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 399C74E137B
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Nov 2025 22:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0329F283140;
	Sat,  1 Nov 2025 22:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/6FodcB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5731F3B87
	for <linux-gpio@vger.kernel.org>; Sat,  1 Nov 2025 22:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762037357; cv=none; b=LAOEWVgECAkNA3W+k0G1u5mCQKBWFCMQXrNtlc2E12YSjT2lI26TFOwcverhYq9/rUu8Hu8I3Pxf17/kaQJhOTIFweQu58RY+81+80XiqSGNlMVQAjp0dvd1LRWi8jUDNfKV66XHAaka7Sl2MzEnkTBgRNtOM3aQ6sNfiD1kngI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762037357; c=relaxed/simple;
	bh=9eFDsp1o4/8aVYrSUbQAIlSG2uAaNMrVWzWHNt1G/uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5hG361iOBU7UXyZSA7fr44rrFZUbhW0ArqeQkCBBamqNZ11ocCMGzQtYKr1Pw6kwP3cqqUe7/ayL6BSlMcgemE4QtK9uze3tjKI4m9Wjdqdz/jivOq9zMHSLlLimk6JqrvJymnOTvROjzUDs0TzEZD63C/FxclA6P3wJ2ao3dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/6FodcB; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378d54f657fso32894221fa.2
        for <linux-gpio@vger.kernel.org>; Sat, 01 Nov 2025 15:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762037353; x=1762642153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eFDsp1o4/8aVYrSUbQAIlSG2uAaNMrVWzWHNt1G/uc=;
        b=S/6FodcBmexDRev34m+m9SLPhNiNlLCvWL4H0QuQVY6s7wnpa6wGP0waqoaejo+PTg
         HN/9YQXTc25zfP34adzuFgoWzEj+wxvXlMsJqfBz+ZAEQ8DstTyVdfiRC2b23FDqIydu
         9beUs4J2y4dLmTlK1SrlYnhXnSEq8g3ezMFhb05I/vrJzwDttJTvzrAKy8N/XH4qnOC3
         ua1hOFaPUQFuMLud3fGvtUpELUelyA2HLFkbeUyIsZylnJOuTB6LBqMreq8frZ9B/pzn
         H++fVTQcWUwnXI0241F8CaA2hAeFoC4kigxMjjTkc+eNKvvX3vbUxY6gNmliQYCdoWDz
         DkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762037353; x=1762642153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eFDsp1o4/8aVYrSUbQAIlSG2uAaNMrVWzWHNt1G/uc=;
        b=JZNrnurCJ8dWZT3F+lEKVkbysKPAYYjDQ0LtHI+Fg9BLekmLwSSmhfKtTMSj8bfCOk
         YPBtMYiNZ+8TfvXzjwUp0gz9ORe1QLsI0nvOpStniLloUfXbmCFfaIi3hIAOlzWt8RZY
         bbCR5mev2Q5MRmYpUULlhpdJVITNGjleJvSjfRBqPI1bJa5iqMI6718RoME4wSTbHLZg
         rBesFnGp9lwy3uyavxZI+qK/EwfX870lENTf3Ry1+KI8DIMsCQ7BzCWAlNDjJyLNn60A
         F4dpTrqf2a44bG0f6KN3ojwaGTVREAdYc1l8613Y1vUvZAzvmK8KjmN0/COniRfAC7G2
         m9AA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+sq8DO3AGONOgAdpWOWn/wo6dFGJQ8hREa0NkhwZyzta4+C4pUB4S3N43RTy1mIP3sBVbzM6iHRs@vger.kernel.org
X-Gm-Message-State: AOJu0YwhzShsVWHrTvcSDhITeb267qg1BD5ReKLB21AEEeTWryQwNWhf
	It8DUv4zfWKFzdFN99NTfdlC7cZK35GLRSHsg83MnXnhD29ULS5GJg9tlUW7/dLTQhRswElGFkd
	IZefSWHRnYdaWwnlM1u83f3VN6EvjHo2f6uXuSo+VNw==
X-Gm-Gg: ASbGnctI6JkShN9wbdkW9jlnrLkDPWK3Yq3pDiraZvXKdHNn3Im0w9EGZutiaiDhWrY
	zjDl5xhZj9GG6xqPHquusU5hEev/meWlriN3exYwRkoD1S1GSIMH47PHlT63M2aQcWR0Tje/5yJ
	Cv5FC1DfFzbow3obQgz5As8KkQzw53b2iaaKS21rVRrj6c41R6Un8w58Oz5vjJyxN5kPaznS/iR
	j/J03fqj2lwLZWKjQ6LoHFcCkj3Lqex1Dd1vpR95mzLGTNo+rqCXxB1H67AQIQmWU474RE=
X-Google-Smtp-Source: AGHT+IEFjei2dnhSXzetj6BeQPK4MNRfC3hjYhc8iciIq7jhsRiPiX3k9EKQObiMXLp6AN6F8vipX1NIBfiBMmNbEV0=
X-Received: by 2002:a05:6512:3d07:b0:592:fc68:5b9d with SMTP id
 2adb3069b0e04-5941d50d137mr2589210e87.10.1762037353135; Sat, 01 Nov 2025
 15:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031150631.33592-1-brgl@bgdev.pl>
In-Reply-To: <20251031150631.33592-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Nov 2025 23:49:02 +0100
X-Gm-Features: AWmQ_bk0YEw1TXqdQKMCiJryZDzqqz0FkOVR4q7f9m3SS51PMVlmFD7M-iMyOhM
Message-ID: <CACRpkdZ9PqScxfgadaNjMZbBS2OTwYh7Eecf_jhLKWKzGJGRwA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix invalid pointer access in debugfs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 4:06=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> If the memory allocation in gpiolib_seq_start() fails, the s->private
> field remains uninitialized and is later dereferenced without checking
> in gpiolib_seq_stop(). Initialize s->private to NULL before calling
> kzalloc() and check it before dereferencing it.
>
> Fixes: e348544f7994 ("gpio: protect the list of GPIO devices with SRCU")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


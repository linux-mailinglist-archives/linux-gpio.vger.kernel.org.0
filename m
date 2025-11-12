Return-Path: <linux-gpio+bounces-28417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CCDC54C65
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 00:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDFBE4E0F33
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 23:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6C32EBB9C;
	Wed, 12 Nov 2025 23:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9ORUKvw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0E1DF736
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 23:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762988690; cv=none; b=SA+0AXtFfHrA9s6Zvn3pzf0rd1BfaabU0d2BJbw/pNm+9I+oURqSwy6XbhLch5nHnrB0LPEQeFp+Xd3sfli/CgekAgXtLmDpGhoqC1YY8F6oxkIxdPv6gYUYcdVVSfBtJgla0IT9M4cD4FXN9Jo5HSESXgJsDBV1TA3Z61mFXHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762988690; c=relaxed/simple;
	bh=ePb3+WnqfOOCNnILjGCw4smH5j4z81BDW0dbUUEnCu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHBwcgaHaoQtwohNvLEsZBt0rjhyqGufUyESgSF2MF4TG7uScWuApP7jdUns8bGGxsDBY5ml2QecaniN5bNCuOtluPQbjT5im/MmYf9E50LxXADs5oK3iZ8zxz7Q1W8b2WwDc9xiJqvm5F63obCzvjEOdUrapaaEbRzUCU4bT6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9ORUKvw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-592f7e50da2so330585e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 15:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762988685; x=1763593485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePb3+WnqfOOCNnILjGCw4smH5j4z81BDW0dbUUEnCu4=;
        b=B9ORUKvwM0h6Q5eY7ZLeYgVlH+1oepsf9GzLbU1GRjIM/a966d0L2zTwlPVBr7eU0g
         PkufAHA9XDHhJtT05u3RDSjIXpNTJKQX/yX7nC93kMbUZHQ0xOV1/OSNeAC+Xl3MogaR
         ouPfy08qo5NtKk6hFXksnGaOSBWy1I7U4Ph8R30OyxjfBTUIyNJa/XF6yG/UtPs1nKOp
         H32veD+OVwj3vcXjQfHgQPii0C7SjkXnf6a+O1z48mxu5l8xo4d3dsqlzlSSTq/CoPcU
         GGGDONzBiERkbLPOKkdg6O+RWa5vs6BxFTGRKY9wthALdqYe5woGVxRg2lcTkDvusLE+
         HIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762988685; x=1763593485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePb3+WnqfOOCNnILjGCw4smH5j4z81BDW0dbUUEnCu4=;
        b=vySu+zueVIpbKIYwUJ1UmuTq2g/TjYcJf4fN8ITPYsnogM9Eu2yIcGYvaWoJ4Q+Oas
         xsrCNINOlTGutlwT3MIwKNlisQtriaJxbesoKxYu1W8zrj8j06Omj0Z/QVJfENDQGoDr
         BBDw3tIwIM6CtluWJeoZZ7OWkq0J0grquLDe9yIZzt5/fvmuD0xIcJTni9xNN9LmZfj/
         QRIMLAV/FHdkhId/sZfqyP6iHXsJLYNBflHgRHqNGis8k7wBhbOqFzvsrYWvycUBRlKU
         +gxYh+KAdSuwf5JNNLmPLNlUhNAMZxmzfB5CNPQKzYE5E//DG1MDEa/WoPA9/SRbAHEZ
         /rFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtkX+L8dCqBxPn6B18xUtuykR6129+VqTzz2yu3W7hF4ffCfBg9vVC6M9zI8g4BeszgGam95oo9akc@vger.kernel.org
X-Gm-Message-State: AOJu0YwVdreG84hxzOaFlwgKBcp7zpyHdiQS/hK/UDPwCjXvDiNdP7z2
	H6YD5L6OoKRDhGMSTY3vrjoLpq/qrJt7u5KE6s5IQnyN9sngSlISi2X17ZXesROMK8Zi2kGY4/A
	oMAOkQuBlENQKRSuA3AxhoMkDmcO+oH38gCRnXlk8dA==
X-Gm-Gg: ASbGncsJB94UsguiXjn2P7gq7lyDk60NPpFweQDZTsnq2obqDjS0BI7CjK3TGJ/Awmx
	9vdY/hb7538zq0XxMuWmLl5xgu38sGo8z09yrGL+FZyUNRf9zjVCQrT3ZWanTpvbwUDFXKAmojs
	aNjDs4OJ58fMxLxw2HqixZNZwwSmVRHa3cZ+LDvvMm8wgfBUD2IKXSiKAoFBy172sjg/SSvnys8
	3nviyMbMOgTZueLRbkYr7NZrC6jQA6LSzBUFtsYunf4+XDbmtff5EAH6fSLNvafUSvG3Nw=
X-Google-Smtp-Source: AGHT+IE1BF4Vv10l/Sjj6kBtQfn8UzqdYZU/iJmxP7Ig3hG1/jtYcI0ag1MxBYaDfkNDF6y/ADJNCl19evcJlZ4su28=
X-Received: by 2002:a05:6512:b8a:b0:591:c8ef:f838 with SMTP id
 2adb3069b0e04-5957ecc2749mr332999e87.17.1762988685375; Wed, 12 Nov 2025
 15:04:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Nov 2025 00:04:33 +0100
X-Gm-Features: AWmQ_bmnNGj_Wxq99lzqQymduEdozG5iRqVkyE6m_DF6KCgBqogfvoiry7COaZQ
Message-ID: <CACRpkdbv1wZmLRu+r4PoxqACBa3TGzqnhAq9LvxqF_w7Q+rXwA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?B?TGV2ZW50ZSBSw6l2w6lzeg==?= <levente.revesz@eilabs.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> From: Levente R=C3=A9v=C3=A9sz <levente.revesz@eilabs.com>
>
> I went through all the datasheets and created this note listing
> chip functions and register layouts.
>
> Signed-off-by: Levente R=C3=A9v=C3=A9sz <levente.revesz@eilabs.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Impressive.
Just taking the time and adding some docs for this very popular
GPIO expander is worth an applause because of the general
friendliness for developers.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


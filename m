Return-Path: <linux-gpio+bounces-13371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDAC9DFBEA
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 09:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAAACB20FC8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 08:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BD81F9ABD;
	Mon,  2 Dec 2024 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NcQ+J1lK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A501F9EAA
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733128124; cv=none; b=asv+XbPk01mWgwPK9d2/S6X8qHImCliaMiGy4liGj734U36eYl+x8KGvYrp8Klp5J/GPIhG2OXNI08Ff7ar2t5T6JpSsw4rdhO5tywq44hwsr3+RZNLm0ge3jq1h9hGjdXtz9FJLKVGC3+XJsyY9qKdPCn7kN0knqcud5B3mv2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733128124; c=relaxed/simple;
	bh=5JV3gAlPUo0XXSWSO7i8jvQiKD+1lNY6362eKKQVPfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0PuzFlJTRKUU8eeBxOX7etx9qhefq7cFXD4ybVNoZD2qqMbKdhxeBlic5FOmQObJjXE6P/vuxcvCIK5/4t/XkpADDz9aihaGXRIPdG7YIbHirxRmYYTL4oxrJrBbAVE2h8BD7mybwag2unfnWkrlaQHilgyIOTjDvuS8GiLlp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NcQ+J1lK; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dde5262fdso4327218e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 00:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733128120; x=1733732920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lA2R5yBGG1AlxEJkdWe3WNZKH3ahCkbkWHPXpKdHbM=;
        b=NcQ+J1lKBtMZTXn50uPHuPGVWSScRxvIvVnVmUuO/ShQTIg70NNq+FCJLJM1hav6fS
         j5Zu4GHgCl+QRwNC2ZNVSAVQRNqbvjNbikGxr3s7b9Njyv3Ivd2sFGvSJ7UYuybMsvBB
         UcdpNq7gfL6QRWT5f/z/krZ/lXGIXxXOLFqg8wGhctyVd/PUjTfhEa5iZkLiMBhaMWNW
         KRaguyD1XvmUij6tjDVkf9vdJsLtnyIfRR9N6qO8pABX2G/wIc73Qahxl/m/SzKbv+L4
         vpMtWevOvq9Kx6zafWUVLnVATQH0LOgGCUR3iOzG/udXfjPIGRv3I9hTF7kezpEZ6a52
         L9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733128120; x=1733732920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lA2R5yBGG1AlxEJkdWe3WNZKH3ahCkbkWHPXpKdHbM=;
        b=uEwJrlqpca+isBLMz3cUrRiAIplrU79bVMJenteS0Qfnz91D8Puu6b3HdH0YW5EHKk
         ZdUbrVZbxirF75VKgzDYb1LASrFEVGwm0S3YLfs97Lil4F3k/m7kyoTv7MO3Ma3fQwjp
         WrFoBKHwE3Cb4X72EfaW8ruDNFQW5aeOaf8f+QDJmY91sajz/V1DjXyRHxBM7c/9ELok
         sN97BlNLwbImX6VyveUFFeOHfOsblyu1YtLU4hJ2i9B39cyeN4f1pjgIErgXIruLio5P
         UVmw6gQA0U1qQUixNv9Xgrc34GpjhawE4VChpYmEL4w7PTyWoWLnF9ebBZhWdaBrsNTy
         75JQ==
X-Gm-Message-State: AOJu0YwRf2w8c+OKnnzvuq+ZB9HbBO8zH02dh8gEOiGhWZmDHGB+YhD0
	+y6/WEYIqDLjhJROg7e3AJvV290razJu4NHzjMMxUz9QFWekVTsfwuE38SLlB1pmkmE1a1Zj0zi
	5VzN2QVM7GxJISrIWZnT2ggCtSwbuKw3yfpegOYMZQdG3BZDkpCg=
X-Gm-Gg: ASbGncsVG10r0lScz057WYCjyWjag8rDFLaBIp2HTTX962eqx4vANjlYeCKYgkoWp4p
	4ukJ9TXpE15QkzKKd3lBqIt0+eWeTrJmRLD6yUIbsDQotk7PNq5aXIdt+/tmnqWQ=
X-Google-Smtp-Source: AGHT+IEKXBFbXyaJPIBH/O9HSmq32tEtI9jixt/ErrdbKjxus9+PENdH3cSCYJcPu4pst5tE+gHj9KaRYFFg/hpZurc=
X-Received: by 2002:a05:6512:124e:b0:53d:e4d2:bb3 with SMTP id
 2adb3069b0e04-53df0114870mr11805772e87.50.1733128119793; Mon, 02 Dec 2024
 00:28:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241130201516.18034-1-george@george-graphics.co.uk> <20241201231313.42935-1-george@george-graphics.co.uk>
In-Reply-To: <20241201231313.42935-1-george@george-graphics.co.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Dec 2024 09:28:28 +0100
Message-ID: <CAMRc=Md0DsRaSXenO8D-4VD4aXtaxF7rUKBd2xhLZLxK9qx4zA@mail.gmail.com>
Subject: Re: [PATCH] libgpiod: bindings: python: Fix PyDict_Next contiguous
 assumption and pypy
To: George Harker <george@george-graphics.co.uk>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 12:15=E2=80=AFAM George Harker
<george@george-graphics.co.uk> wrote:
>
> PyDict_Next does not guarantee pos is contiguous, and pypy increments
> past the end of the dict size.  Patch fixes reliance on pos for construct=
ing
> args for gpiod call.
>
> As per discussion here https://github.com/pypy/pypy/issues/5142
>

Ah, it's right there in the documentation too[1]:

"Its value represents offsets within the internal dictionary
structure, and since the structure is sparse, the offsets are not
consecutive."

Thanks for the catch.

I wasn't aware pypy actually reimplements the entire C API of cpython.
How would I go about building libgpiod python bindings with pypy?

Bart

[1] https://docs.python.org/3/c-api/dict.html#c.PyDict_Next


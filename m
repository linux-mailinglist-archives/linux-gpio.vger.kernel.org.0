Return-Path: <linux-gpio+bounces-11057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C36995029
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0DCE1C21D98
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202601DF27C;
	Tue,  8 Oct 2024 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bXb+lPnj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A741DEFF8
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394362; cv=none; b=psluYikKngHFYIMMuIwK4/e+krnSTZiMY9oR5ABFWoW7d6gNQ4S/ueckwiyTGcyQCr92L8Tc0IwdSo0JtVRURjxqhnNAyq6KXuPRYUwWpnDqBfJg8PJqkVmbHXB/NYwYuLdoXMW2Dtq+eeB9za7gJFGM3PWeWyVUXTc2hc4+D6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394362; c=relaxed/simple;
	bh=yAo35rmKwBhSjdeJy8AAAas8p56aiaEe3cIxNJHjz2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/VHMfZcUZOahVCOjppPUxbCL1q6biRexT7nJVc//1XEYw4u9W2xeHWsqAGkAXqGBtk+3UcFNp4ZMSQAVNea/7PiUlSH5vnHZKzUg0Gs+KJnZyL2Dn+BJdRH9dq4SH+ubj76PszDYklrB6RUqyxn5puc9zS/AryrzzHw+WtOtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bXb+lPnj; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so56190831fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728394359; x=1728999159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQ8Ap5sNMfkmHkWcKyBCjfIYcugUr6Rl53KkoEeTz9k=;
        b=bXb+lPnjLWEJWAY61BN28zctuiSQk25ut2KXHAZdp/RmJhA1xny/Fe+a6ne1zE0Ik3
         218S9wGQEOCgudoWhyzTM88/zlaUmOPXkwzaviSOEYlZb0uyIqhwsogeZvnhn0A3vSWL
         5hwO3Mq/+1s6HAg9AQPqQeFPHkw489i6EOeP3cxcjLLEKgQHAe53NJ/dwBycYS+t0UYq
         iqRcAQ6vnh7z97b0qOTUk2JYFR3meGwJxW+EQ0/ze1l0sI07AsUAxxuQuOwmJJgualyB
         6zqltiaBBu/F14s30yMS/07ceBSyyuEqh4kCtPVI4YUOVXr3fT8+StaDv/OpsyTuwBGX
         +GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394359; x=1728999159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQ8Ap5sNMfkmHkWcKyBCjfIYcugUr6Rl53KkoEeTz9k=;
        b=irD4S4KR8ktdaXMQ3Is1haqLfVVZUatx5hyDMSXYbFu5xT3LQoUS3YQo0af9UmnJRk
         TtBXSe/1jWZDNrqd7mtN/rhkROLPWg5uKV3N3BkQ5ZZ0dRECbIfeZx55BiM/Xleeqorb
         o7U3d0VCGcT2ku+sOD7lAjUf2HH9ntSHsfX3Y7MMrKhBZ7STQ4hm8uVhc0rx5qfg3dW5
         VAy6ChIQEmJEoJaqv2YurctccnvGcb0prGyBN64ggynbitpPpRTk7GJitTutyq3nk4Mp
         PtvRZeIKtZYNgOhc1kEbOeb4mBwZ1rrX5AUZ99bbBVH+WzrBtfosqaXCkNkXzKglMq0Z
         7e4A==
X-Gm-Message-State: AOJu0Yz8NtfYMMIgww7Sf1JCgrrRRCiOvoJmQ8n9ZKHSLhV7rZDmbVOC
	mny2hzXBAlGRjzZGPkrTflVrEOhuOEFl/ZeiHHbSB9zqe9bHT+n87avMWj7IU4NeVUFTrCsKyjZ
	BAipjkmk9RuIDynYnc80jefS2aYTDBDtPtz90ow==
X-Google-Smtp-Source: AGHT+IEwu7JMajQ4VtcuZfWzL46Ede/Y7AkHvDDK6Avwal4kJgu65JrHN6mA1uksjvXIHxdYPDIZvY0kGQ02N3JJdpU=
X-Received: by 2002:a2e:b889:0:b0:2f9:cc40:6afe with SMTP id
 38308e7fff4ca-2faf3c1cab4mr79587911fa.14.1728394359105; Tue, 08 Oct 2024
 06:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-18-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-18-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:32:27 +0200
Message-ID: <CAMRc=Mf8_Opks07HmruFTYvt9n9MHM02ykQYUoFcfofHv0NA6w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 18/22] bindings: python: tests: add missing type annotations
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/tests/helpers.py             |   6 +-
>  bindings/python/tests/tests_chip.py          |  68 +++++-----
>  bindings/python/tests/tests_chip_info.py     |  14 +-
>  bindings/python/tests/tests_edge_event.py    |  32 ++---
>  bindings/python/tests/tests_info_event.py    |  38 +++---
>  bindings/python/tests/tests_line.py          |   2 +-
>  bindings/python/tests/tests_line_info.py     |  22 ++--
>  bindings/python/tests/tests_line_request.py  | 184 +++++++++++++--------=
------
>  bindings/python/tests/tests_line_settings.py |  12 +-
>  bindings/python/tests/tests_module.py        |  20 +--
>  10 files changed, 200 insertions(+), 198 deletions(-)
>
> diff --git a/bindings/python/tests/helpers.py b/bindings/python/tests/hel=
pers.py
> index f9a15e8e33f62ad63923bddedc206022eabe96b4..d327da2816594655cec5a76e0=
24e31ff978d5d93 100644
> --- a/bindings/python/tests/helpers.py
> +++ b/bindings/python/tests/helpers.py
> @@ -5,12 +5,12 @@ import os
>
>
>  class LinkGuard:
> -    def __init__(self, src, dst):
> +    def __init__(self, src: str, dst: str) -> None:
>          self.src =3D src
>          self.dst =3D dst
>
> -    def __enter__(self):
> +    def __enter__(self) -> None:
>          os.symlink(self.src, self.dst)
>
> -    def __exit__(self, type, val, tb):
> +    def __exit__(self, type, val, tb) -> None:  # type: ignore[no-untype=
d-def]
>          os.unlink(self.dst)
> diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/=
tests_chip.py
> index 9110bebf3596557fbacb3c7620e931982f9dc957..9c8f87579469e684ed3b6a5db=
cef35e0856127ba 100644
> --- a/bindings/python/tests/tests_chip.py
> +++ b/bindings/python/tests/tests_chip.py
> @@ -12,19 +12,19 @@ from .helpers import LinkGuard
>
>
>  class ChipConstructor(TestCase):
> -    def test_open_existing_chip(self):
> +    def test_open_existing_chip(self) -> None:
>          sim =3D gpiosim.Chip()
>

I admit I don't know any better but does it really make sense to do it
for individual test cases?

Bart


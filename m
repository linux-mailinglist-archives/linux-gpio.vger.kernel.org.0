Return-Path: <linux-gpio+bounces-11041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B718994DA4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26FDF1F21BF7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655841C9B99;
	Tue,  8 Oct 2024 13:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v35XlCkw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DA71DE8A0
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392862; cv=none; b=cIDv7CrXrU4A0JuX7THLFmQTAvdtjyMRjpFgtXgt8CbaNCCYkgqx3YI27ijSY6QVCEis8ysOKXLJEhLOQ6NO8FB/sVQXWeLi+9K6W2f7Ho4PjJpMxOZNV3OzxLLIyMLfNYJ5lWCzXNg8iihBEGVgBklg2vl4pVLyAeyR8xFD8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392862; c=relaxed/simple;
	bh=zduhSTnJIlqbfqAswC1Nk38ZLIzswGJyMvB4gGTTN/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eW25x8lYXcD5a0CXaabc23b2gU/HRG3E8b1dRTHRnDgfcHg+UV5TghPco6gbw5p7G3qH0oNelGVGKD7oEn3FmeNOvuQdkphIyWfaSFsUPXeZMJnkS7j1DWNCQh7f2i5CcCHdlVJwAyIMUD0CCvlZJUKiMNNasf3yd2UzwVfi8VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v35XlCkw; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398b2f43b9so6058226e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728392858; x=1728997658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvVXW1geYIiC0Z2WcBtMzJ8OY5T4uKuXt/AzoWoLzOA=;
        b=v35XlCkwT9mLYHzVGekLNRz5BjjdO5/MM01nsZ8zcaHj6ZWT/QZKDZoMLxRykFSN4p
         uRUGpVb0Dczx0MQY/jKop18rGflvYqvvq4C6tIE5m+fX1pxA/mmsIExacc887z/1Sq6e
         hOnOlyaJ01z81CVKumL+yNEkBDS8bsjN7f6npi2Pk+0GDpSfsfDlxQ/fL+w2hFJY/Hwu
         qugklvEZn6ZU+pCK1soK3LaI1M5jJFwWfY8VPMS3OyRMZia692yEgPJQuC1WV1ebJFTu
         GF+o+BJDC8WyK0YgMCBU4y9YuAZDFqmAwoo73z/8lhc5u9C4D8w6Sf9JX+UmkPPy7HJW
         YK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728392858; x=1728997658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvVXW1geYIiC0Z2WcBtMzJ8OY5T4uKuXt/AzoWoLzOA=;
        b=heljJWYJkeAcLTfJ9Ngg8oObedVLRzp1dZ0VdXbbiuj+8rKJVbNOHLXcVMpPgpgNqm
         1uLWV8YX83/GWNilgLIt/QKU3i6cBMjbjO+JpGXfXX5Sus4AgEzfS/rNy5PXbkpPmIDy
         zfuucX5imSeyv2wCiTqI1aokSQzw1mxbshYSJnbSK6yk66iW+LHHjaGTG91iflAPhuXg
         GsbYUmBZykpbDrVmGNF8h/nRd2Yu6xdyyUpXEeoxIL2YDMeWgDoDUjEbHNngvI4S1mxx
         4e5a/PZnhD+MPHbNWWJY00m3okdWy480NHcDCB+8ZYObtiqaaeKPZ+fM2jadunUD9k8+
         q44A==
X-Gm-Message-State: AOJu0YybRyo2Wcjz0Me39miVREhWhWl1d9nuvSdBcvyG3GZjAALicML4
	qabG49pY1gS4r9jSMnI+5Q5JpyUADb8xn2SMH0xNUkxf6zJqyNfVGoWbKsU1d1sdnve/MopKgNx
	uhXSDrUdbgHQE5zOmWR36zzWBi/hMoojTgFTE3w==
X-Google-Smtp-Source: AGHT+IFa6enLUIaIrPk4anhQYbNgv5Ks8q9Jx3xPW6U+r/oHqFQO+vVXzrGi9U9vhmi02w4A0hPs6zVv9kOhVhSTwZ0=
X-Received: by 2002:a05:6512:3b0e:b0:52e:fef4:2cab with SMTP id
 2adb3069b0e04-539c2b0d111mr16439e87.2.1728392857992; Tue, 08 Oct 2024
 06:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-4-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-4-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:07:26 +0200
Message-ID: <CAMRc=Mes2jxCmGJOExiGhWfpq7=vHFgznkMzF9CmuUrAP3gbGg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 04/22] bindings: python: add missing method type annotations
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 9:05=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Explicitly define the arguments for `gpiod.request_lines` so there is a
> clearer linkage with the underlying `Chip.request_lines` interface.
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/gpiod/__init__.py      | 17 +++++++++++++++--
>  bindings/python/gpiod/chip.py          | 12 ++++++++++--
>  bindings/python/gpiod/chip_info.py     |  2 +-
>  bindings/python/gpiod/edge_event.py    |  2 +-
>  bindings/python/gpiod/exception.py     |  4 ++--
>  bindings/python/gpiod/info_event.py    |  2 +-
>  bindings/python/gpiod/line.py          |  2 +-
>  bindings/python/gpiod/line_info.py     |  2 +-
>  bindings/python/gpiod/line_request.py  | 16 ++++++++++++----
>  bindings/python/gpiod/line_settings.py |  4 ++--
>  10 files changed, 46 insertions(+), 17 deletions(-)
>
> diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__=
init__.py
> index 4d916f7f1a4eabd8ad1b2844262c20ed01a0798c..3cf39d61f64c3888584cd2518=
787b8e17e185ed2 100644
> --- a/bindings/python/gpiod/__init__.py
> +++ b/bindings/python/gpiod/__init__.py
> @@ -7,6 +7,8 @@ Python bindings for libgpiod.
>  This module wraps the native C API of libgpiod in a set of python classe=
s.
>  """
>
> +from typing import Optional, Union
> +
>  from . import (
>      _ext,
>      chip,
> @@ -83,7 +85,13 @@ def is_gpiochip_device(path: str) -> bool:
>      return _ext.is_gpiochip_device(path)
>
>
> -def request_lines(path: str, *args, **kwargs) -> LineRequest:
> +def request_lines(
> +    path: str,
> +    config: dict[Union[tuple[Union[int, str], ...], int, str], Optional[=
LineSettings]],
> +    consumer: Optional[str] =3D None,
> +    event_buffer_size: Optional[int] =3D None,
> +    output_values: Optional[dict[Union[int, str], line.Value]] =3D None,
> +) -> LineRequest:
>      """
>      Open a GPIO chip pointed to by 'path', request lines according to th=
e
>      configuration arguments, close the chip and return the request objec=
t.
> @@ -99,4 +107,9 @@ def request_lines(path: str, *args, **kwargs) -> LineR=
equest:
>        Returns a new LineRequest object.
>      """
>      with Chip(path) as chip:
> -        return chip.request_lines(*args, **kwargs)
> +        return chip.request_lines(
> +            config=3Dconfig,
> +            consumer=3Dconsumer,
> +            event_buffer_size=3Devent_buffer_size,
> +            output_values=3Doutput_values,
> +        )

IMO this and the rest of this patch should become separate commits.
Otherwise looks good.

Bart


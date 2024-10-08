Return-Path: <linux-gpio+bounces-11036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F089946C2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFEF21F21D9F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 11:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45131D318A;
	Tue,  8 Oct 2024 11:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TvFgMBwC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CF41CF7A2
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386661; cv=none; b=J3I6v4BvZwiPs2vE+EuL/j/LTedVpWCDrp2OSs84xUhHmaPhIlWKaW6IaUKGN1Yx+Vrg/M9v2f3enbHlE9RFs/CuSxCMRMma3BaYo8Da2Ee3e+37WB9SNhWiN18TRsWDeM6gpDmBinMbFLwVk/47uMsY+XbBWg4IRvmLQjzEalY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386661; c=relaxed/simple;
	bh=qrZwyj2OiyA38FmfDbni6i0m9jPXOMicf61zLJc3awg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBybW26Nqrnibsn4HhEuns8j7aZDcGF35HKBXWE5Ac1m0/zFKVXls7iTyGejpfasTflSzZRHzyH7ltQf/A2qlMQrwMZWP8t+epqwkn4I4llEwypYJ95iJcrNXP2mzCLoz6xA6tu8binYESb+A4Uy6LwHXPSvFlQSWGsEu1cB+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TvFgMBwC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fabc9bc5dfso62260101fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 04:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728386658; x=1728991458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoCLv8IIogdMAukcaogeava6N+RNe9O91LYYmKsVei8=;
        b=TvFgMBwCzP0oj4R9DquhZINRtpBLblGuG3SseidbLZggXH92sdx2vNr0yZuvIBISRQ
         XSknEIe6GktT0UnqcbZFpuxSAkFe6wHtvIWBWjA3j6VSK+bhQVw9QU047v45adGJtSS5
         //Qf6XJxDpFNlPQIhtHUD5yRFYfzdX2xjZ2Ns2V6SJqbdZ32R9ZLyO59coJWoV0MkX2/
         S2/5nEslIJnKmGYCDM5bKW50RG8zqEZmdf+vi09X3MZmAufowJVWlnVMM7AbQWbDZNUk
         p3eodXalv17Hsb/MWJQExP8ctd72TwQ5iViElafoG4A+qArNylWPvETVxGnCfKETRFGJ
         pLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728386658; x=1728991458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoCLv8IIogdMAukcaogeava6N+RNe9O91LYYmKsVei8=;
        b=uC/oiVK5mxEd/Lxh18PAuGgC+F5V9vDHi/ERoa/E7KTPs8PtxchlyQyfEsMGiJdQt4
         S0FSJDQsoyicTX+EqFRyATjuuyfcPzJs77LJIKalWdDf8N7PBT2dwDlWWYOJl8wlx9Kx
         +VTo8S9XQ6VNRQqBHjoxze25XL91YIsZEzVAXrLCQEL3iLlNbCGmKbJEgs+pKRFZY4Tm
         NYnkn7wD11Rwv4x7HDC4CKSDwB1dVgyVoHselgUHq8EU60RXIW9ZYbEM7BdNEqXDNl6Z
         vwuNRevVkQW0G7ZwXBR+1V6+hAH46iuQ3kqHVCq5DqJb5VaVmyJY1dhjxQPdbDJyIBEW
         yfrw==
X-Gm-Message-State: AOJu0YzwthdgYLo2Jrk7zwrajFKTig3hYn6F1vcqJn1M2xTYcqI5NyNi
	+U50+eVtTHHEkpscGOnsCOmLY+jKCXuJXmqLmZrP3twCPyXvBA2LthOFXjBVx1wSKhWKJ0LMCtP
	vlji809ZNuVMMadvc43cFqJxC30RnETZPXJoKTQ==
X-Google-Smtp-Source: AGHT+IGJqDe9pBUG1R9Vql6HOVm1E9xm7/00UeZYAtzbsEyRjdlMmd5QAhWYC8pZN2+/W6ij2+JwHJuQg3gEO4h7OXM=
X-Received: by 2002:a2e:d1a:0:b0:2fa:fc41:cf85 with SMTP id
 38308e7fff4ca-2fafc41d302mr37564231fa.36.1728386657778; Tue, 08 Oct 2024
 04:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-2-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-2-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 13:24:06 +0200
Message-ID: <CAMRc=MfqT0jFDsXz1P7fQANNM64ZuraNO8MwGwWQ7fy09iLSLA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 02/22] bindings: python: make internal a private submodule
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 9:05=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> The internal submodule shouldn't be exposed as part of the public
> interface, so mark it private following PEP 8 convention [0].
>
> Also, add a type annotation to `sec` for its possible types.
>
> [0]: https://peps.python.org/pep-0008/#public-and-internal-interfaces
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/gpiod/{internal.py =3D> _internal.py} | 1 +
>  bindings/python/gpiod/chip.py                       | 2 +-
>  bindings/python/gpiod/line_request.py               | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/_i=
nternal.py
> similarity index 94%
> rename from bindings/python/gpiod/internal.py
> rename to bindings/python/gpiod/_internal.py
> index d1e95e4ade3146f596643d52207b367e332e6f7e..c9b5d2850389d5314a12bf6d1=
51774a96469a085 100644
> --- a/bindings/python/gpiod/internal.py
> +++ b/bindings/python/gpiod/_internal.py
> @@ -9,6 +9,7 @@ __all__ =3D ["poll_fd"]
>
>
>  def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] =3D None=
) -> bool:
> +    sec: Union[float, None]

This has nothing to do with marking internal as private. Can this be a
separate commit?

Otherwise, looks good.

Bart

>      if isinstance(timeout, timedelta):
>          sec =3D timeout.total_seconds()
>      else:
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.p=
y
> index 257a31eba8d19634fd14e3b1d33a1345a0363946..1a1bba4d6dd9e840a60394f1b=
74903f6ad15a0f4 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -7,10 +7,10 @@ from errno import ENOENT
>  from typing import Optional, Union
>
>  from . import _ext
> +from ._internal import poll_fd
>  from .chip_info import ChipInfo
>  from .exception import ChipClosedError
>  from .info_event import InfoEvent
> -from .internal import poll_fd
>  from .line import Value
>  from .line_info import LineInfo
>  from .line_request import LineRequest
> diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpio=
d/line_request.py
> index e48830450dcb5b7fa6c7983a0fe074cd9bd32ab7..154174872e488fa478b27f5e8=
3d65e6040aca367 100644
> --- a/bindings/python/gpiod/line_request.py
> +++ b/bindings/python/gpiod/line_request.py
> @@ -6,9 +6,9 @@ from datetime import timedelta
>  from typing import Optional, Union
>
>  from . import _ext
> +from ._internal import poll_fd
>  from .edge_event import EdgeEvent
>  from .exception import RequestReleasedError
> -from .internal import poll_fd
>  from .line import Value
>  from .line_settings import LineSettings, _line_settings_to_ext
>
>
> --
> 2.34.1
>


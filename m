Return-Path: <linux-gpio+bounces-7676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B739167E3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 14:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1586D282C69
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 12:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E4114B091;
	Tue, 25 Jun 2024 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0xVbEJ4f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7196314831F
	for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719318765; cv=none; b=R6k0usySZrJ8F17oWa1RjJEkUZ7o+uAcY9Yk6P6BYj76+VlHWThZAp/bUVWPmTOQA7N4cYOC9CAyYuJ1w3sw1SOswgzvUczjU7Q/YDyF9OXl/MWVyI/b9TiXAfk/sGIzRRPm7UWFIZicNCqIlB4gP160t2nji2XyTknMT31HSA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719318765; c=relaxed/simple;
	bh=npuxaR5wpDYRwn3JioQC88IjTmpRt2yu92SORcY/zxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOE34bF59j3D9SEi3GnCxVRtwu9IThKB4E8XYJ6w2KtI4ud+Cn4XVfSiNx5QXW8VQpjF7Y9ImChpciaumtk2cR2UkSnvhHR5PNJXfJL8NldSus9lxCH3j+z6JFH42zad1taOHyK+gP7TVBzEtkTppjhydBGedvmIAA0DxotaufA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0xVbEJ4f; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so88516531fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719318761; x=1719923561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9FMhJDihsQQ6Ae5Ho8T7MCq3Dz9EZHsXL+elGLqK9g=;
        b=0xVbEJ4fwGpELAl9Lh3Q+DUjhop6qc2eeAY3OWbh9uINd35pBakTo5A1dbnQPlkx37
         nQJT3RJZpb8ckll6QFg+pl29XBSIvOwo0kNmejRgPDe/swlAM/E7Kk0P0IsicMABep+3
         3KGdc2B7mN1EJB0SjrAfnkzID0vDoHTGqVHlVQ3uBzgJARt/EbbV1mu0Jjk9fA0GaXzo
         iWh2Anm1Xb8AglX4hhfXtYrBQGwOiBbQKb56nK9c8U5X7PN4Kc0RNG99yvxxfKRs0Zkz
         bFOpzOT3VrPRAyx967ImxpxIwumF18dMExdtCbAz1B23MTjUeUbPWa6GQeJANyRFiIod
         pARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318761; x=1719923561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9FMhJDihsQQ6Ae5Ho8T7MCq3Dz9EZHsXL+elGLqK9g=;
        b=JDmnoPXRuJaQGQR1a7yefRUAq0/OyehOuHQyEuMdJ36oLUanzFuqLOrph2EXo6UcPZ
         ymsdyTo89x91NQHk9wQrBPedjS6vxR+WkfmS3cH51VHbqz4iScamUikYOMiYlsJUir8i
         381VxOYe80O1SPCXXuBQAZnB4iCxXN6kKHB8TvqoVt9cXgU+KnsB2mp0tfcbaMFX5A6H
         opZagIlYa6qXv0W6sW/MF0nMKekOQtCyo1HrUL3icyOtMcX5CrCiG8l4hPg56jQ7CIlg
         PhvXHXl+wDPabd6zCsrwGbT7yX7RwnoBk5fqeoAfM5UDpOGLklo3eVeQvCeuhRNMXSmf
         aZKQ==
X-Gm-Message-State: AOJu0Yx9U+NupwRZGx07u0ZfSUB/NrXGfBEqC5ZBqj4jDTH54hZ4cS/J
	Pgf+10zugA7dYZVg2RwNmb+CpI6gaCP6oDqGEJRIH2R/O5dRHtUfLlSlsrj1PoEU/eWFDQu93Rv
	7eazrRxocEb+dKlYDdSvFXc4MGHBUkugXtW0Lpw==
X-Google-Smtp-Source: AGHT+IGvK8CYQZTUnrMePYCsOgUHOwp9rPTJM0BfnXig4JtkQ6Ugs+N1U77l4Hcsd8xxw6r5wWOPA5L31l21sZ259Zs=
X-Received: by 2002:a05:651c:22f:b0:2ec:1708:4db5 with SMTP id
 38308e7fff4ca-2ec5b339debmr46243171fa.51.1719318761404; Tue, 25 Jun 2024
 05:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625011522.1470733-1-chuang+git@melty.land>
In-Reply-To: <20240625011522.1470733-1-chuang+git@melty.land>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Jun 2024 14:32:29 +0200
Message-ID: <CAMRc=McqwTYXVgoKGEv5gN+paeZq=HumA5gzOdhbsXh=e+etfQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: fix LineRequest.set_value
 only works for the last entry
To: chuang+git@melty.land
Cc: linux-gpio@vger.kernel.org, Chuang Zhu <git@chuang.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 3:25=E2=80=AFAM <chuang+git@melty.land> wrote:
>
> From: Chuang Zhu <git@chuang.cz>
>
> When multiple entries are requested using line names in
> Chip.request_lines, only the the last entry is added to
> LineRequest._name_map, causing a ValueError when trying to use
> LineRequest.set_value on any former entries.
>
> >>> import gpiod
> >>> lr =3D gpiod.Chip('/dev/gpiochip0').request_lines(
> ...     config=3D{
> ...         'LINE0': gpiod.LineSettings(direction=3Dgpiod.line.Direction.=
OUTPUT,
> ...                                     output_value=3Dgpiod.line.Value.I=
NACTIVE),
> ...         'LINE2': gpiod.LineSettings(direction=3Dgpiod.line.Direction.=
OUTPUT, active_low=3DTrue,
> ...                                     output_value=3Dgpiod.line.Value.A=
CTIVE),
> ...     }
> ... )
> >>> lr._name_map
> {'LINE2': 2}
> >>> lr.set_value('LINE0', gpiod.line.Value.ACTIVE)
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File ".../gpiod/line_request.py", line 126, in set_value
>     self.set_values({line: value})
>   File ".../gpiod/line_request.py", line 138, in set_values
>     mapped =3D {
>              ^
>   File ".../gpiod/line_request.py", line 139, in <dictcomp>
>     self._name_map[line] if self._check_line_name(line) else line: values=
[line]
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File ".../gpiod/line_request.py", line 82, in _check_line_name
>     raise ValueError("unknown line name: {}".format(line))
> ValueError: unknown line name: LINE0
>
> Signed-off-by: Chuang Zhu <git@chuang.cz>
> ---
>  bindings/python/gpiod/chip.py | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.p=
y
> index b3d8e61..ce77d27 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -279,11 +279,12 @@ class Chip:
>          else:
>              mapped_output_values =3D None
>
> +        offsets =3D list()
> +        name_map =3D dict()
> +        offset_map =3D dict()
> +        global_output_values =3D list()
> +
>          for lines, settings in config.items():
> -            offsets =3D list()
> -            name_map =3D dict()
> -            offset_map =3D dict()
> -            global_output_values =3D list()
>
>              if isinstance(lines, int) or isinstance(lines, str):
>                  lines =3D (lines,)
> --
> 2.44.0
>
>

Thanks! Please rework the commit message as advised by Kent.
Especially: explain what effect the changes have.

Bart


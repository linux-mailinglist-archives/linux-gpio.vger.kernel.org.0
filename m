Return-Path: <linux-gpio+bounces-7046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6298D7D61
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B6DB1C2187D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 08:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38705BACF;
	Mon,  3 Jun 2024 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k6ZltS/1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6895477A
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403526; cv=none; b=cfFLm70gdI/l3wkFNyyPHo0x3wTLy5zxKEhd7ki5fXhBaac+VZGkx1tzkmTpKW0ARk8y0gl18p0oF5XIuMmukZzpNBRe7NQnv7glKFTXD0yKGnKcPdMzNNKRuMdXwKB4wSFof4xiB2+s4YKVb0KgoDb3RPVricq0T1l7qBo4GFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403526; c=relaxed/simple;
	bh=YRW7PjUYem427Q9e1TQrMgKat4e5UnvaCX8B8ou59PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S239ALhOi2soSEtIqBt2ixMJeZI4rkXZeSiBCaQKf4L+XTHqGdUbV4JrTSzNnhtyoo9b6rgcJYI2iQ4SiMOl7cAoRPkCcAYLS98WP4zQa1rrpm4zOVFY8Chl10tNu2annpSIUOBkOXNLT7raCU2/mEcWfu/wW2KfWxmINGp0YfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k6ZltS/1; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so33005171fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 01:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717403523; x=1718008323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SR+OQhYkTg9lzBQDK1gFJ8R3TWRUSp36xtonngLD3E=;
        b=k6ZltS/1TUQYlHTdWHBAOsvrJ6kWb3rWAGST7FpFhrsS2b1/4I0yxn1TyFbrMcTPnZ
         9hfDiWWUmDuN9sNKrAVxuKXNhuVWh0K6N0eJzn3BPm6GDAarKkVzgNBObpVaZxJwTAjn
         Z/ln1i+WlL4WCpPrBJ/5d2xsYA3FTHWEZgv4GDDViQ0ViswCAbrAojB+q8ABZq2wAYoD
         vfRtQt27iBtnTB3EFElLgreiecE9vgHOv0bFhXRk0Yhlbwp8epT0JQl8xLwXvgym5sJj
         8NFQT078BQL4pFh9jACikdOHZEcGPy4m/BqpBmqIW3skJZEGYLzEQLYm2/hNf1/A7lMf
         OgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717403523; x=1718008323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SR+OQhYkTg9lzBQDK1gFJ8R3TWRUSp36xtonngLD3E=;
        b=lMi1jsKnItLZ+KGV3cYL8wT5ujtW0kN9nOXI4enTWGhT0iMP+YWPHu7mBB3WvVnxS8
         qj5h8zy+8ClK/8D/RILy4OAOWjxMOJaiWJMvE1VKnRigh14NyW+6/MTrQ8ayeJpSf0DA
         2bFJwaM8BIPUwZvedf/xG0BaWYFBcVd5/AV/JBZMpUVdf9OUtZF4ccj2S+PCS4+4gC0W
         lo1TqF2MjUl4m5uiTxo0L70MECOrTKWMAPd69yuBGa8lyS+30ZuZh+Rz3GLU2v3SB+9u
         beK84InQ/rXOSLZPa30FIX9HkyKoCZkw6z4ap7ZvPZ4qsZif3AFhWdVFoT33TjxTp37B
         mcLA==
X-Forwarded-Encrypted: i=1; AJvYcCVH+uQ46noHYILYzZqMl5jYMROYlH18s2wD4ANyxJgSUE20F/OVVR4Xovi1sN9BpX4XrAvJENU33gtYrgMMgJqBgasNCKMIZwLFZA==
X-Gm-Message-State: AOJu0Yxt74F6x5tHzG6f4qNKxLZoHOmhNPVh6kcfK3XSCIo5KBdCv0Ji
	B8xH8PVja+xo9pBVMJD/RFAEfcywuTvwo4aXSedw7S17NlPVnBHATxWfJVUead6vZQKS0/DulGu
	hBPTICipPpNauyZltRCifHGO7YM/Ei+m0SXNKBw==
X-Google-Smtp-Source: AGHT+IHi9yjpUlPhgtMP/rJ1TwiT9Pgl1w5h9NUwXWE9BRNbLXghRbcFU1ELKIElO3GnO3g+03dEs9aHNStPGm5fR2Q=
X-Received: by 2002:a2e:870d:0:b0:2e9:8a16:fe31 with SMTP id
 38308e7fff4ca-2ea950aee36mr62217721fa.2.1717403523221; Mon, 03 Jun 2024
 01:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=MeuHpu4_QbgW-6Kc-TGzhcBim7Eb-TZhPax6G2SZHR5iw@mail.gmail.com>
 <20240602074925.2489486-1-foxhoundsk.tw@gmail.com>
In-Reply-To: <20240602074925.2489486-1-foxhoundsk.tw@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jun 2024 10:31:52 +0200
Message-ID: <CAMRc=Me+J89_WcrRFyfyapDN2jyeiGad3uoTRN_N3vnP2puv2Q@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: prefer pread(2) for interrupt reading
To: Huichun Feng <foxhoundsk.tw@gmail.com>
Cc: corbet@lwn.net, linus.walleij@linaro.org, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	warthog618@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 9:49=E2=80=AFAM Huichun Feng <foxhoundsk.tw@gmail.co=
m> wrote:
>
> In legacy sysfs GPIO, when using poll(2) on the sysfs GPIO value for
> state change awaiting, a subsequent read(2) is required for consuming
> the event, which the doc recommends the use of lseek(2) or
> close-and-reopen to reset the file offset afterwards.
>
> The recommendations however, require at least 2 syscalls to consume
> the event. Gladly, use of pread(2) require only 1 syscall for the
> consumption. Let's advertise this usage by prioritizing its placement.
>
> Signed-off-by: Huichun Feng <foxhoundsk.tw@gmail.com>
> ---
>  Documentation/userspace-api/gpio/sysfs.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/gpio/sysfs.rst b/Documentation/u=
serspace-api/gpio/sysfs.rst
> index 116921048..bd64896de 100644
> --- a/Documentation/userspace-api/gpio/sysfs.rst
> +++ b/Documentation/userspace-api/gpio/sysfs.rst
> @@ -97,9 +97,10 @@ and have the following read/write attributes:
>                 poll(2) will return whenever the interrupt was triggered.=
 If
>                 you use poll(2), set the events POLLPRI and POLLERR. If y=
ou
>                 use select(2), set the file descriptor in exceptfds. Afte=
r
> -               poll(2) returns, either lseek(2) to the beginning of the =
sysfs
> -               file and read the new value or close the file and re-open=
 it
> -               to read the value.
> +               poll(2) returns, use pread(2) to read the value at offset
> +               zero. Alternatively, either lseek(2) to the beginning of =
the
> +               sysfs file and read the new value or close the file and
> +               re-open it to read the value.
>
>         "edge" ...
>                 reads as either "none", "rising", "falling", or
> --
> 2.34.1
>

Please don't send new versions of a patch as responses in an email
thread. Otherwise tools such as b4 cannot tell if it's a new version
or part of a larger series. Please always start a new thread with get
send-email or - better yet - start using b4 and let it manage the
series for you. Please resend this correctly.

Bart


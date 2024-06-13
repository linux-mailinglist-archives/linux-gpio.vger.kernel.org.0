Return-Path: <linux-gpio+bounces-7431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D590751C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 16:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AC3B1C2123C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 14:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97643145358;
	Thu, 13 Jun 2024 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNIA3rvv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7C142E73
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718288772; cv=none; b=dCjyoQmCilKSdcJeQEebanxVh2rG2OXzLlDI5kjr9OR2J8+AF+1YvDZZkciBkSAufFRGNiFqTXrxFstwIsy7kmOC0nNUABuDo7dohBmQwHj2v7bd9qob/akGJsvpLcJ5iAxg0Io/kDlEto3lYdhW5h5hIcgdW8b4Adb8hKhiqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718288772; c=relaxed/simple;
	bh=sCxQ+vMaTVQaIydwaHEDngzH/iYrBTiN5/zxPMasitI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U48xVJOvJZvqA9CMBDUXeotDlvC70LWRwPRqAMcQpZtXneTSHEvaOL0hRlmuc9esxbhP1tx7VvCP8KEUgSXMNA3XdA4Yh1sBefJMIEbn/YmnzPUwWemWV4+2I0ouq9leUzAydfBpgdQ0soOHaCGynW30q7CFQfJ5QGBpaJmTCZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNIA3rvv; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57c83100bd6so1258546a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718288769; x=1718893569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHWBJYeIkeZI6hzv6fJQbC1V1qQ5Uveumb2zR/17CCI=;
        b=JNIA3rvvZn5ouchNS5m/xWtTUoEMsTlQ/HS4M7B6CZ1k6wMiAeodJEIQB8EYPQIoSO
         mmE94JV5NyKvolOGhZI9+tIkcLly7abZOvPGde6ljGSyQ2Q9XjMbgExqIBv9OwRT0kFQ
         uLJR+67LenD/l2du+Lgsto7aJIVwLJ7lQ20qm54vQDBQk/doR1FVMUg8FpQMuOyLq049
         OIuQ52jKdFQblEKEYQHlmAJBxjBkXsKpTqBzV5BmH4Twzyf2G7DJJbn5KMqAj250XWXr
         SPLEt/rZyHWHJBJPT8fz4k0NGjD3C/WNGNwAfwtY24RjsnD4Z+0KMaBq1e1ADHj8+caV
         9K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288769; x=1718893569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHWBJYeIkeZI6hzv6fJQbC1V1qQ5Uveumb2zR/17CCI=;
        b=tdN0MWzekUhagsavKfi8D0ve9gcoqdmutAHeycCKLoXLoD1NkZYEdll/xcZx8wCUiz
         MWPv+vUKuuZdCnuP6W2RZqnhCHBrzAC0oNYaO5CZ0u1FzpHt6kX5B6st5+6VYrVV7zM/
         LcuLw6sfmL9479OsFSRI9TzesmkbAv8YLYQZ0bU02dxm4Vj6ieWZ7Nm5QIi9elIRk6lQ
         MbWevzmtgV0QyK9eRz6DuulmAJs4iv/WXQwS4oXtj4B0WqlpZolPvoX2VUEwIePHSTPm
         MzOYBYMwn2fvRH9uQjUaS1TFhgHq8pzMzjajtG2bG/HCLpIoz6h3oJu9E2BVWfuYF/nQ
         AwKA==
X-Forwarded-Encrypted: i=1; AJvYcCUaNyVOYD8IP1XAk/n4jJOG4pUS+rQYkz64dVwLoMvGtJpki63lmgLpZpU3hcUAa2ssGXg7UDbJ0GiMVesIVnMQ5M8J2AX9/TOzXA==
X-Gm-Message-State: AOJu0YzAOc3T0qcKz/QFn7MiAUJzB57AVucvviGChkm5Udhbtwn57Ssn
	P4Lt+rNNDtXD2Sq7zCEK+s9a8nophRTAlxxxZ99cMas13jB6YBp/B7s7eQrCv0cCw7Nh4Gi7RHM
	cKqMx7qfCSXz/VCe6Cyj6iaPB6vs=
X-Google-Smtp-Source: AGHT+IFR+fc7TjyXUUJosbQPuzeAzLpAiGtPPhBuHD2r7vfYy/C2IJnrDe5mMrX451kIrMI7NOsEM2yzt/PQ1fGZHhY=
X-Received: by 2002:a50:d514:0:b0:57c:6efa:8381 with SMTP id
 4fb4d7f45d1cf-57caaaf235cmr2768599a12.42.1718288768541; Thu, 13 Jun 2024
 07:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613140117.39048-1-brgl@bgdev.pl>
In-Reply-To: <20240613140117.39048-1-brgl@bgdev.pl>
From: Vincent Fazio <vfazio@gmail.com>
Date: Thu, 13 Jun 2024 09:25:56 -0500
Message-ID: <CAOrEah5=3vrE6ZWBSqFYQ4_ow+KuqJHDfowqAh34Cm+muj5Pfg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] README: add mentions on shellcheck and reuse
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bartosz,

On Thu, Jun 13, 2024 at 9:01=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Extend the "Contributing" section of the README to include mentions of

I think the content is good and will help clear up some confusion for futur=
e
contributors. However, it's a little confusing to have contribution guideli=
nes
in the README and then have it point to CONTRIBUTING.md which duplicates so=
me
information but doesn't actually have much more information.

If I had a vote, it'd be to consolidate the information into one spot, but
maybe that should be done in a subsequent patch?

> shell scripts having to pass the `shellcheck` test and the entire tree
> having to conform to `reuse lint` requirements.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  README | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/README b/README
> index 7a92a49..a6f24d1 100644
> --- a/README
> +++ b/README
> @@ -284,7 +284,9 @@ to send plain text[3].
>
>  Code submissions should stick to the linux kernel coding style[4] and
>  follow the kernel patch submission process[5] as applied to the libgpiod
> -source tree.
> +source tree. All shell scripts must pass `shellcheck` tests[9]. All file=
s
> +must have a license and copyright SPDX headers and the repo is expected =
to
> +pass the `reuse lint` check[10].
>
>  The mailing list archive[6] contains all the historical mails to the lis=
t,
>  and is the place to check to ensure your e-mail has been received.
> @@ -300,11 +302,13 @@ tarballs should be fetched from kernel.org[8].
>
>  For more information, refer to CONTRIBUTING.md in this repository.
>
> -[1] https://github.com/kward/shunit2
> -[2] http://vger.kernel.org/vger-lists.html#linux-gpio
> -[3] https://docs.kernel.org/process/email-clients.html
> -[4] https://docs.kernel.org/process/coding-style.html
> -[5] https://docs.kernel.org/process/submitting-patches.html
> -[6] https://lore.kernel.org/linux-gpio/
> -[7] https://github.com/brgl/libgpiod
> -[8] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> +[1]  https://github.com/kward/shunit2
> +[2]  http://vger.kernel.org/vger-lists.html#linux-gpio
> +[3]  https://docs.kernel.org/process/email-clients.html
> +[4]  https://docs.kernel.org/process/coding-style.html
> +[5]  https://docs.kernel.org/process/submitting-patches.html
> +[6]  https://lore.kernel.org/linux-gpio/
> +[7]  https://github.com/brgl/libgpiod
> +[8]  https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> +[9]  https://www.shellcheck.net/
> +[10] https://reuse.software/
> --
> 2.43.0
>


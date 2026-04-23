Return-Path: <linux-gpio+bounces-35401-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHnSOR3f6WkfmQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35401-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:58:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFED44EDD2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3637B301FC8D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 08:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FF13DF009;
	Thu, 23 Apr 2026 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqePOt9K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44313DF001
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934682; cv=none; b=cn2V85mNC6dhb83F5crGEDylcWcxeWTvXrYGRFayEJvx3yrhVuijCS0taDzg63VhEt2eT9uvaNKtdUrr2OyAgfucjitKLveIIKwPmw3ar2/wadKS/WhUKSgjYaV9YOM8wRCfccSwzp0mh5PsCBhAeVJEQ5cTQjxSS0PiMR4BIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934682; c=relaxed/simple;
	bh=PEbir9Dsq3N6S+7NyGLsDhh7AYdDvXkfXGEYhuPPiKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QciTWUO1Hri8LrFrWD4T2gSlI9UBCdArTOPWgalzmOb3p2IEENR6n5fBc9h4iLoAe/+zKqT9+T5mSRv+ksHTY0JuJ3omEYN6RjQWrui3J7xUVd53cK3qZhZN3RZGxbZHek0+bISz4/xe+F4vBEGYNhIN9xH8UH6oTf/7Zgu8IdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqePOt9K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541FDC2BCB5
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776934682;
	bh=PEbir9Dsq3N6S+7NyGLsDhh7AYdDvXkfXGEYhuPPiKk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AqePOt9KYNYH3iML8dgrhCYJCTMbnMQwK/NuZdu6ZFLF3/6rCEgiwrm8bIpIusMjF
	 F0abtXzSOkPxyPlSk5t085SFRAPgUI7NjAHoGBtdSZnI2JwFjWPB+hJ8c7QxzvJcnz
	 TCvEUCJLwbziIdEi7HyQq1fD3zDl8dszKPMpK0VhPCWcStR7eAj5yozAsiauZqfQmH
	 lBNYqzXMBCgBKWkksBAWFXljJot1wRexdp3xSlVVbl0Q+bsc+VZylVw6CSJJ+XqQ9B
	 iIOp6OV6ObG3hk8yX2OySLP4llZ3jc+IyDiCn9wql7ZNPhhhERjW5x9xm9EWw7KBxI
	 gaVesHNqhg4YQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so70015381fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 01:58:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YynpKIK0cjDWApRI+kazfNo0UqdF3cPs6dr8cRkN/59yl7kCcPR
	9kq+2dzOiqgRhAc6HWtwJcCsXyiuwWv14qOFstEbxRpQQa8m+6DKLvNOQ+4JHKgq1mCcFcoN6oT
	JAmUeFmCcL+sE4fwrgK5N8HZs75sfvAVxTf9WhHKPfQ==
X-Received: by 2002:a05:651c:421b:b0:38e:9e34:786e with SMTP id
 38308e7fff4ca-38ec78103b6mr80775931fa.12.1776934680958; Thu, 23 Apr 2026
 01:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422012041.39933-1-vfazio@gmail.com> <20260422012041.39933-2-vfazio@gmail.com>
In-Reply-To: <20260422012041.39933-2-vfazio@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 23 Apr 2026 10:57:48 +0200
X-Gmail-Original-Message-ID: <CAMRc=MertT4WNcv7h9Uv8+-XWObXF_NmXsf-e5ZE_W8FXz-T4g@mail.gmail.com>
X-Gm-Features: AQROBzDDcGkTz8dBtKk_JVLx08vSiY8rN0xInUc-ubaF9NJD6BrOjxKjHn9-DuE
Message-ID: <CAMRc=MertT4WNcv7h9Uv8+-XWObXF_NmXsf-e5ZE_W8FXz-T4g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/9] bindings: python: use Py_RETURN_NONE in chip_get_line_name
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35401-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5BFED44EDD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 3:21=E2=80=AFAM Vincent Fazio <vfazio@gmail.com> wr=
ote:
>
> When commit 0c0993569c54 introduced `chip_get_line_name`, it failed to
> utilize the standard `Py_RETURN_NONE` macro used throughout the rest of
> the extension.
>
> While commit fbc0a4471215 fixed the underlying reference counting issue,
> utilizing the macro is the standard way of managing reference counts,
> works across all CPython versions, and brings the function in line with
> others in the extension.
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  bindings/python/gpiod/ext/chip.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext=
/chip.c
> index 53c4b80..19b3a4f 100644
> --- a/bindings/python/gpiod/ext/chip.c
> +++ b/bindings/python/gpiod/ext/chip.c
> @@ -152,7 +152,7 @@ static PyObject *chip_get_line_name(chip_object *self=
, PyObject *args)
>         int ret;
>         unsigned int offset;
>         struct gpiod_line_info *info;
> -       PyObject *line_name;
> +       PyObject *line_name =3D NULL;
>         const char *name;
>
>         ret =3D PyArg_ParseTuple(args, "I", &offset);
> @@ -166,16 +166,15 @@ static PyObject *chip_get_line_name(chip_object *se=
lf, PyObject *args)
>                 return Py_gpiod_SetErrFromErrno();
>
>         name =3D gpiod_line_info_get_name(info);
> -       if (!name) {
> -               Py_INCREF(Py_None);
> -               line_name =3D Py_None;
> -       } else {
> +       if (name)
>                 line_name =3D PyUnicode_FromString(name);

This can fail and return NULL. An exception will be set...

> -       }
>
>         gpiod_line_info_free(info);
>
> -       return line_name;
> +       if (line_name)
> +               return line_name;

... and since line_name is NULL you skip this...

> +
> +       Py_RETURN_NONE;

... returning None and ignoring the exception whose reference count
will not be subsequently decreased.

I think you need to check the return value of PyUnicode_FromString()
right after the call.

Bart


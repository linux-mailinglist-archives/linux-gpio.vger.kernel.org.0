Return-Path: <linux-gpio+bounces-35470-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L2yAGMy62lfJwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35470-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:05:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B8745BDB0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D94B730022BF
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD1B31F9BD;
	Fri, 24 Apr 2026 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBTxwnBZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DD8221FCD
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021424; cv=none; b=qCKWI3tpRkJ7Xr29IBCUyz4YmGjNt3mXHgk8thqJ2Fon5q+CEN3EW+st+/yHblRu2lS0dEh4F2evbt+qCvRiBFNNxT++JOW3qMcxuVzeh+2SIqnRfPWlqiVSLgogTqQOUQdRpddLOFi6oOKQrXk1vTF8DRrfkD2fsM1RXjD8DFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021424; c=relaxed/simple;
	bh=SRLhJ45lNOSkSS/hkoMS/ycSVwjW6DkLgXgSFpXrb6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrPdtTyG9UkNHFcip9IN7rllnO6l57q/zAcH15Wk5VTNnfRwT6jna2BNwsehmasnFbNSVw/EWLMhcSCQqsLwBX6KRc0mpyRAo5bTqbwAR5WbGv6t1d3UsYhuUfyJeQ/Tvaf2i/Qj6YLoQh1BD7OQDtgU+DmHW64pl5aVW79fNHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBTxwnBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F26FC2BCB4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777021423;
	bh=SRLhJ45lNOSkSS/hkoMS/ycSVwjW6DkLgXgSFpXrb6E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uBTxwnBZ0KGOUjEjLnAVwKKAqcnlabFor6qoMgBL7aeJb0kwdO4gpIdFFzwyKlRnD
	 uROtQh8Ck8VxgY4mBSpntwdR9eGaL+tCKEYhlUP5VjV4hlvfhEL3y+1YeVGy60b2/u
	 pK4iOx7rh+WsCJGVXTS//zPn9WKOCKppQWwmj5AwgupAIbzspbRw8AEB3JnVnxHprd
	 HO1oBmedhY9jzwRzHkffX909Tp68qszodnhTjnPMOAfj/gMfKV9LrRo7suLTq/5xbl
	 xI2pJIY959vAXpTJDWtMJWB5ur4668QZPcpwIvapX5M1/kU8sE8uFpmdaC4Wr0rLBE
	 nlo/O1loT5QCg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so72888101fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 02:03:43 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy+tvjol6NpRC1sKO4qF/i7XiUMeFY+9y0dgevs50MCaWMFu7mf
	Fin+p0jyaQaZF106o/n3JzuHAdVNqrjXUUVbBOxMkAdEvMB9+uTR4kUwQlhHHi3NnQefugrEtS7
	s4CQx73CpFyJyztxL+gnO0CzQXyRaePYkacUTZxJszg==
X-Received: by 2002:a05:6512:64ca:b0:5a4:176c:99ab with SMTP id
 2adb3069b0e04-5a4176c99f7mr7885644e87.4.1777021422161; Fri, 24 Apr 2026
 02:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423222125.29097-1-vfazio@gmail.com> <20260423222125.29097-8-vfazio@gmail.com>
In-Reply-To: <20260423222125.29097-8-vfazio@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 11:03:28 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdrisR4_Wmd+1S3JGHMPkiZTvC1ucNpGq_j5N1pD0xdHQ@mail.gmail.com>
X-Gm-Features: AQROBzAFw5CJpNlgdBj8jL1ZBpXTjo3D6fbTRQdxwobfXmpVCPcERGgBybBlJHY
Message-ID: <CAMRc=MdrisR4_Wmd+1S3JGHMPkiZTvC1ucNpGq_j5N1pD0xdHQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 7/8] bindings: python: tests: migrate the
 system module to multi-phase init
To: Vincent Fazio <vfazio@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 21B8745BDB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35470-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Fri, Apr 24, 2026 at 12:21=E2=80=AFAM Vincent Fazio <vfazio@gmail.com> w=
rote:
>
> Single-phase initialization has been classified as legacy within CPython
> documentation [0] with multi-phase being its successor [1].
>
> As such, switch to the new methodology.
>
> [0]: https://docs.python.org/3/c-api/extension-modules.html#legacy-single=
-phase-initialization
> [1]: https://docs.python.org/3/c-api/extension-modules.html#multi-phase-i=
nitialization
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  bindings/python/tests/system/ext.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/bindings/python/tests/system/ext.c b/bindings/python/tests/s=
ystem/ext.c
> index c982fa6..800648e 100644
> --- a/bindings/python/tests/system/ext.c
> +++ b/bindings/python/tests/system/ext.c
> @@ -67,13 +67,18 @@ static PyMethodDef module_methods[] =3D {
>         { }
>  };
>
> +static struct PyModuleDef_Slot module_slots[] =3D {
> +       {0, NULL},
> +};

Just an inconsistency I noticed while I was about to pick it up, why
do we have a NULL sentinel in the gpiod extension but not here?

Bart

> +
>  static PyModuleDef module_def =3D {
>         PyModuleDef_HEAD_INIT,
>         .m_name =3D "system._ext",
>         .m_methods =3D module_methods,
> +       .m_slots =3D module_slots,
>  };
>
>  PyMODINIT_FUNC PyInit__ext(void)
>  {
> -       return PyModule_Create(&module_def);
> +       return PyModuleDef_Init(&module_def);
>  }
> --
> 2.43.0
>


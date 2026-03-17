Return-Path: <linux-gpio+bounces-33640-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL9rA35buWnYAgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33640-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:47:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 884862AB32C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22A0130C3D99
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E798B2D7DDD;
	Tue, 17 Mar 2026 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzHoWJBy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B2B2D94AD
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755057; cv=none; b=RfBPvVHELgkvC0mR84jRO7n38vuAuTwC7zDrZrTCXyskUpXYY3uDE9PW7CDvxMqLN1+EnSnwjxg0XGSNmjBcDVkSdzC2IFgMUWKXueJobq1HZ5SCGaE67+RW9IZi3SOqL0SI9uJKuI1EzHinwWTIBRZVbfubwtVRxgUTvAloO/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755057; c=relaxed/simple;
	bh=5IKandfCpB565/sxnJoGZiIJmtpqK16YDGKf8O1qca8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ew734lO0FwuJO7Kh46/N/qJD4k7CxomlHnEISd0JJI0vmTD7aKVo30xf4n2vx8T0v3rkrbs8qQ7x1q5pJRSMkjLAGR3TVYT+nbzMC74qhnWdtk1fUkS6hKHbSJ8TWx9Qn5aOJqCltbKVR6YOKTuannq/12eSV0NjnXXn8MJmZcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzHoWJBy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5A9C4CEF7
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773755057;
	bh=5IKandfCpB565/sxnJoGZiIJmtpqK16YDGKf8O1qca8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MzHoWJByDShZEht5gjYAGTxbaZ+nu9jLlp1kekEBT18940JdwLueVoVN5xQRyeXG/
	 RuNzWUk5D2OPGRk0BCVMXddRS229uPyQFaVyHlTUYNYBjm2NxY0dGAVn+hhZ1Uhq3M
	 Kriy+nzdQ0jwC/Wi9Zwrb2xd+t8lGNErnXq+4BiFjtodBM1RBxSe9gSN6X643pfMhl
	 A7Cv+jibqPJ1P3DLrTWy9b6D/s7n/lOS5LhGk8uqZKpDrBv82yVuCyIHrWM5TAf87G
	 H8I/9MYvN8TEnF3mIpclLqMlnyEQqlMAdHS1dAyCqWazp7S0EvVg5p0ChL5uUUWZin
	 aNfZzp6GPCKDA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a2e62b893so46263161fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 06:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzPdHAoqDV09uke5AXge231hgwJUVcemU+RPVGoNgAeHfAeNJObG/uKw6tcxzteiIjA96G2Ex+/+1K@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ2ycXH1Q0eDO/+SmDZ7Is+O3vRAQ6kcISMZ0FKqSIfHetxFV9
	zgN/X0a59t76x8fFIAolVfWeZ/ilQV2azZ8tbzOxpBocYTIPKv0+lnCR/pjdW9vkriNUjb/nDFX
	/eU6wRe5EC1WZWyvAmJskTQzn1BrhSBQUSqPaP491Yg==
X-Received: by 2002:a05:6512:154c:10b0:5a1:4285:fe7f with SMTP id
 2adb3069b0e04-5a162af5681mr4441016e87.17.1773755055151; Tue, 17 Mar 2026
 06:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com> <7b7198ac-e649-4e4f-a925-f8875c05da42@nvidia.com>
In-Reply-To: <7b7198ac-e649-4e4f-a925-f8875c05da42@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Mar 2026 14:44:01 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdUGbQar4gwHn2q2tJVagKty7MJJ4B0QmeB=SU4uX2R6A@mail.gmail.com>
X-Gm-Features: AaiRm51fRiJ0LEW-Vy_moGvABpePgyrzT1ofU8I6_4KtbCCnURiszXOQh1TBzHo
Message-ID: <CAMRc=MdUGbQar4gwHn2q2tJVagKty7MJJ4B0QmeB=SU4uX2R6A@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33640-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Queue-Id: 884862AB32C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 1:54=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> >
> > +#if IS_ENABLED(CONFIG_OF)
> > +             if (is_of_node(entry->fwnode) && gc->of_xlate) {
> > +                     /*
> > +                      * This is the earliest that we can tranlate the
> > +                      * devicetree offset to the chip offset.
> > +                      */
> > +                     struct of_phandle_args gpiospec =3D { };
> > +
> > +                     gpiospec.np =3D to_of_node(entry->fwnode);
> > +                     gpiospec.args_count =3D 2;
> > +                     gpiospec.args[0] =3D entry->offset;
> > +
> > +                     ret =3D gc->of_xlate(gc, &gpiospec, NULL);
> > +                     if (ret < 0)
> > +                             return ret;
> > +
> > +                     entry->offset =3D ret;
> > +             }
> > +#endif /* CONFIG_OF */
>
> Do we need something similar to this in the gpio_device_teardown_shared
> function?
>

No, we adjust the offset here so it'll be correct later.

Bart


Return-Path: <linux-gpio+bounces-39842-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YRNCGnczUWrRAgMAu9opvQ
	(envelope-from <linux-gpio+bounces-39842-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:01:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD773D29C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:01:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="OpDGie/J";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39842-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39842-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 707BF301991D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 17:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4B0379C59;
	Fri, 10 Jul 2026 17:59:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BF9370D5F
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 17:59:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706359; cv=none; b=JUcBXh9qKN7ToNEiY2GRIvjqgy8XpAMxfyMKKRaPYJmA/SfKLzlJLcrCa4yzH4Ow+vZPE5lCkvwAC8glf9uTaCB93tsZrGosTlEZCAvQBgVChReS8YfRfiHIxy1vsD4eZIe2x77Eai8pEiBWBU+l2e/td52uHiB0b7tPjihZEVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706359; c=relaxed/simple;
	bh=nG/oZ65eqc7dFIM1bcCK1wzAHPHaTqkhVZBqAH4Ss+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCL2u0JC924oSQjp/G1JBAuvvpUeH2bRL/Dy2cR76xszpxxn1HYN+Kd7aDTLDhxVFFn5ad3meqcjJfnmASyoarEXioIyuzqZuZKDAn5Bxk3jBtGr2+Qs8LTVgLomDibA6eiYalsP56gvdQsDCqNMC9EzRqVm8iHM9B1nxEWRIgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpDGie/J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B271F000E9
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 17:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706358;
	bh=NQUFtXd+yhbZmb0xP3T8Twb14UKyBjpqo9rwSDUqDkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OpDGie/J5wWKFGd3x0zTtenLH9+AkZrKOxV7jiloCuqFp7/VZqvk3J5LD3+n7HqIL
	 bxi1CqIj92R8TVGQsOvoLWz05OkxzYn65LhFQ/NO0+VM94DvCsAAidA2srHUjnbouB
	 s3uc4FfMzVIoQi9xrfqnt+K7yVM7Tf+Eu2mNgd6eK8rp8DbThjY6ovoL5O6rgKyJIw
	 pfKa7KpiXL6HodKlBo1efWybovDEw7ob1Ylb6aq0zgYX/D4jQAL+HEBBm4sq9bdF3h
	 JLnvHsEd9Y7tDU/utEXuYmLc6oNwqE7m/RYhtTZ8sFeDMUYr8zM9ks3qahtnqBoBBI
	 dvRgGEhmYkj6Q==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b015532f7bso1304468e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 10:59:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YxHu19mM8KFarrjsuaf8wwHbv9LbAkNso1MK6Bb5MFqhHcbsLjh
	rBI+CUjWOtq/VoGWQXKAI69qv8n+1AKlh2+lgD9CSmKP1CH5Ketf+lh4/fascml4U1zVzsQpVgE
	KvnOkgYpsDwj6Zgyf9JNLeJofRIH36XE=
X-Received: by 2002:a05:6512:2c88:b0:5b0:1108:c58f with SMTP id
 2adb3069b0e04-5b0236b7a74mr41296e87.49.1783706357220; Fri, 10 Jul 2026
 10:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704152230.51188-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260704152230.51188-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 19:59:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPgHzKA2hCG7VT0zcgZawU77gi-5aBszoRCrFDW36wSw@mail.gmail.com>
X-Gm-Features: AUfX_my6QM7b-FjgZIso76uPMMMSqEV5sT4YL_oAtGyGvl_IdLxKfJ_z7rzwaHg
Message-ID: <CAD++jLnPgHzKA2hCG7VT0zcgZawU77gi-5aBszoRCrFDW36wSw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sx150x: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39842-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97CD773D29C

On Sat, Jul 4, 2026 at 5:22=E2=80=AFPM Pengpeng Hou <pengpeng@iscas.ac.cn> =
wrote:

> The driver has a match table for the i2c bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
>
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
>
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Patch applied!

Yours,
Linus Walleij
>  drivers/pinctrl/pinctrl-sx150x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-s=
x150x.c
> index 1d6760ffe809..f1647d9114e3 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -850,6 +850,7 @@ static const struct i2c_device_id sx150x_id[] =3D {
>         {"sx1509q", (kernel_ulong_t) &sx1509q_device_data },
>         {}
>  };
> +MODULE_DEVICE_TABLE(i2c, sx150x_id);
>
>  static const struct of_device_id sx150x_of_match[] =3D {
>         { .compatible =3D "semtech,sx1501q", .data =3D &sx1501q_device_da=
ta },
> --
> 2.53.0
>


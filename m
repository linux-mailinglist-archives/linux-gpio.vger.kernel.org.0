Return-Path: <linux-gpio+bounces-31118-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGiwF7uBeGkzqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31118-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:13:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA1918A4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F9E8301A14B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E581F332904;
	Tue, 27 Jan 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2vPXSjK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E2C3321DE
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505206; cv=none; b=pSW9/EMBLZYXDA3pbXe7uN45k+/vqfk1NW2mrZB0ZaL0qm6XhVFQjlAowXquAq9/Ivfmp6UveyQ2MIgqNnVD37j/SAf0h0BRYuqRi6p2qcb61XIB7QwnRz6mSken1BwbjsIrzHu7dWLiH87Bj2zdeXLEwggcM8FFZ+Qsa5Ej/3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505206; c=relaxed/simple;
	bh=jSS3YM4+krwyVnnmHeaXPs1cPqwgnF59nuIcF34VoIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxG0jl8hp9QzCmKsIos3H0NLNobdt67SepRUWeIdoUf21+rBsmNtrusEdmpMcgeqqBbEHxha36mDeDZfQnViOm8WWMK/gaXp2pp8D6bRxOpl/ghxSVTsv89esOpRxdkLwcaIPDXTjN/eEfjpjHpmG4ESXBojIXeNdXa0LMrBrnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2vPXSjK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8F0C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505206;
	bh=jSS3YM4+krwyVnnmHeaXPs1cPqwgnF59nuIcF34VoIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f2vPXSjKYTNtrpbQ2ifD2VT8Mwgzg+QjeQbEWJoisc/mHGBGsL8p3NBpNhoL8uY/+
	 jW86IPKCKM0QPVAYGl77UnPAW/twuNvbc5kNBgXc48GqFF9mZycfqrywRTQwdTCiNp
	 MxbSoGi8OZ1H9sMNnTtYuEIipIX2kkYFNhuWRCjZPhNCQ0qDBCVMqEAve5vLau0TUa
	 2hqAEoRcG5Myqh+Mgeyy4qgpaa80+5IABoMGCBmcniXHlBJNx4QxqcuX9NrfOKWUFA
	 oE09MRwXTAQ2XfsNtriRK0WoIPsq+e9gwAWokSLSK9LgHT/F3hiY9/B7oNn8oqSWfG
	 16zFua5kmHdBg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso5795948e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:13:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1fmRuVQlsdyiop0tFASGyJ5SxfLIlFmoBJXNCjfCaxNXwoC6F6Y3DQ5GNO9FwO5SgIP3d+XW7QY4K@vger.kernel.org
X-Gm-Message-State: AOJu0YwvYw/kFCDLeUMV3MexLoo2ZvuU1AuvrnMk0goRHRsBrL7uzat9
	LjPFuVCAAkRBEp48AmTBt3b9sfhfgLLr60WLGKPwpQSnVZQ1FJwUurI3OOoddTxYWjN6CBBBMfS
	Y/kBsmaLZTRMBBHp1bOZBxT56ibwgxRfxqmR7/k1nEw==
X-Received: by 2002:ac2:568a:0:b0:594:341a:ab1e with SMTP id
 2adb3069b0e04-59e0402516cmr591873e87.31.1769505204885; Tue, 27 Jan 2026
 01:13:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
 <CAMRc=MebQF3P=Tp+65A6o4TDz2txYH0c832mbTV+250-6JRi=g@mail.gmail.com>
 <4ba68a0e-f603-419d-8162-da66f8755542@sirena.org.uk> <CAMRc=Mf-YJ4_N9QphXbxZF2CzevDbHiG-xjdVPujz1D7_X2GNQ@mail.gmail.com>
 <1b28aeca-a0cd-4ba7-8ae6-f3731f5e5893@sirena.org.uk>
In-Reply-To: <1b28aeca-a0cd-4ba7-8ae6-f3731f5e5893@sirena.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 27 Jan 2026 10:13:13 +0100
X-Gmail-Original-Message-ID: <CAMRc=McHLXw2NS838JHX=8exhuZ_mvc7G+RGx6b23StyQ02Fmw@mail.gmail.com>
X-Gm-Features: AZwV_QiQogH4HhPrIs61cc3bkaVyK8f9ztYScaoPh2jBmoDx5vSpkgPcekdZctk
Message-ID: <CAMRc=McHLXw2NS838JHX=8exhuZ_mvc7G+RGx6b23StyQ02Fmw@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpiolib: introduce devm_fwnode_gpiod_get_optional
To: Mark Brown <broonie@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31118-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDAA1918A4
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 4:20=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Jan 26, 2026 at 04:14:14PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Jan 26, 2026 at 3:01=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > I'm happy for you to just apply patch 2 if you want.
>
> > Sure, just please leave your Ack under v2.
>
> I think he carried it forward from v1 already?

Indeed. Thanks.

Bart


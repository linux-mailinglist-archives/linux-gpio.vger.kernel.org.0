Return-Path: <linux-gpio+bounces-36645-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMrPK2HQAmoNxgEAu9opvQ
	(envelope-from <linux-gpio+bounces-36645-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:01:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E80F51B6DE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E10C30D3470
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 06:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D30368D78;
	Tue, 12 May 2026 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCv6qzjQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3279035E947;
	Tue, 12 May 2026 06:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568944; cv=none; b=SVMU6iFyKvZB+hHVIajvH4Wd3t4zYNoqE2/AM2cS6hN5AqpgXCKkEVSAjIPcLSwHCUU0l6+tUsJAUXqszkZ6H384ilcw3CmsPbJUB2jjnytgxqmlWbrfeK/dC0o6kJ0q1uNFibS7ti96hU0SAiPwXks88nO+Z/xUOurRt+J55Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568944; c=relaxed/simple;
	bh=WWqWzH8W+EZPDhhmjWlpTWgpHS/RKcVIPl1sQRe7tVM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=QiVSltquBxuzXmS0FA1aIZiiyBUT6tIOUTYvDG0lDJsp4cMYWcjXjAS8DBnfxYEL8sc5w+VdFWfJkfUszGfWG73705ObyScC9pG/L6uxbwqt8/UpbnddZg0GVvayxg5XjH56W1O8SIFdApiq94gJcqpdmwglWyvfpxoFap1SSDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCv6qzjQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B5AC2BCB0;
	Tue, 12 May 2026 06:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778568943;
	bh=WWqWzH8W+EZPDhhmjWlpTWgpHS/RKcVIPl1sQRe7tVM=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=nCv6qzjQeGTsi2a7V20IZbklziQvKCkMqG/AAUdbUXI2gApRG030JgQbwbMiUIXxn
	 EQpPfnehMQofDdVjFEUfED6avt6iO1sVkbyyVX4140aHNvoAHwZBR2jW0OBAzFvZvn
	 gQ7RFhjQXJ/H+sOwlh8ymSKv08J1jlILLK3QC/gMCJO1JyVQOAfiO6t+28PfpYIld6
	 zaZ6zNopzek7c6jenSPi6xKi7NCWWsWkTA1lnjNsxM/hFBRn0v5UED+hvSE97V3/JT
	 537P2WaKNjANZg7JfvTELWFcVVvJT71HJOoAbDH2Fly/qEjfvc0DIbFqx8j9UM+vZf
	 SB8B6QAVfPnaA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6cb1f7462f79f7e50b7f29960a1884348909ef7f6a9b54772879ac95824b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 12 May 2026 08:55:38 +0200
Message-Id: <DIGI2IM11W50.9CBEEX3EWJUQ@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>, "Alex Elder" <elder@riscstar.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Subject: Re: [PATCH v3 1/2] gpio: regmap: Support sparsed fixed direction
Cc: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org> <20260511-regmap-gpio-sparse-fixed-dir-v3-1-1429ec453be7@kernel.org>
In-Reply-To: <20260511-regmap-gpio-sparse-fixed-dir-v3-1-1429ec453be7@kernel.org>
X-Rspamd-Queue-Id: 1E80F51B6DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36645-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

--6cb1f7462f79f7e50b7f29960a1884348909ef7f6a9b54772879ac95824b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon May 11, 2026 at 9:43 PM CEST, Linus Walleij wrote:
> On some regmapped GPIOs apparently only a sparser selection
> of the lines (not all) are actually fixed direction.
>
> Support this situation by adding an optional bitmap indicating
> which GPIOs are actually fixed direction and which are not.
>
> Cc: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/linux-gpio/20260501155421.3329862-10-elder@=
riscstar.com/
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--6cb1f7462f79f7e50b7f29960a1884348909ef7f6a9b54772879ac95824b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCagLO6hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ikkgGA1YZZKYyWgzs1lVHgQQjpq4c0ZR76zqGp
Jsc+S3OXOIi3Q91FnNt0+XyIcB6xK1uTAYC1hzNWcF4lapU7Ptnl7aGzH64svnDE
u9HfbHJ6bqShnKAXp3CIpZv25WCcfthyJAo=
=fL+Q
-----END PGP SIGNATURE-----

--6cb1f7462f79f7e50b7f29960a1884348909ef7f6a9b54772879ac95824b--


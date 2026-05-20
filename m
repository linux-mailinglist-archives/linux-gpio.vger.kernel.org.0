Return-Path: <linux-gpio+bounces-37212-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7rNTN97bDWpb4QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37212-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 18:05:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A959171F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 18:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB4B6324479F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89AA3F7AA9;
	Wed, 20 May 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tx92Vuby"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1053EE1C0;
	Wed, 20 May 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290661; cv=none; b=gU8+cShO2gqocxNcRUEhX12ufx9PNtGKMx7Tl1AZ1/3K3uuZsbsVr+zXFG8eYSo6VJyDfYWHn8lSiMv5NPMwqCk+9TmkHasYpiHka5CasdeP8ru9E5RKZZovQIqbbLMI7dks0iEzv4I+YazKcF1JZciDzj/VS1VLCobGuD2lGV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290661; c=relaxed/simple;
	bh=HCXAt+/CjoO40ifbH4DOvSdJDWcFojBTxr7q96nrv1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpK8f0IT9bN6/3ac1aAK+wWB5zPhCG7j6Wwr7z7GExoy/9zyLXpQsgTrGJWbmNb5q91XGCQjXpCEpoYqgkNkWUSSiwVAAHz6VywQNURB/T/1DISDrVcJtOvaHsYt1RNoLtMVrO0ItoGNKhScZMKC/NKK1lI4Qj/ZqO8uRto890k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tx92Vuby; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CF41F000E9;
	Wed, 20 May 2026 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779290660;
	bh=HCXAt+/CjoO40ifbH4DOvSdJDWcFojBTxr7q96nrv1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tx92VubyKRg+ITGsogm/sdyuVtRiJxs2ebmJBL67P52zRzrwF5ZZtXATvU/MCptjW
	 UHmX6NMRPQESqonMF+PSlGJf3NxQ/7LrTd8cIzbOaRvDO3yrGl8VHiYmR100/AoVyo
	 MSZ3RcEHAIzdh3mhL2KtwxKT7m5bACq+ltB5jNpYaIh1Fhu9OgFof37lcjpaEbpOSg
	 sFTTfGJbB3iW5CddMLEaBCNpXa39fQ7YpzoRsE9vzqK/h0bbXGmU1n7w95YSAB+9ea
	 v7W8ZSyvk2/S+b8tRNyWD3DUBLYdSQjlMtNhvxc9y/+CJSjDNEngYUyiWHfK3FNAb2
	 4FjMf/tCl/rPg==
Date: Wed, 20 May 2026 16:24:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Thomas Lin <thomas_lin@lecomputing.com>, rafael@kernel.org,
	lenb@kernel.org, hoan@os.amperecomputing.com, linusw@kernel.org,
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	lucas_hao@lecomputing.com, puntar_liu@lecomputing.com,
	jihua_tao@lecomputing.com, stan_xu@lecomputing.com,
	lumin_liu@lecomputing.com, notics_zhang@lecomputing.com,
	braden_zhang@lecomputing.com, harold_wu@lecomputing.com,
	will_zhang@lecomputing.com, aurora_jiang@lecomputing.com,
	ryen_lin@lecomputing.com, andy_jiang@lecomputing.com
Subject: Re: [PATCH v4 1/3] gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
Message-ID: <cc8dc59e-fc00-4f7b-9f24-467c670c5615@sirena.org.uk>
References: <20260520081140.637637-1-thomas_lin@lecomputing.com>
 <20260520081140.637637-2-thomas_lin@lecomputing.com>
 <CAMRc=MfM38h=zJU5Uy7zu9pigjb-XBAteBhUmvMAKZRWHGZNKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5NSLdtwUqjJNFgrs"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfM38h=zJU5Uy7zu9pigjb-XBAteBhUmvMAKZRWHGZNKA@mail.gmail.com>
X-Cookie: Natural laws have no pity.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37212-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 953A959171F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--5NSLdtwUqjJNFgrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 05:15:12PM +0200, Bartosz Golaszewski wrote:

> I'm not sure about how to interpret the cover letter - is it fine to
> take this independently through the GPIO tree for v7.2?

AFAICT any dependency that exists is runtime only, it's just a bunch of
quirks and none of the patches touch header files.

--5NSLdtwUqjJNFgrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoN0hwACgkQJNaLcl1U
h9B4TAf9FeEYqiA5zs8sL3fVdufh7wG+xHcOTo3HDGkHEmUaPW5nY9BGeUTdt/YX
4cZikl0ZCXB8zMPboEVPri3ud0F7fd7fM8R68IWQQ0l9y9xpDVa9zkazDRNVfeVy
p4FJ7U7bKuaSCtqgG+Xi10wwWdYVj50FZ+gAk3+aNnxAwPj5qwBeo7u21Xh5A9lB
HiuoP+wFZjIMop7yJLE59ZaMSH8qKU9Ky0SiRgexJdjApSPSm2VKFTfzsfkWyEWu
jmP5UmvH8a0PROx4A2FskHkp4MoScZ8oMdC0HfcjEh7OyWfUgw9pmkfHikBwrsEP
u3HPdCLUkZSC/8e7860Y7BvabOcDgA==
=EnsO
-----END PGP SIGNATURE-----

--5NSLdtwUqjJNFgrs--


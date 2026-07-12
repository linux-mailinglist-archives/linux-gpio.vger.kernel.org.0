Return-Path: <linux-gpio+bounces-39923-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c4X1MP5dU2q4aAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39923-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 11:27:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 061397443F6
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 11:27:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=D76ALQco;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39923-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39923-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D28B9300DDE4
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 09:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE2E2FD1DA;
	Sun, 12 Jul 2026 09:27:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB83770B
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 09:27:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783848444; cv=none; b=aFpn06aEn90U37rgyI6wgkqiXk5e962KNYjxtP/1W+ZaMDSFddtSu4Hyj5j1tqPnCHrXjhvYYR1GU4z3Xs7QOaPMS2fkSjPXxHYgzAJEY7wfg+lL1HJRsCABU9VF1ivZ56OOtRf4uPNjZYclb5OHT/WeBeeqJjRdWLfay1rd3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783848444; c=relaxed/simple;
	bh=HGEhgo6nwKWERdeZN3j/7g/1mXMipMryk6U50sgalao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZqeIj8gSsPL8yo/klAwICag/VEj5uRSJjKs9xdYKhWu9JiASukrrRrAobONcCXfhKyVY3B7gy4nLehPhcM4zviEqGQ6tCLXzEZ47Ef9Umce7eubjzdOcBxzZRodUA2lYfPJRRWUzxsvsuxrD/ZDCO/j1bmsFIti2oxiRrIq6Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=D76ALQco; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HGEh
	go6nwKWERdeZN3j/7g/1mXMipMryk6U50sgalao=; b=D76ALQcoJrmzHsBZ846w
	8FTMwX8JWXTp/Sfkp2m6wroXM5+NdcxFrmNi/ohaHaeSgPHn6VgnU9eohuDx8oY+
	SWMRE+8Wcai9u0XACKHVdTKmAIc1oGc6CPGT1TW9eNbA6WuGmoCVLD4WWGhX7sY+
	/cOYxTwJxvkyqzK5SrI933+ZnJ9ai4Ru9cmLBjl9blUFdgKUsEZ8CyKt/EvEmqWG
	/uU8bpIHl40ia5Xr6D5dXor4b4cmNwL8C9Dg581NA0CQQChtI4ed+YMN1PK8Hm5l
	uYCY6txvzmMJPfeB2ufwrB1On26Bw1AZ1zIKJnH46uW+k8mtqQwRUHrOh63AHlxv
	qQ==
Received: (qmail 2178118 invoked from network); 12 Jul 2026 11:27:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2026 11:27:20 +0200
X-UD-Smtp-Session: l3s3148p1@vpaWlGZWwLQujnun
Date: Sun, 12 Jul 2026 11:27:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: Fix memory leak in
 gpio_la_poll_probe()
Message-ID: <alNd92hOOETILWG-@ninjato>
References: <20260710064838.153528-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CDHTHxDTxpMC5KsV"
Content-Disposition: inline
In-Reply-To: <20260710064838.153528-1-nihaal@cse.iitm.ac.in>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39923-lists,linux-gpio=lfdr.de,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:from_mime,sang-engineering.com:dkim,ninjato:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 061397443F6


--CDHTHxDTxpMC5KsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 10, 2026 at 12:18:36PM +0530, Abdun Nihaal wrote:

> The memory allocated for priv->blob.data is not freed in the error paths
> that follow the fops_buf_size_set() call in gpio_la_poll_probe(), as
> well as in the remove function.

There is no memory allocated at that time. Hmm, maybe I should add a
comment explaining it.


--CDHTHxDTxpMC5KsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpTXfcACgkQFA3kzBSg
Kbbm8w/7BuU3C2v20yqERaoi5yj/MvUjL3d6rsVNj3Q6ubRu8306g7nh4DzbVEvM
64AAl9HXU74qAxrZ5Le/4GFXTSkLpEbxxbitCCIXRNB7eug3/RX1EGbM7XO2LzKl
3n+yAMsZM9YID95TrxEBsA4d2o0wkkjBH60DicOOITJfw9f8cxMU3Pne3UqXCOS4
edQwjKDdpjNsvKL1DQgV8c8+P/f22odgPhY521APFEJzBAWDULXGc1mt/PQd+Ftb
oB5sp/MsDN2Vjypt2f2TWZzPL7B5rObvWT+21aNj+phrxfQerCyjngftaAoqsONE
/qwrEoWwzDGauoPWIQt/T85TtZ2LMdkFhJDe4PX+XczXATEggaEq0wI6oPra+EvE
YFD6lCvkCLocn67dRtOUJCgKCGqeuofhn373v39c+py96jFrYnNftazqFMZl3DVg
rcxgFCu+3COsyBqb5x79uwVSHgBtE1b+OdHdnU8e/tx78eNPublExKhmnKOrwnTO
IxdJKYV06RIlgxx3nEEaMzxKSJ7kxeMqP8SMKa3Sx2yBKfxHXNQzQouaizZMdUfl
qnEDWmzZU6BbhIMr9sAO/N+Azy5AycPJobfrnBXWWJhlncDPJPqJ9XE87YInxZ90
OGy0dqQJPZZXlwJCvWlXP46mp3iHYDIyXR2KuzN5PspObWFurUA=
=0WDL
-----END PGP SIGNATURE-----

--CDHTHxDTxpMC5KsV--


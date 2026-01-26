Return-Path: <linux-gpio+bounces-31068-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFbJNO1Rd2lQeAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31068-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 12:37:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C27787B58
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 12:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6FA03025294
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2889C333452;
	Mon, 26 Jan 2026 11:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWCONtom"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E9332EDD;
	Mon, 26 Jan 2026 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769427408; cv=none; b=Az6p4Mfccgvo6+otBivjio4IoOC1kOo+JZUbRbMnwPE3dx5tpaunrVD6GESZMUPacdrSamLw6IybkengnSGRXonZAMyAOeFqL4RPXCLLYaXuHAKdHfVxwNVXbpQZSZZlJi7Zw7w/YulfiWntueY/Je2Lc9dHsbqYUa1st3s8lqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769427408; c=relaxed/simple;
	bh=fMW3xln2MzGP70duAqnJmh3ux9jiSOnAfn5MysH+Zf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vB50tS3MoKjWthtRB+HFKqPhQSRoR5Par7H8gQl7RjUc2FF/skGQhhgXt5tRcodGSXVEJKti3rVasw6IduSt7KtRXUpztpvbUQPhBRO+tYpyiB+mtVs+VdcT28HnR8O5hb0zQM85OuuuHb9MwMZbvOCpVqUau+TXFOQjy0ZIQKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWCONtom; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8ADC116C6;
	Mon, 26 Jan 2026 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769427408;
	bh=fMW3xln2MzGP70duAqnJmh3ux9jiSOnAfn5MysH+Zf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWCONtom9UR35t4Jjg3grUOMwMwuvzMOJI1zIHbZ2/aygSZ4SaN2wxDn2cy5JPlRo
	 o0KIKUo529wIjKbFgV5xJIQiSrBq1719FvNQ9QMesPN/ke/CKDMjXRefGv49uttz7M
	 qr1JIeKqOxvVZSfmwqKVLFgZ2nZLxnBxOzqN5dhDnbuq18EevZMcWnyr+SVYSk8L+m
	 vjUvTuHAuuXzTVD7HUmEh5+e4opKlnWszVGJ4qpGcDhLGNpbKnWfF03Qm2auoUr1z6
	 Ykf0IpTSNI5i2zBrDg5w24yv8iTnY0lNdGpG1ocBCiWNbIIG/DWtuX2ZLLk5uqxfv0
	 FQADRLXGkHWHA==
Date: Mon, 26 Jan 2026 11:36:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] treewide: convert hwspinlock users to the new
 consumer header file
Message-ID: <c869a528-8f94-43e5-9f39-e0a6aa412291@sirena.org.uk>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U27r7qI+dLbbzJvx"
Content-Disposition: inline
In-Reply-To: <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
X-Cookie: Haste makes waste.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31068-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,kernel.org,baylibre.com,analog.com,gmail.com,linux.alibaba.com,foss.st.com,arndb.de,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C27787B58
X-Rspamd-Action: no action


--U27r7qI+dLbbzJvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 25, 2026 at 07:46:54PM +0100, Wolfram Sang wrote:
> Point the drivers to the new header file. No functional changes.

Acked-by: Mark Brown <broonie@kernel.org>

--U27r7qI+dLbbzJvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3UccACgkQJNaLcl1U
h9DfNQf8DbjFMTf4Rb2LTOoQjS2RvGlVbcaxAJBcyUFBL5+qR9H5s02vvhD/lqtb
vkxgPBX9XjhK6W/x2BjZOowhS74+Vsi8IVWF0P+rskimDpri9uWVA+19UQ3bKhqD
NCAJa3MPHQcjewDiwKtqNrgRTcnkwFcbCM7uufWpy7JHraLQMxbysBrYyqR9hsOK
De3xCE3fZX7Xu282B7P7dUEzKFhCPUl6uXytbN0GA+NXrF5TAU7BIOVFkDghgyko
Rd6g/XwputLTKOCDYKXgtjCrpKbARTfrQFvJGRbYaKIlnIkXYiCDqNMhvOsDAaVT
1S9DAngxqouYY85AHzBVffc18Fusnw==
=JxoC
-----END PGP SIGNATURE-----

--U27r7qI+dLbbzJvx--


Return-Path: <linux-gpio+bounces-30816-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJFqLq/eb2n8RwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30816-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:59:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7A4AEA7
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D70E050DCBE
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3433344B669;
	Tue, 20 Jan 2026 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkCZO1v4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8A543634B;
	Tue, 20 Jan 2026 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932309; cv=none; b=B/MnDVp0WjB4DLycLILjOtbzt0Rx5vLLQ3Bx6cETQIFqqM91WmpYg92qKFaiLWgXJClThra8j+FQgsCzCF0DT2Q6f6SzGgbr0TlST6BhhdYpTGFqsauU305K4/XsSLWhXWJKsGf6iWpciR07cvwhY2o78msFmL60rdNxlg9UqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932309; c=relaxed/simple;
	bh=XQmS2kPpeKX0VHtoWiz/3XMk2cOzgvJPzSee+Ir9Ap0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXjJ/92gSlRiyqDwZP57i3sbF+u2wujWNV4DGuAIGm5CAm8qc3x/pAejbhvcSSrq6+iKqt2JfTf1FidJzs74CecR5qwWDQ6/xsxSwDBFI/XFW5MD4QW2mqoGc4yvXqQg3TaG40WShrRWxT+qExZhl3JNbReDurW55eCXp+PQX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkCZO1v4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65322C16AAE;
	Tue, 20 Jan 2026 18:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932308;
	bh=XQmS2kPpeKX0VHtoWiz/3XMk2cOzgvJPzSee+Ir9Ap0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkCZO1v4exqk4GpedTDx04NjYU2VgqKsJ/lO1OAYc9CCLwz6CjsIxwc+C7WXooQ7r
	 M0EelZTSlY93r5H+U3gOQsWX1Gi2rWFboQ7qn7trp3TPEjN69zuIxehZcaJYquhlle
	 lzblPsw0/sdLjvmkJnHyGrMtVqiFe2bYPE1zdXu99KS0NBQr483OnPa2ieVqCUqQP0
	 wJdnyUIWG6vk8zXUQ1lR4w3E5j3RIRaqo4KU1LRjPQ+CjJNn/eOWNSLJ/0U0IClXO7
	 u2ROjtIVVsSPu2BWaurK8OLCLVEn1hMXOk0+Hm8b+GJR1HNQQ9NjJRBYciMpJmNt2Q
	 V2derN1L4f/hQ==
Date: Tue, 20 Jan 2026 18:05:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v3 0/6] Microchip mpfs/pic64gx pinctrl part 2
Message-ID: <20260120-deplete-headgear-6bfec966d312@spud>
References: <20260119-rearrange-germproof-3e3096cc0da4@spud>
 <CAD++jL=i5o5JbqD_7jhFY5cR-420Vb3hnNXv5nrTd6-FHon5Dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sJWRsDVAgMp+UCTJ"
Content-Disposition: inline
In-Reply-To: <CAD++jL=i5o5JbqD_7jhFY5cR-420Vb3hnNXv5nrTd6-FHon5Dw@mail.gmail.com>
X-Spamd-Result: default: False [-3.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30816-lists,linux-gpio=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 5CE7A4AEA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--sJWRsDVAgMp+UCTJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 12:45:05AM +0100, Linus Walleij wrote:
> On Mon, Jan 19, 2026 at 12:04=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
>=20
> > v3 here, with the rfc dropped. I've still got the property checking
> > stuff in my todo-list but not tested it sufficiently after the changes
> > to add generic string properties yet.
> > I only moved my drivers into the microchip dir, I'll come along and do a
> > pass on the rest if you're happy with what's here.
>=20
> Looks good!
>=20
> I could not apply the patches because I have Johans patch removing
> the default y in my tree, could you rebase on my "devel" branch?
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
log/?h=3Ddevel
>=20
> Pls make sure patch 1 does not re-introduce default y...

Oh, I didn't notice that patch. Guess it went in over Christmas - I had
a month off basically and barely read the lists :)


--sJWRsDVAgMp+UCTJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/DpQAKCRB4tDGHoIJi
0ummAP4+Ga+fgyvHW+/bnVu1GLYzB8cNCJD/okQn3jUk829+KgEA58I0iM5kBbTl
k3B/5bFc/D4LueRK3I18rRJBZQWpvgY=
=HDit
-----END PGP SIGNATURE-----

--sJWRsDVAgMp+UCTJ--


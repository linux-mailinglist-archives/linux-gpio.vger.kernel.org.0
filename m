Return-Path: <linux-gpio+bounces-35174-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHUVLZio32nQXQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35174-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 17:02:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45237405A16
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 17:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA10A307F4D9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 15:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E493D75D1;
	Wed, 15 Apr 2026 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBIEjdqA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9723101B2;
	Wed, 15 Apr 2026 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776265290; cv=none; b=FIZFSrPGCh/TyHyAkMNz49QoWAUHkKxTUQKAr022pp/sSaGrkwFncU6ZJG6iqkPSbDmboi3K2yPH1nAySu8i31UITYDeiaacW4j65aEyGrJgaQcBCHXHa1zVb1L0N2aCIwzgslz9IXKxxbd2f9JNXECWjmmileU4odIETpih7KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776265290; c=relaxed/simple;
	bh=Y0EBIyq8KZ0in/NVtFdRwCTzpJ4fzIas0PvQK7JCygc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiQBevVihtYRBaNNZcUG1HoH/1Mts1dN1oifMbc97pv4QO8v+wf2cwK/pCrCusTcsIvDefQtJ/K8YNf0D3res5TnW2oZ70umqidAsXcTrntKT16OyzmfoS4+5IIIEluwVsrwI7bKFpbuW7o1wKjbOvfD47BeKxuUlLkOzb6V+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBIEjdqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BD3C19424;
	Wed, 15 Apr 2026 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776265289;
	bh=Y0EBIyq8KZ0in/NVtFdRwCTzpJ4fzIas0PvQK7JCygc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBIEjdqANubEn3fvCpvqk+Tb+ctxXjKRCZnL2m1mr0sNyihL0aiVocFdQXNvkSMeA
	 kNjiWrSrPZYxxF3Dgr78nlZLrWNPf6RiXiWlZB0+Hpk0MHpLADLdtW3EhScvYk4dFR
	 I+JEG65eKJsUWa57Z8yqrMdq7JVkagk0yiqSZ6KyvukojiiSJftevLH0F5bBkr2l02
	 jKDjR+4CQt+mRsGPoiEKAKKlrpeKrAjp63Iq70cFlOVPnFQT4MRDyS0+QbChFhWIkp
	 Wmu9jT39G7F0cjyZpEEdK+nnwJcOBCazxTqabD7OizRiO2JmetjOG8fHnq39r+vZ9w
	 5beBEWTcQxecg==
Date: Wed, 15 Apr 2026 16:01:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: zynq: Sort compatible strings
 alphabetically
Message-ID: <20260415-anvil-gizzard-dba463f90ecb@spud>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
 <20260415105628.957689-2-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jiuRekTIxogybpqZ"
Content-Disposition: inline
In-Reply-To: <20260415105628.957689-2-shubhrajyoti.datta@amd.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35174-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 45237405A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jiuRekTIxogybpqZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 04:26:26PM +0530, Shubhrajyoti Datta wrote:
> Sort the compatible string alphabetically.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jiuRekTIxogybpqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+oRAAKCRB4tDGHoIJi
0gRwAP9DDg9WIcR8ZGsVURYLX8+C53TE2wr8No9N89VLgmt19QD/dPA8/neBHQjd
hm749mFqshArmrmMdLMlwqJvYWOFogs=
=MGMW
-----END PGP SIGNATURE-----

--jiuRekTIxogybpqZ--


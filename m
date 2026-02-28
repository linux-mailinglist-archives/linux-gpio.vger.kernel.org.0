Return-Path: <linux-gpio+bounces-32338-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMvVH+w5omk71AQAu9opvQ
	(envelope-from <linux-gpio+bounces-32338-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 01:42:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EED1BF75D
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 01:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F56D302C6F9
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 00:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE6725DB12;
	Sat, 28 Feb 2026 00:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNQBcO6e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1DD247280;
	Sat, 28 Feb 2026 00:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772239314; cv=none; b=pLe1snVn8+dA7NPDm6svX6v7pxSk/VmilSGpH/kO8Mz55o5VwLa1GeR//I1LH244ZEDW9U73arALFSKRwr+kwuCGiT98XyXEXGoaTXGjrBPoeGJItZ3XQFOfgvZ1h41gHcdJ5q6Tm9x/wAzTpPirMWhD8S3vIZ3PbP9ZAMGphY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772239314; c=relaxed/simple;
	bh=p7AJpVGbGnggrZf0TodfrdL27eS3EJc8aa0widQRDM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MN6bbXeSKnChxaqktY4JBJhSGM0BiDUYunb3pVRU5UfoFwW0lIc40wCFnunAFjW3aAGL4qtIGoR8OAjlc0EZfu5OGB5Sgb95pKGmyMQNa2piv2MsefNXJ/LlfECmo+W4cTrY/KUpBkqkfpr8/70RfEY0WSAYIEuYtV1SYXz9cUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNQBcO6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522C8C116C6;
	Sat, 28 Feb 2026 00:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772239314;
	bh=p7AJpVGbGnggrZf0TodfrdL27eS3EJc8aa0widQRDM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNQBcO6eqZcECYyG2puYQsuSMXuUUi1n8eNLV/RLouSZYAalj33RCq8MMdiLda3p3
	 WromRUULCkg2nCHkR2miRIgGj+jpJv78GGsXgOgKK5c8IkBksItqDrXLNt+Tb8tqkl
	 rQk6DVbfpuJphV4v4ftuHeY+dOaeOCp8sy6njd3fHkxvquoynjQoS8L55+iQBshZwH
	 NDIFlQwOP86WeUSPKmvt8dBHotdMdnS/s+O0IX+HlNlVoLq3WjNGT3HckbhCoUDusL
	 Uo0RKkXLzZLkWoU+TpuU3sntWbsJ+7eiyF1qEX3ugvvL5eQkQST2k4FpkvwdjpizkC
	 8/mTYyGMPcpUQ==
Date: Sat, 28 Feb 2026 00:41:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 0/2] pinctrl property checks
Message-ID: <20260228-donated-virtuous-c18dde170111@spud>
References: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
 <CAD++jLnNPudpxYd8-rNTAudqX2-apM6uZLyBRYxagwtT+LqeaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PK0KwS+MGGuGxX7Q"
Content-Disposition: inline
In-Reply-To: <CAD++jLnNPudpxYd8-rNTAudqX2-apM6uZLyBRYxagwtT+LqeaA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32338-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F0EED1BF75D
X-Rspamd-Action: no action


--PK0KwS+MGGuGxX7Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 11:47:33PM +0100, Linus Walleij wrote:
> On Tue, Feb 24, 2026 at 2:39=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
>=20
> > Here's a !rfc version of these property checks. Nothing has changed here
> > outside of a rebase on v7.0-rc1.
> >
> > Resending because I managed to lose the CC list on all but the cover.
>=20
> I applied these for next because why not! People have ample
> time to test them now.

I did not run a check at any point of all the arm or arm64 devicetrees,
I may go do that tomorrow and see if anything pops up. What's more
interesting is if someone comes along with the runtime warnings I think.

> (Dropped an extraneous newline in the first patch.)

I blame conflict resolution from my rebase for that one ;)

Thanks for grabbing it. I still owe you a generic function to replace
the amlogic one that I moved, but I have been busy and not picked up one
of the spacemit k1 boards yet.

--PK0KwS+MGGuGxX7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaI5zQAKCRB4tDGHoIJi
0kT/AP9KMD9JYiP0dN1JBRwvA6+atBZeCTqMNnQROF1hMHXCcAEAuXwTc7np1+e1
uvaVFjHG4oHJMTHLlFXl9k02kclA3wI=
=tUXe
-----END PGP SIGNATURE-----

--PK0KwS+MGGuGxX7Q--


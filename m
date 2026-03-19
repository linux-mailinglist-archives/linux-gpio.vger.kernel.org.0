Return-Path: <linux-gpio+bounces-33840-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAgFLy4qvGn4twIAu9opvQ
	(envelope-from <linux-gpio+bounces-33840-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:54:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD62CF2EA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98D5131DFEA5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 16:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C553EE1E4;
	Thu, 19 Mar 2026 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/at+ofX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D643C8701;
	Thu, 19 Mar 2026 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938813; cv=none; b=Q6kOJhX603vyKNiEf221D1leMx6MLzgzDtcU32Ru6y+WKG20j/+/c63s0UuBgFaxTThirowkmEvf9S5jlFVuhA3pyPA9kuz2Mj/mau1PyxnIuikEW5N0qwqNNSGMba+408KknNOKkOMHS+ChgPKE/DLrecXkxEXL+E9OAYCADsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938813; c=relaxed/simple;
	bh=GERYy/Od5aPTBnAMxVWqrm0W+xyQqIzbtLRcFBlUSXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXbRbiVQ03g/DimOSsPBTUZVyyfyvOwSbgnoBkyaaSXSBAbUDHHdVnisCxtg+JcpbQCOflr73yZ7tYba/+SRlfF+S03iVZL+g3x6A1cEhjLk76fYrn/7GyItJyDMJUeII8UBtvaPTOJclT9DWa2DoxhXQLWLQhFoT2AUXG47BgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/at+ofX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407F2C19424;
	Thu, 19 Mar 2026 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938813;
	bh=GERYy/Od5aPTBnAMxVWqrm0W+xyQqIzbtLRcFBlUSXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/at+ofX7q/fOxkkWtA1a3d20d6tomeA6a+qzkSx4Zef2UBw4c06vUNwA6k9gBHxG
	 22tMGg0AXXjk9TapBGrDzncRM29vypwQJTezup8K+ThrcFIXmobYUnTstL9BJOA1S2
	 l1DoLJSdcUuFWNsuox9CcFXuxBn1blcwJoKfbKRk0OHKUTogRW0xjg+VBENjaaL0yn
	 flU78toU+k6ctFPaYpw2ftk92H+LodGA8tfkd9AMRacUUtzo/qMIG+IZk2iJKIbdZh
	 XdbWKtQ+TWslGce9FIw3OdiNf56i9jMlA8LicVCPz3cLyD090tGKFEZyOKAzMZTFQv
	 uBoifCRwX1LMQ==
Date: Thu, 19 Mar 2026 16:46:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document
 pin configuration properties
Message-ID: <20260319-delegator-clinking-732b793c0682@spud>
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Rx0+W9iJ6oCNSUj"
Content-Disposition: inline
In-Reply-To: <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33840-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64DD62CF2EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--3Rx0+W9iJ6oCNSUj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 02:15:14PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document the pin configuration properties supported by the RZ/T2H
> pinctrl driver.
>=20
> The RZ/T2H SoC allows configuring several electrical characteristics
> through the DRCTLm (I/O Buffer Function Switching) registers. These
> registers control drive strength, bias configuration, Schmitt trigger
> input, and output slew rate.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3Rx0+W9iJ6oCNSUj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwodwAKCRB4tDGHoIJi
0obrAQCvn8s5zeSyCDwl6roxhUmsJ2AOWtXmnnMei69Ua/54BQD9Gu5+UPyrs1S2
/1MPDUeTa29xuFrnuxrwqf2NzNGttw0=
=xOc/
-----END PGP SIGNATURE-----

--3Rx0+W9iJ6oCNSUj--


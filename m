Return-Path: <linux-gpio+bounces-34452-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD3NC2x1y2k3HwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34452-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:19:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDC1364FC6
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 09:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF97B30B5094
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 07:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD442BD02A;
	Tue, 31 Mar 2026 07:10:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FCA38F64F
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941053; cv=none; b=b7b0iwtUn9+ulCRVT0o36oUQrLCXYVrNk7VWTREqMZ94sr827QKLBRX81TZDcp5AGcEYRy8ioTwCMTTPMHqZ3uewfrnVrSwDQ6n/cjsX11nqth2S/34G9W2R+kYFIjP607foVrbOTQbwe8fsdWrvFQv2DW+AjpVqFgdQgOGssQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941053; c=relaxed/simple;
	bh=5gpgYRLnbSNFscf1Q1NHWRl/4eynSze1FCD1K0u1oaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppi6w+ty/+JsIl5X6zDWgeFRpBXoH5LO/8krQseRL7XchHTstTAumiEF1RO55gPM7tsdH5ygcOvZbwvCwWcR8xeHNJWEMJ4n6s/sVKfw9xD7clWhz0PMa1VfSFLYhZ9oDOytgHhoDkMtjPHfBIH2n9sa2zUMy65sqZGcAN1M+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w7TEn-0005cr-Lu; Tue, 31 Mar 2026 09:10:09 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w7TEm-00302T-2l;
	Tue, 31 Mar 2026 09:10:08 +0200
Received: from pengutronix.de (unknown [IPv6:2a0a:edc0:0:701:471e:8ea9:4bec:c12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1F944511D74;
	Tue, 31 Mar 2026 07:10:08 +0000 (UTC)
Date: Tue, 31 Mar 2026 09:10:07 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mani@kernel.org, thomas.kopp@microchip.com, mailhol@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, linusw@kernel.org, brgl@kernel.org, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com, 
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: can: mcp251xfd: add
 microchip,xstbyen property
Message-ID: <20260331-shaggy-blond-weasel-1bf32b-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
 <20260321135031.3107408-2-viken.dadhaniya@oss.qualcomm.com>
 <20260323-bonded-ranging-c9f9c4d0aacf@spud>
 <20260323-artificial-ecstatic-collie-047169-mkl@pengutronix.de>
 <20260323-surname-osmosis-3cceca19c824@spud>
 <d4e092d6-5d9e-49a4-88d0-c02e2f17f36b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gvr3ft3j52edqxpi"
Content-Disposition: inline
In-Reply-To: <d4e092d6-5d9e-49a4-88d0-c02e2f17f36b@oss.qualcomm.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [-2.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34452-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[pengutronix.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkl@pengutronix.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.770];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:url]
X-Rspamd-Queue-Id: 8EDC1364FC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--gvr3ft3j52edqxpi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] dt-bindings: can: mcp251xfd: add
 microchip,xstbyen property
MIME-Version: 1.0

On 31.03.2026 12:15:26, Viken Dadhaniya wrote:
> Could you please let me know if the driver change looks acceptable to be =
merged?
> Once merged, I will proceed with posting the device-tree change.

Applied to linux-can-next. It will be included in my next PR.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--gvr3ft3j52edqxpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCactzTQAKCRDMOmT6rpmt
0ljHAQCN2W7NzJyFY0dzNqqglCyalyp93y3AkcphLuv3tVojLQD/ak7VSTbgCUkv
TSCxRH9IUqWn8Ux2NiLt5sstO3CZbAE=
=Ic0c
-----END PGP SIGNATURE-----

--gvr3ft3j52edqxpi--


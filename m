Return-Path: <linux-gpio+bounces-32135-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK0zD1msnWmgQwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32135-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:49:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1186187FC0
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 14:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 554F330DF84C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 13:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7967739E6CA;
	Tue, 24 Feb 2026 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="B6PywYTx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0093815C3;
	Tue, 24 Feb 2026 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940625; cv=none; b=TtuazjUuAAQTvvZWfJDya7jbK0lX/YC9FGqgeqnC9ssdITLYDMG/utaEG+bY5ScqH8Qai3hEbASZujmlM1govpVSnZ3zVg4ZjQ6b//Rw8TdTf3BKpqOdrFkuXwNJqqUduw+SJhk5wMqxpJloe5ShrGJdA5XIaw8MP3WI+0Wj+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940625; c=relaxed/simple;
	bh=xL01IjLFHvvMz98oB1ByqjpoK2P/AyRtX+VkheSnlWo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jslOp3rHXAn1qocF6W/YteUc465QjffZWgciWOSvmpXdGq0U9A0BfMw2UA8C5fDb+4IWzbI4jqay4xJf6j1wyYkFR3ZfemklVLzJvzeWenXzCH+kFn6AZIP/vH1Flkan754wBylPQoyR1OSYkYHuDaBvvyi1lrSrRODsTlcMRuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=B6PywYTx; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771940621; x=1803476621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xL01IjLFHvvMz98oB1ByqjpoK2P/AyRtX+VkheSnlWo=;
  b=B6PywYTxj/JXZzS/8Mxu3hDCrT35yCZB9VT7vAhYktnUhvpyEDRiHZqg
   bPu9an//WukVl5TRgWOrOwhRyB36AWWyA1rPACbxdU8U5jYORPTvlUf2f
   qSE3hm2rSCJ1LNte7I/hsygnw9yq8nDZhI3qadYDc0pgtPvNVHCMhYsVd
   AcsIF6WXmBxProacP66hXJG02T1hY0tNP0Th7vClh4DngQQhnBQYpCK7f
   MlBYm1O5qqsiG/XPM+QaD64PE2L256Evwgvz3tqAD765rQ3E1JpT8dpYi
   hHgNJTiSPTnBWOT+/P8olVEv7IYBRUUWiGG3Ow4Hi5u/8kle/JX8WVVNP
   g==;
X-CSE-ConnectionGUID: BgPG0VRzRYS1fdVVOtS3jg==
X-CSE-MsgGUID: 5WoL9P2ARxyUyVcR9/m5+w==
X-IronPort-AV: E=Sophos;i="6.21,308,1763449200"; 
   d="asc'?scan'208";a="221056437"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 06:43:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 24 Feb 2026 06:43:16 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Feb 2026 06:43:14 -0700
Date: Tue, 24 Feb 2026 13:42:57 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] pinctrl property checks
Message-ID: <20260224-roundness-colonial-43f9f21c393c@wendy>
References: <20260224-backspin-ferret-7887166e4aa4@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MzwfhSPf7pvo/zKj"
Content-Disposition: inline
In-Reply-To: <20260224-backspin-ferret-7887166e4aa4@wendy>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32135-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1186187FC0
X-Rspamd-Action: no action

--MzwfhSPf7pvo/zKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 01:30:15PM +0000, Conor Dooley wrote:
> Hey Linus,
>=20
> Here's a !rfc version of these property checks. Nothing has changed here
> outside of a rebase on v7.0-rc1.

I've resent this, didn't notice that sendemail.ccCover wasn't set in
this machine's gitconfig, so only myself and Linus got the patches..

--MzwfhSPf7pvo/zKj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ2q4AAKCRB4tDGHoIJi
0rxCAP4tZyefCYj/k33wmF3X9Qa6sKb622aW5+ymD7B5XQpwfgD9Gu/84zSVypJL
Luv7w/CQNmf6ZUWKxUHUDIhBWtLKlwE=
=Y/z/
-----END PGP SIGNATURE-----

--MzwfhSPf7pvo/zKj--


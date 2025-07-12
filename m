Return-Path: <linux-gpio+bounces-23192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41039B02D2C
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 23:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3B1B3AC60B
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 21:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE26A1C3C1F;
	Sat, 12 Jul 2025 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="QNoetQzs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A02BE4E;
	Sat, 12 Jul 2025 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752354918; cv=pass; b=gY/2RMMdrBiDrM17R6lryoSDKnIuxj74xo4Dd0qtpb0zTVOOc2od8LkGEVsbxa2k5OHmtfooywt+1N7M3E9R1riZSq5Ov3idzKkSuljAEcc0Qx8/A3wYoN2UbtjAIprYNJ0S7F5PqGF42bXHRWScj/dFck4uUTlfr/NzpMIavIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752354918; c=relaxed/simple;
	bh=pAWwdXVs7ZXsCxQbV5vg5e5/B6leWiXzTnTU4Ye8vRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoM4nT/UWKT4LOWBUCU+kqD5QtD0gyJ9BVwIZGXdNxuhoU37zqYrWm6PBWORPqiJFDHgTpJwA1JXFZBIMfWkKdqHLvFOzopeazZo/c4F3UqkgnSUHX4vAJf8vz42o7a2g1dQ/9ETvRIsyx6XWes11/ZV4tas0DB4gJqaNWY2RK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=QNoetQzs; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752354910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H2CbjYs8GO3Ae+KC2rRWPafh5M3VOsKocKv10pBI7RAnGj2wo6NQGsw9VU2hM6yRhmnqGBtxN7945hkEdATI0BdJ2YD5MS9pKYQSF6Diw1W2yxFTYIXRE9FKvQXoIQcEeKyHWgQ2+JdFTw81I41TPaR5CBeVvnVrTTxt0d1+3qs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752354910; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bX6Q7B11PstjYpe2uRcjVISnIPFiyT9REbHORxLHdXM=; 
	b=Bw4Gfit3OX3//LXPgBxcBtGLLlveL5hbYSQMy4Wr76uJAju2rwcuccrf92j84j/HFhSPlFWhZPFLw129i+7lVkoTiJYCjZkgdOGB2rZ3ci8vydG6F7i4FPWqBcWq00hgLvSw4xI+mv/jxcoBLIv00qqUZzIFJy3Jv2zbNg/6orI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752354910;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=bX6Q7B11PstjYpe2uRcjVISnIPFiyT9REbHORxLHdXM=;
	b=QNoetQzsZyegw8QFjIR2Sib+uf5tMjPcHVFk2/s7Yq6P2ucTOPj5jdffqBDc1gyG
	pMYxopoa/uZbgzkuVE+/TJPWzyOcpzX3b124BuxfQVbPGzpOQVRzEg8iR7vb9b2rWOT
	raKg2KiWR3E5AHpWoWjrLoMClj/DTNhCZcsyhSYs=
Received: by mx.zohomail.com with SMTPS id 1752354908788353.79323311851226;
	Sat, 12 Jul 2025 14:15:08 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 3F05E180F0F; Sat, 12 Jul 2025 23:15:06 +0200 (CEST)
Date: Sat, 12 Jul 2025 23:15:06 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: remove bouncing address for Nandor Han
Message-ID: <5offogdzedixircmncso7wzswgh3ancblpydnelbbqw3pjxdpw@qcgnpip4g4xd>
References: <20250709071825.16212-1-brgl@bgdev.pl>
 <se5ok3bzlej4gecaep3albatkigcczsj4ailmulqebd737qe7a@ly3vlkqhgm3q>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <se5ok3bzlej4gecaep3albatkigcczsj4ailmulqebd737qe7a@ly3vlkqhgm3q>
X-ZohoMailClient: External

Hi,

On Sat, Jul 12, 2025 at 10:28:26PM +0200, Sebastian Reichel wrote:
> On Wed, Jul 09, 2025 at 09:18:24AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >=20
> > Nandor's address has been bouncing for some time now. Remove it from
> > MAINTAINERS.
>=20
> +Cc: Ian Ray, just in case somebody from GEHC wants to be notified
> for this.

Apparently his entry in MAINTAINERS is also wrong and it needs to
be @gehealthcare.com now (at least that is what U-Boot switched to
[0]). Let's try again :)

Ian, you should update your linux MAINTAINERS entry in MEGACHIPS
STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/MAINTAINERS#n15490
[0] https://lore.kernel.org/all/20241211083136.66-1-ian.ray@gehealthcare.co=
m/

Greetings,

-- Sebastian

>=20
> Greetings,
>=20
> -- Sebastian
>=20
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  MAINTAINERS | 7 -------
> >  1 file changed, 7 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index efba8922744a3..c780cbd11ffb9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27466,13 +27466,6 @@ S:	Supported
> >  W:	http://www.marvell.com
> >  F:	drivers/i2c/busses/i2c-xlp9xx.c
> > =20
> > -XRA1403 GPIO EXPANDER
> > -M:	Nandor Han <nandor.han@ge.com>
> > -L:	linux-gpio@vger.kernel.org
> > -S:	Maintained
> > -F:	Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
> > -F:	drivers/gpio/gpio-xra1403.c
> > -
> >  XTENSA XTFPGA PLATFORM SUPPORT
> >  M:	Max Filippov <jcmvbkbc@gmail.com>
> >  S:	Maintained
> > --=20
> > 2.48.1
> >=20
> >=20


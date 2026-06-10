Return-Path: <linux-gpio+bounces-38280-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SYVrAVKaKWoEagMAu9opvQ
	(envelope-from <linux-gpio+bounces-38280-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 19:09:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14066BE00
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 19:09:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=EsRNzYFn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38280-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38280-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C72FE302BCDF
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 17:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C4A34752A;
	Wed, 10 Jun 2026 17:09:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0682E1F06
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 17:09:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781111369; cv=none; b=exaseYPn1UYoNGrqIPpfShz3T2X9vtuPyPZrCEJteCEtenIU32qBh76BTmht4DthHzdJXRBMQqNFNNJdvwSM766LRDNb+9GYWS+Lfibep0LJ+WLkROoogf2rK5X7bHZ+KtEmwIxhpO3EITm4Ne6Riv4aoz6YtSSvTCYqCLRu994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781111369; c=relaxed/simple;
	bh=EfcKoOyON92U/4q+KcJVJUy7EEBLgJyqmWyHBdmVyTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG46c635eI9QvagoGMqgf16d83fA3qxTU3b5PMi4/tje1oHgscbBGHyg+CI3xM1+qZIrC4sVhrAitWX6lV6Lv6WMXEavI+EhmU9GjrA0qCf0KvNG4DiVW4QCX4cCJWERMp4AKhAjJREf1HeUdhkgnn3jYN6JxCcMx9DEbFn2pMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EsRNzYFn; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4600ddc4017so4861802f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781111366; x=1781716166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EfcKoOyON92U/4q+KcJVJUy7EEBLgJyqmWyHBdmVyTA=;
        b=EsRNzYFnpJ6MC4ZMHW4/kIERMRpO0dKFqRAO8go5JANnasGl1MIDXez2BEX8aKnbOQ
         rUnhmr3q4CNZwqSwYAX3B085DLlRELr5cnKEC3JwiFQiIolkWU7sIoOEk2xczD3cHG0A
         iYKuveZzsqWX5gNZXCNiHIbNPcQg94U+ZsIzZsdolQMJC8vt/Eawcn6iudQ0tQbLA2js
         UYoo8fw5Ng4X8Tm3l3VFkcFzPCOqBt+kCvfnxG1ae6atwnznz/ZPjDJevnJhlzTztaHj
         IyCcl45EaTiJBn9PQ7MO/g4i5QWYUIEit0glvFrUJZC9R95CrHJzBkNkxx+X+qssPGSD
         1Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111366; x=1781716166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfcKoOyON92U/4q+KcJVJUy7EEBLgJyqmWyHBdmVyTA=;
        b=mxLYSNuSqC9Dpi7laPC/KOgYrRgwwAtAzhvmflU+Cv8DnlmUrsC6fEkT86iQzLgQ7k
         QLfGXqewdhbRSLppc5bGnlLGyIcIh5xDJyguORdW0GUhjU+Xic9YpdSScuqtTSOfHdCI
         hb5ps1y9AQr4TUHwRPLCGt8cuKIe7gaw5mOVGy4J51E7nqhsmv/KJYvUavhJ+WOULs/D
         pi56mUeI/+mwEVYe8lP3E8F3Pej8Cqkcvh6yDa/8XtkVHO3CH6+7/UNkDrWFJ7UlBzH9
         221k1KC6853QpBmUMh76e4ZwFLc/t9cILMXTo+6pE0KRvsIXkmahbijznoDG9N9r9Rpv
         YvFw==
X-Forwarded-Encrypted: i=1; AFNElJ+L2dDtr2peqI6ZNBe+yGMjq1uo7nkIdbA41sJDIf3egXEzrcXfdFT6fXDTvghszAV+df6+7FcFMEp2@vger.kernel.org
X-Gm-Message-State: AOJu0YzuVJHNuAm9PE4b9tY/P8duTi5PB3pcNyKU5og295og0a8LNkHR
	bhd+l2Mjcubrb+07tkJJ2NICj3tBil9LC0a7UWBIe0ZlXgZB1Da7UwTHjIqRxUvqNt4=
X-Gm-Gg: Acq92OHWRp7HfmG8kVckxd88jxdNpecYj/sRVhSmBqDA+BUnldHOQ6pyd8PjGI3xtRk
	wwpoH7mMyYLvGer8iI6QG3/eMhVesoI2n0q5sNiWS93twwcGHZi02idK4S2ukzt/l/Ng7pgqxan
	YC8bGeK0Rd7U6xe1sZkCt3VtisoWLo2Vv3qkCXGji6cy2hzAet61DujmV1L10GDSIGlUcK34dxm
	o50ePe3M9tQnjB2fIrQrUiQ5sKFBhz0cCLVyK3RAZxV6QhvomNDI7ik1P/ZqQ6XPgKl6oe/0zr7
	T/FUcuDiE8ZBuvAOh/z30k2EbUI/i7giPi+cD/4bXz6jDap954nX1Fej+1A7YHFBbjine/DYiQ8
	HO6dP+/fgp4xW1GVMDirg/A92gdewh7LmL3ekIsi1lUrFIeYQxUsc8ZvLYgJovTVyriMPQZqvuZ
	LLtu7PagHmmvG/vk5RhMP7Y1FNJtCYv4+LV4BU1yESK7mImzMmbAbgs2ibQXg9zz2XXVs+yAm9M
	AFSwiuQ6qwvNzVnn6hUCPAVNg==
X-Received: by 2002:a5d:678a:0:b0:45e:f381:cd8a with SMTP id ffacd0b85a97d-460302dcad1mr27957605f8f.2.1781111365865;
        Wed, 10 Jun 2026 10:09:25 -0700 (PDT)
Received: from localhost (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46028a6dce6sm65899739f8f.30.2026.06.10.10.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:09:24 -0700 (PDT)
Date: Wed, 10 Jun 2026 19:09:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aimZ-yzZ1hAut_KF@monoceros>
References: <20260517134835.588648-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2kikhdq3f73oaosi"
Content-Disposition: inline
In-Reply-To: <20260517134835.588648-2-u.kleine-koenig@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:patrick.rudolph@9elements.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-38280-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,monoceros:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B14066BE00


--2kikhdq3f73oaosi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] pinctrl: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello Linus,

On Sun, May 17, 2026 at 03:48:35PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>=20
> While touching all these arrays, unify usage of whitespace in the list
> terminator.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Gentil ping! I'd like work on the patch series that builds on top of
this patch. Do you still have it on your radar and maybe even consider
to apply it for your v7.2-rc1 PR?

Best regards
Uwe

--2kikhdq3f73oaosi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmopmj8ACgkQj4D7WH0S
/k4gsQf/SpNfALxM1ksnLAKy2EqmxSFxoM4gnFh8y6BDn82gNMVZACdsIvgmet6k
/ZUMn2iAF3byFbtir77EZ8ybSuUqXgK/aSJVFmU2zB2pDeXC/4ZJhpWXSKRI7gSo
molF6U7V5LXKR9YQG0MInfWS6RbH+ffsGGVqLrn62Tc73ZfyUPdgGOs9cOBDAVEo
ezEIfU6Vu+bKDjjAZ0IQQeeYS7aT+o5Ycpu8SdcHXLfky++41HWX+hm1aJV9crtW
tbo72JKtnj2rtRdlVyU6x1JbereCKQe8Ez71A7XM41XBbpLV87xPHz0Sko5y1tep
HhSzlbE9Jj0k3SO/menp7syGO5mGPQ==
=yhDO
-----END PGP SIGNATURE-----

--2kikhdq3f73oaosi--


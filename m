Return-Path: <linux-gpio+bounces-35197-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HAmO5zy4GkZnwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35197-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 16:30:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5771740F941
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 16:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 107D43050231
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 14:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5C7217F27;
	Thu, 16 Apr 2026 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJ6zi6Ln"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B914A208D0
	for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349843; cv=none; b=Rtz7BMSVsbsnQcynFeIYK7KBUP4oWXisPIWZnRxDK+uBWEy8/p4Y+9MeeD4yE2JunWfj/LEZPBeesOX3/lRfQQEx2Lo4ZDvJ3IZSAnEQZjm2fzrVrWJJsqx8QlbcgYeUX4wHeztsywkBnVowfIR8mkXg/Xp+sSOT73xRQChO2zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349843; c=relaxed/simple;
	bh=gfLBIxCP9gTBkqUQkCDioJa5j+uF4TVTBk1UlYn4f1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xd7jtsYVexCNc8Wf3DjAfmPxdgtAlWY6dRLV7w2t46hzh+YSKNOvXQbpIVjFkzf0/AHb3gGUFCeDI1PAx6FhOsWa2nJ0+VnZAHgCv3YxextPnEo91QkzHJdI3tWV+6eIxo1Wdz3mWhr/ZD7ACPe+ufAtmRy1MWMagpnszHFSF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJ6zi6Ln; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso96438365e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349840; x=1776954640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+kwLEL1gpqQktpl52WXxb4CxP8KVAiLEC1DOuEVmbLQ=;
        b=qJ6zi6LnKLsu+MVzgdExoi4dB2CNROHGceCpeUcLO51pEu55t4jM8ha3AaKgEZMJn6
         dTKO5cmYsRyBj1MlZOzVWvvgkDbyOVvDTucPxMIAzpwdwEOf5d0P5OldH5rf1mO1513S
         ypzDiC19vgV+PW++gkvJcfSsCbWD4Y3bvoWTvsamW3lPgA12JPcEcki4AluTghtOCc2n
         kflv7+hQG8A205uy7G8Oa4FoBithYCUp6WuV9O16Tlzja8B659SFVbZFmznNcSN9N+hg
         ghxj0sGUTdxGJ6RpBttuPuJ/mlO/xV0R4lmSPdxMSHuV/FDtoaGYEwiayhC0JkWUUkkz
         9bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349840; x=1776954640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kwLEL1gpqQktpl52WXxb4CxP8KVAiLEC1DOuEVmbLQ=;
        b=hN1zBZFn/mIdgqq8q+LjW8qjWMxzAZQG73zO3pUnu5Ljuw1snih48DLAy+1Qnl/UZz
         IxadyvvKI4rnHSaOLL6UdqB5tWclADfDTOwX9SZAW67gxn9NqQ8/+urrFZ8PXgBa+R98
         G0H9EhXMBebhbasCy2PzPd6IPB3q5YqnfjXhqKy/MrS0hV5pVU+GIXgy9tssgpoAZZIB
         B9XpetHXFt1omJz6F5kLWA2A4pd2lFKQj/LbyeQNV1ObPoUSwU0LgaIhaKTJDYDHJY0M
         y5JamuWX+h83N1TfS1UopBURdbRKrcU4mpvE6lAOl/8YAaK/YjAtDwJgj1WPTEhOAe4u
         GSoA==
X-Forwarded-Encrypted: i=1; AFNElJ/SWuDw1UtcM8RmAawY+yaJmJ/SWFkBpAy/ak5RLMwTkxwLya3twuMQS4ZgXAxgx8Q912Z/ywDIMkev@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdvkBdtKhEV4MDmqO6GWocBCj5K8ny9LKasCcRTw1pTT2joF9
	BlOgMDY6BA9n2KAOQPfumLgmgJmgk0Ibdtfy/7LKtRqGU0ca8RFAnU0S
X-Gm-Gg: AeBDietVfvs+V9HV/oGJkGrPXOkeJ/38vapehTyNA6Q99JYluJf4ESVW0s7yW2F3apa
	kjrjtSPWba9rnD2vH2UC+Yoz7yhkXdwK1gjp0vsoxJ1HfQB2ayLbWL++HBDaOMsinc2GujWglHd
	CaWURbpkmZ1FHbJpcWSTCkqM41HBKL1vYlHkrdLkjDboaq3oF7VHsrMObPNv01i65ag3TlJOTum
	AFfPZwCcXWfTAZ/o2y0hV497bAGy2PL0c5psWGSZZLTw/rNo8wZb6hd/eUHgDqr3dv7QD5K5gP5
	14eYsDBkL5QnS5a3VwxN/XimauuDlFV/3390ZoKAbVDYsc8xwaN5ydmqh+UdU/ooZfCl0azlKYV
	cSW4Fl0HhFHiHI6vy4mzQ843HLd2aL4rrQWnJbxPFszrMTl98TQZib4v0eLuRlBkC67q+UdZU3D
	pFQpVgpy95AYD9ZCFJn55AaR6JjQpa6W3J6EtJ3apU7RYsTCct/rkSDUcxkqZtM+6ysEQFKrEuB
	BjjuJwRTgcVrSJsicboEAjr
X-Received: by 2002:a05:600c:1391:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488d67e6a48mr377654785e9.9.1776349839862;
        Thu, 16 Apr 2026 07:30:39 -0700 (PDT)
Received: from orome (p200300e41f131500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f13:1500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5813970sm54034215e9.1.2026.04.16.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:30:38 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:30:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, pshete@nvidia.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, bjorn.andersson@oss.qualcomm.com, 
	conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org, 
	geert@linux-m68k.org, krzk+dt@kernel.org, kuninori.morimoto.gx@renesas.com, 
	linusw@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, rosenp@gmail.com, sven@kernel.org, 
	thierry.reding@kernel.org, webgeek1234@gmail.com
Subject: Re: [PATCH 6/6] arm64: defconfig: make Tegra238 and Tegra264 Pinctrl
 a loadable module
Message-ID: <aeDv2oI6lJOlfJxR@orome>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260409131340.168556-7-pshete@nvidia.com>
 <9408f231-7a12-425c-b8de-2990d3162bb3@kernel.org>
 <097f71e0-cbc8-44e3-ba60-8bac79cf5217@nvidia.com>
 <19f390ab-ffa9-4237-9f24-ead07b627a89@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zdz2kxftdpnb3xlu"
Content-Disposition: inline
In-Reply-To: <19f390ab-ffa9-4237-9f24-ead07b627a89@nvidia.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35197-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,vger.kernel.org,arndb.de,oss.qualcomm.com,linux-m68k.org,renesas.com,fairphone.com,amd.com,bp.renesas.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierryreding@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Queue-Id: 5771740F941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--zdz2kxftdpnb3xlu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/6] arm64: defconfig: make Tegra238 and Tegra264 Pinctrl
 a loadable module
MIME-Version: 1.0

On Mon, Apr 13, 2026 at 10:49:50AM +0100, Jon Hunter wrote:
>=20
> On 10/04/2026 09:25, Jon Hunter wrote:
> >=20
> >=20
> > On 10/04/2026 07:37, Krzysztof Kozlowski wrote:
> > > On 09/04/2026 15:13, pshete@nvidia.com wrote:
> > > > From: Prathamesh Shete <pshete@nvidia.com>
> > > >=20
> > > > Building the Pinctrl driver into the kernel image increases its siz=
e.
> > >=20
> > > That's obvious.
> > >=20
> > > > These drivers are not required during early boot, build them as
> > > > a loadable
> > > > module instead to reduce the kernel image size.
> > >=20
> > > So you replace built-in into module?
> > > >=20
> > > > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > > > ---
> > > > =C2=A0 arch/arm64/configs/defconfig | 2 ++
> > > > =C2=A0 1 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defc=
onfig
> > > > index dd1ac01ee29b..f525670d3b84 100644
> > > > --- a/arch/arm64/configs/defconfig
> > > > +++ b/arch/arm64/configs/defconfig
> > > > @@ -711,6 +711,8 @@ CONFIG_PINCTRL_SC8280XP_LPASS_LPI=3Dm
> > > > =C2=A0 CONFIG_PINCTRL_SM8550_LPASS_LPI=3Dm
> > > > =C2=A0 CONFIG_PINCTRL_SM8650_LPASS_LPI=3Dm
> > > > =C2=A0 CONFIG_PINCTRL_SOPHGO_SG2000=3Dy
> > > > +CONFIG_PINCTRL_TEGRA238=3Dm
> > > > +CONFIG_PINCTRL_TEGRA264=3Dm
> > >=20
> > > No, you just added as module. Why do we want them in upstream defconf=
ig?
> > >=20
> > > Standard question, already asked Nvidia more than once.
> >=20
> > Yes :-)
> >=20
> > Prathamesh, what we need to do is ...
> >=20
> > 1. Add a patch to populate the pinctrl DT nodes for Tegra264 device.
> > 2. In this patch, only enable pinctrl for Tegra264 because we are
> >  =C2=A0=C2=A0 lacking an upstream board for Tegra238 for that moment. I=
n the commit
> >  =C2=A0=C2=A0 message we should add a comment to indicate with Tegra264=
 platform is
> >  =C2=A0=C2=A0 using this.
>=20
> Thinking about this some more, I think I would prefer that we skip the
> defconfig patch and just add ...
>=20
>  default m if ARCH_TEGRA_238_SOC
>=20
>  default m if ARCH_TEGRA_264_SOC
>=20
> ... in the respective Kconfig files for the drivers.

I know some people have objected to this type of construct in the past
because it means that you automatically enable these drivers in configs
where it previously wasn't, bloating people's test builds, etc.

I also know that people don't like it when we add seemingly random
options to defconfig.

For this particular case, given that the options are dependent on the
per-SoC Kconfig symbols I think the "default m" above is a fair
compromise.

Thierry

--zdz2kxftdpnb3xlu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmng8ocACgkQ3SOs138+
s6GLDw//UkW/3SDVTez5uuRcccg2eBGqX/zaY1yU6TYz909vpObsLW+WrxFfq5Un
qspGtIXmoOokDmBhG8UNvSainJ/q8PKsEfUIO7+jzvmr/FoxFdttJO7Ouo2D7SQL
FuOg8npa4zaeybyh/PSr/XK1ET8CFJ8uJ7bNo7dq5lvnLA4LxRRrGgbJPUQYzIAK
ZA8kwfGqWN6ZSaK7L57hRg3iermVGG803wyscNiFE3Vgqy7HuNjnFy79JIcYsvll
cixH9CydPAbgzXyJK1vdl97JaMpm/PhfclkEq5tYycCRSTWp7FJuGrRizzDOeUaD
8VyrvMmA1qnT/ou+oTi9OUaroPtqCWRebTkAKEy0toLCHanv9Tj9HoZYfSccos6i
u2ZMQkTXTj5+2mdF8WrRq1F9arlq1K9Thox4K7XSq16rmu3mhd35qZy0wtXmlgVi
3eUbtiD5oQ/syXHRCcm1XsMf7t1LWwGBsiFGXeiMVTJ7mrN59MwVft/1Z8vKkM8o
YRbsW3shvFvQPQfJwiTLtxO2TDcgs43iOyL4g5CjHhYdt+SFOpts85y4Vuk2/3l6
SJOFv40RNRUWeIl+PGzIgmVJmaJkYjQE9bLUQQzwI0E0nY9M+tEs6j4fCvlEXLij
PCSXdQILNYyGAv6rccvVV13KUuQWvuldNdTr7e9AR0ceMYen2u0=
=RApE
-----END PGP SIGNATURE-----

--zdz2kxftdpnb3xlu--


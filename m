Return-Path: <linux-gpio+bounces-30654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B22AD31558
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 13:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E748B307BF7C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 12:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CCC2253AB;
	Fri, 16 Jan 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxBBS7n7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267C2135C5
	for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567865; cv=none; b=SONlQ4sAkyKzA+u2Stbi+fwRhtMIzCVZrnXocDatSLg/42DHPCzP2uSr7QBc8BupnOpw29JqFk6Bt5UsW7kPH2/myQjXBTaYJxV5Jssi3LnLmOhVg6sKQPPlKDXj2/2DHJNd8GJd+0q2WEgf/L4vXEBfaGi0SOOSe07LxmzlPuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567865; c=relaxed/simple;
	bh=DSALMvzBwB081u4Jt8c9NpYNawx04HscrqIhArOIoek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIUG41DFt2IaM0phNCYvVyGVCU6ofWEA5XEV3wDRrimkLu2KGaB+FWjpqHPTsRUjtlhBaD02aX7EqOBfAQCdCDoFxNRaIcKrI3M7IuIGXYjBtozk4o4h9zQbhk9M17SFXHPaWrFb4caaTT9mOklV/+k7gWHOps349jDJRBxcOHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxBBS7n7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1477982f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 04:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567862; x=1769172662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=KxBBS7n7iqVxeR9Hb6Vd4u5g7iWEVl9aTG5LuuuEdQfRIN9cFeE3sLlPuipmGoyAJ/
         p+9L1ziS5tMxV/UDnCnM5ovcVEeLHQwylikPsPUBD5mdM2h1oBbFPLPYGFRsrwRpvWkR
         stY4zb5N8B0AvtPbUxqnKEpXd45HoOcVo1ibEpbBJhlAaVg98kmR3sdEbsYCVTmio0pv
         1RfBeDbLZB5ZNgBdmBccVjQbpZLTJIvUjev+8lugg1G+89eS/zG3CBKUrN7/LUgxvL92
         34OxZpjvJLVy7pum0QZgh42jdYTL5HiPw59n57Pte4dbz8BIY+23WYtrinZTvK4USzfl
         OWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567862; x=1769172662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=u4dGZFlfFNF95iwtA59WjJ0Z5lj9OmqvL3OYsewarpZmD5biGWQy9CFuMNyS/Kv6MV
         B52BWTvgTS69zZyYqvwLCEJ9OKC2JyfQTP2q9cERCeiEMp1Je9sZtONeawBIC19GOqBM
         Ccjc9nw7Gb5qEbpS1Xdd39meajLTKKv+vpUQJzp85MWIj2rRy2suIBrlhUfeFCPBBpJM
         7jNSRBmth/DYKpz0xktCcjNISRczUw9cD+Z1tLgkyDtSNmYN63tXIJi541cggBTAdTZe
         E1+pJ7MijZAvEo+8+dzQVIJapVelydr2qkTnIMDsudohSEVgWRFVybn7Qp4ZAnhr4Wiv
         GbxA==
X-Forwarded-Encrypted: i=1; AJvYcCW0o3PPbGxjWw0tb9mZMv06GMTd/zFZ2/KxThvDAlO1Ed/cc2qhqNIHn/IM7/C1zLQmPeIWXJEIC9Aw@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ1dqoix0g5YJPEUaybaq+1Z6iSGKa0SvQfMmyxt/zHqUivy5X
	6uX3SidFncBNBDhJdu4EPBjd2hOnzIUeyUTEgaKaPr1q2G+oXhG8g3Dd
X-Gm-Gg: AY/fxX58RwZibyvGVSUb6l50Jb4RmksjrWphuW+gCcip+0NFkVk49LrGEymB/ruB9kV
	LPcuCyVlRxOya1JnZS4Wdf/7B8Y9SdGVWbyoaSFK9uVauFQAy1jJDTF20NQg4SVMvcQldfuyxdK
	nt4Rb525ZPcUHv1aioRST6SLMKNpRRjAnDT3Qg5MwBse5lGIZVLmqM4nuuKDm/UmXHFrDBgRRSv
	MKSlf0EiVXgvWZeLoz5ShOq0ZcmVKjH5n3NkROWxl2cCe5jHgLmAQwRpEkS74M+9xniUoAjsWXD
	H1CPvXvHMNQ5VDna8SpZLA2sTgrakRDflSK1Q0xV00LpXcDTEGVeWx5ydwOJdikTyOcn4WpL1Hi
	c93MT4nq4oIRP8hOgWcXyX7vDxnUgMP+g2hjGdVwy6AUHX+uFSWMC/py6HX+ka/pl3re7Zv3rcx
	PJM0oiiXrY56nMjSTqcr9i2Q4GVD/dHk5OkH82lFVIizBiYefKwGbDi9clzNEXfDT/b0pQO/C/h
	w==
X-Received: by 2002:a05:6000:2004:b0:433:2f55:7cab with SMTP id ffacd0b85a97d-43569bbafd6mr3570766f8f.37.1768567861918;
        Fri, 16 Jan 2026 04:51:01 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb0bsm5012584f8f.34.2026.01.16.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:51:00 -0800 (PST)
Date: Fri, 16 Jan 2026 13:50:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
Message-ID: <aWo0LESc5bIs1kHi@orome>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhhiv6s43avuu3l7"
Content-Disposition: inline
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>


--bhhiv6s43avuu3l7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
MIME-Version: 1.0

On Wed, Jan 14, 2026 at 04:30:09PM +0100, Krzysztof Kozlowski wrote:
> Make the padctl functions a bit simpler by returning void instead of
> always '0'.  The callers - phy init/exit - still need to return 0, but
> these are smaller function without if/branching.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bhhiv6s43avuu3l7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqNDIACgkQ3SOs138+
s6HKVA//WbWB3AVvEbOYpT8fr129RiWvQ5lRtQceA8fb/1Ep4k0qX0M5cVujq72g
OFie2IcJyCzuci1ZmKEf7fTaR/cjlzExIrXvmox2TLmtKm5kBAFTu2UcHzvAbRcs
VbasfUeQ/Wi7dlT6+I6JeNLYaXbstuH2RQV3NQ2BC3zPUsJk27p7DARdqBLUSNTJ
7jX2sBu0xKu5n0hrBhesTMi/zBLMI3pZvqmMlhGzTU01GSlmPz72GMI5J6YmeeF0
Midhy4ZCbs40l7nJPghjxdtQoKLhUPG6z+NzTyp9Hfelr7q/cYZ1avlAGkJ/39fI
ugJEOfjl0ed/HMarlvwrRPSTjF6f2BUKH1Ub2xGxErbhGaGvOsKGJizbjsK0CGzl
jdVsdFUF/wmzPeX27RIel8DxTdTYnhpUyZoylg7l9thjdhYGceKGJHeHb1DaOOZ+
OhsSUZlejccTbalvk7OeBxtnujGfE56nEXsSByA0C6kaDRxPZmsH9WWtp4mwIzXg
rvw2hOERLedWoFTjFynl0+3hazgw2hh21iH/uE+uOEiVwHNhPiEXeb+lJMGQbH/9
Bm2mL/1gvDYA3KxeFZbTTyNwEiGkZyPFLvwZ4hpapk8AvhFdEu/60sMZWsTRlSgx
H7CJIWp6MSs4e2ErCXbhjjucu3eJo1lFTm/bGVBosixPjjSZ720=
=VB+5
-----END PGP SIGNATURE-----

--bhhiv6s43avuu3l7--

